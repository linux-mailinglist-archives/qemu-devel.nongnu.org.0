Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F277D1F5867
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Jun 2020 17:55:32 +0200 (CEST)
Received: from localhost ([::1]:58956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jj34e-0003C4-04
	for lists+qemu-devel@lfdr.de; Wed, 10 Jun 2020 11:55:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54700)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jj33F-0002Ay-5H
 for qemu-devel@nongnu.org; Wed, 10 Jun 2020 11:54:05 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:47953
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jj33E-0004XP-8s
 for qemu-devel@nongnu.org; Wed, 10 Jun 2020 11:54:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591804443;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=JHTFd9zxD5G4owmyIM9iXokzJIl/Sr3zoAQZhB99UB0=;
 b=UQTXrkmDncQNzb8UWjj/Ch/vIs+H1kAYoOYw07KfEKNPwLFYZFdKTBVQG4BNmrHm6ExmEz
 SR4KdS+cxybHVz9irkiqHHhCm4X4hiD0XOJPZtznTXXqcKz4JJHc7VabWFtKlrGFQbA2kT
 aw9ovqf4ldWg+TxgFDkShugvNUygNyM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-454-t2LtMymZNuCn8HZax5gjkw-1; Wed, 10 Jun 2020 11:54:00 -0400
X-MC-Unique: t2LtMymZNuCn8HZax5gjkw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 71A1BDB72;
 Wed, 10 Jun 2020 15:53:57 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-113-50.ams2.redhat.com
 [10.36.113.50])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3FE042DE69;
 Wed, 10 Jun 2020 15:53:47 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 59FA416E16; Wed, 10 Jun 2020 17:53:46 +0200 (CEST)
Date: Wed, 10 Jun 2020 17:53:46 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH v7 0/9] acpi: i386 tweaks
Message-ID: <20200610155346.qwqwxr6v22xi4wn5@sirius.home.kraxel.org>
References: <20200610094131.13346-1-kraxel@redhat.com>
 <20200610134002.6461b40a@redhat.com>
 <20200610105405-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20200610105405-mutt-send-email-mst@kernel.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=205.139.110.61; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/09 23:51:15
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Laurent Vivier <lvivier@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-block@nongnu.org, qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, John Snow <jsnow@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jun 10, 2020 at 10:54:26AM -0400, Michael S. Tsirkin wrote:
> On Wed, Jun 10, 2020 at 01:40:02PM +0200, Igor Mammedov wrote:
> > On Wed, 10 Jun 2020 11:41:22 +0200
> > Gerd Hoffmann <kraxel@redhat.com> wrote:
> > 
> > > First batch of microvm patches, some generic acpi stuff.
> > > Split the acpi-build.c monster, specifically split the
> > > pc and q35 and pci bits into a separate file which we
> > > can skip building at some point in the future.
> > > 
> > It looks like series is missing patch to whitelist changed ACPI tables in
> > bios-table-test.
> 
> Right. Does it pass make check?

No, but after 'git cherry-pick 9b20a3365d73dad4ad144eab9c5827dbbb2e9f21' it does.

> > Do we already have test case for microvm in bios-table-test,
> > if not it's probably time to add it.
> 
> Separately :)

Especially as this series is just preparing cleanups and doesn't
actually add acpi support to microvm yet.

But, yes, adding a testcase sounds useful.

take care,
  Gerd


