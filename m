Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 748285513F2
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jun 2022 11:16:46 +0200 (CEST)
Received: from localhost ([::1]:47892 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3DWT-0007wC-Ir
	for lists+qemu-devel@lfdr.de; Mon, 20 Jun 2022 05:16:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1o3DSM-0006M7-B3
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 05:12:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56427)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1o3DSI-0003Wy-4E
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 05:12:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655716340;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PBOKx49NehWhV/w5WZHl7IhP9B+kM7C5bgsxkAPVVDU=;
 b=CRLPVRiLHO0JKTpucIvBPXb2C7IxQgGXvW829Y9pjgG9j3ESiACN0MYsk7W5A6YnjVXXDZ
 wenCL2HPvYVIEXjsQSK6QGfPBugSgNS6KWG3M56UeqjarCbghVHMgYjnPhLZCJMk6pIlOw
 70zlowfs1fzJGmfoBOds4O1ztY2aK/s=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-44-yrOhSQSKMUecFVkU1Z0bZg-1; Mon, 20 Jun 2022 05:12:19 -0400
X-MC-Unique: yrOhSQSKMUecFVkU1Z0bZg-1
Received: by mail-qk1-f200.google.com with SMTP id
 w22-20020a05620a445600b006a6c18678f2so12474713qkp.4
 for <qemu-devel@nongnu.org>; Mon, 20 Jun 2022 02:12:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=PBOKx49NehWhV/w5WZHl7IhP9B+kM7C5bgsxkAPVVDU=;
 b=K/b6ScCZ3Ks7QfiNQWxv8y1jitmQaCNRynNX6tSk3Hax9Z3e/hwJQGKqASMvgoAyaU
 iLEsmRAgwtFmEQG/BSA28ZjqrMtwabYxZ0WE0/J8ZZrS88dD+X4Ao0jADVf98ryFjg5u
 Q7mQ96am/JySAptOvVV/tUlhRpi//RR9Xk2m4DHsUS2gRf4kAItKNXSI44U06F4ExZhS
 I+hvTj6VVpgaJVNu64dn/0zWxGo5SRxdHXO00k1jJ31cdJoY2iTRfQwW2NyIMDf6kkvO
 OdY01di6EiyPYksPJFSB46riaMmmg31I5Mag87B4iCrmVpEe+KrhPPWbODAO02rlFOWX
 d0+w==
X-Gm-Message-State: AJIora++M0KrIFWgzVaX2qhZkX+6eCrFH1t2Ulmwt+RWkeimis+N0rGE
 m2ci/qa9dI975CTdVCmNG+Ll0rl+MAwJfwAZIK//CtPFnX60mhkr82j+V/vkiufjhkEwgwcoRLs
 VuliTV2VZGUmdsyo=
X-Received: by 2002:ac8:5996:0:b0:305:1041:372e with SMTP id
 e22-20020ac85996000000b003051041372emr18240091qte.520.1655716338502; 
 Mon, 20 Jun 2022 02:12:18 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1v2c6/HYFXOjQfupOYYGrweI/VaA8ZH41O05SSSYf1+e8gJyXIgbeBf2g+h2FR+V4H+sq6R0w==
X-Received: by 2002:ac8:5996:0:b0:305:1041:372e with SMTP id
 e22-20020ac85996000000b003051041372emr18240076qte.520.1655716338097; 
 Mon, 20 Jun 2022 02:12:18 -0700 (PDT)
Received: from [192.168.100.42] ([82.142.8.70])
 by smtp.gmail.com with ESMTPSA id
 u11-20020a05620a454b00b006a74da327fcsm11721576qkp.99.2022.06.20.02.12.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Jun 2022 02:12:17 -0700 (PDT)
Message-ID: <a31f2370-71dc-4623-9966-eeab52b2632d@redhat.com>
Date: Mon, 20 Jun 2022 11:12:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [RFC PATCH v2 3/8] qapi: net: add stream and dgram netdevs
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org
References: <20220512080932.735962-1-lvivier@redhat.com>
 <20220512080932.735962-4-lvivier@redhat.com> <87fsld1wtw.fsf@pond.sub.org>
 <a2a0124d-5065-3c1e-9c84-8b6d92addfae@redhat.com>
 <87bkuugnet.fsf@pond.sub.org>
From: Laurent Vivier <lvivier@redhat.com>
In-Reply-To: <87bkuugnet.fsf@pond.sub.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=lvivier@redhat.com;
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

