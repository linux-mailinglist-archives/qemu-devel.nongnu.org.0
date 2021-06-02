Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C5C0399224
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Jun 2021 20:05:38 +0200 (CEST)
Received: from localhost ([::1]:53652 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loVFJ-0000F9-Jk
	for lists+qemu-devel@lfdr.de; Wed, 02 Jun 2021 14:05:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1loVDd-0006IZ-5D
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 14:03:53 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c]:35677)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1loVDb-0008Ue-Ds
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 14:03:52 -0400
Received: by mail-ed1-x52c.google.com with SMTP id ba2so2258010edb.2
 for <qemu-devel@nongnu.org>; Wed, 02 Jun 2021 11:03:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=RK0EWTJNs1Za15yPa0XDToq0GOI2BZn/PkkLAkngyOI=;
 b=ITgHgzrVsPMIRvDWDEApBCRjRLJVQAAY/4CoiLwPkROC7Pr5J0zK80mmZaqC2uQNBq
 rRKiWqZXwsn0j6V6qDAyFZWgNO2Khrhvb1IUkNLgwRZscb3XvMHfzYumZARIREALnWpb
 Gz/d0cF2Ys3vLWYIKLhwonGg2W+6qlGnD3CKcsJUBYXtQno4isOkcVhJDsT52WsfQiXY
 /ZLvCcCto5HKUD9EQYfstwHyriUoocpvIQ09iuwJbYNo3kaKS3AKBpFztFHcCy4xxCjV
 n5pOgiUCopnP1tA3GmzXr7mMp+tmFvUweNK/9+L9SWFVZvN6rl8ZQLZAv0xL+MZrV0Cf
 SFMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=RK0EWTJNs1Za15yPa0XDToq0GOI2BZn/PkkLAkngyOI=;
 b=a/V/2mItW0VrE5zNLGzvBbBNLS1sEJE53q64yDl4DR0zcuNZ5SsQFAeSjJyZJ0QBSQ
 iEonOEDXBdd50goGh0wo/wwhudrD5d9yc6R/skAtu6IyCDyA7ODf234vdKx9Ia24bfre
 VZb1WUYu/aDGbJgqr51l7/d4TSTa2SS34RRcf3Fi7g03FBd0KGzDkPP0qs8h7KCrLfmE
 x8Q4KIdZdURBwhc7PShLetNd6xjPcLhfIQTACe5U3TWS6dSuTBRqtsXTsaqYTp6RckOM
 OZRTcMnQTpnIRyr1naTmFzZLG9PLgdIMaATC0BngFT6yzUy8BuC6aviy5N3tlNB9Osb8
 f4wg==
X-Gm-Message-State: AOAM533b0nlUfSUfT0qovw4nBSWgLWGAwaeek/gJaVnJS7XceOw6dB90
 cOgEOJRi1T6THaJmeFfKjgrdz5AAHobI/g==
X-Google-Smtp-Source: ABdhPJyl24Ixmi7Wj9Ex2ekjquxlNEFAG7SUcFx8d/QDb+/UgGdCkG2XYEGEc13+3zjvd8toqjtl7g==
X-Received: by 2002:a05:6402:1d06:: with SMTP id
 dg6mr15716775edb.132.1622657029627; 
 Wed, 02 Jun 2021 11:03:49 -0700 (PDT)
Received: from [192.168.1.36] (235.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.235])
 by smtp.gmail.com with ESMTPSA id gn26sm322251ejc.6.2021.06.02.11.03.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Jun 2021 11:03:49 -0700 (PDT)
Subject: Re: [PATCH v7 25/27] tcg/tci: Remove the qemu_ld/st_type macros
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210601150106.12761-1-richard.henderson@linaro.org>
 <20210601150106.12761-26-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <8a82c50c-5d82-6a8a-30c0-80249c4f185f@amsat.org>
Date: Wed, 2 Jun 2021 20:03:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210601150106.12761-26-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x52c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.613,
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

On 6/1/21 5:01 PM, Richard Henderson wrote:
> These macros are only used in one place.  By expanding,
> we get to apply some common-subexpression elimination
> and create some local variables.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/tci.c | 165 +++++++++++++++++++++++++++++++++---------------------
>  1 file changed, 100 insertions(+), 65 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

