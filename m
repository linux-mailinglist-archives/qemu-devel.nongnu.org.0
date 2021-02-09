Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B718931550E
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 18:29:08 +0100 (CET)
Received: from localhost ([::1]:42742 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9Wp1-0000Z0-C3
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 12:29:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53062)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1l9WkM-0006Ky-3o
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 12:24:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21108)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1l9WkD-0004fP-IP
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 12:24:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612891448;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eSi/D0ji/5Fh01NENW+fjxr0I+W0dCdSAvldvY7BxYo=;
 b=N+v3EyR2gRczPw3Rn8IiEDwCt+fOWH6ZcDi2Afm68eSbSaam/W2+Vc+Wtr0P2qWhlwYcny
 qR1083VGleb2w+J2T/WCPF0Ybmmn6Keyy7Ra9luRR3cvxbcN6JxNYHzU2e+tIUv5PldROI
 egTCnMDAKrumJBODGqd1laXkHjPzqMI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-15-WKY3rPBWNhKSt4WyT7A8cw-1; Tue, 09 Feb 2021 12:24:06 -0500
X-MC-Unique: WKY3rPBWNhKSt4WyT7A8cw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D8DF6BBEE4;
 Tue,  9 Feb 2021 17:24:04 +0000 (UTC)
Received: from gondolin (ovpn-112-148.ams2.redhat.com [10.36.112.148])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9FECE60C61;
 Tue,  9 Feb 2021 17:24:03 +0000 (UTC)
Date: Tue, 9 Feb 2021 18:24:00 +0100
From: Cornelia Huck <cohuck@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: getting the console output for s390 cdrom-test?
Message-ID: <20210209182400.4fe15232.cohuck@redhat.com>
In-Reply-To: <CAFEAcA_u7eKMyKKLf1sdMOgW7OPRt9hXiv5aDkfyfJcOfM6XFA@mail.gmail.com>
References: <CAFEAcA8=vG-2Vzrdark8VC5NANe5Fb3qGTpSFk8X94KvXszTbA@mail.gmail.com>
 <c98d4f43-5a29-afcc-fe7d-a3d92063df3a@redhat.com>
 <CAFEAcA8q1ewJ4F-pijt81Qc_rO0xNpy6jJY2DrW0ggTzg27aEQ@mail.gmail.com>
 <5213f033-19dc-bc40-bfd7-10b8c676539b@redhat.com>
 <CAFEAcA-va8hY3tHrhK_UV0bniF=VhietM2Y8ovZt57wWkg8f_w@mail.gmail.com>
 <CAFEAcA_JLx6NAd_YPzKy6iXWqP_c1jkW42bscK+Q=zKN4xAbzQ@mail.gmail.com>
 <20210209181009.7f2cb328.cohuck@redhat.com>
 <CAFEAcA_u7eKMyKKLf1sdMOgW7OPRt9hXiv5aDkfyfJcOfM6XFA@mail.gmail.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.57,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

On Tue, 9 Feb 2021 17:17:19 +0000
Peter Maydell <peter.maydell@linaro.org> wrote:

> On Tue, 9 Feb 2021 at 17:10, Cornelia Huck <cohuck@redhat.com> wrote:
> >
> > On Tue, 9 Feb 2021 14:58:53 +0000
> > Peter Maydell <peter.maydell@linaro.org> wrote:  
> > > This change significantly reduces the frequency with which I see
> > > the hang; but it doesn't get rid of it altogether. Also I couldn't
> > > really figure out from the virtio spec exactly where barriers
> > > were required: I think I would need to read the whole thing in
> > > more detail rather than trying to fish out the information by
> > > just reading small pieces of it.  
> >
> > The Linux virtio-ccw code uses 'weak barriers', i.e. the heavy bcr15
> > should not be needed. We might well miss other (lightweight) barriers
> > in other parts of the code part, though.  
> 
> Is that the version the Linux kernel has as
>   /* Fast-BCR without checkpoint synchronization */
>   #define __ASM_BARRIER "bcr 14,0\n"
> 
> ?

No, just a simple memory barrier in most places (bcr15 and bcr14 do
serialization).

> 
> > > But some of the ordering of
> > > operations the spec describes doesn't match how the s390-ccw
> > > BIOS code is doing it at all (eg the spec says that when feeding
> > > a batch of descriptors to the device the driver isn't supposed to
> > > update the flags on the first descriptor until it's finished
> > > writing all of the descriptors, but the code doesn't seem to
> > > try to do that). So I think the code could use an overhaul from
> > > somebody with a better understanding of virtio than me...  
> >
> > Yeah, the bios virtio code could probably use some love.
> >
> > I'm wondering how much memory ordering on the host platform influences
> > things. I doubt many people try to run an s390x guest on an aarch64
> > host...  
> 
> Yes, you won't see this bug unless you're running QEMU on a
> host that's pretty enthusiastic about reordering memory
> transactions (and you'd never have seen it at all back when
> we ran the iothread actions synchronously with the emulated
> CPU, which we probably did back in 2013 when the s390-ccw
> virtio code was written...) I haven't tested other aarch64
> hosts but I would be unsurprised to find that whether you
> could repro it and how frequently depended on the particular
> h/w implementation.

I guess that hardly any s390x guests run on hw that's not either s390x
or x86...


