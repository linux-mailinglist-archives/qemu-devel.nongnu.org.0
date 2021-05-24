Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D5E238E43C
	for <lists+qemu-devel@lfdr.de>; Mon, 24 May 2021 12:39:59 +0200 (CEST)
Received: from localhost ([::1]:33608 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ll805-00007D-Mj
	for lists+qemu-devel@lfdr.de; Mon, 24 May 2021 06:39:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46766)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1ll7yk-0006bL-90
 for qemu-devel@nongnu.org; Mon, 24 May 2021 06:38:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30532)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1ll7yg-0000tX-BM
 for qemu-devel@nongnu.org; Mon, 24 May 2021 06:38:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621852708;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ByN/rdQOKQphaNc8xuDJIdSfxX4VuaeRy8mSq9WT13Q=;
 b=eg3vvAgxZTEi0PkOM6KfV3iKA2XQWYiTmFmE7DwvWO5B2KcxAn+h+HQQ56hhkHpdIdxA7Z
 QBGlFPavAv2zqqDCkbsL/ebtpYw2ueHE1Isy4kiKlBal30DhuHX3OWmrF1zJXGTVi5JslN
 1Mpew/MkSD8rpt81rgROmmrY2gvqI/M=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-169-5y4wh77BNWKFEwkxgEJBQw-1; Mon, 24 May 2021 06:38:25 -0400
X-MC-Unique: 5y4wh77BNWKFEwkxgEJBQw-1
Received: by mail-qk1-f198.google.com with SMTP id
 z12-20020a05620a08ccb02902ea1e4a963dso26285605qkz.13
 for <qemu-devel@nongnu.org>; Mon, 24 May 2021 03:38:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ByN/rdQOKQphaNc8xuDJIdSfxX4VuaeRy8mSq9WT13Q=;
 b=jPf2DGRehq5MF3yWN6SO8lstavBVSN6clphHT0wwYmT9xfbqmBS0AL646kCxY2H3ah
 87UQr/bmJTSsR1V9zfeBejOnsX3d8AOUPvbpCY8UtLTQrTI5WLAgQYPEKVmdbZYs2TNH
 OHHT73OtCS0FD7telMg2E/Fqu0Ymv5oWj9q+gs2aSNUzr4Lt9lxnFGx56nTN2BQcVAd8
 K41Asl/usXvOb2abqAdYEPPNWmAJ1lPGTSFrzZJIYs9Txva1ZWAzWQTMxmUcqjmWtFqf
 /FKjHwkEHC2Pa5nKB1PiKMRabzwbkP07Ttdc1upWphnguydPjMSrto5PXDAftdz0ZNkI
 v4ww==
X-Gm-Message-State: AOAM530ZofuS71efWmnUkylx+yOURSR/lFENa4KzgyAvhFZ1iFaMuggI
 VXOaoSSK6NSSoAEZc0ysU8HFkxezf27j4qZYan7BQO4ZkTs5J7TD+mSAsSLu9dWOujr6oAWkHpD
 ih83rywB3RKTxX1vvbPZuMUWlrUprjHI=
X-Received: by 2002:a05:620a:20d7:: with SMTP id
 f23mr27260491qka.484.1621852704375; 
 Mon, 24 May 2021 03:38:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy5ekd7WycU37wamdSfDOiEHZbpcbrZN1ucE2UWDrCTyqCg1VcD8b8YYf8k5avcLxlt4KIVj6BnzN+6Jp9fZiQ=
X-Received: by 2002:a05:620a:20d7:: with SMTP id
 f23mr27260468qka.484.1621852704178; 
 Mon, 24 May 2021 03:38:24 -0700 (PDT)
MIME-Version: 1.0
References: <20210519162903.1172366-1-eperezma@redhat.com>
 <20210524053144-mutt-send-email-mst@kernel.org>
In-Reply-To: <20210524053144-mutt-send-email-mst@kernel.org>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Mon, 24 May 2021 12:37:48 +0200
Message-ID: <CAJaqyWcVm55qjaDpQsuLzaY0FCzjW2ARyvOWCdfS9RJNoOM7Aw@mail.gmail.com>
Subject: Re: [RFC v3 00/29] vDPA software assisted live migration
To: "Michael S. Tsirkin" <mst@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.373,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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

On Mon, May 24, 2021 at 11:38 AM Michael S. Tsirkin <mst@redhat.com> wrote:
>
> On Wed, May 19, 2021 at 06:28:34PM +0200, Eugenio P=C3=A9rez wrote:
> > Commit 17 introduces the buffer forwarding. Previous one are for
> > preparations again, and laters are for enabling some obvious
> > optimizations. However, it needs the vdpa device to be able to map
> > every IOVA space, and some vDPA devices are not able to do so. Checking
> > of this is added in previous commits.
>
> That might become a significant limitation. And it worries me that
> this is such a big patchset which might yet take a while to get
> finalized.
>

Sorry, maybe I've been unclear here: Latter commits in this series
address this limitation. Still not perfect: for example, it does not
support adding or removing guest's memory at the moment, but this
should be easy to implement on top.

The main issue I'm observing is from the kernel if I'm not wrong: If I
unmap every address, I cannot re-map them again. But code in this
patchset is mostly final, except for the comments it may arise in the
mail list of course.

> I have an idea: how about as a first step we implement a transparent
> switch from vdpa to a software virtio in QEMU or a software vhost in
> kernel?
>
> This will give us live migration quickly with performance comparable
> to failover but without dependance on guest cooperation.
>

I think it should be doable. I'm not sure about the effort that needs
to be done in qemu to hide these "hypervisor-failover devices" from
guest's view but it should be comparable to failover, as you say.

Networking should be ok by its nature, although it could require care
on the host hardware setup. But I'm not sure how other types of
vhost/vdpa devices may work that way. How would a disk/scsi device
switch modes? Can the kernel take control of the vdpa device through
vhost, and just start reporting with a dirty bitmap?

Thanks!

> Next step could be driving vdpa from userspace while still copying
> packets to a pre-registered buffer.
>
> Finally your approach will be a performance optimization for devices
> that support arbitrary IOVA.
>
> Thoughts?
>
> --
> MST
>


