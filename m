Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BE60449B9C
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Nov 2021 19:24:47 +0100 (CET)
Received: from localhost ([::1]:55418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mk9K2-0004rQ-9H
	for lists+qemu-devel@lfdr.de; Mon, 08 Nov 2021 13:24:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44782)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kchamart@redhat.com>)
 id 1mk9Ie-0003oP-5K
 for qemu-devel@nongnu.org; Mon, 08 Nov 2021 13:23:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:46938)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kchamart@redhat.com>)
 id 1mk9Ib-0002Au-8i
 for qemu-devel@nongnu.org; Mon, 08 Nov 2021 13:23:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636395795;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4tt7DjAJDmrn7PWV2Wxtb1XQ+WhCXLc0wluSGczxUaM=;
 b=dU5QpeGKaAxZkCETyuC4MFd8ya0cDFSRM2QSvk7TWpc0IxTzEuWtOymfhsBaV6zOpnzwQN
 Ac6NoKXwQCU/JHqop1AWRMb6eLtOk/jbKvmBKAM7IrV0Nb5VkhmtmV/UabQ3N2/bFQK/ye
 pFYL60lCViDoR655X0Z9jPH2Rjij8mw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-249-3x2ahwCaPtSTHXDPMuhKQQ-1; Mon, 08 Nov 2021 13:23:11 -0500
X-MC-Unique: 3x2ahwCaPtSTHXDPMuhKQQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 68B981023F4E;
 Mon,  8 Nov 2021 18:23:10 +0000 (UTC)
Received: from paraplu (unknown [10.39.195.200])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C0FC519730;
 Mon,  8 Nov 2021 18:22:39 +0000 (UTC)
Date: Mon, 8 Nov 2021 19:22:36 +0100
From: Kashyap Chamarthy <kchamart@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH v2 0/6] rSTify contribution-related wiki pages
Message-ID: <YYlq7LPBZI6u+fBr@paraplu>
References: <20211019090344.3054300-1-kchamart@redhat.com>
 <CAFEAcA8CHVfAXFaQwfZrQUfJcD9qQNOYAEt9vvpQVtgwtTf80w@mail.gmail.com>
 <YYFebObSyo6itE/R@paraplu>
 <124c2224-8983-3737-c8a5-1347bd83e941@redhat.com>
MIME-Version: 1.0
In-Reply-To: <124c2224-8983-3737-c8a5-1347bd83e941@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kchamart@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kchamart@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-trivial@nongnu.org,
 John Snow <jsnow@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org,
 Laurent Vivier <Laurent@vivier.eu>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Nov 08, 2021 at 04:16:56PM +0100, Thomas Huth wrote:
> On 02/11/2021 16.51, Kashyap Chamarthy wrote:
> > On Mon, Nov 01, 2021 at 02:56:43PM +0000, Peter Maydell wrote:
> > > On Tue, 19 Oct 2021 at 10:04, Kashyap Chamarthy <kchamart@redhat.com> wrote:
> > > > 
> > > > My main motivation was to convert SubmitAPatch[1] based on a chat with
> > > > Peter Maydell and Dan Berrangé on #qemu channel (on OFTC).  But the page
> > > > also links to a couple of other contribution-related pages, so I
> > > > converted them too:
> > > > 
> > > >    - SubmitAPullRequest: https://wiki.qemu.org/Contribute/SubmitAPullRequest
> > > >    - KeySigningParty: https://wiki.qemu.org/KeySigningParty
> > > >    - SpellCheck: https://wiki.qemu.org/Contribute/SpellCheck
> > > >    - TrivialPatches: https://wiki.qemu.org/Contribute/TrivialPatches
> > > 
> > > I'm not sure that SpellCheck in particular is sufficiently baked
> > > to be in the actual docs. I'd rather just drop the reference to it
> > > from SubmitAPatch.
> > 
> > Sure, will drop.
> > 
> > > KeySigningParty I'm on the fence about.
> > 
> > This is linked only from the SubmitAPullRequest page.  If we're
> > ambivalent about it, I'll just keep it in for reference.
> 
> FWIW, I'd rather prefer to keep the KeySigningParty stuff in the wiki - it
> does not feel like the right content for the docs that we ship in the
> release tarballs.

Sure, I can leave it on the Wiki as-is.  I thought of keeping it in-tree
as it's a developer- and maintainer-related doc; and to minimize using
the Wiki for important docs such as these.  As we know, being in-tree is
likely to receive updates.  Also ... I'm not sure how many regular users
downloading the tarball will read the docs/devel/ directory. :-)

(/me wonders if there's a way to selectively "uncheck" certain docs when
building the tarball.)

-- 
/kashyap


