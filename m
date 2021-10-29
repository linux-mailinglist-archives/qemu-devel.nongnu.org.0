Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D18C8440550
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Oct 2021 00:08:49 +0200 (CEST)
Received: from localhost ([::1]:57472 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mga3N-0004Zq-0B
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 18:08:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36736)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mga1W-0002W9-Hy
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 18:06:54 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:35592)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mga1U-0006u0-GQ
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 18:06:54 -0400
Received: by mail-wr1-x431.google.com with SMTP id i5so11182441wrb.2
 for <qemu-devel@nongnu.org>; Fri, 29 Oct 2021 15:06:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=mAdRI6n4c/xpNLWfJfR7WW+OmEMLe9AcB03wngTRDZ4=;
 b=iMa0UD4Ne7YtP7jKXHgznTOWJD71KrIOGs2C+kEDmp63DWwpH1V5Md683HK/L0RAGX
 hBar+olR0XWvrMNl1wgu77RYXc2nUkOLzO7ig3fqhzKU1gO0p5QokyGhKbaytFa+7m1H
 JWIcGqOAXn/ydOH+ptsXGTe4fSbaaFDyn3YOKY5+Scao/SvwQJaRaTgSWqvKo/iRmO24
 Vogxsh7ZecPwzqz0MgfTgSHz4PVR8RhJdR3bx/aW8mZ9muuZHpUCNoo5P54YCITYUlqA
 gEZx8mJK86h2fuwfeslV/iZe8jrnTp3ElpHAEr1tCR0rWOvoRVDhnaMQbVcl6pcrqCUg
 aAhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=mAdRI6n4c/xpNLWfJfR7WW+OmEMLe9AcB03wngTRDZ4=;
 b=dcc/fjaySFZJ9fXAHrv0L0s9ORY0CHmenlphUJdiUkGddqHqdjyL/yR3PAsvyL0e9+
 MJMJfIvWe5i2oZBa7F3eqD7ZoolzJp4c6u6YJiLTVdGos3ueCDZqWgwZByOMQWGbRRG5
 yrWo5ZRqKzNjoU88/U3zGO4UJTU2l6NCozbrJo1dWVX3wCnLEeT/PIiMJLPEjdVlzj56
 /ps4nmv2pWWsRgQjpcmoAvU7UUnmhoU3nd9Delxe0Cno0DRl/Cpkx5v8lt08XM5sFK3D
 TLTsfiCoavVOWlvAToTVhEtUtdiiac4FJMfh7VV/hP8Z1RCz7rwgwZSUkEy2+SL0Ryci
 EJoA==
X-Gm-Message-State: AOAM533XffAorhcuhXLk2J/Y2WC2s8OyA6P1nDe6xOY6UztSRS5jHoah
 jQUE5cvk1s9/WA+gZLkxswc=
X-Google-Smtp-Source: ABdhPJwcf9l/qLb0KYXMVmkMLy8moZrYNnfoE32p7Pn1+vAUVL5FdGVtQ1DHbFAhOYGtMLaFmhpvFA==
X-Received: by 2002:a05:600c:a49:: with SMTP id
 c9mr14818969wmq.172.1635545211080; 
 Fri, 29 Oct 2021 15:06:51 -0700 (PDT)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id i7sm1928016wmb.20.2021.10.29.15.06.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Oct 2021 15:06:50 -0700 (PDT)
Message-ID: <95e7bc85-a014-18ba-8e32-2f96de0b7a92@amsat.org>
Date: Sat, 30 Oct 2021 00:06:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v6 25/30] hw/intc/sh_intc: Simplify allocating sources
 array
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org
References: <cover.1635541329.git.balaton@eik.bme.hu>
 <72efc4f2c4ff8b96848d03dca08e4541ee4076f6.1635541329.git.balaton@eik.bme.hu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <72efc4f2c4ff8b96848d03dca08e4541ee4076f6.1635541329.git.balaton@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x431.google.com
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-2.512,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Magnus Damm <magnus.damm@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/29/21 23:02, BALATON Zoltan wrote:
> Use g_new0 instead of g_malloc0 and avoid some unneeded temporary
> variable assignments.
> 
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> ---
>  hw/intc/sh_intc.c | 15 ++++-----------
>  1 file changed, 4 insertions(+), 11 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

