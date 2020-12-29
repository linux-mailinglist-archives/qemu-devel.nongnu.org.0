Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 873092E70D8
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Dec 2020 14:23:17 +0100 (CET)
Received: from localhost ([::1]:53704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kuEy4-0007AG-KM
	for lists+qemu-devel@lfdr.de; Tue, 29 Dec 2020 08:23:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35178)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1kuEvp-0006Fl-VM
 for qemu-devel@nongnu.org; Tue, 29 Dec 2020 08:20:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:28989)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1kuEvn-0001IW-US
 for qemu-devel@nongnu.org; Tue, 29 Dec 2020 08:20:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1609248055;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Sjo/cFAtrKP6IsCdeA7gsXta1XJCDVpfoag1mkXmim4=;
 b=SI6J1JxiPs1gORZqFBRp63ZZE9He4YCgHGnh9MmDDrbsAJ7SfqWJrJddFTFqvzOsaDR3Po
 7LkWmx0FGNHjaVQRsy8KReCBDl4vCOhewlOkzU6WOPY3RqpieuiT9t4/pI7Cb1EDlQ8q14
 IZe1ZbGfLzgsCHU7lrHhQLuL5oiiHQY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-110-lPYCzPDNMSqFd2Sqc5mjxA-1; Tue, 29 Dec 2020 08:20:53 -0500
X-MC-Unique: lPYCzPDNMSqFd2Sqc5mjxA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0CF2D802B42;
 Tue, 29 Dec 2020 13:20:52 +0000 (UTC)
