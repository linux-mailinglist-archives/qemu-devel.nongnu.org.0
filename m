Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 749E9206D07
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Jun 2020 08:51:06 +0200 (CEST)
Received: from localhost ([::1]:35418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jnzFR-0006A0-4D
	for lists+qemu-devel@lfdr.de; Wed, 24 Jun 2020 02:51:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50940)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jnzER-0004yK-2J
 for qemu-devel@nongnu.org; Wed, 24 Jun 2020 02:50:03 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:49487
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jnzEO-0005wE-EH
 for qemu-devel@nongnu.org; Wed, 24 Jun 2020 02:50:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592981398;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=O/+CtU2RzG4LoUU919jvO+d4Clxl2Xpt+FQRojcmM7w=;
 b=B+ApQIASIi4TFVfNJHAPG1VJLHGn1vGmTg7RrHIy7Jxo4hOgkXxN9fEaPD2zmUPQwUQjUt
 Fx9If0EVBVw2xldej4mX/yLIt7726z80YjHB5pUsKQX29VeZTUyBvFHvkArNc9RjB1yZDy
 4BQykRu2BIrlBK8gwGYSKV9/yQX8oyk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-165-LivSqPALOzuY5UcAyknhtg-1; Wed, 24 Jun 2020 02:49:56 -0400
X-MC-Unique: LivSqPALOzuY5UcAyknhtg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D9F6E1902EA1
 for <qemu-devel@nongnu.org>; Wed, 24 Jun 2020 06:49:55 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-67.ams2.redhat.com
 [10.36.112.67])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8C7C71A913;
 Wed, 24 Jun 2020 06:49:55 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 6140917477; Wed, 24 Jun 2020 08:49:54 +0200 (CEST)
Date: Wed, 24 Jun 2020 08:49:54 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: -enablefips
Message-ID: <20200624064954.jmkqonjbqfhso5dr@sirius.home.kraxel.org>
References: <7816f22f-2872-06ef-f7ef-40add5a34040@redhat.com>
MIME-Version: 1.0
In-Reply-To: <7816f22f-2872-06ef-f7ef-40add5a34040@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=207.211.31.120; envelope-from=kraxel@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/24 02:33:25
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: "Daniel P. Berrange" <berrange@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jun 23, 2020 at 11:51:09PM -0400, John Snow wrote:
> I never knew what this option did, but the answer is ... strange!
> 
> It's only defined for linux, in os-posix.c. When called, it calls
> fips_set_state(true), located in osdep.c.
> 
> This will read /proc/sys/crypto/fips_enabled and set the static global
> 'fips_enabled' to true if this setting is on.

IIRC the idea is to have a global switch to enable fips compilance for
the whole distro.  RH specific.  rhel-7 kernel has it.  rhel-8 kernel
too, so it probably isn't obsolete.  Not present in mainline kernels.

I'm wondering what the point of the -enablefips switch is.  Shouldn't
qemu check /proc/sys/crypto/fips_enabled unconditionally instead?

> (Tangent: what does *this* setting actually control? Should QEMU
> meaningfully change its behavior when it's set?)

fips is a security policy ...

> This static global is exposed via the getter fips_get_state(). This
> function is called only by vnc.c, and appears to disable the use of the
> password option for -vnc.

... yes, "no passwords" is one of the rules.  There are probably more.

> (If we really do want to keep it, it should probably go under -global
> somewhere instead to help reduce flag clutter, but we'd need to have a
> chat about what fips compliance means for literally every other spot in
> QEMU that is capable of using or receiving a cleartext password.)

Yep.  IIRC for spice this is handled in libspice-server.  We need to
look at blockdev encryption I guess.  Any other places where qemu uses
passwords directly?  I think we don't have to worry about indirect usage
(sasl).

take care,
  Gerd


