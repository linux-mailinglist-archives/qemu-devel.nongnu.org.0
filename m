Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C764553BDA6
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Jun 2022 19:56:24 +0200 (CEST)
Received: from localhost ([::1]:52306 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nwp3X-0003Ko-D0
	for lists+qemu-devel@lfdr.de; Thu, 02 Jun 2022 13:56:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48426)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nwp1F-0002QJ-Af; Thu, 02 Jun 2022 13:54:01 -0400
Received: from mail-oo1-xc2b.google.com ([2607:f8b0:4864:20::c2b]:41952)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nwp19-0003Ml-Lg; Thu, 02 Jun 2022 13:54:01 -0400
Received: by mail-oo1-xc2b.google.com with SMTP id
 s4-20020a4ac804000000b0040e93a35508so1032088ooq.8; 
 Thu, 02 Jun 2022 10:53:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=mW1OL3g4UcetIzr++LJ2ieXJRqwif+8iSOWbuSUim8g=;
 b=OkqQBA2Ll01nasAtCM33lWzmYmNdnCvw8wlsew3LG4I+rGsGxrKGxm2antQyJSP5++
 705d2Gw+jIMkTwcr1aBkPr77sKa7YW/UGTsJrVlLe9cjdTNaeGfZpaxIVBaTIhwLyWsn
 Xo8Jq3q9//PRLIL5SYVNbUCbbU6ZmbNL/OYNlTL7FacVr2Vxwov+HJlqnEOpILZuJVcR
 0u8004p38aRn7redsf+Jqqm+59vjSbP56OwzbZ30z+5FIToGicO9Lx/b1maUTuY29gPt
 g0kyZVCFdaCxjF9EhUd5TnCjhrnCJAGCeF4RhLEzULDM83emWlszSz+Ot07NwG2sc0fx
 H1eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=mW1OL3g4UcetIzr++LJ2ieXJRqwif+8iSOWbuSUim8g=;
 b=g/goVGPAKUiUSWc8E8U6DZc9YuW72rJfA31L3DlsWqPBsu6pptDIyfsUrgwLtEtOm2
 O3JSbhycwD9x8j14d3nCXtK0G1poIlaPxMMIi0r/w2YCg4+TZbT2YXztCyKMTxNmBTvw
 Cia1P9J8wi3G9bw/0VIR5dJvQb9he4pA6zJT9awrTwmGR0NG2nR+SowNAZmgvqAOGEkY
 +vl6bc25Wp4dnSV+ZuN8UDPhSN/fEMcMWBr6URdBKZ16qHykltRIMpLO6VCpDpuT29Il
 TXo7xBN7vetcxnNk6a/LDBs/+hcG3hCHQkP8s2L+q1RWOHbSoA6J2cttjDF7Wg0FU/bO
 T1Tw==
X-Gm-Message-State: AOAM530K3nVeqp6hxsouAPgDiGp1cI5QN/m9MMMyPI2e9oOa5nX/NxLv
 EY4bnDKF9zQbaRD4bYb37Vk=
X-Google-Smtp-Source: ABdhPJyjyLGx+b8lLgUdEUdggfPyh5kxO/1QXx27eWJwFscChXGBzVPjFgvi7Uys69e9IzlVW/Fv3A==
X-Received: by 2002:a4a:b401:0:b0:35e:de93:43a9 with SMTP id
 y1-20020a4ab401000000b0035ede9343a9mr2576465oon.80.1654192434048; 
 Thu, 02 Jun 2022 10:53:54 -0700 (PDT)
Received: from [192.168.10.102] ([152.250.93.219])
 by smtp.gmail.com with ESMTPSA id
 k21-20020a9d7015000000b0060b0ee6685csm2451409otj.33.2022.06.02.10.53.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Jun 2022 10:53:53 -0700 (PDT)
Message-ID: <bc3e70ad-94d6-34ff-d6f2-5f21fff70055@gmail.com>
Date: Thu, 2 Jun 2022 14:53:50 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH] pnv/xive2: Access direct mapped thread contexts from all
 chips
Content-Language: en-US
To: Frederic Barrat <fbarrat@linux.ibm.com>, =?UTF-8?Q?C=c3=a9dric_Le_Goater?=
 <clg@kaod.org>, qemu-ppc@nongnu.org, qemu-devel@nongnu.org
References: <20220602165310.558810-1-fbarrat@linux.ibm.com>
 <3f4bbf08-36b0-170b-2166-be1cda6888b1@kaod.org>
 <9af5aa25-6a32-6144-497d-2215187a96e2@linux.ibm.com>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <9af5aa25-6a32-6144-497d-2215187a96e2@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c2b;
 envelope-from=danielhb413@gmail.com; helo=mail-oo1-xc2b.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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



On 6/2/22 14:06, Frederic Barrat wrote:
> 
> 
> On 02/06/2022 19:00, Cédric Le Goater wrote:
>> On 6/2/22 18:53, Frederic Barrat wrote:
>>> When accessing a thread context through the IC BAR, the offset of the
>>> page in the BAR identifies the CPU. From that offset, we can compute
>>> the PIR (processor ID register) of the CPU to do the data structure
>>> lookup. On P10, the current code assumes an access for node 0 when
>>> computing the PIR. Everything is almost in place to allow access for
>>> other nodes though. So this patch reworks how the PIR value is
>>> computed so that we can access all thread contexts through the IC BAR.
>>>
>>> The PIR is already correct on P9, so no need to modify anything there.
>>>
>>> Signed-off-by: Frederic Barrat <fbarrat@linux.ibm.com>
>>
>> Reviewed-by: Cédric Le Goater <clg@kaod.org>
>>
>> Is that a P10 bug ? If so, a fixes tag is needed.
> 
> 
> Fixes: da71b7e3ed45 ("ppc/pnv: Add a XIVE2 controller to the POWER10 chip")
> 
> Daniel, good enough or you prefer a resend?

I can fixup the tag, don't worry about it.


Daniel

> 
>    Fred

