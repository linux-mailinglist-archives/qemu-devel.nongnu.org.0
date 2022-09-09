Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 130E65B3167
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Sep 2022 10:12:26 +0200 (CEST)
Received: from localhost ([::1]:40138 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oWZ7g-0008FK-Ef
	for lists+qemu-devel@lfdr.de; Fri, 09 Sep 2022 04:12:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54392)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1oWYyY-00036X-Eo
 for qemu-devel@nongnu.org; Fri, 09 Sep 2022 04:02:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:43183)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1oWYyM-00021l-1a
 for qemu-devel@nongnu.org; Fri, 09 Sep 2022 04:02:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662710565;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yzEprpmYDxZoU/iLdscba5yKn41f2daHNxZoCNCbLwo=;
 b=B3TlE6MIu6iSHO5pZPYOuzxtuXZR0QtPW6KUgC+qIzxvP8JmpJxWZsGuPllenSXQw08/K2
 pdhdDFqxio/bM+5oDAbPCEAgPehBLbeRWjTpq01ZFF9DFe/WutF4rS18DFIP4pkjN95MQG
 M6oqCp0eT/31iykwBAq9La875o21tmQ=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-377-RYW0xFmNP8So6VlN3nxCaA-1; Fri, 09 Sep 2022 04:02:44 -0400
X-MC-Unique: RYW0xFmNP8So6VlN3nxCaA-1
Received: by mail-qv1-f70.google.com with SMTP id
 n15-20020ad444af000000b004a2a341ad71so662444qvt.15
 for <qemu-devel@nongnu.org>; Fri, 09 Sep 2022 01:02:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=yzEprpmYDxZoU/iLdscba5yKn41f2daHNxZoCNCbLwo=;
 b=SE9ZEZ3SGphqiTSK9yRiKu+rhquVqw3bHFcF57ofP2UCRQcxSSIbWiZ/LpgNw1SZ2Z
 XI4545bfpzFWkfIv7WJyQFafqLJW3ASpEbcsZ8wxmpIICMtsemNjgUlRoaef/PFm9tYX
 09er6eonk5NWtk+RYqO0i/YdGsJ+LyjhPooqbBV/YPiFhdXOAiVgyGiznLPBaK15tC3t
 FzFO52VDlOLEP34aZ86d6kLRi5FdN6w2zVj/00t0IevBSVQK2CW5MvOh23cTv3ZEKbp0
 8Du6Fs2qAV8Jba/emQ+tMrZ3dI2st+Gzx/88lltgtDLW1iuZIKCEvFCcbQI6Ji9QkD7W
 l0yw==
X-Gm-Message-State: ACgBeo32yDwfY5RriPLpU6c6jJ4U7OxcP2lwWmZvZgFKAOeEa6FIpyXw
 cHVV9X0mUguTtesIUA2AOT2SNaVwroA6EPhvHjXE0hye3DkWtg25b3Wh9xYf8XeT0ds2PoghYuH
 dgI7NQduKi2ENGjs=
X-Received: by 2002:a05:620a:192a:b0:6bc:5bb:ffe6 with SMTP id
 bj42-20020a05620a192a00b006bc05bbffe6mr9337372qkb.268.1662710563625; 
 Fri, 09 Sep 2022 01:02:43 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4iEFAhLPrQKHexiJaIz+0O/BxP+mb3Uf6thTAzqXRTKL23hztrcJ82I1vFiM2v0zkIdQqdCQ==
X-Received: by 2002:a05:620a:192a:b0:6bc:5bb:ffe6 with SMTP id
 bj42-20020a05620a192a00b006bc05bbffe6mr9337364qkb.268.1662710563425; 
 Fri, 09 Sep 2022 01:02:43 -0700 (PDT)
Received: from ?IPV6:2a04:ee41:4:31cb:e591:1e1e:abde:a8f1?
 ([2a04:ee41:4:31cb:e591:1e1e:abde:a8f1])
 by smtp.gmail.com with ESMTPSA id
 s5-20020a05620a254500b006bb9e4b96e6sm934946qko.24.2022.09.09.01.02.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Sep 2022 01:02:42 -0700 (PDT)
Message-ID: <ce712ede-5d9a-5675-321a-afa402cd1d61@redhat.com>
Date: Fri, 9 Sep 2022 10:02:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [RFC PATCH 1/2] softmmu/memory: add missing begin/commit callback
 calls
Content-Language: en-US
To: Peter Xu <peterx@redhat.com>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Maxim Levitsky <mlevitsk@redhat.com>, kvm@vger.kernel.org
References: <20220816101250.1715523-1-eesposit@redhat.com>
 <20220816101250.1715523-2-eesposit@redhat.com> <Yv6UVMMX/hHFkGoM@xz-m1.local>
 <e5935ba7-dd60-b914-3b1d-fff4f8c01da3@redhat.com>
 <YwjVG+MR8ORLngjd@xz-m1.local> <YwqGtHrcsFrgzLzg@xz-m1.local>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
In-Reply-To: <YwqGtHrcsFrgzLzg@xz-m1.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -59
X-Spam_score: -6.0
X-Spam_bar: ------
X-Spam_report: (-6.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.142, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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



Am 27/08/2022 um 23:03 schrieb Peter Xu:
> On Fri, Aug 26, 2022 at 10:13:47AM -0400, Peter Xu wrote:
>> On Fri, Aug 26, 2022 at 03:53:09PM +0200, Emanuele Giuseppe Esposito wrote:
>>> What do you mean "will empty all regions with those listeners"?
>>> But yes theoretically vhost-vdpa and physmem have commit callbacks that
>>> are independent from whether region_add or other callbacks have been called.
>>> For kvm and probably vhost it would be no problem, since there won't be
>>> any list to iterate on.
>>
>> Right, begin()/commit() is for address space update, so it should be fine
>> to have nothing to commit, sorry.
> 
> Hold on..
> 
> When I was replying to your patch 2 and reading the code around, I fount
> that this patch does affect vhost..  see region_nop() hook and also vhost's
> version of vhost_region_addnop().  I think vhost will sync its memory
> layout for each of the commit(), and any newly created AS could emptify
> vhost memory list even if registered on address_space_memory.
> 
> The other thing is address_space_update_topology() seems to be only used by
> address_space_init().  It means I don't think there should have any
> listener registered to this AS anyway.. :) So iiuc this patch (even if
> converting to loop over per-as memory listeners) is not needed.
> 
Agree, dropping this patch :)

Emanuele


