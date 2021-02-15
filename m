Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DBA431B7B6
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Feb 2021 12:00:55 +0100 (CET)
Received: from localhost ([::1]:55870 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBbcc-0003T2-Cz
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 06:00:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55930)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lBba3-0001Wd-KV; Mon, 15 Feb 2021 05:58:15 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:39645)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lBba2-0004Bb-71; Mon, 15 Feb 2021 05:58:15 -0500
Received: by mail-wr1-x436.google.com with SMTP id v1so8328668wrd.6;
 Mon, 15 Feb 2021 02:58:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=qz22MENGLasxm8VcO1N0S5ZI2JdqEV46m8H20k21Ru0=;
 b=DsSWz/+d2TTEKptvgCm4KhcSisRklppyaK8kGzHNpE3jz2Xr1AsLgqsk/5xBxfC+Az
 D4j2bt38PgIL8/n9PSpXb+0gawxa8fkXCrkUcL5/n6dp58Efi+IKeeTYYcqqXBwHcKoA
 /a/dOY02DkcXIcW3jiecYMztWu+xL8ZVhOavYb/7Ki+W7vHLWHjY24/zZjUd3b8BWbbW
 IGdfFfP97mbe8gcFGb2LNu2Y7ovyDJomI5P2xv5y3wsMO0PShFD4VUzfQ1ocBycSj74I
 EVPwyuO9Q5C90kIOnjU3Xn9N+wmQysogLVw1hP458wcUj5ryG1HI2u8RVbV4jl5iZynA
 i41g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=qz22MENGLasxm8VcO1N0S5ZI2JdqEV46m8H20k21Ru0=;
 b=rKuTa9TKAMRk3KX44Nca3GyXFkKjdcxC/EJcgy2ij+XCXwArgU+juR/US3BqCNDJjm
 v85Qk1jM+6v2mwHSf4EUUWNuwzZ4tc+2ebuV5MTf6bY6jfA8+PWxYko8ipAUENokob0w
 pbNCv5ucFoRv4bVzB6rK9rvd4gqxX7d/SXquLE5gWPs/8pH+N4w1n2q7e4Q9oi58vUPf
 hU7BFriX4PCl7uS28AWb5ol1dAaFE2E1GT+hDsguLjKj5IAAE1xsVjlFwyK8GmgXTkK4
 v+lMz2POev9c2n89NxUozJ2y0KkAJJmIM/TUrrgqf7CkEKXIKphJVReOE2voMi8Qkr/i
 c8yg==
X-Gm-Message-State: AOAM530CnbMLcZjrw4rjY8mOLeKNzgXTdnoRmvO0eU8cq8uNsM6pQ1dT
 0/Q+MZ8cPCsggBC84+c1Gts=
X-Google-Smtp-Source: ABdhPJxYGgQAAKkvVMS2p5P6vY023TwR39l17snaWcS0B/NQlDFDctlSaY886fKLJbfIto2eYoY8ow==
X-Received: by 2002:a5d:4dd2:: with SMTP id f18mr18549329wru.115.1613386691970; 
 Mon, 15 Feb 2021 02:58:11 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id i10sm30197924wrp.0.2021.02.15.02.58.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Feb 2021 02:58:11 -0800 (PST)
Subject: Re: [PATCH 6/9] hw/display/omap_lcdc: Drop broken bigendian ifdef
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210215103215.4944-1-peter.maydell@linaro.org>
 <20210215103215.4944-7-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <8b8f8a30-ed31-697d-4bac-1da462eb64bf@amsat.org>
Date: Mon, 15 Feb 2021 11:58:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210215103215.4944-7-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x436.google.com
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
Cc: Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/15/21 11:32 AM, Peter Maydell wrote:
> The draw_line16_32() function in the omap_lcdc template header
> includes an ifdef for the case where HOST_WORDS_BIGENDIAN matches
> TARGET_WORDS_BIGENDIAN.  This is trying to optimise for "source
> bitmap and destination bitmap format match", but it is broken,
> because in this function the formats don't match: the source is
> 16-bit colour and the destination is 32-bit colour, so a memcpy()
> will produce corrupted graphics output.  Drop the bogus ifdef.
> 
> This bug was introduced in commit ea644cf343129, when we dropped
> support for DEPTH values other than 32 from the template header.
> The old #if line was
>   #if DEPTH == 16 && defined(HOST_WORDS_BIGENDIAN) == defined(TARGET_WORDS_BIGENDIAN)
> and this was mistakenly changed to
>   #if defined(HOST_WORDS_BIGENDIAN) == defined(TARGET_WORDS_BIGENDIAN)
> rather than deleting the #if as now having an always-false condition.
> 
> Fixes: ea644cf343129
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/display/omap_lcd_template.h | 4 ----
>  1 file changed, 4 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

