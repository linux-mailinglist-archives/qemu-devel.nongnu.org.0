Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 024BC55BA8F
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Jun 2022 16:43:13 +0200 (CEST)
Received: from localhost ([::1]:38380 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o5pxH-0000zC-Tu
	for lists+qemu-devel@lfdr.de; Mon, 27 Jun 2022 10:43:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57892)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1o5prD-00024r-T8
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 10:36:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36019)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1o5prA-0003Zy-0c
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 10:36:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656340609;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5wzr+fZV+GTzF2Smvoq/QUelLEopXdWjA0sB3X0SUOc=;
 b=OmzCoPh/b1DO6MU+5DAf75ABSjwYnRqtYPJ+Jp8usrf5TU/nOwhOHiQWDiKrPKuqNUJbjD
 UDhcUIY3veq7MeJey6gGx/rlWMbqoMHP5FvMEGi1IzcQR+HBNu116324IaB0d3jiuiASpT
 fDpSuCjruXrGurI2+sYVg+pNGEhz9ls=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-548-1xhwd0_GPGGs8Bl93EXOZQ-1; Mon, 27 Jun 2022 10:36:40 -0400
X-MC-Unique: 1xhwd0_GPGGs8Bl93EXOZQ-1
Received: by mail-qk1-f199.google.com with SMTP id
 bl27-20020a05620a1a9b00b0069994eeb30cso10248763qkb.11
 for <qemu-devel@nongnu.org>; Mon, 27 Jun 2022 07:36:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=5wzr+fZV+GTzF2Smvoq/QUelLEopXdWjA0sB3X0SUOc=;
 b=DGzS+pI/LXEVGvsQFF6vR1Dox7aar6Tiu1AqoiwW9Js89esw7yjJlY3tOuPjc/bKQl
 qx75Fhk54rS1BVlK8fFoK2f0akraxpQkscW4e4IvtMs/5LkC6FADTBrQYkLZtltG/WNj
 o/8WSEwwolMccz9P96O3rHBgRb533Bta1CzdvIKaXRA1qvHMKQEbkZbl4DDNr51UQMHt
 hCgES70aDvfHQRBpIQxSMGW1KZ7GC28eDpFSV38L45oe69OaxRWMNjEEu4MeXTVl2Ab0
 kKF3xQDoy8Po+/WeK30cI2Ar4XWsu5ItkrT9WXylemiayGf3yM+YayA8KQSJ9GvMSnQ5
 VnFA==
X-Gm-Message-State: AJIora+lDW1C9yuT81ENFZrNZdTOr83I+npOCPOlY7lGfgWEgpEMFdqK
 7L169VmMMOSWi9qxQzZbDLYO0GhlQh9YPqGPWIiWtwFanAg3uSRmiC1aSRy7HMa0j8w766VKrfQ
 xYkVKI6BMMi5YY0I=
X-Received: by 2002:a05:620a:40c2:b0:6a6:d274:dd96 with SMTP id
 g2-20020a05620a40c200b006a6d274dd96mr8420419qko.54.1656340600305; 
 Mon, 27 Jun 2022 07:36:40 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1t1i0w564UmkcjSNSrtjbuvZVRX2N1+U7ekVfpLGpT6jQ92527FDb7mdyfwzCwkBZV9EqKdEg==
X-Received: by 2002:a05:620a:40c2:b0:6a6:d274:dd96 with SMTP id
 g2-20020a05620a40c200b006a6d274dd96mr8420395qko.54.1656340599911; 
 Mon, 27 Jun 2022 07:36:39 -0700 (PDT)
Received: from [192.168.100.42] ([82.142.8.70])
 by smtp.gmail.com with ESMTPSA id
 s13-20020a05620a0bcd00b006addb0af23asm8102282qki.78.2022.06.27.07.36.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Jun 2022 07:36:39 -0700 (PDT)
Message-ID: <37ad02f3-364f-d420-e986-47ec4884407d@redhat.com>
Date: Mon, 27 Jun 2022 16:36:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [RFC PATCH v4 04/11] qapi: net: add stream and dgram netdevs
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eric Blake <eblake@redhat.com>, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>, Stefano Brivio <sbrivio@redhat.com>
References: <20220623155317.675932-1-lvivier@redhat.com>
 <20220623155317.675932-5-lvivier@redhat.com> <87a6a2bdpo.fsf@pond.sub.org>
From: Laurent Vivier <lvivier@redhat.com>
In-Reply-To: <87a6a2bdpo.fsf@pond.sub.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=lvivier@redhat.com;
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

On 24/06/2022 11:41, Markus Armbruster wrote:
> Laurent Vivier <lvivier@redhat.com> writes:
> 
>> Copied from socket netdev file and modified to use SocketAddress
>> to be able to introduce new features like unix socket.
>>
>> "udp" and "mcast" are squashed into dgram netdev, multicast is detected
>> according to the IP address type.
>> "listen" and "connect" modes are managed by stream netdev. An optional
>> parameter "server" defines the mode (server by default)
>>
>> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
>> Reviewed-by: Stefano Brivio <sbrivio@redhat.com>
>> ---
> 
> [...]
> 
>> diff --git a/qapi/net.json b/qapi/net.json
>> index d6f7cfd4d656..32a9b1a5ac6c 100644
>> --- a/qapi/net.json
>> +++ b/qapi/net.json
>> @@ -7,6 +7,7 @@
>>   ##
>>   
>>   { 'include': 'common.json' }
>> +{ 'include': 'sockets.json' }
>>   
>>   ##
>>   # @set_link:
>> @@ -566,6 +567,42 @@
>>       '*isolated':  'bool' },
>>     'if': 'CONFIG_VMNET' }
>>   
>> +##
>> +# @NetdevStreamOptions:
>> +#
>> +# Configuration info for stream socket netdev
>> +#
>> +# @addr: socket address to listen on (server=true)
>> +#        or connect to (server=false)
>> +# @server: create server socket (default: true)
>> +#
>> +# Since: 7.1
>> +##
>> +{ 'struct': 'NetdevStreamOptions',
>> +  'data': {
>> +    'addr':   'SocketAddress',
>> +    '*server': 'bool' } }
>> +
>> +##
>> +# @NetdevDgramOptions:
>> +#
>> +# Configuration info for datagram socket netdev.
>> +#
>> +# @remote: remote address
>> +# @local: local address
>> +#
>> +# The code checks there is at least one of these options and reports an error
>> +# if not. If remote address is present and it's a multicast address, local
>> +# address is optional. Otherwise local address is required and remote address
>> +# is optional.
> 
> I need to make a table to understand this.
> 
> 
>      @remote         @local      |   okay?
>      ----------------------------+--------
>      absent          present     |   yes
>      multicast       absent      |   yes
>      multicast       present     |   yes
>      not multicast   absent      |   no
>      not multicast   present     |   yes
> 
> Correct?

