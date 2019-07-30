Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 63AFB7B49A
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Jul 2019 22:56:38 +0200 (CEST)
Received: from localhost ([::1]:36392 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hsZAj-000101-3p
	for lists+qemu-devel@lfdr.de; Tue, 30 Jul 2019 16:56:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57096)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <ehabkost@redhat.com>) id 1hsZAE-0000bN-84
 for qemu-devel@nongnu.org; Tue, 30 Jul 2019 16:56:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <ehabkost@redhat.com>) id 1hsZAD-0007Rf-9G
 for qemu-devel@nongnu.org; Tue, 30 Jul 2019 16:56:06 -0400
Received: from mx1.redhat.com ([209.132.183.28]:33142)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <ehabkost@redhat.com>) id 1hsZAD-0007NT-2m
 for qemu-devel@nongnu.org; Tue, 30 Jul 2019 16:56:05 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 5A5F7308FC4B;
 Tue, 30 Jul 2019 20:55:57 +0000 (UTC)
Received: from localhost (ovpn-116-22.gru2.redhat.com [10.97.116.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D986E5D6A7;
 Tue, 30 Jul 2019 20:55:56 +0000 (UTC)
Date: Tue, 30 Jul 2019 17:55:54 -0300
From: Eduardo Habkost <ehabkost@redhat.com>
To: Eric Blake <eblake@redhat.com>
Message-ID: <20190730205554.GT4313@habkost.net>
References: <20190726120542.9894-1-armbru@redhat.com>
 <20190726120542.9894-24-armbru@redhat.com>
 <20190729194414.GG4313@habkost.net>
 <87d0hreqh3.fsf_-_@dusky.pond.sub.org>
 <8bea0201-f796-d682-22e6-069985b45523@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8bea0201-f796-d682-22e6-069985b45523@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.43]); Tue, 30 Jul 2019 20:55:57 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] When to use qemu/typedefs.h (was: [PATCH 23/28]
 numa: Don't include hw/boards.h into sysemu/numa.h)
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <rth@twiddle.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jul 30, 2019 at 08:15:12AM -0500, Eric Blake wrote:
> How hard would it be to compute which typedefs already in
> qemu/typedefs.h are necessary to avoid cyclic inclusion?

I don't think it's just about cyclic inclusion.  It's also about
avoiding dependencies between headers just because of a single
typedef, like numa.h including hw/boards.h just because of the
CPUArchId typedef.

-- 
Eduardo

