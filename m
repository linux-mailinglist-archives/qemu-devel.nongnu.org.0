Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56C6B68BEF1
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Feb 2023 14:53:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pP1vB-0004q1-ET; Mon, 06 Feb 2023 08:52:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1pP1v6-0004pO-3y; Mon, 06 Feb 2023 08:52:32 -0500
Received: from mail-oi1-x22b.google.com ([2607:f8b0:4864:20::22b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1pP1v4-0007cg-40; Mon, 06 Feb 2023 08:52:31 -0500
Received: by mail-oi1-x22b.google.com with SMTP id dt8so9795541oib.0;
 Mon, 06 Feb 2023 05:52:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=f6ougZy2q5LQM7mxinoK/6XmcCLYkvATzco5tCsZAm4=;
 b=hQR/D337tFIF3W61FQAmh7m6Nb3YzZQrmTdtbg6HpGOCZlsfBL9iUa9qEk6XwjI/ZS
 kMaV9tkybh037rn19oOddXBRJh29cnO6tGWr93/cT/2gz4jKS0ZevKMdpyI0/Xt640wq
 W/0GorvgIEoHiEUVgAYCXsAVNBjcKKDTf1985SxisAU5ZY7T24Ow3JjuiUvJ/K6ybtpq
 bHaIliMg8COemJ+8X6h/8HtIYgqmB6LnaU1xxq1d6Q7NJglE+z7/Ug2+dDAJV1YGW+Df
 sjp9F8etK/IHwFjUMbNu0TSPdeavtLLhQwKg0IsG2cHjM8YX/Vp8hYwGj0//GsSh8BU0
 7bvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=f6ougZy2q5LQM7mxinoK/6XmcCLYkvATzco5tCsZAm4=;
 b=w4BrjcbWQQw95kr6W1qbkZMMG5CvVstGPlOUQZ5gY9KDWl3QqtsJco3Y22xQDPi5yU
 ABas94VLLRBqRbjjemKuPXD9+DIuLl97crT+vfvMbfnL6NTDPDHTO6L5jJ/J9F81Yqf1
 IKqrkMn2MVdSSHz3VxfYoVlNbNuTqtLQ4Qj7sNpyZfDj1qOYRFb6ZHvqTwxYeoE93CZw
 0bCAIcHTI7KLWsFNn3OgjYKnOQyWDWh61QDKo4UqjZgVBe+1DFDYsMSMRiaZf9EgbLkl
 mj7DfUDI4S5kmf08GJVDzo68LwdZw0ssduCzW623jWmduq2WHagUffREa0qQFDrpVNaJ
 mKag==
X-Gm-Message-State: AO0yUKV6pJjnOSKc/9C4VBngc8E2kr7sK8xocsJoSz7utocWnmNBjOOY
 7K5wXM6fx+4sbf5nCW3mT3Q=
X-Google-Smtp-Source: AK7set+7PaeLpDrqrsGOuQ4x66T/7dZoJyPeuyKkjfTKhQjeZks7JZMvK/DI46kupZx+K4n4xmkPIg==
X-Received: by 2002:a05:6808:154:b0:378:9cb:402b with SMTP id
 h20-20020a056808015400b0037809cb402bmr9064303oie.40.1675691548201; 
 Mon, 06 Feb 2023 05:52:28 -0800 (PST)
Received: from [192.168.68.107] ([191.19.125.138])
 by smtp.gmail.com with ESMTPSA id
 z25-20020a056808065900b00378a160bc87sm4114878oih.53.2023.02.06.05.52.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Feb 2023 05:52:27 -0800 (PST)
Message-ID: <fd92c7f5-7ae5-993e-1487-7394f1294532@gmail.com>
Date: Mon, 6 Feb 2023 10:52:23 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 0/5] hw/ppc: Set QDev properties using QDev API (part 2/3)
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: BALATON Zoltan <balaton@eik.bme.hu>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-ppc@nongnu.org,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Markus Armbruster <armbru@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>
References: <20230203211623.50930-1-philmd@linaro.org>
 <0b763708-6a54-b789-1bbf-56c1c7ce708b@kaod.org>
Content-Language: en-US
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <0b763708-6a54-b789-1bbf-56c1c7ce708b@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22b;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x22b.google.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-1.148,
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



On 2/6/23 05:00, Cédric Le Goater wrote:
> On 2/3/23 22:16, Philippe Mathieu-Daudé wrote:
>> part 1 [*] cover:
>> -- 
>> QEMU provides the QOM API for core objects.
>> Devices are modelled on top of QOM as QDev objects.
>>
>> There is no point in using the lower level QOM API with
>> QDev; it makes the code more complex and harder to review.
>>
>> I first converted all the calls using errp=&error_abort or
>> &errp=NULL, then noticed the other uses weren't really
>> consistent.
> 
> 6/8 years ago, we converted models to QOM, supposedly because the qdev
> interface was legacy and QOM was the new way. That's not true anymore ?
> 
> That said, I am ok with changes, even for the best practices. I would
> like to know how to keep track. Do we have a model skeleton/reference ?

I second all that.

Last year we spent a considerable amount of time figuring out how to properly use
QOM in the pnv-phb controller, with a lot of code juggling to avoid using qdev
directly. And it's not like we were doing something that was novel - the core
hw/pci/pci.c files are filled with examples such as:

host_bridge = PCI_HOST_BRIDGE(rootbus->qbus.parent);

And this particular example (not accessing qbus.parent to get the parent bus) led
to *a lot* of QOM code being added to allow the pnv_phb_root_port to access the
parent bus because "you shouldn't access qdev in that way".

After all that, reading "There is no point in using the lower level QOM API
with QDev; it makes the code more complex and harder to review." is funny. I
know that there might be some nuance that I'm not aware of, and in the end
what we did last year and what Phil is doing today are both steps in the
same direction, but ATM this is confusing to me.

As Cedric said, I believe we should had a document laying out in a clear way when
it is OK to use QDEV APIs and when it is OK to use QOM APIs. It would also be nice
to document these (apparently) deprecated uses of these APIs that the core classes
are doing.


Thanks,

Daniel



> 
> Thanks,
> 
> C.
> 
>> A QDev property defined with the DEFINE_PROP_xxx() macros
>> is always available, thus can't fail. When using hot-plug
>> devices, we only need to check for optional properties
>> registered at runtime with the object_property_add_XXX()
>> API. Some are even always registered in device instance_init.
>> -- 
>>
>> In this series PPC hw is converted. Only one call site in PNV
>> forwards the Error* argument and its conversion is justified.
>>
>> Based-on: <20230203180914.49112-1-philmd@linaro.org>
>> (in particular [PATCH 02/19] hw/qdev: Introduce qdev_prop_set_link():
>>   https://lore.kernel.org/qemu-devel/20230203180914.49112-3-philmd@linaro.org/)
>>
>> [*] https://lore.kernel.org/qemu-devel/20230203180914.49112-1-philmd@linaro.org/
>>
>> Philippe Mathieu-Daudé (5):
>>    hw/misc/macio: Set QDev properties using QDev API
>>    hw/pci-host/raven: Set QDev properties using QDev API
>>    hw/ppc/ppc4xx: Set QDev properties using QDev API
>>    hw/ppc/spapr: Set QDev properties using QDev API
>>    hw/ppc/pnv: Set QDev properties using QDev API
>>
>>   hw/intc/pnv_xive.c         | 11 ++++------
>>   hw/intc/pnv_xive2.c        | 15 +++++---------
>>   hw/intc/spapr_xive.c       | 11 ++++------
>>   hw/intc/xics.c             |  4 ++--
>>   hw/intc/xive.c             |  4 ++--
>>   hw/misc/macio/macio.c      |  6 ++----
>>   hw/pci-host/pnv_phb3.c     |  9 +++------
>>   hw/pci-host/pnv_phb4.c     |  4 ++--
>>   hw/pci-host/pnv_phb4_pec.c | 10 +++-------
>>   hw/pci-host/raven.c        |  6 ++----
>>   hw/ppc/e500.c              |  3 +--
>>   hw/ppc/pnv.c               | 41 ++++++++++++++++----------------------
>>   hw/ppc/pnv_psi.c           | 10 +++-------
>>   hw/ppc/ppc405_boards.c     |  6 ++----
>>   hw/ppc/ppc405_uc.c         |  6 +++---
>>   hw/ppc/ppc440_bamboo.c     |  3 +--
>>   hw/ppc/ppc4xx_devs.c       |  2 +-
>>   hw/ppc/sam460ex.c          |  5 ++---
>>   hw/ppc/spapr_irq.c         |  8 +++-----
>>   19 files changed, 62 insertions(+), 102 deletions(-)
>>
> 

