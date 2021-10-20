Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B5244355A2
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Oct 2021 23:58:29 +0200 (CEST)
Received: from localhost ([::1]:58208 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdJbQ-0004BH-No
	for lists+qemu-devel@lfdr.de; Wed, 20 Oct 2021 17:58:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36414)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mdJaI-0003Km-5m; Wed, 20 Oct 2021 17:57:18 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:38438)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mdJaG-0002yp-KQ; Wed, 20 Oct 2021 17:57:17 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 a20-20020a1c7f14000000b003231d13ee3cso1182016wmd.3; 
 Wed, 20 Oct 2021 14:57:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=M1gvnz39MsdK6G4S00rXUyhzXqfzj+IcqU1x8rWvJm4=;
 b=A+6Cil9t+yEErvjJtym3UG8qJ33EFijCiUAae4z9XEfL6N0ZnyRJ+RKDQtKaquEJ82
 sxOL7uI/kQP+yq4oOxTP98krsvL55PHbpitVzjGxZ+LVfTy6ojfvVVlLkk+Q0jpikP41
 LJa1k6Ndy1dZSVmF1WEcGyCSTQqPm2QdMpxQlosVlagG6OrBuTdY3FKIGAFi3RTVnDqg
 +RRCDff5Tu5v8Sj0xIKer6fgR6YWZBVrZrz3Iu59mrZcCYCxkcLJpRnu/GsZxY6mHTXy
 UhYuxcD1AbH5w2QGrH8svU7m8Qnf8IaP4E6LYE+blWg92XZX+UwmIR11xNRTB+I8DJ33
 +fUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=M1gvnz39MsdK6G4S00rXUyhzXqfzj+IcqU1x8rWvJm4=;
 b=C8lr+a8q/8bDV/X62u07yyTqeqaZpzRWjoGJ593ajsDa68rCpQL6w4Msr5aALmz+SG
 5tn5vbr1OjKVdFvAFTyjY49I2z7aSKOYgYtP5HiK+jz16UnIgn10lJTZGgVJ3GLuhXYN
 aYdpsJAg6s0/S96TlaDA4skheTxfyVh9zCgZ0D6IueSJ1xKavMp05M1Ny28anrPQupOs
 iwDJPglq/DC5n+FCLuucoJm3KiLgrmSKE7xkWCyCbG3TdjX4Brxd4uQcDgcUUHB1roNB
 aJ8nDixztN2Xipa8QOfR79lN4L7mbvrYyn0k4mrDbWahMnqS7BOhaMDjQod9yiDMqsmx
 e5Fw==
X-Gm-Message-State: AOAM530h/gP5JpCV8mTdHF4G2cJnGCk1bMkR6T0MDdMg3QAGUy/U/XmY
 IF8Lm/idLnFWl56r24pbzK4=
X-Google-Smtp-Source: ABdhPJzDugfto5BI0TxJyQY/EA+p4LfVdR/EM36p5286ZfP2aMi5ay8HvMoCSPLpELOXRz96Lpn1qA==
X-Received: by 2002:a1c:23cd:: with SMTP id j196mr2026864wmj.11.1634767034632; 
 Wed, 20 Oct 2021 14:57:14 -0700 (PDT)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id q14sm5975458wmq.4.2021.10.20.14.57.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Oct 2021 14:57:14 -0700 (PDT)
Message-ID: <9d9cec11-ea12-bfdd-8ae3-2a3fdb1b18c7@amsat.org>
Date: Wed, 20 Oct 2021 23:57:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v2 1/5] aspeed/wdt: Introduce a container for the MMIO
 region
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20211018132609.160008-1-clg@kaod.org>
 <20211018132609.160008-2-clg@kaod.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20211018132609.160008-2-clg@kaod.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x330.google.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-2.267,
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
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm@nongnu.org,
 Joel Stanley <joel@jms.id.au>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/18/21 15:26, Cédric Le Goater wrote:
> On the AST2600, the 2nd watchdog timer can be controlled through the
> FMC controller to disable the alternate boot function. Next changes
> will map the WDT2 registers in the AST2600 FMC memory region. Add a
> container on top of the register region for this purpose.
> 
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> ---
>  include/hw/watchdog/wdt_aspeed.h | 1 +
>  hw/watchdog/wdt_aspeed.c         | 6 +++++-
>  2 files changed, 6 insertions(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

