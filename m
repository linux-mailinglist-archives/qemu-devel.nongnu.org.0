Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C32B32BC07
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Mar 2021 22:47:02 +0100 (CET)
Received: from localhost ([::1]:48170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHZKe-0002Gj-Vf
	for lists+qemu-devel@lfdr.de; Wed, 03 Mar 2021 16:47:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43436)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nsoffer@redhat.com>)
 id 1lHZJW-0001gZ-6U
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 16:45:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24739)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <nsoffer@redhat.com>)
 id 1lHZJQ-0001cS-7d
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 16:45:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614807942;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=SjB5ucXMVp2uHdzO/yU5zs3qewkziBVY/noRHBw47X0=;
 b=Lf0IUSLDFBKHitqNhoC+wq2WyrmaC4jfppt5+U4GA5ZsIqsjWYUYnFk1WqfIKAsq/MTkbF
 XOpSQG2xvWJk2jeIpbKf7hA/+L3zc1SjLqyuOigl0D1cKboj4/9ptUCQq+uXKhIi7Raf6o
 jZ99E6hLTZENoEUUvYhlnRaK6sfJJEU=
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com
 [209.85.161.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-50--qHNIHoCNbi_aCDBBkqz4g-1; Wed, 03 Mar 2021 16:45:37 -0500
X-MC-Unique: -qHNIHoCNbi_aCDBBkqz4g-1
Received: by mail-oo1-f70.google.com with SMTP id y16so6340706oou.0
 for <qemu-devel@nongnu.org>; Wed, 03 Mar 2021 13:45:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SjB5ucXMVp2uHdzO/yU5zs3qewkziBVY/noRHBw47X0=;
 b=Ccl/X7XGTATlHpMvIMeFItu5d6YB6oWZNlnnLbb3N2/1xa2f5xgHaobVnLGpN2mQa1
 u7k86s07yrAG3CVusipf5OdnwMJg2/WRgkEvyHDCTItWDABDCNaa+Q6xyXgBUpqBLYXz
 aNsyIND2WpxUy4tPDgP9nSb07VRcL0F/taYL+KA0fNo9uq8jsHTn+wtx+kR9E51hRM7m
 voQ1LVHaAwb1vvMfdiCl9s6LyOXKSi8A6e0hC0favLctmyT4SkwMenFdVp4vQuPBn6W4
 IVEsyTXzoWyEiB63uOge96mggAunUzBglhy5LKN5GiIWKW5ZXTX1hHiP1MCFeITRxB0s
 tyPg==
X-Gm-Message-State: AOAM532rTW1kDlWv49ZLDmYYvWJuDLZXWqnmL+iZX2gggx922uCgAUnU
 HaLguzMbLkqhu7Ibq8lKGo2uaM1ZHKuztKb6m0BlrnkgGmy5IwqxOH4pRYrzmGvqh4fm+sXOQo0
 WTf495Cdwj0M+aTkVxJts+wft1tYDuuY=
X-Received: by 2002:aca:4947:: with SMTP id w68mr726173oia.41.1614807936660;
 Wed, 03 Mar 2021 13:45:36 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyDSI1DGO2/8khGyUUnLDvChX3Xfpu7QTuqeUzLJ+VcfvVoKq2G+9XYP9Pzc/tZEOkm2VPME4Tj6JiFRkYyvUg=
X-Received: by 2002:aca:4947:: with SMTP id w68mr726155oia.41.1614807936436;
 Wed, 03 Mar 2021 13:45:36 -0800 (PST)
MIME-Version: 1.0
References: <20210219160752.1826830-1-nsoffer@redhat.com>
 <f136b2e8-3510-a150-27f9-e69ba14e39aa@redhat.com>
 <81464e3d-c0ee-ac12-c43b-d0f7180db482@redhat.com>
 <6a714e21-0da5-7eb1-1350-277a25e23be4@virtuozzo.com>
In-Reply-To: <6a714e21-0da5-7eb1-1350-277a25e23be4@virtuozzo.com>
From: Nir Soffer <nsoffer@redhat.com>
Date: Wed, 3 Mar 2021 23:45:20 +0200
Message-ID: <CAMRbyysiNe1J54a1nQ0UOJGU26nTZQ6yqVGLVeUd4LV-n-LJ_Q@mail.gmail.com>
Subject: Re: [PATCH] nbd: server: Report holes for raw images
To: Kevin Wolf <kwolf@redhat.com>, Max Reitz <mreitz@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=nsoffer@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="0000000000006eac8e05bca8c570"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=nsoffer@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-block <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000006eac8e05bca8c570
Content-Type: text/plain; charset="UTF-8"

On Thu, Feb 25, 2021 at 8:51 PM Vladimir Sementsov-Ogievskiy <
vsementsov@virtuozzo.com> wrote:

> 19.02.2021 19:58, Eric Blake wrote:
> > On 2/19/21 10:42 AM, Eric Blake wrote:
> >
> >>> To me, data=false looks compatible with NBD_STATE_HOLE. From user point
> >>> of view, getting same results from qemu-nbd and qemu-img is more
> >>> important than being more correct about allocation status.
> >>
> >> More to the point, here is our inconsistency:
> >>
> >> In nbd/server.c, we turn !BDRV_BLOCK_ALLOCATED into NBD_STATE_HOLE
> >>
> >> In block/nbd.c, we turn !NBD_STATE_HOLE into BDRV_BLOCK_DATA
> >>
> >> The fact that we are not doing a round-trip conversion means that one of
> >> the two places is wrong.  And your argument that the server side is
> >> wrong makes sense to me.
> >
> > In fact, when I went back and researched when this was introduced (see
> > commit e7b1948d51 in 2018), we may have been aware of the inconsistency
> > between client and server, but didn't make up our minds at the time:
> > https://lists.gnu.org/archive/html/qemu-devel/2018-03/msg03465.html
> > "? Hm, don't remember, what we decided about DATA/HOLE flags mapping.."
> >
> >>
> >> I'll wait a few days for any other reviewer commentary before taking
> >> this through my NBD tree.
> >>
> >
>
>
> I can add the following.
>
> First, link to my research of block_status in Qemu:
> https://lists.gnu.org/archive/html/qemu-devel/2020-04/msg05136.html
>
> And about HOLE and ZERO..
>
> As I've noted in the research above, SCSI may return HOLE & !ZERO:
>
> from SCSI:
> Logical Block Provisioning Read Zeros (LBPRZ) bit
> 1     If the logical block provisioning read zeros (LBPRZ) bit is set to
> one, then, for an unmapped LBA specified by a read operation, the
> deviceserver shall send user data with all bits set to zero to the data-in
> buffer.
> 0     If the TPRZ bit is set to zero, then, for an unmapped LBA specified
> by a read operation, the device server may send user data with all bitsset
> to any value to the data-in buffer.
>
> So we can have an unmapped area that can be read as any random data. Same
> thing can be said about null-co driver with read-zeroes=false
>
> Also, qcow2 support ALLOCATED ZERO clusters which reads as zero but data
> is allocated - they are reasonable to report as ZERO & !HOLE
>
> And of-course UNALLOCATED ZERO clusters in qcow2 and lseek-holes are
> reasonable to report as ZERO & HOLE,  because they reads as zero and
> "future writes to that area may cause fragmentation or encounter an
> NBD_ENOSPC"..
>
> So, all combination are reasonable, we just need to fix Qemu NBD server to
> report correct statuses in all these cases.
>
> It seems that ZERO/HOLE specification is a lot more reasonable than what
> we have with ZERO/DATA/ALLOCATED in Qemu, and may be true way is move
> internal block_status to use NBD terms.
>
>
> And thanks for CCing me. Hmm, maybe, I'll suggest myself as co-maintainer
> for NBD?


Kevin, Max, are you ok with this change?

--0000000000006eac8e05bca8c570
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Thu, Feb 25, 2021 at 8:51 PM Vladimir =
Sementsov-Ogievskiy &lt;<a href=3D"mailto:vsementsov@virtuozzo.com">vsement=
sov@virtuozzo.com</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex">19.02.2021 19:58, Eric Blake wr=
ote:<br>
&gt; On 2/19/21 10:42 AM, Eric Blake wrote:<br>
&gt; <br>
&gt;&gt;&gt; To me, data=3Dfalse looks compatible with NBD_STATE_HOLE. From=
 user point<br>
&gt;&gt;&gt; of view, getting same results from qemu-nbd and qemu-img is mo=
re<br>
&gt;&gt;&gt; important than being more correct about allocation status.<br>
&gt;&gt;<br>
&gt;&gt; More to the point, here is our inconsistency:<br>
&gt;&gt;<br>
&gt;&gt; In nbd/server.c, we turn !BDRV_BLOCK_ALLOCATED into NBD_STATE_HOLE=
<br>
&gt;&gt;<br>
&gt;&gt; In block/nbd.c, we turn !NBD_STATE_HOLE into BDRV_BLOCK_DATA<br>
&gt;&gt;<br>
&gt;&gt; The fact that we are not doing a round-trip conversion means that =
one of<br>
&gt;&gt; the two places is wrong.=C2=A0 And your argument that the server s=
ide is<br>
&gt;&gt; wrong makes sense to me.<br>
&gt; <br>
&gt; In fact, when I went back and researched when this was introduced (see=
<br>
&gt; commit e7b1948d51 in 2018), we may have been aware of the inconsistenc=
y<br>
&gt; between client and server, but didn&#39;t make up our minds at the tim=
e:<br>
&gt; <a href=3D"https://lists.gnu.org/archive/html/qemu-devel/2018-03/msg03=
465.html" rel=3D"noreferrer" target=3D"_blank">https://lists.gnu.org/archiv=
e/html/qemu-devel/2018-03/msg03465.html</a><br>
&gt; &quot;? Hm, don&#39;t remember, what we decided about DATA/HOLE flags =
mapping..&quot;<br>
&gt; <br>
&gt;&gt;<br>
&gt;&gt; I&#39;ll wait a few days for any other reviewer commentary before =
taking<br>
&gt;&gt; this through my NBD tree.<br>
&gt;&gt;<br>
&gt; <br>
<br>
<br>
I can add the following.<br>
<br>
First, link to my research of block_status in Qemu: <a href=3D"https://list=
s.gnu.org/archive/html/qemu-devel/2020-04/msg05136.html" rel=3D"noreferrer"=
 target=3D"_blank">https://lists.gnu.org/archive/html/qemu-devel/2020-04/ms=
g05136.html</a><br>
<br>
And about HOLE and ZERO..<br>
<br>
As I&#39;ve noted in the research above, SCSI may return HOLE &amp; !ZERO:<=
br>
<br>
from SCSI:<br>
Logical Block Provisioning Read Zeros (LBPRZ) bit<br>
1=C2=A0 =C2=A0 =C2=A0If the logical block provisioning read zeros (LBPRZ) b=
it is set to one, then, for an unmapped LBA specified by a read operation, =
the deviceserver shall send user data with all bits set to zero to the data=
-in buffer.<br>
0=C2=A0 =C2=A0 =C2=A0If the TPRZ bit is set to zero, then, for an unmapped =
LBA specified by a read operation, the device server may send user data wit=
h all bitsset to any value to the data-in buffer.<br>
<br>
So we can have an unmapped area that can be read as any random data. Same t=
hing can be said about null-co driver with read-zeroes=3Dfalse<br>
<br>
Also, qcow2 support ALLOCATED ZERO clusters which reads as zero but data is=
 allocated - they are reasonable to report as ZERO &amp; !HOLE<br>
<br>
And of-course UNALLOCATED ZERO clusters in qcow2 and lseek-holes are reason=
able to report as ZERO &amp; HOLE,=C2=A0 because they reads as zero and &qu=
ot;future writes to that area may cause fragmentation or encounter an NBD_E=
NOSPC&quot;..<br>
<br>
So, all combination are reasonable, we just need to fix Qemu NBD server to =
report correct statuses in all these cases.<br>
<br>
It seems that ZERO/HOLE specification is a lot more reasonable than what we=
 have with ZERO/DATA/ALLOCATED in Qemu, and may be true way is move interna=
l block_status to use NBD terms.<br>
<br>
<br>
And thanks for CCing me. Hmm, maybe, I&#39;ll suggest myself as co-maintain=
er for NBD?</blockquote><div><br></div><div>Kevin, Max, are you ok with thi=
s change?</div></div></div>

--0000000000006eac8e05bca8c570--


