Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65253589BDF
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Aug 2022 14:46:38 +0200 (CEST)
Received: from localhost ([::1]:59992 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJaFJ-0000oZ-Gs
	for lists+qemu-devel@lfdr.de; Thu, 04 Aug 2022 08:46:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38464)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oJZyd-0004gj-JT
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 08:29:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:52186)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oJZya-0001eG-0X
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 08:29:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659616158;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+PafkRt2k2EsDey54B2A3UjCyY9uZszSWiQkqKksoDw=;
 b=FyJLdf3vmq1pP0Aabu5kdOCf1hloeh9QpfNFaVEFY0i+a/I8ijD6rqhSCpp8JLYA27MArC
 tZypZSE1IzPpEwVxY2e28S76S5cN08J26o5tLU7jBE0p+DYyaPR15bqT4B4wl3TiKy0NEB
 vjaBLUKT7T00MPjy+VyL1DBVzZTQ/rM=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-179-rvO3M39UPXq_kEz8C-IeqQ-1; Thu, 04 Aug 2022 08:29:17 -0400
X-MC-Unique: rvO3M39UPXq_kEz8C-IeqQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 w22-20020adf8bd6000000b002206311fb96so2869902wra.12
 for <qemu-devel@nongnu.org>; Thu, 04 Aug 2022 05:29:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:from:to:cc:references:subject:in-reply-to
 :content-transfer-encoding;
 bh=+PafkRt2k2EsDey54B2A3UjCyY9uZszSWiQkqKksoDw=;
 b=pBIte0NEJNwMfzeOfbTZmgBf14CG7v5gYRlXxZAoW6kFUOtAzxk/rCDzw3Cx7GixKG
 oPbNpIgE9sfYTSRiqv6G1OURB4ULOYi0jZ/XQojiuhToBoFoX4l5bxypP4n/bLVvnXka
 ZCClLCBAcZR1rIZd1zJBSJojVy92OYirgLU0WzfAcTtZnTMVFeSOdADH/63RHWX3U/ou
 cp1MTxhPR/lXhROGqxRukIdxjR1SxW5MzRt/8wFoLQGbrDh1hy9FrFfWFT1gxV445omM
 lpKKB49zKMtfq9uvK+risiDZJ5LDiAwYe66aa4bAq323UV97BRXjeyIhTWn328vuBa3X
 hknA==
X-Gm-Message-State: ACgBeo2Lqbhv5vwSkEEJcpzGKXH3o2ylkeQwODrBRGaHBa85lydkfnzC
 EAjzWO0R/NMrsTijJsljxM3PxJNyMAhu6IvQUtwHZWtN2W3kf7cyijKei4ZPwP22lAeDgd9XUkY
 cMinE5XAToMnS9P4=
X-Received: by 2002:a05:6000:2a4:b0:220:687a:cda9 with SMTP id
 l4-20020a05600002a400b00220687acda9mr1256821wry.187.1659616156293; 
 Thu, 04 Aug 2022 05:29:16 -0700 (PDT)
X-Google-Smtp-Source: AA6agR54aIxFzNDXnVc2lM0xypu0s98/EI2VdEpWTLdr3FqJb95onLhB/wIf7BFxYsAOE2f94CdiJA==
X-Received: by 2002:a05:6000:2a4:b0:220:687a:cda9 with SMTP id
 l4-20020a05600002a400b00220687acda9mr1256798wry.187.1659616155956; 
 Thu, 04 Aug 2022 05:29:15 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-42-112-229.web.vodafone.de.
 [109.42.112.229]) by smtp.gmail.com with ESMTPSA id
 o15-20020adfcf0f000000b0021d6a520ce9sm1066554wrj.47.2022.08.04.05.29.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Aug 2022 05:29:15 -0700 (PDT)
Message-ID: <62ef733d-5e40-8913-0b8b-d02afde7486c@redhat.com>
Date: Thu, 4 Aug 2022 14:29:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
From: Thomas Huth <thuth@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org,
 mcascell@redhat.com, f4bug@amsat.org
References: <20220802134834.454749-1-thuth@redhat.com>
 <CAFEAcA_oZni8G7LeciOywasY2rcEnpo=v01xCaaCTBp5_pDTLQ@mail.gmail.com>
 <aaa3210f-0c81-5c4e-7757-10fa99f5ac27@redhat.com>
 <CAFEAcA8Nsa131yeONs7-3H4wq885r1yuCwwSs=O09SS_Q7xUdQ@mail.gmail.com>
 <d3880c4d-b100-b412-e1f1-4f5c650cc22d@redhat.com>
 <CAFEAcA9azLEWsK-ewXT_ovsc2u+2ykMMJNK8b9UXdfBZ49w6eA@mail.gmail.com>
 <d2c8abec-1f87-01e5-a882-8502d9547f39@redhat.com>
Subject: Re: [PATCH] hw/usb/hcd-xhci: Fix endless loop in case the DMA access
 fails (CVE-2020-14394)
In-Reply-To: <d2c8abec-1f87-01e5-a882-8502d9547f39@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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

On 04/08/2022 13.43, Thomas Huth wrote:
> On 04/08/2022 12.17, Peter Maydell wrote:
>> On Thu, 4 Aug 2022 at 11:07, Thomas Huth <thuth@redhat.com> wrote:
>>>
>>> On 04/08/2022 10.56, Peter Maydell wrote:
>>>> But the point of TRB_LINK_LIMIT is that regardless of what the
>>>> contents of the TRBs are, the loop is not supposed to
>>>> be able to continue for more than TRB_LINK_LIMIT iterations,
>>>> ie 32 times. In this example case, do we stop after 32 TRBs
>>>> (case 2) or not (case 1)?
>>>
>>> Oh, wait, I think we were maybe looking at different spots. The problem
>>> likely does not occur in the xhci_ring_fetch() function
>>> (which you were likely looking at), but only in the xhci_ring_chain_length()
>>> function (which I was looking at)!
>>> xhci_ring_chain_length() can certainly continue more than 32 times. In
>>> xhci_ring_chain_length() the TRB_LINK_LIMIT only applies if "type ==
>>> TR_LINK", but the TRBs we're talking about here are *not* of type TR_LINK.
>>
>> That sounds like we do still have an unbounded-loop problem,
>> then: there's no limit on the number of consecutive TRBs
>> we try to read in that function. Maybe we're missing an
>> error check of some kind (does the spec limit how many
>> consecutive TRBs there can be somehow?) or else we need
>> another artificial limit.
> 
> I'm not an XHCI expert at all, but while at least having a quick glance at 
> the spec, I did not see any limit there. So I assume that we should enforce 
> an artificial limit? What would be a good value for this? Gerd, do you maybe 
> have any opinion?

Ok, after looking at the spec a little bit longer, I discovered chapter "6 
Data Structures", where they say that Transfer Ring segments should be 
limited to 64kB each. That sounds like a reasonable limit. I'll update my 
patch accordingly.

  Thomas


