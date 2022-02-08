Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 189C64AE089
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 19:17:53 +0100 (CET)
Received: from localhost ([::1]:53828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHV3o-00081U-6D
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 13:17:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39710)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1nHTZo-0007W1-IW
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 11:42:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23827)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1nHTZm-0005Lv-Kh
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 11:42:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644338565;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xriG4dZq6ywO7DbeHEW3kgq60BryvY0DxFELWLP7z70=;
 b=XUy33rsgQqlVgQaBJSjUxHEBcq85xjtQyBrL7O1z+u1eMXA8oPKnJEgAVnI/SmTPD3AZAq
 cqE1LvjRl+QHanFJ+Be0+48N4VuAfMDtQ9BieBevtdjj6/PNVW5tiu9oZpNh57Qr8uQnO8
 wvWEhem29YhrqDB6f/UMJi1/sG+GnSg=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-584-kofautCXNcqTOZpPQpxOAw-1; Tue, 08 Feb 2022 11:42:44 -0500
X-MC-Unique: kofautCXNcqTOZpPQpxOAw-1
Received: by mail-wr1-f69.google.com with SMTP id
 q8-20020adfb188000000b001e33a8cdbf4so988834wra.16
 for <qemu-devel@nongnu.org>; Tue, 08 Feb 2022 08:42:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=xriG4dZq6ywO7DbeHEW3kgq60BryvY0DxFELWLP7z70=;
 b=qXA2YZ+ThmAYPnSANzdoEjV7BFyaQW15ahK58I25jP1MgUiAZwp07QWfdDY+7xqw1z
 VB3OsCfrblqgqyKHAGvEX+7CMrumgMukKyQuY/OOLpC4zEJx3YBavY1Zgaqtd6LG5L4h
 PndbtFQf17XW7XHZq2pX3wn5+sj7mQ6WELQA1o+tORm+w6IByuHzWqdRYrSnEDeht5vk
 rbopxpYzt31/ek4RLsuEeBcgKrVlHWmcSL/CQ3/pyAkJeH9lSg53+tXZw40/PpGTdmxl
 5pStpCrYP0gbXjzJ2pYk7dtS4aYz8elO2ReReb2PbmXD7UbHP8ENv6fRna/rDBTXFdsD
 4ynw==
X-Gm-Message-State: AOAM531ncwfhjH3mWp1BbLyHNQnR0nJArYOPEJWnXXBXrIgSciNLbwpN
 YEDcPPDY6/JgQ2+BLSixqgLFZX/r3O53zeu4mvVVbtcWl2+W6BIirN4ZzUNxRdxLBM4BZzYYWgT
 RVyI78U0pfTUnNHk=
X-Received: by 2002:a05:600c:2751:: with SMTP id
 17mr1825292wmw.20.1644338563149; 
 Tue, 08 Feb 2022 08:42:43 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyHH6MnoQiuucEEVOYVsLWrEVw39uIKXxHjSwGlw7iJM+4oXRg2f+8wMIyOQTcUQuoiZpkerQ==
X-Received: by 2002:a05:600c:2751:: with SMTP id
 17mr1825275wmw.20.1644338562894; 
 Tue, 08 Feb 2022 08:42:42 -0800 (PST)
Received: from ?IPv6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id be11sm2554440wmb.19.2022.02.08.08.42.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Feb 2022 08:42:42 -0800 (PST)
Subject: Re: [PATCH v4 1/2] tpm: CRB: Use ram_device for "tpm-crb-cmd" region
To: Peter Maydell <peter.maydell@linaro.org>
References: <20220208133842.112017-1-eric.auger@redhat.com>
 <20220208133842.112017-2-eric.auger@redhat.com>
 <CAFEAcA9teH-ejt3NKh1rqQPToM_S-DC2JdHUkMof4YwHXoaXtA@mail.gmail.com>
 <3b1f9d56-81e7-d59e-0a02-9416eae6b914@redhat.com>
 <CAFEAcA_4+BQ=YwVpY7qfxp=FygyWa+y0tDDkEQwhY1qDRDX-tQ@mail.gmail.com>
From: Eric Auger <eric.auger@redhat.com>
Message-ID: <17a090c9-a921-1f82-78a9-df6d58b7d54a@redhat.com>
Date: Tue, 8 Feb 2022 17:42:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_4+BQ=YwVpY7qfxp=FygyWa+y0tDDkEQwhY1qDRDX-tQ@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Reply-To: eric.auger@redhat.com
Cc: quintela@redhat.com, cohuck@redhat.com, qemu-devel@nongnu.org,
 f4bug@amsat.org, alex.williamson@redhat.com, imammedo@redhat.com,
 stefanb@linux.vnet.ibm.com, david@gibson.dropbear.id.au, dgilbert@redhat.com,
 eric.auger.pro@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,
On 2/8/22 5:01 PM, Peter Maydell wrote:
> On Tue, 8 Feb 2022 at 15:56, Eric Auger <eric.auger@redhat.com> wrote:
>> Hi Peter,
>>
>> On 2/8/22 4:17 PM, Peter Maydell wrote:
>>> On Tue, 8 Feb 2022 at 15:08, Eric Auger <eric.auger@redhat.com> wrote:
>>>> Representing the CRB cmd/response buffer as a standard
>>>> RAM region causes some trouble when the device is used
>>>> with VFIO. Indeed VFIO attempts to DMA_MAP this region
>>>> as usual RAM but this latter does not have a valid page
>>>> size alignment causing such an error report:
>>>> "vfio_listener_region_add received unaligned region".
>>>> To allow VFIO to detect that failing dma mapping
>>>> this region is not an issue, let's use a ram_device
>>>> memory region type instead.
>>> This seems like VFIO's problem to me. There's nothing
>>> that guarantees alignment for memory regions at all,
>>> whether they're RAM, IO or anything else.
>> VFIO dma maps all the guest RAM.
> Well, it can if it likes, but "this is a RAM-backed MemoryRegion"
> doesn't imply "this is really guest actual RAM RAM", so if it's
> using that as its discriminator it should probably use something else.
> What is it actually trying to do here ?
We avoid outputting an error msg for something that is not an issue.
Besides, a little bit farther in hw/vfio/common.c
(vfio_listener_region_add) memory_region_is_ram_device() already is used
to avoid doing the dma_map for this type of region.

Originally, according to 21e00fa55f3 ("memory: Replace skip_dump flag
with "ram_device"), we had a skip_dump field in MemoryRegion which was
then turned into a whole ram_device type. Doing it differently would
mean that we would somehow introduce a new flag saying skip_dma_map?
Originally this was mainly meant for MMIO bars but I understood from
Alex that it could be sensible in that case too.

Thanks

Eric
>
> thanks
> -- PMM
>


