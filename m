Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 11E615879FB
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Aug 2022 11:41:20 +0200 (CEST)
Received: from localhost ([::1]:59760 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oIoOs-0002Z4-Av
	for lists+qemu-devel@lfdr.de; Tue, 02 Aug 2022 05:41:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58400)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1oIoMy-00016v-2c
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 05:39:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:57879)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1oIoMu-0007wu-EQ
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 05:39:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659433155;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bUDQPbStJMTrHC09sfCdEfsqIn2TJKSysI1ZxH8d+Es=;
 b=AILV5XW5UMunlayhIoo8clUI5aNlHKKkkVq09A2vVXXz7ZD+jU6zZ8oRZgC3Ty/KpxwgWP
 OFICXcBfaTaeGdFoxakduuAPmRNBrWS4uB83zFZ5LeehiR4Eh2jiJxx3tHNYRfPAdaTGhC
 T8SLQXY1R1P8Rrr2QGI41VJALg2+dGg=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-477-FkMwo8qRNBq7fB-jr_ryuQ-1; Tue, 02 Aug 2022 05:39:14 -0400
X-MC-Unique: FkMwo8qRNBq7fB-jr_ryuQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 2-20020a1c0202000000b003a3497306a8so65253wmc.9
 for <qemu-devel@nongnu.org>; Tue, 02 Aug 2022 02:39:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=bUDQPbStJMTrHC09sfCdEfsqIn2TJKSysI1ZxH8d+Es=;
 b=ntEbtiVXrf5U1rC38Sxpsjd47tU5X2VGIdJTRQQT16/dbSV9uk0rxDCZK1t5a6hPC2
 p5YB8yA+pQC4U/0CrXfaYMxV/SMzANItKl8E1Z3r+o+tfIW3BoA79Sed7HPJ3mstuQ7j
 F7NQek6kdSuV+AyiD7HX+W7dnT1GX3j43awm26UQfo7QSJXQWCDJyXAeAe/sM6LyL1ee
 Qpk8i6m8fMlsTiC1kpkGOB1oHKU5rsAEfFT1nv5Khdih0b4QW/nXe37vZ54NdG3JsiAN
 68Nj6qXHNg9zAh0+3ZLn3POK/DG2knrzYLXDVcnFwnoJUkwVoWf0wvdp35nA1b2OMxJ0
 GVag==
X-Gm-Message-State: ACgBeo0LKEohCVzpqEkiwiRM3egyCyN2bWI6BNtP07WqBTW6VFv10dEY
 CA0d2DBoi0B7iOAWtqtLB+FCXbN5nbl6xOzp2mvyLtw+IGAQT44/mYBddyfGUHRqdhyavgWnQqx
 +FmR7gqky1rzyvwI=
X-Received: by 2002:a5d:464c:0:b0:220:26a8:d2f2 with SMTP id
 j12-20020a5d464c000000b0022026a8d2f2mr8694675wrs.309.1659433152885; 
 Tue, 02 Aug 2022 02:39:12 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7qZnDTur01N4dmSW2nwLuWl2qxTjg+dIs/DO9Wad45WdT8PW5IhY79cvC9sDK149hhgGRxAg==
X-Received: by 2002:a5d:464c:0:b0:220:26a8:d2f2 with SMTP id
 j12-20020a5d464c000000b0022026a8d2f2mr8694657wrs.309.1659433152656; 
 Tue, 02 Aug 2022 02:39:12 -0700 (PDT)
Received: from [192.168.100.42] ([82.142.8.70])
 by smtp.gmail.com with ESMTPSA id
 k41-20020a05600c1ca900b003a2e5f536b3sm24102839wms.24.2022.08.02.02.39.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Aug 2022 02:39:12 -0700 (PDT)
Message-ID: <b5b66160-d0a5-c5f8-4060-8afdcba7a930@redhat.com>
Date: Tue, 2 Aug 2022 11:39:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v7 05/14] qapi: net: add stream and dgram netdevs
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, Eric Blake <eblake@redhat.com>,
 Thomas Huth <thuth@redhat.com>, "Dr. David Alan Gilbert"
 <dgilbert@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>, Stefano Brivio <sbrivio@redhat.com>
