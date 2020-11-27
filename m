Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 260432C640E
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Nov 2020 12:46:24 +0100 (CET)
Received: from localhost ([::1]:42124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kicCl-0004MW-7s
	for lists+qemu-devel@lfdr.de; Fri, 27 Nov 2020 06:46:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45938)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <r.bolshakov@yadro.com>)
 id 1kicBe-0003pX-Aw
 for qemu-devel@nongnu.org; Fri, 27 Nov 2020 06:45:14 -0500
Received: from mta-02.yadro.com ([89.207.88.252]:58854 helo=mta-01.yadro.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <r.bolshakov@yadro.com>)
 id 1kicBc-0004pI-HE
 for qemu-devel@nongnu.org; Fri, 27 Nov 2020 06:45:13 -0500
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 299B641389;
 Fri, 27 Nov 2020 11:45:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 in-reply-to:content-disposition:content-type:content-type
 :mime-version:references:message-id:subject:subject:from:from
 :date:date:received:received:received; s=mta-01; t=1606477508;
 x=1608291909; bh=TUJ00ZQ4GBq7Ftp+wauSBQHySWuS5BpNMAQE1gt4n1E=; b=
 UPlvYrttnQJJtqW5q/2xUYWSPJne3djtEALQFeNFywtyYxCCUoSNJI0irzzkgKbk
 0CiOeDfipYqJQjxeJ512spUYcD/rPDo1m9h0U9y3HnjzQ6ykpd8mKWUNvpil14XU
 11Q1fjRsiVAe08t+FoDiNeIWQZlzKKtghiqoexRaN9U=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vW50BEulZFcf; Fri, 27 Nov 2020 14:45:08 +0300 (MSK)
Received: from T-EXCH-03.corp.yadro.com (t-exch-03.corp.yadro.com
 [172.17.100.103])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 1624641206;
 Fri, 27 Nov 2020 14:45:07 +0300 (MSK)
Received: from localhost (172.17.204.212) by T-EXCH-03.corp.yadro.com
 (172.17.100.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Fri, 27
 Nov 2020 14:45:07 +0300
Date: Fri, 27 Nov 2020 14:45:12 +0300
From: Roman Bolshakov <r.bolshakov@yadro.com>
To: Peter Krempa <pkrempa@redhat.com>
Subject: Re: [PATCH for-6.0 6/6] qapi: Deprecate 'query-kvm'
Message-ID: <20201127114512.GE67322@SPB-NB-133.local>
References: <20201116131011.26607-1-r.bolshakov@yadro.com>
 <20201116131011.26607-7-r.bolshakov@yadro.com>
 <20201127105059.GC1596141@redhat.com>
 <20201127112154.GA105758@angien.pipo.sk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20201127112154.GA105758@angien.pipo.sk>
X-Originating-IP: [172.17.204.212]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
 T-EXCH-03.corp.yadro.com (172.17.100.103)
Received-SPF: pass client-ip=89.207.88.252; envelope-from=r.bolshakov@yadro.com;
 helo=mta-01.yadro.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Cc: libvir-list@redhat.com,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Nov 27, 2020 at 12:21:54PM +0100, Peter Krempa wrote:
> On Fri, Nov 27, 2020 at 10:50:59 +0000, Daniel Berrange wrote:
> > Copying libvir-list for the deprecation warning.
> > 
> > 
> > On Mon, Nov 16, 2020 at 04:10:11PM +0300, Roman Bolshakov wrote:
> > > 'query-accel' QMP command should be used instead.
> > > 
> > > Signed-off-by: Roman Bolshakov <r.bolshakov@yadro.com>
> > > ---
> > >  qapi/machine.json | 6 +++++-
> > >  1 file changed, 5 insertions(+), 1 deletion(-)
> > 
> > docs/system/deprecated.rst needs to be updated for any deprecation
> > to be visible to consumers of QEMU.
> 
> On behalf of libvirt I'd like to ask to consider cases where the
> replacement for a deprecated feature is added in the same release as the
> deprecation happens, to treat the replacement as API stable at merge
> time.
> 
> Any changes to the command after the series is merged with a deprecation
> of the old should be consulted with the libvirt team as we might
> actually have already added support for the new approach. Considering it
> as "it wasn't released so we can change it" may introduce breakage given
> that the relase cycles of libvirt and qemu are not in sync.
> 
> We try hard to stay on top of such changes by using the new interface as
> soon as possible, but that is very hard if the replacement changes
> during the dev cycle.
> 

I see, thanks for the explanation! Perhaps I'll drop deprecation from
the series to avoid the issue.

Then as soon as libvirt gets support for queyring accels we might
consider deprecation again.

Best Regards,
Roman

