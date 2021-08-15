Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C65EF3EC998
	for <lists+qemu-devel@lfdr.de>; Sun, 15 Aug 2021 16:37:43 +0200 (CEST)
Received: from localhost ([::1]:46112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mFHGg-0007hO-Si
	for lists+qemu-devel@lfdr.de; Sun, 15 Aug 2021 10:37:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36810)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mFHFT-0006rC-Ka
 for qemu-devel@nongnu.org; Sun, 15 Aug 2021 10:36:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43591)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mFHFR-0004O9-P6
 for qemu-devel@nongnu.org; Sun, 15 Aug 2021 10:36:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629038184;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=krZuGdBwN2AUJT/Dr/pk66keT8rWFwV+4RGKZFubi2c=;
 b=MskC2n+w6sJyB8FM+pfV3bhW2jsyiOSGejzGQN+tFly8i+N3JHsQtofWezHMcAg1+xYfat
 /sLhLrP67KJeqYgdnYqskJWljFllG6ZGpdq3s79nD+IibPI2IBu5R39cvztaLr9uUND/GF
 Ed7H9tnTYbFOxVYdF13WWHRH+uQH/QQ=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-253-Z9RVjL3-OFKeXUTN4NJv8Q-1; Sun, 15 Aug 2021 10:36:21 -0400
X-MC-Unique: Z9RVjL3-OFKeXUTN4NJv8Q-1
Received: by mail-wr1-f69.google.com with SMTP id
 a14-20020adfe5ce000000b00156c49c4a23so36911wrn.15
 for <qemu-devel@nongnu.org>; Sun, 15 Aug 2021 07:36:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=krZuGdBwN2AUJT/Dr/pk66keT8rWFwV+4RGKZFubi2c=;
 b=jiOZX/NKHz4NASUTSJPJHkFp3jRDBKJyG8FO4Seq/fJCsfW4oZWqOxCeIWEhlq10fh
 FIDeVvQlQnaNyK1n1RmPSAqpUyDe1q2w6O+LsI8FlvwCnaZFslUBKtUmOVQo1YUBqM7R
 e1M+muK1TQJWsYPEaoQiFMB3GmLrElbm18YS2dVpH22Q7zXJsvc/YhbgKz2L8bAcNxQZ
 RL5a10AxGuvxHccCfqibTWGdIMPgsEjLrYTxqOjuPx2PMEKGL/TV9AhLrBM73v+dNldE
 Yvrmzsd96Pv1EEmI3jKUvfv0IdWllZYwCQoE9VbEjFFOBal6dIP2BI02hbF9SJCdkWzA
 uUMg==
X-Gm-Message-State: AOAM5313KeX31XN4AujODr0wUBnoNHlp/qgnBeLnc/zNd+tWDZZgmLvg
 g3vmvjFTvl3v4zpcfgieaO7RO7ED9zv8Qva24ERzB5PnOlyhlOiONq50djLdqb9yaZghnKTrQ6t
 YXB5RaxaLXXTO6DI=
X-Received: by 2002:a1c:7dd0:: with SMTP id y199mr11123683wmc.23.1629038180108; 
 Sun, 15 Aug 2021 07:36:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy+teC6ABqNJgzB4CWD2xoh21KsbIva1b3abMQKdVBgCw8SSAXtY5+FDlInHM20K6TIAaX/zg==
X-Received: by 2002:a1c:7dd0:: with SMTP id y199mr11123673wmc.23.1629038179893; 
 Sun, 15 Aug 2021 07:36:19 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id b15sm8298459wrq.5.2021.08.15.07.36.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 15 Aug 2021 07:36:19 -0700 (PDT)
Subject: Re: [PULL 24/30] spapr_pci: populate ibm,loc-code
To: Peter Maydell <peter.maydell@linaro.org>,
 David Gibson <david@gibson.dropbear.id.au>
References: <1436284182-5063-1-git-send-email-agraf@suse.de>
 <1436284182-5063-25-git-send-email-agraf@suse.de>
 <CAFEAcA9TQKAU94OUuSzYH8A_7CFfSYc+R8-Mz4mai0vwMbjsxA@mail.gmail.com>
 <YRIAr6HIW742LSZd@yekko>
 <CAFEAcA-GGNcm09xu5v65jQcghjBnj6cBtb0p0xYhOPPNt1g_sg@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <1daaacdf-4725-3350-601f-24025d3944f4@redhat.com>
