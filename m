Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 67045358EB2
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Apr 2021 22:48:46 +0200 (CEST)
Received: from localhost ([::1]:36976 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUba1-0004if-GO
	for lists+qemu-devel@lfdr.de; Thu, 08 Apr 2021 16:48:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59582)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1lUbYN-00040r-P6
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 16:47:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52500)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1lUbYK-00038d-DU
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 16:47:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617914818;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=nGrTxNXGXgZjAbrfZO2x8lZWP49kueKWvY4ZxMoYIUY=;
 b=iMKBzkB9HRCzd5stX0xFXL/nFa+LP4LgatbS153jMve1GyARKBWNhFD+4RmkGs5DFHpq//
 25U8Qj/lgr7FEy34zcn/AX1eVfQj8OLfv78p5HicI0uSdOuW+cZRNmg3aavtq/hWQEBTKa
 x3AppYoFq0YRikpL3QgHI5S6C4J6a/Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-388-Ir7PjWocMAmH9h9p9vl8Gg-1; Thu, 08 Apr 2021 16:46:52 -0400
X-MC-Unique: Ir7PjWocMAmH9h9p9vl8Gg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 502721B2C980;
 Thu,  8 Apr 2021 20:46:51 +0000 (UTC)
Received: from localhost (ovpn-118-57.rdu2.redhat.com [10.10.118.57])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F2BC95C1C4;
 Thu,  8 Apr 2021 20:46:50 +0000 (UTC)
Date: Thu, 8 Apr 2021 16:46:50 -0400
From: Eduardo Habkost <ehabkost@redhat.com>
To: Babu Moger <babu.moger@amd.com>
Subject: Re: [PATCH v2] i386: Add missing cpu feature bits in EPYC-Rome model
Message-ID: <20210408204650.7ld2qinc4cfy2bxv@habkost.net>
References: <161478622280.16275.6399866734509127420.stgit@bmoger-ubuntu>
 <m28s74ky0y.fsf@oracle.com>
 <CAATJJ0KLga4V1vhyaAi9A6Gd6sXXah=RKo6PYEztgsjMmCHUww@mail.gmail.com>
 <8d472d0a-60c4-7d83-e91f-01c0b35a7429@amd.com>
MIME-Version: 1.0
In-Reply-To: <8d472d0a-60c4-7d83-e91f-01c0b35a7429@amd.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Christian Ehrhardt <christian.ehrhardt@canonical.com>,
 "david.edmondson@oracle.com" <david.edmondson@oracle.com>,
 "pankaj.gupta@cloud.ionos.com" <pankaj.gupta@cloud.ionos.com>,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Apr 08, 2021 at 10:28:21AM -0500, Babu Moger wrote:
> 
> 
> > -----Original Message-----
> > From: Christian Ehrhardt <christian.ehrhardt@canonical.com>
> > Sent: Thursday, April 1, 2021 3:06 AM
> > To: david.edmondson@oracle.com
> > Cc: Moger, Babu <Babu.Moger@amd.com>; Paolo Bonzini
> > <pbonzini@redhat.com>; Richard Henderson
> > <richard.henderson@linaro.org>; Eduardo Habkost
> > <ehabkost@redhat.com>; pankaj.gupta@cloud.ionos.com
> > Subject: Re: [PATCH v2] i386: Add missing cpu feature bits in EPYC-Rome
> > model
> > 
> > On Wed, Mar 3, 2021 at 5:24 PM <david.edmondson@oracle.com> wrote:
> > >
> > > On Wednesday, 2021-03-03 at 09:45:30 -06, Babu Moger wrote:
> > >
> > > > Found the following cpu feature bits missing from EPYC-Rome model.
> > > > ibrs    : Indirect Branch Restricted Speculation
> > > > ssbd    : Speculative Store Bypass Disable
> > > >
> > > > These new features will be added in EPYC-Rome-v2. The -cpu help
> > > > output after the change.
> > > >
> > > > x86 EPYC-Rome             (alias configured by machine type)
> > > > x86 EPYC-Rome-v1          AMD EPYC-Rome Processor
> > > > x86 EPYC-Rome-v2          AMD EPYC-Rome Processor
> > > >
> > > > Reported-by: Pankaj Gupta <pankaj.gupta@cloud.ionos.com>
> > > > Signed-off-by: Babu Moger <babu.moger@amd.com>
> > > > Signed-off-by: Pankaj Gupta <pankaj.gupta@cloud.ionos.com>
> > >
> > > Reviewed-by: David Edmondson <david.edmondson@oracle.com>
> > 
> > Hi,
> > this change/discussion seems as it was good back then but I realized it wasn't
> > applied in git yet.
> > Was there a different thread discussing what holds it back that I could not yet
> > find?
> > Since we are already in v6.0.0-rc1 the window to get it in shrinks, so I wanted
> > to give this a gentle ping.
> 
> Eduardo,
>  Do you have any concerns with these patches?  It is also fixing another
> problem reported here.
> https://bugs.launchpad.net/ubuntu/+source/qemu/+bug/1915063
> Can you please pull these changes?

I'm so sorry for missing this when it was submitted in March.
I'm queueing it right now and I'm going to submit a pull request
very soon, for -rc4.

-- 
Eduardo


