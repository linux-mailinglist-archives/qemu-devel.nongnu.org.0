Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D28CD6074B4
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Oct 2022 12:12:23 +0200 (CEST)
Received: from localhost ([::1] helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olp0n-0006Eo-SO
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 06:12:22 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oloSM-0006qI-54
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 05:36:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1oloSB-0006R8-GK
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 05:36:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1oloSA-00071w-2X
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 05:36:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666344992;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=K6+Nj7rw2ygq8wV7bZt+IrcWSvF1WDIQyRmejPr4x8M=;
 b=UswBF7Jx7bMXKnubRrcXa5mzsv010M864jp9zu9cYxZgrHskTU3nr6OwlFLsmzwsQ9EPt+
 OnFyS5IIRS30yrjRQhytrAeP3kQWXr+VBBRm+NGCzKOV3GaR89BWgQa2wMghxHOG8T2MiM
 xoivHoivMXoJ6+PVPk0WvPMOjvSj/gM=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-570-t8SZyr1FN9CttbZ8IyX36w-1; Fri, 21 Oct 2022 05:36:30 -0400
X-MC-Unique: t8SZyr1FN9CttbZ8IyX36w-1
Received: by mail-qt1-f197.google.com with SMTP id
 d12-20020a05622a100c00b0039ce6373d2cso2032417qte.9
 for <qemu-devel@nongnu.org>; Fri, 21 Oct 2022 02:36:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=K6+Nj7rw2ygq8wV7bZt+IrcWSvF1WDIQyRmejPr4x8M=;
 b=Bcdw1T/qzynOFdSWHVZlMbdOlwODtDazAtE1AQH+hka6nPbfYkB26SHY4xeIJ2PnM1
 tfUflTPZUWE67nz5H3XV1tr/Q8tR0Ojfys7XBKY2Rb14W1MrfzKhoQUp59sz02ffIdXN
 gGoRsAoKtGiKowE5c7D08gEClFLuVe1ntURbUwZwQ3/R56Kl/lcc/r+dysT3c1l+IEgv
 FFtC1p0LFgrW215FJOVdyZYnzc5wvODfOxRpmiC3UTKcDLxty1CYs7lSSdGEvEFa2BUC
 t0oUVqykQORbzS/O4yJkYzoFQxg/fVL9TQGHxHYAx8iWFp35+UwcmFcrQlFl7H1I6C/w
 1sag==
X-Gm-Message-State: ACrzQf3Ls/11bTYvWMJYk8WlCrZPeg9gNFaI6Sdk9Xbf9+Dn0gyE6s1k
 Bjy+k58wfPOiKUzfW4s9OjHkKgSnR+mkY7A4mD1pT226gf0I1AkQSRiX2YSxT+ihwJbgsn3CgFe
 ORU5OJqpjYlt69nk=
X-Received: by 2002:a37:ccc:0:b0:6eb:1095:e4d9 with SMTP id
 195-20020a370ccc000000b006eb1095e4d9mr12992357qkm.93.1666344989793; 
 Fri, 21 Oct 2022 02:36:29 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6LsNXsHJn0Hr35ZPPaELK7ir7BhcrwNfcxWQB/0oflDEFJ401P6SW83Ra/iR14SaWEQZaN6w==
X-Received: by 2002:a37:ccc:0:b0:6eb:1095:e4d9 with SMTP id
 195-20020a370ccc000000b006eb1095e4d9mr12992340qkm.93.1666344989540; 
 Fri, 21 Oct 2022 02:36:29 -0700 (PDT)
Received: from [192.168.100.30] ([82.142.8.70])
 by smtp.gmail.com with ESMTPSA id
 y13-20020a05620a25cd00b006bbf85cad0fsm9523029qko.20.2022.10.21.02.36.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Oct 2022 02:36:29 -0700 (PDT)
Message-ID: <30b445bb-a268-d2c9-209f-3b2390746749@redhat.com>
Date: Fri, 21 Oct 2022 11:36:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v13 17/17] net: stream: add QAPI events to report
 connection state
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>, Jason Wang <jasowang@redhat.com>
Cc: qemu-devel@nongnu.org, Paul Durrant <paul@xen.org>,
 Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Greg Kurz <groug@kaod.org>, Stefano Stabellini <sstabellini@kernel.org>,
 David Gibson <david@gibson.dropbear.id.au>, Eric Blake <eblake@redhat.com>,
 xen-devel@lists.xenproject.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Stefan Weil <sw@weilnetz.de>, Paolo Bonzini <pbonzini@redhat.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Anthony Perard <anthony.perard@citrix.com>,
 Stefano Brivio <sbrivio@redhat.com>
References: <20221020162558.123284-1-lvivier@redhat.com>
 <20221020162558.123284-18-lvivier@redhat.com> <87pmel4th4.fsf@pond.sub.org>
 <52e989b9-6f8d-99c6-ef04-3ce32006b002@redhat.com>
 <87lep935hn.fsf@pond.sub.org>
From: Laurent Vivier <lvivier@redhat.com>
In-Reply-To: <87lep935hn.fsf@pond.sub.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=lvivier@redhat.com;
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

On 10/21/22 11:12, Markus Armbruster wrote:
> Cc: Stefano Brivio
> 
> Laurent Vivier <lvivier@redhat.com> writes:
> 
>> On 10/21/22 07:48, Markus Armbruster wrote:
>>> Laurent Vivier <lvivier@redhat.com> writes:
>>>
>>>> The netdev reports NETDEV_STREAM_CONNECTED event when the backend
>>>> is connected, and NETDEV_STREAM_DISCONNECTED when it is disconnected.
>>>
>>> Use cases?
>>
>> This is asked by Stefano Brivio to allow libvirt to detect if connection to passt is lost and to restart passt.
> 
> Let's add something like this to the commit message:
> 
>      This lets libvirt notice when the connection is lost somehow, and
>      restart the peer (such as passt).
> 
> Who's working on the libvirt part?
> 
>> I have also a patch to add a "reconnect=seconds" option, but I didn't want to add it to this series.
> 
> It's okay to mention future work in commit messages, but not required.
> 
>>> Could similar event signalling be useful for other kinds of netdev
>>> backends?
>>
>> I was wondering, but it becomes more complicated to be generic.
> 
> Making something complicated and generic where a simpler special
> solution would do is the worst.
> 
> Not quite as bad (but still plenty bad) is making a few special
> solutions first, then replace them all with a generic solution.
> 
> I believe we should have a good, hard think on possible applications of
> a generic solution now.
> 
> There is no need to hold back this series for that.
> 
> If we conclude a generic solution is called for, we better replace this
> special solution before it becomes ABI.  Either by replacing it before
> we release it, or by keeping it unstable until we replace it.
> 

I sent the v14 few minutes before this email.

Jason, perhaps we can remove PATCH 17 from the series and only merge PATCH 1 to 16?

I will resend PATCH 17 in a new series with the reconnect option patch once this series is 
merged.

Thanks,
Laurent


