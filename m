Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 594282C5CAA
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Nov 2020 20:43:36 +0100 (CET)
Received: from localhost ([::1]:41290 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kiNB0-0008JM-TO
	for lists+qemu-devel@lfdr.de; Thu, 26 Nov 2020 14:43:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37864)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1kiN9H-0007Ot-FG
 for qemu-devel@nongnu.org; Thu, 26 Nov 2020 14:41:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20108)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1kiN9E-0001fh-7S
 for qemu-devel@nongnu.org; Thu, 26 Nov 2020 14:41:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606419702;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=442OzvPYF7hLNa2WCnQX9NH7ZNb0tiZDBEWQCsNOR3M=;
 b=eWrJUHMCuBmDTVolZS47sjpgcY+OwC8TE2hj3H9u+w2F3BRe+6qBtKKnEvrZqakkXGuzIQ
 22oM0e9Q5ktpIQ6zQaSCknf5Bf5+BVyN1W332I9x4uLZGk40YKNJymmIyucwTNbgXKyqvm
 YcnjUeL0hfE46u/BfNUsTzwdWVH5ZkI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-553-W8lGy3cBMpalckEt_2_Qdw-1; Thu, 26 Nov 2020 14:41:40 -0500
X-MC-Unique: W8lGy3cBMpalckEt_2_Qdw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 16EFA1E7D3;
 Thu, 26 Nov 2020 19:41:39 +0000 (UTC)
Received: from localhost (unknown [10.40.208.32])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6C0B619C66;
 Thu, 26 Nov 2020 19:41:34 +0000 (UTC)
Date: Thu, 26 Nov 2020 20:41:32 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [DISCUSSION] Allow ACPI default OEM ID and OEM table ID fields
 to be set.
Message-ID: <20201126204132.01c8cfba@redhat.com>
In-Reply-To: <20201126120350-mutt-send-email-mst@kernel.org>
References: <20201125132711.jqb7znxu5jpoanwi@tartarus>
 <20201125133251.GI30079@redhat.com>
 <20201125110221-mutt-send-email-mst@kernel.org>
 <20201125201322.urze5b7vwaa2t5sy@tartarus>
 <20201126051838-mutt-send-email-mst@kernel.org>
 <20201126125012.x6yzsou5rmlxagli@tartarus>
 <20201126082606-mutt-send-email-mst@kernel.org>
 <20201126163450.knb55wh2u7k2qgbb@tartarus>
 <20201126120350-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Antoine Damhet <antoine.damhet@blade-group.com>, lersek@redhat.com,
 "Richard W.M. Jones" <rjones@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 26 Nov 2020 12:05:27 -0500
"Michael S. Tsirkin" <mst@redhat.com> wrote:

> On Thu, Nov 26, 2020 at 05:34:50PM +0100, Antoine Damhet wrote:
> > On Thu, Nov 26, 2020 at 08:29:41AM -0500, Michael S. Tsirkin wrote:  
> > > On Thu, Nov 26, 2020 at 01:50:12PM +0100, Antoine Damhet wrote:  
> > > > On Thu, Nov 26, 2020 at 06:09:11AM -0500, Michael S. Tsirkin wrote:  
> > > > > On Wed, Nov 25, 2020 at 09:13:22PM +0100, Antoine Damhet wrote:  
> > > > > > On Wed, Nov 25, 2020 at 11:04:55AM -0500, Michael S. Tsirkin wrote:  
> > > > > > > On Wed, Nov 25, 2020 at 01:32:51PM +0000, Richard W.M. Jones wrote:  
> > > > > > > > On Wed, Nov 25, 2020 at 02:27:11PM +0100, Antoine Damhet wrote:  
> > 
> > [...]
> >   
> > > Exactly so I ask myself whether it's worth it, their next version
> > > will check CPUID and then where are we?  
> > 
> > Then I guess they will have to admit that they are purposefully blocking
> > VM use and it's not our problem anymore.
> >   
> > > But maybe it's time we just changed all these IDs to e.g. QEMU.
> > > We are very far from bochs generated tables by now.  
> > 
> > That's a good idea, but I still think they should be user override-able
> > (unless you think it would be a heavy maintenance burden, in that case
> > you are king in your castle :D )
> >   
> > > Question is will this cause annoyances with e.g. windows guests?  
> > 
> > Windows 10 guests seems unaffected, I cannot say for the other
> > versions/servers editions.  
> 
> unaffected yes, but what about things like reactivation,
> warning about system changes at boot or reinstalling
> drivers? changing acpi significantly does this sometimes ...

that's what I'd think might happen, with some old Windows version
but I don't have any proof wrt it.

> 
> > > Igor what's your experience with this?  
> > 
> > [...]
> > 
> > -- 
> > Antoine 'xdbob' Damhet  
> 
> 


