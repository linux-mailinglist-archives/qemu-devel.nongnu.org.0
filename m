Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB3074294A4
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Oct 2021 18:30:40 +0200 (CEST)
Received: from localhost ([::1]:57502 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mZyCF-0007GV-OZ
	for lists+qemu-devel@lfdr.de; Mon, 11 Oct 2021 12:30:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42364)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mZyA0-0006T3-1r
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 12:28:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55820)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mZy9x-00079z-Mb
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 12:28:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633969695;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=uGeJhuSE46QJXU61VSRTgG06oO3DADoJC0nDtfbHxzE=;
 b=FIuT9JuLOSvVZ+JcaXHyXKoocn4z7FD+aQ/tPhvVhQxinL2zglhdMDxcOmgGjfjiITMBzQ
 dDjkugaUK5zSy6mMS0vnV0nihENBJgvnx9TxqO8e1YNrif3wVGJ/2ywi4YNcXrhPaQ7L6I
 JDX3WBDsNLYqGrckECgbcLOT1zLQxek=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-34-bHvKQLEJPo2tKfb25gIhcQ-1; Mon, 11 Oct 2021 12:28:12 -0400
X-MC-Unique: bHvKQLEJPo2tKfb25gIhcQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8D3B71117DCF;
 Mon, 11 Oct 2021 16:27:12 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.193.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 45CD35F4E0;
 Mon, 11 Oct 2021 16:27:12 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 10A07180009A; Mon, 11 Oct 2021 18:27:10 +0200 (CEST)
Date: Mon, 11 Oct 2021 18:27:10 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: Moving QEMU downloads to GitLab Releases?
Message-ID: <20211011162710.kg6hjfp35ld7khcj@sirius.home.kraxel.org>
References: <YVW+ZGmIs+repvj4@stefanha-x1.localdomain>
 <769a612c-9a78-6fc8-0893-43ce2c173957@amsat.org>
 <YVrC4niegCWq+1kM@stefanha-x1.localdomain>
 <163337608907.347510.4401699281486806089@amd.com>
 <YVxTHAMCVncGvbFi@stefanha-x1.localdomain>
 <20211011072130.i3vemilk23o4djdz@sirius.home.kraxel.org>
 <YWQY1CQ/qUsMBnoD@stefanha-x1.localdomain>
 <CANCZdfpsHTr0=Lc8TB0L846ZbfjFS0sNDyna_74HQaXdcuWSYw@mail.gmail.com>
 <YWRcOYbxH6ygs/tj@stefanha-x1.localdomain>
MIME-Version: 1.0
In-Reply-To: <YWRcOYbxH6ygs/tj@stefanha-x1.localdomain>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
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
Cc: Thomas Huth <thuth@redhat.com>, Daniel Berrange <berrange@redhat.com>,
 Michael Roth <michael.roth@amd.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  Hi,

> > So while I'm all for making things a little more independent,
> > let's not do it in a way that makes life difficult for downstreams.
> > There are more there than just a couple of big distro builders.
> 
> I think this is fine. Firmware blobs aren't needed to build QEMU, only
> to run the system emulator.

Yep.  But doing firmware builds outside gitlab should be easy, so we
should probably keep the core logic in a script / Makefile / whatever
(simliar to todays roms/Makefile), then simply invoke that from gitlab
ci yaml files.

take care,
  Gerd


