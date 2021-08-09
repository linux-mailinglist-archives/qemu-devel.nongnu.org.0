Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF2DE3E3E41
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Aug 2021 05:24:30 +0200 (CEST)
Received: from localhost ([::1]:33382 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mCvtt-0001q8-9L
	for lists+qemu-devel@lfdr.de; Sun, 08 Aug 2021 23:24:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49688)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mCvse-0000o7-CE
 for qemu-devel@nongnu.org; Sun, 08 Aug 2021 23:23:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52285)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mCvsZ-0003xh-So
 for qemu-devel@nongnu.org; Sun, 08 Aug 2021 23:23:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628479385;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xe9uj/FEunskDw6GaK0hj8QWLWyf52Jf1BODUf4W7+Q=;
 b=DsZicx3ZodeaCwqc7H/+C7tl4Fc6AqSO32SG7WmVe3za0a0yzBhXL7w+dY/HNWj2bsEtSZ
 HVQrdXuBw72sRyZUZOuGRMEXfvk19EeJEKKubg9iKqX3nHB/Kv+1JIOhuSLx+ovZ4HZ67t
 DgWQRG8tkEfKPzrejeJvkcLvo3wL5cg=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-135-itBkmq6AMiWQ3OE1BndDvg-1; Sun, 08 Aug 2021 23:23:03 -0400
X-MC-Unique: itBkmq6AMiWQ3OE1BndDvg-1
Received: by mail-pj1-f72.google.com with SMTP id
 q63-20020a17090a17c5b02901774f4b30ebso15198620pja.1
 for <qemu-devel@nongnu.org>; Sun, 08 Aug 2021 20:23:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=xe9uj/FEunskDw6GaK0hj8QWLWyf52Jf1BODUf4W7+Q=;
 b=gLnEaTVn8JIl5oNPz0eGngAeFcAUpJKUIpIc7FcIKpu0UPKlwNHf2yiqrTbwlu8Wt+
 GBC7u6nqja9QCsOPOW2yAgZSvLdUB1xPXvWTJ8shCPN+T2tZiUgKzIfSrKBiJBNm4cxP
 egFR3rgVG0sT9YyPbpZ6AS4mwRqC8r+2oKt4neA2HWBHAd2BCtl5HBc9aWS/4OIRpxoW
 h+77prl5vmV+5Zj1mWt5SFZ6chPhLy74FTf9ajjpJRZjFcLjiHxIlMJCkDA4sjrBrBuu
 NVfYhlTG5pNvLcB728H+SV+iVJs9OJ+m8v7KE/I15hsKxi/7LAJ2B5rjIIkCVZoSQnmq
 auBQ==
X-Gm-Message-State: AOAM533Hn64WyE8mwqXjKztlaTG8gX6vS7o/cci5inljQGJ3k596EpeG
 ueI2rqqu8NfVwGjHKNej3HSLVOks+YyU1YmtX61BlPQsEWF7mDCdbS6p2VjoWDbd6lAXO/6jmfU
 Dlp6R2wQPADGH0Og=
X-Received: by 2002:a17:90a:bd18:: with SMTP id
 y24mr34021210pjr.83.1628479381380; 
 Sun, 08 Aug 2021 20:23:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJysBuK5RmhiHRKFB1N9sGCrzwVDMlE8g5g/WVRj3dMZRRgyQoowVwKjqP1iviZyZdN+ymHs2A==
X-Received: by 2002:a17:90a:bd18:: with SMTP id
 y24mr34021180pjr.83.1628479381065; 
 Sun, 08 Aug 2021 20:23:01 -0700 (PDT)
Received: from wangxiaodeMacBook-Air.local ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id u3sm14897425pfn.76.2021.08.08.20.22.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 08 Aug 2021 20:23:00 -0700 (PDT)
Subject: Re: [PATCH v3] net/macos: implement vmnet-based netdev
To: Markus Armbruster <armbru@redhat.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>
References: <20210708054451.9374-1-akihiko.odaki@gmail.com>
 <875ywhfnn6.fsf@dusky.pond.sub.org>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <c259cfd2-c13a-6e8b-35a7-79867e0018ea@redhat.com>
