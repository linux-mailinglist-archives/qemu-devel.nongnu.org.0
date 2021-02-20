Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D36A6320721
	for <lists+qemu-devel@lfdr.de>; Sat, 20 Feb 2021 21:43:14 +0100 (CET)
Received: from localhost ([::1]:43044 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lDZ5t-0004jG-Dp
	for lists+qemu-devel@lfdr.de; Sat, 20 Feb 2021 15:43:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34042)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lDZ4i-0003pL-Iz
 for qemu-devel@nongnu.org; Sat, 20 Feb 2021 15:42:00 -0500
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:53158)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lDZ4h-0000VX-2r
 for qemu-devel@nongnu.org; Sat, 20 Feb 2021 15:42:00 -0500
Received: by mail-pj1-x1029.google.com with SMTP id kr16so5769145pjb.2
 for <qemu-devel@nongnu.org>; Sat, 20 Feb 2021 12:41:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=TWUWt0jDmYpdhOVoTPFbWktmy1jceqjHuLOPK0fzeH0=;
 b=UQQ6x5eVOPedr0hz2sS68xIQHqO1Mcczsp2eoPdLWXMKhF5WB86pzVVtJXVSrlTmQZ
 8+wDaF1fNUxWub1KB7mxuT1e0obx6uNVXyKxmG1wONYRjk8bOu8SPcpaUuVrmpqLQG7q
 wulaPf9lD7hAv+pM+JZ1/nTKDu8d9xgFlOJoadA8OAuSKWFUNW4oU+ON7db7wIZV1/mt
 SncnlLhTDxTK4ZD9N4athKe7TzVzNW3ZApufYZU8bMeFCXUR/HAcaFllIBQPLxFN18Sf
 6n3YbX6cDaiv5TArpxLJNAJDgL6yGSy80iNWR+NKh7CSsTkK+xw/2WC5i16MFobDZPp6
 2zhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=TWUWt0jDmYpdhOVoTPFbWktmy1jceqjHuLOPK0fzeH0=;
 b=XljO8L0jxW6mUJM3jRPvld/DSamRXsl6/onDNai4e+iKRBigSphB98N6khJts4j/3m
 WwHA+SjNTEDXfg8D9ZrtMtVURX+wyLE1H3yIJpMOrYknvkp+wzIfcq832nLpfq/+JcVq
 RttTP6tJxPPfntGNK5wRKEZ4ajHYZGBt0KUESlr6TqdmG5uZWlRKVyJMY8VIbPY/+mIB
 dbzcxlBsufMwWjHBlfls4qp8HeS3/GN+SzMoH9coAWrP0UdJqk3SXVaIozti6A6qIY4h
 OZWB7qSJ5Q73UyvdmJDwxAFet1gkYRhIGCCxcSI4e0kaqBKKUqfb/5Aktt2RH9x6UK+T
 /ECg==
X-Gm-Message-State: AOAM532nT8Ry1rE97Plv4chPmaj6rie8MOxDk9ragdEA7wTPoUAtygcy
 lW5NjuwctL04EfT1CSsnVf+NaA==
X-Google-Smtp-Source: ABdhPJygKLYpiMw94GqEL9Hz2mXoSAuxfQhPwAHjs1j3NVdKcCDhvYRMg7qzWUkzxGZIRuyfjYXdew==
X-Received: by 2002:a17:90b:4d09:: with SMTP id
 mw9mr15690716pjb.199.1613853716125; 
 Sat, 20 Feb 2021 12:41:56 -0800 (PST)
Received: from [192.168.7.36] (24-113-145-216.wavecable.com. [24.113.145.216])
 by smtp.gmail.com with ESMTPSA id
 a78sm13825155pfa.10.2021.02.20.12.41.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 20 Feb 2021 12:41:55 -0800 (PST)
Subject: Re: [PATCH] target/mips: Remove unused 'rw' argument from
 page_table_walk_refill()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210220202026.2305667-1-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <1d4688b9-6b24-e65f-a54b-b285588287fc@linaro.org>
Date: Sat, 20 Feb 2021 12:41:52 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210220202026.2305667-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/20/21 12:20 PM, Philippe Mathieu-Daudé wrote:
> As the 'rw' argument is unused, remove it.
> 
> Reported-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  target/mips/tlb_helper.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

