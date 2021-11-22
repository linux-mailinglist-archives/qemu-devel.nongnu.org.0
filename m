Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D0754459097
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Nov 2021 15:52:56 +0100 (CET)
Received: from localhost ([::1]:45426 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpAgh-0003rc-D4
	for lists+qemu-devel@lfdr.de; Mon, 22 Nov 2021 09:52:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59238)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kchamart@redhat.com>)
 id 1mpAZe-0003XP-MC
 for qemu-devel@nongnu.org; Mon, 22 Nov 2021 09:45:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47119)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kchamart@redhat.com>)
 id 1mpAZc-0004eg-IL
 for qemu-devel@nongnu.org; Mon, 22 Nov 2021 09:45:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637592332;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8ydClnzshLRe23XINH683gpM01E2VTNZ7KtLy7jFMFw=;
 b=VHKcLZpkh7W2RnoySHOBzHQyJ4KTH3/bgMq1W8P4H9zl7ydDtLVmxtatHQ2hnhL5d5QFtd
 QVlKcGX7xrp0Elqg8iY5mDaLf0EcvyRHR1Bme66r3vURac3JeooD0izSFJgrjKBFRybHW+
 1aE6Wq3o/42xjmyvT58WW+SDi7Xza5Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-368-IPNDePdfPaSP5MxkEBZgpw-1; Mon, 22 Nov 2021 09:45:29 -0500
X-MC-Unique: IPNDePdfPaSP5MxkEBZgpw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 521E6100CD03;
 Mon, 22 Nov 2021 14:45:28 +0000 (UTC)
Received: from paraplu (unknown [10.39.193.222])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8018E5F93C;
 Mon, 22 Nov 2021 14:45:25 +0000 (UTC)
Date: Mon, 22 Nov 2021 15:45:20 +0100
From: Kashyap Chamarthy <kchamart@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH 1/2] docs: Fix botched rST conversion of
 'submitting-a-patch.rst'
Message-ID: <YZusFeMlVzPugcoM@paraplu>
References: <20211119193118.949698-2-kchamart@redhat.com>
 <56026d2a-0b9e-ff83-d953-a284a810a8ed@redhat.com>
 <YZtu59t8DoZZ15nQ@paraplu>
 <b03ffb0c-0c4f-b792-f6c1-55014a0ae003@redhat.com>
 <YZuK09xP0I28dvMr@paraplu>
 <c591c571-f922-28a5-e8be-75e6cccb261a@redhat.com>
 <CAFEAcA8QuSsazUZU23DJgXHhU=ez948wQFJkHZGRYWxhiXbuDg@mail.gmail.com>
 <ef4ff222-1053-904a-77c2-39adc9dd929a@redhat.com>
 <CAFEAcA-+38PB3aOypgbAmeJN-X3P2gzB5K+CTAveXdt7jmF3mw@mail.gmail.com>
 <a2087e9c-82cb-8cc6-e580-9cc27891c196@redhat.com>
MIME-Version: 1.0
In-Reply-To: <a2087e9c-82cb-8cc6-e580-9cc27891c196@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.709,
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
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, Eric Blake <eblake@redhat.com>,
 Laurent Vivier <Laurent@vivier.eu>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Nov 22, 2021 at 03:01:58PM +0100, Thomas Huth wrote:
> On 22/11/2021 14.53, Peter Maydell wrote:

[...]

> > I don't think we should be recommending to new contributors that
> > they do things that established contributors generally do not do.
> > The document has enough "things you should do or think about" already.
> > My preference would be for simply not mentioning spelling-checking.

Fair points; and yes, the doc can be intimidating as is.

> > (If we do want to come up with some process for dealing with
> > spelling issues in the codebase, then we either need to put it
> > into CI so it's run automatically, or we need to have something
> > that works on the individual patch level.)

For individual patches, some projects use commit hooks for `aspell` /
`codespell`.  The contributor still needs to wade through false
positives, though.  For Sphinx-based documentation, there's
"sphinxcontrib-spelling"[1].  I don't know how effective it is, but it
lets one configure project-specific private dictionaries[2], which could
eliminate many false positives.

> Ok ... In any case - seems like this needs more discussion, so I'll
> drop it from the patch for now. We can still add some wording or CI
> magic later, but that's certainly something that we rather want to do
> after version 6.2 has been released...

Yeah, dropping it sounds fine.

[1] https://github.com/sphinx-contrib/spelling
[2] https://sphinxcontrib-spelling.readthedocs.io/en/latest/customize.html#private-dictionaries

-- 
/kashyap