Received: from localhost (unknown [10.40.208.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8E13B5D6DC;
 Tue, 29 Dec 2020 13:20:45 +0000 (UTC)
Date: Tue, 29 Dec 2020 14:20:44 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Subject: Re: [PATCH v2 1/3] smbios: Rename SMBIOS_ENTRY_POINT_* enums
Message-ID: <20201229142044.196a0cbe@redhat.com>
In-Reply-To: <20201214205029.2991222-2-ehabkost@redhat.com>
References: <20201214205029.2991222-1-ehabkost@redhat.com>
 <20201214205029.2991222-2-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Mon, 14 Dec 2020 15:50:27 -0500
Eduardo Habkost <ehabkost@redhat.com> wrote:

> Rename the enums to match the naming style used by QAPI.  This
> will allow us to more easily move the enum to the QAPI schema
> later.
>=20
> Based on portions of a patch submitted by Daniel P. Berrang=C3=A9.
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
> * Hunks included this patch are not changed from v1
> ---
>  include/hw/firmware/smbios.h | 4 ++--
>  hw/arm/virt.c                | 2 +-
>  hw/i386/pc_piix.c            | 2 +-
>  hw/i386/pc_q35.c             | 2 +-
>  hw/smbios/smbios.c           | 8 ++++----
>  5 files changed, 9 insertions(+), 9 deletions(-)
>=20
> diff --git a/include/hw/firmware/smbios.h b/include/hw/firmware/smbios.h
> index 02a0ced0a0..5467ecec78 100644
> --- a/include/hw/firmware/smbios.h
> +++ b/include/hw/firmware/smbios.h
> @@ -27,8 +27,8 @@ struct smbios_phys_mem_area {
>   * SMBIOS spec defined tables
>   */
>  typedef enum SmbiosEntryPointType {
> -    SMBIOS_ENTRY_POINT_21,
> -    SMBIOS_ENTRY_POINT_30,
> +    SMBIOS_ENTRY_POINT_TYPE_2_1,
> +    SMBIOS_ENTRY_POINT_TYPE_3_0,
>  } SmbiosEntryPointType;
> =20
>  /* SMBIOS Entry Point
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 556592012e..af53e09d1e 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -1445,7 +1445,7 @@ static void virt_build_smbios(VirtMachineState *vms=
)
> =20
>      smbios_set_defaults("QEMU", product,
>                          vmc->smbios_old_sys_ver ? "1.0" : mc->name, fals=
e,
> -                        true, SMBIOS_ENTRY_POINT_30);
> +                        true, SMBIOS_ENTRY_POINT_TYPE_3_0);
> =20
>      smbios_get_tables(MACHINE(vms), NULL, 0, &smbios_tables, &smbios_tab=
les_len,
>                        &smbios_anchor, &smbios_anchor_len);
> diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
> index 6188c3e97e..08b82df4d1 100644
> --- a/hw/i386/pc_piix.c
> +++ b/hw/i386/pc_piix.c
> @@ -179,7 +179,7 @@ static void pc_init1(MachineState *machine,
>          smbios_set_defaults("QEMU", "Standard PC (i440FX + PIIX, 1996)",
>                              mc->name, pcmc->smbios_legacy_mode,
>                              pcmc->smbios_uuid_encoded,
> -                            SMBIOS_ENTRY_POINT_21);
> +                            SMBIOS_ENTRY_POINT_TYPE_2_1);
>      }
> =20
>      /* allocate ram and load rom/bios */
> diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
> index 0a212443aa..f71b1e2dcf 100644
> --- a/hw/i386/pc_q35.c
> +++ b/hw/i386/pc_q35.c
> @@ -198,7 +198,7 @@ static void pc_q35_init(MachineState *machine)
>          smbios_set_defaults("QEMU", "Standard PC (Q35 + ICH9, 2009)",
>                              mc->name, pcmc->smbios_legacy_mode,
>                              pcmc->smbios_uuid_encoded,
> -                            SMBIOS_ENTRY_POINT_21);
> +                            SMBIOS_ENTRY_POINT_TYPE_2_1);
>      }
> =20
>      /* allocate ram and load rom/bios */
> diff --git a/hw/smbios/smbios.c b/hw/smbios/smbios.c
> index f22c4f5b73..930cf52c6b 100644
> --- a/hw/smbios/smbios.c
> +++ b/hw/smbios/smbios.c
> @@ -61,7 +61,7 @@ uint8_t *smbios_tables;
>  size_t smbios_tables_len;
>  unsigned smbios_table_max;
>  unsigned smbios_table_cnt;
> -static SmbiosEntryPointType smbios_ep_type =3D SMBIOS_ENTRY_POINT_21;
> +static SmbiosEntryPointType smbios_ep_type =3D SMBIOS_ENTRY_POINT_TYPE_2=
_1;
> =20
>  static SmbiosEntryPoint ep;
> =20
> @@ -383,7 +383,7 @@ static void smbios_validate_table(MachineState *ms)
>          exit(1);
>      }
> =20
> -    if (smbios_ep_type =3D=3D SMBIOS_ENTRY_POINT_21 &&
> +    if (smbios_ep_type =3D=3D SMBIOS_ENTRY_POINT_TYPE_2_1 &&
>          smbios_tables_len > SMBIOS_21_MAX_TABLES_LEN) {
>          error_report("SMBIOS 2.1 table length %zu exceeds %d",
>                       smbios_tables_len, SMBIOS_21_MAX_TABLES_LEN);
> @@ -831,7 +831,7 @@ void smbios_set_defaults(const char *manufacturer, co=
nst char *product,
>  static void smbios_entry_point_setup(void)
>  {
>      switch (smbios_ep_type) {
> -    case SMBIOS_ENTRY_POINT_21:
> +    case SMBIOS_ENTRY_POINT_TYPE_2_1:
>          memcpy(ep.ep21.anchor_string, "_SM_", 4);
>          memcpy(ep.ep21.intermediate_anchor_string, "_DMI_", 5);
>          ep.ep21.length =3D sizeof(struct smbios_21_entry_point);
> @@ -854,7 +854,7 @@ static void smbios_entry_point_setup(void)
>          ep.ep21.structure_table_address =3D cpu_to_le32(0);
> =20
>          break;
> -    case SMBIOS_ENTRY_POINT_30:
> +    case SMBIOS_ENTRY_POINT_TYPE_3_0:
>          memcpy(ep.ep30.anchor_string, "_SM3_", 5);
>          ep.ep30.length =3D sizeof(struct smbios_30_entry_point);
>          ep.ep30.entry_point_revision =3D 1;


