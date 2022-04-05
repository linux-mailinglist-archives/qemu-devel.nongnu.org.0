Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CCDC4F2E24
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Apr 2022 13:55:44 +0200 (CEST)
Received: from localhost ([::1]:52840 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nbhmh-0006Bm-6E
	for lists+qemu-devel@lfdr.de; Tue, 05 Apr 2022 07:55:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48358)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nbhev-0001cO-JL
 for qemu-devel@nongnu.org; Tue, 05 Apr 2022 07:47:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:59170)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nbhen-0006jS-Fr
 for qemu-devel@nongnu.org; Tue, 05 Apr 2022 07:47:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649159250;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JRu2rpUbGCnMTYesStsr4shSbcPBkFKUG7ohyQ1PxYo=;
 b=ED7qRg7O1UPbRJCnat3TFLiOgqr7brn2dxqcRYg+aingTEmkH7cCQNw9CoHV8amJe41JXI
 Jpm5/O7I4OIt5fhKvazbVaXbzIMmR/3VYdQ0Kn2lbcdMFKhaIU8pGiFrzb2s1EgeK39I7X
 yT6nwy75qzmWCqu8J2yAriEigZ5hh6Y=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-557-quamuFw3Nba2aWhYAgKNYw-1; Tue, 05 Apr 2022 07:47:29 -0400
X-MC-Unique: quamuFw3Nba2aWhYAgKNYw-1
Received: by mail-ej1-f72.google.com with SMTP id
 m12-20020a1709062acc00b006cfc98179e2so6250778eje.6
 for <qemu-devel@nongnu.org>; Tue, 05 Apr 2022 04:47:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=JRu2rpUbGCnMTYesStsr4shSbcPBkFKUG7ohyQ1PxYo=;
 b=FqvWwr6M5TPjLaH5XD02OkX4wMqHCGXh8PBSt8LcSuLdQE3jHFBm3Hm9T9ZTlj5Yn6
 MNdNA0HZa1H1vvXHvXUGhv00QI3QBgEMBOlDRrnUFlrpNgpQcR+YMsCrLrW1+uxPlsyY
 zx0TZvynQrXRKmms0Lp++LvfqqtrdXkLhfMTpq7A+oc05+7LHHNOclnIytwmqtG4kpW5
 J6x2IqN8W3iLjJDtWzGmWoGzEwAO3BKMeVzAuJFDYgrsoVucY9Yp4WA9lxvLIPJ+9bwc
 3UYQ0OK9y+akyFigI2gyrI37wFy1Vu1Z83oYeu2pi5owD4D+7cjEllqkzrQric3+MyhI
 mSdw==
X-Gm-Message-State: AOAM53155N+VPVKilDP52Rp8BRG3OWakpzxFE78Mi/hOy6CuS78P3Rrt
 j5o/k5g/M256WgJFnlp+Kr8B8JUEt1KpmZVUQNu3ROCtP0ANyUFYhQKTuNwQM9n24Zrj5ygdWZy
 wu5p/quNRLNsT+sc=
X-Received: by 2002:a05:6402:43cc:b0:419:2486:6cd2 with SMTP id
 p12-20020a05640243cc00b0041924866cd2mr3168819edc.334.1649159248503; 
 Tue, 05 Apr 2022 04:47:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz50UEU2NPNt/DixMIu6Fgc25sCqa6PalAkqlcf/Zzed6lh/fpOe95qISvef/BPjmg3Xxw52w==
X-Received: by 2002:a05:6402:43cc:b0:419:2486:6cd2 with SMTP id
 p12-20020a05640243cc00b0041924866cd2mr3168768edc.334.1649159247909; 
 Tue, 05 Apr 2022 04:47:27 -0700 (PDT)
Received: from ?IPV6:2a02:8071:5055:3f20:ca91:ec4d:49ff:d0d1?
 ([2a02:8071:5055:3f20:ca91:ec4d:49ff:d0d1])
 by smtp.gmail.com with ESMTPSA id
 n27-20020a1709062bdb00b006da975173bfsm5515802ejg.170.2022.04.05.04.47.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Apr 2022 04:47:27 -0700 (PDT)
Message-ID: <2ee69a0b-8270-d9b3-9ddb-d31b5f5de82b@redhat.com>
Date: Tue, 5 Apr 2022 13:47:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] block/stream: Drain subtree around graph change
To: Kevin Wolf <kwolf@redhat.com>
References: <20220324125756.9950-1-hreitz@redhat.com>
 <YkwWbAoYmkVuHlQA@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <YkwWbAoYmkVuHlQA@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: eesposit@redhat.com, Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>,
 John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 05.04.22 12:14, Kevin Wolf wrote:
