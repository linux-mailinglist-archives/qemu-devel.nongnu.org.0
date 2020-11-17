Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 152AE2B6BA0
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Nov 2020 18:24:29 +0100 (CET)
Received: from localhost ([::1]:34478 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kf4iS-0003Df-69
	for lists+qemu-devel@lfdr.de; Tue, 17 Nov 2020 12:24:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49490)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kf4be-0004Qg-UG
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 12:17:26 -0500
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:46665)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kf4bd-0006u3-71
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 12:17:26 -0500
Received: by mail-wr1-x442.google.com with SMTP id d12so23927840wrr.13
 for <qemu-devel@nongnu.org>; Tue, 17 Nov 2020 09:17:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=R3hkeBTrMG2RevdVkYwGzpMpqR561oprnUAQuYRFR1E=;
 b=CJlfR0a+xtJ9TeQkDOhGtJTDTNKNq4SvuQk2ScDUJZUXs0WHKjnvtwr3hEjpSTYzBR
 QOlw0wpfMWthz7fWZpzpwAY/zZfpSJpX56g495f73YXv2dLj9o+OPU/RWB5rC2AEgdsP
 Cifb4gwgCzCb09ECiO4yAIlLLCrG4b+xnwAbpZrSPjGA9tfEnG6pU4RIfIpsCY0qwwq2
 2BaQz01smbNSrIWZ5P/7IswBzZO4av9zKLDSoPuoPc8clvRDyhYB2TemXhPTywASiVCm
 PIMgkM0Ps+Di+Q4Cuu1VJss3Xbgz3fJNjArnDLXn7Bb3pB3NqbMvxgD9e8kkvL6s/sh3
 Kvdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=R3hkeBTrMG2RevdVkYwGzpMpqR561oprnUAQuYRFR1E=;
 b=OEz0iQQMfQRkoLE0faajRcfIbIDIgBTxqdJ0I2dw3nDzpxMwrmiqU7XEOu4Fklwnxn
 ZHywVj2SPBpfvR9ns+vyTAYZ2budQ/U8Jsk19KOT1tdM8uZBc5t+ggNOOL52NzfKcNWM
 OjYXn8J7qdHERltprJrm9Mxz2ukbdzDpgwfGBiAyHBYTgby/F46yu9Ya8xzGXHcXTAqG
 xGwJ9A5hRr+EgYMVsGIJnioE8n0o2oOAtY2OYG+jBtmOSA3RcTknNyWvp/hi4MS8CJMa
 YSCWAItdykAMXQO8wXspdoYH5GmM/1l4FJSaaGU0s5AfUqreAs/3LimuFADMLrs2uW5h
 vj9Q==
X-Gm-Message-State: AOAM531z7c0v+V1bSn32E3+2fT5/pS++g9Nrrc6T88XpUdmMHMmBtiJ6
 yWAU2Rh4mhmBq868RtwR0Sw=
X-Google-Smtp-Source: ABdhPJyRy4rdtBPPo+hvaM/p8A6gwj4sTU+PruTsnu+eaV90UKOCe4WqvcJNNpoQxw5uNs5yjmESxw==
X-Received: by 2002:a5d:6743:: with SMTP id l3mr589842wrw.82.1605633443115;
 Tue, 17 Nov 2020 09:17:23 -0800 (PST)
Received: from [192.168.1.36] (234.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.234])
 by smtp.gmail.com with ESMTPSA id s4sm27792114wro.10.2020.11.17.09.17.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Nov 2020 09:17:22 -0800 (PST)
Subject: Re: [PATCH V13 2/9] meson.build: Re-enable KVM support for MIPS
To: Huacai Chen <zltjiangshi@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Thomas Huth <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>
References: <1602059975-10115-1-git-send-email-chenhc@lemote.com>
 <1602059975-10115-3-git-send-email-chenhc@lemote.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <0dfbe14a-9ddb-0069-9d86-62861c059d12@amsat.org>
Date: Tue, 17 Nov 2020 18:17:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <1602059975-10115-3-git-send-email-chenhc@lemote.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::442;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x442.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Huacai Chen <chenhuacai@gmail.com>, qemu-devel@nongnu.org,
 Huacai Chen <chenhc@lemote.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Huacai,

On 10/7/20 10:39 AM, Huacai Chen wrote:
> After converting from configure to meson, KVM support is lost for MIPS,
> so re-enable it in meson.build.
> 
> Fixes: fdb75aeff7c212e1afaaa3a43 ("configure: remove target configuration")
> Fixes: 8a19980e3fc42239aae054bc9 ("configure: move accelerator logic to meson")
> Cc: aolo Bonzini <pbonzini@redhat.com>
> Signed-off-by: Huacai Chen <chenhc@lemote.com>
> ---
>  meson.build | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/meson.build b/meson.build
> index 17c89c8..b407ff4 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -59,6 +59,8 @@ elif cpu == 's390x'
>    kvm_targets = ['s390x-softmmu']
>  elif cpu in ['ppc', 'ppc64']
>    kvm_targets = ['ppc-softmmu', 'ppc64-softmmu']
> +elif cpu in ['mips', 'mips64']
> +  kvm_targets = ['mips-softmmu', 'mipsel-softmmu', 'mips64-softmmu', 'mips64el-softmmu']

Are you sure both 32-bit hosts and targets are supported?

I don't have hardware to test. If you are not working with
32-bit hardware I'd remove them.

>  else
>    kvm_targets = []
>  endif
> 

