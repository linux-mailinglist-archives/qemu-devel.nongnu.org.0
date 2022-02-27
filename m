Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 133C24C5E4E
	for <lists+qemu-devel@lfdr.de>; Sun, 27 Feb 2022 19:53:43 +0100 (CET)
Received: from localhost ([::1]:56562 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOOfu-0001Pv-68
	for lists+qemu-devel@lfdr.de; Sun, 27 Feb 2022 13:53:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38202)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nOObX-0006mP-0u; Sun, 27 Feb 2022 13:49:11 -0500
Received: from [2607:f8b0:4864:20::42f] (port=37837
 helo=mail-pf1-x42f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nOObU-0001O4-8H; Sun, 27 Feb 2022 13:49:10 -0500
Received: by mail-pf1-x42f.google.com with SMTP id t5so56490pfg.4;
 Sun, 27 Feb 2022 10:49:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=jYXhyWM0shnA7Wjj+qkIfo23VyLboSH5PH0Du6KNrOo=;
 b=Qx3Zh4l3GlZzlQp/rjLjjhR4gBYIn+zu0RWfaUVIQL8RyRdfIkpFPbuO3DyOL/ApD5
 XmmiFNJZYIIlXxCTTtn3XxU5w19jYQpbiZbp7jYjXqQBWwlS1K8gWTnOmEEMQcfZYtg0
 7jL5aSttj+PvYSdyElxVDjuU3KmlR1uS3X4x44sHH6jtzAmWJWToBcxk7Rpb0/OdJq40
 I26YCzz/eXuF0wRQCdrJVveYbJzPF22ofDpxWS5A7tFi8eSKS2KFiWjxVvFPM0roBtBz
 9pHazS8aEyuI1EQ3bgt/KwEUhPqcwuNL3uvt0eQh+OPp6LQVfkmw0M4J52/NouvMU0k2
 ISXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=jYXhyWM0shnA7Wjj+qkIfo23VyLboSH5PH0Du6KNrOo=;
 b=borCeGKy3XzrRy34T0WVkXkS6WcQWb+0EPpmbkwEamNy9ueR5EgBYu6coOLjbWIA6s
 CFGgh8F7Ik5UZcKVj2vdZh82w47iVec3nVkmo0IfjLfuYfZ9BYzNJEUiEYS9YD9QJjNK
 0sa01m0qiXQbAU/Rcuv6TvZUbiYzlmQmT5erg1sKiwE43pe4F+45xz+X+QwNu16xMAOE
 PoTP7XE11t7tkwHdhtKBnVioi3dkv+QhLRm2ASQBVMOEduvtGcsebT0ZQXc4pI4BpjIW
 Nm/7hcbGbeUjhTBt1CW1qazpZfZnVH5z7HJtuZKDv0fTqqGxKtlU/NWwuH6n+DmwoNmN
 vBPg==
X-Gm-Message-State: AOAM530p2T/N/Cq1DfpL2ukqEYrwaorxT5rVNVwCoyu14XrCyOQRnN0O
 BXzn58yCtQdkLich0U36NuQ=
X-Google-Smtp-Source: ABdhPJyi3EjpODP/s0PJqWJBzQX+ZI1bWUXIfr6wLzhDedh2CezUajj5IJPXu5+kvLksdYlyFnVeTw==
X-Received: by 2002:a63:d74f:0:b0:374:5bda:909d with SMTP id
 w15-20020a63d74f000000b003745bda909dmr14142244pgi.215.1645987745965; 
 Sun, 27 Feb 2022 10:49:05 -0800 (PST)
Received: from [192.168.1.115] (32.red-88-28-25.dynamicip.rima-tde.net.
 [88.28.25.32]) by smtp.gmail.com with ESMTPSA id
 pj12-20020a17090b4f4c00b001bc97c5b255sm8303283pjb.44.2022.02.27.10.48.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 27 Feb 2022 10:49:05 -0800 (PST)
Message-ID: <9e7b9bf5-abe9-0203-29e1-4c618a345a1e@gmail.com>
Date: Sun, 27 Feb 2022 19:48:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [PATCH 3/9] Avocado migration test: adapt to "utils.network" API
 namespace change
Content-Language: en-US
To: Cleber Rosa <crosa@redhat.com>, qemu-devel@nongnu.org,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20220225210156.2032055-1-crosa@redhat.com>
 <20220225210156.2032055-4-crosa@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220225210156.2032055-4-crosa@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pf1-x42f.google.com
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
> Since Avocado 94.0[1], the "avocado.utils.network" dropped a lot of
> previously deprecated API names, having the new names into a finer
> grained structure.
> 
> This simply uses the new API names for the network port utility
> module.
> 
> [1] - https://avocado-framework.readthedocs.io/en/latest/releases/94_0.html#utility-apis
> 
> Signed-off-by: Cleber Rosa <crosa@redhat.com>
> ---
>   tests/avocado/avocado_qemu/__init__.py | 5 +++--
>   tests/avocado/migration.py             | 4 ++--
>   2 files changed, 5 insertions(+), 4 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