Date: Sun, 15 Aug 2021 16:36:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-GGNcm09xu5v65jQcghjBnj6cBtb0p0xYhOPPNt1g_sg@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -55
X-Spam_score: -5.6
X-Spam_bar: -----
X-Spam_report: (-5.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.147, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-ppc <qemu-ppc@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Nikunj A Dadhania <nikunj@linux.vnet.ibm.com>, Greg Kurz <groug@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/13/21 5:17 PM, Peter Maydell wrote:
> On Tue, 10 Aug 2021 at 05:40, David Gibson <david@gibson.dropbear.id.au> wrote:
>>
>> On Mon, Aug 09, 2021 at 10:57:00AM +0100, Peter Maydell wrote:
>>>
>>> Cleanest fix would be to declare 'path' and 'host' as
>>>    g_autofree char *path = NULL;
>>>    g_autofree char *host = NULL;
>>> and then you can remove all the manual g_free(path) and g_free(host) calls.
>>
>> Thanks for the report.  I've committed the fix (I hope) below to ppc-for-6.1:
>>
>> From 70ae61b510dc571c407b28c46498cae60e60ca66 Mon Sep 17 00:00:00 2001
>> From: David Gibson <david@gibson.dropbear.id.au>
>> Date: Tue, 10 Aug 2021 14:28:19 +1000
>> Subject: [PATCH] spapr_pci: Fix leak in spapr_phb_vfio_get_loc_code() with
>>  g_autofree
>>
>> This uses g_autofree to simplify logic in spapr_phb_vfio_get_loc_code(),
>> in the process fixing a leak in one of the paths.  I'm told this fixes
>> Coverity error CID 1460454
>>
>> Reported-by: Peter Maydell <peter.maydell@linaro.org>
>> Fixes: 16b0ea1d852 ("spapr_pci: populate ibm,loc-code")
>> Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
>> ---
>>  hw/ppc/spapr_pci.c | 17 ++++++-----------
>>  1 file changed, 6 insertions(+), 11 deletions(-)
>>
>> diff --git a/hw/ppc/spapr_pci.c b/hw/ppc/spapr_pci.c
>> index 7a725855f9..13d806f390 100644
>> --- a/hw/ppc/spapr_pci.c
>> +++ b/hw/ppc/spapr_pci.c
>> @@ -782,33 +782,28 @@ static AddressSpace *spapr_pci_dma_iommu(PCIBus *bus, void *opaque, int devfn)
>>
>>  static char *spapr_phb_vfio_get_loc_code(SpaprPhbState *sphb,  PCIDevice *pdev)
>>  {
>> -    char *path = NULL, *buf = NULL, *host = NULL;
>> +    g_autofree char *path = NULL;
>> +    g_autofree char *host = NULL;
>> +    char *buf = NULL;
>>
>>      /* Get the PCI VFIO host id */
>>      host = object_property_get_str(OBJECT(pdev), "host", NULL);
>>      if (!host) {
>> -        goto err_out;
>> +        return NULL;
>>      }
>>
>>      /* Construct the path of the file that will give us the DT location */
>>      path = g_strdup_printf("/sys/bus/pci/devices/%s/devspec", host);
>> -    g_free(host);
>>      if (!g_file_get_contents(path, &buf, NULL, NULL)) {
>> -        goto err_out;
>> +        return NULL;
>>      }
>> -    g_free(path);
>>
>>      /* Construct and read from host device tree the loc-code */
>>      path = g_strdup_printf("/proc/device-tree%s/ibm,loc-code", buf);
>> -    g_free(buf);
> 
> This deletion doesn't look right -- 'buf' is not autofree
> (and shouldn't be, since we're returning it).

Oops, good catch!

> If you want to delete this 'g_free' you need to make the
> first g_file_get_contents() use a separate char* variable from
> the variable we use to return the eventual result data buffer;
> then you can make that new variable be g_autofree.
> 
>>      if (!g_file_get_contents(path, &buf, NULL, NULL)) {
>> -        goto err_out;
>> +        return NULL;
>>      }
>>      return buf;
>> -
>> -err_out:
>> -    g_free(path);
>> -    return NULL;
>>  }
> 
> thanks
> -- PMM
> 


