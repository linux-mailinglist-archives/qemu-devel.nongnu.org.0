Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BDCE54549F5
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Nov 2021 16:36:53 +0100 (CET)
Received: from localhost ([::1]:41548 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnMzU-0000hZ-D8
	for lists+qemu-devel@lfdr.de; Wed, 17 Nov 2021 10:36:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42882)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kchamart@redhat.com>)
 id 1mnMyd-0008Nl-A7
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 10:35:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:59698)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kchamart@redhat.com>)
 id 1mnMyZ-0007Xd-Qi
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 10:35:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637163354;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gSmdjeEPqEKjZnuoxXtsYnTWm0yjj2p36cBUKXhqpnU=;
 b=HwSPTRp8txE+YEvwpa1QpDac3Viu4JfYMK1AOGJd1tJoZWY4fc+ku+zpgFwxkYJs8PaGdl
 Y9B7k52e9ydsi0P4bfVkewtIM9CRzFj7TnjQrpQcJQgt7NfN0Dz68s4rH44XldnBmbhAee
 nBti9dy05jGeylHD2jIehBtsVjUxo6o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-225-T1gDHJIlMueIYDtF_uwlLg-1; Wed, 17 Nov 2021 10:35:49 -0500
X-MC-Unique: T1gDHJIlMueIYDtF_uwlLg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3EA318799E0;
 Wed, 17 Nov 2021 15:35:48 +0000 (UTC)
Received: from paraplu (unknown [10.39.194.88])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 374EA60C81;
 Wed, 17 Nov 2021 15:35:18 +0000 (UTC)
Date: Wed, 17 Nov 2021 16:35:15 +0100
From: Kashyap Chamarthy <kchamart@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH v3 3/3] docs: rSTify the "SubmitAPatch" wiki
Message-ID: <YZUhM1Dum+ad8waz@paraplu>
References: <20211110144902.388183-1-kchamart@redhat.com>
 <20211110144902.388183-4-kchamart@redhat.com>
 <e0229a36-b8bd-3822-9994-46279bfa138c@redhat.com>
 <YZTYo3H6TZheGbrj@paraplu>
 <cd1b4dcd-01c3-33e0-6525-cbcbcc24a165@redhat.com>
MIME-Version: 1.0
In-Reply-To: <cd1b4dcd-01c3-33e0-6525-cbcbcc24a165@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kchamart@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kchamart@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.701,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Eric Blake <eblake@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>,
 qemu-devel@nongnu.org, Laurent Vivier <laurent@vivier.eu>,
 John Snow <jsnow@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Nov 17, 2021 at 03:43:56PM +0100, Thomas Huth wrote:
> On 17/11/2021 11.25, Kashyap Chamarthy wrote:

[...]

> > > That ".". looks a little bit weird in the output ... maybe we should replace
> > > it with "does not end with a dot." ?
> > 
> > Re-looking the output, yes it does look odd.  And yes, your amendment
> > is good.
> 
> I haven't updated that one while picking up the patch - so we might want to
> fix it with an additional patch on top.

Sure, no prob.

[...]

> > Thanks for the careful review and submitting the PR.  I'm assuming I
> > don't need to respin a v4.
> 
> Right, patches have been merged now.

Thanks!

> Something I just noticed afterwards, after looking at the pages online:
> https://www.qemu.org/docs/master/devel/submitting-a-pull-request.html uses
> "Submit" in the heading, while
> https://www.qemu.org/docs/master/devel/submitting-a-patch.html uses
> "Submitting" ... looks a little bit inconsequent ... should we change it to
> use one form only? The Wiki used "submit", not "submitting", so maybe use
> that one?

Right, I generally also prefer the imperative mood ("submit").  I went
with "submitting" to keep things a bit consistent with the existing
convention: 'writing-qmp-commands.rst", "testing.rst", "tracing.rst",
"secure-coding-practises.rst", etc.  And as discussed on #qemu, OFTC,
I'll update the heading in submitting-a-pull-request.rst from "submit"
to "submitting".

Also, thanks for reminding on IRC of updating 'qemu-web' links to update
from Wiki to the in-tree docs.

    https://www.qemu.org/contribute/

I'll send a follow-up for that.  I see a three occurrences in the
'qemu-web' repo:

    $> git grep SubmitAPatch
    CONTRIBUTING.md:https://wiki.qemu.org/Contribute/SubmitAPatch
    contribute.md:Please do not submit merge requests on GitLab; patches are sent to the mailing list according to QEMU's [patch submissions guidelines](https://wiki.qemu.org/Contribute/SubmitAPatch).
    contribute/report-a-bug.md:QEMU does not use GitLab merge requests; patches are sent to the mailing list according to QEMU's [patch submissions guidelines](https://wiki.qemu.org/Contribute/SubmitAPatch).

-- 
/kashyap


