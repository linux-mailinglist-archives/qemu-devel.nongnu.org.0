Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F35F36CAAE
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Apr 2021 19:56:39 +0200 (CEST)
Received: from localhost ([::1]:36564 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbRws-0000au-Cp
	for lists+qemu-devel@lfdr.de; Tue, 27 Apr 2021 13:56:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47786)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lbRsj-0005jS-7r
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 13:52:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49692)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lbRsd-0004CX-Au
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 13:52:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619545934;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=sywR0TQ7lKG74CTMeCHsecQJ/I1M9rQl66MFp4D3gwI=;
 b=TDBzfsY6nvc50Cle5v/CNCPzponAchVFDSR6PxGsXhmgkR2ehgdAmbKirrANRAFFgBorCR
 Otx+t2XEzuadSOj3VVL0sxPZtAf5YpiMYElisY1z/0ynz8670L9bF3trfwaturgmPeZmw9
 Ks9KGw6eKpA/tFaiVdcKibW+q9Qt2pI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-515-mwPjL1rCO_ekdsw0eNqjiA-1; Tue, 27 Apr 2021 13:52:12 -0400
X-MC-Unique: mwPjL1rCO_ekdsw0eNqjiA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BC6CC8049CB;
 Tue, 27 Apr 2021 17:52:10 +0000 (UTC)
Received: from work-vm (ovpn-114-253.ams2.redhat.com [10.36.114.253])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6C4845C23E;
 Tue, 27 Apr 2021 17:52:09 +0000 (UTC)
Date: Tue, 27 Apr 2021 18:52:06 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH 1/1] Set TARGET_PAGE_BITS to be 10 instead of 8 bits
Message-ID: <YIhPRprgFqNahPRp@work-vm>
References: <20210320220949.40965-1-mrolnik@gmail.com>
 <20210320220949.40965-2-mrolnik@gmail.com>
 <YFnjLbU9+itpbvsf@work-vm>
 <CAK4993iuteYNiM3acyGPNb5guwkfr3fKxJDecqcwKRdFTgG0sw@mail.gmail.com>
 <CAK4993gND7R1RBfimMdJXpJDvFdZiULdE2WKPKH+UnNaFm0iww@mail.gmail.com>
 <CAK4993iPwu2ESggMx05C0USrnSigHJq=-iP=BU-FhDXDcRH5gw@mail.gmail.com>
 <a57eed31-78c3-8ea5-579a-cb4edd1afbd3@linaro.org>
 <CAFEAcA-ccgKHzgxvK_Wb8hD4ce=KYu2NbZ-3UGhaW447JTVgAg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-ccgKHzgxvK_Wb8hD4ce=KYu2NbZ-3UGhaW447JTVgAg@mail.gmail.com>
User-Agent: Mutt/2.0.6 (2021-03-06)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.218,
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
Cc: Michael Rolnik <mrolnik@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Peter Maydell (peter.maydell@linaro.org) wrote:
> On Sun, 11 Apr 2021 at 16:15, Richard Henderson
> <richard.henderson@linaro.org> wrote:
> >
> > On 4/10/21 10:24 AM, Michael Rolnik wrote:
> > > Please review.
> >
> >
> > The first 256b is i/o, the next 768b are ram.  But having changed the page
> > size, it should mean that the first 1k are now treated as i/o.
> >
> > We do have a path by which instructions in i/o pages can be executed.  This
> > happens on some ARM board setups during cold boot.  But we do not save those
> > translations, so they run much much slower than it should.
> >
> > But perhaps in the case of AVR, "much much slower" really isn't visible?
> >
> > In general, I think changing the page size is wrong.  I also assume that
> > migration is largely irrelevant to this target.
> 
> Migration is irrelevant, but every target benefits from snapshot
> save-and-restore, and I think that uses the same codepaths ?

Yes it does.

My main problem for wanting this fixed is that I really wanted to add an
assert to stop us tripping over the page size/migration bits clash.

Dave

> -- PMM
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


