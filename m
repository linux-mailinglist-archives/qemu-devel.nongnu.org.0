Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 03321583FD3
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jul 2022 15:18:56 +0200 (CEST)
Received: from localhost ([::1]:35484 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oH3Pj-0004hi-3D
	for lists+qemu-devel@lfdr.de; Thu, 28 Jul 2022 09:18:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57326)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oH3Jc-0008T1-25; Thu, 28 Jul 2022 09:12:37 -0400
Received: from mail-ot1-x333.google.com ([2607:f8b0:4864:20::333]:42968)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oH3JZ-0002NK-Vn; Thu, 28 Jul 2022 09:12:35 -0400
Received: by mail-ot1-x333.google.com with SMTP id
 k25-20020a056830169900b0061c6f68f451so1126409otr.9; 
 Thu, 28 Jul 2022 06:12:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=idimK8N9h5ZeguSlDf0OrkaOTuZas/uRkWYjnt6nuNA=;
 b=gmBZC/OxRJq73cZBt/dTv+eKMuGjk5w85GK3Sii5AEYOsrFywIN59TfC6EiVj7xRuD
 4ZSETYlc70NwwY68wyR2czHsTiGQh2lAJguh+KRf3H8dzq00DlzPLsnjRO89qLNYM+GF
 MUW1njQHsuz5us98Kfia1Rzs7iZj7yTXnIXC09ZFc8z1uzG9rIZmKx3AMZxFaArmq0pC
 3Wdlo0HSjiMdSAgBFlEIAzRA8FDjLalv+Va3Bc6pHuaQz+qFwsyLpuDaGiBg/z4ro7Df
 LXlmLwKzVEA5dQr6RWG+hue1EJK/oHfbDXhCEjWhWSuwKFKVCuxVGfVNm7/Ht6+o0/Nu
 cQRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=idimK8N9h5ZeguSlDf0OrkaOTuZas/uRkWYjnt6nuNA=;
 b=5LUr9nhV4HQGV0oTefu6m1kihgc6D4R+Fup3axa1v/R+gMjJZUFymeQ5IOjNmGpxTR
 z80mhi9ByY/qAg15cvzyFhhnbJ9U7X4K8SYrsxcG8zR+1l7b38RN34ZOcbM/xduALECa
 UanZD/oitewuKDsGZk4xZVaxwmkp4k2+ABWmyYcoWFqHD8jvK04RM0/kS8NqX29gxXqJ
 fTPNeF9NiLUQjwJlIXBVqPe9/ZSg10+mV+gMFFyzy28LEAK/8iRg0CUGux4EiuP4nkXd
 2Kq6K6gNu9jHYq0HGiDCLIiVPNdLsfZazJGPLX5r7eYMNkEEpoBaBkOfwe4QLIaew4F3
 ozhQ==
X-Gm-Message-State: AJIora+5E2njHeV2U3YFWHkHTNZC34WTdu9lhzQMANfMtgmrg0FUbl/M
 vFzYBkzqgnIKzicoXK1YuLY=
X-Google-Smtp-Source: AGRyM1vIwILDzI/8bv47DHv6jBMo+BHvDzE656oYVxLehGIcm98m6Ib/kmbGFmhF2VPdD4ZSvuywZA==
X-Received: by 2002:a05:6830:2908:b0:61d:26f8:94c5 with SMTP id
 z8-20020a056830290800b0061d26f894c5mr965311otu.64.1659013952580; 
 Thu, 28 Jul 2022 06:12:32 -0700 (PDT)
Received: from [192.168.10.102] ([179.225.208.46])
 by smtp.gmail.com with ESMTPSA id
 v22-20020a4ae056000000b00435f239e5b3sm344152oos.10.2022.07.28.06.12.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Jul 2022 06:12:32 -0700 (PDT)
Message-ID: <ced9492b-8fb4-0066-3c22-20d30b38c4f5@gmail.com>
Date: Thu, 28 Jul 2022 10:12:26 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v3 00/12] powernv: introduce pnv-phb base/proxy devices
Content-Language: en-US
To: Frederic Barrat <fbarrat@linux.ibm.com>, qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org
References: <20220624084921.399219-1-danielhb413@gmail.com>
 <22b1124d-3c57-925f-56e7-1b85342be7ff@linux.ibm.com>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <22b1124d-3c57-925f-56e7-1b85342be7ff@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::333;
 envelope-from=danielhb413@gmail.com; helo=mail-ot1-x333.google.com
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



On 7/27/22 14:28, Frederic Barrat wrote:
> 
> 
> On 24/06/2022 10:49, Daniel Henrique Barboza wrote:
>> Hi,
>>
>> This is the version 3 of the pnv-phb proxy device which has the
>> following main differences from v2:
>>
>> - it's rebased on top of "[PATCH v3 0/8] pnv-phb related cleanups"
>> - it doesn't have any patches related to user-created devices
>>
>> There is no user visible change made here yet. We're making device
>> changes that are effective using default settings.
>>
>> Changes from v2:
>> - all related changes made with the rebase on top of "[PATCH v3 0/8]
>> pnv-phb related cleanups"
>> - the following user devices patches were removed:
>>    - ppc/pnv: user created pnv-phb for powernv8
>>    - ppc/pnv: user created pnv-phb for powernv9
>>    - ppc/pnv: change pnv_phb4_get_pec() to also retrieve chip10->pecs
>>    - ppc/pnv: user creatable pnv-phb for powernv10
>> - v2 link: https://lists.gnu.org/archive/html/qemu-devel/2022-05/msg06254.html
> 
> 
> This series look pretty good to me! I only have a couple of minor comments, which I don't think are worth a resend.
> 
>    Fred


Thanks for the review! Patches queued in gitlab.com/danielhb/qemu/tree/ppc-7.2 .


Daniel

> 
> 
> 
>> Daniel Henrique Barboza (12):
>>    ppc/pnv: add PHB3 bus init helper
>>    ppc/pnv: add PnvPHB base/proxy device
>>    ppc/pnv: turn PnvPHB3 into a PnvPHB backend
>>    ppc/pnv: add PHB4 bus init helper
>>    ppc/pnv: turn PnvPHB4 into a PnvPHB backend
>>    ppc/pnv: add pnv-phb-root-port device
>>    ppc/pnv: remove pnv-phb3-root-port
>>    ppc/pnv: remove pnv-phb4-root-port
>>    ppc/pnv: remove root port name from pnv_phb_attach_root_port()
>>    ppc/pnv: remove pecc->rp_model
>>    ppc/pnv: remove PnvPHB4.version
>>    ppc/pnv: move attach_root_port helper to pnv-phb.c
>>
>>   hw/pci-host/meson.build        |   3 +-
>>   hw/pci-host/pnv_phb.c          | 244 +++++++++++++++++++++++++++++++++
>>   hw/pci-host/pnv_phb.h          |  55 ++++++++
>>   hw/pci-host/pnv_phb3.c         | 106 ++++----------
>>   hw/pci-host/pnv_phb4.c         | 144 ++++---------------
>>   hw/pci-host/pnv_phb4_pec.c     |   5 +-
>>   hw/ppc/pnv.c                   |  68 ++++-----
>>   include/hw/pci-host/pnv_phb3.h |  12 +-
>>   include/hw/pci-host/pnv_phb4.h |  18 +--
>>   include/hw/ppc/pnv.h           |   5 +-
>>   10 files changed, 401 insertions(+), 259 deletions(-)
>>   create mode 100644 hw/pci-host/pnv_phb.c
>>   create mode 100644 hw/pci-host/pnv_phb.h
>>