References: <20220722190442.301310-1-lvivier@redhat.com>
 <20220722190442.301310-6-lvivier@redhat.com> <874jyvujlo.fsf@pond.sub.org>
From: Laurent Vivier <lvivier@redhat.com>
In-Reply-To: <874jyvujlo.fsf@pond.sub.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=lvivier@redhat.com;
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

On 02/08/2022 10:37, Markus Armbruster wrote:
> Laurent Vivier <lvivier@redhat.com> writes:
> 
...
>> diff --git a/qemu-options.hx b/qemu-options.hx
>> index 79e00916a11f..170117e1adf0 100644
>> --- a/qemu-options.hx
>> +++ b/qemu-options.hx
>> @@ -2726,6 +2726,18 @@ DEF("netdev", HAS_ARG, QEMU_OPTION_netdev,
>>       "-netdev socket,id=str[,fd=h][,udp=host:port][,localaddr=host:port]\n"
>>       "                configure a network backend to connect to another network\n"
>>       "                using an UDP tunnel\n"
>> +    "-netdev stream,id=str[,server=on|off],addr.type=inet,addr.host=host,addr.port=port\n"
>> +    "-netdev stream,id=str[,server=on|off],addr.type=fd,addr.str=h\n"
>> +    "                configure a network backend to connect to another network\n"
>> +    "                using a socket connection in stream mode.\n"

 From v6:
> This part needs to match NetdevStreamOptions above.
> 
> Missing here: the optional members of InetSocketAddress: numeric, to,
> ipv4, ...  Do we care?

At this patch level, no, because we decode them manually and not using 
socket_connect()/socket_listen(). But the doc should be updated for PATCH 13/14 as I move 
stream.c to QIO.

> 
> The next part needs to match NetdevDgramOptions above.


>> +    "-netdev dgram,id=str,remote.type=inet,remote.host=maddr,remote.port=port[,local.type=inet,local.host=addr]\n"
>> +    "-netdev dgram,id=str,remote.type=inet,remote.host=maddr,remote.port=port[,local.type=fd,local.str=h]\n"
>> +    "                configure a network backend to connect to a multicast maddr and port\n"
>> +    "                use ``local.host=addr`` to specify the host address to send packets from\n"

 From v6:
> I figure this covers table rows
> 
>    #    @remote         @local      |   okay?
>    #    ----------------------------+--------
>    #    multicast       absent      |   yes
>    #    multicast       present     |   yes
> 
> for remote.type=inet and any local.type.
> 
> What about remote.type=fd?

multicast is only supported with remote.type=inet, not fd or unix

In net_dgram_init(), we initiate a multicast connection if remote.type is inet and address 
type is multicast, otherwise it's an unicast connection.

>> +    "-netdev dgram,id=str,local.type=inet,local.host=addr,local.port=port[,remote.type=inet,remote.host=addr,remote.port=port]\n"

 From v6:
> I figure this covers table rows
> 
>     #    absent          present     |   yes
>     #    not multicast   present     |   yes
> 
> for *.type=inet.


>> +    "-netdev dgram,id=str,local.type=fd,local.str=h\n"
>> +    "                configure a network backend to connect to another network\n"
>> +    "                using an UDP tunnel\n"

 From v6:
> I figure this covers table row
> 
>    #    absent          present     |   yes
> 
> for local.type=fd.
> 
> Together, they cover table row
> 
>     #    absent          present     |   yes
> 
> for any local.type.  Good.
> 
> Table row
> 
>     #    not multicast   present     |   yes
> 
> is only covered for *.type=inet.  Could either of the types be fd?

In v7, I've update the table to include the case of fd:

     =============  ========  =====
     remote         local     okay?
     =============  ========  =====
     absent         absent    no
     absent         not fd    no
     absent         fd        yes
     multicast      absent    yes
     multicast      present   yes
     not multicast  absent    no
     not multicast  present   yes
     =============  ========  =====

For local, if it's not specified otherwise, fd is supported.
Remote and local type must be the same (inet or unix), if local is fd, remote must not be 
provided.

Thanks,
Laurent


