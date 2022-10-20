Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C940E60685A
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Oct 2022 20:42:03 +0200 (CEST)
Received: from localhost ([::1]:51908 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olZHH-0001dY-Kf
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 13:24:19 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olYrZ-0007tU-CV
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 12:57:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37032)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1olXAJ-0003UX-JF
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 11:09:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:36624)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1olXAI-0002fW-4V
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 11:08:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666278531;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GQ3dyElTQZpuiNzY8qlpiaTnLAs808Grj4avBqSktKw=;
 b=TzDAJM7I8a3R1DWXOnFlIuAuKF2T7fuUYHrEsGJlIb8m3BaAxLxk/EE8lgsXatB26EP1tu
 3zjtI5ggWdFbLEDPmrYJ7mRczqBGF3bGh3wBK3+k45404WIFM11aJqhoY39cFudcb5mGA4
 TEcR8FeM/XHeKknC3HIg9wb9FaHNzIY=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-217-KrjLmWC5NcyAAo2hr1nuLw-1; Thu, 20 Oct 2022 11:08:50 -0400
X-MC-Unique: KrjLmWC5NcyAAo2hr1nuLw-1
Received: by mail-qt1-f200.google.com with SMTP id
 ga23-20020a05622a591700b0039ceee61202so7871588qtb.2
 for <qemu-devel@nongnu.org>; Thu, 20 Oct 2022 08:08:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=GQ3dyElTQZpuiNzY8qlpiaTnLAs808Grj4avBqSktKw=;
 b=daQfurxUprurmAMlH/s83OeZL3ihS9yY89inagbLbkC4VwpQ/PqPTnRmqgNGC0r/ox
 usJPgG79OfY719LM8rplXobfbZ5pru1VbuwS1R0l5vH/RSaVuM3iQmxoO6nXFrPv+PfS
 852V2zsaM3ORn402gCytBmRsEmUC2U1armbjm8UalgSIx4zPyNrmLIvSq16IbIET4Inn
 c22LaP7h0L8Lramr/GzKtuR05nQs2OuHYwSbfKCMiGQLGecMG71SzbqIm4IZDmrof5Dc
 SSJde3+VRYqKwB3VZ+4xnfuaDCCREaYczu3uzvqciz7C7zt6ygHpPDHbef7MhRd8YiaI
 N20w==
X-Gm-Message-State: ACrzQf3HvV3McavDNbA6khyFVxAA8YwTmrrjuYkvqmNZi5nnWqKBRXfR
 81uQMAbH+K/EghghcJI8biYumBYdP7QB33WY3kUS7Wn6JJMbWC1g3NqH3hrO+IlB/nowI0P/5Ce
 K6EMcB5vPN8NUM9I=
X-Received: by 2002:a05:620a:4244:b0:6cf:8a7b:3224 with SMTP id
 w4-20020a05620a424400b006cf8a7b3224mr9667990qko.32.1666278529475; 
 Thu, 20 Oct 2022 08:08:49 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7Mk82y1w4IUblOwX4CtN0grxQ3paXzht3z6wWUQ6Z2aEgvGzoxxatl5GNWIuPDLGRd5a9rHQ==
X-Received: by 2002:a05:620a:4244:b0:6cf:8a7b:3224 with SMTP id
 w4-20020a05620a424400b006cf8a7b3224mr9667958qko.32.1666278529228; 
 Thu, 20 Oct 2022 08:08:49 -0700 (PDT)
Received: from [192.168.100.30] ([82.142.8.70])
 by smtp.gmail.com with ESMTPSA id
 q28-20020a05620a2a5c00b006eed14045f4sm7916260qkp.48.2022.10.20.08.08.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Oct 2022 08:08:48 -0700 (PDT)
Message-ID: <71247f91-a74e-e497-8376-488e399c8c43@redhat.com>
Date: Thu, 20 Oct 2022 17:08:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v12 10/17] net: dgram: make dgram_dst generic
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 xen-devel@lists.xenproject.org, Eric Blake <eblake@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Greg Kurz <groug@kaod.org>,
 Jason Wang <jasowang@redhat.com>, Anthony Perard
 <anthony.perard@citrix.com>, Thomas Huth <thuth@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Paul Durrant <paul@xen.org>,
 Stefan Weil <sw@weilnetz.de>, Markus Armbruster <armbru@redhat.com>,
 Stefano Brivio <sbrivio@redhat.com>
References: <20221020091624.48368-1-lvivier@redhat.com>
 <20221020091624.48368-11-lvivier@redhat.com>
 <15217f04-d689-7579-1501-320761b2f6e7@linaro.org>
From: Laurent Vivier <lvivier@redhat.com>
In-Reply-To: <15217f04-d689-7579-1501-320761b2f6e7@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=lvivier@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/20/22 13:17, Philippe Mathieu-Daudé wrote:
> On 20/10/22 11:16, Laurent Vivier wrote:
>> dgram_dst is a sockaddr_in structure. To be able to use it with
>> unix socket, use a pointer to a generic sockaddr structure.
>>
>> Rename it dest_addr, and store socket length in dest_len.
>>
>> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
>> Reviewed-by: Stefano Brivio <sbrivio@redhat.com>
>> Acked-by: Michael S. Tsirkin <mst@redhat.com>
>> ---
>>   net/dgram.c | 82 ++++++++++++++++++++++++++++++++++-------------------
>>   1 file changed, 53 insertions(+), 29 deletions(-)
> 
>>   static NetClientInfo net_dgram_socket_info = {
>> @@ -260,7 +263,7 @@ static NetDgramState *net_dgram_fd_init(NetClientState *peer,
>>                                           SocketAddress *mcast,
>>                                           Error **errp)
>>   {
>> -    struct sockaddr_in saddr;
>> +    struct sockaddr_in *saddr = NULL;
> 
> Preferrably g_autofree.

No, because saddr pointer is copied to s->dest_addr.

...
>> @@ -339,21 +342,24 @@ static int net_dgram_mcast_init(NetClientState *peer,
>>   {
>>       NetDgramState *s;
>>       int fd, ret;
>> -    struct sockaddr_in saddr;
>> +    struct sockaddr_in *saddr;
> 
> Preferrably:
> 
>    g_autofree struct sockaddr_in *saddr = NULL.

The same here.

Thanks,
Laurent


