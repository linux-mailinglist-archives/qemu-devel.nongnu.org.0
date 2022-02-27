Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 04C354C5E50
	for <lists+qemu-devel@lfdr.de>; Sun, 27 Feb 2022 19:54:57 +0100 (CET)
Received: from localhost ([::1]:34434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOOh6-0005Tr-55
	for lists+qemu-devel@lfdr.de; Sun, 27 Feb 2022 13:54:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38280)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nOOc3-0007PF-4u; Sun, 27 Feb 2022 13:49:43 -0500
Received: from [2607:f8b0:4864:20::102c] (port=36469
 helo=mail-pj1-x102c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nOOc1-0003uC-6p; Sun, 27 Feb 2022 13:49:42 -0500
Received: by mail-pj1-x102c.google.com with SMTP id
 g7-20020a17090a708700b001bb78857ccdso12903431pjk.1; 
 Sun, 27 Feb 2022 10:49:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=54tej0WPztS1josBkKWB74KQL6RZ0g61PhZRQh9yWk8=;
 b=kC586PoJKxn3XdU8jOOzBcR34GU8EPB/p7f/LUP9KpLLapGdygup6Afw+Ui/8htULc
 jDoKkbuBddRAF6d0bA6fk2RgzLOh/Wo+NB8HSORJiSHuY1kgbLCW8OMovYilVnL62xFc
 eaBJuOkt9/AU+f5r+0gBswc/xIRPQJVOKsifzXPftHAYw0uLWnMVVA1Ljn/QattNhzco
 XTlpUvy4KNqBnQVmVX2XfBCGMl+n3oQBXTTfdyeua5iOatr9flT10NfA7U14au8P8mC0
 LEapkUwEzSmffXzjze41N/fdZfjBznADeOzGTdmBM8f4J0w6Zy2I8EsKNFz5tZQr0yJY
 JkZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=54tej0WPztS1josBkKWB74KQL6RZ0g61PhZRQh9yWk8=;
 b=0ZH4QRnUeBb1L+WGHon7TC5n7sIPXt7AFOCcgEAnDq+Dnirql7VPbgTc/pXrzG8KeV
 IUPu4o2YDgpfGAV3vMna5ZWiDsDIbStswyzJK53V/CLjfxhf8iGb+/ZvtRl6Sc1Lvp3v
 g8uYa0pzQFEupLibaHRcCxSN8rLdUvWyIhYxW8OQFew+DqnQykwsaAFtFRRdsNmp42kx
 trprpwDlLpZF95bm1gErfaZbp8dy5Rdc3pojMp6Z2HulTji1ogrQ9pBUCI/pZT9mvYYp
 qsGy0KPQ+T9Y4pEIsExBfono19Wl9NKHdVWWYZbBbjwM6vMMPRdVFzguzCQ0ymhbjGVr
 j2Zg==
X-Gm-Message-State: AOAM530HW60zZDg2qcVFQ8dABcHPh8nRnngBgvSiQXem1vxjXeFi2a5l
 G48ObHu78zwQnhYJYHv//GE=
X-Google-Smtp-Source: ABdhPJyE3uZTX3Ss6/oziXhnGRX26UgJfGcEh18aaN9UOUnMZGtEnqZYZuwBFmtdUbEBeloRFWEgRA==
X-Received: by 2002:a17:902:eaca:b0:151:4607:2ff3 with SMTP id
 p10-20020a170902eaca00b0015146072ff3mr8521152pld.54.1645987778940; 
 Sun, 27 Feb 2022 10:49:38 -0800 (PST)
Received: from [192.168.1.115] (32.red-88-28-25.dynamicip.rima-tde.net.
 [88.28.25.32]) by smtp.gmail.com with ESMTPSA id
 h7-20020a056a00170700b004e01663f59bsm11364362pfc.117.2022.02.27.10.49.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 27 Feb 2022 10:49:38 -0800 (PST)
Message-ID: <5c6970c8-65ee-2b82-968b-676e0042a988@gmail.com>
Date: Sun, 27 Feb 2022 19:49:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [PATCH 2/9] Avocado tests: use logging namespace that is
 preserved in test logs
Content-Language: en-US
To: Cleber Rosa <crosa@redhat.com>, qemu-devel@nongnu.org,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20220225210156.2032055-1-crosa@redhat.com>
 <20220225210156.2032055-3-crosa@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220225210156.2032055-3-crosa@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Huacai Chen <chenhuacai@kernel.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Eric Farman <farman@linux.ibm.com>,
 KONRAD Frederic <frederic.konrad@adacore.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Alexandre Iooss <erdnaxe@crans.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Antony Pavlov <antonynpavlov@gmail.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Thomas Huth <thuth@redhat.com>, Greg Kurz <groug@kaod.org>,
 Fabien Chouteau <chouteau@adacore.com>, Eric Auger <eric.auger@redhat.com>,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org, Michael Rolnik <mrolnik@gmail.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 David Gibson <david@gibson.dropbear.id.au>, Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Mahmoud Mandour <ma.mandourr@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 25/2/22 22:01, Cleber Rosa wrote:
> Since Avocado 92.0[1], there's no universal preservation of logged
> content via Python's "logging" APIs into the test log files.  This
> changes were motivated by the fact that doing so is intrusive as it
> touches on Python's root logger.
> 
> Test writers are now expected to use "avocado." as a namespace prefix
> for everything that Avocado should collect/preserve, and other
> prefixes for logged content that should be handled differently.
> 
> [1] - https://avocado-framework.readthedocs.io/en/94.0/releases/92_0.html#users-test-writers
> 
> Signed-off-by: Cleber Rosa <crosa@redhat.com>
> ---
>   tests/avocado/avocado_qemu/__init__.py    | 5 ++---
>   tests/avocado/linux_initrd.py             | 3 +--
>   tests/avocado/machine_arm_integratorcp.py | 3 +--
>   tests/avocado/machine_mips_malta.py       | 3 +--
>   tests/avocado/replay_kernel.py            | 5 ++---
>   tests/avocado/replay_linux.py             | 5 ++---
>   tests/avocado/reverse_debugging.py        | 5 ++---
>   tests/avocado/tesseract_utils.py          | 6 +++---
>   tests/avocado/virtio_check_params.py      | 3 +--
>   9 files changed, 15 insertions(+), 23 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

