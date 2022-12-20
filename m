Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B88BB651FD5
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Dec 2022 12:40:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7atR-0003vr-GT; Tue, 20 Dec 2022 06:34:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1p7atC-0003r5-JK; Tue, 20 Dec 2022 06:34:37 -0500
Received: from mail-oa1-x36.google.com ([2001:4860:4864:20::36])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1p7at9-0007v0-JC; Tue, 20 Dec 2022 06:34:30 -0500
Received: by mail-oa1-x36.google.com with SMTP id
 586e51a60fabf-1445ca00781so15079612fac.1; 
 Tue, 20 Dec 2022 03:34:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=37hD4bNlkDwxByXx2PZHCm7fmHjRGBiEiS+O/Y3EvIo=;
 b=YTzeCJ4TZIkfrQQSZO7ysNnArbIQWm7he+jK4362mbzRoJ1yiAAj3PF+/vTDCpK1wr
 25p1f+3DYdN0fNS+2gicATQkNKfeL2ZEftSfWHkF5sL/zBSHsaN/tTzzykHkOWjV8Xm6
 rnGClfZcJiUyl9mvl/QNtDbEHku0jiTDo+FzVexnRf8hGRmwZQ0/JuuN7HRDSZ9jTzhf
 EUCdx6To5vH3w76hHL118ArC3CdGEF7ieSi+ev26U3PNi3ZTmCrs6yUek9vq4adhRtK6
 XTnwiWGUwqtLT2ls4I19tLrcpRsi7xE4Rt6aMUGagdRRMor3heh/9nPGdEqrgOqB8ZSo
 91tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=37hD4bNlkDwxByXx2PZHCm7fmHjRGBiEiS+O/Y3EvIo=;
 b=vFHYYkREwPUyR4N3KbmD5SXgUxxE+6DaCB37ivbwKGNgUQlFZwywhmybPcphNdhYDv
 TVKjKNxV78BoUN+GsU/LZTt08ZvCnetMk02O8bR6vFi9GYe4w3+CPWr1UR+Rwh2si0VQ
 wRP05ZMn/put8Snah8LV1qNNYqzA7s0RP+AQ7IMWb4qJsCDJym28n4EOjyfHoLPOHBOz
 v+oKFN2uSWHOpRxfYbX+FQB+p8u+JU5AgByAG4zLx9emOr8IIKYSJm4q3rma0x1QBwQl
 9rL2+rvevZrE01/bzDGKxbzIaYgR1Xs+Wdyu/ymh0b+MDv0GL5U/seROVLVjjoGBfMT2
 N0jw==
X-Gm-Message-State: AFqh2kru7/A4n6c58B6VOOgmjI4kkCw3zXm8Hb7SmXat2YCoMHGRznKj
 l5fGOZzpqjfYz01faeXPh8w=
X-Google-Smtp-Source: AMrXdXtEptCaOIVtSFZoehTnONkwYD2OuusQGknbaVKrbCtkoIramrJsUFJbONcDntkLxDF5kgBcnA==
X-Received: by 2002:a05:6870:588:b0:14b:c93f:ebc0 with SMTP id
 m8-20020a056870058800b0014bc93febc0mr5653074oap.4.1671536065732; 
 Tue, 20 Dec 2022 03:34:25 -0800 (PST)
Received: from [192.168.68.106] (201-43-103-101.dsl.telesp.net.br.
 [201.43.103.101]) by smtp.gmail.com with ESMTPSA id
 i6-20020a056870c1c600b00144e18d8525sm5883201oad.25.2022.12.20.03.34.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Dec 2022 03:34:25 -0800 (PST)
Message-ID: <155f3600-8bbd-b150-7b19-8fd4eaaf9f2c@gmail.com>
Date: Tue, 20 Dec 2022 08:34:22 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v3 0/2] target/ppc: Implement Dynamic Execution Control
 Registers
Content-Language: en-US
To: Nicholas Miehlbradt <nicholas@linux.ibm.com>, qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org, david@gibson.dropbear.id.au,
 groug@kaod.org, victor.colombo@eldorado.org.br
References: <20221220042330.2387944-1-nicholas@linux.ibm.com>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20221220042330.2387944-1-nicholas@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2001:4860:4864:20::36;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x36.google.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-1.161,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Queued in gitlab.com/danielhb/qemu/tree/ppc-next. Thanks,


Daniel

On 12/20/22 01:23, Nicholas Miehlbradt wrote:
> Implements the Dynamic Execution Control Register (DEXCR) and the
> Hypervisor Dynamic Execution Control Register (HDEXCR) in TCG as
> defined in Power ISA 3.1B. Only aspects 5 (Non-privileged hash instruction
> enable) and 6 (Privileged hash instruction enable) have architectural
> effects. Other aspects can be manipulated but have no effect on execution.
> 
> Adds checks to these registers in the hashst and hashchk instructions so
> that they are executed as nops when not enabled.
> 
> There is currently an RFC for the kernel interface for the DEXCR on the
> Linux PPC mailing list:
> https://lore.kernel.org/linuxppc-dev/20221128024458.46121-1-bgray@linux.ibm.com/
> 
> v3:
>   - Fix typos
> 
> v2:
>   - Clearing of upper 32 bits of userspace registers is now performed on
>     register read rather than register write.
> 
> Nicholas Miehlbradt (2):
>    target/ppc: Implement the DEXCR and HDEXCR
>    target/ppc: Check DEXCR on hash{st, chk} instructions
> 
>   target/ppc/cpu.h         | 19 +++++++++++++
>   target/ppc/cpu_init.c    | 25 +++++++++++++++++
>   target/ppc/excp_helper.c | 58 +++++++++++++++++++++++++++++-----------
>   target/ppc/spr_common.h  |  1 +
>   target/ppc/translate.c   | 19 +++++++++++++
>   5 files changed, 107 insertions(+), 15 deletions(-)
> 

