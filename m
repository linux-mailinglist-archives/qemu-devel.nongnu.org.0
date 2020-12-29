Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B51B72E70D7
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Dec 2020 14:22:23 +0100 (CET)
Received: from localhost ([::1]:52452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kuExC-0006cx-Co
	for lists+qemu-devel@lfdr.de; Tue, 29 Dec 2020 08:22:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35024)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1kuEvF-0005oi-B5
 for qemu-devel@nongnu.org; Tue, 29 Dec 2020 08:20:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:22511)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1kuEvD-0000zE-EC
 for qemu-devel@nongnu.org; Tue, 29 Dec 2020 08:20:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1609248017;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Xc2QnPvaMIA4l+6Smu7mnjddpYRMr/RirnZalYyGHfQ=;
 b=bYPUXwyrUiQE/T/Qt1ZmkLkHOfOt3WCNHPAxtvoxVPOZgZjfQstjxKYzhjpSeI/Pxn/nYm
 +sG0IkKQKotGVlfrQvUehpfs65WBIzsidgkfedsl7hyxCo+SU/IwvfUQJg0c43R5Df6Eea
 bhJRSZrwndSsekulrrbIFJvN/alSEVE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-122-RxoaunwjMEq4voijxgo4Bw-1; Tue, 29 Dec 2020 08:20:14 -0500
X-MC-Unique: RxoaunwjMEq4voijxgo4Bw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B26E2879500;
 Tue, 29 Dec 2020 13:20:12 +0000 (UTC)
Received: from localhost (unknown [10.40.208.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C5AA16B8DA;
 Tue, 29 Dec 2020 13:20:03 +0000 (UTC)
Date: Tue, 29 Dec 2020 14:20:01 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Subject: Re: [PATCH v2 0/3] pc: Support configuration of SMBIOS entry point
 type
Message-ID: <20201229142001.3b28fdf2@redhat.com>
In-Reply-To: <20201214205029.2991222-1-ehabkost@redhat.com>
References: <20201214205029.2991222-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=63.128.21.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, "Daniel
 P. Berrange" <berrange@redhat.com>, Laszlo Ersek <lersek@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Michael Roth <mdroth@linux.vnet.ibm.com>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 14 Dec 2020 15:50:26 -0500
Eduardo Habkost <ehabkost@redhat.com> wrote:

> This includes code previously submitted[1] by Daniel P. Berrang=C3=A9
> to add a "smbios-ep" machine property on PC.
>=20
> SMBIOS 3.0 is necessary to support more than ~720 VCPUs, as a
> large number of VCPUs can easily hit the table size limit of
> SMBIOS 2.1 entry points.

Eduardo,
do you plan to submit Seabios patches for SMBIOS 3.0?
will OVMF pick up new tables automatically?

>=20
> [1] https://lore.kernel.org/qemu-devel/20200908165438.1008942-5-berrange@=
redhat.com
>     https://lore.kernel.org/qemu-devel/20200908165438.1008942-6-berrange@=
redhat.com
>=20
> Daniel P. Berrang=C3=A9 (1):
>   hw/i386: expose a "smbios-ep" PC machine property
>=20
> Eduardo Habkost (2):
>   smbios: Rename SMBIOS_ENTRY_POINT_* enums
>   hw/smbios: Use qapi for SmbiosEntryPointType
>=20
>  qapi/qapi-schema.json        |  1 +
>  qapi/smbios.json             | 11 +++++++++++
>  include/hw/firmware/smbios.h | 10 ++--------
>  include/hw/i386/pc.h         |  3 +++
>  hw/arm/virt.c                |  2 +-
>  hw/i386/pc.c                 | 26 ++++++++++++++++++++++++++
>  hw/i386/pc_piix.c            |  2 +-
>  hw/i386/pc_q35.c             |  2 +-
>  hw/smbios/smbios.c           |  8 ++++----
>  qapi/meson.build             |  1 +
>  10 files changed, 51 insertions(+), 15 deletions(-)
>  create mode 100644 qapi/smbios.json
>=20


