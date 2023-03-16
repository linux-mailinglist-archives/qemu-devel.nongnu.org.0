Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 498946BC75E
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Mar 2023 08:38:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pciAa-0001A1-5L; Thu, 16 Mar 2023 03:37:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pciAW-00019i-Rr
 for qemu-devel@nongnu.org; Thu, 16 Mar 2023 03:37:00 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pciAV-0006F9-0F
 for qemu-devel@nongnu.org; Thu, 16 Mar 2023 03:37:00 -0400
Received: by mail-wr1-x42f.google.com with SMTP id v16so639904wrn.0
 for <qemu-devel@nongnu.org>; Thu, 16 Mar 2023 00:36:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678952217;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=pj0KDpafWBUSgQKAZOVlpfzwcbyzyD/5dpGijR0a7pk=;
 b=x/FDmMa1R1SoSWX2BkjYsIEp2A15IVSU57SuR58uZu883mOOaT8NVEsu7FGXyU/Ekd
 0Tm18lC0lImpP0Bde7KF8BjZ3n2mqxMXiK1XbhbDKIg+TuTJfii0t5WIxebV1JML2Rv3
 B9QZG+k0ERg7WnSQJDfxAtNB/2/6JhuJgHcumdtdeahd9uOOF7ZidhJb07gMetWOinAt
 S49/kUgqiB2hcFgawPFr2FRj3tYQkgeXnq4vPfGVjrwwdr3CKaP0KAPhYAqiF47lzPX0
 +B4a27p/nzSBCLdjR7tercDyU0f9+RK/BHJceHGuV1iyj4E4J5FX9fFut1YtYd+G+GL4
 1+qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678952217;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pj0KDpafWBUSgQKAZOVlpfzwcbyzyD/5dpGijR0a7pk=;
 b=vtkH4PD04NlMIUNhlQ6Xu8qMtAbNPbvxQGNHXfeBdxhhLUuK59fzhFfCVisFGil8Fi
 MCfpDvM8zajOaPedX6oy3Nfm9noeRuwYgZ8Ht0/W5YNAzj2ynW5+qsXf/7GjmDA9YrkL
 futWATz4KHZk8p3ogIYuTTagzP4+9dXS2i0EGoJ1wQB978qFbbQssgtMfzdISwQDvbr7
 UHWhBDZBJ5PpYbzK8zdtS1+bHBPJgNEpzPCGS2FKnMc2isM6PjL4bRLqCpx4zrV/n9iK
 BdPUTEiRJ3l7FEGxGMMDjwDxlv1TdDbNKEw7gCH4jRJTgGgnDK9/9AEBI0A4/KTTYHJo
 GmHg==
X-Gm-Message-State: AO0yUKWq5X5mWbrhGAatKR66JMHaMaKjm6cde/166MjbmbAqPA95j1uW
 AHgLViKFTLJnHT28ytUQDJrrNw==
X-Google-Smtp-Source: AK7set936dl4eOzWZ1DBLAGnmnzf8ZzTEgcRENH2c58OyZorjmywoGun2KwfKEb4jiGxKs1QJ9UviA==
X-Received: by 2002:adf:dbc7:0:b0:2cf:f2f9:df7a with SMTP id
 e7-20020adfdbc7000000b002cff2f9df7amr3948542wrj.38.1678952217165; 
 Thu, 16 Mar 2023 00:36:57 -0700 (PDT)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 q22-20020a056000137600b002c71d206329sm6465646wrz.55.2023.03.16.00.36.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Mar 2023 00:36:56 -0700 (PDT)
Message-ID: <c33b0e07-5c46-6ebe-fe4c-5308ce508a70@linaro.org>
Date: Thu, 16 Mar 2023 08:36:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: dropping 32-bit host support
Content-Language: en-US
To: Andrew Randrianasulu <randrianasulu@gmail.com>
Cc: qemu-discuss@nongnu.org, QEMU Developers <qemu-devel@nongnu.org>,
 Thomas Huth <thuth@redhat.com>
