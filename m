Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E707D428796
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Oct 2021 09:23:03 +0200 (CEST)
Received: from localhost ([::1]:42676 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mZpeI-0007mp-GF
	for lists+qemu-devel@lfdr.de; Mon, 11 Oct 2021 03:23:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38182)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mZpd2-000768-Vx
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 03:21:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35841)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mZpcz-0006dY-4Z
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 03:21:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633936899;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=haOhTD444/Ft2rRWDKH1rJO8mzJe9iFJVI5GcB69AzY=;
 b=VRIwAdbfQH1tNlVUx2dwFoO6Yp0RaJtD6dpAVwow1mD0QLhK0NZHzBQ93qpn85cAAEhlTo
 s0zpiWFdKEb7e40kVqJDK9xBXlafO+4IKKi53V409nDtCYAEezkNOGTYb6ZCSi6KNRaRmb
 AmU9OGivYSczL2EMi0ojOytoSAGqm2I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-364-MtvfyZOnPkSm8DRAcjIMTQ-1; Mon, 11 Oct 2021 03:21:35 -0400
X-MC-Unique: MtvfyZOnPkSm8DRAcjIMTQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F2090362F8;
 Mon, 11 Oct 2021 07:21:34 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.193.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CDADD5D6CF;
 Mon, 11 Oct 2021 07:21:31 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 1B9E118009D4; Mon, 11 Oct 2021 09:21:30 +0200 (CEST)
Date: Mon, 11 Oct 2021 09:21:30 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: Moving QEMU downloads to GitLab Releases?
Message-ID: <20211011072130.i3vemilk23o4djdz@sirius.home.kraxel.org>
References: <YVW+ZGmIs+repvj4@stefanha-x1.localdomain>
 <769a612c-9a78-6fc8-0893-43ce2c173957@amsat.org>
 <YVrC4niegCWq+1kM@stefanha-x1.localdomain>
 <163337608907.347510.4401699281486806089@amd.com>
 <YVxTHAMCVncGvbFi@stefanha-x1.localdomain>
MIME-Version: 1.0
In-Reply-To: <YVxTHAMCVncGvbFi@stefanha-x1.localdomain>
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
 qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  Hi,

> > I guess the main question is who is using the ROM/BIOS sources in the
> > tarballs, and would this 2-step process work for those users? If there
> > are distros relying on them then maybe there are some more logistics to
> > consider since the make-release downloads are both time-consuming and
> > prone to network errors/stalls since it relies on the availability of a
> > good number of different hosts.
> 
> Great, maybe Gerd can comment on splitting out firmware.

I think the binaries are mostly a convenience feature for developers.
Distros typically build from source anyway, and typically they build
from upstream source instead of qemu submodule.

The idea to split them out to a separate repo is exists for quite a
while.  I have an old qemu-firmware repo laying around on my disk, which
basically moves roms/ + submodules and the binaries built from it over.

I think with the switch to gitlab it doesn't make sense any more to
commit pre-built firmware binaries to a git repo.  Instead we should
build the firmware in gitlab ci, i.e. effectively move the build rules
we have right now in roms/Makefile to .gitlab-ci.d/, then publish the
firmware binaries as build artifacts or gitlab pages.

When done just remove the pre-build binaries from git and add a helper
script to fetch firmware binaries from gitlab instead.

> QEMU mirrors firmware sources on GitLab too. We're able to provide the
> same level of download availability on our mirror firmware repos as for
> the main qemu.git repo.

I think enabling CI for the firmware mirrors should work given that it
is possible to specify a custom CI/CD configuration file, i.e. use
something like

    /qemu-project/qemu/.gitlab-ci.d/firmware/seabios.yml

or

    /qemu-project/qemu-firmware/seabios.yml

as config file for the 

    /qemu-project/seabios/

mirror.  Then we can publish binaries using gitlab pages at

    https://qemu-project.gitlab.io/seabios/

That way we also don't need the roms/ submodules any more, i.e. we
can remove both sources and binaries for the firmware from the
release tarballs.

take care,
  Gerd


