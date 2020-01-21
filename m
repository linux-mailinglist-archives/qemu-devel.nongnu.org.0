Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 04F301446B3
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Jan 2020 22:56:58 +0100 (CET)
Received: from localhost ([::1]:33292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iu1W5-0005KM-3d
	for lists+qemu-devel@lfdr.de; Tue, 21 Jan 2020 16:56:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49923)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1iu1Uf-00046s-Hq
 for qemu-devel@nongnu.org; Tue, 21 Jan 2020 16:55:30 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1iu1Ue-0006Wa-C1
 for qemu-devel@nongnu.org; Tue, 21 Jan 2020 16:55:29 -0500
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641]:42114)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1iu1Ue-0006WI-68
 for qemu-devel@nongnu.org; Tue, 21 Jan 2020 16:55:28 -0500
Received: by mail-pl1-x641.google.com with SMTP id p9so1918368plk.9
 for <qemu-devel@nongnu.org>; Tue, 21 Jan 2020 13:55:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=78IE5TQhFyzl7xKQw5nm18ZUL/nd13EvOjBpxxvwQT8=;
 b=D4FJb0+1YdNmXrZp7E9pcpMj1rmRqYIVx4RLKQt0sybarjfL7TpodfqktTL3znPukT
 a4F5C+/xCyZp0q5Cd3vg5mHL0cC9+2q3UOjICf+/3IUm1sBJ2Ne8NH6dk6rsW2WCPtoi
 79R99ezZBQkGXyjqEpIJYeslD6esjpiaQBYDqgqaTARSGq+dgkHdlU0WU8OCHp590WQN
 MFt1GMJSreuSARpWvED+tQ/YrrSOuVAPc5rgXSDYuq1o+bydn6ANKI7Y5eq8/sxrW7IJ
 +I5YzWzSwdZ6wU9DFF3p8ntAvhDKC0JSkt4qfsj6nlINDj6sH+CNvpfMNpQfjIomsUOz
 vTcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=78IE5TQhFyzl7xKQw5nm18ZUL/nd13EvOjBpxxvwQT8=;
 b=gusHZ6qS72K16qAEQFTT4xAY/UNlfmLdLBhnFFayi7/rdaik18qWOGwFOv2nvPZ5Ho
 YBZCtD8El3s/yzqAwfVSqSyQHUULssXj6Yr5oCnAXo4yIQLx7Xi52caTiieZmtC8wAfH
 4e9KfFbd5iohKCIRHfaVv6Zo2m+5BoPIkScP7PhagiZ/WfRkBcHaWhhBDHe2fbDH60ly
 LXXI3tlZLdPmgRciKAw7+qCcfWOzaiKgL/VO/WeJ6n20wrFvzzPymLRpxa0L8n264mo+
 zNfLSNtMD5C/JAjE/O4UP6Gpa1A4x6Tx73ZS2xS3QMc9AQ9Rl6LI9f6YPA3qJwNXHjLq
 vM5w==
X-Gm-Message-State: APjAAAUgru85v0W0Yyli9Us3t0lPcRDWu1GJqqDE/NJ7OecGinf6yyIe
 L8dH4wh3bETDwe29li60EutZhA==
X-Google-Smtp-Source: APXvYqzgR1Mtbe8iMSasrqvEc7gxwnXIseVyiW/7F4ueiaFURLh16QPTKs0V3KqQnR+WhCR00gpYyA==
X-Received: by 2002:a17:902:8204:: with SMTP id
 x4mr7284131pln.225.1579643727386; 
 Tue, 21 Jan 2020 13:55:27 -0800 (PST)
Received: from [10.5.50.117] (rrcs-173-198-77-92.west.biz.rr.com.
 [173.198.77.92])
 by smtp.gmail.com with ESMTPSA id b193sm45174473pfb.57.2020.01.21.13.55.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Jan 2020 13:55:26 -0800 (PST)
Subject: Re: [PATCH 5/5] qemu-img-cmds.hx: Remove texinfo document fragments
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20200121191033.28195-1-peter.maydell@linaro.org>
 <20200121191033.28195-6-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <5672b379-b5c4-d8d3-e7b5-498910cfbe0a@linaro.org>
Date: Tue, 21 Jan 2020 11:55:20 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200121191033.28195-6-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::641
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/21/20 9:10 AM, Peter Maydell wrote:
> Now the qemu-img documentation has been converted to rST, we can
> remove the texinfo document fragments from qemu-img-cmds.hx, as
> they are no longer used.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  qemu-img-cmds.hx | 56 +++---------------------------------------------
>  1 file changed, 3 insertions(+), 53 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~


