Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 219A94443F2
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 15:55:09 +0100 (CET)
Received: from localhost ([::1]:48368 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miHfQ-0004Kb-4P
	for lists+qemu-devel@lfdr.de; Wed, 03 Nov 2021 10:55:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46358)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1miHdM-0001Zf-Ju
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 10:53:00 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:33302)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1miHdL-0004XK-85
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 10:53:00 -0400
Received: by mail-wr1-x42a.google.com with SMTP id d24so4067147wra.0
 for <qemu-devel@nongnu.org>; Wed, 03 Nov 2021 07:52:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=/4YoROrwYk3zNLoDyuQZTrK6sfOleK5P0ChWd8f0x/s=;
 b=pON6R3CP1wpUeq+VzEzxlLRD7RzTv9mimQEuqMFsiumcYhFUfktJKgHxBtnlnJa+zG
 3+8bpj01szNjvRedXeujBlmE/zsKmGbHF58Jl9f9I/P3hFjsFQF1LA+McC4mzUQW6Ik8
 Zk+zRFOdtuxqplQwD1SfyLWC4sajn7LpYbvemGpbdF5o0a0trK2xbrVVRfeTHg74Q+Db
 J/ParPbbrQrMdDTNBGxd4NPwsytb/44OYlNE21+XSLIFquLjeGomIB9k70UqmfCAA1+P
 owKLek1UZfUWm3BmlAlaFXaPCdGc2jJsL+Uci5O0pB9N9Ylu77n/ksA4w/7wuhRgUJOf
 MDJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=/4YoROrwYk3zNLoDyuQZTrK6sfOleK5P0ChWd8f0x/s=;
 b=erV4tWBKYt57RZ1RUbOGdPM/EcclEG4w+btW+9RIpzLGG/Y30vx5dt9bDn5mJcCTRa
 aAOdqe8KUG5kqJHYZXnWFJM0auX0+l6ZssBFFUYrPzetZ3Tsbgzw5rfCRzinT9H6DKkF
 CAiR/slnIoXoqyCyeNK2zFx+TtR+z4AA8dPu+Ld1u1Lej2Kw8vPsTXyOwZxKW53c3Pfn
 TNgYP3028/M+RLMEafB+72p6HASuSHF9qlk9NMzC7o3XlNucnL7/Y5OFbVdy6cKEiPUt
 TBwthc1r+Kd+TYvqxkApiD8ZmLkAjL5SD2Y0oMplaOq5JFvc3jnjTeJgFDEkFhaw5e1o
 4rOQ==
X-Gm-Message-State: AOAM532BxrL9amkBAMqlqzl9KO6ku+DRPdj2HKMWSbf7tMc3+fjEFFmt
 MAk1eN9jAVz7AwaZ5GcOxYEO2AyDle8=
X-Google-Smtp-Source: ABdhPJwrpm0RiYeGiS7iuV2dcF6Mby5K22Po45yZyIJG76qEb9+P4CXhn9q990oTqHa6C8hc6FEcMw==
X-Received: by 2002:a5d:4c86:: with SMTP id z6mr25692922wrs.219.1635951177743; 
 Wed, 03 Nov 2021 07:52:57 -0700 (PDT)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id o1sm2271037wrn.63.2021.11.03.07.52.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Nov 2021 07:52:57 -0700 (PDT)
Message-ID: <40d2a8fc-8b0d-87fd-8e12-67ae7ee8dcec@amsat.org>
Date: Wed, 3 Nov 2021 15:52:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 4/6] docker: update Fedora-based cross-compiler containers
 to Fedora 34
Content-Language: en-US
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
References: <20211103144844.1285634-1-jsnow@redhat.com>
 <20211103144844.1285634-5-jsnow@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20211103144844.1285634-5-jsnow@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-3.528,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, Daniel Berrange <berrange@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/3/21 15:48, John Snow wrote:
> Similarly to the last patch, Fedora 33 will be EOL by the time QEMU 6.2

s/last/previous/ or squash?

> releases, so bump the version for all of the other Fedora containers,
> too.
> 
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  tests/docker/dockerfiles/fedora-cris-cross.docker  | 2 +-
>  tests/docker/dockerfiles/fedora-win32-cross.docker | 2 +-
>  tests/docker/dockerfiles/fedora-win64-cross.docker | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