> Am 24.03.2022 um 13:57 hat Hanna Reitz geschrieben:
>> When the stream block job cuts out the nodes between top and base in
>> stream_prepare(), it does not drain the subtree manually; it fetches the
>> base node, and tries to insert it as the top node's backing node with
>> bdrv_set_backing_hd().  bdrv_set_backing_hd() however will drain, and so
>> the actual base node might change (because the base node is actually not
>> part of the stream job) before the old base node passed to
>> bdrv_set_backing_hd() is installed.
>>
>> This has two implications:
>>
>> First, the stream job does not keep a strong reference to the base node.
>> Therefore, if it is deleted in bdrv_set_backing_hd()'s drain (e.g.
>> because some other block job is drained to finish), we will get a
>> use-after-free.  We should keep a strong reference to that node.
>>
>> Second, even with such a strong reference, the problem remains that the
>> base node might change before bdrv_set_backing_hd() actually runs and as
>> a result the wrong base node is installed.
>>
>> Both effects can be seen in 030's TestParallelOps.test_overlapping_5()
>> case, which has five nodes, and simultaneously streams from the middle
>> node to the top node, and commits the middle node down to the base node.
>> As it is, this will sometimes crash, namely when we encounter the
>> above-described use-after-free.
>>
>> Taking a strong reference to the base node, we no longer get a crash,
>> but the resuling block graph is less than ideal: The expected result is
>> obviously that all middle nodes are cut out and the base node is the
>> immediate backing child of the top node.  However, if stream_prepare()
>> takes a strong reference to its base node (the middle node), and then
>> the commit job finishes in bdrv_set_backing_hd(), supposedly dropping
>> that middle node, the stream job will just reinstall it again.
>>
>> Therefore, we need to keep the whole subtree drained in
>> stream_prepare()
> That doesn't sound right. I think in reality it's "if we take the really
> big hammer and drain the whole subtree, then the bit that we really need
> usually happens to be covered, too".
>
> When you have a long backing chain and merge the two topmost overlays
> with streaming, then it's none of the stream job's business whether
> there is I/O going on for the base image way down the chain. Subtree
> drains do much more than they should in this case.

Yes, see the discussion I had with Vladimir.  He convinced me that this 
can’t be an indefinite solution, but that we need locking for graph 
changes that’s separate from draining, because (1) those are different 
things, and (2) changing the graph should influence I/O as little as 
possible.

I found this the best solution to fix a known case of a use-after-free 
for 7.1, though.

> At the same time they probably do too little, because what you're
> describing you're protecting against is not I/O, but graph modifications
> done by callbacks invoked in the AIO_WAIT_WHILE() when replacing the
> backing file. The callback could be invoked by I/O on an entirely
> different subgraph (maybe if the other thing is a mirror job)or it
> could be a BH or anything else really. bdrv_drain_all() would increase
> your chances, but I'm not sure if even that would be guaranteed to be
> enough - because it's really another instance of abusing drain for
> locking, we're not really interested in the _I/O_ of the node.

The most common instances of graph modification I see are QMP and block 
jobs finishing.  The former will not be deterred by draining, and we do 
know of one instance where that is a problem (see the bdrv_next() 
discussion).  Generally, it isn’t though.  (If it is, this case here 
won’t be the only thing that breaks.)

As for the latter, most block jobs are parents of the nodes they touch 
(stream is one notable exception with how it handles its base, and 
changing that did indeed cause us headache before), and so will at least 
be paused when a drain occurs on a node they touch.  Since pausing 
doesn’t affect jobs that have exited their main loop, there might be 
some problem with concurrent jobs that are also finished but yielding, 
but I couldn’t find such a case.

I’m not sure what you’re arguing for, so I can only assume.  Perhaps 
you’re arguing for reverting this patch, which I wouldn’t want to do, 
because at least it fixes the one known use-after-free case. Perhaps 
you’re arguing that we need something better, and then I completely agree.

>> so that the graph modification it performs is effectively atomic,
>> i.e. that the base node it fetches is still the base node when
>> bdrv_set_backing_hd() sets it as the top node's backing node.
> I think the way to keep graph modifications atomic is avoid polling in
> the middle. Not even running any callbacks is a lot safer than trying to
> make sure there can't be undesired callbacks that want to run.
>
> So probably adding drain (or anything else that polls) in
> bdrv_set_backing_hd() was a bad idea. It could assert that the parent
> node is drained, but it should be the caller's responsibility to do so.
>
> What streaming completion should look like is probably something like
> this:
>
>      1. Drain above_base, this also drains all parents up to the top node
>         (needed because in-flight I/O using an edge that is removed isn't
>         going to end well)
>
>      2. Without any polling involved:
>          a. Find base (it can't change without polling)
>          b. Update top->backing to point to base
>
>      3. End of drain.
>
> You don't have to keep extra references or deal with surprise removals
> of nodes because the whole thing is atomic when you don't poll. Other
> threads can't interfere either because graph modification requires the
> BQL.
>
> There is no reason to keep base drained because its I/O doesn't
> interfere with the incoming edge that we're changing.
>
> I think all of this is really relevant for Emanuele's work, which
> involves adding AIO_WAIT_WHILE() deep inside graph update functions. I
> fully expect that we would see very similar problems, and just stacking
> drain sections over drain sections that might happen to usually fix
> things, but aren't guaranteed to, doesn't look like a good solution.

I don’t disagree.  Well, I agree, actually.  But I don’t know what 
you’re proposing to actually do.  There is active discussion on how 
block graph changes should be handled on Emanuele’s series.

Hanna


