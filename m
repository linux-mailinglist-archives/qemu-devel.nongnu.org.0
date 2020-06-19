Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 367EB200B77
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Jun 2020 16:31:05 +0200 (CEST)
Received: from localhost ([::1]:34602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jmI2q-00022V-7d
	for lists+qemu-devel@lfdr.de; Fri, 19 Jun 2020 10:31:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38672)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1jmI1E-0000bm-07
 for qemu-devel@nongnu.org; Fri, 19 Jun 2020 10:29:24 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:56839
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1jmI1C-0007uQ-3g
 for qemu-devel@nongnu.org; Fri, 19 Jun 2020 10:29:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592576961;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=XwjHd40W50OknavUnr+gziP7g2F1L6v+BWslIjZEhbM=;
 b=N251QuOcXcMVqlewEOqU0U7gWrgDjzWKnhuxRTqDr8z6EDx29wO4usQyX/L4omxIXYtaFr
 KbiV/pt3UjK0v0nt3aXM96dWNlwvOKQygwDW1GysE261EC3bEPjFztmCnYpc0cW3o8h0+p
 kz+IyQ2XUKLjxiGbLLeJsh44sTqJ+Vg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-414-tl1gfxRYPc6vFz4G8tkTsQ-1; Fri, 19 Jun 2020 10:29:19 -0400
X-MC-Unique: tl1gfxRYPc6vFz4G8tkTsQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0A7421800D42;
 Fri, 19 Jun 2020 14:29:18 +0000 (UTC)
Received: from horse.redhat.com (ovpn-114-35.rdu2.redhat.com [10.10.114.35])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 36C3F10021B3;
 Fri, 19 Jun 2020 14:29:12 +0000 (UTC)
Received: by horse.redhat.com (Postfix, from userid 10451)
 id 56E9E220390; Fri, 19 Jun 2020 10:29:11 -0400 (EDT)
Date: Fri, 19 Jun 2020 10:29:11 -0400
From: Vivek Goyal <vgoyal@redhat.com>
To: Miklos Szeredi <miklos@szeredi.hu>
Subject: Re: [Virtio-fs] [PATCH 0/2] virtiofsd: drop Linux capabilities(7)
Message-ID: <20200619142911.GC3154@redhat.com>
References: <20200416164907.244868-1-stefanha@redhat.com>
 <20200618190816.GD3814@redhat.com>
 <CAJfpegsfqADmK6foDyuQQnvMDh_jE0rNUCBRuxPchSSirrb04Q@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJfpegsfqADmK6foDyuQQnvMDh_jE0rNUCBRuxPchSSirrb04Q@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=205.139.110.61; envelope-from=vgoyal@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/19 02:45:39
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: virtio-fs-list <virtio-fs@redhat.com>, qemu-devel@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jun 19, 2020 at 04:16:30PM +0200, Miklos Szeredi wrote:
> On Thu, Jun 18, 2020 at 9:08 PM Vivek Goyal <vgoyal@redhat.com> wrote:
> >
> > On Thu, Apr 16, 2020 at 05:49:05PM +0100, Stefan Hajnoczi wrote:
> > > virtiofsd doesn't need of all Linux capabilities(7) available to root.  Keep a
> > > whitelisted set of capabilities that we require.  This improves security in
> > > case virtiofsd is compromised by making it hard for an attacker to gain further
> > > access to the system.
> >
> > Hi Stefan,
> >
> > I just noticed that this patch set breaks overlayfs on top of virtiofs.
> 
> How so?  Virtiofs isn't mounting overlayfs, is it?  Only the mounter
> requires CAP_SYS_ADMIN, not the accessor.

Are you thinking of virtiofs on top of overlayfs? I was referring to
mounting overlayfs on top of virtiofs inside VM.

Thanks
Vivek


