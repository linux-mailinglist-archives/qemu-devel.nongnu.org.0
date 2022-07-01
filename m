Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9156A563076
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Jul 2022 11:42:23 +0200 (CEST)
Received: from localhost ([::1]:34654 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o7DAM-0000Sp-Ar
	for lists+qemu-devel@lfdr.de; Fri, 01 Jul 2022 05:42:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59358)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1o7D5A-0004AW-If
 for qemu-devel@nongnu.org; Fri, 01 Jul 2022 05:37:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44457)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1o7D55-0006Wn-Co
 for qemu-devel@nongnu.org; Fri, 01 Jul 2022 05:36:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656668210;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LEmxnRp5PaA7FTLwL5DE5xZHaT8yRlCJybRmoG/26OM=;
 b=fQiJv5GbZPhGXY3MVH73sqjko+6hEgg/GkWuXuVs0ftAAlXgB7YDXk+lL7zzUtWo9qMet0
 avk/XXW93cYyhLP/Y9m5Nvnuup1n0u8Y86F0Qelh5yQLTplzD7t0yNVcUaM7opCI5Kkc/d
 1PiGoCk+/8wSpVFqwfGvyys9t4Bmozc=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-394-uynPn4-LM-qOydxaR46D5g-1; Fri, 01 Jul 2022 05:36:49 -0400
X-MC-Unique: uynPn4-LM-qOydxaR46D5g-1
Received: by mail-qk1-f199.google.com with SMTP id
 de4-20020a05620a370400b006a9711bd9f8so1748008qkb.9
 for <qemu-devel@nongnu.org>; Fri, 01 Jul 2022 02:36:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=LEmxnRp5PaA7FTLwL5DE5xZHaT8yRlCJybRmoG/26OM=;
 b=fa41t3BtvM46IspVIQZ55yb8L7258J1sEde8Ck+N/0ulZAwFBFEM8J1Dda6cPbKGVf
 dSIakTmH6EBO107goLOS9RdEymBlCKqLgP+e7ZS+VbxGXW8VDc+/p/gWhO8bcRNOspaj
 BlgKnK52N2NcVBLXoRTFT3kS+HZjQUMaGduOREolwHq3ECAa8iPBO4CVMvxK/0EkPf92
 yl3Zn+/aIycqTY8GwKxc4uT2q0iAkqJXjO+FKa8IsiqTEhj/sx6WT7XtNT779kDWlRwS
 MHuMaJX9rUof2WanNjt79nYG4TV74yv8NEtLpyzKmpKN8B3FHmvfxtIl+HsXmxttzszj
 YYcA==
X-Gm-Message-State: AJIora8VOyui3dM2IC19+DZSlvkKfQhrboQjU6i5VX7RVsLDgrSsXHKE
 GBhQcJ7up6XY91DVY80qh7VF8Nnz4oYcMvu7XPNUDq3WCxcW5eOahJ4UCGsd6dVKOYwu1ehob6O
 Y9nYPVZZ2lKyCBgA=
X-Received: by 2002:a05:620a:4045:b0:6b1:86a9:c78c with SMTP id
 i5-20020a05620a404500b006b186a9c78cmr8315496qko.580.1656668208620; 
 Fri, 01 Jul 2022 02:36:48 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uErz5MEvfGPf4OOGaFdTL7u2X9FQuVET1d6KYwKHRn2+B0MPw3KNRVws5v73zh5YxdH+0z5g==
X-Received: by 2002:a05:620a:4045:b0:6b1:86a9:c78c with SMTP id
 i5-20020a05620a404500b006b186a9c78cmr8315485qko.580.1656668208357; 
 Fri, 01 Jul 2022 02:36:48 -0700 (PDT)
Received: from [192.168.100.42] ([82.142.8.70])
 by smtp.gmail.com with ESMTPSA id
 hj5-20020a05622a620500b00304fe5247bfsm13850909qtb.36.2022.07.01.02.36.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 01 Jul 2022 02:36:48 -0700 (PDT)
Message-ID: <6656b169-b2f2-930f-0638-d8304732f17d@redhat.com>
Date: Fri, 1 Jul 2022 11:36:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [RFC PATCH v4 10/11] qemu-sockets: introduce socket_uri()
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eric Blake <eblake@redhat.com>, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>
References: <20220623155317.675932-1-lvivier@redhat.com>
 <20220623155317.675932-11-lvivier@redhat.com> <871qv7hfsm.fsf@pond.sub.org>
From: Laurent Vivier <lvivier@redhat.com>
In-Reply-To: <871qv7hfsm.fsf@pond.sub.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

