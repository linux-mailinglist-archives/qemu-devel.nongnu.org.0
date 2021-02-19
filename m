Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AECB9320192
	for <lists+qemu-devel@lfdr.de>; Sat, 20 Feb 2021 00:12:05 +0100 (CET)
Received: from localhost ([::1]:33182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lDEwO-0001Wo-PO
	for lists+qemu-devel@lfdr.de; Fri, 19 Feb 2021 18:12:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56028)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lDEv8-00010X-CZ
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 18:10:46 -0500
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a]:37538)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lDEv6-0003DL-Vb
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 18:10:46 -0500
Received: by mail-ed1-x52a.google.com with SMTP id o3so12541575edv.4
 for <qemu-devel@nongnu.org>; Fri, 19 Feb 2021 15:10:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=vSd7SWusbpD8k9zSZ3Veet1TpmzxQkPofOkBX3FwOuA=;
 b=rb6/lU8gRzg6bwxp2B7CH2M8+5gm3omoEUep5DwSI/LNuTzMivFZmLT2TjDwA/7WBQ
 56snFGtthW5pmLZ/n3B/GLvE3k9Gp0O1ijI7ZKDQl4ND/uJfCZZU9+VkYQa1V68HmW8g
 ESjQQSi1cPVs04m4SNnA9Sh5K2w+LW1mHeiE1iCOl9/mqB4ReYndpSZQf8gVxoC87CJ2
 Al69JhP8R96qk9UfcgVppIDXFgBsAJu5rhhev4nzwufmPGWLC2ZsM2ueX4JghIwFUPHX
 uHr4oYIeDt3BC0pETva/02dzMmC46yZtdr2qHle4lULuUaodci0SUeTTg6L/5eJLORop
 AiGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=vSd7SWusbpD8k9zSZ3Veet1TpmzxQkPofOkBX3FwOuA=;
 b=aE0BRdAToPxQlw/o101luZ55eenv3smqsD/RKsZfM6vbkzhtOIN7mUOoTe2U8UBOE1
 15o24hTq2DWb5AqTtBXJf8p7Jy4riPj+ev97NQ68l9Kvo0tUhnO85PVAE1PFBASoSRzi
 K5VYtwrpHgunDjHIZ+HsV5Cf1FzlbumMfbSxc2LyL2GGPrmm+t9EZevJ9f1QjDV+4NdZ
 ZiIDLvxQq8W7D8KsHgaF3E9y7RshN+Si+ULEtP9ILgJubA9oWXAxwpSUpkoIQxJZKmuK
 ai+xrkK6XCKAI9VLC446kcXnTWkG+dFNAUUF7OtvryWddayQE+PXabK66sIu3scVgNCp
 bZPw==
X-Gm-Message-State: AOAM533J2KnA91J+Rlx8a7MpmTpPWG05nwGRjnRhY+O8poE5+fw2g/XP
 PEbI1oHa0aWSDJ7cggfN1vk=
X-Google-Smtp-Source: ABdhPJzColtI7pt4cB2K1wHPzG6qHilfOLs1takg7GdsGxXt8SvlRafjFodKq7oWzM6fLnlE83Qp7g==
X-Received: by 2002:a50:fe02:: with SMTP id f2mr11564947edt.173.1613776243617; 
 Fri, 19 Feb 2021 15:10:43 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id u23sm6127317edt.87.2021.02.19.15.10.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Feb 2021 15:10:43 -0800 (PST)
Subject: Re: [PATCH 1/2] hw/timer/renesas_tmr: Prefix constants for CSS values
 with CSS_
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20210219223241.16344-1-peter.maydell@linaro.org>
 <20210219223241.16344-2-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <3376e7d7-bcf4-8fc4-bec4-0179bfb71aef@amsat.org>
Date: Sat, 20 Feb 2021 00:10:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210219223241.16344-2-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x52a.google.com
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
Cc: Magnus Damm <magnus.damm@gmail.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/19/21 11:32 PM, Peter Maydell wrote:
> The #defines INTERNAL and CASCADING represent different possible
> values for the TCCR.CSS register field; prefix them with CSS_ to make
> this more obvious, before we add more defines to represent the
> other possible values of the field in the next commit.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/timer/renesas_tmr.c | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

