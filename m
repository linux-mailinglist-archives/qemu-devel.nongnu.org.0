Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 427382EE68A
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jan 2021 21:06:04 +0100 (CET)
Received: from localhost ([::1]:39936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxbXn-0005CA-A0
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 15:06:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45222)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nsoffer@redhat.com>)
 id 1kxbWS-0004m6-4e
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 15:04:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:40897)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <nsoffer@redhat.com>)
 id 1kxbWQ-0005q2-Af
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 15:04:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610049877;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=dZrg+pCtfKPLymbuP4kh3SMLq+f7eeBrTr8kzmmRt88=;
 b=TUWgG17ruMEIpmzpXORtxZm3L6tmOTgLSUh3xKjPwCw+Tdms2KeURtKlVucGf8d0+Muedj
 ZbAlqVioclQdH+Bv9Y3qYvtt/t1JArLu0tPVD0a3IW3FC9TATiWT25CCYvqc9/SfxjiiN6
 NOJquEqWfh0vhfcr97+/zTKq685H76Q=
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com
 [209.85.161.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-388-KHf2LUqEP4WqTohmJY0G0Q-1; Thu, 07 Jan 2021 15:03:28 -0500
X-MC-Unique: KHf2LUqEP4WqTohmJY0G0Q-1
Received: by mail-oo1-f72.google.com with SMTP id x11so5257621oog.9
 for <qemu-devel@nongnu.org>; Thu, 07 Jan 2021 12:03:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dZrg+pCtfKPLymbuP4kh3SMLq+f7eeBrTr8kzmmRt88=;
 b=OhqtKH45whryja1B06lTstb0ki/dGsJvOxvRPV0ZAsVAR5dBEyGyJS8zJJdzsBNdQn
 1X9rG3mU7TTfCJ2WDtKalsobsGXcK4kPvD6ITfwgZJvpD/7MhHyAK2EMjIEoCiTI+u8v
 apI1T9DmMl0RzgYER2SLu5WSq3tZSb/eYj9UEP9vA3y020HYwxjHosJK/1092v6JmlQy
 8/fu57V8BBtFzLvz9NsPWoJatlOgDyJSRLN6fcOkI76yoIzT1tikvV6lKzKsNQX/Eu+7
 wU+GNzFj08ugwlhMNFN8iyv8UcdGJ5gcN7nV58iRO6v/jAnJQ3yyZiuDZRHCaGS/ZEal
 ptjw==
X-Gm-Message-State: AOAM531EsiyIKhFsZIo4/XzwZjMMBxoNukAeR7yuXZrxdthejLMGPCZj
 N/Mfb3pv2vL2rVHXVTu4DSOQVfWal9ZPMYzLg9bGJ5DaAX4SA/kuSXiHZpjUKvP18p/mgPU43w8
 acvCxGvESg8Y/TkP+b5t3NJULds2bJC8=
X-Received: by 2002:a4a:e2d7:: with SMTP id l23mr2156621oot.67.1610049806687; 
 Thu, 07 Jan 2021 12:03:26 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzu1m0uhE7EppNrPmtxXm2p62ZNXrJWaD157aYGDk3iP1bAG3AcGdmytyi2Dn0EzxS8LvHN8YFVw9sIqfMN8Xc=
X-Received: by 2002:a4a:e2d7:: with SMTP id l23mr2156577oot.67.1610049805776; 
 Thu, 07 Jan 2021 12:03:25 -0800 (PST)
MIME-Version: 1.0
References: <1b7b5aa0-2ab0-75a5-68f4-01eb4684dbcb@proxmox.com>
 <CAMRbyyuLboa+XWAmboC5Q6ZQ2KoVXMKJC=r+fGiHPTMEJR8JnA@mail.gmail.com>
 <c00f320b-4d8b-d345-acc5-ba43202a05e3@proxmox.com>
In-Reply-To: <c00f320b-4d8b-d345-acc5-ba43202a05e3@proxmox.com>
From: Nir Soffer <nsoffer@redhat.com>
Date: Thu, 7 Jan 2021 22:03:09 +0200
Message-ID: <CAMRbyyuAxb+qKSUAH_4XSzWYQz3+agAbEv+X93WTKG+1+kifRQ@mail.gmail.com>
Subject: Re: Potential regression in 'qemu-img convert' to LVM
To: Stefan Reiter <s.reiter@proxmox.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=nsoffer@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=nsoffer@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.246,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-block <qemu-block@nongnu.org>,
 Maxim Levitsky <mlevitsk@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Sep 15, 2020 at 2:51 PM Stefan Reiter <s.reiter@proxmox.com> wrote:
>
> On 9/15/20 11:08 AM, Nir Soffer wrote:
> > On Mon, Sep 14, 2020 at 3:25 PM Stefan Reiter <s.reiter@proxmox.com> wrote:
> >>
> >> Hi list,
> >>
> >> following command fails since 5.1 (tested on kernel 5.4.60):
> >>
> >> # qemu-img convert -p -f raw -O raw /dev/zvol/pool/disk-1 /dev/vg/disk-1
> >> qemu-img: error while writing at byte 2157968896: Device or resource busy
> >>
> >> (source is ZFS here, but doesn't matter in practice, it always fails the
> >> same; offset changes slightly but consistently hovers around 2^31)
> >>
> >> strace shows the following:
> >> fallocate(13, FALLOC_FL_KEEP_SIZE|FALLOC_FL_PUNCH_HOLE, 2157968896,
> >> 4608) = -1 EBUSY (Device or resource busy)
> >
> > What is the size of the LV?
> >
>
> Same as the source, 5GB in my test case. Created with:
>
> # lvcreate -ay --size 5242880k --name disk-1 vg
>
> > Does it happen if you change sparse minimum size (-S)?
> >
> > For example: -S 64k
> >
> >      qemu-img convert -p -f raw -O raw -S 64k /dev/zvol/pool/disk-1
> > /dev/vg/disk-1
> >
>
> Tried a few different values, always the same result: EBUSY at byte
> 2157968896.
>
> >> Other fallocate calls leading up to this work fine.
> >>
> >> This happens since commit edafc70c0c "qemu-img convert: Don't pre-zero
> >> images", before that all fallocates happened at the start. Reverting the
> >> commit and calling qemu-img exactly the same way on the same data works
> >> fine.
> >
> > But slowly, doing up to 100% more work for fully allocated images.
> >
>
> Of course, I'm not saying the patch is wrong, reverting it just avoids
> triggering the bug.
>
> >> Simply retrying the syscall on EBUSY (like EINTR) does *not* work,
> >> once it fails it keeps failing with the same error.
> >>
> >> I couldn't find anything related to EBUSY on fallocate, and it only
> >> happens on LVM targets... Any idea or pointers where to look?
> >
> > Is this thin LV?
> >
>
> No, regular LV. See command above.
>
> > This works for us using regular LVs.
> >
> > Which kernel? which distro?
> >
>
> Reproducible on:
> * PVE w/ kernel 5.4.60 (Ubuntu based)
> * Manjaro w/ kernel 5.8.6
>
> I found that it does not happen with all images, I suppose there must be
> a certain number of smaller holes for it to happen. I am using a VM
> image with a bare-bones Alpine Linux installation, but it's not an
> isolated case, we've had two people report the issue on our bug tracker:
> https://bugzilla.proxmox.com/show_bug.cgi?id=3002

I think that this issue may be fixed by
https://lists.nongnu.org/archive/html/qemu-block/2020-11/msg00358.html

Nir


