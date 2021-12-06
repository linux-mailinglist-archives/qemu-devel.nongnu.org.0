Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2871046923E
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Dec 2021 10:21:47 +0100 (CET)
Received: from localhost ([::1]:48480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1muABt-0003So-Pm
	for lists+qemu-devel@lfdr.de; Mon, 06 Dec 2021 04:21:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53858)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pkrempa@redhat.com>)
 id 1muA9e-0002o1-Nf
 for qemu-devel@nongnu.org; Mon, 06 Dec 2021 04:19:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:43361)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pkrempa@redhat.com>)
 id 1muA9b-0004ge-EZ
 for qemu-devel@nongnu.org; Mon, 06 Dec 2021 04:19:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638782361;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=C1wLcyNV9kJYLyzTNXYq8JYyF156a+k507+RJjj7BJM=;
 b=U8aOnspZtfDqeT/hB56gDIo3oBfQ7DVDOHd2cpJv2Uy+WY6lPeTYrjhyfNAy0D63mvEvtw
 dKhAndz6Jtk+T1TikVEgyYexzlFYRKCljWTs5fliSzvhgXAUDoSpC/deTAZRp59c6UDlZy
 QGyscXQSdwLhQBBYjIvBSKUM1iphnW0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-9-jcVtG2DbOVWptuCqT5aWcg-1; Mon, 06 Dec 2021 04:19:20 -0500
X-MC-Unique: jcVtG2DbOVWptuCqT5aWcg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 710FB1B18BC0;
 Mon,  6 Dec 2021 09:19:19 +0000 (UTC)
Received: from angien.pipo.sk (unknown [10.40.208.10])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 09F1A60C13;
 Mon,  6 Dec 2021 09:19:03 +0000 (UTC)
Date: Mon, 6 Dec 2021 10:19:00 +0100
From: Peter Krempa <pkrempa@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH for-7.0] i386: Deprecate the -no-hpet QEMU command line
 option
Message-ID: <Ya3VhFvT0cRfvvXU@angien.pipo.sk>
References: <20211206084012.49277-1-thuth@redhat.com>
 <10bc4172-f6c0-504b-cecb-e7caf9edb074@redhat.com>
 <Ya3QltUi9CkqDJEN@angien.pipo.sk>
 <1fd3a291-0970-5a5f-9428-9539afc8559b@redhat.com>
MIME-Version: 1.0
In-Reply-To: <1fd3a291-0970-5a5f-9428-9539afc8559b@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pkrempa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pkrempa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.619,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Eduardo Habkost <eduardo@habkost.net>,
 "Michael S. Tsirkin" <mst@redhat.com>, Libvirt <libvir-list@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Dec 06, 2021 at 10:02:44 +0100, Thomas Huth wrote:
> On 06/12/2021 09.57, Peter Krempa wrote:
> > On Mon, Dec 06, 2021 at 09:47:58 +0100, Thomas Huth wrote:
> > > On 06/12/2021 09.40, Thomas Huth wrote:
> > > > The HPET setting has been turned into a machine property a while ago
> > > > already, so we should finally do the next step and deprecate the
> > > > legacy CLI option, too.
> > > > While we're at it, add a proper help text for the machine property, too.
> > > > 
> > > > Signed-off-by: Thomas Huth <thuth@redhat.com>
> > > > ---
> > > >    docs/about/deprecated.rst | 6 ++++++
> > > >    hw/i386/pc.c              | 2 ++
> > > >    qemu-options.hx           | 2 +-
> > > >    softmmu/vl.c              | 1 +
> > > >    4 files changed, 10 insertions(+), 1 deletion(-)
> > > > 
> > > > diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
> > > > index 5693abb663..1dfe69aa6a 100644
> > > > --- a/docs/about/deprecated.rst
> > > > +++ b/docs/about/deprecated.rst
> > > > @@ -198,6 +198,12 @@ form is preferred.
> > > >    Using ``-drive if=none`` to configure the OTP device of the sifive_u
> > > >    RISC-V machine is deprecated. Use ``-drive if=pflash`` instead.
> > > > +``-no-hpet`` (since 7.0)
> > > > +''''''''''''''''''''''''
> > > > +
> > > > +The HPET setting has been turned into a machine property.
> > > > +Use ``-machine hpet=off`` instead.
> > > [...]
> > > 
> > > Forgot to CC: the libvirt folks, doing so now.
> > > 
> > > Seems like libvirt is still using -no-hpet in some few spots, so I guess
> > > these would need to be changed first, before we could finally remove this
> > > option in QEMU?
> > 
> > Yes we need to switch to the new property first.
> > 
> > Is the new way via -machine property by any chance usable with
> > qemu-2.11? If yes, then we can do it unconditionally, otherwise we'll
> > need a witness to detect the support for the new flag as a qemu
> > capability.
> 
> The machine property has been added just a year ago:
> 
>  https://gitlab.com/qemu-project/qemu/-/commit/0259c78ca79
> 
> So it's just available on QEMU v5.2.0 and newer.

Okay, so we can't unfortunately always use the new way.

I had a brief look in what libvirt queries to build the capability list
and unfortunately neither query-command-line-options nor query-machines
list anything which we could detect.

Since only the config knob is changing the presence in qom-list-types
doesn't help either.

So if qemu want's to deprecate the '-no-hpet' spelling we need something
which we can detect by one of the above means or other probe command to
use the new spelling.


