Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C799F40473C
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Sep 2021 10:49:13 +0200 (CEST)
Received: from localhost ([::1]:53892 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOFk8-0001gZ-PH
	for lists+qemu-devel@lfdr.de; Thu, 09 Sep 2021 04:49:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38074)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mOFip-0000np-VS
 for qemu-devel@nongnu.org; Thu, 09 Sep 2021 04:47:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41192)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mOFio-0004OJ-8I
 for qemu-devel@nongnu.org; Thu, 09 Sep 2021 04:47:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631177269;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ht0FB2zUFprTCekNOHbaFck6tgqsK6ZGVJp2bEVY3cM=;
 b=QKucVJhm9c2KieuVW58H9PTBp/AbA+GrS+hNaZ6b+Mg5he38hdJsOvsRFSrZk+H9seCxN5
 gTzZOV7iHh54onAIlTROPDr3BGiUVVI3bVtWcC7mvGfTnztzYmKo+5arNQgMf4vbiQcTJh
 bu8s/T+m3Mt7vvIPI0qr+FZzGzd7nGQ=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-501-29mby4r9OZuATGGH90GzMw-1; Thu, 09 Sep 2021 04:47:48 -0400
X-MC-Unique: 29mby4r9OZuATGGH90GzMw-1
Received: by mail-wr1-f72.google.com with SMTP id
 n1-20020a5d4c41000000b00159305d19baso278222wrt.11
 for <qemu-devel@nongnu.org>; Thu, 09 Sep 2021 01:47:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=Ht0FB2zUFprTCekNOHbaFck6tgqsK6ZGVJp2bEVY3cM=;
 b=g8m20bxEyyTG27nCBV2uUvJ+1fBW+AKnHgpI1a5GlDSfh7iiztlhUeSFoyw05KxKvL
 F0y4KcnuzMQLUNqOaGYg0aveRh0BcOqSNBxm6ds76tCkjqyxN3QgYpHfWdsvjDLq/QZ+
 vbKHODLx1PD/Ep5VCKIwgMzevm2fsqaApzgjohPM0nJwcEe8qKKdruWbk9KIZpMTu1WJ
 cr2B9KoeTtVYeb0ousvZpikFl+sy0QMzyssuhlU21z/sci49eA1gfueWPUJ/9+EjaE2R
 PRMytujx0Cl4QST05xHBCTIIvTOi3Efokh0PhvHNhTORuD5PxdK2rN6g6YXeOCWZGE9w
 Efew==
X-Gm-Message-State: AOAM532XaVxAgLC88lI8Xd1eVYtCO0zpzF5wVGEEj1O4JTrmWoVxc4bq
 TyZ89wVQCxCHEUkOuQz7aY/XRcFILP/SD6jmF3dHfDB8EpY5Cg7B3l5N0I22YGtQs4E17q+S23D
 78GVSuXw3gQpbsB0=
X-Received: by 2002:a1c:f60c:: with SMTP id w12mr1778405wmc.3.1631177267293;
 Thu, 09 Sep 2021 01:47:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw5W5M/eKYjSU5C9cXCFGVpGX8WRhN8JTqiQYdjo4bXXjaqlf3KVMunpz5/T99dZXd84zcjfg==
X-Received: by 2002:a1c:f60c:: with SMTP id w12mr1778371wmc.3.1631177266928;
 Thu, 09 Sep 2021 01:47:46 -0700 (PDT)
Received: from redhat.com ([2.55.145.189])
 by smtp.gmail.com with ESMTPSA id 4sm621315wmv.42.2021.09.09.01.47.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Sep 2021 01:47:46 -0700 (PDT)
Date: Thu, 9 Sep 2021 04:47:42 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Subject: Re: [PATCH] vhost-vsock: fix migration issue when seqpacket is
 supported
Message-ID: <20210909044603-mutt-send-email-mst@kernel.org>
References: <20210907124935.147164-1-sgarzare@redhat.com>
 <YTdnkPR+LjNFXaeQ@redhat.com>
MIME-Version: 1.0
In-Reply-To: <YTdnkPR+LjNFXaeQ@redhat.com>
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
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.393,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 Jiang Wang <jiang.wang@bytedance.com>, qemu-stable@nongnu.org,
 qemu-devel@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 Arseny Krasnov <arseny.krasnov@kaspersky.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Sep 07, 2021 at 02:22:24PM +0100, Daniel P. Berrangé wrote:
> On Tue, Sep 07, 2021 at 02:49:35PM +0200, Stefano Garzarella wrote:
> > Commit 1e08fd0a46 ("vhost-vsock: SOCK_SEQPACKET feature bit support")
> > enabled the SEQPACKET feature bit.
> > This commit is released with QEMU 6.1, so if we try to migrate a VM where
> > the host kernel supports SEQPACKET but machine type version is less than
> > 6.1, we get the following errors:
> > 
> >     Features 0x130000002 unsupported. Allowed features: 0x179000000
> >     Failed to load virtio-vhost_vsock:virtio
> >     error while loading state for instance 0x0 of device '0000:00:05.0/virtio-vhost_vsock'
> >     load of migration failed: Operation not permitted
> > 
> > Let's disable the feature bit for machine types < 6.1, adding a
> > `features` field to VHostVSock to simplify the handling of upcoming
> > features we will support.
> 
> IIUC, this will still leave migration broken for anyone migrating
> a >= 6.1 machine type between a kernel that supports SEQPACKET and
> a kernel lacking that, or vica-verca.  
> 
> If a feature is dependant on a host kernel feature we can't turn
> that on automatically as part of the machine type, as we need
> ABI stability across migration indepdant of kernel version.
> 
> 
> Regards,
> Daniel

This is a fundamental problem we have with kernel accelerators.
A higher level solution at management level is needed.
For now yes, we do turn features on by default,
consistent kernels on source and destination are assumed.
For downstreams not a problem at all as they update
userspace and kernel in concert.


> -- 
> |: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
> |: https://libvirt.org         -o-            https://fstop138.berrange.com :|
> |: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


