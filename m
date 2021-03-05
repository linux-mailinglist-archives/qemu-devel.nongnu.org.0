Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9849E32E77E
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 12:58:19 +0100 (CET)
Received: from localhost ([::1]:43392 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lI962-00083X-Ma
	for lists+qemu-devel@lfdr.de; Fri, 05 Mar 2021 06:58:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36980)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lI931-0004bA-Bm; Fri, 05 Mar 2021 06:55:11 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:37967)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lI92z-0002sP-55; Fri, 05 Mar 2021 06:55:11 -0500
Received: by mail-wm1-x336.google.com with SMTP id h7so1219093wmf.3;
 Fri, 05 Mar 2021 03:55:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=W9wfsp7ZIISi3HlVr7oAd3Hay3kmw8Yt7bNQE2rdYRM=;
 b=dXlwBxzRyPqSD2Jyj8105bB0Do7Ba5EVKRb1pwCzhqELfDiwd1LwyPAY9Oo2wpMxgF
 IKN8j8gqWBCe0Oa45aGSOCKDufighbFbVYyNsqEnq9w4MPTU424B8v1N9MScLioT5RG6
 NZEQMCyMiHTzyFtR6du3KXj6mSkUI7+SpaR0E4ZqyRo8NWcHnICMIadFzR66cBFK7XwK
 h5RE+aMrFmOabNckc2m0hEpCbl4MCVq3NYqKSQk961ztL8jCqVf3PNT6isDScNQ8J+oM
 V8kSQiLUHgG6ewww8qGxN1s19pb8dZNY5W73uT3WtkaZIQqX80UPBXpohDLi79p/5kX7
 FtqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=W9wfsp7ZIISi3HlVr7oAd3Hay3kmw8Yt7bNQE2rdYRM=;
 b=HFaxSmwTfdAKW3GRpwoTPSsxSHa5J04qLMYMKi4gcIQ5rS0JtP5UexEqcKPffqA97L
 WIXBaKaFiFrT1Ybs810ETWbElRnydP7LTxQNVpwpiU00ZigRQTfz4oyDa5zyHFh6Dxts
 RTX5DCJl3ypOkPuVQSRolbazMhYx3QS0CCQEYh9f9j8hRgUAh3vh+wEtWi5R/trsVlTM
 ysAERatFxq9MlvbRi86T4Octp8JxReuUO1Ns+nTnVdNjPjVE5vAgt+0geTpmrqkKeC3h
 BX5w0yJMy2BbZNQGMcsi+DzeV8IfDAa1UxPGltoWm39aiiNAxl6/dG7czH7dvE99+Ovi
 7cFQ==
X-Gm-Message-State: AOAM533miafMcU6e+Gewg083rG6oSHjvALfKdn14yh5FULyzgSmCsFWK
 mG8cDhf/QOE4fmw79O2SlnErJfmrxlM=
X-Google-Smtp-Source: ABdhPJzx+0XaBvum21uefOLMROXzWuoa0nsRI2rrBfK1nc/V4O1yxkI2+xy64vStWMAo4j46+MIPSw==
X-Received: by 2002:a1c:c20a:: with SMTP id s10mr8463132wmf.144.1614945306893; 
 Fri, 05 Mar 2021 03:55:06 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id 18sm4041004wmj.21.2021.03.05.03.55.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Mar 2021 03:55:06 -0800 (PST)
Subject: Re: [PATCH v2 24/24] hw/arm/mps2: Update old infocenter.arm.com URLs
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210215115138.20465-1-peter.maydell@linaro.org>
 <20210215115138.20465-25-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <95f1c5a5-d9d8-04d5-2eaf-645bbe2f6ec5@amsat.org>
Date: Fri, 5 Mar 2021 12:55:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210215115138.20465-25-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x336.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/15/21 12:51 PM, Peter Maydell wrote:
> Update old infocenter.arm.com URLs to the equivalent developer.arm.com
> ones (the old URLs should redirect, but we might as well avoid the
> redirection notice, and the new URLs are pleasantly shorter).
> 
> This commit covers the links to the MPS2 board TRM, the various
> Application Notes, the IoTKit and SSE-200 documents.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
;)

> ---
> There are some other infocenter URLs in the codebase; we should
> probably update those too, but they don't really fit in with this
> patchset, so I'll do them separately later.
> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  include/hw/arm/armsse.h          |  4 ++--
>  include/hw/misc/armsse-cpuid.h   |  2 +-
>  include/hw/misc/armsse-mhu.h     |  2 +-
>  include/hw/misc/iotkit-secctl.h  |  2 +-
>  include/hw/misc/iotkit-sysctl.h  |  2 +-
>  include/hw/misc/iotkit-sysinfo.h |  2 +-
>  include/hw/misc/mps2-fpgaio.h    |  2 +-
>  hw/arm/mps2-tz.c                 | 11 +++++------
>  hw/misc/armsse-cpuid.c           |  2 +-
>  hw/misc/armsse-mhu.c             |  2 +-
>  hw/misc/iotkit-sysctl.c          |  2 +-
>  hw/misc/iotkit-sysinfo.c         |  2 +-
>  hw/misc/mps2-fpgaio.c            |  2 +-
>  hw/misc/mps2-scc.c               |  2 +-
>  14 files changed, 19 insertions(+), 20 deletions(-)

