Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E39D9ABB1D
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Sep 2019 16:38:05 +0200 (CEST)
Received: from localhost ([::1]:57050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i6FNE-0005Fn-QL
	for lists+qemu-devel@lfdr.de; Fri, 06 Sep 2019 10:38:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55254)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <berrange@redhat.com>) id 1i6FM9-0004ey-4k
 for qemu-devel@nongnu.org; Fri, 06 Sep 2019 10:36:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <berrange@redhat.com>) id 1i6FM6-000207-P0
 for qemu-devel@nongnu.org; Fri, 06 Sep 2019 10:36:55 -0400
Received: from mx1.redhat.com ([209.132.183.28]:48392)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <berrange@redhat.com>)
 id 1i6FM6-0001zD-Ip; Fri, 06 Sep 2019 10:36:54 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 9886585541;
 Fri,  6 Sep 2019 14:36:53 +0000 (UTC)
Received: from redhat.com (ovpn-112-50.ams2.redhat.com [10.36.112.50])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D62A4600C4;
 Fri,  6 Sep 2019 14:36:51 +0000 (UTC)
Date: Fri, 6 Sep 2019 15:36:48 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Stefan Hajnoczi <stefanha@gmail.com>
Message-ID: <20190906143648.GA21331@redhat.com>
References: <1553351197-14581-1-git-send-email-cafer.abdi@gmail.com>
 <20190326081814.GF21018@stefanha-x1.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190326081814.GF21018@stefanha-x1.localdomain>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.28]); Fri, 06 Sep 2019 14:36:53 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH V2 0/4] fix usage of bool
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
Cc: qemu-trivial@nongnu.org, jusual@mail.ru, Jafar Abdi <cafer.abdi@gmail.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Mar 26, 2019 at 08:18:14AM +0000, Stefan Hajnoczi wrote:
> On Sat, Mar 23, 2019 at 05:26:33PM +0300, Jafar Abdi wrote:
> > Clean up wrong usage of FALSE and TRUE in places that use "bool" from stdbool.h.
> > 
> > FALSE and TRUE (with capital letters) are the constants defined by glib for
> > being used with the "gboolean" type of glib. But some parts of the code also use
> > TRUE and FALSE for variables that are declared as "bool" (the type from <stdbool.h>).
> 
> CCing qemu-trivial

Ping qemu-trivial - this was seems to have been missed, though
patches 2 & 3 got merged via ppc tree meanwhile. The other two
are still valid.


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|

