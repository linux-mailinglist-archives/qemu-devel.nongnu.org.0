Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 46A04589A50
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Aug 2022 12:14:07 +0200 (CEST)
Received: from localhost ([::1]:44022 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJXrh-0007uh-Sa
	for lists+qemu-devel@lfdr.de; Thu, 04 Aug 2022 06:14:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41466)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oJXlW-0002cP-Ix
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 06:07:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24336)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oJXlT-0003DU-BS
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 06:07:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659607658;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aQFe9UgA8yml14FVyhn1IxDJMAUSZIVpzfHgzmiLLfA=;
 b=etK+muyUujbCgSTuDcE2xkN9KAUeo0fphShWoKe5KTOLygQqTMqLNywBbp62HVHvTJsWVA
 DCxXgoE35AXrzQJrNBtUNvwgmZqCXBqb713bWxRswHLOhk7htlP5hhiAVKa4Rktf1DFHdy
 9k2mrlKm1pWd0t3l21eQDfxvixRCmcw=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-192-0vlqjub-Mqug36PU3sY2WA-1; Thu, 04 Aug 2022 06:07:37 -0400
X-MC-Unique: 0vlqjub-Mqug36PU3sY2WA-1
Received: by mail-wm1-f72.google.com with SMTP id
 f21-20020a1cc915000000b003a3551598a1so720303wmb.0
 for <qemu-devel@nongnu.org>; Thu, 04 Aug 2022 03:07:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:to:cc:references:from:subject:in-reply-to
 :content-transfer-encoding;
 bh=aQFe9UgA8yml14FVyhn1IxDJMAUSZIVpzfHgzmiLLfA=;
 b=70ZWisKo8f+yHJqUYwrXShksmiT5mWSGhP6PlQTT6K0SDd0tt8rBRP63FbaXqT70+E
 LBkL/Pvtv5lr/OctL8EJc4P80P17xpQk7sxjy/qgGtLYSmEw1gtQap3r9HR0xGWyMrQF
 V22jlb3XXotyJ3zaaKK8PUaeTv1fLa25ZlNZbzZ82B7e4ZOgeEvzDOO5MUSgABrtmIJa
 M29nW9fPloGrmfBjn0USr7AmxUgJQNjQwpiR5G/oggDlxgEvN1EDxnC5HXIEgSCmbGfS
 xD8KNmYJMWOnumEX1j3O/0PSBF7Tn72Sg4OpPFId31EeaOYkTbJPsbRUM9VQCIlWJ1oC
 4JMA==
X-Gm-Message-State: ACgBeo1zKo7u/pxzDN7oZ+V5Ja0RnWDS1i38nD7aAG01dJNyZNFI6PdO
 FKpvOH2Csz/2YVBoC+r4EgVmK55b2rAjIlp40cPRxPRP7Uvk/UvDEfryZtbPgRpyFGwV18RBLid
 NlgnSQgaYuwR0gHc=
X-Received: by 2002:a7b:c4d7:0:b0:3a4:f135:cae5 with SMTP id
 g23-20020a7bc4d7000000b003a4f135cae5mr5769245wmk.201.1659607656094; 
 Thu, 04 Aug 2022 03:07:36 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4jEC2ohDcjAB+VojqfXsaFf6bSKmMft2HIz0nNMGtRp3+aezPFqXBULBkrc8WLkLwSXWuVJA==
X-Received: by 2002:a7b:c4d7:0:b0:3a4:f135:cae5 with SMTP id
 g23-20020a7bc4d7000000b003a4f135cae5mr5769230wmk.201.1659607655873; 
 Thu, 04 Aug 2022 03:07:35 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-42-112-229.web.vodafone.de.
 [109.42.112.229]) by smtp.gmail.com with ESMTPSA id
 r16-20020a05600c2c5000b003a2e42ae9a4sm999483wmg.14.2022.08.04.03.07.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Aug 2022 03:07:35 -0700 (PDT)
Message-ID: <d3880c4d-b100-b412-e1f1-4f5c650cc22d@redhat.com>
Date: Thu, 4 Aug 2022 12:07:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org,
 mcascell@redhat.com, f4bug@amsat.org
References: <20220802134834.454749-1-thuth@redhat.com>
 <CAFEAcA_oZni8G7LeciOywasY2rcEnpo=v01xCaaCTBp5_pDTLQ@mail.gmail.com>
 <aaa3210f-0c81-5c4e-7757-10fa99f5ac27@redhat.com>
 <CAFEAcA8Nsa131yeONs7-3H4wq885r1yuCwwSs=O09SS_Q7xUdQ@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH] hw/usb/hcd-xhci: Fix endless loop in case the DMA access
 fails (CVE-2020-14394)
In-Reply-To: <CAFEAcA8Nsa131yeONs7-3H4wq885r1yuCwwSs=O09SS_Q7xUdQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 04/08/2022 10.56, Peter Maydell wrote:
> On Thu, 4 Aug 2022 at 09:00, Thomas Huth <thuth@redhat.com> wrote:
>>
>> On 02/08/2022 16.09, Peter Maydell wrote:
>>> On Tue, 2 Aug 2022 at 14:53, Thomas Huth <thuth@redhat.com> wrote:
>>>>
>>>> The XHCI code could enter an endless loop in case the guest points
>>>> QEMU to fetch TRBs from invalid memory areas. Fix it by properly
>>>> checking the return value of dma_memory_read().
>>>
>>> It certainly makes sense to check the return value from
>>> dma_memory_read(), but how can we end up in an infinite loop
>>> if it fails? Either:
>>>
>>> (1) there is some combination of data values which allow an
>>> infinite loop, so we can hit those if the DMA access fails and
>>> we use bogus uninitialized data. But then the guest could
>>> maliciously pass us those bad values and create an infinite
>>> loop without a failing DMA access, ie commit 05f43d44e4b
>>> missed a case. If so we need to fix that!
>>
>> No, as far as I can see, that's not the case.
>>
>>> Or (2) there isn't actually an infinite loop possible here,
>>> and we're just tidying up a case which is C undefined
>>> behaviour but in practice unlikely to have effects any
>>> worse than the guest could provoke anyway (ie running up
>>> to the TRB_LINK_LIMIT and stopping). In this case the
>>> commit message here is a bit misleading.
>>
>> So from what I understand, this is happening: The guest somehow manages to
>> trick QEMU in a state where it reads through a set of TRBs where none is
>> marked in a way that could cause the function to return. QEMU then reads all
>> memory 'till the end of RAM and then continues to loop through no-mans-land
>> since the return value of dma_memory_read() is not checked.
> 
> But the point of TRB_LINK_LIMIT is that regardless of what the
> contents of the TRBs are, the loop is not supposed to
> be able to continue for more than TRB_LINK_LIMIT iterations,
> ie 32 times. In this example case, do we stop after 32 TRBs
> (case 2) or not (case 1)?

Oh, wait, I think we were maybe looking at different spots. The problem 
likely does not occur in the xhci_ring_fetch() function
(which you were likely looking at), but only in the xhci_ring_chain_length() 
function (which I was looking at)!
xhci_ring_chain_length() can certainly continue more than 32 times. In 
xhci_ring_chain_length() the TRB_LINK_LIMIT only applies if "type == 
TR_LINK", but the TRBs we're talking about here are *not* of type TR_LINK.

  Thomas


