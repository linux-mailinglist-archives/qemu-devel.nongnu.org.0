Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C575D2E70DA
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Dec 2020 14:26:48 +0100 (CET)
Received: from localhost ([::1]:57036 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kuF1T-0000AZ-SP
	for lists+qemu-devel@lfdr.de; Tue, 29 Dec 2020 08:26:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35448)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1kuEwU-0006h1-Eo
 for qemu-devel@nongnu.org; Tue, 29 Dec 2020 08:21:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46259)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1kuEwR-0001Ue-I7
 for qemu-devel@nongnu.org; Tue, 29 Dec 2020 08:21:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1609248094;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AB4OKgl50q1D+GDq4lKaIlcy+n3gs2yyzkkaLt3sCWU=;
 b=UGhxdrVDkzWtW1TZsbAcADUdhqn6KCuDbm4MfE7CNNB4kAg2Yv6ggwznoXZL5T7ONLMt0N
 KQLBBv32ryZme89ux7OEVqNtFTSh+T+HwpUPJXmYvsPYVsd71g8AlMnI/s9Xk1Q2qGXdHv
 VhymoKBkG1JI+hO/a0gSE6JnfOxO7uw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-63-M4MW9XNsNa-irlzVWDCSJA-1; Tue, 29 Dec 2020 08:21:31 -0500
X-MC-Unique: M4MW9XNsNa-irlzVWDCSJA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CBA1B107ACE6;
 Tue, 29 Dec 2020 13:21:29 +0000 (UTC)
Received: from localhost (unknown [10.40.208.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 351AE2BFF1;
 Tue, 29 Dec 2020 13:21:23 +0000 (UTC)
Date: Tue, 29 Dec 2020 14:21:22 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Subject: Re: [PATCH v2 2/3] hw/smbios: Use qapi for SmbiosEntryPointType
Message-ID: <20201229142122.7d2f03df@redhat.com>
In-Reply-To: <20201214205029.2991222-3-ehabkost@redhat.com>
References: <20201214205029.2991222-1-ehabkost@redhat.com>
 <20201214205029.2991222-3-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
 P. Berrange" <berrange@redhat.com>, Michael Roth <mdroth@linux.vnet.ibm.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Laszlo Ersek <lersek@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 14 Dec 2020 15:50:28 -0500
Eduardo Habkost <ehabkost@redhat.com> wrote:

> This prepares for exposing the SMBIOS entry point type as a
> machine property on x86.
>=20
> Based on a patch from Daniel P. Berrang=C3=A9.
>=20
> Signed-off-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> ---
> First version of this code was submitted at:
> https://lore.kernel.org/qemu-devel/20200908165438.1008942-5-berrange@redh=
at.com
>=20
> Changes from v1:
> * Patch was split in two
> * Declarations were moved to qapi/smbios.json
> * Documentation was updated to use the same terminology used in
>   SMBIOS documentation
> * Documentation was updated to "Since: 6.0"
> ---
>  qapi/qapi-schema.json        |  1 +
>  qapi/smbios.json             | 11 +++++++++++
>  include/hw/firmware/smbios.h | 10 ++--------
>  qapi/meson.build             |  1 +
>  4 files changed, 15 insertions(+), 8 deletions(-)
>  create mode 100644 qapi/smbios.json
>=20
> diff --git a/qapi/qapi-schema.json b/qapi/qapi-schema.json
> index 0b444b76d2..87a183fb13 100644
> --- a/qapi/qapi-schema.json
> +++ b/qapi/qapi-schema.json
> @@ -86,6 +86,7 @@
>  { 'include': 'machine.json' }
>  { 'include': 'machine-target.json' }
>  { 'include': 'replay.json' }
> +{ 'include': 'smbios.json' }
>  { 'include': 'misc.json' }
>  { 'include': 'misc-target.json' }
>  { 'include': 'audio.json' }
> diff --git a/qapi/smbios.json b/qapi/smbios.json
> new file mode 100644
> index 0000000000..55b3bd2e83
> --- /dev/null
> +++ b/qapi/smbios.json
> @@ -0,0 +1,11 @@
> +##
> +# @SmbiosEntryPointType:
> +#
> +# @2_1: SMBIOS version 2.1 (32-bit) Entry Point
> +#
> +# @3_0: SMBIOS version 3.0 (64-bit) Entry Point
> +#
> +# Since: 6.0
> +##
> +{ 'enum': 'SmbiosEntryPointType',
> +  'data': [ '2_1', '3_0' ] }
> diff --git a/include/hw/firmware/smbios.h b/include/hw/firmware/smbios.h
> index 5467ecec78..b3beef1606 100644
> --- a/include/hw/firmware/smbios.h
> +++ b/include/hw/firmware/smbios.h
> @@ -1,6 +1,8 @@
>  #ifndef QEMU_SMBIOS_H
>  #define QEMU_SMBIOS_H
> =20
> +#include "qapi/qapi-types-smbios.h"
> +
>  /*
>   * SMBIOS Support
>   *
> @@ -23,14 +25,6 @@ struct smbios_phys_mem_area {
>      uint64_t length;
>  };
> =20
> -/*
> - * SMBIOS spec defined tables
> - */
> -typedef enum SmbiosEntryPointType {
> -    SMBIOS_ENTRY_POINT_TYPE_2_1,
> -    SMBIOS_ENTRY_POINT_TYPE_3_0,
> -} SmbiosEntryPointType;
> -
>  /* SMBIOS Entry Point
>   * There are two types of entry points defined in the SMBIOS specificati=
on
>   * (see below). BIOS must place the entry point(s) at a 16-byte-aligned
> diff --git a/qapi/meson.build b/qapi/meson.build
> index 0e98146f1f..f7fb73d41b 100644
> --- a/qapi/meson.build
> +++ b/qapi/meson.build
> @@ -42,6 +42,7 @@ qapi_all_modules =3D [
>    'replay',
>    'rocker',
>    'run-state',
> +  'smbios',
>    'sockets',
>    'tpm',
>    'trace',


