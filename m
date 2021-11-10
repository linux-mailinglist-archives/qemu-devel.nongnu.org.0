Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 83B0044CB9A
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Nov 2021 23:08:17 +0100 (CET)
Received: from localhost ([::1]:38468 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkvlQ-0007SF-8j
	for lists+qemu-devel@lfdr.de; Wed, 10 Nov 2021 17:08:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46538)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1mkvjx-0006MB-Iw
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 17:06:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:25864)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1mkvju-0000hx-9i
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 17:06:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636582000;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZB8enz9LI4/KJ8LpLCq66hdNo6gP/ctW2YC5VFWy3hk=;
 b=g9kIn8g3kHuTJt+cRJFYmiyd8dHMFptDhVc2VRo9V0lCJO2CNl/zyQs8Zx6Z/81or5f3lY
 Pbk1ayjCzgpvg6ur6b2uNnJlOR+PkLZevSXzCGRDNgL1glKaTBfkHJmv6zg5riGNNtqnay
 OyYvSBkkGxM95ixw2b/SxJbzlBXS6kU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-109-pkFadyoRPu6XHQtZt12TcA-1; Wed, 10 Nov 2021 17:06:37 -0500
X-MC-Unique: pkFadyoRPu6XHQtZt12TcA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 31DC615721;
 Wed, 10 Nov 2021 22:06:36 +0000 (UTC)
Received: from localhost (unknown [10.22.16.46])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BC0B660843;
 Wed, 10 Nov 2021 22:06:32 +0000 (UTC)
Date: Wed, 10 Nov 2021 17:06:32 -0500
From: Eduardo Habkost <ehabkost@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH v3 3/3] hw/i386: expose a "smbios-entry-point-type" PC
 machine property
Message-ID: <20211110220632.xaazf2s647r63qm7@habkost.net>
References: <20211026151100.1691925-1-ehabkost@redhat.com>
 <20211026151100.1691925-4-ehabkost@redhat.com>
 <a2618cf2-a2a6-53f6-a7f0-8bb3a72d32e9@redhat.com>
 <20211102072349-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20211102072349-mutt-send-email-mst@kernel.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 Michael Roth <mdroth@linux.vnet.ibm.com>, Eric Blake <eblake@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Igor Mammedov <imammedo@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Nov 02, 2021 at 07:25:25AM -0400, Michael S. Tsirkin wrote:
> On Tue, Nov 02, 2021 at 09:51:35AM +0100, Philippe Mathieu-Daudé wrote:
> > On 10/26/21 17:11, Eduardo Habkost wrote:
> > > The i440fx and Q35 machine types are both hardcoded to use the
> > > legacy SMBIOS 2.1 (32-bit) entry point. This is a sensible
> > > conservative choice because SeaBIOS only supports SMBIOS 2.1
> > > 
> > > EDK2, however, can also support SMBIOS 3.0 (64-bit) entry points,
> > > and QEMU already uses this on the ARM virt machine type.
> > > 
> > > This adds a property to allow the choice of SMBIOS entry point
> > > versions For example to opt in to 64-bit SMBIOS entry point:
> > > 
> > >    $QEMU -machine q35,smbios-entry-point-type=64
> > 
> > It would be nice to have a test for this...
> > 
> > Otherwise,
> > Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> 
> Can we update seabios and the switch the default?
> Maybe just for q35?
> Or are there more considerations?

We can switch the default, but SeaBIOS maintainers won't include
the SMBIOS 3.0 code I had submitted[1] until this is supported by
QEMU.

After we patch SeaBIOS to support SMBIOS 3.0 and update the
SeaBIOS binaries in the QEMU tree, we can switch the default in
Q35 and/or i440fx to SMBIOS 3.0.

[1] https://www.mail-archive.com/seabios@seabios.org/msg12415.html
    https://www.mail-archive.com/seabios@seabios.org/msg12438.html

> 
> 
> > > Based on a patch submitted by Daniel Berrangé.
> > > 
> > > Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> > > Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
> > > ---
> > > This is patch was previously submitted at:
> > > https://lore.kernel.org/qemu-devel/20200908165438.1008942-6-berrange@redhat.com
> > > 
> > > Changes from v2:
> > > * Rename "smbios-ep" to "smbios-entry-point-type"
> > > 
> > > Changes from v1:
> > > * Include qapi-visit-smbios.h instead of qapi-visit-machine.h
> > > * Commit message fix: s/smbios_ep/smbios-ep/
> > > ---
> > >  include/hw/i386/pc.h |  4 ++++
> > >  hw/i386/pc.c         | 26 ++++++++++++++++++++++++++
> > >  hw/i386/pc_piix.c    |  2 +-
> > >  hw/i386/pc_q35.c     |  2 +-
> > >  4 files changed, 32 insertions(+), 2 deletions(-)
> 

-- 
Eduardo


