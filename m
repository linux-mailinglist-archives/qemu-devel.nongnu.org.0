Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CDA0393525
	for <lists+qemu-devel@lfdr.de>; Thu, 27 May 2021 19:50:06 +0200 (CEST)
Received: from localhost ([::1]:50546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lmK8z-0002lC-5L
	for lists+qemu-devel@lfdr.de; Thu, 27 May 2021 13:50:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59024)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lmK8B-00022e-KL
 for qemu-devel@nongnu.org; Thu, 27 May 2021 13:49:16 -0400
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c]:34570)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lmK88-0006Ld-VC
 for qemu-devel@nongnu.org; Thu, 27 May 2021 13:49:15 -0400
Received: by mail-pg1-x52c.google.com with SMTP id l70so511291pga.1
 for <qemu-devel@nongnu.org>; Thu, 27 May 2021 10:49:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=vtWwV6+KzdKYMXpgTLNhUxkwjgM4dgGgXiqt59TkqrQ=;
 b=cLcm7XbCW5UTc0b7nJer8zikLJRS/t7YvAD48p1mt7CvNLmDE7kyqmEquAd8WPozg1
 Ib1b8aesNL+TStBtRTAXjBKAXA/m6vmYHxgpPG180zsD4cYWV+7DnguiW+uKR9OPxisM
 hLEj5NAH/k+OqL9nR+3CJzyjPz0YoyXqA4JCCiniVoWgp2I8n9+yVvbfdnrWbSf+ZMUF
 DD/Fm7Jo/AlaEuEqyhKxD++Lke4NPd9Pk458exWAacxcAo39yu+EFto72ieEafKSSsOX
 04iySM2J4tESkQlo0/Kp+c2HAlOSbBCh1lqVOCt3lj8S2GLPLcuKAB5lpujjV9Uwz9Kl
 MDhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=vtWwV6+KzdKYMXpgTLNhUxkwjgM4dgGgXiqt59TkqrQ=;
 b=LDfWfkdNYu5/2uyJEI7xNh/maey4LWEBSdHXeg52TCQA/cC89WuTKCnzHSE6rEif2i
 MiKUUSKfizWedfNvezDL4cDlibsPAaRcC1vmberYItxh+8Oznyj81iD53zLnyy67Jnzi
 9aXcuC2KMXYnp/c/lkbszkX7LsnSnuCLBFzvfJ+EzwmopvnsGKxaORFComsNZpsFsSBo
 4pwy8DDT5CqdywZsWRKXQ0iWTkaBfidU5IL477DmXeakCRn20LwbcN2FeLKw01oj27QK
 klqxWb+cBvILI2tQM3QrlE1H57gU6xzbA4QyUpUUQnjmj0mLIj2PKcJiFomtThDfOm82
 +GyA==
X-Gm-Message-State: AOAM530Uw+tfH2mg5tg0JVN9Ndf+nDD3Qd5AjIDBt6SWGVHunIMgqQX6
 HaCmVTwPQ190n92wv1OwhZ96Sw==
X-Google-Smtp-Source: ABdhPJx/DDCeN4bERMnRe+jQ1jVAzkSGyRgbERMk9+wBg4wi/u8xeawg/NcXvIiHbrfLfGn28UXKhA==
X-Received: by 2002:a63:5664:: with SMTP id g36mr4708061pgm.357.1622137751318; 
 Thu, 27 May 2021 10:49:11 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 a8sm2458890pfk.11.2021.05.27.10.49.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 May 2021 10:49:11 -0700 (PDT)
Subject: Re: [PATCH v1 6/6] tests/acceptance: tag various arm tests as TCG only
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20210527160319.19834-1-alex.bennee@linaro.org>
 <20210527160319.19834-7-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <05b0ba11-c9a8-476c-144b-5e51382d775f@linaro.org>
Date: Thu, 27 May 2021 10:49:09 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210527160319.19834-7-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, stefanha@redhat.com,
 crosa@redhat.com, pbonzini@redhat.com,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/27/21 9:03 AM, Alex Bennée wrote:
> We should never be trying to run most of these models under a KVM
> environment.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   tests/acceptance/boot_linux_console.py | 18 ++++++++++++++++++
>   1 file changed, 18 insertions(+)
> 
> diff --git a/tests/acceptance/boot_linux_console.py b/tests/acceptance/boot_linux_console.py
> index 276a53f146..cded547d1d 100644
> --- a/tests/acceptance/boot_linux_console.py
> +++ b/tests/acceptance/boot_linux_console.py
> @@ -333,6 +333,7 @@ def test_aarch64_virt(self):
>           """
>           :avocado: tags=arch:aarch64
>           :avocado: tags=machine:virt
> +        :avocado: tags=accel:tcg
>           """
>           kernel_url = ('https://archives.fedoraproject.org/pub/archive/fedora'
>                         '/linux/releases/29/Everything/aarch64/os/images/pxeboot'

This one should work with kvm if we change the -cpu line, yes?
Do we have any other boot_linux_console testing for kvm otherwise?

> @@ -379,6 +384,7 @@ def test_arm_virt(self):
>           """
>           :avocado: tags=arch:arm
>           :avocado: tags=machine:virt
> +        :avocado: tags=accel:tcg
>           """
>           kernel_url = ('https://archives.fedoraproject.org/pub/archive/fedora'
>                         '/linux/releases/29/Everything/armhfp/os/images/pxeboot'

Ack, because for kvm we'd have to know if the host supports 32-bit mode at all. 
  So, no for the thunderx2 that aarch64.ci.qemu.org has, but yes for the 
cortex-a57 in my mustang.

It'd be nice to be able to detect this somehow...

Ack to all the rest as obvious arm embedded/pi stuff.


r~

