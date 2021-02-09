Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1396C315341
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 16:57:44 +0100 (CET)
Received: from localhost ([::1]:51454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9VOZ-00012K-5o
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 10:57:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44926)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1l9VLy-0007PL-J8
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 10:55:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:38020)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1l9VLw-0006ru-Ty
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 10:55:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612886098;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=IfYDFFkYNrQGnW7JGicuJyjv1144ujVM0G4ncn3inK0=;
 b=Udxn+Gtn9NsZTZOcJtxyflxDeS2v/QENim1EGUt46CCA4CE0GeTdiDyK1f+IoM3AeBx/39
 nCe4Tn0NUFnbGAgcq/zTlr5VPSVYfZhFL1okEQvST6DZn0+0O8kDSVeC328q4IIxrM8sIS
 1McEAlyVmTsmgd+gy311n7c1vnn3XGQ=
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com
 [209.85.208.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-324-kkscIJr9PImgzLSdeylBOw-1; Tue, 09 Feb 2021 10:54:57 -0500
X-MC-Unique: kkscIJr9PImgzLSdeylBOw-1
Received: by mail-lj1-f200.google.com with SMTP id 133so4746022ljf.2
 for <qemu-devel@nongnu.org>; Tue, 09 Feb 2021 07:54:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IfYDFFkYNrQGnW7JGicuJyjv1144ujVM0G4ncn3inK0=;
 b=m+MtgcjSLY41/OVoD83TXRynfVWXaA4HvJqO/nuSXvnhSJ/RO/JP/t3iFadtSvZJJ6
 pwFtQM7rETuBAgKzkwOZ2QpPYDugzGq42aFwIwaxYmUs6ojZfHcDoJe80MnFyKqcvht0
 slZYG/tFqApJJ2PTwCvoPC0mCBt3EwQvi4NyJ602Or7bKqheh2Bys876QOLY4QQnw/C6
 EpT63c511tQUw49AKlFeXYDPu8m3LWcScg2bxoVWQbE0Ke9wxAhOmkakCD57WWNVCUS+
 TRBTJMFeBMVIitr8MMNFKplVZfl8LrXBsyR0pTS2FdFZHuvrcJmNTzUElJmcYZSd7lO4
 IyNA==
X-Gm-Message-State: AOAM532tM3zmw+rHslFeeWcpZ+6XBFAcOq0SczmoRLkH7AMxsAdHBAcJ
 uI78UQZxTVwMNBf4xEFAxQIKcdfGuDzLeEIrFp2wgpm12rq+6SsLGTvKSMHnZRQ2aOwgV2m8s0Y
 k7my6Kl00TEEVbO4RMyUPMQvOcVnf+JA=
X-Received: by 2002:a2e:b16d:: with SMTP id a13mr14713683ljm.39.1612886095014; 
 Tue, 09 Feb 2021 07:54:55 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzZJx/U3Mi4VdVIviiPxqhDC3UooBVjtwlQbaCCR/5dMR6StEi5ryQYz/JnOWR1lTV33xnVtYKgap8BsNzAZ8Q=
X-Received: by 2002:a2e:b16d:: with SMTP id a13mr14713642ljm.39.1612886094564; 
 Tue, 09 Feb 2021 07:54:54 -0800 (PST)
MIME-Version: 1.0
References: <20210209153757.1653598-1-eperezma@redhat.com>
In-Reply-To: <20210209153757.1653598-1-eperezma@redhat.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Tue, 9 Feb 2021 16:54:18 +0100
Message-ID: <CAJaqyWf0HHYko4qheXwnr70mX3ETiL0DkAj3bdMz=gfdPStpPw@mail.gmail.com>
Subject: Re: [RFC v2 0/7] vDPA shadow virtqueue - notifications forwarding
To: qemu-level <qemu-devel@nongnu.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.57,
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
 Jason Wang <jasowang@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 virtualization@lists.linux-foundation.org,
 Harpreet Singh Anand <hanand@xilinx.com>, Xiao W Wang <xiao.w.wang@intel.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Eli Cohen <eli@mellanox.com>,
 Stefano Garzarella <sgarzare@redhat.com>, Michael Lilja <ml@napatech.com>,
 Jim Harford <jim.harford@broadcom.com>, Rob Miller <rob.miller@broadcom.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Jason,

Correct me if I'm wrong. Based on this series, is your proposal to
move the touched functions in vhost.c [1] to vhost_ops, so they will
become backend-dependent operations, and then develop shadow vq
backend to intercept them?

Other code would also move to that new backend, like the setup/teardown.

[1] vhost_virtqueue_mask and vhost_dev_disable_notifiers


