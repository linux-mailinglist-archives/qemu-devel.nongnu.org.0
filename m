Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A4DE9458E2D
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Nov 2021 13:21:53 +0100 (CET)
Received: from localhost ([::1]:54050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mp8KW-0003mU-QQ
	for lists+qemu-devel@lfdr.de; Mon, 22 Nov 2021 07:21:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45886)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kchamart@redhat.com>)
 id 1mp8IV-0002wT-DH
 for qemu-devel@nongnu.org; Mon, 22 Nov 2021 07:19:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:36178)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kchamart@redhat.com>)
 id 1mp8IS-0005eD-9B
 for qemu-devel@nongnu.org; Mon, 22 Nov 2021 07:19:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637583583;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=BZkVWBRrY+uvmMy1N+3hy6BNNXSYSfNPH4VS4n2ZSkI=;
 b=eRsT0Yi+s8za81ydcEtzz5dDB4u5FIjeIDeZMKa7IyE9pf7pYaTxe9yh0D8q5uF1YFm3Yb
 iRSBJuACLnTSvu+ZyRAHxKl3HN8m1c7NYjYBTGEusNG0SwrsU1rq+Fi7Km9hTCdDULbe11
 g5LZhw1U5SgkUgpSfnnovpzbZIPjhBo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-51-J9k2OuKkNpiohmTUxWREIQ-1; Mon, 22 Nov 2021 07:19:40 -0500
X-MC-Unique: J9k2OuKkNpiohmTUxWREIQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A368C18414A2;
 Mon, 22 Nov 2021 12:19:39 +0000 (UTC)
Received: from paraplu (unknown [10.39.193.57])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3556319D9F;
 Mon, 22 Nov 2021 12:19:33 +0000 (UTC)
Date: Mon, 22 Nov 2021 13:19:31 +0100
From: Kashyap Chamarthy <kchamart@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH 1/2] docs: Fix botched rST conversion of
 'submitting-a-patch.rst'
Message-ID: <YZuK09xP0I28dvMr@paraplu>
References: <20211119193118.949698-1-kchamart@redhat.com>
 <20211119193118.949698-2-kchamart@redhat.com>
 <56026d2a-0b9e-ff83-d953-a284a810a8ed@redhat.com>
 <YZtu59t8DoZZ15nQ@paraplu>
 <b03ffb0c-0c4f-b792-f6c1-55014a0ae003@redhat.com>
MIME-Version: 1.0
In-Reply-To: <b03ffb0c-0c4f-b792-f6c1-55014a0ae003@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.709,
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
 Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Nov 22, 2021 at 11:36:54AM +0100, Thomas Huth wrote:
> On 22/11/2021 11.20, Kashyap Chamarthy wrote:
> > On Mon, Nov 22, 2021 at 10:51:15AM +0100, Thomas Huth wrote:

[...]

> > > I'll add the link to https://wiki.qemu.org/Contribute/SpellCheck again.
> > 
> > Please don't -- I intentionally dropped it in a previous iteration based
> > on this feedback from Peter Maydell:
> > 
> >      "I'm not sure that SpellCheck in particular is sufficiently baked
> >      to be in the actual docs. I'd rather just drop the reference to it
> >      from SubmitAPatch."
> >      (https://lists.nongnu.org/archive/html/qemu-devel/2021-11/msg00137.html)
> 
> Ok, so I'll drop that line completely (otherwise it does not really make
> sense to have it in this list after the "See also:" right in front of it).

I kept that because an explicit reminder about spell-check is useful;
it's easy to forget.  Another option is to retain the line, but replace
"See also:" with "And:".  Not sure if it's any better.  But I don't mind
either way.

-- 
/kashyap


