Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 264806589EB
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Dec 2022 08:30:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pAnLH-000626-Ju; Thu, 29 Dec 2022 02:28:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pAnLF-00061x-Kd
 for qemu-devel@nongnu.org; Thu, 29 Dec 2022 02:28:41 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pAnLE-00064V-4L
 for qemu-devel@nongnu.org; Thu, 29 Dec 2022 02:28:41 -0500
Received: by mail-wm1-x32f.google.com with SMTP id
 fm16-20020a05600c0c1000b003d96fb976efso10545785wmb.3
 for <qemu-devel@nongnu.org>; Wed, 28 Dec 2022 23:28:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=f1QWVMM2NX3o6WxH6qM4OQUF7sevgU9Z4xZ9jOr8SKc=;
 b=rCyyThj5t9/NB71QfAxlzF377LGrE0+QQOfE5fSGGemPWnRoE+byXuzZlbqiT7AVlV
 ej4PDI5Q+xhQ2z0hiKf6Ih6UwSx4ZzFLPkn1/OhdmAPK9jFC+p5aH2Ds8YNXl0w2ang7
 077eUwgt70KNd6SpP4NEDp8tBQA6tMXodV4uTwaJpq4DgyHRBOpWcEscdiA+HrzxEfPJ
 88UgdSV/D0UCAS5k0gaC4maNhsofXQeM3Avy8abl+ZVdhkEzSunlrRy6T0ZgdwTmzN3f
 3N1H7TQMsFanYLf0s/rfZE5YFA+P940pbjNKPeyX7eapV3W108CaNIuCvbV5p315sv8B
 a1dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=f1QWVMM2NX3o6WxH6qM4OQUF7sevgU9Z4xZ9jOr8SKc=;
 b=RNX3GMrbEb6073xwBpmkO4+R2JhqvGDwzhYHZdi/AxML8vIQBQpGTPYPy9s0elaaFg
 3k+h0hICHCPJwONhWUvpicBE83TBn+z/z1pxcE6Kp5NE5J7VQehNumNP5S14zS/gNur2
 XHz4xm930lG3GD3I9U9OfDeYZug6eAy1CN4sO5bqY40Wj80iBPksD1sje5etmGWCL+82
 laOQQjuAgN7FHeO5jPQ0rEN/XvjQMiXg6Gygk//FjidNj5+bjvkzBgxayDimLpClfoe0
 zgRxqx1KJDPIr66L5KUHp+SqI4NTFLuOuyDiEwVoZyQ++aFTmCIJtU3YPeQcXZS/yg8Q
 W5dg==
X-Gm-Message-State: AFqh2krCutLJKKgWLvCqVJ/qE6neTJz4cfgXqDUPcvQKn6qu3W8nktBF
 EP+adrLfIYahRScSmbCdTwshEg==
X-Google-Smtp-Source: AMrXdXvYAR+zU5UWW0ZaRRqxesy5v+Um12IM1fAq7O+wwcAgHk7O2zG9qBU80aC7QVkmAjx5ktqMRg==
X-Received: by 2002:a05:600c:18a3:b0:3d1:fcac:3c95 with SMTP id
 x35-20020a05600c18a300b003d1fcac3c95mr19538355wmp.34.1672298918407; 
 Wed, 28 Dec 2022 23:28:38 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 l42-20020a05600c1d2a00b003cfbbd54178sm43302271wms.2.2022.12.28.23.28.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Dec 2022 23:28:37 -0800 (PST)
Message-ID: <0c7ea5cd-1623-ddec-91e5-9d576b079349@linaro.org>
Date: Thu, 29 Dec 2022 08:28:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH qemu] x86: don't let decompressed kernel image clobber
 setup_data
To: "Jason A. Donenfeld" <Jason@zx2c4.com>, "H. Peter Anvin" <hpa@zytor.com>
Cc: pbonzini@redhat.com, ebiggers@kernel.org, x86@kernel.org,
 linux-kernel@vger.kernel.org, qemu-devel@nongnu.org, ardb@kernel.org,
 kraxel@redhat.com, bp@alien8.de
References: <20221228143831.396245-1-Jason@zx2c4.com>
 <6cab26b5-06ae-468d-ac79-ecdecb86ef07@linaro.org>
 <Y6xvJheSYC83voCZ@zx2c4.com> <Y6x1knb8udpSyMSp@zx2c4.com>
 <9188EEE9-2759-4389-B39E-0FEBBA3FA57D@zytor.com> <Y6z765zHrQ6Rl/0o@zx2c4.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <Y6z765zHrQ6Rl/0o@zx2c4.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.147,
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

On 29/12/22 03:31, Jason A. Donenfeld wrote:
> Hi,
> 
> Read this message in a fixed width text editor with a lot of columns.
> 
> On Wed, Dec 28, 2022 at 03:58:12PM -0800, H. Peter Anvin wrote:
>> Glad you asked.
>>
>> So the kernel load addresses are parameterized in the kernel image
>> setup header. One of the things that are so parameterized are the size
>> and possible realignment of the kernel image in memory.
>>
>> I'm very confused where you are getting the 64 MB number from. There
>> should not be any such limitation.

[...]

Thanks for the diagrams. Feel free to include them in the commit
description ;)

>> In general, setup_data should be able to go anywhere the initrd can
>> go, and so is subject to the same address cap (896 MB for old kernels,
>> 4 GB on newer ones; this address too is enumerated in the header.)
> 
> It would be theoretically possible to attach it to the initrd image
> instead of to the kernel image. As a last resort, I guess I can look
> into doing that. However, that's going to require some serious rework
> and plumbing of a lot of different components. So if I can make it work
> as is, that'd be ideal. However, I need to figure out this weird 62 meg
> limitation.
> 
> Any ideas on that?

Could it be a limitation (internal buffer) of the decompressor?

