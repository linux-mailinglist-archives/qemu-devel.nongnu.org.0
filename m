Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 448FD14DAE5
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Jan 2020 13:44:20 +0100 (CET)
Received: from localhost ([::1]:60146 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ix9BD-0002yj-BD
	for lists+qemu-devel@lfdr.de; Thu, 30 Jan 2020 07:44:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55086)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <cohuck@redhat.com>) id 1ix931-00071j-5z
 for qemu-devel@nongnu.org; Thu, 30 Jan 2020 07:35:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <cohuck@redhat.com>) id 1ix930-0005dD-5b
 for qemu-devel@nongnu.org; Thu, 30 Jan 2020 07:35:51 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:32456
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <cohuck@redhat.com>) id 1ix930-0005cl-1y
 for qemu-devel@nongnu.org; Thu, 30 Jan 2020 07:35:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580387749;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=o9RLNdxObWByRfbUbNzCORpJbo0xEbJ/pciT1HM+72Q=;
 b=DSKar0EwkTpFvN+8DGv3V0GhGokzuqgVUBb+yVs155oQm5qODoTd/E7kX3oVHHp1Uf78Tl
 oi/OLKmMJZ417I4cXjohqH4VkVb9jgGKiPzBsKhQ0s6JH2W8FPIs8OnlTRjfnDkZQuPNrI
 KsMuIrl8zfVpQ34mDdIGz26VATNKkLo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-11-IGBx8_cfN96r5j8dyobNBw-1; Thu, 30 Jan 2020 07:35:46 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4A5CEDB69;
 Thu, 30 Jan 2020 12:35:45 +0000 (UTC)
Received: from gondolin (ovpn-117-199.ams2.redhat.com [10.36.117.199])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6FD8119486;
 Thu, 30 Jan 2020 12:35:38 +0000 (UTC)
Date: Thu, 30 Jan 2020 13:35:36 +0100
From: Cornelia Huck <cohuck@redhat.com>
To: Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>
Subject: Re: [PATCH v2 18/29] tests/acceptance/virtio_check_params: List
 machine being tested
Message-ID: <20200130133536.12904498.cohuck@redhat.com>
In-Reply-To: <20200129212345.20547-19-philmd@redhat.com>
References: <20200129212345.20547-1-philmd@redhat.com>
 <20200129212345.20547-19-philmd@redhat.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: IGBx8_cfN96r5j8dyobNBw-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 Denis Plotnikov <dplotnikov@virtuozzo.com>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 29 Jan 2020 22:23:34 +0100
Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> wrote:

> Add logging for easier debugging of failures:
>=20
>   $ avocado --show=3Dmachine run tests/acceptance/virtio_check_params.py
>    (1/1) tests/acceptance/virtio_check_params.py:VirtioMaxSegSettingsChec=
k.test_machine_types:
>   machine: {'name': 'pc-i440fx-2.12', 'seg_max_adjust': 'false', 'device'=
: 'virtio-scsi-pci'}
>   machine: {'name': 'pc-i440fx-2.0', 'seg_max_adjust': 'false', 'device':=
 'virtio-scsi-pci'}
>   machine: {'name': 'pc-q35-4.2', 'seg_max_adjust': 'false', 'device': 'v=
irtio-scsi-pci'}
>   machine: {'name': 'pc-i440fx-2.5', 'seg_max_adjust': 'false', 'device':=
 'virtio-scsi-pci'}
>   machine: {'name': 'pc-i440fx-4.2', 'seg_max_adjust': 'false', 'device':=
 'virtio-scsi-pci'}
>   ...
>=20
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>  tests/acceptance/virtio_check_params.py | 4 ++++
>  1 file changed, 4 insertions(+)

Reviewed-by: Cornelia Huck <cohuck@redhat.com>


