Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 726EA3154C3
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 18:15:24 +0100 (CET)
Received: from localhost ([::1]:45148 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9Wbj-0004sH-8q
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 12:15:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48688)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1l9WWy-0000CR-Rz
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 12:10:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37650)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1l9WWt-0006qu-Rj
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 12:10:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612890617;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iE4JY9rOsEzH8TIthOMI5icJP5DIxR53qWqU3hwutEI=;
 b=V3hQGhrIG0zg/XvXaNwxePq9Necj3S2tP3zOlX1HlDtxGz/wH3pU0dsYaSQ8ombZij0I/f
 uh+idbJzQFObPnCZL0voGb9xUS3hRe85NQTdq7nQ1FKrg2idcQPb/59n9UrgeidVHp8aef
 ZuFubu38bTM1zTwwZNqZ8+rnWUw2Idw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-26-uU_a-_e8NDS9218fRQK-dw-1; Tue, 09 Feb 2021 12:10:15 -0500
X-MC-Unique: uU_a-_e8NDS9218fRQK-dw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D3F10192D786;
 Tue,  9 Feb 2021 17:10:13 +0000 (UTC)
Received: from gondolin (ovpn-112-148.ams2.redhat.com [10.36.112.148])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 95C4210016F5;
 Tue,  9 Feb 2021 17:10:12 +0000 (UTC)
Date: Tue, 9 Feb 2021 18:10:09 +0100
From: Cornelia Huck <cohuck@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: getting the console output for s390 cdrom-test?
Message-ID: <20210209181009.7f2cb328.cohuck@redhat.com>
In-Reply-To: <CAFEAcA_JLx6NAd_YPzKy6iXWqP_c1jkW42bscK+Q=zKN4xAbzQ@mail.gmail.com>
References: <CAFEAcA8=vG-2Vzrdark8VC5NANe5Fb3qGTpSFk8X94KvXszTbA@mail.gmail.com>
 <c98d4f43-5a29-afcc-fe7d-a3d92063df3a@redhat.com>
 <CAFEAcA8q1ewJ4F-pijt81Qc_rO0xNpy6jJY2DrW0ggTzg27aEQ@mail.gmail.com>
 <5213f033-19dc-bc40-bfd7-10b8c676539b@redhat.com>
 <CAFEAcA-va8hY3tHrhK_UV0bniF=VhietM2Y8ovZt57wWkg8f_w@mail.gmail.com>
 <CAFEAcA_JLx6NAd_YPzKy6iXWqP_c1jkW42bscK+Q=zKN4xAbzQ@mail.gmail.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.57,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Eric Farman <farman@linux.ibm.com>, Thomas Huth <thuth@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-s390x <qemu-s390x@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 9 Feb 2021 14:58:53 +0000
Peter Maydell <peter.maydell@linaro.org> wrote:

> On Mon, 8 Feb 2021 at 12:08, Peter Maydell <peter.maydell@linaro.org> wrote:
> > Yes, virtio_scsi_parse_req() returns ENOTSUP because it
> > fails the "if (out_size && in_size)" test.
> >
> > I am becoming somewhat suspicious that the s390-ccw BIOS's
> > implementation of virtio is not putting in sufficient barriers,
> > and so if you get unlucky then the QEMU thread sees an inconsistent
> > view of the in-memory virtio data structures.  
> 
> As a test of this theory, I tried adding some barrier insns
> (with the definition of the barrier insn borrowed from s390x Linux):
> 
> diff --git a/pc-bios/s390-ccw/virtio.c b/pc-bios/s390-ccw/virtio.c
> index ab49840db85..0af901264b6 100644
> --- a/pc-bios/s390-ccw/virtio.c
> +++ b/pc-bios/s390-ccw/virtio.c
> @@ -17,6 +17,12 @@
>  #include "helper.h"
>  #include "s390-time.h"
> 
> +#define membarrier() do { asm volatile("bcr 15,0\n" :: : "memory"); } while (0)
> +
> +#define __ASM_BARRIER "bcr 15,0\n"
> +
> +
> +
>  #define VRING_WAIT_REPLY_TIMEOUT 30
> 
>  static VRing block[VIRTIO_MAX_VQS];
> @@ -154,12 +160,15 @@ void vring_send_buf(VRing *vr, void *p, int len,
> int flags)
> 
>      /* Chains only have a single ID */
>      if (!(flags & VRING_DESC_F_NEXT)) {
> +        membarrier();
>          vr->avail->idx++;
> +        membarrier();
>      }
>  }
> 
>  int vr_poll(VRing *vr)
>  {
> +    membarrier();
>      if (vr->used->idx == vr->used_idx) {
>          vring_notify(vr);
>          yield();
> @@ -169,7 +178,9 @@ int vr_poll(VRing *vr)
>      vr->used_idx = vr->used->idx;
>      vr->next_idx = 0;
>      vr->desc[0].len = 0;
> +    membarrier();
>      vr->desc[0].flags = 0;
> +    membarrier();
>      return 1; /* vr has been updated */
>  }
> 
> This change significantly reduces the frequency with which I see
> the hang; but it doesn't get rid of it altogether. Also I couldn't
> really figure out from the virtio spec exactly where barriers
> were required: I think I would need to read the whole thing in
> more detail rather than trying to fish out the information by
> just reading small pieces of it. 

The Linux virtio-ccw code uses 'weak barriers', i.e. the heavy bcr15
should not be needed. We might well miss other (lightweight) barriers
in other parts of the code part, though.

> But some of the ordering of
> operations the spec describes doesn't match how the s390-ccw
> BIOS code is doing it at all (eg the spec says that when feeding
> a batch of descriptors to the device the driver isn't supposed to
> update the flags on the first descriptor until it's finished
> writing all of the descriptors, but the code doesn't seem to
> try to do that). So I think the code could use an overhaul from
> somebody with a better understanding of virtio than me...

Yeah, the bios virtio code could probably use some love.

I'm wondering how much memory ordering on the host platform influences
things. I doubt many people try to run an s390x guest on an aarch64
host...


