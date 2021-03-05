Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9579732E777
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 12:56:25 +0100 (CET)
Received: from localhost ([::1]:37232 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lI94C-0005Wq-Jx
	for lists+qemu-devel@lfdr.de; Fri, 05 Mar 2021 06:56:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36702)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lI91t-0003U2-Jh; Fri, 05 Mar 2021 06:54:02 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:54379)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lI91r-0002MB-OC; Fri, 05 Mar 2021 06:54:01 -0500
Received: by mail-wm1-x335.google.com with SMTP id u187so1188082wmg.4;
 Fri, 05 Mar 2021 03:53:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=0qiSOy8uXPMzP0SiA0Z4ONNtIL5xwSeVo2IOW1/wmvc=;
 b=oocimgGKGd/Ub1juSLJh6PL5QtXzzHjQULn5RSN7jw40NbqRF/xounqigUuiBIeB/c
 b32qcBNnAYDm62shwPn2QqFQZa38E0LyBHDZJ+7VMpNiK/59noAAmoJGuy/1+OcuSNOA
 dyWuHVdDNgBngsd3pXnnmTM8F7KumVQK6FoM8VBKdaT6gVmj0mXAuZDk4pHCm0JeE78V
 dh681V8+VEYu//LsB+jm0Gya26DIZVEFytXoEClo3cQDyFXrdPTGUlfOgnDy3eOayUyd
 jaF/9RAJA5B+oqjyVajMjI17Fcb92HO4qpx5/yOZjwJnWfpP11hQ3jUKlLQsGEndkx8Z
 PQkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=0qiSOy8uXPMzP0SiA0Z4ONNtIL5xwSeVo2IOW1/wmvc=;
 b=ucMBx0vA2TQH+9nSzkn77frQlhu9DYJsayCp+etbu7ZvYK+05AKkEeIfyiaEFVK7S2
 bi84oIeQ3RKe0YSSi/z3c1kl2ykS0LohKxU1YjYsETqkgtRLWg1jt3hhVwnb58NvC0g7
 qF4ASESgn08SpInEQY5Y06sCSMhaZBHM89Xa9mnJCakzAWQp7MMm/iIKafoll3W9XAHZ
 0LyrecMQcT3JauuRgUDsEynBAcILBXmJG1VvRvsgQ4mWUToi9KzY6/8nfoOkwJFhrUu1
 reulVe2N/7ksDqjPUuSdtlMkG2MzJ2nbUwsDtO7VnlKDdWIuUbaj8K+FJrO6Dnm1LQt8
 Dm0w==
X-Gm-Message-State: AOAM531c2LjPDdXFBoNZVAlfo/fHeRjjbMXgRezVaqCxmwerLGAk+wU3
 cqABDgfK9Cy0RcZM1Tk8ZQDmx/SETGM=
X-Google-Smtp-Source: ABdhPJyQNYqeBofF5f+KejoiQUbFpnmQX0VXQEOSEBuVcNwZlTC73/jPdoZIyl5q8uqHJnTzQ7nmCA==
X-Received: by 2002:a7b:ca50:: with SMTP id m16mr8321160wml.113.1614945237782; 
 Fri, 05 Mar 2021 03:53:57 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id f7sm1977778wmq.11.2021.03.05.03.53.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Mar 2021 03:53:57 -0800 (PST)
Subject: Re: [PATCH v2 18/24] hw/arm/mps2-tz: Support ROMs as well as RAMs
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210215115138.20465-1-peter.maydell@linaro.org>
 <20210215115138.20465-19-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <cdb50276-007d-9aeb-cdaa-05928624952d@amsat.org>
Date: Fri, 5 Mar 2021 12:53:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210215115138.20465-19-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x335.google.com
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
> The AN505 and AN521 don't have any read-only memory, but the AN524
> does; add a flag to ROMInfo to mark a region as ROM.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/arm/mps2-tz.c | 6 ++++++
>  1 file changed, 6 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

