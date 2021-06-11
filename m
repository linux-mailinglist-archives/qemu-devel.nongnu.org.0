Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 427E43A4877
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Jun 2021 20:16:12 +0200 (CEST)
Received: from localhost ([::1]:46338 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrlhS-0006iD-RP
	for lists+qemu-devel@lfdr.de; Fri, 11 Jun 2021 14:16:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47636)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nsoffer@redhat.com>)
 id 1lrlfD-0005so-TM
 for qemu-devel@nongnu.org; Fri, 11 Jun 2021 14:13:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30030)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nsoffer@redhat.com>)
 id 1lrlf9-0004Nv-I6
 for qemu-devel@nongnu.org; Fri, 11 Jun 2021 14:13:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623435225;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NsLWANp+uXm8fusvRU/bRrHajgPQTQPM6FOXWT6jVGk=;
 b=FO063PCHWGb2ImazzQve93BcLbjMSLfP2PPveSUXA9rlLfEMafdgaVptUUdB076uueC2Rs
 jRg4TXUulLksX9GypHopdjLHgZ5lOhmqQyTZkJepzDA0Yos4hX87PHOPnMLBWgzC2Iyskm
 j/KeNJx2CVY33n0/iLwYOe/Bs5vf7Iw=
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com
 [209.85.167.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-371-r7c2-7VpMWe29-rnigcMMQ-1; Fri, 11 Jun 2021 14:13:43 -0400
X-MC-Unique: r7c2-7VpMWe29-rnigcMMQ-1
Received: by mail-oi1-f200.google.com with SMTP id
 r19-20020acaa8130000b02901f41b1b235bso3280767oie.9
 for <qemu-devel@nongnu.org>; Fri, 11 Jun 2021 11:13:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=NsLWANp+uXm8fusvRU/bRrHajgPQTQPM6FOXWT6jVGk=;
 b=trErYECrKIEtstVXBrMgMRNmftQZki7ZhHf0Tr2VILv8rO8T2xEyX2N0kS/7afW7oB
 ijufPbzdxirTAH9ZD+gVv/in3WwQunM2qT7rajPTwtGcXKv9H5qcKZxTQUaBqn5d6BRA
 03PF3Sl1JSyraRtoqHyJCdjFSebtWREXo1QaggkwaT7/BcHNAoH7ytBZW8aL0/rVv25B
 HD3F+YexmPIM0/qr12dHQ8ZVcSyMUWLdLbwx1ZLsPTGknGkC+weh718MdfbnePDV1nHB
 ix4EPgCfq69vjICcjOiBVITSRhps/ibDJODr+B6rfZ1XbTF8xtcFqp+kq+cdK3KnFd2F
 1SEg==
X-Gm-Message-State: AOAM530dVlrbAgpE8rk7RrEn9yvWohSEGMUAwg8LjbY2/9Qij+L6OrMw
 UiYTxgrkB306EmBc28MW0OaCkCm7IjxjacFnVVmK38V9WzoaWsFhQSeHet4VpX/bOjCjs6kCfNh
 +r84jEf6G5Bt+0gzFxlB/YM5V9yI2S1Q=
X-Received: by 2002:a9d:6042:: with SMTP id v2mr4068766otj.170.1623435223038; 
 Fri, 11 Jun 2021 11:13:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzL/m24MuK7Xg8Hc1R+qo5IKagETMxXcP2nnDdOIaeKErnIKIRBCyeoxbZhUNDEigmbtGwg8QgbY1xOCI2DgsQ=
X-Received: by 2002:a9d:6042:: with SMTP id v2mr4068747otj.170.1623435222804; 
 Fri, 11 Jun 2021 11:13:42 -0700 (PDT)
MIME-Version: 1.0
References: <20210611140157.1366738-1-eblake@redhat.com>
 <6a0aabb6-441c-8671-fc07-a7113043ccc8@virtuozzo.com>
 <20210611145918.pslzaqiuxyjttcmj@redhat.com>
In-Reply-To: <20210611145918.pslzaqiuxyjttcmj@redhat.com>
From: Nir Soffer <nsoffer@redhat.com>
Date: Fri, 11 Jun 2021 21:13:26 +0300
Message-ID: <CAMRbyyvnbzbLOEXta5zLYezqRrXbuuvdt2SmKMwEGUry=zPXBw@mail.gmail.com>
Subject: Re: [PATCH v2] qemu-img: Make unallocated part of backing chain
 obvious in map
To: Eric Blake <eblake@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=nsoffer@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=nsoffer@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-block <qemu-block@nongnu.org>,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jun 11, 2021 at 5:59 PM Eric Blake <eblake@redhat.com> wrote:
>
> On Fri, Jun 11, 2021 at 05:35:12PM +0300, Vladimir Sementsov-Ogievskiy wr=
ote:
> > > An obvious solution is to make 'qemu-img map --output=3Djson'
> > > distinguish between clusters that have a local allocation from those
> > > that are found nowhere in the chain.  We already have a one-off
> > > mismatch between qemu-img map and NBD qemu:allocation-depth (the
> > > former chose 0, and the latter 1 for the local layer), so exposing th=
e
> > > latter's choice of 0 for unallocated in the entire chain would mean
> > > using using "depth":-1 in the former, but a negative depth may confus=
e
> > > existing tools.  But there is an easy out: for any chain of length N,
> > > we can simply represent an unallocated cluster as "depth":N+1.  This
> > > does have a slight risk of confusing any tool that might try to
> > > dereference NULL when finding the backing image for the last file in
> > > the backing chain, but that risk sseems worth the more precise output=
.
> > > The iotests have several examples where this distinction demonstrates
> > > the additional accuracy.
> > >
> > > Signed-off-by: Eric Blake <eblake@redhat.com>
> > > ---
> > >
> > > Replaces v1: 20210610213906.1313440-1-eblake@redhat.com
> > > (qemu-img: Use "depth":-1 to make backing probes obvious)
> > >
> > > Use N+1 instead of -1 for unallocated [Kevin]
> > >
> >
> > Bit in contrast with -1, or with separate boolean flag, you lose the po=
ssibility to distinguish case when we have 3 layers and the cluster is abse=
nt in all of them, and the case when we have 4 layers and the cluster is ab=
sent in top 3 but in 4 it is qcow2 UNALLOCATED_ZERO cluster.
>
> Using just 'qemu-img map --output-json', you only see depth numbers.
> You also have to use 'qemu-img info --backing-chain' to see what file
> those depth numbers correspond to, at which point it becomes obvious
> whether "depth":4 meant unallocated (because the chain was length 3)
> or allocated at depth 4 (because the chain was length 4 or longer).
> But that's no worse than pre-patch, where you had to use qemu-img info
> --backing-chain to learn which file a particular "depth" maps to.
>
> >
> > So, if someone use this API to reconstruct the chain, then for original=
 3 empty layers he will create 3 empty layers and 4rd additional ZERO layer=
. And such reconstructed chain would not be equal to original chain (as if =
we take these two chains and add additional backing file as a new bottom la=
yer, effect would be different).. I'm not sure is it a problem in the task =
you are solving :\
>
> It should be fairly easy to optimize the case of a backing chain where
> EVERY listed cluster at the final depth was "data":false,"zero":true
> to omit that file after all.
>
> And in oVirt's case, Nir pointed out that we have one more tool at our
> disposal in recreating a backing chain: if you use
> json:{"driver":"qcow2", "backing":null, ...} as your image file, you
> don't have to worry about arbitrary files in the backing chain, only
> about recreating the top-most layer of a chain.  And in that case, it
> becomes very obvious that "depth":0 is something you must recreate,
> and "depth":1 would be a non-existent backing file because you just
> passed "backing":null.

Note that oVirt does not use qemu-img map, we use qemu-nbd to get
image extents, since it is used only in context we already connect to
qemu-nbd server or run qemu-nbd.

Management tools already know the image format (they should avoid
doing format probing anyway), and using a json uri allows single command
to get the needed info when you inspect a single layer.

But this change introduces a risk that some program using qemu-img map
will interrupt the result in the wrong way, assuming that there is N+1 laye=
r.

I think adding a new flag for absent extents is better. It cannot break
any user and it is easier to understand and use.

Nir


