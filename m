Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14844441ADF
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Nov 2021 12:49:07 +0100 (CET)
Received: from localhost ([::1]:53042 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhVoH-0005l8-4Y
	for lists+qemu-devel@lfdr.de; Mon, 01 Nov 2021 07:49:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55278)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mhVkm-0003zt-5A
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 07:45:28 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:41924)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mhVkj-0002Da-RZ
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 07:45:27 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 f7-20020a1c1f07000000b0032ee11917ceso7817669wmf.0
 for <qemu-devel@nongnu.org>; Mon, 01 Nov 2021 04:45:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=FD/tvg+EfqHoECSKNkICcsDkai0K76a+FteubZf4h6c=;
 b=itP+967NEHFZaYC/zKyYRkibBIfu8bppjo0vfTa0iIqljpqlYF0Q2Vf3TN/TApyX5H
 cutXSPVVvSCB0VwZN/rISCfbLdeKv5eUc7rZydA9V9/Vgu3Hmd8p50XJXxxkoljKT/ZW
 BgKc/iFa5DNS4dKDRBZCPiLI7btPWz1UmQCPCiQL0Voy8PNPnLNe/ILE3skCxaqZbdvV
 tkz+oAf7wzbrJWjQ3KhcN4uj/Nitina0bHIZKvHBQ+twc7gMaZMLmHq1Q+MmWTOmeqvN
 3lEXff2k4zKqX6R6DgMiE31nntOaJWxDHyFsNangzEumjzC65/cEUlb7Qi94dsSQHfCq
 +F4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=FD/tvg+EfqHoECSKNkICcsDkai0K76a+FteubZf4h6c=;
 b=qRwTFeKPg/87Gj8aZfssrQyUPRtpziAlv7dnvtAZynmy7SzwcNEbou38xu1jP7m2Lm
 cjTaGuGC6obSFRrNc/IOD2LlW/RfOBqtXNi8XO/ptE4xzjOLWLc/1DjjW2WWVMQO2S50
 chqcvpJ+jWYYl+EuCZ3zreA+6S/nn//ird+OczV8FIoS4hHcgJ2nXAIbGoMLecpzlpGY
 yzuQ0hy8kzwIw4CRDFX14/0MmgiF4j0IUV6pKHefcixK+EwoM//jZqPjbPGJOzVcfk1J
 HUIBtME/1Vxfo/01llMDDX4KXF2swRG9hHMhn8O8BgiAMlYgAU1f+KE1LvX8FFjKdqte
 3zPQ==
X-Gm-Message-State: AOAM530Lh2QTYSYQwf07L8Z3JBluLAB17b7CvzGmWCJt7crfKhMJUwJf
 yhJMc3mpuVB3Y+xxjnZmnliZhMGlFMs=
X-Google-Smtp-Source: ABdhPJyqvhU6qPQVwutdtICg7xM7kb3vFJfeikNRl0PCwmopmfoBIXW4Wo2dm2HTl8pdI+5d8g5vbA==
X-Received: by 2002:a05:600c:4303:: with SMTP id
 p3mr28209005wme.128.1635767124371; 
 Mon, 01 Nov 2021 04:45:24 -0700 (PDT)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id n66sm12288489wmn.2.2021.11.01.04.45.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Nov 2021 04:45:23 -0700 (PDT)
Message-ID: <b127f285-0ba2-6548-c366-ff74ca19ff4a@amsat.org>
Date: Mon, 1 Nov 2021 12:45:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v2 0/4] MAINTAINERS: Sanitize 'MIPS TCG CPUs' section
Content-Language: en-US
To: qemu-devel@nongnu.org
References: <20211027041416.1237433-1-f4bug@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20211027041416.1237433-1-f4bug@amsat.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x330.google.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-1.14,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Paul Burton <paulburton@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/27/21 06:14, Philippe Mathieu-Daudé wrote:
> Move various files unrelated to MIPS TCG frontend into
> new sections.
> 
> Since v1:
> - Do not add Paul without his consent
> - un-deprecate nanoMIPS
> 
> Philippe Mathieu-Daudé (4):
>   MAINTAINERS: Add MIPS general architecture support entry
>   MAINTAINERS: Add entries to cover MIPS CPS / GIC hardware
>   MAINTAINERS: Split MIPS TCG frontend vs MIPS machines/hardware

Patches 1-3 queued to mips-next.

