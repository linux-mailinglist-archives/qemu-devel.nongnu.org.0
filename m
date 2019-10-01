Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 29A2CC34F6
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Oct 2019 14:57:26 +0200 (CEST)
Received: from localhost ([::1]:41590 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iFHiX-00053z-6z
	for lists+qemu-devel@lfdr.de; Tue, 01 Oct 2019 08:57:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47623)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <berrange@redhat.com>) id 1iFHhR-0004YP-6e
 for qemu-devel@nongnu.org; Tue, 01 Oct 2019 08:56:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <berrange@redhat.com>) id 1iFHhP-000267-0Z
 for qemu-devel@nongnu.org; Tue, 01 Oct 2019 08:56:15 -0400
Received: from mx1.redhat.com ([209.132.183.28]:60996)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <berrange@redhat.com>) id 1iFHhO-00025I-RW
 for qemu-devel@nongnu.org; Tue, 01 Oct 2019 08:56:14 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 1D0F2307D931;
 Tue,  1 Oct 2019 12:56:14 +0000 (UTC)
Received: from redhat.com (ovpn-112-70.ams2.redhat.com [10.36.112.70])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5681E5D9C9;
 Tue,  1 Oct 2019 12:56:13 +0000 (UTC)
Date: Tue, 1 Oct 2019 13:56:10 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Toe Dev <devtoe82@gmail.com>
Subject: Re: header not included but used in vl.c
Message-ID: <20191001125610.GN26133@redhat.com>
References: <CAN+O=TJkZEqHs50gYZgp3n0AeV1h6Wd8UYo+kxss5LUVJqxULQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAN+O=TJkZEqHs50gYZgp3n0AeV1h6Wd8UYo+kxss5LUVJqxULQ@mail.gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.48]); Tue, 01 Oct 2019 12:56:14 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
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

On Tue, Oct 01, 2019 at 03:12:17PM +0300, Toe Dev wrote:
> Hello,
>  does it have a reason why the file vl.c lacks reference
>  #include "qemu/module.h" ?
>  but still uses the defines include their(for example the enum value:
> MODULE_INIT_OPTS)?

qemu/module.h is included by qom/object.h which is included by many
many things in QEMU, so vl.c gets module.h indirectly which is fine.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|

