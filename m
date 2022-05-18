Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 416FC52B460
	for <lists+qemu-devel@lfdr.de>; Wed, 18 May 2022 10:14:51 +0200 (CEST)
Received: from localhost ([::1]:60406 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nrEpW-0007l2-Bi
	for lists+qemu-devel@lfdr.de; Wed, 18 May 2022 04:14:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42492)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kchamart@redhat.com>)
 id 1nrEh9-0002Ae-0R
 for qemu-devel@nongnu.org; Wed, 18 May 2022 04:06:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36961)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kchamart@redhat.com>)
 id 1nrEh1-0003z3-Sm
 for qemu-devel@nongnu.org; Wed, 18 May 2022 04:06:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652861161;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=cX1pgLlNrRbvkx5iJtQgVjq2LkZI1DpeM64fT6mZEWg=;
 b=jODxshaXCurDxCAR0p/pYtN+gyf9A3aWI1x6TAHNSj6AEN1iHriyxSblnW3ddoSOewLhWB
 oGndKF+wBeLJv1QuwKhiJ+VmikuhsG023kIKsPSIrtU/XdwmP/16ndBc33iAvQP/nW4BCD
 X/zmXH91dHRgotO1JdMLwJ7es55bu/I=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-653-9aiTDLOWMuKIFMKmJ52nRQ-1; Wed, 18 May 2022 04:04:08 -0400
X-MC-Unique: 9aiTDLOWMuKIFMKmJ52nRQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E1CC31C0CE6D
 for <qemu-devel@nongnu.org>; Wed, 18 May 2022 08:04:07 +0000 (UTC)
Received: from paraplu (unknown [10.39.195.12])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2F68B492C3B;
 Wed, 18 May 2022 08:04:07 +0000 (UTC)
Date: Wed, 18 May 2022 10:04:04 +0200
From: Kashyap Chamarthy <kchamart@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org
Subject: Re: [PATCH] docs/devel: Fix broken internal link to mailing lists
Message-ID: <YoSodMuBPu0B5bnc@paraplu>
References: <20220315155426.659426-1-kchamart@redhat.com>
 <ed9a8e2d-77e1-1f75-11d6-5f06488b2e98@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ed9a8e2d-77e1-1f75-11d6-5f06488b2e98@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kchamart@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, May 18, 2022 at 09:04:35AM +0200, Thomas Huth wrote:
> On 15/03/2022 16.54, Kashyap Chamarthy wrote:
> > Missed this during the initial conversion.
> > 
> > Signed-off-by: Kashyap Chamarthy <kchamart@redhat.com>
> > ---
> > This patch should be merged on top of this[1].  Otherwise Sphinx will
> > complain (correctly so).
> > 
> > [1] https://lists.nongnu.org/archive/html/qemu-devel/2022-03/msg03488.html
> >      -- docs: rSTify MailingLists wiki; move it to QEMU Git
> > 
> > Signed-off-by: Kashyap Chamarthy <kchamart@redhat.com>
> > ---
> >   docs/devel/submitting-a-patch.rst | 14 +++++++-------
> >   1 file changed, 7 insertions(+), 7 deletions(-)
> > 
> > diff --git a/docs/devel/submitting-a-patch.rst b/docs/devel/submitting-a-patch.rst
> > index e51259eb9c..3632b74585 100644
> > --- a/docs/devel/submitting-a-patch.rst
> > +++ b/docs/devel/submitting-a-patch.rst
> > @@ -18,13 +18,13 @@ one-shot fix, the bare minimum we ask is that:
> >      <http://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/tree/Documentation/SubmittingPatches?id=f6f94e2ab1b33f0082ac22d71f66385a60d8157f#n297>`__
> >      policy.) ``git commit -s`` or ``git format-patch -s`` will add one.
> >   -  All contributions to QEMU must be **sent as patches** to the
> > -   qemu-devel `mailing list <MailingLists>`__. Patch contributions
> 
>  Hi Kashyap!

Hiya,

> This still seems to be broken - did you ever respin the other patches? (I
> was not able to spot a v3 of the series...?)

I have not respun yet, afraid.  Let's see what is pending:

  - Looking at my TODO notes, in v3, I just to need to add another
    docs/about/contacting-the-project.rst as per Peter's feedback here:

        https://lists.nongnu.org/archive/html/qemu-devel/2022-03/msg05178.html

  - Also, I haven't seen any comments on this one in v2:

        https://lists.nongnu.org/archive/html/qemu-devel/2022-03/msg03489.html
        [PATCH v2 3/3] docs: rSTify GettingStartedDevelopers wiki; move
        it to QEMU Git

    I'm assuming it is fine.

I'll send out a v3 this week.  Thanks for the reminder!  

-- 
/kashyap


