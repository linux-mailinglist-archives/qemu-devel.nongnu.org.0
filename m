Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EBD35326B7
	for <lists+qemu-devel@lfdr.de>; Tue, 24 May 2022 11:44:05 +0200 (CEST)
Received: from localhost ([::1]:42378 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntR5A-0007eG-Cl
	for lists+qemu-devel@lfdr.de; Tue, 24 May 2022 05:44:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39630)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1ntQfA-0002q8-QG; Tue, 24 May 2022 05:17:13 -0400
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b]:39855)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1ntQf9-0003MN-0W; Tue, 24 May 2022 05:17:12 -0400
Received: by mail-ej1-x62b.google.com with SMTP id gh17so20982733ejc.6;
 Tue, 24 May 2022 02:17:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=bTAJ811guEVrRQrh7MF5NPXjazSBLoDRvY8lgeQsM4M=;
 b=UKxoOY8biEacVdCVLvIPcmKF1NIT2M4CdQ2rdhf96ZjuwbOzGMWXKETwzjGScx7V/7
 ruceuDMH8aYlmemlE2pmsvltboDybuP7/rz/oYoXmci55aQ9OL+hQCEDdycVMDb1Hs+3
 3Y4yuAUo3M+jDdtNZSVxou41YdFUs4AkjkcDQytVV7ZstxZWy66hbxSLTvZGkzwStTx7
 ol/eTYWWd5c/Yso/ZDsgrzSaVvpiCcuYulskKY4UASgH9ndk3v2BnSHh0M+siarB2JIR
 rhKvg9ZpYZYx4undViFVeRumrFvd/g58ryKpyBBbwkb9mO30YHaLGAiWmRgO1usB3ozf
 gF0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=bTAJ811guEVrRQrh7MF5NPXjazSBLoDRvY8lgeQsM4M=;
 b=LczQXnBgWURmhtAw/JqN1uS/83zqmfXrlWGR2GpTuhzBQW37gjBXZwIF3wrjfi804+
 vOTwWizwOlI3Rt7lgW3lLQeaAjPEjOxTphFNj1uODWXY+PfOzY2LjfTh2Pl/mljZuaGD
 koNq5Kk2+UVwByI1DRUxhlF9bIBBGM+gSBK5LfnnZu+M7Zp+GCq3h6fhgE96J3nYoC+F
 M5S1OfLSEWWQiYEHZOHdWuzrjkF6qdTp6opNhh7fVwYIrv52ChAyHLeK2LQABwFsZM/y
 x4stbBQWCFk5wQIuwPfMge+97jw9h7a5VgO4ety5+TM30qesO+nrwJzGp8/Op3BnHr0f
 ZnEA==
X-Gm-Message-State: AOAM530fhUPCGwtQwERJBdYTSd6wTY/075G9eAoCtchza47ysjMPp7to
 gi/5WevV1PEztBBdLURLZ9w=
X-Google-Smtp-Source: ABdhPJz2URDoEJTrUq3E6WzD+Vyd7TMJEv3Io5aW2NiSxZZ7fjF8P6N3+tnsBeGJJ0i7tNvbg2LN0Q==
X-Received: by 2002:a17:907:c06:b0:6fa:94f3:df with SMTP id
 ga6-20020a1709070c0600b006fa94f300dfmr23651215ejc.411.1653383827618; 
 Tue, 24 May 2022 02:17:07 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:9af8:e5f5:7516:fa89?
 ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.googlemail.com with ESMTPSA id
 b24-20020aa7dc18000000b0042617ba63cfsm9207801edu.89.2022.05.24.02.17.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 May 2022 02:17:07 -0700 (PDT)
Message-ID: <584d7d1a-94cc-9ebb-363b-2fddb8d79f5b@redhat.com>
Date: Tue, 24 May 2022 11:17:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [RFC PATCH v2 0/8] Removal of AioContext lock, bs->parents and
 ->children: new rwlock
Content-Language: en-US
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: Kevin Wolf <kwolf@redhat.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, John Snow <jsnow@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Fam Zheng <fam@euphon.net>, qemu-devel@nongnu.org
References: <20220426085114.199647-1-eesposit@redhat.com>
 <YnKB+SP678gNrAb1@stefanha-x1.localdomain>
 <YoN/935E4MfinZFQ@stefanha-x1.localdomain>
 <cc5e12d1-d25f-d338-bff2-0d3f5cc0def7@redhat.com>
 <6fc3e40e-7682-b9dc-f789-3ca95e0430db@redhat.com>
 <YoUbWYfl0Bft3LiU@redhat.com> <YopRejAj7AbIXH9i@stefanha-x1.localdomain>
 <67993f7d-bc84-9929-0a28-10a441c3d5bd@redhat.com>
 <YoySiI+ReM2O8WEs@stefanha-x1.localdomain>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <YoySiI+ReM2O8WEs@stefanha-x1.localdomain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x62b.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

On 5/24/22 10:08, Stefan Hajnoczi wrote:
> On Tue, May 24, 2022 at 09:55:39AM +0200, Paolo Bonzini wrote:
>> On 5/22/22 17:06, Stefan Hajnoczi wrote:
>>> However, I hit on a problem that I think Emanuele and Paolo have already
>>> pointed out: draining is GS & IO. This might have worked under the 1 IOThread
>>> model but it does not make sense for multi-queue. It is possible to submit I/O
>>> requests in drained sections. How can multiple threads be in drained sections
>>> simultaneously and possibly submit further I/O requests in their drained
>>> sections? Those sections wouldn't be "drained" in any useful sense of the word.
>>
>> Yeah, that works only if the drained sections are well-behaved.
>>
>> "External" sources of I/O are fine; they are disabled using is_external, and
>> don't drain themselves I think.
> 
> I/O requests for a given BDS may be executing in multiple AioContexts,
> so how do you call aio_disable_external() on all relevant AioContexts?

With multiqueue yeah, we have to replace aio_disable_external() with 
drained_begin/end() callbacks; but I'm not talking about that yet.

>> In parallel to the block layer discussions, it's possible to work on
>> introducing a request queue lock in virtio-blk and virtio-scsi.  That's the
>> only thing that relies on the AioContext lock outside the block layer.
> 
> I'm not sure what the request queue lock protects in virtio-blk? In
> virtio-scsi I guess a lock is needed to protect SCSI target emulation
> state?

Yes, but even in virtio-blk there is this code that runs in the main 
thread and is currently protected by aio_context_acquire/release:

     blk_drain(s->blk);

     /* We drop queued requests after blk_drain() because blk_drain()
      * itself can produce them. */
     while (s->rq) {
         req = s->rq;
         s->rq = req->next;
         virtqueue_detach_element(req->vq, &req->elem, 0);
         virtio_blk_free_request(req);
     }

Maybe it's safe to run it without a lock because it runs after 
virtio_set_status(vdev, 0) but I'd rather play it safe and protect s->rq 
with a lock.

Paolo

