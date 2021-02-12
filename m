Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7147D31A452
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Feb 2021 19:13:43 +0100 (CET)
Received: from localhost ([::1]:58874 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAcwo-0001k6-6I
	for lists+qemu-devel@lfdr.de; Fri, 12 Feb 2021 13:13:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58852)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lAcvG-0000c3-FV; Fri, 12 Feb 2021 13:12:06 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:36739)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lAcvF-0000aG-32; Fri, 12 Feb 2021 13:12:06 -0500
Received: by mail-wr1-x429.google.com with SMTP id u14so282177wri.3;
 Fri, 12 Feb 2021 10:12:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=l5pU9JFla16DBqKmfzWM7EfFbRjIdYyYX3THlt+ihyA=;
 b=JZrlZXVuzc5FXPGWq38RafyTt093kMEGJr1pQ8JSHCYPSp3sDIcStDmtPY/T16iTU9
 wha6OkVLlTe8rVcxIWWSK8xhOwVArZN5SEVUkM+82R9PwRgp9dqs0f89LLFcImHiOrg9
 FU3L5+rj3soWGsCGg5+bQx+8PoQ/N9mjJilnNpvngTBlrTmBvzpnZBztJBfzSEV2UxJc
 LQ4/fu2gya3M8DjOR+Y35G/KCcp5dlLhFUwavq1th/1bjBvssLndR/nR+VMm3hE7uGgg
 OehhoFonrg5hSbtv3lolCKZJWta6Dwdhq2rhERxu40GCritgGHbDJcVY1WC2Iz1V4TKs
 4T8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=l5pU9JFla16DBqKmfzWM7EfFbRjIdYyYX3THlt+ihyA=;
 b=Cv3A43Kve8aKkqatDpD3heDnhROSBwZB6r78xPoKVOh2rQGmMUPpFT6AZBaDXDJw+f
 RcQk7dp+qEJusT+U8ydvrjVAfrOlkwPhs419GP/GTmOEvMbhWSnneZC2EFNFc8bpcDuk
 KNtBGXo8giV8vEWfr/7H0w4uJgQJzZ5kWXQf+K9tM6n07XgkyTBZez+kHfdaxK4iuYe8
 dNEbburemm2PL2lbX/E5FV+FgktmrPtM/b2aAblXf5XHZb67qawWYeV76vVK8uZbM3Yk
 u7BDwPJVbBSxHD3pbqRuysx/Kaw+GOhQBvixpcf1BZ1Bk3OLddigve/Lhg5kJCRoprcJ
 hz/Q==
X-Gm-Message-State: AOAM530Dd33UWErlfdNO+D0eN9hpcdd4HYssKR+Dey8e/bV81pmqsNqn
 PkxulUH+1UY37urnV+BU//3iTyexhnI=
X-Google-Smtp-Source: ABdhPJy82rTwsteaaBOuusja+9BWvks/TQxU8lhErAm3LfgmOkVa878XF7rr64Qb1HpRvvBKTZpGBA==
X-Received: by 2002:adf:fd52:: with SMTP id h18mr4908276wrs.295.1613153523157; 
 Fri, 12 Feb 2021 10:12:03 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id f2sm11377567wrt.7.2021.02.12.10.12.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Feb 2021 10:12:02 -0800 (PST)
Subject: Re: [PATCH 03/24] hw/arm/mps2-tz: Correct the OSCCLK settings for
 mps2-an505 and mps2-an511
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210205170019.25319-1-peter.maydell@linaro.org>
 <20210205170019.25319-4-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <3ac6fe4a-480e-0f2d-04ec-87da882dacf0@amsat.org>
Date: Fri, 12 Feb 2021 19:12:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210205170019.25319-4-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x429.google.com
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

On 2/5/21 5:59 PM, Peter Maydell wrote:
> We were previously using the default OSCCLK settings, which are
> correct for the older MPS2 boards (mps2-an385, mps2-an386,
> mps2-an500, mps2-an511), but wrong for the mps2-an505 and mps2-511
> implemented in mps2-tz.c.  Now we're setting the values explicitly we
> can fix them to be correct.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/arm/mps2-tz.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