Date: Mon, 9 Aug 2021 11:22:56 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <875ywhfnn6.fsf@dusky.pond.sub.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.707,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: stefanha@gmail.com, thuth@redhat.com, hsp.cat7@gmail.com,
 qemu-devel@nongnu.org, Phillip Tennen <phillip@axleos.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


在 2021/8/7 下午8:24, Markus Armbruster 写道:
> Jason, did this fall through the cracks?


Kind of, will review this week.

6.2 material though.

Thanks


>
> My review is for the QAPI schema only.
>
> Akihiko Odaki <akihiko.odaki@gmail.com> writes:
>
>> From: Phillip Tennen <phillip@axleos.com>
>>
>> This patch implements a new netdev device, reachable via -netdev
>> vmnet-macos, that’s backed by macOS’s vmnet framework.
>>
>> The vmnet framework provides native bridging support, and its usage in
>> this patch is intended as a replacement for attempts to use a tap device
>> via the tuntaposx kernel extension. Notably, the tap/tuntaposx approach
>> never would have worked in the first place, as QEMU interacts with the
>> tap device via poll(), and macOS does not support polling device files.
>>
>> vmnet requires either a special entitlement, granted via a provisioning
>> profile, or root access. Otherwise attempts to create the virtual
>> interface will fail with a “generic error” status code. QEMU may not
>> currently be signed with an entitlement granted in a provisioning
>> profile, as this would necessitate pre-signed binary build distribution,
>> rather than source-code distribution. As such, using this netdev
>> currently requires that qemu be run with root access. I’ve opened a
>> feedback report with Apple to allow the use of the relevant entitlement
>> with this use case:
>> https://openradar.appspot.com/radar?id=5007417364447232
>>
>> vmnet offers three operating modes, all of which are supported by this
>> patch via the “mode=host|shared|bridge” option:
>>
>> * "Host" mode: Allows the vmnet interface to communicate with other
>> * vmnet
>> interfaces that are in host mode and also with the native host.
>> * "Shared" mode: Allows traffic originating from the vmnet interface to
>> reach the Internet through a NAT. The vmnet interface can also
>> communicate with the native host.
>> * "Bridged" mode: Bridges the vmnet interface with a physical network
>> interface.
>>
>> Each of these modes also provide some extra configuration that’s
>> supported by this patch:
>>
>> * "Bridged" mode: The user may specify the physical interface to bridge
>> with. Defaults to en0.
>> * "Host" mode / "Shared" mode: The user may specify the DHCP range and
>> subnet. Allocated by vmnet if not provided.
>>
>> vmnet also offers some extra configuration options that are not
>> supported by this patch:
>>
>> * Enable isolation from other VMs using vmnet
>> * Port forwarding rules
>> * Enabling TCP segmentation offload
>> * Only applicable in "shared" mode: specifying the NAT IPv6 prefix
>> * Only available in "host" mode: specifying the IP address for the VM
>> within an isolated network
>>
>> Note that this patch requires macOS 10.15 as a minimum, as this is when
>> bridging support was implemented in vmnet.framework.
>>
>> Rebased to commit 9aef0954195cc592e86846dbbe7f3c2c5603690a by Akihiko
>> Odaki.
>>
>> Signed-off-by: Phillip Tennen <phillip@axleos.com>
>> Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
>> Message-Id: <20210315103209.20870-1-akihiko.odaki@gmail.com>
> [...]
>
>> diff --git a/qapi/net.json b/qapi/net.json
>> index 7fab2e7cd8a..e3b67f174fc 100644
>> --- a/qapi/net.json
>> +++ b/qapi/net.json
>> @@ -452,6 +452,115 @@
>>       '*vhostdev':     'str',
>>       '*queues':       'int' } }
>>   
>> +##
>> +# @VmnetOperatingMode:
>> +#
>> +# The operating modes in which a vmnet netdev can run
>> +# Only available on macOS
> Generated qemu-qmp-ref.7 and .html show this as
>
>      The operating modes in which a vmnet netdev can run Only available
>      on macOS
>
> Please end your sentences with periods :)
>
> More of the same below.  Proof-reading the generated documentation is
> always a good idea, and often forgotten (I've been guilty of that, too).
>
>> +#
>> +# @host: the guest may communicate with the host
>> +#        and other guest network interfaces
>> +#
>> +# @shared: the guest may reach the Internet through a NAT,
> Scratch "a"?
>
>> +#          and may communicate with the host and other guest
>> +#          network interfaces
>> +#
>> +# @bridged: the guest's traffic is bridged with a
>> +#           physical network interface of the host
> "bridged width" or "bridged to"?  I'm not a networking guy...
>
>> +#
>> +# Since: 6.0
> 6.2
>
>> +##
>> +{ 'enum': 'VmnetOperatingMode',
>> +  'data': [ 'host', 'shared', 'bridged' ],
>> +  'if': 'defined(CONFIG_VMNET)' }
> I suspect we want 'defined(CONFIG_VMNET) && defined(CONFIG_DARWIN)',
> here and below.
>
>> +
>> +##
>> +# @NetdevVmnetModeOptionsBridged:
>> +#
>> +# Options for the vmnet-macos netdev
>> +# that are only available in 'bridged' mode
>> +# Only available on macOS
>> +#
>> +# @ifname: the physical network interface to bridge with
>> +#          (defaults to en0 if not specified)
> Scratch " if not specified".
>
>> +#
>> +# Since: 6.0
>> +##
>> +{ 'struct': 'NetdevVmnetModeOptionsBridged',
>> +  'data': { '*ifname':  'str' },
>> +  'if': 'defined(CONFIG_VMNET)' }
>> +
>> +##
>> +# @NetdevVmnetModeOptionsHostOrShared:
>> +#
>> +# Options for the vmnet-macos netdev
>> +# that are only available in 'host' or 'shared' mode
>> +# Only available on macOS
>> +#
>> +# @dhcp-start-address: the gateway address to use for the interface.
>> +#                      The range to dhcp_end_address is placed in the DHCP pool.
>> +#                      (only valid with mode=host|shared)
>> +#                      (must be specified with dhcp-end-address and
>> +#                       dhcp-subnet-mask)
>> +#                      (allocated automatically if unset)
>> +#
>> +# @dhcp-end-address: the DHCP IPv4 range end address to use for the interface.
>> +#                      (only valid with mode=host|shared)
>> +#                      (must be specified with dhcp-start-address and
>> +#                       dhcp-subnet-mask)
>> +#                      (allocated automatically if unset)
>> +#
>> +# @dhcp-subnet-mask: the IPv4 subnet mask (string) to use on the interface.
>> +#                    (only valid with mode=host|shared)
>> +#                    (must be specified with dhcp-start-address and
>> +#                     dhcp-end-address)
>> +#                    (allocated automatically if unset)
> No IPv6.  Is it because the underlying OS feature can't do it, or is it
> merely not implemented in QEMU, yet?
>
>> +#
>> +# Since: 6.0
>> +##
>> +{ 'struct': 'NetdevVmnetModeOptionsHostOrShared',
>> +  'data': {
>> +    '*dhcp-start-address': 'str' ,
>> +    '*dhcp-end-address':   'str',
>> +    '*dhcp-subnet-mask':   'str' },
>> +  'if': 'defined(CONFIG_VMNET)' }
>> +
>> +##
>> +# @NetdevVmnetModeOptions:
>> +#
>> +# Options specific to different operating modes of a vmnet netdev
> Suggest
>
>     # Options for a vmnet network interface backend.
>
>> +# Only available on macOS
>> +#
>> +# @mode: the operating mode vmnet should run in
>> +#
>> +# Since: 6.0
>> +##
>> +{ 'union': 'NetdevVmnetModeOptions',
>> +  'base': { 'mode': 'VmnetOperatingMode' },
>> +  'discriminator': 'mode',
>> +  'data': {
>> +    'bridged':      'NetdevVmnetModeOptionsBridged',
>> +    'host':         'NetdevVmnetModeOptionsHostOrShared',
>> +    'shared':       'NetdevVmnetModeOptionsHostOrShared' },
>> +  'if': 'defined(CONFIG_VMNET)' }
>> +
>> +##
>> +# @NetdevVmnetOptions:
>> +#
>> +# vmnet network backend
>> +# Only available on macOS
>> +#
>> +# @options: a structure specifying the mode and mode-specific options
>> +#           (once QAPI supports a union type as a branch to another union type,
>> +#            this structure can be changed to a union, and the contents of
>> +#            NetdevVmnetModeOptions moved here)
>> +#
>> +# Since: 6.0
>> +##
>> +{ 'struct': 'NetdevVmnetOptions',
>> +  'data': {'options': 'NetdevVmnetModeOptions' },
>> +  'if': 'defined(CONFIG_VMNET)' }
> Why do you need this wrapper struct?
>
>> +
>>   ##
>>   # @NetClientDriver:
>>   #
>> @@ -460,10 +569,13 @@
>>   # Since: 2.7
>>   #
>>   #        @vhost-vdpa since 5.1
>> +#
>> +#        @vmnet-macos since 6.0 (only available on macOS)
>>   ##
>>   { 'enum': 'NetClientDriver',
>>     'data': [ 'none', 'nic', 'user', 'tap', 'l2tpv3', 'socket', 'vde',
>> -            'bridge', 'hubport', 'netmap', 'vhost-user', 'vhost-vdpa' ] }
>> +            'bridge', 'hubport', 'netmap', 'vhost-user', 'vhost-vdpa',
>> +            { 'name': 'vmnet-macos', 'if': 'defined(CONFIG_VMNET)' } ] }
>>   
>>   ##
>>   # @Netdev:
>> @@ -477,6 +589,8 @@
>>   # Since: 1.2
>>   #
>>   #        'l2tpv3' - since 2.1
>> +#
>> +#        'vmnet-macos' since 6.0 (only available on macOS)
>>   ##
>>   { 'union': 'Netdev',
>>     'base': { 'id': 'str', 'type': 'NetClientDriver' },
>> @@ -492,7 +606,9 @@
>>       'hubport':  'NetdevHubPortOptions',
>>       'netmap':   'NetdevNetmapOptions',
>>       'vhost-user': 'NetdevVhostUserOptions',
>> -    'vhost-vdpa': 'NetdevVhostVDPAOptions' } }
>> +    'vhost-vdpa': 'NetdevVhostVDPAOptions',
>> +    'vmnet-macos': { 'type': 'NetdevVmnetOptions',
>> +                     'if': 'defined(CONFIG_VMNET)' } } }
>>   
>>   ##
>>   # @RxState:
>> diff --git a/qemu-options.hx b/qemu-options.hx
>> index f7210779409..5ff872b3e84 100644
>> --- a/qemu-options.hx
>> +++ b/qemu-options.hx
>> @@ -2609,6 +2609,15 @@ DEF("netdev", HAS_ARG, QEMU_OPTION_netdev,
>>   #ifdef __linux__
>>       "-netdev vhost-vdpa,id=str,vhostdev=/path/to/dev\n"
>>       "                configure a vhost-vdpa network,Establish a vhost-vdpa netdev\n"
>> +#endif
>> +#ifdef CONFIG_VMNET
>> +    "-netdev vmnet-macos,id=str,mode=bridged[,ifname=ifname]\n"
>> +    "         configure a macOS-provided vmnet network in \"physical interface bridge\" mode\n"
>> +    "         the physical interface to bridge with defaults to en0 if unspecified\n"
>> +    "-netdev vmnet-macos,id=str,mode=host|shared\n"
>> +    "                     [,dhcp_start_address=addr,dhcp_end_address=addr,dhcp_subnet_mask=mask]\n"
>> +    "         configure a macOS-provided vmnet network in \"host\" or \"shared\" mode\n"
>> +    "         the DHCP configuration will be set automatically if unspecified\n"
>>   #endif
>>       "-netdev hubport,id=str,hubid=n[,netdev=nd]\n"
>>       "                configure a hub port on the hub with ID 'n'\n", QEMU_ARCH_ALL)


