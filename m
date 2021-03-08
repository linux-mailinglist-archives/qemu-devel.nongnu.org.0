Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0294833124B
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 16:34:37 +0100 (CET)
Received: from localhost ([::1]:48476 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJHtz-0008FS-Fl
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 10:34:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53226)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lJHrZ-0007Td-Lq
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 10:32:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:31808)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lJHrQ-0003ub-JU
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 10:32:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615217515;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=Ijwqp46EoG1Rb8GRR1mJX7LRqgIy5DYD6gttrqwuog0=;
 b=gpFavRCdFZ7orNcipzBcjGlzxUwXeSV12/Ul60jBpvO98kNOhjjf4JUsKtzHcT6ACJ+wMQ
 h4mtnDtx/DQHB6A8XpK+QucntKmGQlgww37mTFme2kjIyTaQP/0fe67YWa04uNV/HCIXi9
 I55HXrHLBNjeC7udG2btfLA1KzIeOFs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-588-Yym9wYVLPhKfPeW0rUDEjw-1; Mon, 08 Mar 2021 10:31:52 -0500
X-MC-Unique: Yym9wYVLPhKfPeW0rUDEjw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D59E2108BD07;
 Mon,  8 Mar 2021 15:31:50 +0000 (UTC)
Received: from redhat.com (ovpn-114-69.ams2.redhat.com [10.36.114.69])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7FE8260C17;
 Mon,  8 Mar 2021 15:31:49 +0000 (UTC)
Date: Mon, 8 Mar 2021 15:31:46 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Warner Losh <imp@bsdimp.com>
Subject: Re: [PATCH v2] FreeBSD: Upgrade to 12.2 release
Message-ID: <YEZDYtnx/Qp76aIz@redhat.com>
References: <20210307155654.993-1-imp@bsdimp.com>
 <20210307155654.993-2-imp@bsdimp.com>
 <f707c609-e2ad-4b6c-985e-1218ae40e4eb@redhat.com>
 <CANCZdfq+ocyZnMt2td3ynx3gWqdPm1csddTjuhAEbxV-QL3Gow@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CANCZdfq+ocyZnMt2td3ynx3gWqdPm1csddTjuhAEbxV-QL3Gow@mail.gmail.com>
User-Agent: Mutt/2.0.5 (2021-01-21)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Stefan Weil <sw@weilnetz.de>, Thomas Huth <thuth@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Roman Bolshakov <r.bolshakov@yadro.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Mar 08, 2021 at 08:26:50AM -0700, Warner Losh wrote:
> On Mon, Mar 8, 2021 at 6:30 AM Thomas Huth <thuth@redhat.com> wrote:
> 
> > On 07/03/2021 16.56, Warner Losh wrote:
> > > FreeBSD 12.1 has reached end of life. Use 12.2 instead so that FreeBSD's
> > > project's packages will work.  Update which timezone to pick. Work
> > around a QEMU
> > > bug that incorrectly raises an exception on a CRC32 instruction with the
> > FPU
> > > disabled.  The qemu bug is described here:
> > > https://www.mail-archive.com/qemu-devel@nongnu.org/msg784158.html
> > >
> > > Signed-off-by: Warner Losh <imp@bsdimp.com>
> > >
> > > ---
> > >   tests/vm/freebsd | 14 +++++++++-----
> > >   1 file changed, 9 insertions(+), 5 deletions(-)
> >
> > I gave this a try, but it's currently failing in the unit tests:
> >
> > Running test test-crypto-tlscredsx509
> >
> > ** (tests/test-crypto-tlscredsx509:9999): CRITICAL **: 12:56:35.157:
> > Failed
> > to sign certificate ASN1 parser: Value is not valid.
> > ERROR test-crypto-tlscredsx509 - Bail out! FATAL-CRITICAL: Failed to sign
> > certificate ASN1 parser: Value is not valid.
> > gmake: *** [Makefile.mtest:576: run-test-70] Error 1
> > gmake: *** Waiting for unfinished jobs....
> > Running test test-crypto-tlssession
> >
> > ** (tests/test-crypto-tlssession:10002): CRITICAL **: 12:56:35.288: Failed
> > to sign certificate ASN1 parser: Value is not valid.
> > ERROR test-crypto-tlssession - Bail out! FATAL-CRITICAL: Failed to sign
> > certificate ASN1 parser: Value is not valid.
> >
> 
> That's totally unrelated to my change. Was it failing before? What
> environment was it failing in because it all seemed to work for me...

Do you have  gnutls package present ? These tests are only run if both
gnutls and libtasn1 development packages are present.

> 
> 
> > I guess it's the same problem as:
> >
> > https://lists.gnu.org/archive/html/qemu-devel/2021-01/msg06750.html
> >
> > ... so this would require a bug fix in the libtasn of FreeBSD first? See:
> >
> > https://gitlab.com/gnutls/libtasn1/-/merge_requests/71
> 
> 
>  Is this on the host that built qemu, or inside the VM or where exactly?

IIUC, it applies to anywhere the libtasn1 is built with modern clang.
IOW, the FreeBSD ports build of libtasn1 would need the patch.


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


