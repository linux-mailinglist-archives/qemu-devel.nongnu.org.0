Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8497745D7D2
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Nov 2021 10:58:26 +0100 (CET)
Received: from localhost ([::1]:58574 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mqBWL-0003YP-29
	for lists+qemu-devel@lfdr.de; Thu, 25 Nov 2021 04:58:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33886)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kchamart@redhat.com>)
 id 1mqBUF-00025X-Ey
 for qemu-devel@nongnu.org; Thu, 25 Nov 2021 04:56:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22837)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kchamart@redhat.com>)
 id 1mqBUB-0004av-Gw
 for qemu-devel@nongnu.org; Thu, 25 Nov 2021 04:56:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637834169;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=c0WXJLE0Fkr7i2C0TpNaIx1skBdSzOxT6j9yXi6lnW8=;
 b=FnfLqWG5kdqlEflROTyxjnZeGIUnR6c5KzZG9MJowZUYiezT6RCvFqcA+tLEPG4PYLMKx2
 WOcTEXeB/NoGTlSgU3PbuxiQmkNr5r55BrVJvuaKmClLXpyGmXxafeNH/Bm+rJcLSyOCEE
 lTZV1z2ybGmbr1/JbC7XqPpAcx1oLHM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-518-DxfZui4bPBuGgCVLMHdjDw-1; Thu, 25 Nov 2021 04:56:05 -0500
X-MC-Unique: DxfZui4bPBuGgCVLMHdjDw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B5618801B00
 for <qemu-devel@nongnu.org>; Thu, 25 Nov 2021 09:56:04 +0000 (UTC)
Received: from paraplu (unknown [10.39.194.214])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9044812E13;
 Thu, 25 Nov 2021 09:56:03 +0000 (UTC)
Date: Thu, 25 Nov 2021 10:56:01 +0100
From: Kashyap Chamarthy <kchamart@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: Other pages for docs/devel/ [Was: Re: ... Update URLs of
 "SubmitAPatch" ...]
Message-ID: <YZ9dsU2hwOG3kIzO@paraplu>
References: <20211118170028.820558-1-kchamart@redhat.com>
 <99a6b686-c2c4-dd5e-fe8c-9940311cdaca@redhat.com>
 <YZd5OLlyKegEphY9@paraplu>
 <bbc74dfc-0188-15cc-0483-f28b3caf075c@redhat.com>
MIME-Version: 1.0
In-Reply-To: <bbc74dfc-0188-15cc-0483-f28b3caf075c@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
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
Cc: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Nov 24, 2021 at 08:35:35PM +0100, Paolo Bonzini wrote:
> On 11/19/21 11:15, Kashyap Chamarthy wrote:
> > Noted; so these two pages:
> > 
> > -https://www.qemu.org/contribute/security-process/
> > -https://www.qemu.org/contribute/report-a-bug/

I posted a series for above two here:

    https://lists.nongnu.org/archive/html/qemu-devel/2021-11/msg04936.html
    [PATCH 0/2] rSTify 'report-a-bug' and 'security-process'; move them
    to QEMU Git

> > What about these two other pages (which are also linked to from the
> > "contribute"[1] part of the website)?  Do they belong to docs/devel?  If
> > not, should they be part of 'qemu-web', instead of the wiki?
> > 
> >      -https://wiki.qemu.org/Contribute/FAQ
> >      -https://wiki.qemu.org/Documentation/GettingStartedDevelopers
> 
> Yes, I suppose all of these can be moved to docs/devel.

I thought so; will send them as part of v2 of the above series.

-- 
/kashyap


