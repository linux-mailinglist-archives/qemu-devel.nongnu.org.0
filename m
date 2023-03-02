Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EEE206A8B97
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 23:18:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXrEP-0004uy-AI; Thu, 02 Mar 2023 17:16:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pXrEN-0004uC-5n
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 17:16:55 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pXrEL-0006cY-5D
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 17:16:54 -0500
Received: by mail-wr1-x42a.google.com with SMTP id g3so557085wri.6
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 14:16:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677795411;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=j/QW1HM2Mk99OFnysxfaddjjhGUCTkKLCoCNHfnkBus=;
 b=ALhBjpW+9d/4nqIcn9T7comSyKRfOMYle0Ef7GQcmPgOMdutjgV9UKobixXu/69zHV
 Gna/Ej5gE7HUKBhbCvqj8/rzOOj3rbijoydiLuqrANb5aNRLMwdpFwlO6Ij0SEjLwLD2
 SuURyr8oCgi/BLZT/28QMLcv7vIq/RsDcJEHtcwC9g3SA4Sh23srhZ96u5XizNgGCXBf
 ZH3j7PM46/BS1tqUUOXxHHonLNrabmZBig13eMG/aln6neAwBf8pxBBx/y54Rue4bw03
 m/17PD9lLEL2rAwGbbb36CMxU3NG/S/W6it0v6UIN8EOIM9HtOZbnfqO+RvCmNpJkpgk
 4s4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677795411;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=j/QW1HM2Mk99OFnysxfaddjjhGUCTkKLCoCNHfnkBus=;
 b=FZvH2VA0je5hNTxKhjlM70IHBM7Ieqr1h10woVD3Plh1JYeGECX61WG9eCklr8j8qt
 O6HY1ysS7ftvjTZOXfFCQ72oqBsRPLTcK+fxdHGHffldQhlTumvdWCGOTPhtEXjsmEfY
 DvLAq0mRnnjSWNQR+hY5vtfGHvocSFeMsGjbakd1Vy2/Fmf4bS8sEEuudoRIcSmus5Rs
 GPrDW6zpydgZFp6ECNoMnq103xKOd+pVvpisKVDNMIwqaYzY1aHaQs4qGN8k+Xh/Y+SE
 p229rsmkT/dDihGoBWCQYRw6y/8cnBEeBZQGS1M4Q5vgS0mUvNS7BJXagF1fjDwx43ka
 8TWA==
X-Gm-Message-State: AO0yUKVFWe/MiRuJfeBASjYpMrERQ4jNjmEwUcdsN+BxWDLD0z5pdwsQ
 sj2W93o8JQnslfArGTHvYxJQ2g==
X-Google-Smtp-Source: AK7set8FAJoagkadDS0ky4D6I6VKl6CQte+kz2H8UpkpBkrwx3GyTQUjYMJKyj+fdM6XhAnFPLxhzw==
X-Received: by 2002:a05:6000:11c2:b0:2c7:1d55:a56b with SMTP id
 i2-20020a05600011c200b002c71d55a56bmr8281108wrx.70.1677795411324; 
 Thu, 02 Mar 2023 14:16:51 -0800 (PST)
Received: from [192.168.27.175] (43.red-95-127-39.staticip.rima-tde.net.
 [95.127.39.43]) by smtp.gmail.com with ESMTPSA id
 k21-20020a7bc415000000b003e206cc7237sm4096886wmi.24.2023.03.02.14.16.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Mar 2023 14:16:50 -0800 (PST)
Message-ID: <733a61bc-0e41-a864-c7fa-f177b35afa25@linaro.org>
Date: Thu, 2 Mar 2023 23:16:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v2 4/6] docs/about/deprecated: Deprecate the
 qemu-system-arm binary
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Daniel Berrange <berrange@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-arm@nongnu.org,
 Maxim Levitsky <mlevitsk@redhat.com>, libvir-list@redhat.com,
 Richard Henderson <richard.henderson@linaro.org>,
 xen-devel@lists.xenproject.org, Reinoud Zandijk <reinoud@netbsd.org>
References: <20230302163106.465559-1-thuth@redhat.com>
 <20230302163106.465559-5-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230302163106.465559-5-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.092,
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

On 2/3/23 17:31, Thomas Huth wrote:
> qemu-system-aarch64 is a proper superset of qemu-system-arm,
> and the latter was mainly still required for 32-bit KVM support.
> But this 32-bit KVM arm support has been dropped in the Linux
> kernel a couple of years ago already, so we don't really need
> qemu-system-arm anymore, thus deprecated it now.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   docs/about/deprecated.rst | 10 ++++++++++
>   1 file changed, 10 insertions(+)
> 
> diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
> index a30aa8dfdf..21ce70b5c9 100644
> --- a/docs/about/deprecated.rst
> +++ b/docs/about/deprecated.rst
> @@ -45,6 +45,16 @@ run 32-bit guests by selecting a 32-bit CPU model, including KVM support
>   on x86_64 hosts. Thus users are recommended to reconfigure their systems
>   to use the ``qemu-system-x86_64`` binary instead.
>   
> +``qemu-system-arm`` binary (since 8.0)
> +''''''''''''''''''''''''''''''''''''''
> +
> +``qemu-system-aarch64`` is a proper superset of ``qemu-system-arm``. The
> +latter was mainly a requirement for running KVM on 32-bit arm hosts, but
> +this 32-bit KVM support has been removed some years ago already (see:

s/some/few/?

> +https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=541ad0150ca4
> +). Thus the QEMU project will drop the ``qemu-system-arm`` binary in a
> +future release. Use ``qemu-system-aarch64`` instead.

If we unify, wouldn't it be simpler to name the single qemu-system
binary emulating various ARM architectures as 'qemu-system-arm'?

