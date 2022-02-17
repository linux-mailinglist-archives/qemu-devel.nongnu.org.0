Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A4514B9C16
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Feb 2022 10:33:24 +0100 (CET)
Received: from localhost ([::1]:49390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKdAB-0005E1-2C
	for lists+qemu-devel@lfdr.de; Thu, 17 Feb 2022 04:33:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:32950)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kchamart@redhat.com>)
 id 1nKcxC-0001ZI-Gg
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 04:19:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:60832)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kchamart@redhat.com>)
 id 1nKcx9-0001AP-HE
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 04:19:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645089594;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WfGOesajA4FcsjHyQMIoxheaV5Wxmerc3U7hVfDJYFE=;
 b=EXJNuvcok/SH1v+UeSaqKWbjZoDOKGwsA4LQ9/P9h/BlvNhhP+GCmQWrCs3SquVtfw/fr1
 Kbe9kQDXqiGp7+IAvSRglqmyVSa60zMJnj1uR0UdoDjyD+2r/0oGV33rikwcz27wSGRkwL
 4tz3Xrgk9eiDPZYQH8N8tYx4zCJmWk4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-43-A02csnNPPPOrVS84ztcTbw-1; Thu, 17 Feb 2022 04:19:53 -0500
X-MC-Unique: A02csnNPPPOrVS84ztcTbw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4F9EF814243;
 Thu, 17 Feb 2022 09:19:52 +0000 (UTC)
Received: from paraplu (unknown [10.39.194.240])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E34285445C;
 Thu, 17 Feb 2022 09:19:09 +0000 (UTC)
Date: Thu, 17 Feb 2022 10:19:06 +0100
From: Kashyap Chamarthy <kchamart@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH 3/3] x86: Switch to q35 as the default machine type
Message-ID: <Yg4TCpFgT7PRxVXm@paraplu>
References: <20220215162537.605030-1-dgilbert@redhat.com>
 <20220215162537.605030-4-dgilbert@redhat.com>
 <YgvtLmoJcv+ZSW1S@redhat.com>
 <20220216105808.77kqhmsagz3ej74h@sirius.home.kraxel.org>
 <YgzZhHKSAFYTYFDc@work-vm>
 <db583712-cd6e-d67d-ad98-989a9867499a@redhat.com>
 <Yg03HB5KHGYWyI0J@work-vm>
 <f5ea8b34-2d50-c0d7-4ec0-ff0921dbcbd4@redhat.com>
MIME-Version: 1.0
In-Reply-To: <f5ea8b34-2d50-c0d7-4ec0-ff0921dbcbd4@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kchamart@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kchamart@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.083,
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
Cc: eduardo@habkost.net, Laurent Vivier <lvivier@redhat.com>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 quintela@redhat.com, mst@redhat.com,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-devel@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Feb 17, 2022 at 08:57:19AM +0100, Thomas Huth wrote:
> On 16/02/2022 18.40, Dr. David Alan Gilbert wrote:

[...]

> > So just adding something like the following under 'System emulator
> > machines':
> > 
> > x86 default machine type
> > ------------------------
> > 
> > x86 currently defaults to the very old ```pc``` machine type
> 
> I'd scrath the "very old" above since you repeat it below...
> 
> > which is based on the very old ```i440f``` chipset.  This default
> > will be removed and the user will be required to specify a machine
> > type explicitly using -M; users are encouraged to switch to the
> > not quite as old ```q35``` machine types.
> 
> ... but otherwise this sounds good to me.

Yeah, _not_ picking a default sounds good to me.  As there might come a
better machine type for x86 too, just like how "virt" machine type was
expressly designed for AArch64 guests.
 
> > (This option is going to take a lot more work switching all the
> > test cases over; in my world here I'd only changed the tests that broke
> > on q35, now everything is going to need to specify a type).
> 
> We've got a bunch of targets now already that do not have a default machine
> type yet (aarch64/arm, avr, rx, tricore), and some where the default machine
> type does not make too much sense for testing anyway (e.g. m68k) ... so it
> would maybe be good to have a global qtest_get_default_machine() function in
> the qtest framework anyway instead of re-encoding this in each and every
> test case.
> 
> Anyway, if we agree that the default machine type of x86 should go through
> the deprecation process, we've got plenty of time to fix this up in the
> tests, no need to rush this now before 7.0.
> 
> Other heretic question: Should we maybe get rid of the default machine type
> for *all* targets? ... so that we do not continue to run into this issue
> again and again and again...

Not at all heretic :-) I think the same reasoning above works here too.
FWIW, I agree to make the behaviour consistent across all targets.

[...] 

-- 
/kashyap


