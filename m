Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F04014C9BD
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Jun 2019 10:50:07 +0200 (CEST)
Received: from localhost ([::1]:44928 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hdslj-0000Qo-5Y
	for lists+qemu-devel@lfdr.de; Thu, 20 Jun 2019 04:50:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35899)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <berrange@redhat.com>) id 1hdsix-0006r2-7h
 for qemu-devel@nongnu.org; Thu, 20 Jun 2019 04:47:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <berrange@redhat.com>) id 1hdshM-0006kV-7D
 for qemu-devel@nongnu.org; Thu, 20 Jun 2019 04:45:38 -0400
Received: from mx1.redhat.com ([209.132.183.28]:47420)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <berrange@redhat.com>) id 1hdshI-0006fp-WB
 for qemu-devel@nongnu.org; Thu, 20 Jun 2019 04:45:34 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id F049C6EB83
 for <qemu-devel@nongnu.org>; Thu, 20 Jun 2019 08:45:23 +0000 (UTC)
Received: from redhat.com (ovpn-112-65.ams2.redhat.com [10.36.112.65])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BD31A60A97;
 Thu, 20 Jun 2019 08:45:22 +0000 (UTC)
Date: Thu, 20 Jun 2019 09:45:19 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Message-ID: <20190620084519.GJ25448@redhat.com>
References: <20190619201050.19040-1-armbru@redhat.com>
 <20190619201050.19040-9-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190619201050.19040-9-armbru@redhat.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.25]); Thu, 20 Jun 2019 08:45:29 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH 08/17] qapi: Split machine.json off
 misc.json
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
Cc: kwolf@redhat.com, qemu-devel@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jun 19, 2019 at 10:10:41PM +0200, Markus Armbruster wrote:
> Move commands cpu-add, query-cpus, query-cpus-fast,
> query-current-machine, query-hotpluggable-cpus, query-machines,
> query-memdev, and set-numa-node with their types from misc.json to new
> machine.json.  Also move types X86CPURegister32 and
> X86CPUFeatureWordInfo.  Add machine.json to MAINTAINERS section
> "Machine core".
>=20
> Cc: Eduardo Habkost <ehabkost@redhat.com>
> Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>  MAINTAINERS              |   1 +
>  cpus.c                   |   1 +
>  include/hw/boards.h      |   1 +
>  include/sysemu/hostmem.h |   2 +-
>  monitor/hmp-cmds.c       |   1 +
>  monitor/qmp-cmds.c       |   1 +
>  numa.c                   |   4 +-
>  qapi/Makefile.objs       |   2 +-
>  qapi/machine.json        | 697 +++++++++++++++++++++++++++++++++++++++
>  qapi/misc.json           | 687 --------------------------------------
>  qapi/qapi-schema.json    |   1 +
>  target/i386/cpu.c        |   2 +-
>  target/s390x/cpu.c       |   2 +-
>  target/s390x/sigp.c      |   2 +-
>  vl.c                     |   2 +-
>  15 files changed, 711 insertions(+), 695 deletions(-)
>  create mode 100644 qapi/machine.json

Reviewed-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>


Regards,
Daniel
--=20
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberran=
ge :|
|: https://libvirt.org         -o-            https://fstop138.berrange.c=
om :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberran=
ge :|

