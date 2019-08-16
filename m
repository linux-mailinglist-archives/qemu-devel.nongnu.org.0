Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E52928FD4D
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Aug 2019 10:12:13 +0200 (CEST)
Received: from localhost ([::1]:51438 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hyXLI-000504-SN
	for lists+qemu-devel@lfdr.de; Fri, 16 Aug 2019 04:12:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43038)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eskultet@redhat.com>) id 1hyWzZ-000834-F7
 for qemu-devel@nongnu.org; Fri, 16 Aug 2019 03:49:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eskultet@redhat.com>) id 1hyWzV-0007mK-Bz
 for qemu-devel@nongnu.org; Fri, 16 Aug 2019 03:49:45 -0400
Received: from mx1.redhat.com ([209.132.183.28]:47256)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eskultet@redhat.com>) id 1hyWzV-0007lx-6j
 for qemu-devel@nongnu.org; Fri, 16 Aug 2019 03:49:41 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id DC36A3CA17;
 Fri, 16 Aug 2019 07:49:39 +0000 (UTC)
Received: from beluga.usersys.redhat.com (unknown [10.43.2.166])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5880A3786;
 Fri, 16 Aug 2019 07:49:35 +0000 (UTC)
Date: Fri, 16 Aug 2019 09:49:32 +0200
From: Erik Skultety <eskultet@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Message-ID: <20190816074932.GK13569@beluga.usersys.redhat.com>
References: <20190815183803.13346-1-ehabkost@redhat.com>
 <20190815183803.13346-4-ehabkost@redhat.com>
 <87pnl5sks3.fsf@dusky.pond.sub.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <87pnl5sks3.fsf@dusky.pond.sub.org>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.39]); Fri, 16 Aug 2019 07:49:39 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH 3/3] pc: Don't make CPU properties
 mandatory unless necessary
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
Cc: Peter Krempa <pkrempa@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Like Xu <like.xu@linux.intel.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 qemu-devel@nongnu.org, Igor Mammedov <imammedo@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Aug 16, 2019 at 08:10:20AM +0200, Markus Armbruster wrote:
> Eduardo Habkost <ehabkost@redhat.com> writes:
>
> > We have this issue reported when using libvirt to hotplug CPUs:
> > https://bugzilla.redhat.com/show_bug.cgi?id=1741451
> >
> > Basically, libvirt is not copying die-id from
> > query-hotpluggable-cpus, but die-id is now mandatory.
>
> Uh-oh, "is now mandatory": making an optional property mandatory is an
> incompatible change.  When did we do that?  Commit hash, please.
>
> [...]
>

I don't even see it as being optional ever - the property wasn't even
recognized before commit 176d2cda0de introduced it as mandatory.

Regards,
Erik

