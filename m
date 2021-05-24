Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FB8338E57E
	for <lists+qemu-devel@lfdr.de>; Mon, 24 May 2021 13:30:38 +0200 (CEST)
Received: from localhost ([::1]:37956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ll8n7-0002We-Hm
	for lists+qemu-devel@lfdr.de; Mon, 24 May 2021 07:30:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59916)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1ll8lr-0001pH-3c
 for qemu-devel@nongnu.org; Mon, 24 May 2021 07:29:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35151)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1ll8ln-00082a-7A
 for qemu-devel@nongnu.org; Mon, 24 May 2021 07:29:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621855753;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bdwoDJvx6nyyrKAEQUkO/UbiPa0wBkzcARRH4uDNPS8=;
 b=UHFok8y6/iwahO5TANNwV8weZqDs4U2BeHj5DL4OX5nt864a47ngyrG3CAYVK7gP0qhX6Z
 9oZTtUHxczIktMdPNvY/f0cd9jQU2bgabdzJSu75k5B1qPOpPlLVYDi7HSjktRh4XX85Mr
 1LrVCMojF64YCOoTDhv8HwcbrhQ3fyY=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-155-0niaME8cMoO_FILolUuahw-1; Mon, 24 May 2021 07:29:11 -0400
X-MC-Unique: 0niaME8cMoO_FILolUuahw-1
Received: by mail-wr1-f69.google.com with SMTP id
 u5-20020adf9e050000b029010df603f280so12939008wre.18
 for <qemu-devel@nongnu.org>; Mon, 24 May 2021 04:29:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=bdwoDJvx6nyyrKAEQUkO/UbiPa0wBkzcARRH4uDNPS8=;
 b=AFAiTlVqJgMcRNnYB8l+lMTvQVASPfQrfc3I1xNsXZ066zDj/Nf/VfPjN2RVPaHAhS
 ly+2wLnG+RAEGRQUrEie1u6/l1T2KIsYRqkS38X8cFEM/H9EsMnrMslOLnglSwTLeMMT
 YqGGy899dh0GKAhH4n0wPZdgpOTAk7/wCeSXu3x3cOvYVKPqI6xIiFYhxKbsz8DMBIXf
 EL8Znf7jRgBGWz13cSOy4Bv1YNXOsiHKmSllEBvFDb90y5L+3Go6gMUBoXzElbf/4Ulh
 d8oaM3ZylOiH7iHKxCdcN07AZ2cACo9iPvWnkBI42RcTpNKNaYTp3HxYzSrTOw+vmGhw
 kb7w==
X-Gm-Message-State: AOAM533WzUV8T1gsxHVSL8bZXBzl8FJ2cqq6S70eqzOa0CWuM0+uLAPV
 zbRJGmPDwHtMgocQh1rSP2Kv4gaiJM/ocT0lmLgllDIRqlbyrbtoWi66BGZDPDk3LEknwma5ZrX
 d3NbQBn/Zp52lpeU=
X-Received: by 2002:a1c:80d0:: with SMTP id b199mr5352560wmd.6.1621855750619; 
 Mon, 24 May 2021 04:29:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwD0Lj8HUxQIPdKNjwHSG1dvaESqSL7EtMlk4wjFJ9C+j3FI5KHdRtBhD63kf563OPCDtnGEQ==
X-Received: by 2002:a1c:80d0:: with SMTP id b199mr5352533wmd.6.1621855750405; 
 Mon, 24 May 2021 04:29:10 -0700 (PDT)
Received: from redhat.com ([2a10:8006:fcda:0:90d:c7e7:9e26:b297])
 by smtp.gmail.com with ESMTPSA id v18sm14359624wro.18.2021.05.24.04.29.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 May 2021 04:29:09 -0700 (PDT)
Date: Mon, 24 May 2021 07:29:06 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Eugenio Perez Martin <eperezma@redhat.com>
Subject: Re: [RFC v3 00/29] vDPA software assisted live migration
Message-ID: <20210524072739-mutt-send-email-mst@kernel.org>
References: <20210519162903.1172366-1-eperezma@redhat.com>
 <20210524053144-mutt-send-email-mst@kernel.org>
 <CAJaqyWcVm55qjaDpQsuLzaY0FCzjW2ARyvOWCdfS9RJNoOM7Aw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJaqyWcVm55qjaDpQsuLzaY0FCzjW2ARyvOWCdfS9RJNoOM7Aw@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
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
Cc: Parav Pandit <parav@mellanox.com>, Juan Quintela <quintela@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 qemu-level <qemu-devel@nongnu.org>, Harpreet Singh Anand <hanand@xilinx.com>,
 Xiao W Wang <xiao.w.wang@intel.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Eli Cohen <eli@mellanox.com>, virtualization@lists.linux-foundation.org,
 Michael Lilja <ml@napatech.com>, Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, May 24, 2021 at 12:37:48PM +0200, Eugenio Perez Martin wrote:
> On Mon, May 24, 2021 at 11:38 AM Michael S. Tsirkin <mst@redhat.com> wrote:
> >
> > On Wed, May 19, 2021 at 06:28:34PM +0200, Eugenio Pérez wrote:
> > > Commit 17 introduces the buffer forwarding. Previous one are for
> > > preparations again, and laters are for enabling some obvious
> > > optimizations. However, it needs the vdpa device to be able to map
> > > every IOVA space, and some vDPA devices are not able to do so. Checking
> > > of this is added in previous commits.
> >
> > That might become a significant limitation. And it worries me that
> > this is such a big patchset which might yet take a while to get
> > finalized.
> >
> 
> Sorry, maybe I've been unclear here: Latter commits in this series
> address this limitation. Still not perfect: for example, it does not
> support adding or removing guest's memory at the moment, but this
> should be easy to implement on top.
> 
> The main issue I'm observing is from the kernel if I'm not wrong: If I
> unmap every address, I cannot re-map them again. But code in this
> patchset is mostly final, except for the comments it may arise in the
> mail list of course.
> 
> > I have an idea: how about as a first step we implement a transparent
> > switch from vdpa to a software virtio in QEMU or a software vhost in
> > kernel?
> >
> > This will give us live migration quickly with performance comparable
> > to failover but without dependance on guest cooperation.
> >
> 
> I think it should be doable. I'm not sure about the effort that needs
> to be done in qemu to hide these "hypervisor-failover devices" from
> guest's view but it should be comparable to failover, as you say.
> 
> Networking should be ok by its nature, although it could require care
> on the host hardware setup. But I'm not sure how other types of
> vhost/vdpa devices may work that way. How would a disk/scsi device
> switch modes? Can the kernel take control of the vdpa device through
> vhost, and just start reporting with a dirty bitmap?
> 
> Thanks!

It depends of course, e.g. blk is mostly reads/writes so
not a lot of state. just don't reorder or drop requests.

> > Next step could be driving vdpa from userspace while still copying
> > packets to a pre-registered buffer.
> >
> > Finally your approach will be a performance optimization for devices
> > that support arbitrary IOVA.
> >
> > Thoughts?
> >
> > --
> > MST
> >


