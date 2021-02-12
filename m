Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 60C2031A4A5
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Feb 2021 19:41:10 +0100 (CET)
Received: from localhost ([::1]:50852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAdNN-0000pp-5Y
	for lists+qemu-devel@lfdr.de; Fri, 12 Feb 2021 13:41:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lAdJx-0007GJ-Gp; Fri, 12 Feb 2021 13:37:37 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:37802)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lAdJv-0002le-1N; Fri, 12 Feb 2021 13:37:37 -0500
Received: by mail-wr1-x434.google.com with SMTP id v15so365832wrx.4;
 Fri, 12 Feb 2021 10:37:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=82VZGTuKwbnKyGqPOlbJ1g/v+LzjHNP7mBw7qSM/CJE=;
 b=prYWTiLQr4M99Z/0NWUelH/zn3h1BsuO0knHgbllIiZ0IQhs48DMfG0HOoTRJ9E6eU
 FizC1f2BZ1oOCNQhH+RgFbPZQK/++lS0rqq7pYGl7eKiEk+m9+nR2Y78gsK50Y32d4zQ
 JZS8dZLHoBw8PDw7KmO5oDzcOypqRoOE8qIC3TNrMy9Sgdqgi8bfVXwiCF4Wle3i+ygF
 Ucr1j7QHwgTwYVRlEeTtYa+WOhs6y9lx2sSz761gBgcXoMUTwKW5edA7qx0YkmGS8Ild
 AICJ/a43o2Qxcm1KFFP9vgmUJc92CSjawCT/WiEaDwX/ua5pJcuWjCJ/Xt5+PuVQUUaP
 RUWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=82VZGTuKwbnKyGqPOlbJ1g/v+LzjHNP7mBw7qSM/CJE=;
 b=sfNPPc5f973xMwy2UbTimfTou0JDXZoRcKNDDij1TzzXTBY6DUpdweqJr0AvUa7xCB
 okgjTMMEY+Xkxsbqaikd2ITErbhcpdcbc3eV0FdA1JVHcrRIKpAuPeW31WPs+U9Bn0Yc
 JZNu4hjDhPrXLp6f6YLAyGyMFJtrBcENeglUUTWf4tleqMV3eZr28wZN0LwIl9kid1Cs
 5h8tlKOHf2RnI04nfc6QvlNf+MWWBtA+XbgjinkkFTEE6NEUNPkt8TbCvbulQkmAuI3N
 1ZnPawwP9Xz+V6ZaGvHfFurDQZOcipyjHv//onSCdEGe/iKmeUK/sSYz2bhXOihe+3KW
 Vqtg==
X-Gm-Message-State: AOAM530lqr4OE3pFetFmkOMWbzCywBAaqkksfroykchF6190xjUM/CAC
 yO2bKM+/SDnaQeoM1WI5Zwq/gBNFrdQ=
X-Google-Smtp-Source: ABdhPJz2RbXyWzbpfv9vE3Na3h6RfSynqF2NwQgh0p+J4g3G5mA8rBB5xLyKtvH0EzDpaXcU53IRfQ==
X-Received: by 2002:a5d:4cd0:: with SMTP id c16mr5053543wrt.84.1613155052527; 
 Fri, 12 Feb 2021 10:37:32 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id b19sm14373902wmj.22.2021.02.12.10.37.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Feb 2021 10:37:31 -0800 (PST)
Subject: Re: [PATCH 24/24] hw/arm/mps2: Update old infocenter.arm.com URLs
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210205170019.25319-1-peter.maydell@linaro.org>
 <20210205170019.25319-25-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <ff9001a3-39eb-f215-37b8-465b7dad4776@amsat.org>
Date: Fri, 12 Feb 2021 19:37:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210205170019.25319-25-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x434.google.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.119,
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

On 2/5/21 6:00 PM, Peter Maydell wrote:
> Update old infocenter.arm.com URLs to the equivalent developer.arm.com
> ones (the old URLs should redirect, but we might as well avoid the
> redirection notice, and the new URLs are pleasantly shorter).
> 
> This commit covers the links to the MPS2 board TRM, the various
> Application Notes, the IoTKit and SSE-200 documents.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> There are some other infocenter URLs in the codebase; we should
> probably update those too, but they don't really fit in with this
> patchset, so I'll do them separately later.
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

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

