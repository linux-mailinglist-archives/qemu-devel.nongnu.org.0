Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7556C55BC2C
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Jun 2022 23:39:51 +0200 (CEST)
Received: from localhost ([::1]:39626 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o5wSU-0005cK-19
	for lists+qemu-devel@lfdr.de; Mon, 27 Jun 2022 17:39:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33886)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1o5wRV-0004qG-2r; Mon, 27 Jun 2022 17:38:49 -0400
Received: from mail-ot1-x32f.google.com ([2607:f8b0:4864:20::32f]:38528)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1o5wRT-000751-GQ; Mon, 27 Jun 2022 17:38:48 -0400
Received: by mail-ot1-x32f.google.com with SMTP id
 cb12-20020a056830618c00b00616b871cef3so6053855otb.5; 
 Mon, 27 Jun 2022 14:38:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=uZ9IsSmfXSlS5KCfJE2Ah4uS9tGmxi7NOvj6g5808Ag=;
 b=W+3tGY1tOFLYfgxZtXZkrXeXrwk3ZWI6v7kSul83JhMI7TUN5NU5I824han0rGF7DC
 5ctg/YOSO4n9Io3y35+Cg4js2dWl+AjB6O0KfxTjsE8ca5H6/RliaGharhymOrUl6wWJ
 5/Hm49WeECxmruyCs1B6ki0oZMrIGipxugAy4wDesmPPP8VXVQ8DdhZ6M6ie6AnF5Sqa
 kOiHY7GGfmXUG3d5QXRAeJbhmLaH3VEDtrBh82/tEcxsfll5s6eWDot1IGGDJJ8QvtRk
 o9DPkAtrxIbCpc0L1068uDPNcRMKohKla8rNr7TT4ZVgSjQ+up8Glgg7kpTflKqGOZ+F
 LMbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=uZ9IsSmfXSlS5KCfJE2Ah4uS9tGmxi7NOvj6g5808Ag=;
 b=1A8mXMMje5FCpOMHkZgSxRlrhEFJd//DNrkME7fKtWQTDN6uY5Wtvs9LBGbBwg1msA
 pKc9OQ3+4Fn+xHWqP2/rAwqFVdja8snPOJ9MV0eObreqMBVAyNwymuip3BEIX2cxnqMQ
 LEn6Ep/5E0lJM/ACrDSNPFlyeTHf8FuvZykJdUy1T6NPY+YYe6Ib1T1IoH9juTFb/t47
 sE+0HMTu0Fc5B2/ssxlaEsDUn7qAsoLoVqq+7W2BFUFNHGZg7RgUSvglF/9kRqJNv6ds
 YMgqkCqjci+QG9WAzGb5hIwoO2Ub5SYIVGQ2+vZ0rXqIz48FNqQ4Jap5tKEpwphKjtVB
 5FNw==
X-Gm-Message-State: AJIora82NI92wxG0qexuMKcCb7lCawyiPD2cVf6Njq43YB/JFo34A8qL
 RvxzMx8Nv/msBdSrP37vZksCK5Tkock=
X-Google-Smtp-Source: AGRyM1sZDz3WpU4noOpuHDS4+hL3FZv2UNUqZXZ9qEZQqXsBOtL339hMoGFhASNs4IUOBadmALD60Q==
X-Received: by 2002:a05:6830:1e4a:b0:616:a936:b425 with SMTP id
 e10-20020a0568301e4a00b00616a936b425mr6630680otj.229.1656365925712; 
 Mon, 27 Jun 2022 14:38:45 -0700 (PDT)
Received: from [192.168.10.102] ([191.193.1.105])
 by smtp.gmail.com with ESMTPSA id
 23-20020aca1217000000b00328c9e63389sm6012185ois.11.2022.06.27.14.38.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Jun 2022 14:38:45 -0700 (PDT)
Message-ID: <fe5ba187-7405-3291-6af6-37368dba8c35@gmail.com>
Date: Mon, 27 Jun 2022 18:38:42 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v3 0/8] pnv-phb related cleanups
Content-Language: en-US
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org, fbarrat@linux.ibm.com
References: <20220621173436.165912-1-danielhb413@gmail.com>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20220621173436.165912-1-danielhb413@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32f;
 envelope-from=danielhb413@gmail.com; helo=mail-ot1-x32f.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Queued in gitlab.com/danielhb/qemu/tree/ppc-next after fixing
the

"We're retrieving a PHB reference PHB just to access"

in the commit msg of patch 03.


Thanks,


Daniel



On 6/21/22 14:34, Daniel Henrique Barboza wrote:
> This version present changes in patch 03. We're now setting chassis and
> slot in pnv_phb_attach_root_port(), avoiding all the hassle of having to
> access the PHB object via bus->qbus.parent inside root_port_realize().
> 
> changes from v2:
> - patch 03:
>    - set chassis and slot outside of root_port_realize()
> - former patch 04 ("use dev instead of pci->qdev in root_port_realize()"):
>    - dropped due to changes in patch 03
> - v2 link: https://lists.gnu.org/archive/html/qemu-devel/2022-06/msg03177.html
> 
> Daniel Henrique Barboza (8):
>    ppc/pnv: move root port attach to pnv_phb4_realize()
>    ppc/pnv: attach phb3/phb4 root ports in QOM tree
>    ppc/pnv: assign pnv-phb-root-port chassis/slot earlier
>    ppc/pnv: make pnv_ics_get() use the chip8->phbs[] array
>    ppc/pnv: make pnv_ics_resend() use chip8->phbs[]
>    ppc/pnv: make pnv_chip_power8_pic_print_info() use chip8->phbs[]
>    ppc/pnv: remove 'INTERFACE_PCIE_DEVICE' from phb3 root bus
>    ppc/pnv: remove 'INTERFACE_PCIE_DEVICE' from phb4 root bus
> 
>   hw/pci-host/pnv_phb3.c     |  22 +-------
>   hw/pci-host/pnv_phb4.c     |  24 ++-------
>   hw/pci-host/pnv_phb4_pec.c |   3 --
>   hw/ppc/pnv.c               | 102 ++++++++++++++++---------------------
>   include/hw/ppc/pnv.h       |   3 +-
>   5 files changed, 54 insertions(+), 100 deletions(-)
> 

