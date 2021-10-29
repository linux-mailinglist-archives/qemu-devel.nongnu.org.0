Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98A3E44057D
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Oct 2021 00:29:44 +0200 (CEST)
Received: from localhost ([::1]:40072 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgaNb-0004dR-PL
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 18:29:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40028)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mgaMC-0003Qf-RD
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 18:28:16 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:35822)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mgaM9-00037r-Th
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 18:28:15 -0400
Received: by mail-wr1-x430.google.com with SMTP id i5so11275949wrb.2
 for <qemu-devel@nongnu.org>; Fri, 29 Oct 2021 15:28:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=6CgXlEMHLDtyRDC2oT8E1sPJX+R8cLIZSfNPymdfOAM=;
 b=dLjP5ByJvrzHjBLAsg7mzUVME1MVx7KhHYVZIJ8iFfVvuKPnOH1tVvh0FLb3DTKzKH
 7ZLvGtSt7tP3TUlW47kJddAy1KYW+uwBN328zRQ+YKRdA+rTmleRBcpyJfMynjGJ2hVI
 wgUd7fPhFzZ5VJz+62dJBEGZh2fZS1xPFn8kFpblCp5mAD3huxNs/PTMPuQ9yCUEydJi
 oSI41uE1ueSJMSnxPA7sDus1wPK9nEJsEHHf/gAfFZzuRIRItnonCve5LQxFhuOzEz8g
 +ztIrSEKUbbo+yNzxd7bxAGYmQcq3w0S4OvxVFxusyHklKi7rdQN0BxLXauKBrnBZe6q
 MzpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=6CgXlEMHLDtyRDC2oT8E1sPJX+R8cLIZSfNPymdfOAM=;
 b=Zo45HWgMOeSTktUycTTvYsenuE5O/vEvq6FWwYchsnaKHbhWuzxC+JY4cIin7znfAL
 PXbisdYb724Gmgk9C59OjbUqMBrlkm155wZYvWR6ZFsXqKYaU1bAxhcGaZdAaa3pYNr4
 vaiAdYMJT4og/waDtgAvU470yvYxuQaaxEdJMaKknCB4GU/+ddbjQDFrM67UVl0tePW2
 EID/0VgySElM6GTS3/Nl4rK7Pa6jYyYIzZT+KX5lIGrYzx71PaqBmYsg1XE5L/UhDzGx
 9ZpIdd/ybk7jlZ7K9v6QUkNw46+i5YIPyqFtnFJI0rNSooaZs/WWr5s/QAEuwoyi5eQo
 qmiA==
X-Gm-Message-State: AOAM532KEVnWOw9rozTwKcLZG4uS5u5i0K0tl/cQ7hKCOyRytgFT+O+w
 QtOnAewDh4YmeCzixdH7QMo=
X-Google-Smtp-Source: ABdhPJxL/Mvfl9HazT1SbhF54jVHzZbMP9x5K6hH0Klv+q/5TgZfG3N7VkQKOHHXRKYHCsgHhk8Svw==
X-Received: by 2002:a7b:cb10:: with SMTP id u16mr22278246wmj.65.1635546492503; 
 Fri, 29 Oct 2021 15:28:12 -0700 (PDT)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id n68sm9713851wmn.13.2021.10.29.15.28.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Oct 2021 15:28:11 -0700 (PDT)
Message-ID: <837e1359-6595-71eb-0618-05faded30b19@amsat.org>
Date: Sat, 30 Oct 2021 00:28:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v6 26/30] hw/intc/sh_intc: Remove unneeded local variable
 initialisers
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org
References: <cover.1635541329.git.balaton@eik.bme.hu>
 <15e04aa665c68ab5df47bbf505346d413be2fc1c.1635541329.git.balaton@eik.bme.hu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <15e04aa665c68ab5df47bbf505346d413be2fc1c.1635541329.git.balaton@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x430.google.com
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
> The sh_intc_locate function will either init these or not return so no
> need to initialise them.
> 
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> ---
>  hw/intc/sh_intc.c | 21 ++++++++++-----------
>  1 file changed, 10 insertions(+), 11 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

