Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C4DC561ED4
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Jun 2022 17:10:37 +0200 (CEST)
Received: from localhost ([::1]:59522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6voS-0000tg-Ho
	for lists+qemu-devel@lfdr.de; Thu, 30 Jun 2022 11:10:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48258)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1o6vnR-00006h-VK
 for qemu-devel@nongnu.org; Thu, 30 Jun 2022 11:09:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:49811)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1o6vnP-0001fg-4i
 for qemu-devel@nongnu.org; Thu, 30 Jun 2022 11:09:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656601769;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EuUanQ/BCDgHetRUMHgCCxrXYjF9FoXLuqFpeqvVUYg=;
 b=S2auSl30wRSRPALGdP/6jbYxDWrFKRkHdWYpjdiiUj84H7OfngNtpgU1d/hDnNcwCJbCUh
 tIZWAX+hRvZCgyzT/9hFc+IZFE36MNJ1wMCEBAr8nPFItXrQyU8L70/higFXduopisBW+j
 /Rcmno30c8l3vhwzOQv5AIVVfPr5H1c=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-481-clH4yZvrPtqN0UXRJ70jWQ-1; Thu, 30 Jun 2022 11:09:28 -0400
X-MC-Unique: clH4yZvrPtqN0UXRJ70jWQ-1
Received: by mail-qk1-f198.google.com with SMTP id
 m15-20020a05620a290f00b006a74cf760b2so19827584qkp.20
 for <qemu-devel@nongnu.org>; Thu, 30 Jun 2022 08:09:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=EuUanQ/BCDgHetRUMHgCCxrXYjF9FoXLuqFpeqvVUYg=;
 b=gJl9bTHXegpMjJA+ufOc0rOUE8Zrbn+5J1qbbf2ueSI53tSxsuADE73a2PG+Girb6X
 K9vO5zklCLGL90uHEerNWFyHMNnUs88kCObtxj3woLCnFLs/Le9yu/yhsN6fPTYvYFbF
 kxmrTlusihAxhjIxk0TQn4wN4Bn53yqJcJZVRPMGobImavH5otWZE46FAMlfmzVIlG5S
 e1PEDLN2oxVVInMU5fYzYoGD/XmtkE77DflQ/dE7au7KzcBcJ4KSu1RygOh9RtbRslrg
 bgHiHWgZyNEVk5/eKFE2iW4K8rHOWf2mMxW0n/sr95eYop1vDJj1zBL5HAbZzHZF9OAE
 CGhQ==
X-Gm-Message-State: AJIora/EqUVYH65D2lAceMJM8ARXQxRFh/tb9czuHanxfxKLeKKHZa91
 wkfRjf102qg4RjCKd6W9t2XgYTpq4v9RFaKoo+8hFg9ZTCdLEl7WiUosGWPdCaMsICzvq292gRA
 euoMQONwpTsGez0c=
X-Received: by 2002:a05:620a:2587:b0:6a7:ee6f:bf2a with SMTP id
 x7-20020a05620a258700b006a7ee6fbf2amr6794253qko.542.1656601767706; 
 Thu, 30 Jun 2022 08:09:27 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tYR9iSMny3ICo2kq+yhFNivXxnQRdxK2pCfofDyB9okhGziIAYsXFYDJOw4XakX1ltYTZdZQ==
X-Received: by 2002:a05:620a:2587:b0:6a7:ee6f:bf2a with SMTP id
 x7-20020a05620a258700b006a7ee6fbf2amr6794220qko.542.1656601767428; 
 Thu, 30 Jun 2022 08:09:27 -0700 (PDT)
Received: from [192.168.100.42] ([82.142.8.70])
 by smtp.gmail.com with ESMTPSA id
 i19-20020a05620a151300b006a91da2fc8dsm16037199qkk.0.2022.06.30.08.09.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Jun 2022 08:09:27 -0700 (PDT)
Message-ID: <6d71d083-f1d5-adf6-8a79-6a6509e66111@redhat.com>
Date: Thu, 30 Jun 2022 17:09:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v5 05/12] qapi: net: add stream and dgram netdevs
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, Eric Blake <eblake@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Jason Wang <jasowang@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Stefano Brivio <sbrivio@redhat.com>
References: <20220627154749.871943-1-lvivier@redhat.com>
 <20220627154749.871943-6-lvivier@redhat.com> <875ykjhg1x.fsf@pond.sub.org>
From: Laurent Vivier <lvivier@redhat.com>
In-Reply-To: <875ykjhg1x.fsf@pond.sub.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

On 29/06/2022 13:20, Markus Armbruster wrote:
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
...
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
>> +#
>> +# Since: 7.1
>> +##
>> +{ 'struct': 'NetdevDgramOptions',
>> +  'data': {
>> +    '*local':  'SocketAddress',
>> +    '*remote': 'SocketAddress' } }
> 
> Hard to see, but the space in "} }" is funny: it's U+00A0
> (NO-BREAK-SPACE) encoded in UTF-8.  Make it a plain old space, please.
> 

I'm sorry, this happens sometime because I use a french macintosh keyboard, and to do '}' 
I have to press alt+) and if I don't release fast enough 'alt' I produce an alt+space that 
seems to generate this (invisible) character code...
(I've the same problem with '|' = alt+shift+l, but bash doesn't like it)

I'm updating the series with all your comments.

Thank you for the reviews.

Laurent


