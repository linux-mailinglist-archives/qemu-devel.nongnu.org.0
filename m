Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E54149CA9
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Jun 2019 11:08:09 +0200 (CEST)
Received: from localhost ([::1]:55008 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hdA63-00069i-3S
	for lists+qemu-devel@lfdr.de; Tue, 18 Jun 2019 05:08:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47217)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <berrange@redhat.com>) id 1hdA07-0004zD-W0
 for qemu-devel@nongnu.org; Tue, 18 Jun 2019 05:02:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <berrange@redhat.com>) id 1hdA06-00078W-Qc
 for qemu-devel@nongnu.org; Tue, 18 Jun 2019 05:01:59 -0400
Received: from mx1.redhat.com ([209.132.183.28]:50942)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <berrange@redhat.com>) id 1hdA06-000786-Kq
 for qemu-devel@nongnu.org; Tue, 18 Jun 2019 05:01:58 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id E05DE30B46F1
 for <qemu-devel@nongnu.org>; Tue, 18 Jun 2019 09:01:57 +0000 (UTC)
Received: from redhat.com (ovpn-112-51.ams2.redhat.com [10.36.112.51])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CF97A3796;
 Tue, 18 Jun 2019 09:01:56 +0000 (UTC)
Date: Tue, 18 Jun 2019 10:01:53 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Message-ID: <20190618090153.GE28525@redhat.com>
References: <20190617184903.19436-1-armbru@redhat.com>
 <20190617184903.19436-17-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190617184903.19436-17-armbru@redhat.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.46]); Tue, 18 Jun 2019 09:01:57 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PULL 16/16] vl: Deprecate -mon pretty=... for HMP
 monitors
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jun 17, 2019 at 08:49:03PM +0200, Markus Armbruster wrote:
> From: Kevin Wolf <kwolf@redhat.com>
> 
> The -mon pretty=on|off switch of the -mon option applies only to QMP
> monitors. It's silently ignored for HMP. Deprecate this combination so
> that we can make it an error in future versions.

No objection to merging this PR as is, but how about we extend the
deprecation to QMP too ?

I was responsible for adding this option back in 2010 and I don't
think I've used it since 2012 when I added pretty printing support
to scripts/qmp/qmp-shell. I struggle to imagine good reasons for
using QMP directly with pretty printing, as opposed to doing it
via qmp-shell or another wrapper tool.


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|

