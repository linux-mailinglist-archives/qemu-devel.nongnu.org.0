Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6583D1D2AB6
	for <lists+qemu-devel@lfdr.de>; Thu, 14 May 2020 10:55:23 +0200 (CEST)
Received: from localhost ([::1]:50994 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jZ9eE-00076f-Gt
	for lists+qemu-devel@lfdr.de; Thu, 14 May 2020 04:55:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55430)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jZ9dK-0006PG-3E
 for qemu-devel@nongnu.org; Thu, 14 May 2020 04:54:26 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:45606
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jZ9dI-0006OF-Q7
 for qemu-devel@nongnu.org; Thu, 14 May 2020 04:54:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589446462;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=kJs2BZ2poQKeinA0V+nSk2sTJf0EiVw7dLzV0GZ885A=;
 b=fHebMr+qlWRtRjLK0Jq+BYa4PVLuHqsa6SrE6y2YuGTWf/cWXec46nHka5MPD7qPiXpQn3
 KmRh9MPwjMUtf33blcxAcpHQVWZatR9H8nt+LHyarnODigugHFvtXsV/t1mr34atDCsZTj
 TF65Vg94/xPS9DbGSEcDBAGqoFZs5KA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-272-huR84ApRN6i6II7mhG6tSA-1; Thu, 14 May 2020 04:54:20 -0400
X-MC-Unique: huR84ApRN6i6II7mhG6tSA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ED3E980183C;
 Thu, 14 May 2020 08:54:19 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-115-145.ams2.redhat.com
 [10.36.115.145])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 936D779B6;
 Thu, 14 May 2020 08:54:19 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id ABA2717444; Thu, 14 May 2020 10:54:18 +0200 (CEST)
Date: Thu, 14 May 2020 10:54:18 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: proposal: deprecate -readconfig/-writeconfig
Message-ID: <20200514085418.hmglfmz5rn7lsqe4@sirius.home.kraxel.org>
References: <7599153e-89a2-9a86-16ad-4a3c6a107b18@redhat.com>
MIME-Version: 1.0
In-Reply-To: <7599153e-89a2-9a86-16ad-4a3c6a107b18@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=205.139.110.61; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/13 22:25:42
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Peter Maydell <peter.maydell@linaro.org>, John Snow <jsnow@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, May 14, 2020 at 10:09:21AM +0200, Paolo Bonzini wrote:
> IMHO configuration files are in general a failed experiment.  In
> practice, they do not add much value over just a shell script because
> they don't allow configuring all QEMU options, they are very much fixed
> (by their nature).  I think it's more or less agreed that they are not
> solving any problem for higher-level management stacks as well; those
> would prefer to configure the VM via QMP or another API.
> 
> So, any objections to deprecating -readconfig and -writeconfig?

-writeconfig surely can go away, it never reached the point where it
could write out an configuration which is actually complete.

-readconfig is a bit more tricky, it's actually useful.  I'm using it
sometimes.  Also we have docs/config/ with a bunch of files you can
pass to -readconfig.

I can see that it'll stand in the way if we want move away from QemuOpts
to something else (say qom-based yaml/json config files), so I wouldn't
veto deprecation, but I'd prefer it not being actually dropped until the
replacement is ready and the stuff in docs/config/ being converted to
the new scheme.

my two cents,
  Gerd


