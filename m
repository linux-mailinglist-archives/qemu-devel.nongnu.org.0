Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E8A5F104537
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Nov 2019 21:36:30 +0100 (CET)
Received: from localhost ([::1]:34342 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iXWiD-0001zU-PT
	for lists+qemu-devel@lfdr.de; Wed, 20 Nov 2019 15:36:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60233)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eblake@redhat.com>) id 1iXWhG-0001Nl-E6
 for qemu-devel@nongnu.org; Wed, 20 Nov 2019 15:35:31 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eblake@redhat.com>) id 1iXWhF-00027Z-1F
 for qemu-devel@nongnu.org; Wed, 20 Nov 2019 15:35:30 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:27207
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eblake@redhat.com>) id 1iXWhE-00024u-UA
 for qemu-devel@nongnu.org; Wed, 20 Nov 2019 15:35:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1574282127;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zoRL0s/PwlgdpLfSG7fpqjXb9S8UjCR0IsyiGG2OCjM=;
 b=VCxksShRTUN7v8EqxUvDxaO8+YI3nkOojSzrpXe0kPOLH0MnhKVh6Eu7QQ/qYHuCgKZcTI
 EV6UKIcz/I8nMPKtj/tRZ+Ipx7u1KdH8/MrZZbD6vvrzJRRxq5JfFYdv50WUaspfk/TWnc
 UWwJMKqyaIIzFJJIQybDzd7jYyupakg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-107-0FK6NQYYO-O1XmCaEJP5cw-1; Wed, 20 Nov 2019 15:35:24 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5AA87DB20;
 Wed, 20 Nov 2019 20:35:23 +0000 (UTC)
Received: from [10.3.116.221] (ovpn-116-221.phx2.redhat.com [10.3.116.221])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F317A19C70;
 Wed, 20 Nov 2019 20:35:22 +0000 (UTC)
Subject: Re: [PATCH 5/6] qapi: Fix code generation for empty modules
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
References: <20191120182551.23795-1-armbru@redhat.com>
 <20191120182551.23795-6-armbru@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <f9a57f04-4c8e-3fda-bd7f-9f74cb24a7fb@redhat.com>
Date: Wed, 20 Nov 2019 14:35:22 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191120182551.23795-6-armbru@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: 0FK6NQYYO-O1XmCaEJP5cw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
Cc: mdroth@linux.vnet.ibm.com, kwolf@pond.sub.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/20/19 12:25 PM, Markus Armbruster wrote:
> When a sub-module doesn't contain any definitions, we don't generate
> code for it, but we do generate the #include.
>=20
> We generate code only for modules that get visited.
> QAPISchema.visit() visits only modules that have definitions.  It can
> visit modules multiple times.
>=20
> Clean this up as follows.  Collect entities in their QAPISchemaModule.
> Have QAPISchema.visit() call QAPISchemaModule.visit() for each module.
> Have QAPISchemaModule.visit() call .visit_module() for itself, and
> QAPISchemaEntity.visit() for each of its entities.  This way, we visit
> each module exactly once.
>=20
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---

Reviewed-by: Eric Blake <eblake@redhat.com>

--=20
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


