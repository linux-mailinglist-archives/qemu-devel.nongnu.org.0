Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B713064F138
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Dec 2022 19:49:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6Fkj-0006f3-Ra; Fri, 16 Dec 2022 13:48:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1p6FkU-0006cX-Th; Fri, 16 Dec 2022 13:48:08 -0500
Received: from mail-oi1-x231.google.com ([2607:f8b0:4864:20::231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1p6FkS-0001tx-0z; Fri, 16 Dec 2022 13:47:58 -0500
Received: by mail-oi1-x231.google.com with SMTP id o66so1269503oia.6;
 Fri, 16 Dec 2022 10:47:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=gQRzxeeGfbhVYdwPvU3ZK2lJExbaMkHGX4glrPxoNmQ=;
 b=FJr+4ge/Hp8nns9zU/nrLvT6uyr41bwehhL47AW2FsMI9xtF1RKl9nl5XZ7BpXkTaq
 WAwrVHUBMZktkCjdq/zijdnsvNSyX3UvzMfbjDPWqX6Vi+4fSKjdQu0L0T6WYmoNKDd5
 R+x5OSCGXYUPuBbaxtV2cEmAXLcs80mm+E0s8t1fA9zXqRlDLGa/Zqm7iXd5WygaUBci
 HvQtWUGcxiJh/GkBq0ZKJF8NsWPtdWNEjI+88Bg/XcTfL8EgctsXlY14JijDbvLTZl/X
 j96QHv0xYB4eN8hc+gSAQlr+w97Nsrw0JqFgLcujUjhu5x498JTJOalPDCBxpKhLcjKE
 cLlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=gQRzxeeGfbhVYdwPvU3ZK2lJExbaMkHGX4glrPxoNmQ=;
 b=qRingsOsqvP1PfmaXpviY1nPQ/5pIAnV4V/ArIPxnrq7cOEun/Ryw9IjFJZV1/eEen
 jTfrst+CDDJLXkkyafv0q9u0iISeDtsrkrNOWxrRZbEV57vafoTYvPGIzxSQwbZUmyk3
 /PgLUPRF9bUjJrncDBd27JktTpjybV32GRtlKfKQPy5SXpLS1kJR8oQQfvEkKnDeDLTo
 NSHHHUIPsuBqqsM6YuBMQW1ZsAUSpSD+DWaoWSZ78D18g4V9fk7ewPXvLKGAH/2knWFQ
 95wpIOugtujsAAnAN10Fufku1SiOvGQxXlB+5t8joxl/+OX34lflIFBVrUf8/X6E8rSs
 5p0Q==
X-Gm-Message-State: AFqh2kp0VYjvfzdIkSLgfblCYl3Clmu1SkrsCiB7J3pXWMCk7K4SOgbp
 toD/UCSYxmZRxa3TGTgfOKk=
X-Google-Smtp-Source: AMrXdXtvHlIvOeI/FjSqTkckPOUp/vZg5fBTqzD+mgk/e28sbVtWcFDseCDYUP7zar0cQkaT04xJag==
X-Received: by 2002:a05:6808:2201:b0:360:d443:d9af with SMTP id
 bd1-20020a056808220100b00360d443d9afmr388060oib.8.1671216473767; 
 Fri, 16 Dec 2022 10:47:53 -0800 (PST)
Received: from [192.168.68.106] (201-43-103-101.dsl.telesp.net.br.
 [201.43.103.101]) by smtp.gmail.com with ESMTPSA id
 s4-20020a056808208400b0035c422bb303sm1052244oiw.19.2022.12.16.10.47.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Dec 2022 10:47:53 -0800 (PST)
Message-ID: <23e96668-576d-ec5d-d45d-b57941591d2c@gmail.com>
Date: Fri, 16 Dec 2022 15:47:50 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH 0/4] hw/ppc: Clean up includes
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
Cc: clg@kaod.org, qemu-ppc@nongnu.org
References: <20221210112140.4057731-1-armbru@redhat.com>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20221210112140.4057731-1-armbru@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::231;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x231.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
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



On 12/10/22 08:21, Markus Armbruster wrote:
> Back in 2016, we discussed[1] rules for headers, and these were
> generally liked:
> 
> 1. Have a carefully curated header that's included everywhere first.  We
>     got that already thanks to Peter: osdep.h.
> 
> 2. Headers should normally include everything they need beyond osdep.h.
>     If exceptions are needed for some reason, they must be documented in
>     the header.  If all that's needed from a header is typedefs, put
>     those into qemu/typedefs.h instead of including the header.
> 
> 3. Cyclic inclusion is forbidden.
> 
> After this series, include/hw/ppc and include/hw/pci-host/pnv* conform
> to these rules.
> 
> It is based on
> 
>      [PATCH 0/5] include/hw/pci include/hw/cxl: Clean up includes
>      [PATCH 0/3] block: Clean up includes
>      [PATCH 0/4] coroutine: Clean up includes
> 
> [1] Message-ID: <87h9g8j57d.fsf@blackfin.pond.sub.org>
>      https://lists.nongnu.org/archive/html/qemu-devel/2016-03/msg03345.html
> 
> Based-on: <20221209134802.3642942-1-armbru@redhat.com>
> 
> Markus Armbruster (4):
>    include/hw/ppc: Split pnv_chip.h off pnv.h
>    include/hw/ppc: Supply a few missing includes
>    include/hw/ppc: Don't include hw/pci-host/pnv_phb.h from pnv.h
>    include/hw/ppc include/hw/pci-host: Drop extra typedefs


Series:

Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>


I see this is based on "[PATCH 0/5] include/hw/pci include/hw/cxl: Clean
up includes". Feel free to queue this up in the same queue.


Thanks,

Daniel


> 
>   hw/pci-host/pnv_phb.h          |   2 +-
>   include/hw/pci-host/pnv_phb3.h |   1 -
>   include/hw/pci-host/pnv_phb4.h |   5 +-
>   include/hw/ppc/pnv.h           | 146 +-------------------------------
>   include/hw/ppc/pnv_chip.h      | 147 +++++++++++++++++++++++++++++++++
>   include/hw/ppc/pnv_core.h      |   3 +-
>   include/hw/ppc/pnv_homer.h     |   2 +-
>   include/hw/ppc/pnv_lpc.h       |  11 +--
>   include/hw/ppc/pnv_occ.h       |   3 +-
>   include/hw/ppc/pnv_pnor.h      |   2 +-
>   include/hw/ppc/pnv_sbe.h       |   3 +-
>   include/hw/ppc/pnv_xive.h      |   7 +-
>   include/hw/ppc/pnv_xscom.h     |   3 +-
>   include/hw/ppc/xive2.h         |   2 +
>   include/hw/ppc/xive2_regs.h    |   2 +
>   hw/intc/pnv_xive.c             |   1 +
>   hw/intc/pnv_xive2.c            |   1 +
>   hw/pci-host/pnv_phb3.c         |   1 +
>   hw/pci-host/pnv_phb4_pec.c     |   1 +
>   hw/ppc/pnv.c                   |   3 +
>   hw/ppc/pnv_core.c              |   1 +
>   hw/ppc/pnv_homer.c             |   1 +
>   hw/ppc/pnv_lpc.c               |   1 +
>   hw/ppc/pnv_psi.c               |   1 +
>   hw/ppc/pnv_xscom.c             |   1 +
>   25 files changed, 186 insertions(+), 165 deletions(-)
>   create mode 100644 include/hw/ppc/pnv_chip.h
> 

