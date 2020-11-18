Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CCC02B7EC2
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Nov 2020 15:01:58 +0100 (CET)
Received: from localhost ([::1]:60558 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfO20-0001s6-Rq
	for lists+qemu-devel@lfdr.de; Wed, 18 Nov 2020 09:01:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <r.bolshakov@yadro.com>)
 id 1kfO0w-0001NW-Sk
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 09:00:51 -0500
Received: from mta-02.yadro.com ([89.207.88.252]:53660 helo=mta-01.yadro.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <r.bolshakov@yadro.com>)
 id 1kfO0u-0006sL-A0
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 09:00:49 -0500
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id EED4E41316;
 Wed, 18 Nov 2020 14:00:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 in-reply-to:content-disposition:content-type:content-type
 :mime-version:references:message-id:subject:subject:from:from
 :date:date:received:received:received; s=mta-01; t=1605708045;
 x=1607522446; bh=Hr6IrfnB3NKHpaS+Vq1/sgHA8N9zIrNqIaNF/DeTheo=; b=
 F/QrwkBGVFpuHupBcYF86X2QUBkji0aKefyKhAio9qABquSzx6B0jx/0KIti64ME
 JAtg6mJiDSCg9ow+StMKAwCqYYxkVBAgC3YOI6Nx/qPef6/B9TRGP6dNglPw4fBV
 0q2+sl47Xk8pTqpapTCgKlVUOIyYM13p8eiwAF9iF9c=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YsugP2MA9rqk; Wed, 18 Nov 2020 17:00:45 +0300 (MSK)
Received: from T-EXCH-03.corp.yadro.com (t-exch-03.corp.yadro.com
 [172.17.100.103])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 6F82C4127E;
 Wed, 18 Nov 2020 17:00:44 +0300 (MSK)
Received: from localhost (172.17.204.212) by T-EXCH-03.corp.yadro.com
 (172.17.100.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Wed, 18
 Nov 2020 17:00:44 +0300
Date: Wed, 18 Nov 2020 17:00:43 +0300
From: Roman Bolshakov <r.bolshakov@yadro.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH for-6.0 1/6] qapi: Add query-accel command
Message-ID: <20201118140043.GA81070@SPB-NB-133.local>
References: <20201116131011.26607-1-r.bolshakov@yadro.com>
 <20201116131011.26607-2-r.bolshakov@yadro.com>
 <2d934855-ad11-9f61-28a1-7c0a35347a66@redhat.com>
 <20201116211352.GC1235237@habkost.net>
 <87mtzgbc29.fsf@dusky.pond.sub.org>
 <20201118011917.GB10041@SPB-NB-133.local>
 <87ft57oycu.fsf@dusky.pond.sub.org>
 <b9307f87-5350-21a6-68dd-d4efbae5e502@redhat.com>
 <87r1oqlsmy.fsf@dusky.pond.sub.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <87r1oqlsmy.fsf@dusky.pond.sub.org>
X-Originating-IP: [172.17.204.212]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
 T-EXCH-03.corp.yadro.com (172.17.100.103)
Received-SPF: pass client-ip=89.207.88.252; envelope-from=r.bolshakov@yadro.com;
 helo=mta-01.yadro.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/18 09:00:46
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
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
Cc: Kevin Wolf <kwolf@redhat.com>, "Daniel P. Berrange" <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Nov 18, 2020 at 02:08:21PM +0100, Markus Armbruster wrote:
> Paolo Bonzini <pbonzini@redhat.com> writes:
> > On 18/11/20 09:36, Markus Armbruster wrote:
> >> While figuring this out, I noticed that the TYPE_ACCEL instance we
> >> create doesn't get its parent set.  It's therefore not in the QOM
> >> composition tree, and inaccessible with qom-get.  Paolo, is this as it
> >> should be?
> >
> > It should be added, I agree, perhaps as /machine/accel.
> 
> Makes sense.
> 

I also tried to find it there when traversed QOM :)

So, I'll then add it instead of ad-hoc queries in v2?

That'd allow us to use standard QOM queries to determine all built-in
accelerators and query actually enabled one.

Thanks,
Roman

