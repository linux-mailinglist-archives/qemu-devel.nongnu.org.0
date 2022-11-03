Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD1336187A6
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Nov 2022 19:37:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqf5U-00072H-VE; Thu, 03 Nov 2022 14:37:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oqf5J-0006wV-O6
 for qemu-devel@nongnu.org; Thu, 03 Nov 2022 14:37:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oqf5H-0005jX-KP
 for qemu-devel@nongnu.org; Thu, 03 Nov 2022 14:37:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667500618;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Uc6X0nRgT9K3rbzQhHoVjjhwSF9xmVYIW7xdbY02cU4=;
 b=Wk9Y/8DUrXL0ozJqFDofzaHWxyzqm7dNEWrfYYWtLs5KcbOupe/xQi4s4a2PUMxDAxawuU
 qAu3HGXgS2JOM3lARMJ0D0O0Zy0suFBonb8qUMGUtHeZ6GIykCQlXp7MpewNaqN31D5nQa
 +j3GKmBRGOr37BXaqoYkKZNTV8VJ18k=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-493-ZjSujGW5OtymtQc0MfYUZQ-1; Thu, 03 Nov 2022 14:36:56 -0400
X-MC-Unique: ZjSujGW5OtymtQc0MfYUZQ-1
Received: by mail-ed1-f69.google.com with SMTP id
 w4-20020a05640234c400b004631f8923baso1948424edc.5
 for <qemu-devel@nongnu.org>; Thu, 03 Nov 2022 11:36:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Uc6X0nRgT9K3rbzQhHoVjjhwSF9xmVYIW7xdbY02cU4=;
 b=Y0HbEixJznFNSwik/yqbiXI8GUF0qjXTXOz0RN2NsS0YcreAhYfV87YxO+6+k/dR+9
 YxDXoV8Ngu24Qr0QAGdQ9tH3rnr6onHgRh9Rt/DfCwAPL2qXYiR5rAZRQJuhRN8gM33N
 FuLnn9W6TwciQqh7y+ZuUbsQgzFnEDUc7HG3H5G1SjOgeGWtTh8HENXkiwtYewYR3RP5
 UYeoCxkHVQpobMEcpOVOOjtkIOQpRLL3v351ndkxCGRpVPwyZ5Jh1pYlZuRDd3gO56q3
 opTq7VYBN0N3AtmvZKq5yPtKCFHC5WXMggMriW1DNyYkVrs+W4ngaLApeKt2DIf+2ys0
 6vZw==
X-Gm-Message-State: ACrzQf1JUISikyYRT5QfGC9doC1k7uG/RgM4/7q5UTxk8n09Az449yBg
 Nsxcm97JN+vRoPKQagLyYxcyrUWAtzTG33Ab4vLO2IhAzj3QAThrlBNZdp1zmAFcCGiOGfa1RNi
 YZNk1fXYEQq3O9JU=
X-Received: by 2002:aa7:cd92:0:b0:456:cbb5:2027 with SMTP id
 x18-20020aa7cd92000000b00456cbb52027mr31635510edv.384.1667500615683; 
 Thu, 03 Nov 2022 11:36:55 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM78+fQWmV8RI0M73+KesfB9esznnfedWHk7EBHSvDMVA2Da3+GIKEHkCLnIoO/ZtOiyphoEuw==
X-Received: by 2002:aa7:cd92:0:b0:456:cbb5:2027 with SMTP id
 x18-20020aa7cd92000000b00456cbb52027mr31635484edv.384.1667500615470; 
 Thu, 03 Nov 2022 11:36:55 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:1c09:f536:3de6:228c?
 ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.googlemail.com with ESMTPSA id
 e19-20020a170906315300b0077b2b0563f4sm797066eje.173.2022.11.03.11.36.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Nov 2022 11:36:54 -0700 (PDT)
Message-ID: <dfb4906f-5fff-0430-a3c8-c1f660d3497d@redhat.com>
Date: Thu, 3 Nov 2022 19:36:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH 2/9] block-copy: add missing coroutine_fn annotations
Content-Language: en-US
To: Kevin Wolf <kwolf@redhat.com>
Cc: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, John Snow <jsnow@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Eric Blake <eblake@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-devel@nongnu.org
References: <20221103134206.4041928-1-eesposit@redhat.com>
 <20221103134206.4041928-3-eesposit@redhat.com>
 <8f24c24c-ca61-108c-924b-39465a3c67fe@redhat.com>
 <Y2QDPXegFTdpBy6S@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <Y2QDPXegFTdpBy6S@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.047,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 11/3/22 19:06, Kevin Wolf wrote:
> I think it can make sense to have coroutine_fn as a documentation for
> things that are only ever called in a coroutine even if they could
> theoretically also work outside of coroutine context.
> 
> Otherwise, when we want to introduce a coroutine_fn call somewhere, it's
> not only less obvious that it's even possible to do, but we'll have to
> add potentially many additional coroutine_fn annotations in the whole
> call chain in an otherwise unrelated patch.

This is true.  On the other hand, coroutine_fn also means "this is 
allowed to suspend", which may have implications on the need for locking 
in the caller.  So you need to judge case-by-case.

If there are good reasons to add the note, you could add an assertion 
that you are qemu_in_coroutine(), which notes that you are in a 
coroutine but you don't suspend.  In this case however I don't think 
it's likely that there will be a coroutine_fn call added later.

I guess I tend to err on the side of "it's good that it's not obvious 
that you can call a coroutine_fn", but I also need to correct myself as 
qemu_coroutine_yield() is not the only leaf; there is also 
qemu_co_queue_next() and qemu_co_queue_restart_all(), which are 
coroutine_fn because they rely on the queuing behavior of 
aio_co_enter().  In this case I violated my own rule because it is 
always a bug to call these functions outside coroutine context.

Paolo


