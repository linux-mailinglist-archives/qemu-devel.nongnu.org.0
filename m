Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42E58B8072
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Sep 2019 19:52:45 +0200 (CEST)
Received: from localhost ([::1]:47312 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iB0bk-0006yU-4p
	for lists+qemu-devel@lfdr.de; Thu, 19 Sep 2019 13:52:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51719)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <berrange@redhat.com>) id 1iB0Ey-0008Gl-NC
 for qemu-devel@nongnu.org; Thu, 19 Sep 2019 13:29:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <berrange@redhat.com>) id 1iB0Ex-0004vO-0j
 for qemu-devel@nongnu.org; Thu, 19 Sep 2019 13:29:12 -0400
Received: from mx1.redhat.com ([209.132.183.28]:58052)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <berrange@redhat.com>) id 1iB0Ew-0004uw-Rj
 for qemu-devel@nongnu.org; Thu, 19 Sep 2019 13:29:10 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id DD8ED307D923;
 Thu, 19 Sep 2019 17:29:09 +0000 (UTC)
Received: from redhat.com (ovpn-112-51.ams2.redhat.com [10.36.112.51])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DF2C119C7F;
 Thu, 19 Sep 2019 17:29:08 +0000 (UTC)
Date: Thu, 19 Sep 2019 18:29:05 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Martin Schrodt <martin@schrodt.org>
Subject: Re: Will the qemu-devel prefix in the mails come back?
Message-ID: <20190919172905.GC22853@redhat.com>
References: <9c6bf92a-0869-cf5d-222b-305e55393ebb@schrodt.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <9c6bf92a-0869-cf5d-222b-305e55393ebb@schrodt.org>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.48]); Thu, 19 Sep 2019 17:29:09 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Sep 19, 2019 at 07:04:15PM +0200, Martin Schrodt wrote:
> Does anybody know?

Unfortunately, no, it won't.

Historically mailman has been configured to munge mails it
delivers, adding this subject prefix, converting HTML to
plain text. This causes problems with DMARC policy meaning
it also has to then rewrite the sender address, which means
we get bad patches merged with authors like

  Author: Justin Terry (VM) via Qemu-devel <qemu-devel@nongnu.org>

There's no answer to this problem that makes everyone happy,
but overall we came to the conclusion that the best strategy
is to stop modifying messages at all. You can read more
detailed background info in this thread:

  https://lists.gnu.org/archive/html/qemu-devel/2019-09/msg00416.html

> My mail filter would appreciate :)

You'll need to set a filter based on the "List-id" mail header
now.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|

