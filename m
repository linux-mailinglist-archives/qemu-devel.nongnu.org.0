Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EFEC441C02B
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Sep 2021 09:55:15 +0200 (CEST)
Received: from localhost ([::1]:54750 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVUQs-0002OR-Hx
	for lists+qemu-devel@lfdr.de; Wed, 29 Sep 2021 03:55:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51340)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kchamart@redhat.com>)
 id 1mVUPl-0001BD-Oq
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 03:54:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48120)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kchamart@redhat.com>)
 id 1mVUPj-0001Q2-5w
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 03:54:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632902041;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=RhgD7eND34d75YprEtEk4taOp73a46o8LLU56vj2DFE=;
 b=Wjek/LHSsianFnX5yv8pko5b/k/Ni1lufBZDHlHs42wXeWzB/jh+xdGwexYQvkqkW3/PIY
 5ppFSenjwosgk25dtvDjG/mccP9dWQ5NKM8rIRRCnGkhdKFyCvM8fC7WC1wmqrX0H5i5vf
 msGJyOzFgQb5i7t0KPogfPo59+BQc9A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-284-DQboieUEMfOLBAN0NSCoxg-1; Wed, 29 Sep 2021 03:53:59 -0400
X-MC-Unique: DQboieUEMfOLBAN0NSCoxg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9A5B6801E72;
 Wed, 29 Sep 2021 07:53:58 +0000 (UTC)
Received: from paraplu.home (unknown [10.39.194.201])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5462C5D9C6;
 Wed, 29 Sep 2021 07:53:51 +0000 (UTC)
Date: Wed, 29 Sep 2021 09:53:48 +0200
From: Kashyap Chamarthy <kchamart@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 0/3] rSTify SubmitAPatch, TrivialPatches, and SpellCheck
 wiki pages
Message-ID: <YVQbjBMyPnE2uQ5p@paraplu.home>
References: <20210922121054.1458051-1-kchamart@redhat.com>
 <36a4b1a7-2027-dd67-cc4f-64f5f525c7d6@redhat.com>
MIME-Version: 1.0
In-Reply-To: <36a4b1a7-2027-dd67-cc4f-64f5f525c7d6@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kchamart@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kchamart@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 John Snow <jsnow@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>,
 Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Sep 28, 2021 at 07:31:26PM +0200, Paolo Bonzini wrote:
> On 22/09/21 14:10, Kashyap Chamarthy wrote:

[...]

> >   docs/devel/spell-check.rst        |  29 ++
> >   docs/devel/submitting-a-patch.rst | 460 ++++++++++++++++++++++++++++++
> >   docs/devel/trivial-patches.rst    |  53 ++++
> >   3 files changed, 542 insertions(+)
> >   create mode 100644 docs/devel/spell-check.rst
> >   create mode 100644 docs/devel/submitting-a-patch.rst
> >   create mode 100644 docs/devel/trivial-patches.rst
> > 
> 
> I think this is missing a link to the new documents in the toctree?

You're right; will do in v2.  (I accidentally added 'toctree' to the
same doc, but then I realized, "no, you should update the index.rst" and
I still missed it.)

> Also, I would prefer to have the headings as "===" "---" "~~~" consistently
> (I have posted some patches this morning that do this for a few more files).

Sure.  I actually checked a couple of existing docs in-tree
build-system.rst and qapi-code-gen.rst) before I used this set of
headings. 

[1] https://www.kernel.org/doc/html/v4.10/doc-guide/sphinx.html#specific-guidelines-for-the-kernel-documentation

-- 
/kashyap