References: <CA+rFky6A9Q_5sJ4WDO-Z2HBT59qiNgr8A-xk+O7-gnAMZmHt2A@mail.gmail.com>
 <f06fddef-1e40-1858-2715-50a0518a97f6@linaro.org>
 <CA+rFky5=kc0Pwf3RRhuKrBqtRVkmtm=NDKhrVgJV2_Ame2nUOQ@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <CA+rFky5=kc0Pwf3RRhuKrBqtRVkmtm=NDKhrVgJV2_Ame2nUOQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 16/3/23 08:17, Andrew Randrianasulu wrote:
> 
> 
> чт, 16 мар. 2023 г., 10:05 Philippe Mathieu-Daudé <philmd@linaro.org 
> <mailto:philmd@linaro.org>>:
> 
>     Hi Andrew,
> 
>     On 16/3/23 01:57, Andrew Randrianasulu wrote:
>      > Looking at https://wiki.qemu.org/ChangeLog/8.0
>     <https://wiki.qemu.org/ChangeLog/8.0>
>      > <https://wiki.qemu.org/ChangeLog/8.0
>     <https://wiki.qemu.org/ChangeLog/8.0>>
>      >
>      > ===
>      > System emulation on 32-bit x86 and ARM hosts has been deprecated.
>     The
>      > QEMU project no longer considers 32-bit x86 and ARM support for
>     system
>      > emulation to be an effective use of its limited resources, and thus
>      > intends to discontinue.
>      >
>      >   ==
>      >
>      > well, I guess arguing from memory-consuption point on 32 bit x86
>     hosts
>      > (like my machine where I run 32 bit userspace on 64 bit kernel)
>     is not
> 
>     If you use a 64-bit kernel, then your host is 64-bit :)
> 
> 
> 
> No, I mean *kernel* is 64 bit yet userspace (glibc, X , ...) all 32bit. 
> So, qemu naturally will be 32-bit binary on my system.

This configuration is still supported!

Thomas, should we clarify yet again? Maybe adding examples?

>     host: hardware where you run QEMU
>     guest: what is run within QEMU
> 
>     Running 32-bit *guest* on your 64-bit *host* is still supported.
> 
>     We don't plan to support running 32-bit WinXP x86 (guest) on 32-bit
>     Raspberry Pi 2 (host) for example.
> 
>      > going anywhere, but what about 32bit userspace on Android tablets,
>      > either via Limbo emulator or qemu itself in Termux?
> 
>     *System* emulation [on 32-bit hosts] is deprecated. User emulation
>     (such linux-user) is not. For example, you can still run 64-bit x86_64
>     Linux binaries on a 32-bit ARM Raspberry Pi.
> 
> 
> 
> Well, unrooted Android does not allow you to just load some perfectly 
> fine kernel module, so user-space emulation can't do all things 
> system-level one can. I also ran qemu-system-ppc on Huawei Matepad T8 
> (32 bit Android, too) for emulating old mac os 9. Yes, I can wait 10 min 
> per guest boot. Fedora 36 armhf boots even slower on emulation!

Huawei MatePad T8 is based on a MediaTek MT8768 CPU which contains
ARM Cortex-A53 cores. These cores implements the ARMv8-A 64-bit ISA,
so theoretically it is able to run a 64-bit Android.

>      > At least I hope it will be not *actively* (intentionally) broken,
>     just
>      > ...unsupported (so users who know how to run git revert still
>     will get
>      > their build for some more time).
> 
>     Unsupported code almost always unintentionally end bit-rotting...
> 
> 
> 
> Well, sometimes simple patch restores functionality. I patched for 
> example olive-editor to run on 32 bit, and before this intel embree 
> (raytracing kernels for Lux renderer). So, _sometimes_ it really not 
> that costly. While if this CI thing really runs per-commit and thrown 
> away each result ... may be letting interested users to build things on 
> their own machines (and share patches, if they develop them, publicly)  
> actually good idea.
> 
> 
> 
>     I hope this is clearer.
> 
>     Regards,
> 
>     Phil.
> 


