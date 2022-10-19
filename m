Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9305E6048E6
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Oct 2022 16:15:43 +0200 (CEST)
Received: from localhost ([::1]:44908 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ol9rC-00075S-7o
	for lists+qemu-devel@lfdr.de; Wed, 19 Oct 2022 10:15:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47432)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1ol9oA-0005Ja-6o
 for qemu-devel@nongnu.org; Wed, 19 Oct 2022 10:12:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:60020)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1ol9o8-0008KZ-BE
 for qemu-devel@nongnu.org; Wed, 19 Oct 2022 10:12:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666188748;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mJVpZ7N5aWQXBJGrrkX7R+tKCDyU0y6djATCxVBzQzQ=;
 b=SC4miNjSndoJCe7LZb4xD4Og/5mz0cF5AGHMFHg2znHVQrab5cCj/ABxr7K88bIANBJ1ra
 ttGUYl8NxWYsZ3vOv8XjZZO5cSG8B/8lb+pwQatanWlEtbmGT5/Vchj03921mBbdXNTShe
 2qCLlHdSvbZS2LS6oI+9ThpDIJju+Cg=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-53-nkp_T2yVPTyf37FIV3ZWlQ-1; Wed, 19 Oct 2022 10:12:26 -0400
X-MC-Unique: nkp_T2yVPTyf37FIV3ZWlQ-1
Received: by mail-qk1-f200.google.com with SMTP id
 bm16-20020a05620a199000b006ee95743ad2so14995381qkb.14
 for <qemu-devel@nongnu.org>; Wed, 19 Oct 2022 07:12:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mJVpZ7N5aWQXBJGrrkX7R+tKCDyU0y6djATCxVBzQzQ=;
 b=ifh4DAoocF22lCzb3F5SSk4OWkVcocZKMXVraWAchAwAfjUrC8HZPGlXNlUivyo6Zt
 /uAxUPYPImOLco0GZzZ5Ok8H+xjPLvRKgpYNG+peZx6Vx+k2ndx1KHRfCQKRPX+uze77
 GWKkKMoosjc2q4HGc1JMqD/T/hpa5pNgEsHQH2pjhj5m8KAYrtgqURNS+ykmRZbVvjSI
 VRPxCXAZDi0F9mpOkoLdYQhcD40tg594+MubPOooyV2Q0/Q3thdhAXHnDc6HhUmilZ2c
 /3Kytbhp+3ifUaLpr1K1BkNvaPmT5DNvKfKy/QjiesbvLWMchIfzh1QwDERGgIgdF5Q+
 Fy7Q==
X-Gm-Message-State: ACrzQf0Z8FwJA4S7GwT5gu97+cUaVT6LUcounTlWoWF8pflp4h49k3dz
 w76nF/rbwDXa4BqTrCTbZYqOI8mm7h6w0uwdhTuJjNdfydhlwSfMdll8YyPsl8346aboPlq+fMk
 prUTEmsjLBdA7+Tk=
X-Received: by 2002:a05:620a:74e:b0:6e5:7560:26ee with SMTP id
 i14-20020a05620a074e00b006e5756026eemr5498713qki.242.1666188746146; 
 Wed, 19 Oct 2022 07:12:26 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4vHC4ENeB2IwfJOWH5p5iR55PEVdovcjRkp5FcgV8n34Rx6anXnQZQPCITo0cWwIaaycav1w==
X-Received: by 2002:a05:620a:74e:b0:6e5:7560:26ee with SMTP id
 i14-20020a05620a074e00b006e5756026eemr5498690qki.242.1666188745897; 
 Wed, 19 Oct 2022 07:12:25 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 w16-20020a05620a425000b006ce441816e0sm4939254qko.15.2022.10.19.07.12.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Oct 2022 07:12:25 -0700 (PDT)
Message-ID: <1196d8bb-1a4f-06b7-f5e3-43ace827bfb0@redhat.com>
Date: Wed, 19 Oct 2022 16:12:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] x86-iommu: Fail flag registration of DEVIOTLB if DT not
 supported
Content-Language: en-US
To: Peter Xu <peterx@redhat.com>
Cc: qemu-devel@nongnu.org, Jason Wang <jasowang@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, =?UTF-8?Q?Eugenio_P=c3=a9rez?=
 <eperezma@redhat.com>
References: <20221018215407.363986-1-peterx@redhat.com>
 <98df60ec-be6d-84aa-d2bd-3bb2ebf0d1a5@redhat.com> <Y1ADOivPsgWzOjF6@x1n>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <Y1ADOivPsgWzOjF6@x1n>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.256,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Peter,

On 10/19/22 16:01, Peter Xu wrote:
> Hi, Eric,
>
> On Wed, Oct 19, 2022 at 01:24:15PM +0200, Eric Auger wrote:
>>> @@ -1484,6 +1485,13 @@ static int amdvi_iommu_notify_flag_changed(IOMMUMemoryRegion *iommu,
>>>                     PCI_FUNC(as->devfn));
>>>          return -EINVAL;
>>>      }
>>> +
>>> +    if ((new & IOMMU_NOTIFIER_DEVIOTLB_UNMAP) && !x86_iommu->dt_supported) {
>>> +        error_setg_errno(errp, ENOTSUP,
>>> +                         "Device-iotlb not declared support for vIOMMU");
>> with current vhost code, vhost will then silently fallbac to UNMAP
>> notifier registration and this will succeed. It would be nice to clarify
>> whether the vIOMMU works with vhost in this downgraded mode (at least
>> ats=off and device-ioltb=off)?
> I'm slightly confused, why do we need to clarify that?
>
> As we have discussed, if a device with ATS capability got attached into a
> vIOMMU context that does not support ATS, then it should just work like
> without ATS without any warning.  Isn't this the case here?

Yes that's the theory and what should happen at baremetal level. However
I am not sure this is still true with the intel-iommu emulation/vhost
integration.
Remember we always assumed vhost was supported on intel with both ats=on
and device-iotlb=on if I am correct.

vhost/viommu integration requires unmap notifications to be properly
sent from viommu to vhost, would it be though DEVIOTLB_UNMAP or UNMAP
notifiers.
Does the intel-iommu/vhost works if both ats=off and device-iotlb=off or
ats=on and device-iotlb=off. This I am not sure. I gave it a try and I
got some errors but maybe that's something else...

On ARM I have always assumed both settings are off and so I am inclined
to think it works ;-)

Thanks

Eric

>
> Thanks,
>


