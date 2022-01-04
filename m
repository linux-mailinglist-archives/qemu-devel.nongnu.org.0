Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A22F6483F87
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Jan 2022 10:58:27 +0100 (CET)
Received: from localhost ([::1]:60804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4gaI-0007X0-HN
	for lists+qemu-devel@lfdr.de; Tue, 04 Jan 2022 04:58:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43932)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n4gYi-0005VF-66; Tue, 04 Jan 2022 04:56:48 -0500
Received: from [2607:f8b0:4864:20::f35] (port=33781
 helo=mail-qv1-xf35.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n4gYg-0000tW-Ij; Tue, 04 Jan 2022 04:56:47 -0500
Received: by mail-qv1-xf35.google.com with SMTP id kk22so33854474qvb.0;
 Tue, 04 Jan 2022 01:56:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=CFiVwjOuPicgaEcwv4D8cwN2CS49Lz6CG2XfpnK2e/M=;
 b=WgLgAUV8tjfNDR4F8ctDbNWhvUzc3OwCEZOs1ZI3sg/ZnFOw/gtCQkowGHaoSvTPJs
 qdvMP4Jn1SHnu/+PkjAJ3/B8G34MZjHu2XjybfLh27aMqmeWhK/fC/ZOKkmcOQzTEtVy
 c7SJwjyIQyqj5XFgfW/7uZ77yB+stDvAoHCW9FQhD2LleUNrd16d2EU1E2ZKjMCSuyYS
 5hsALVduemjWDWcJXIVXI4q41RyRDj87Ra7LSsTICR35rQSSWJLSsmaBsFVARqs3nQzH
 3+2TJwGgGEsfph1e0T8j7oBnSFQwKkXTPivVBK+nsyD4f8/ifIZAINcCAF9UpBHnzW1i
 I1Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=CFiVwjOuPicgaEcwv4D8cwN2CS49Lz6CG2XfpnK2e/M=;
 b=qdQuD7KToB5O//sHgu+qpDIEcLwEdf4hLmT3+YTQ9aI22kcww6fNrXqrEXNQxbC4o2
 7SPJC7pT8nR+OoCplw2TYuTWpsPeT6po+GXONGlHQbxuhr2QTnmBRL9ZSzyNlJL8ES9M
 4rfeXeWo/GlLhlWjaH3nIytRAxq/pJxjYV+Fjeg2689omm9lmGcDAHiowA0kg0MSDECU
 6tPJl/MQ8pCdyWEFQRJsBvQA8E+ctnqF0ur4WLFpvwmzlxoRP1C2u2wCU0jxDpL5mhrl
 I9/jjdq/B6ACp6najo86fs+gK9dI1r3sJkbAohXMUdds4wSaqIBnKCHiTB2KU/2U1uzr
 CTjQ==
X-Gm-Message-State: AOAM530CEIHhzCnIrzouCmPFV1iAYIVd+AqXewc0GB5JYwxRb7Lwkp2A
 KIaUFYbx1MSv3A6SATuq+eI08KmCH10=
X-Google-Smtp-Source: ABdhPJzXW4BCB73A6RyzV40FXWc/152Q3cQgVGdVEsNWoIEL4Bie4eK9hHvcp6I9TsstiWrv2zpmbg==
X-Received: by 2002:a0c:e808:: with SMTP id y8mr44878395qvn.48.1641290205475; 
 Tue, 04 Jan 2022 01:56:45 -0800 (PST)
Received: from ?IPV6:2804:431:c7c7:f4d8:aa07:335f:99e0:a6e7?
 ([2804:431:c7c7:f4d8:aa07:335f:99e0:a6e7])
 by smtp.gmail.com with ESMTPSA id p67sm26984719qkf.49.2022.01.04.01.56.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Jan 2022 01:56:45 -0800 (PST)
Message-ID: <770d6df3-dff1-84b7-f6db-09f9458f6261@gmail.com>
Date: Tue, 4 Jan 2022 06:56:42 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v2 00/19] ppc/pnv: Add support for user created PHB3/PHB4
 devices
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org
References: <20211213132830.108372-1-clg@kaod.org>
 <8cc4ad78-48e9-5e01-cae8-d89f9ee8a3a1@kaod.org>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <8cc4ad78-48e9-5e01-cae8-d89f9ee8a3a1@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::f35
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::f35;
 envelope-from=danielhb413@gmail.com; helo=mail-qv1-xf35.google.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_ENVFROM_END_DIGIT=0.25,
 FREEMAIL_FROM=0.001, NICE_REPLY_A=-3.354, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Frederic Barrat <fbarrat@linux.ibm.com>, Greg Kurz <groug@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 12/15/21 13:56, Cédric Le Goater wrote:
> On 12/13/21 14:28, Cédric Le Goater wrote:
>> Hello,
>>
>> On the POWER8 processor, powernv8 machine, PHB3 devices can simply be
>> created with :
>>
>>     -device pnv-phb3,chip-id=0,index=1
>>
>> with a maximum of 3 PHB3s per chip, each PHB3 adding a new PCIe bus.
>>
>> On the POWER9 processor, powernv9 machine, the logic is different. The
>> the chip comes with 3 PHB4 PECs (PCI Express Controller) and each PEC
>> can have several PHBs :
>>
>>    * PEC0 provides 1 PHB  (PHB0)
>>    * PEC1 provides 2 PHBs (PHB1 and PHB2)
>>    * PEC2 provides 3 PHBs (PHB3, PHB4 and PHB5)
>>
>> The PEC devices can be created with :
>>
>>     -device pnv-phb4-pec,chip-id=0,index=1
>>
>> And the number of added PHB4 devices depends on the PEC index. Each
>> PHB4 adds a new PCIe bus.
>>
>> The following changes are mostly cleanups and improvements of the
>> PHB3/4 realize routines to enable support. One important change is
>> related to the way the powernv machine populates the device tree. It
>> depends on the object hierarchy and it is necessary to reparent user
>> created devices to the chip they belong to (see PATCH 5). PHB3 is a
>> little more sophisticated because of its SysBusDevice nature (see
>> PATCH 6).
>>
>> It would be preferable for libvirt and user to add one PHB4 (one PCIe
>> bus) at a time but that's another step. The plan is to merge real soon
>> the first patches which are required cleanups of the models and give
>> some more time for the last ones.
> 
> Applied patches 1-14 which are simple cleanups to ppc-next.

Did you also push patches 15-19? Or these were the ones that you decided to
discard?


Thanks,


Daniel

> 
> Thanks,
> 
> C.

