Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5017F6A9436
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 10:34:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pY1nA-00041x-7R; Fri, 03 Mar 2023 04:33:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1pY1n0-0003rF-Lv; Fri, 03 Mar 2023 04:33:22 -0500
Received: from mail-oa1-x29.google.com ([2001:4860:4864:20::29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1pY1my-0003Vg-7z; Fri, 03 Mar 2023 04:33:22 -0500
Received: by mail-oa1-x29.google.com with SMTP id
 586e51a60fabf-173435e0ec4so2260852fac.12; 
 Fri, 03 Mar 2023 01:33:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=oT8A4BDx5zkr08YQkjucjRaNS0EK8EyQQRrh0x3Oawg=;
 b=qo+f7V5E2p4c0CdbXamlmppvJvBq6UKuVAtPxQgGJDfukWj/6nw2M0Nh1f7+Au+68a
 0OBnJZKQmwvukmg/9Vn2wEazCt/iDl41SpJISjCO9Kw7SbvGva8Dd8GdJB41pNLYzylN
 ZXBzZuHmaPrGTDSobFx6Iz/b1DRQAaZNgtGs5N2H4PQGxoexKlvsGT6TZsD5xbeXzvmk
 SHOOx/d6OLirpPR+Xozn+S+9cciiGu0sAoY09AxqvFwAE05RHLtuNY7EdXjTg0CeY6ja
 YnHPUiKG62m0AvaO0QkK72GuTFTxnDOsJG1Aj71ZLCI8sI0UBXgJvcluKA0VDwBqlFxD
 8TDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=oT8A4BDx5zkr08YQkjucjRaNS0EK8EyQQRrh0x3Oawg=;
 b=MwP0F6jJIWd3QevY1aXkGVlgjqh6u2VwuOwg1HIa16gK1uvBXPg6R6vPD2VtPDZPrW
 t7qTp7TOCQSM8cC4nIm8bHCoDmaPJwR/LcBb4kJ9D0itPYFlobUBpy8s7TToBfXiNoTl
 5FzN2r8Xt471UE+s9CxHv0b1XE8WhuQdkmCZERsIQlMNzqBOh2rVoZ6ULztCC7tpdnnS
 4eDZcn5Zt2Oe0GxXyV/G11BmU7aZrmpw2opsstYjDhq6lHw6B4hq8wZD/h1zZiBz4k9D
 oSZ5SpCkQWBBxqRCi3haf1uDWV2VRdww7cfpDS+QXfYJUo854PsbELQaFwt1PbSEddjw
 asqw==
X-Gm-Message-State: AO0yUKWfyfYoiTFL90daJcMufaYpr2tv1eiEtLbXbmDDdwRhs1KPTykI
 vGU6EVs9iWIWfe2tLSBTpRE=
X-Google-Smtp-Source: AK7set92MQ1Y+OGK8uQaRidYKk0gDu73xA4gqyWjdSh8bM2XeadQ7A4sQZ7yv3B2/gIpTApGX+koxw==
X-Received: by 2002:a05:6870:5828:b0:16e:1aeb:d750 with SMTP id
 r40-20020a056870582800b0016e1aebd750mr607693oap.25.1677835997052; 
 Fri, 03 Mar 2023 01:33:17 -0800 (PST)
Received: from [192.168.68.107] ([177.189.53.31])
 by smtp.gmail.com with ESMTPSA id
 ds38-20020a0568705b2600b00172ac40356csm776239oab.50.2023.03.03.01.33.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Mar 2023 01:33:16 -0800 (PST)
Message-ID: <9a930aaf-89ef-b2ea-4114-5e63b553bb95@gmail.com>
Date: Fri, 3 Mar 2023 06:33:14 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 0/4] user-created PHB cleanup
Content-Language: en-US
To: Frederic Barrat <fbarrat@linux.ibm.com>, clg@kaod.org,
 qemu-ppc@nongnu.org, qemu-devel@nongnu.org
References: <20230302163715.129635-1-fbarrat@linux.ibm.com>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20230302163715.129635-1-fbarrat@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2001:4860:4864:20::29;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x29.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.092,
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



On 3/2/23 13:37, Frederic Barrat wrote:
> A short series with some cleanup around user-created PHB. The main
> point is to remove errors seen from the firmware (skiboot) when using
> user-created PHBs, as we were always showing all the default PHBs in
> the device tree, so skiboot tried to probe non-existing devices. The
> first 2 patches allow to only export the user-created PHBs in the
> device tree when 'nodefaults' is used.
> The last 2 are more cosmetic and moving code around where it makes
> more sense.
> 

I'm aware of Phil's comments in patch 1 and the solution can probably be improved
on (as with any other solution and code).

Patch 1 is a requirement to the actual fix in patch 2 though, and Phil's comments
applies to more stuff in the current pnv-phb code. Since we can handle design changes
later on while still fixing the bug, I queued all these for 8.0.


Thanks,

Daniel

> 
> Frederic Barrat (4):
>    pnv_phb4_pec: Keep track of instantiated PHBs
>    pnv_phb4_pec: Only export existing PHBs to the device tree
>    pnv_phb4_pec: Move pnv_phb4_get_pec() to rightful file
>    pnv_phb4_pec: Simplify/align code to parent user-created PHBs
> 
>   hw/pci-host/pnv_phb.c          | 11 +++++-
>   hw/pci-host/pnv_phb4_pec.c     | 61 +++++++++++++++++++++++++----
>   hw/ppc/pnv.c                   | 70 ++++------------------------------
>   include/hw/pci-host/pnv_phb4.h |  3 ++
>   include/hw/ppc/pnv.h           |  2 +-
>   5 files changed, 76 insertions(+), 71 deletions(-)
> 

