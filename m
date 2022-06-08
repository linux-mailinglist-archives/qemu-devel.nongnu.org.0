Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 43D93543D87
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Jun 2022 22:24:58 +0200 (CEST)
Received: from localhost ([::1]:48904 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nz2Ea-0005t8-PJ
	for lists+qemu-devel@lfdr.de; Wed, 08 Jun 2022 16:24:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48154)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nz2CM-0004bR-4p; Wed, 08 Jun 2022 16:22:38 -0400
Received: from mail-oa1-x2c.google.com ([2001:4860:4864:20::2c]:35460)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nz2CK-0006VR-Ff; Wed, 08 Jun 2022 16:22:37 -0400
Received: by mail-oa1-x2c.google.com with SMTP id
 586e51a60fabf-f16a3e0529so28693279fac.2; 
 Wed, 08 Jun 2022 13:22:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=Cm1N737UB1pI7WtpuFkb+ivRdyWy3TDPTkpLHSy5Lgs=;
 b=kv6GuOBHJXNmYVBEiNOBMGf8dJcN2HRmZ4RSeW+aP1copWJHl/c15/ha4qs0SUmF/8
 UAuEOnh+tyQKp1TQtXvBOe8nEafT03gQBx3Dd/mQ9/oQpL8nOZXRD8kTwQEhVUCdZwvn
 3Dzw9K/k7b23QBqZxhwPXWtNeF8EoyJYMuXYzI+sVtyjIfABkD4/gM52YWtvgimwdcCZ
 N6vHYv5txdpPKtGefTS9uKTK2pRuNDMQQTgrmkd62tI8mf6gcDSwjSyYl1sYUYhydOPq
 91Mr/M5tQHTWpXqzqHF0l8eJibdUyh6DbYSnRb6kpMf3qLK36eEIS8DWJGgLz9PEkhzO
 wRvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Cm1N737UB1pI7WtpuFkb+ivRdyWy3TDPTkpLHSy5Lgs=;
 b=qWMSBxQqvUkw6xvfLWWvJW0kkAZOD4/g5hBOiP1/p2i/xsz9Gbdo/1K/cXH7qsNA1L
 idg3jxebbDZ165smSsMzlArym14+IVXAngn0BBUlG2xl19HsZ0c8+8XXXcs/Clxk2p8i
 QDDqxrt6UGMjLhZwUcVmHTDq3SyNHOGcb/xQcqDBFhba4LGVEmF17F2H264GBf2OzRBK
 Gu4hI9uRyem4pzD9kGDOF/bOroQiop4VkqtELGDoJ0CqUmQRJroF5w3vXxaZgD8DhGmU
 ITVslnZVF2H/3kDdovTBglrOZBF3ZaFkOfaOq3/1kXr8uqw3E9lAuh9eXU92UbkuZci2
 HW/A==
X-Gm-Message-State: AOAM533VhTqXLB/0gAQQDCNOt2pHB9/jBIHnn4mzM+TZAxvz3ER3YYv/
 v+RE4J2v2k3JlDautNorPDE=
X-Google-Smtp-Source: ABdhPJxgnfWoIpa2i+TeqjTv9k4oiU6HoBhrVqePlRrPBubSJhPI/2L9dNRpGQwYH26RWFrNEc5eWg==
X-Received: by 2002:a05:6870:240d:b0:f1:b878:e97c with SMTP id
 n13-20020a056870240d00b000f1b878e97cmr3293838oap.193.1654719754289; 
 Wed, 08 Jun 2022 13:22:34 -0700 (PDT)
Received: from [192.168.10.102] (189-68-152-128.dsl.telesp.net.br.
 [189.68.152.128]) by smtp.gmail.com with ESMTPSA id
 y14-20020a0568302a0e00b006060322127bsm10742179otu.75.2022.06.08.13.22.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Jun 2022 13:22:34 -0700 (PDT)
Message-ID: <a011976f-714a-86ed-126c-5ed5857d8a8a@gmail.com>
Date: Wed, 8 Jun 2022 17:22:05 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2 08/16] ppc/pnv: user created pnv-phb for powernv9
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Frederic Barrat <fbarrat@linux.ibm.com>, qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, david@gibson.dropbear.id.au,
 mark.cave-ayland@ilande.co.uk
References: <20220531214917.31668-1-danielhb413@gmail.com>
 <20220531214917.31668-9-danielhb413@gmail.com>
 <d2ae2236-7a49-22e7-3950-cb635697721a@linux.ibm.com>
 <edef4577-c7d1-51aa-01c2-cd5846f7ba40@gmail.com>
 <bbbb71c0-c4bd-0c87-5d44-f6398d64cf36@kaod.org>
 <c6f53e8e-22a8-451d-409d-e371f39da08c@kaod.org>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <c6f53e8e-22a8-451d-409d-e371f39da08c@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2c;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x2c.google.com
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



On 6/7/22 03:44, Cédric Le Goater wrote:
>>>> Also, the comment seems wrong to me. The qom parenting doesn't matter when building the device tree. 
>>
>> it does. See pnv_dt_xscom()
> 
> And this is the root cause of many headaches for user-created devices.
> Could it be done differently ?

Just tried to do a related change based on the review you gave in patch 07:

----
But it would assert if child is not of the correct type. The routine
above is called from a object_child_foreach() which loops on all
children.

I think it could be improved by using directly &chip*->phbs[i].

C.
-----

This doesn't work out of the gate because, for user creatable devices, we
are not setting the phbs back into the chip->phbs[] array. In fact we're
not even incrementing chip->num_phbs. We were getting away with all of it
because we are parenting the PHBs to the chip during realize.

Considering that, and also how pnv_dt_xscom() works, I´d rather stick with
most of the the QOM usage we already have. Otherwise we would need, for example,
to change xscom_dt_child to go through each device we want in the DT. And
there's no clear benefit aside from using less QOM, but that can be amended
by adding more documentation here and there.

I can make an exception for powernv8 and pnv_ics_get_child()/pnv_ics_resend_child(),
where we're cycling through all child elements every time. For those cases it's worth
to access the phbs directly via chip->phbs[], and for user creatable phb3s I'll add
the created phb in the array.

I also believe that I can do more to make the current handling of default phb3/phb4
closer to what user creatable devices does. This will ease the work to be done
by this series and will also make the design easier to understand. I might also do
some changes that Mark pointed out in the phb3/4 root ports as well. This series can
then be more about the PnvPHB proxy.


Thanks,


Daniel




> 
> Thanks,
> 
> C.
> 
> 

