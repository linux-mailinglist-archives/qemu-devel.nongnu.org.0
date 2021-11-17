Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4589D4544F7
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Nov 2021 11:28:05 +0100 (CET)
Received: from localhost ([::1]:55608 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnIAd-0000do-U9
	for lists+qemu-devel@lfdr.de; Wed, 17 Nov 2021 05:28:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50658)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kchamart@redhat.com>)
 id 1mnI8f-0007Nn-3c
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 05:26:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29018)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kchamart@redhat.com>)
 id 1mnI8c-0001bM-UB
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 05:26:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637144757;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=P5M7gRgupDUlyWG0HgWyUYbsDpE58Xh85aHyM1z0L5Q=;
 b=DcBL+unCrE2F6cZed1sTtSu67dhbNlCNYyIEdcqxDM/12KftzCzH2YRBY+SSP/VvinSVWq
 jEM243Pw0YolAoUB4Md8pqK1BdJkmBkfwX3rgMZH9LsjCd/Ruty4N6fcQ8ppob/24ZlkoJ
 dkvw27DTH0zCZBx2OzjeAIKOUdJFti8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-28-0whdeBtINXWeGjMAzmZLag-1; Wed, 17 Nov 2021 05:25:54 -0500
X-MC-Unique: 0whdeBtINXWeGjMAzmZLag-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 829871023F4E;
 Wed, 17 Nov 2021 10:25:53 +0000 (UTC)
Received: from paraplu (unknown [10.39.193.223])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 926575C1BB;
 Wed, 17 Nov 2021 10:25:42 +0000 (UTC)
Date: Wed, 17 Nov 2021 11:25:39 +0100
From: Kashyap Chamarthy <kchamart@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH v3 3/3] docs: rSTify the "SubmitAPatch" wiki
Message-ID: <YZTYo3H6TZheGbrj@paraplu>
References: <20211110144902.388183-1-kchamart@redhat.com>
 <20211110144902.388183-4-kchamart@redhat.com>
 <e0229a36-b8bd-3822-9994-46279bfa138c@redhat.com>
MIME-Version: 1.0
In-Reply-To: <e0229a36-b8bd-3822-9994-46279bfa138c@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kchamart@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kchamart@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.701,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 Daniel P =?iso-8859-1?Q?=2E_Berrang=E9?= <berrange@redhat.com>,
 Eric Blake <eblake@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>,
 qemu-devel@nongnu.org, Laurent Vivier <laurent@vivier.eu>,
 John Snow <jsnow@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Nov 17, 2021 at 10:08:52AM +0100, Thomas Huth wrote:
> On 10/11/2021 15.49, Kashyap Chamarthy wrote:

[...]

> >      writing-qmp-commands
> >      trivial-patches
> >      submitting-a-pull-request
> > +   submitting-a-patch
> 
> I'd suggest to insert this before the pull-request entry, in case anybody
> reads the manual sequentially, it might be better to learn about the patch
> submission process first before reading about pull requests.

I did notice it when looking at the rendered output, and still missed to
fix it; bad me.

> (I can fix this up when picking up the patch, no need to resend)

Thank you.

[...]

> > +Split up longer patches into a patch series of logical code changes.
> > +Each change should compile and execute successfully. For instance, don't
> > +add a file to the makefile in patch one and then add the file itself in
> > +patch two. (This rule is here so that people can later use tools like
> > +```git bisect`` <http://git-scm.com/docs/git-bisect>`__ without hitting
> 
> That hyperlink showed up in the rendered output. I'll fix it up by removing
> the "``" quotes.

Oops, good catch.

[...]

> > +QEMU follows the usual standard for git commit messages: the first line
> > +(which becomes the email subject line) is "subsystem: single line
> > +summary of change". Whether the "single line summary of change" starts
> > +with a capital is a matter of taste, but we prefer that the summary does
> > +not end in ".".
> 
> That ".". looks a little bit weird in the output ... maybe we should replace
> it with "does not end with a dot." ?

Re-looking the output, yes it does look odd.  And yes, your amendment
is good.

[...]

> > +The body of the commit message is a good place to document why your
> > +change is important. Don't include comments like "This is a suggestion
> > +for fixing this bug" (they can go below the "---" line in the email so
> 
> That --- gets translated into a — character ... I'll replace the "---" with
> ``---`` to fix it.

Ah, when I locally ran `rst2html5 submitting-a-patch.rst
submitting-a-patch.html` it retained the "---", but when I built QEMU
(`configure --target-list=x86_64-softmmu --enable-docs`), Sphinx does
turn it into an em-dash (—), and missed to notice it.

Thanks for the careful review and submitting the PR.  I'm assuming I
don't need to respin a v4.
 

-- 
/kashyap


