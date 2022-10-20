Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 08A29606518
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Oct 2022 17:52:14 +0200 (CEST)
Received: from localhost ([::1]:55694 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olXq8-00044O-53
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 11:52:12 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olXpx-0000Ik-V5
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 11:52:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37910)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1olUl3-0006PS-6L
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 08:34:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:29807)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1olUkx-0006Of-KQ
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 08:34:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666269277;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mt2w1QBu5mUEUGCycb5JqIv7fp2CZ53pt41k7x8rZME=;
 b=b7QYXlps3Y/N29Dco5DKx600UVzdhERO6fz13ce+izn+wjUm9ImYq2exvve6xY9jHTwlmH
 BVKPnR00JGlak0g/9jWkXUKGvUGhZMP4HgBUEiTn3W9srcWGu8sJnDiTueNAuKLpaOpKLd
 PqYxlfngTNitqdqX0Tu0Chthh96/Cwo=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-605-xEgI_Kc8N9iE_veqiav7dw-1; Thu, 20 Oct 2022 08:34:35 -0400
X-MC-Unique: xEgI_Kc8N9iE_veqiav7dw-1
Received: by mail-qk1-f199.google.com with SMTP id
 n13-20020a05620a294d00b006cf933c40feso17392401qkp.20
 for <qemu-devel@nongnu.org>; Thu, 20 Oct 2022 05:34:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=mt2w1QBu5mUEUGCycb5JqIv7fp2CZ53pt41k7x8rZME=;
 b=DT16MlOtbOMosYcsb//BZvHPCafjTfcqOLwe1svTrkRu8r3NhezMm2a8Rc1Xsjwg/d
 70+3cdTPOAexy+05l/D+1gvk1vc6OKYAfcHDWBX8KfsSiAvYKWYKikTjdM9q+czvUylg
 v+WIZB7aDVHhtJYsyf043PmfP8GnKnNsg00F4LuZNGicxCTfV5bFU2RIi33zkMl80U7P
 OBpTmy1Ixsenx+p5G86OtSt+tA29Ev/nt+Y/jQEqbQL6uQwVcWQNlL1A/kpiDWyXoeWO
 YzvG37OL5sObyFj8N7FhgPaXP5TJ08STHGB/Pxbt8uFwfYuNW2xwLC6jiwiJ4WPTtdbg
 h/oA==
X-Gm-Message-State: ACrzQf3dsSrbBGjsFjnRM9XSOpvCaB42Z33wx7T4xX1TO/BfLB7OeJVY
 qMc8KrGeTJQazqILCb09hnWVZTA4LfJM6b/j0WifqqhHAtAyIkcfJ4vIVKRlp/qNJjpViEi3BY4
 veDgb+nvl4e2+QNI=
X-Received: by 2002:a05:6214:d06:b0:4b4:6bdb:27a with SMTP id
 6-20020a0562140d0600b004b46bdb027amr10851280qvh.53.1666269274963; 
 Thu, 20 Oct 2022 05:34:34 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7fP3HMuFXt7aawzYaT0jG/mMYGPxNNhF3lZwbpu5H0c20tQBtgdm2nu8Y1S5zCEHjhLEkyAg==
X-Received: by 2002:a05:6214:d06:b0:4b4:6bdb:27a with SMTP id
 6-20020a0562140d0600b004b46bdb027amr10851260qvh.53.1666269274742; 
 Thu, 20 Oct 2022 05:34:34 -0700 (PDT)
Received: from [192.168.100.30] ([82.142.8.70])
 by smtp.gmail.com with ESMTPSA id
 l3-20020a37f903000000b006ee2953fac4sm6990779qkj.136.2022.10.20.05.34.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Oct 2022 05:34:33 -0700 (PDT)
Message-ID: <a835b361-4b3c-6dff-05dd-9c0e7a1a3624@redhat.com>
Date: Thu, 20 Oct 2022 14:34:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v11 17/17] net: stream: add QAPI events to report
 connection state
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, Stefano Stabellini <sstabellini@kernel.org>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Jason Wang <jasowang@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>, Greg Kurz <groug@kaod.org>,
 Eric Blake <eblake@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 Thomas Huth <thuth@redhat.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>, Paul Durrant <paul@xen.org>,
 David Gibson <david@gibson.dropbear.id.au>, xen-devel@lists.xenproject.org
References: <20221011200539.1486809-1-lvivier@redhat.com>
 <20221011200539.1486809-18-lvivier@redhat.com> <87mt9u4m9d.fsf@pond.sub.org>
 <7eaa3255-7580-7e06-8b28-ae60ed5e1be6@redhat.com>
 <87pmemdcam.fsf@pond.sub.org>
Content-Language: en-US
From: Laurent Vivier <lvivier@redhat.com>
In-Reply-To: <87pmemdcam.fsf@pond.sub.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=lvivier@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/20/22 12:22, Markus Armbruster wrote:
> Sorry for the slow replay, too many distractions...
> 
> Laurent Vivier <lvivier@redhat.com> writes:
> 
>> On 10/17/22 15:23, Markus Armbruster wrote:
>>> Laurent Vivier <lvivier@redhat.com> writes:
>>>
>>>> The netdev reports NETDEV_STREAM_CONNECTED event when the backend
>>>> is connected, and NETDEV_STREAM_EOC when it is disconnected.
>>>>
>>>> The NETDEV_STREAM_CONNECTED event includes the URI of the destination
>>>> address.
>>>>
>>>> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
>>>> Acked-by: Michael S. Tsirkin <mst@redhat.com>
> 
> [...]
> 
>>>> diff --git a/qapi/net.json b/qapi/net.json
>>>> index 6a1a49749294..69f83bceff3f 100644
>>>> --- a/qapi/net.json
>>>> +++ b/qapi/net.json
>>>> @@ -895,3 +895,49 @@
>>>>    ##
>>>>    { 'event': 'FAILOVER_NEGOTIATED',
>>>>      'data': {'device-id': 'str'} }
>>>> +
>>>> +##
>>>> +# @NETDEV_STREAM_CONNECTED:
>>>> +#
>>>> +# Emitted when the netdev stream backend is connected
>>>> +#
>>>> +# @netdev-id: QEMU netdev id that is connected
>>>> +# @uri: The Uniform Resource Identifier identifying the destination address
>>>
>>> Is an URI the appropriate representation here?  It's not how we specify
>>> such addresses elsewhere in QAPI/QMP...
>>
>> I put in the event the same information we have in info_str and displayed by the HMP command 'info network'. What would be a more appropriate reprensation?
> 
> SocketAddress?
> 

I agree SocketAddress looks better.

Thanks,
Laurent


