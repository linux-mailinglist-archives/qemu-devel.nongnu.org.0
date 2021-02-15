Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8E4631B7B8
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Feb 2021 12:01:53 +0100 (CET)
Received: from localhost ([::1]:60266 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBbdY-0005NE-Mv
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 06:01:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56410)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lBbbs-0003ur-4D; Mon, 15 Feb 2021 06:00:08 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:36681)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lBbbm-00051o-Vg; Mon, 15 Feb 2021 06:00:07 -0500
Received: by mail-wm1-x32a.google.com with SMTP id h67so4085040wmh.1;
 Mon, 15 Feb 2021 03:00:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=GA199u8ouu9KvEujb4Ifm5GQvpxnwEgf4SKOTueVtD0=;
 b=YUjz8AyQK6ivAmKXlH2zp2vMwJ9oDzOwhzzAfjAYXXUp7FJ97EMIDw/JxE00APXZ3W
 oS87YxezsxOq0E9PZ5ScnE+rXJFduGYLreLAsqM/NSJJigpd1NI89m4S+h04uM9voJm4
 Zg2slFC6RNm1v54bJEVSFJfR+C9tmkWVtR+wHmtUoJdocANL8HugvVjtScYs6NoYDj/N
 +DnK3r+mpRXqfjmumO4nQESCPwiylpJkHiHug2XgmbuhkRMJN/jg6CmYZjVKmY5D5zJX
 SEyRVNfphsq3SNeCklcIaK79j+Ic/S+EOgYPhlUXHnNAO1cLmFbpsSIgSNMW6mBjJK5L
 ohMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=GA199u8ouu9KvEujb4Ifm5GQvpxnwEgf4SKOTueVtD0=;
 b=lrPooL3uSKAZq3i7xzL0k/wnCTQMOSsbHXbAnhQPP9U5FIVhfRPVH8Njra2HQl6rpL
 KXqJ5ZlA3mFYSdGj/ZAqHqPcygFPgKbRdnxvGWt0fPjU1sPmCMT/U/zR9fRL17Cds+Yv
 VtriOyHGEVcfjo50C0RqJ4Y+tg73mTuyyRrV1kmYIuqyP0PKa29+MvtVS73gVCIfjyaW
 DG7+NUVZY8U3ygJIsWB+SY2K3GnKmWvYGx99eVAIyty3zsTW1I7NDYqithcJnTEfd9nJ
 Eyb/bn8nUGg5bRA9Y1Ft1VXalE1vZFTM3ViZHFMfIENZM061HbDiISXCG06i00cL9fth
 EJlg==
X-Gm-Message-State: AOAM533vnZG+Rb0gxzpfmbf2TN4FSsF4j/8E3vZxw8I9969+2KxlF7Hf
 9bQzEb+pFgmPD2qyqHU66A4=
X-Google-Smtp-Source: ABdhPJzlUPkX5Js/qBiiJcq6PFh8ahkq42p51Veasmit+EQQmPXX0Xnq/XtUtOe31GOglHfxa518gQ==
X-Received: by 2002:a1c:113:: with SMTP id 19mr13860397wmb.7.1613386801097;
 Mon, 15 Feb 2021 03:00:01 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id u142sm24911239wmu.3.2021.02.15.03.00.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Feb 2021 03:00:00 -0800 (PST)
Subject: Re: [PATCH 9/9] hw/display/omap_lcdc: Delete unnecessary macro
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210215103215.4944-1-peter.maydell@linaro.org>
 <20210215103215.4944-10-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <ff8a632e-7434-9c09-1757-62d28f52d500@amsat.org>
Date: Mon, 15 Feb 2021 11:59:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210215103215.4944-10-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32a.google.com
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
> The macro draw_line_func is used only once; just expand it.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/display/omap_lcdc.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>


