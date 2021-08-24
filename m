Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 381A13F6179
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Aug 2021 17:23:08 +0200 (CEST)
Received: from localhost ([::1]:46418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIYGZ-0004Ha-A6
	for lists+qemu-devel@lfdr.de; Tue, 24 Aug 2021 11:23:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39420)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mIYEf-0002ri-Pb
 for qemu-devel@nongnu.org; Tue, 24 Aug 2021 11:21:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51434)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mIYEc-0002Wk-A9
 for qemu-devel@nongnu.org; Tue, 24 Aug 2021 11:21:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629818464;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=51fvc5N2zKiO6GQ4Cd2fp+s1ngnBsEc9Kgtln7DsqsI=;
 b=HrWbdTef824LxenyMHYl0Eg7KdL3UXbW8zfptNWmu1Boa+qv4DvAvLnHhKdi+LRlvqM2vo
 XP6S/+l1Lsb93F2msZr7cDC5h4nz+Ay1Yg98fmtsXme8b2pAIPuiSwjtcZ+gFx1WgjWyvz
 x6qF8MFMm3ZKuuyn2VXnQeIG0U4ifLg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-543-hvAgI43JOua2CnL1uy9icg-1; Tue, 24 Aug 2021 11:20:57 -0400
X-MC-Unique: hvAgI43JOua2CnL1uy9icg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BD56280292A;
 Tue, 24 Aug 2021 15:20:56 +0000 (UTC)
Received: from redhat.com (unknown [10.39.193.115])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C750718432;
 Tue, 24 Aug 2021 15:20:55 +0000 (UTC)
Date: Tue, 24 Aug 2021 17:20:54 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: Using loadvm with snapshot
Message-ID: <YSUOVqyjJ4xqsMgK@redhat.com>
References: <BY5PR02MB7028431FD055B48DAD3841F7F7F99@BY5PR02MB7028.namprd02.prod.outlook.com>
 <YRvjHiZmPkSuv//z@work-vm>
 <CAFEAcA_h_WWf=0rU1yTqOA4AH5kYfLNqdbqHokdtoBP7bmepUw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_h_WWf=0rU1yTqOA4AH5kYfLNqdbqHokdtoBP7bmepUw@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.747,
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
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Gabriel Southern <gsouther@qti.qualcomm.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 17.08.2021 um 20:48 hat Peter Maydell geschrieben:
> On Tue, 17 Aug 2021 at 17:27, Dr. David Alan Gilbert
> <dgilbert@redhat.com> wrote:
> >
> > * Gabriel Southern (gsouther@qti.qualcomm.com) wrote:
> > > Hi,
> > >
> > > Are there plans to support using -loadvm with -snapshot?
> > >
> > > I saw some past discussion on mailing list including bug that was closed earlier this year but no recent activity:
> > >
> > > https://lore.kernel.org/qemu-devel/162424905685.11837.7303570061857383641.malone@loganberry.canonical.com/
> > >
> > > Testing with latest qemu it looks like -loadvm still does not work when combined with -snapshot.
> > >
> > > I'm curious how complex it would be to implement this feature and if it may show up on QEMU roadmap in the future. Or if there is alterative command that can be used to save the state of a running VM and then use the same qcow to run multiple QEMU instances loading this VM state running in snapshot mode.
> 
> Do you know why -loadvm and -snapshot don't work together?
> It doesn't on the face of it seem like they would be incompatible...

Probably because -snapshot first adds a temporary qcow2 overlay to the
image, and then -loadvm fails because the newly created temporary
overlay doesn't contain the requested snapshot.

Internal and external snapshots don't really mix well.

Kevin


