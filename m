Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A89CE51EB41
	for <lists+qemu-devel@lfdr.de>; Sun,  8 May 2022 05:21:39 +0200 (CEST)
Received: from localhost ([::1]:56068 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nnXUI-0003vx-QX
	for lists+qemu-devel@lfdr.de; Sat, 07 May 2022 23:21:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39586)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nnXSm-0002DJ-5a
 for qemu-devel@nongnu.org; Sat, 07 May 2022 23:20:04 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:45907)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nnXSk-00009N-At
 for qemu-devel@nongnu.org; Sat, 07 May 2022 23:20:03 -0400
Received: by mail-pj1-x1031.google.com with SMTP id
 w17-20020a17090a529100b001db302efed6so10068083pjh.4
 for <qemu-devel@nongnu.org>; Sat, 07 May 2022 20:20:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=GCNF2Y/+vvUbT3N0pmqSRUQRqCAQ48oUa6iY21urwwo=;
 b=Jq80mj5NB7i9tNZbIaHJ0qQ4Q3EbhlRQegI2gBjwbJdrkI2mMDJeWgDW1iVysBDN3h
 HPSsVzWYB2nkxfN9GLTmkElKLtlfg8G3zYWWAuCTZFRHQJvjpcfgihtDtU6+kwjVzRXy
 z4Nw+W9sMefCKcaqBheUIml+Xh3tu2LlCKXnHRUnz46SZQXu7hVCUYrEftrt9YQyojmK
 aNzwtsjjErFFn72l5AtaM/htP+YCbmXYBqQ0++PzVzvx8BmAAkrPZIthRxQ0P29cBNib
 HYTEZD3oB6bUf/5ghsJDNl+2UNQHRaHNka5bf58E9VrqtvTWaAj2c7M2NceZS6fpD6EL
 nqQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=GCNF2Y/+vvUbT3N0pmqSRUQRqCAQ48oUa6iY21urwwo=;
 b=sc0NtXTELaETQRsvcNW/53FE6c65Dk/AE4OQRUve/cWTf4+CatqHXF6f8Sb6+rjJEy
 Q8ebWCG+GEMD23AWe84KxxfjJLnS30SAXYSr3kW7rEYp74HXrj9R3TSlDGSqCGC9ERtM
 AUSKzbo5EfKTvYzepsWk87ivLWXWo7G12mcr7F8xtH4+HPbtEbPCy3ym2+yZQao6iKDJ
 71l56021ziivfntYyrtSrDesQBOnXFxKghamMYlQQQcPen+uzEw7F3A+70nOnLQjf+oc
 O68ndS7FZMk+bDRaS8hbzH7m6AzLk4oTaWD+vhWho0ZB1HF/zgV+S6AgldloPzzGO7B0
 uaQQ==
X-Gm-Message-State: AOAM532ljtkGBl036Gf8zkpLwtkibswXCl10wEckaAv3bVp5n+btoEUE
 pc+ZrpBzVQv+s626y66a7Mi6jA==
X-Google-Smtp-Source: ABdhPJxgDdZNHdXanyBHdsryGtGn0c97eer/nUtrlCHjyI5t8+ae0Nn8Ii3okuLV4QMpB/6CAkLyyg==
X-Received: by 2002:a17:902:ea57:b0:15a:6173:87d6 with SMTP id
 r23-20020a170902ea5700b0015a617387d6mr10255431plg.104.1651980001057; 
 Sat, 07 May 2022 20:20:01 -0700 (PDT)
Received: from [192.168.4.112] (50-233-235-3-static.hfc.comcastbusiness.net.
 [50.233.235.3]) by smtp.gmail.com with ESMTPSA id
 i23-20020a63e457000000b003c14af50619sm5795465pgk.49.2022.05.07.20.19.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 07 May 2022 20:20:00 -0700 (PDT)
Message-ID: <5a068736-26b5-4b6f-0fb1-0c5c280d2984@linaro.org>
Date: Sat, 7 May 2022 22:19:57 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v2 50/50] hppa: simplify machine function names in
 machine.c
Content-Language: en-US
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, deller@gmx.de,
 qemu-devel@nongnu.org
References: <20220504092600.10048-1-mark.cave-ayland@ilande.co.uk>
 <20220504092600.10048-51-mark.cave-ayland@ilande.co.uk>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220504092600.10048-51-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/4/22 04:26, Mark Cave-Ayland wrote:
> Signed-off-by: Mark Cave-Ayland<mark.cave-ayland@ilande.co.uk>
> Acked-by: Helge Deller<deller@gmx.de>
> ---
>   hw/hppa/machine.c | 12 ++++++------
>   1 file changed, 6 insertions(+), 6 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

