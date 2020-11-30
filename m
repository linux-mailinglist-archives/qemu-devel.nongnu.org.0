Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 468442C83F0
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Nov 2020 13:14:21 +0100 (CET)
Received: from localhost ([::1]:60622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kji4S-0005EA-CM
	for lists+qemu-devel@lfdr.de; Mon, 30 Nov 2020 07:14:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47332)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kji3O-0004o0-5l
 for qemu-devel@nongnu.org; Mon, 30 Nov 2020 07:13:14 -0500
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:35086)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kji3M-0006ag-El
 for qemu-devel@nongnu.org; Mon, 30 Nov 2020 07:13:13 -0500
Received: by mail-wr1-x441.google.com with SMTP id r3so15906685wrt.2
 for <qemu-devel@nongnu.org>; Mon, 30 Nov 2020 04:13:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ZnwKfIqta+HRHIF5CSNCp6o5+wdXuZ0AS7HZ+QIUxs0=;
 b=e940R5UpSORXZvcXbc+FaYm+diFSeVzukmOVakOudqE6j/UKOLb8ZDmAWW5t8FXTHa
 5oVg6uXEuAzlhspIPLAIh5gEp/RDIb/hzEYUvXckCJa2t3YGy5A/3V/ysg4ttu4XcpFs
 qR564RqO0o/UtG4q3qAPDuwnMg/ta64V/MpA6Rwr1Ck2oPaxIGMWIbTyVGvio0OmYjXh
 Jb3kwQszeAMQuhfFjmbBh/IjS3BM+vcQ9alXJtg8JpQFXfvvGJVOMv69rQLE26XAqQg2
 X9Mmzk53mYODgaNaeFgck/BEjHJ5sksRc9E69Z81YD3glHp1ooEJcQR+ALA6fdVN/uTz
 1DCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ZnwKfIqta+HRHIF5CSNCp6o5+wdXuZ0AS7HZ+QIUxs0=;
 b=V2ArA6xLz/5R0+DigbvU56ULeuUdGjYLilU7UFu5fMAdejldjTEO1P7J/TatkoFI3A
 vnYEzymqz/2zl7cC+9vZAllAwKsfysnDST0DVzhbJQ/JGaQWysKE+AhVu1TuPQ2aDapU
 6v1KoLANejVnfvkoi1P2/IPIijvgcaE+zjHvEruoMrQI7up6EK8zJxM0PPBFCEfXAk7Q
 BtrJNKJB1mYeYLEHPmIMYyR4gqd4qUlexSW2qHIzurWvhTcO9WsSWtPljazFcKcX6J1Q
 GRAfz4Lo1piCgRKJgVeMu8AN4MvZmUlRny0DrvCtE/mYgxJFuOfKqwYyUTSMFfsuiuP+
 vhkg==
X-Gm-Message-State: AOAM531YqCqUuZBjRuGnQBoBdb8IbKKwSn/LDQv5iHdxv74wqn109v+n
 CeGz6vAseQum9k9xgLmtgU8=
X-Google-Smtp-Source: ABdhPJz7ttQ6MG187gJ15jibAaS+1XwY8dtsdo1XMi448IloIWnR+vwaHm8Y6QsL6W7XpIcdrF2IrQ==
X-Received: by 2002:adf:e54f:: with SMTP id z15mr28545008wrm.159.1606738390874; 
 Mon, 30 Nov 2020 04:13:10 -0800 (PST)
Received: from [192.168.1.36] (111.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.111])
 by smtp.gmail.com with ESMTPSA id c2sm28645232wrf.68.2020.11.30.04.13.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Nov 2020 04:13:10 -0800 (PST)
Subject: Re: [PATCH v2 1/3] target/nios2: Move IIC code into CPU object proper
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20201129174022.26530-1-peter.maydell@linaro.org>
 <20201129174022.26530-2-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <6ac9a9b2-f8f9-2437-c4f1-953b8c66729d@amsat.org>
Date: Mon, 30 Nov 2020 13:13:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201129174022.26530-2-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::441;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x441.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
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
Cc: Marek Vasut <marex@denx.de>, Sandra Loosemore <sandra@codesourcery.com>,
 Chris Wulff <crwulff@gmail.com>, Wentong Wu <wentong.wu@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/29/20 6:40 PM, Peter Maydell wrote:
> The Nios2 architecture supports two different interrupt controller
> options:
> 
>  * The IIC (Internal Interrupt Controller) is part of the CPU itself;
>    it has 32 IRQ input lines and no NMI support.  Interrupt status is
>    queried and controlled via the CPU's ipending and istatus
>    registers.
> 
>  * The EIC (External Interrupt Controller) interface allows the CPU
>    to connect to an external interrupt controller.  The interface
>    allows the interrupt controller to present a packet of information
>    containing:
>     - handler address
>     - interrupt level
>     - register set
>     - NMI mode
> 
> QEMU does not model an EIC currently.  We do model the IIC, but its
> implementation is split across code in hw/nios2/cpu_pic.c and
> hw/intc/nios2_iic.c.  The code in those two files has no state of its
> own -- the IIC state is in the Nios2CPU state struct.
> 
> Because CPU objects now inherit (indirectly) from TYPE_DEVICE, they
> can have GPIO input lines themselves, so we can implement the IIC
> directly in the CPU object the same way that real hardware does.
> 
> Create named "IRQ" GPIO inputs to the Nios2 CPU object, and make the
> only user of the IIC wire up directly to those instead.
> 
> Note that the old code had an "NMI" concept which was entirely unused
> and also as far as I can see not architecturally correct, since only
> the EIC has a concept of an NMI.
> 
> This fixes a Coverity-reported trivial memory leak of the IRQ array
> allocated in nios2_cpu_pic_init().
> 
> Fixes: Coverity CID 1421916
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/nios2/cpu.h        |  1 -
>  hw/intc/nios2_iic.c       | 95 ---------------------------------------
>  hw/nios2/10m50_devboard.c | 13 +-----
>  hw/nios2/cpu_pic.c        | 31 -------------
>  target/nios2/cpu.c        | 30 +++++++++++++
>  MAINTAINERS               |  1 -
>  hw/intc/meson.build       |  1 -
>  7 files changed, 32 insertions(+), 140 deletions(-)
>  delete mode 100644 hw/intc/nios2_iic.c

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