On 29/06/2022 13:26, Markus Armbruster wrote:
> Laurent Vivier <lvivier@redhat.com> writes:
> 
>> Format a string URI from a SocketAddress.
>>
>> Original code from hmp-cmds.c:SocketAddress_to_str()
>>
>> Replace 'tcp:' by 'inet:' (because 'inet' can be also 'udp').
> 
> This one's merely misleading.
> 
>> Replace 'tcp:' by 'vsock:' with vsock socket type.
> 
> This one's positively wrong: it makes a vsock address look like an inet
> address with CID misinterpreted as host.  Goes back to commit 9aca82ba31
> "migration: Create socket-address parameter"
> 
>> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
>> ---
>>   include/qemu/sockets.h |  2 +-
>>   monitor/hmp-cmds.c     | 23 +----------------------
>>   util/qemu-sockets.c    | 20 ++++++++++++++++++++
>>   3 files changed, 22 insertions(+), 23 deletions(-)
>>
>> diff --git a/include/qemu/sockets.h b/include/qemu/sockets.h
>> index 47194b9732f8..3e2ae7e21705 100644
>> --- a/include/qemu/sockets.h
>> +++ b/include/qemu/sockets.h
>> @@ -41,6 +41,7 @@ int unix_listen(const char *path, Error **errp);
>>   int unix_connect(const char *path, Error **errp);
>>   
>>   SocketAddress *socket_parse(const char *str, Error **errp);
>> +char *socket_uri(SocketAddress *addr);
>>   int socket_connect(SocketAddress *addr, Error **errp);
>>   int socket_listen(SocketAddress *addr, int num, Error **errp);
>>   void socket_listen_cleanup(int fd, Error **errp);
>> @@ -123,5 +124,4 @@ SocketAddress *socket_address_flatten(SocketAddressLegacy *addr);
>>    * Return 0 on success.
>>    */
>>   int socket_address_parse_named_fd(SocketAddress *addr, Error **errp);
>> -
>>   #endif /* QEMU_SOCKETS_H */
>> diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
>> index 47a27326eef7..eb0fe0a293b8 100644
>> --- a/monitor/hmp-cmds.c
>> +++ b/monitor/hmp-cmds.c
>> @@ -197,27 +197,6 @@ void hmp_info_mice(Monitor *mon, const QDict *qdict)
>>       qapi_free_MouseInfoList(mice_list);
>>   }
>>   
>> -static char *SocketAddress_to_str(SocketAddress *addr)
>> -{
>> -    switch (addr->type) {
>> -    case SOCKET_ADDRESS_TYPE_INET:
>> -        return g_strdup_printf("tcp:%s:%s",
>> -                               addr->u.inet.host,
>> -                               addr->u.inet.port);
>> -    case SOCKET_ADDRESS_TYPE_UNIX:
>> -        return g_strdup_printf("unix:%s",
>> -                               addr->u.q_unix.path);
>> -    case SOCKET_ADDRESS_TYPE_FD:
>> -        return g_strdup_printf("fd:%s", addr->u.fd.str);
>> -    case SOCKET_ADDRESS_TYPE_VSOCK:
>> -        return g_strdup_printf("tcp:%s:%s",
>> -                               addr->u.vsock.cid,
>> -                               addr->u.vsock.port);
>> -    default:
>> -        return g_strdup("unknown address type");
>> -    }
>> -}
>> -
>>   void hmp_info_migrate(Monitor *mon, const QDict *qdict)
>>   {
>>       MigrationInfo *info;
>> @@ -375,7 +354,7 @@ void hmp_info_migrate(Monitor *mon, const QDict *qdict)
>>           monitor_printf(mon, "socket address: [\n");
>>   
>>           for (addr = info->socket_address; addr; addr = addr->next) {
>> -            char *s = SocketAddress_to_str(addr->value);
>> +            char *s = socket_uri(addr->value);
>>               monitor_printf(mon, "\t%s\n", s);
>>               g_free(s);
>>           }
>> diff --git a/util/qemu-sockets.c b/util/qemu-sockets.c
>> index 13b5b197f9ea..4efc2ce8b074 100644
>> --- a/util/qemu-sockets.c
>> +++ b/util/qemu-sockets.c
>> @@ -1098,6 +1098,26 @@ int unix_connect(const char *path, Error **errp)
>>       return sock;
>>   }
>>   
>> +char *socket_uri(SocketAddress *addr)
>> +{
>> +    switch (addr->type) {
>> +    case SOCKET_ADDRESS_TYPE_INET:
>> +        return g_strdup_printf("inet:%s:%s",
>> +                               addr->u.inet.host,
>> +                               addr->u.inet.port);
>> +    case SOCKET_ADDRESS_TYPE_UNIX:
>> +        return g_strdup_printf("unix:%s",
>> +                               addr->u.q_unix.path);
>> +    case SOCKET_ADDRESS_TYPE_FD:
>> +        return g_strdup_printf("fd:%s", addr->u.fd.str);
>> +    case SOCKET_ADDRESS_TYPE_VSOCK:
>> +        return g_strdup_printf("vsock:%s:%s",
>> +                               addr->u.vsock.cid,
>> +                               addr->u.vsock.port);
>> +    default:
>> +        return g_strdup("unknown address type");
>> +    }
>> +}
>>   
>>   SocketAddress *socket_parse(const char *str, Error **errp)
>>   {
> 
> Why do you move and rename?  I'm not objecting, I just want to know the
> reason :)

I missed your comment before sending the v5.

I move and rename because this function is the counterpart for socket_parse(), so make the 
name similar and put the function in the same place.

Perhaps it should also be improved to display all the options ("keep-alive", "mptcp", ...) 
that socket_parse() is able to decode?

Thanks,
Laurent


