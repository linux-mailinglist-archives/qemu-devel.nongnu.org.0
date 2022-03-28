Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D45204EA2E2
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Mar 2022 00:29:13 +0200 (CEST)
Received: from localhost ([::1]:38562 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nYxrM-0007wz-MP
	for lists+qemu-devel@lfdr.de; Mon, 28 Mar 2022 18:29:12 -0400
Received: from eggs.gnu.org ([209.51.188.92]:36206)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nYxqO-00076O-Ix
 for qemu-devel@nongnu.org; Mon, 28 Mar 2022 18:28:12 -0400
Received: from [2607:f8b0:4864:20::62d] (port=36514
 helo=mail-pl1-x62d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nYxqN-00069K-32
 for qemu-devel@nongnu.org; Mon, 28 Mar 2022 18:28:12 -0400
Received: by mail-pl1-x62d.google.com with SMTP id m18so11081353plx.3
 for <qemu-devel@nongnu.org>; Mon, 28 Mar 2022 15:28:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=9ojISTG5a/sAUv7OsoT/um6TqZse4vxE8aEu2c5eytQ=;
 b=FEznJI0tRFINTJlYpgC2kbf5uE+sH0aLF/aDOwp5QFq1BJVmbDcIRW5Ah7y2x3eaG3
 i2plZ1R7goBJmQ2QKDOkQ6g4Lg1hINgJAalLsUqvjCOmOpgQaKOkuwhkzNKUEVLD9a0d
 6UzNeWcUKiFTBN3AU5lSgyswJfC5IWlaJDZc3d5D2fV/Cq2Bowi9hA+35d8bJXo9I8XM
 +ktTRSQRctlhs6GiPre2IRAZ2ICyYwz7Rklms6XzuokS7ezdjgsJeFklUFO4/jMPIRTl
 k2XGpicJ9plrc2dZep2bn+fcfSlVeLAaRwWuhXbq4gMKhjrVaMPfeKj91gKJoxYxOI2C
 y4jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=9ojISTG5a/sAUv7OsoT/um6TqZse4vxE8aEu2c5eytQ=;
 b=K6jJQsY2vAXcUFCaoo0Y37BwtHrsN14xT9V2YeYeihaem9wOpwN82iK674XwX48yfM
 E7s25+yuhvuyDxPAOgnlCF7yUVuzBQqCp7N1kY6MpAtgPl8Zg74r0LtuUxJG/ZKtkQkH
 GmjgRzGfDZMzBkeS//fwULQqNa4ANj+lMvr0Rq+/0auV4SVgOyp5XqyOu25mCpqISM0z
 vjIa0tAnecuQpdy+cwihd4PLwt5xt7vd/4FSlx2U/8QA7NDCp6jxICBXqd+0A2Q69+Jf
 9B1NYvF+wTdNDV9tiloUNa5yPtef0gh2JXfYJUCZJf2tAvW8yONOmfnX1qn5zj+rHILu
 1B1w==
X-Gm-Message-State: AOAM532ZWQjTc7PiJBbDKFKk9NmjZS58kgQCAgsl5xI7l2QxQ7o9Hi18
 NbOyNINCf7xNdMJPRIkRxgo=
X-Google-Smtp-Source: ABdhPJyG1mShZle7DuBSXEdwtE44AMPfG+P+MuVHtFcPANBBAEleFiAIO0haU95OmDXeT8u9FOJ8LQ==
X-Received: by 2002:a17:902:8ec3:b0:155:ff17:fb7 with SMTP id
 x3-20020a1709028ec300b00155ff170fb7mr11105258plo.135.1648506489757; 
 Mon, 28 Mar 2022 15:28:09 -0700 (PDT)
Received: from ?IPV6:2600:70ff:f07f:0:3c84:1cd:456b:b750?
 ([2600:70ff:f07f:0:3c84:1cd:456b:b750])
 by smtp.gmail.com with ESMTPSA id
 k10-20020a056a00168a00b004f7e2a550ccsm17517088pfc.78.2022.03.28.15.28.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Mar 2022 15:28:09 -0700 (PDT)
Message-ID: <16f13d12-4f2b-fad2-3f5c-5391856a65a8@gmail.com>
Date: Tue, 29 Mar 2022 00:28:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PATCH] ui/cocoa: Respect left-command-key option
Content-Language: en-US
To: Akihiko Odaki <akihiko.odaki@gmail.com>
References: <20220317152949.68666-1-akihiko.odaki@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220317152949.68666-1-akihiko.odaki@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pl1-x62d.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Gerd Hoffmann <kraxel@redhat.com>,
 qemu-devel@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 17/3/22 16:29, Akihiko Odaki wrote:
> Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
> ---
>   ui/cocoa.m | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)

Thanks, queued to darwin-fixes.



