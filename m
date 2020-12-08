Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B14502D256F
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 09:13:58 +0100 (CET)
Received: from localhost ([::1]:52916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmY8D-0007rB-8C
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 03:13:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57156)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <r.bolshakov@yadro.com>)
 id 1kmY5m-00079a-TY
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 03:11:26 -0500
Received: from mta-02.yadro.com ([89.207.88.252]:47076 helo=mta-01.yadro.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <r.bolshakov@yadro.com>)
 id 1kmY5j-00079Z-8w
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 03:11:26 -0500
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 030FB412DD;
 Tue,  8 Dec 2020 08:11:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 in-reply-to:content-disposition:content-type:content-type
 :mime-version:references:message-id:subject:subject:from:from
 :date:date:received:received:received; s=mta-01; t=1607415079;
 x=1609229480; bh=T3g2nlmMPDzNMlArYe79OmHTllProz0SUTaWZJlmc6M=; b=
 LgiNUNVUlrB9eAxLbpYbOmgnsTjoNHUkWMzb88w677g75QTyhdWtsHMNaLFA05m7
 wE/ToOqCP3CA4SXnnE8OiTF7ek0JIkj/Z/s0ylCA4rNfWaVBnJzyjadPbTEKbIwO
 en42z7p7eloPbCh4F4eikqPJwPT2Usq3iVVshThAAj4=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QT2BXZqHOGke; Tue,  8 Dec 2020 11:11:19 +0300 (MSK)
Received: from T-EXCH-03.corp.yadro.com (t-exch-03.corp.yadro.com
 [172.17.100.103])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 2836541254;
 Tue,  8 Dec 2020 11:11:18 +0300 (MSK)
Received: from localhost (172.17.204.212) by T-EXCH-03.corp.yadro.com
 (172.17.100.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Tue, 8 Dec
 2020 11:11:17 +0300
Date: Tue, 8 Dec 2020 11:11:50 +0300
From: Roman Bolshakov <r.bolshakov@yadro.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Subject: Re: [PATCH for-6.0] accel: Wire accel to /machine
Message-ID: <X881RoBRgh026MK5@SPB-NB-133.local>
References: <20201207084621.23876-1-r.bolshakov@yadro.com>
 <20201207173849.GC1289986@habkost.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20201207173849.GC1289986@habkost.net>
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Krempa <pkrempa@redhat.com>,
 libvir-list@redhat.com,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Dec 07, 2020 at 12:38:49PM -0500, Eduardo Habkost wrote:
> On Mon, Dec 07, 2020 at 11:46:22AM +0300, Roman Bolshakov wrote:
> > There's no generic way to query current accel and its properties via QOM
> > because there's no link between an accel and current machine.
> > 
> > The change adds the link, i.e. if HVF is enabled the following will be
> > available in QOM:
> > 
> >   (qemu) qom-get /machine/accel type
> >   "hvf-accel"
> > 
> > Suggested-by: Markus Armbruster <armbru@redhat.com>
> > Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
> > Signed-off-by: Roman Bolshakov <r.bolshakov@yadro.com>
> > ---
> > 
> > Hi,
> > 
> > this is a follow up patch that deprecates earlier series [1].
> > 
> 
> Is there a reference to the reasoning for dropping the earlier
> approach?  Your previous approach seems preferable.
> 

Okay I wasn't sure about that :) It's clear now from your and Daniel's
response that a documented QMP method is preferable for public API.

> but we need a commit message that doesn't make people think the
> `qom-get` command above will always work.
> 

How about the one below:

accel: Wire accel to /machine

An accel is a property of a machine but it's not reflected in QOM. An
ownership between machine and accel is also not expressed.

The change adds the link, i.e. if HVF is enabled the following will be
available in QOM:

  (qemu) qom-get /machine/accel type
  "hvf-accel"

Note that management applications shouldn't rely on the type as it may
change in future at QEMU's discretion.

---
Regards,
Roman

