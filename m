Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E382C44FBB9
	for <lists+qemu-devel@lfdr.de>; Sun, 14 Nov 2021 22:10:53 +0100 (CET)
Received: from localhost ([::1]:60946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mmMm3-0006dd-Bf
	for lists+qemu-devel@lfdr.de; Sun, 14 Nov 2021 16:10:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38398)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mmMlB-0005yY-Ip
 for qemu-devel@nongnu.org; Sun, 14 Nov 2021 16:09:57 -0500
Received: from [2a00:1450:4864:20::331] (port=51717
 helo=mail-wm1-x331.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mmMl9-00059L-O2
 for qemu-devel@nongnu.org; Sun, 14 Nov 2021 16:09:57 -0500
Received: by mail-wm1-x331.google.com with SMTP id z200so12217715wmc.1
 for <qemu-devel@nongnu.org>; Sun, 14 Nov 2021 13:09:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=iNzqiY7dxyNKsEM5AmRZEy0Gfz/ngd1zgpXymaRkETQ=;
 b=OPojouGpprPqrBkE6B0njShQXpaop1B6zmgejshV9GE28BeI4T1DsrrQWVDWIdzxo+
 4r3R+6w1iiIe4MB+6+Z7FcIjsmg7fqaE69iiS0gfO2thuvWxzPzCsxWrZ46C9K3244pX
 COvyL8k58CZJEY0UWcdSmCgh+slDty16WrL1Bz6jOQ8mbqcLPRKSWpUHhwNkv/rubT94
 mST7YTTdSn+6LAuJdAH4hLBkfvS1ea4Ee1nDJf+UsepvyvvVYU8oTS4Eb24Wst+PuCH+
 P41UoSfGSp8Oy4oHoSV8EqlOjc70t8icncHw49UC0s6ySWnDPzsKaIdPLtyqNXTveH8W
 Lyrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=iNzqiY7dxyNKsEM5AmRZEy0Gfz/ngd1zgpXymaRkETQ=;
 b=CyGFLWpJeDWqyP8rQxN5yIkncn43Kr9b9wixKfq8e0+kISx3JP3IyJ90U35SoOlgOA
 r8kbeYjhcsBkTwj3br45DFG/iIsXjANvjn4aU4zh0V2MP94ZIexO+Z4u4RzsYkfs/Og0
 kBYw6VLuAPGXNrDjMhgR/QLqfGDpP5reQMEbbu4CxS/kbqlM4XTNVRteG9q4YcCekMBu
 Gggne1qr8qZ6oSdy4qNZehPJlPCiw8AQZdfpxH2hp6sm+qAfzvfk9qFsfAkgzR8fXh3a
 DopYYFx1A6t2fFJMT4ekjnBlzBOLKsgMCenFnQLl/dSNRqWmGnNmtizF+/FAqqq7+1Bu
 VVAg==
X-Gm-Message-State: AOAM531lkmr62XUqI6ApTQkrbCPbbvEFGcY+gJco0Azd93zhtEKHz+eB
 tb5+3Jonlvzu82H+WqYmxCE=
X-Google-Smtp-Source: ABdhPJzSH8ESTe8mCIvi+5w+BVRjUpe60+s+Z3gjT7re1CzdAYXmJ2AKbUEFgwgI6NwgG4FSTwWgDA==
X-Received: by 2002:a1c:1f06:: with SMTP id f6mr36214532wmf.55.1636924194236; 
 Sun, 14 Nov 2021 13:09:54 -0800 (PST)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id e18sm12276087wrs.48.2021.11.14.13.09.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 14 Nov 2021 13:09:53 -0800 (PST)
Message-ID: <437850ec-b8d5-fdc6-9bd7-185391eac85e@amsat.org>
Date: Sun, 14 Nov 2021 22:09:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v2 1/4] linux-user: Split out do_getdents, do_getdents64
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20211114103539.298686-1-richard.henderson@linaro.org>
 <20211114103539.298686-2-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20211114103539.298686-2-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::331
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x331.google.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-3.402,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/14/21 11:35, Richard Henderson wrote:
> Retain all 3 implementations of getdents for now.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  linux-user/syscall.c | 325 +++++++++++++++++++++++--------------------
>  1 file changed, 172 insertions(+), 153 deletions(-)

Same as v1:
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