yes

> 
>> +#
>> +# Since: 7.1
>> +##
>> +{ 'struct': 'NetdevDgramOptions',
>> +  'data': {
>> +    '*local':  'SocketAddress',
>> +    '*remote': 'SocketAddress' } }
>> +
>>   ##
>>   # @NetClientDriver:
>>   #
>> @@ -579,8 +616,9 @@
>>   #        @vmnet-bridged since 7.1
>>   ##
>>   { 'enum': 'NetClientDriver',
>> -  'data': [ 'none', 'nic', 'user', 'tap', 'l2tpv3', 'socket', 'vde',
>> -            'bridge', 'hubport', 'netmap', 'vhost-user', 'vhost-vdpa',
>> +  'data': [ 'none', 'nic', 'user', 'tap', 'l2tpv3', 'socket', 'stream',
>> +            'dgram', 'vde', 'bridge', 'hubport', 'netmap', 'vhost-user',
>> +            'vhost-vdpa',
>>               { 'name': 'vmnet-host', 'if': 'CONFIG_VMNET' },
>>               { 'name': 'vmnet-shared', 'if': 'CONFIG_VMNET' },
>>               { 'name': 'vmnet-bridged', 'if': 'CONFIG_VMNET' }] }
>> @@ -610,6 +648,8 @@
>>       'tap':      'NetdevTapOptions',
>>       'l2tpv3':   'NetdevL2TPv3Options',
>>       'socket':   'NetdevSocketOptions',
>> +    'stream':   'NetdevStreamOptions',
>> +    'dgram':    'NetdevDgramOptions',
>>       'vde':      'NetdevVdeOptions',
>>       'bridge':   'NetdevBridgeOptions',
>>       'hubport':  'NetdevHubPortOptions',
>> diff --git a/qemu-options.hx b/qemu-options.hx
>> index 377d22fbd82f..03d58da6f8ed 100644
>> --- a/qemu-options.hx
>> +++ b/qemu-options.hx
>> @@ -2722,6 +2722,18 @@ DEF("netdev", HAS_ARG, QEMU_OPTION_netdev,
>>       "-netdev socket,id=str[,fd=h][,udp=host:port][,localaddr=host:port]\n"
>>       "                configure a network backend to connect to another network\n"
>>       "                using an UDP tunnel\n"
>> +    "-netdev stream,id=str[,server=on|off],addr.type=inet,addr.host=host,addr.port=port\n"
>> +    "-netdev stream,id=str[,server=on|off],addr.type=fd,addr.str=h\n"
>> +    "                configure a network backend to connect to another network\n"
>> +    "                using a socket connection in stream mode.\n"
> 
> This shows -netdev stream with address types 'inet' and 'fd' only.  Are
> address types 'unix' and and 'vsock' rejected?

Yes, in net_stream_client_init() we have a switch that manages only inet and fd (I'm going 
to update the patch because server and client doesn't manage the error in the same way).
This is updated in patch "net: stream: add unix socket".

> 
>> +    "-netdev dgram,id=str,remote.type=inet,remote.host=maddr,remote.port=port[,local.type=inet,local.host=addr]\n"
>> +    "-netdev dgram,id=str,remote.type=inet,remote.host=maddr,remote.port=port[,local.type=fd,local.str=h]\n"
>> +    "                configure a network backend to connect to a multicast maddr and port\n"
>> +    "                use 'local.host=addr' to specify the host address to send packets from\n"
> 
> I think we use ``local.host=addr`` markup.

ok

> 
> Since this part is about multicast, only remote.type=inet makes sense
> (other types can't be multicast).

right

> Are local address types 'unix' and 'vsock' rejected?

if the type is not inet, we go into the not multicast code, and it accepts only inet and fd.

> 
>> +    "-netdev dgram,id=str,local.type=inet,local.host=host,local.port=port[,remote.type=inet,remote.host=host,remote.port=port]\n"
>> +    "-netdev dgram,id=str,local.type=fd,local.str=h\n"
>> +    "                configure a network backend to connect to another network\n"
>> +    "                using an UDP tunnel\n"
> 
> Is this unicast only?

yes

> Are other combinations of local.type and remote.type rejected?

If we have remote, it must not be fd type and remote type must be equal to local type.
local type can only be inet or fd (updated with unix in patch "net: dgram: add unix socket")


>>   #ifdef CONFIG_VDE
>>       "-netdev vde,id=str[,sock=socketpath][,port=n][,group=groupname][,mode=octalmode]\n"
>>       "                configure a network backend to connect to port 'n' of a vde switch\n"
> 

Thanks,
Laurent


