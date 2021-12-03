Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C172846740C
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Dec 2021 10:29:04 +0100 (CET)
Received: from localhost ([::1]:57138 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mt4sI-0003Eo-Lx
	for lists+qemu-devel@lfdr.de; Fri, 03 Dec 2021 04:29:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33490)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kchamart@redhat.com>)
 id 1mt4rB-0001sB-Fp
 for qemu-devel@nongnu.org; Fri, 03 Dec 2021 04:27:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37132)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kchamart@redhat.com>)
 id 1mt4r9-0000AH-6r
 for qemu-devel@nongnu.org; Fri, 03 Dec 2021 04:27:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638523669;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jqskNe0ZtRH3XEfLLz4htrp+q38HkpGcy3PRyHJp9Qc=;
 b=a2Ho2faz0wmZLgi/9zEezCp68rpIKAcO0y0NpgG01fryDVGANYP56cvyLhgeGWaDgJPzEd
 Q6oflopvcWyE6olJVAWfIfS7uQ0k/29VFEAAM2vtTomyg48PnVOeY8vJLg/ftqERugqz0G
 X9MDHeIB8fOmr+wSkEFbB1AY9hh8dso=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-264-z1coiQguMuC32fmHpc6mrQ-1; Fri, 03 Dec 2021 04:27:47 -0500
X-MC-Unique: z1coiQguMuC32fmHpc6mrQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6B50C363A5;
 Fri,  3 Dec 2021 09:27:46 +0000 (UTC)
Received: from paraplu (unknown [10.39.194.242])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AA5C579452;
 Fri,  3 Dec 2021 09:27:32 +0000 (UTC)
Date: Fri, 3 Dec 2021 10:27:30 +0100
From: Kashyap Chamarthy <kchamart@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH 2/2] docs: rSTify "report-a-bug" page; move it to QEMU Git
Message-ID: <YanjAmL5pmxfAUVa@paraplu>
References: <20211124142728.1221817-1-kchamart@redhat.com>
 <20211124142728.1221817-3-kchamart@redhat.com>
 <CAFEAcA-8uAu5nsyFCG6zo9+sFrywJxgeuUdgFzmdKx3wREUFrw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-8uAu5nsyFCG6zo9+sFrywJxgeuUdgFzmdKx3wREUFrw@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kchamart@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kchamart@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
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
Cc: pbonzini@redhat.com, thuth@redhat.com, eblake@redhat.com,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Nov 29, 2021 at 01:35:11PM +0000, Peter Maydell wrote:
> On Wed, 24 Nov 2021 at 14:27, Kashyap Chamarthy <kchamart@redhat.com> wrote:

[...]

> > [1] https://lists.nongnu.org/archive/html/qemu-devel/2021-11/msg04002.html
> > [2] https://www.qemu.org/contribute/report-a-bug/
> >
> > Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
> > Signed-off-by: Kashyap Chamarthy <kchamart@redhat.com>
> > ---
> >  docs/devel/index.rst           |  8 +++++---
> >  docs/devel/reporting-a-bug.rst | 37 ++++++++++++++++++++++++++++++++++
> >  2 files changed, 42 insertions(+), 3 deletions(-)
> >  create mode 100644 docs/devel/reporting-a-bug.rst
> 
> I don't think the bug-reporting instructions really belong in 'devel',
> because we would like all users to report bugs, not just developers.
> I think the /about/ section would be a better home for this file.

(Sorry for the slowness, I was out the last 4 days.)

Yeah; fair point.  Not sure why I didn't think about it :-).  I'll drop
this one.

        - - -

What do you think about these two pages:

    https://wiki.qemu.org/Contribute/FAQ
    https://wiki.qemu.org/Documentation/GettingStartedDevelopers

I think the 'Contribute/FAQ' page could be on the website, because the
same argument: FAQ can be used by any contributor, not just developers.
But 'GettingStartedDevelopers' can be in docs/devel/.  

Let me know if you think differently.

-- 
/kashyap


