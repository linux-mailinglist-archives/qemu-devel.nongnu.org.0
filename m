Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A829F364A4D
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Apr 2021 21:14:56 +0200 (CEST)
Received: from localhost ([::1]:40054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYZMF-0001PL-9p
	for lists+qemu-devel@lfdr.de; Mon, 19 Apr 2021 15:14:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45888)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1lYZFW-0007H5-Vk
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 15:07:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21157)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1lYZFV-0004x4-Ex
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 15:07:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618859276;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Z/ovsbUh81mA9IrQndZ/cUBWUlqdN2Q7RCRgQRd/1YE=;
 b=dxvTlPymH7HpZN94aulHYQ0bekCfuDrO99gqacj3dRsLe1xT4njUlCmcL29EYRd8vSz5jN
 Gexq8nNKJBODY/huWWwnm2c+6s+a8sazRgtqHtLg8rkD7olTVyUX8DbHp8Sfki8P0560hY
 rEwuoHLpvXH4k9LFgkzLSemQUPavR28=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-368-0pcWQ31sP1ORxs7_A-2EOg-1; Mon, 19 Apr 2021 15:07:54 -0400
X-MC-Unique: 0pcWQ31sP1ORxs7_A-2EOg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 24D228026AD;
 Mon, 19 Apr 2021 19:07:54 +0000 (UTC)
Received: from horse.redhat.com (ovpn-116-35.rdu2.redhat.com [10.10.116.35])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 06B6360C5F;
 Mon, 19 Apr 2021 19:07:54 +0000 (UTC)
Received: by horse.redhat.com (Postfix, from userid 10451)
 id 9306B22054F; Mon, 19 Apr 2021 15:07:53 -0400 (EDT)
Date: Mon, 19 Apr 2021 15:07:53 -0400
From: Vivek Goyal <vgoyal@redhat.com>
To: Connor Kuehl <ckuehl@redhat.com>
Subject: Re: [Virtio-fs] [PATCH 2/2] virtiofsd: Add help for -o xattr-mapping
Message-ID: <20210419190753.GE1472665@redhat.com>
References: <20210414201207.3612432-3-jose.carlos.venegas.munoz@intel.com>
 <CANRX0ORJA43.22ADKWIJW7DI0@redhat>
MIME-Version: 1.0
In-Reply-To: <CANRX0ORJA43.22ADKWIJW7DI0@redhat>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vgoyal@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=vgoyal@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: virtio-fs@redhat.com, Carlos Venegas <jose.carlos.venegas.munoz@intel.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Apr 14, 2021 at 04:44:26PM -0500, Connor Kuehl wrote:
> On Wed Apr 14, 2021 at 3:12 PM CDT, Carlos Venegas wrote:
> > The option is not documented in help.
> >
> > Add small help about the option.
> >
> > Signed-off-by: Carlos Venegas <jose.carlos.venegas.munoz@intel.com>
> > ---
> > tools/virtiofsd/helper.c | 3 +++
> > 1 file changed, 3 insertions(+)
> >
> > diff --git a/tools/virtiofsd/helper.c b/tools/virtiofsd/helper.c
> > index 28243b51b2..5e98ed702b 100644
> > --- a/tools/virtiofsd/helper.c
> > +++ b/tools/virtiofsd/helper.c
> > @@ -172,6 +172,9 @@ void fuse_cmdline_help(void)
> > " default: no_writeback\n"
> > " -o xattr|no_xattr enable/disable xattr\n"
> > " default: no_xattr\n"
> > + " -o xattrmap=<mapping> Enable xattr mapping (enables xattr)\n"
> > + " <mapping> is a string consists of a series of rules\n"
> > + " e.g. -o xattrmap=:map::user.virtiofs.:\n"
> 
> This is a helpful note, but it doesn't tell the whole story. I think
> it'd be helpful to add one last note to this option which is to
> recommend reading the virtiofsd(1) man-page for more information on
> xattrmap rules.

Is there a virtiofsd man page as well? All I see is
docs/tools/virtiofsd.rst.

Vivek


