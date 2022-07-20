Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C5EC57B607
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jul 2022 13:57:48 +0200 (CEST)
Received: from localhost ([::1]:48218 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oE8Kp-00029N-Jk
	for lists+qemu-devel@lfdr.de; Wed, 20 Jul 2022 07:57:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1oE8B5-0002SY-Gl
 for qemu-devel@nongnu.org; Wed, 20 Jul 2022 07:47:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55756)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1oE8B3-0004y6-BA
 for qemu-devel@nongnu.org; Wed, 20 Jul 2022 07:47:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658317660;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nqQpNpnyvirWjZGWCrCQf7p8OQQk7YyagsbGAfZY3qs=;
 b=XIaOmHoNF5uiL0mfXMRg8NlaL3w2+X7t/OmRYl8a8gcykF0kKPNXBmBp5zj/RQVjchO4AS
 58K/kuWpDsj/aDWeT8n+c5gtrG6G7YEY2yRVicKNKfLv0vzAQHnBaIIUhuOIKg1y1xkin2
 CoZZeDNgexQildodjVd3ZWyiIGPMiC4=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-232-QTMNQoQ5PBCpDRjwfCv2pg-1; Wed, 20 Jul 2022 07:47:37 -0400
X-MC-Unique: QTMNQoQ5PBCpDRjwfCv2pg-1
Received: by mail-wm1-f71.google.com with SMTP id
 p2-20020a05600c1d8200b003a3262d9c51so1130564wms.6
 for <qemu-devel@nongnu.org>; Wed, 20 Jul 2022 04:47:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=nqQpNpnyvirWjZGWCrCQf7p8OQQk7YyagsbGAfZY3qs=;
 b=drj1xlEF1weGckh2LpjZ7yXhdUqR44DYrGsNPU0TVR2JAz2NjYcUoPoMhSWxVq5aoR
 bgrARADXXEULfkDj5JEpaIC7XJ1U/ZPGtaQvaoOPK75GJfQwqbR/Z+EMCBjjXsS+tSEr
 zGLy6oK1uKac/jKCRXdsLkNWjaS6vapy3WDJisTIEk8YwjvnDJf7lV9dwTVygo/4Zo2S
 y3OrqRkZwoDELZcM5bJW8KWDQ1eN48eGXF3adsp2t3VwgsBUbklZjyo6LtIpbCwCr6Z3
 5Gqwof9qLzTv5a6i95jHkwC3nSIe7MtB1//yp3/7QyOAmYhG8WNajRVHepRA+tr1gdIx
 TQNA==
X-Gm-Message-State: AJIora/BiVNDcKKxlSMdBAvyy+r4DD1yQTv1UdLtGDPcnqohx7rci89X
 74nuwlD3XhqnAmy7eFjIVX53NOJGVvWOyFZfotv/UR2MGT0canHfDHJxmVgWUl3gzALRN2VibTY
 nVE2nwf7N9YyS7cY=
X-Received: by 2002:a05:600c:3845:b0:3a3:19e8:829e with SMTP id
 s5-20020a05600c384500b003a319e8829emr3335760wmr.11.1658317655789; 
 Wed, 20 Jul 2022 04:47:35 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tecEKuVd0dXgxydHp+PkM3Iy4XxygFdxR9zZaakaZvtIq6kCraHwWmRILIvHd/74IIzYmfVw==
X-Received: by 2002:a05:600c:3845:b0:3a3:19e8:829e with SMTP id
 s5-20020a05600c384500b003a319e8829emr3335745wmr.11.1658317655597; 
 Wed, 20 Jul 2022 04:47:35 -0700 (PDT)
Received: from [192.168.149.123]
 (58.254.164.109.static.wline.lns.sme.cust.swisscom.ch. [109.164.254.58])
 by smtp.gmail.com with ESMTPSA id
 bg13-20020a05600c3c8d00b003a3080eacb9sm1998471wmb.24.2022.07.20.04.47.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Jul 2022 04:47:35 -0700 (PDT)
Message-ID: <7c7ec5e1-38ba-dd14-1cfc-2262ba02fe08@redhat.com>
Date: Wed, 20 Jul 2022 13:47:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [RFC PATCH 7/8] block: use the new _change_ API instead of
 _can_set_ and _set_
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, John Snow <jsnow@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>, qemu-block@nongnu.org
References: <20220712211911.1302836-1-eesposit@redhat.com>
 <20220712211911.1302836-8-eesposit@redhat.com>
 <ea2b8793-532d-e7c1-c34f-a9ef89f8586d@redhat.com>
 <88e07fa2-60c9-0fb6-fc1b-b03a2f7d37f5@redhat.com>
 <79762fa3-74d5-ed08-8291-5534942c72b1@redhat.com>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
In-Reply-To: <79762fa3-74d5-ed08-8291-5534942c72b1@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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



Am 19/07/2022 um 20:07 schrieb Paolo Bonzini:
> On 7/19/22 11:57, Emanuele Giuseppe Esposito wrote:
>>
>> Wrapping the new drains in aio_context_acquire/release(new_context) is
>> not so much helpful either, since apparently the following
>> blk_set_aio_context makes aio_poll() hang.
>> I am not sure why, any ideas?
> 
> I'll take a look, thanks.  In any case this doesn't block this series,
> it was just a suggestion and blk_do_set_aio_context can be improved on top.
> 

Neither is the "using drain_begin/end_unlocked" part. That won't be
straightforward either. That will go in a future serie.

Emanuele


