Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48F6E32DF18
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 02:30:31 +0100 (CET)
Received: from localhost ([::1]:60778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHzIU-0008GZ-2R
	for lists+qemu-devel@lfdr.de; Thu, 04 Mar 2021 20:30:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lHzGR-0007hp-W2
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 20:28:24 -0500
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:54810)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lHzGN-0002OG-4z
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 20:28:23 -0500
Received: by mail-pj1-x1036.google.com with SMTP id i14so833610pjz.4
 for <qemu-devel@nongnu.org>; Thu, 04 Mar 2021 17:28:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=oS1q/xRHxmjpWz0g8w+cth4Wgn4vgSIMG/wYS75TcaA=;
 b=cNIS/P92pHsK1D8ty/ddn9UAiH3Dx6Tg38SsUAQ6pugGGXfVEBlOhKzZG6vsWPWFsF
 44BTzSUwxk/9XI+iI+/0ou6X0YU4etpZ5En/AeJLkgyoHmHqQD/Q2itsmqdzCXbNWepd
 QnUdHi56RGB6/GfwZooQUdiT9Ymu22wkcV1BJ2R22VkNFquKg+yM5ryYUal6QplCJcud
 lhtslhNFj+xR0gms3X6Q94hTE7gqOCYdCderSnv1CzsXcKl2myH2j4oHe0OSySqWt6vY
 x4hdA3yUIFFiTpznFTDn3qTnCb2eZC42lWZv2OJ9LjA7CO5yHJ/q1aT8myY+j5Gppmei
 EurQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=oS1q/xRHxmjpWz0g8w+cth4Wgn4vgSIMG/wYS75TcaA=;
 b=kDeX6du+evAQs7N/nyc6ZekBdoUK5XZGi0rRjaSk69zxr7j1+XFKs/ETZiZ9zBrg3t
 KmadTsBOvZgmZ3DQq0+tz7FDrnOXFjZLXKtXP2FX2fEA1HCMEmY9zd1wLN5N9W37j2kK
 kxwMuhLxdvs5OUyN1KVPvzMTBdWRpREJFdU7l1goZsR46qxdakgPoohOnAKd4huszHFZ
 Gs7gVpBQPb/VzeoGvJrNwXAeEey2fTKVhN9lxjotdoavY6tzFggxTVlGHK0R++4eT63X
 Q3BBePD8m2g1U4JyCH+LcQ8pwFpdE6ToOasIEaTuxdOMvcT+akJ0YXrCnOeEW4hcZyXB
 TvVQ==
X-Gm-Message-State: AOAM531Dd4cw6xbWU5/UtuOrntDgpSPRhB2oYT9rpA/Afr/2HUJznvrZ
 goN9BlQe4KNv0wuWXjcke4f/ZLGSoy904g==
X-Google-Smtp-Source: ABdhPJzBALStB8mte56ZG2vNnusfJVNcLaHA0pWquPBH+BKMH2LO838RSnsCC5ZXZXDHvK78iys2TA==
X-Received: by 2002:a17:902:7286:b029:e3:cec5:f0cb with SMTP id
 d6-20020a1709027286b02900e3cec5f0cbmr6433364pll.70.1614907697538; 
 Thu, 04 Mar 2021 17:28:17 -0800 (PST)
Received: from [192.168.1.11] ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id t23sm531211pgv.34.2021.03.04.17.28.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Mar 2021 17:28:17 -0800 (PST)
Subject: Re: [PATCH 43/44] docs/system/arm/mps2.rst: Document the new
 mps3-an547 board
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210219144617.4782-1-peter.maydell@linaro.org>
 <20210219144617.4782-44-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <5283165e-f8f8-fd5b-843c-2010d212785b@linaro.org>
Date: Thu, 4 Mar 2021 17:28:15 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210219144617.4782-44-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/19/21 6:46 AM, Peter Maydell wrote:
> @@ -1,5 +1,5 @@
> -Arm MPS2 and MPS3 boards (``mps2-an385``, ``mps2-an386``, ``mps2-an500``, ``mps2-an505``, ``mps2-an511``, ``mps2-an521``, ``mps3-an524``)
> -=========================================================================================================================================
> +Arm MPS2 and MPS3 boards (``mps2-an385``, ``mps2-an386``, ``mps2-an500``, ``mps2-an505``, ``mps2-an511``, ``mps2-an521``, ``mps3-an524``, ``mps3-an547``)'
I think you should drop the list here, as it has gotten *way* too long.

> @@ -27,6 +27,8 @@ QEMU models the following FPGA images:
>     Dual Cortex-M33 as documented in Arm Application Note AN521
>   ``mps3-an524``
>     Dual Cortex-M33 on an MPS3, as documented in Arm Application Note AN524
> +``mps3-an547``
> +  Cortex-M55 on an MPS3, as documented in Arm Application Note AN547

The list is down here, anyway.


r~