On 15/06/2022 13:46, Markus Armbruster wrote:
> Laurent Vivier <lvivier@redhat.com> writes:
> 
>> On 13/05/2022 13:44, Markus Armbruster wrote:
>>> Laurent Vivier <lvivier@redhat.com> writes:
>>>
>>>> Copied from socket netdev file and modified to use SocketAddress
>>>> to be able to introduce new features like unix socket.
>>>>
>>>> "udp" and "mcast" are squashed into dgram netdev, multicast is detected
>>>> according to the IP address type.
>>>> "listen" and "connect" modes are managed by stream netdev. An optional
>>>> parameter "server" defines the mode (server by default)
>>>>
>>>> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
>>>> ---
>>>>    hmp-commands.hx |   2 +-
>>>>    net/clients.h   |   6 +
>>>>    net/dgram.c     | 630 ++++++++++++++++++++++++++++++++++++++++++++++++
>>>>    net/hub.c       |   2 +
>>>>    net/meson.build |   2 +
>>>>    net/net.c       |  24 +-
>>>>    net/stream.c    | 425 ++++++++++++++++++++++++++++++++
>>>>    qapi/net.json   |  38 ++-
>>>>    8 files changed, 1125 insertions(+), 4 deletions(-)
>>>>    create mode 100644 net/dgram.c
>>>>    create mode 100644 net/stream.c
>>>>
...
>>>> diff --git a/net/net.c b/net/net.c
>>>> index 2aab7167316c..fd6b30a10c57 100644
>>>> --- a/net/net.c
>>>> +++ b/net/net.c
>>>> @@ -1015,6 +1015,8 @@ static int (* const net_client_init_fun[NET_CLIENT_DRIVER__MAX])(
>>>>    #endif
>>>>            [NET_CLIENT_DRIVER_TAP]       = net_init_tap,
>>>>            [NET_CLIENT_DRIVER_SOCKET]    = net_init_socket,
>>>> +        [NET_CLIENT_DRIVER_STREAM]    = net_init_stream,
>>>> +        [NET_CLIENT_DRIVER_DGRAM]     = net_init_dgram,
>>>>    #ifdef CONFIG_VDE
>>>>            [NET_CLIENT_DRIVER_VDE]       = net_init_vde,
>>>>    #endif
>>>> @@ -1097,6 +1099,8 @@ void show_netdevs(void)
>>>>        int idx;
>>>>        const char *available_netdevs[] = {
>>>>            "socket",
>>>> +        "stream",
>>>> +        "dgram",
>>>>            "hubport",
>>>>            "tap",
>>>>    #ifdef CONFIG_SLIRP
>>>> @@ -1606,7 +1610,25 @@ int net_init_clients(Error **errp)
>>>>     */
>>>>    static bool netdev_is_modern(const char *optarg)
>>>>    {
>>>> -    return false;
>>>> +    static QemuOptsList dummy_opts = {
>>>> +        .name = "netdev",
>>>> +        .implied_opt_name = "type",
>>>> +        .head = QTAILQ_HEAD_INITIALIZER(dummy_opts.head),
>>>> +        .desc = { { } },
>>>> +    };
>>>> +    const char *netdev;
>>>> +    QemuOpts *opts;
>>>> +    bool is_modern;
>>>> +
>>>> +    opts = qemu_opts_parse(&dummy_opts, optarg, true, &error_fatal);
>>>> +    netdev = qemu_opt_get(opts, "type");
>>>> +
>>>> +    is_modern = strcmp(netdev, "stream") == 0 ||
>>>> +                strcmp(netdev, "dgram") == 0;
>>>
>>> Crashes when user neglects to pass "type".
>>
>> I think "type" is always passed because of the '.implied_opt_name = "type"'. Am I wrong?
> 
> .implied_opt_name = "type" lets you shorten "type=T,..." to "T,...".  It
> doesn't make key "type" mandatory.  "-netdev id=foo" is still permitted.
> Even "-netdev ''" is.


In fact type is checked before by QAPI definition:

{ 'union': 'Netdev',
   'base': { 'id': 'str', 'type': 'NetClientDriver' },
   'discriminator': 'type',
...

As it's the discriminator it must be there.

   $ qemu-system-x86_64 -netdev id=foo
   qemu-system-x86_64: -netdev id=foo: Parameter 'type' is missing

...
>>>> diff --git a/qapi/net.json b/qapi/net.json
>>>> index b92f3f5fb444..eef288886e1b 100644
>>>> --- a/qapi/net.json
>>>> +++ b/qapi/net.json
>>>> @@ -7,6 +7,7 @@
>>>>    ##
>>>>    
>>>>    { 'include': 'common.json' }
>>>> +{ 'include': 'sockets.json' }
>>>>    
>>>>    ##
>>>>    # @set_link:
>>>> @@ -452,6 +453,37 @@
>>>>        '*vhostdev':     'str',
>>>>        '*queues':       'int' } }
>>>>    
>>>> +##
>>>> +# @NetdevStreamOptions:
>>>> +#
>>>> +# Configuration info for stream socket netdev
>>>> +#
>>>> +# @addr: socket address to listen on (server=true)
>>>> +#        or connect to (server=false)
>>>> +# @server: create server socket (default: true)
>>>> +#
>>>> +# Since: 7.1
>>>> +##
>>>> +{ 'struct': 'NetdevStreamOptions',
>>>> +  'data': {
>>>> +    'addr':   'SocketAddress',
>>>> +    '*server': 'bool' } }
>>>> +
>>>> +##
>>>> +# @NetdevDgramOptions:
>>>> +#
>>>> +# Configuration info for datagram socket netdev.
>>>> +#
>>>> +# @remote: remote address
>>>> +# @local: local address
>>>
>>> Defaults?
>>
>> We can't have a default because for multicast default is remoTe, and for unicast default
>> is local.
> 
> Well, the members are optional, so there must be some default behavior,
> which may or may not correspond to a single default value.  Regardless,
> what happens when a member is absent ought to be documented.

The code checks there is at least one of these options and reports an error if not.

if remote address is present and it's a multicast address, local address is optional.

otherwise local address is required and remote address is optional.
I've updated qemu-options.hx with that syntax.

Thanks,
Laurent


