Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC2DF32AC6B
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 22:57:09 +0100 (CET)
Received: from localhost ([::1]:49226 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHD0v-0001pg-0W
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 16:57:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1lHCzX-0000YK-0x
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 16:55:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:58178)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1lHCzU-0000en-AV
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 16:55:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614722139;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jjo0AJv79VW8yxKsXPEJe7nCR05H7a3fRqWn3dkhmck=;
 b=ROj/HoZNWd6yiqV+ZK8L6Cdjudl2lb1NTYl6dGhzybHYHiI7vsIt4U88x+ibr4Ei/MFnAq
 d1mylEsARN+rNnLzp/whelJg0uAvTP3j2Px8FvkOkfs2rjWt8oZWNdjx8G8+3Jmmi+D2Ka
 cE9iLG0uBL0vTQhcSaVpXI8x8NVNh5Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-148-Pupjk9ZWN8WYOqF4Oyya8g-1; Tue, 02 Mar 2021 16:55:35 -0500
X-MC-Unique: Pupjk9ZWN8WYOqF4Oyya8g-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 32793107ACE3;
 Tue,  2 Mar 2021 21:55:34 +0000 (UTC)
Received: from omen.home.shazbot.org (ovpn-112-255.phx2.redhat.com
 [10.3.112.255])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0384660917;
 Tue,  2 Mar 2021 21:55:23 +0000 (UTC)
Date: Tue, 2 Mar 2021 14:55:23 -0700
From: Alex Williamson <alex.williamson@redhat.com>
To: Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>
Subject: Re: [PATCH v2 8/8] hw/vfio/pci-quirks: Replace the word 'blacklist'
Message-ID: <20210302145523.0c694e4d@omen.home.shazbot.org>
In-Reply-To: <20210205171817.2108907-9-philmd@redhat.com>
References: <20210205171817.2108907-1-philmd@redhat.com>
 <20210205171817.2108907-9-philmd@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=alex.williamson@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=63.128.21.124;
 envelope-from=alex.williamson@redhat.com;
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
Cc: Eduardo Otubo <otubo@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 "Daniel P . =?UTF-8?B?QmVycmFuZ8Op?=" <berrange@redhat.com>,
 qemu-block@nongnu.org, Michael Roth <michael.roth@amd.com>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Gerd Hoffmann <kraxel@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Alex =?UTF-8?B?QmVubsOpZQ==?= <alex.bennee@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri,  5 Feb 2021 18:18:17 +0100
Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> wrote:

> Follow the inclusive terminology from the "Conscious Language in your
> Open Source Projects" guidelines [*] and replace the word "blacklist"
> appropriately.
>=20
> [*] https://github.com/conscious-lang/conscious-lang-docs/blob/main/faq.m=
d
>=20
> Reviewed-by: Alex Williamson <alex.williamson@redhat.com>
> Acked-by: Alex Williamson <alex.williamson@redhat.com>
> Reviewed-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>  hw/vfio/pci.h        |  2 +-
>  hw/vfio/pci-quirks.c | 14 +++++++-------
>  hw/vfio/pci.c        |  4 ++--
>  hw/vfio/trace-events |  2 +-
>  4 files changed, 11 insertions(+), 11 deletions(-)

I thought someone might grab the whole series, but since that hasn't
happened yet, I've queued this one.  Thanks,

Alex

>=20
> diff --git a/hw/vfio/pci.h b/hw/vfio/pci.h
> index 1574ef983f8..64777516d16 100644
> --- a/hw/vfio/pci.h
> +++ b/hw/vfio/pci.h
> @@ -197,7 +197,7 @@ void vfio_pci_write_config(PCIDevice *pdev,
>  uint64_t vfio_vga_read(void *opaque, hwaddr addr, unsigned size);
>  void vfio_vga_write(void *opaque, hwaddr addr, uint64_t data, unsigned s=
ize);
> =20
> -bool vfio_blacklist_opt_rom(VFIOPCIDevice *vdev);
> +bool vfio_opt_rom_in_denylist(VFIOPCIDevice *vdev);
>  void vfio_vga_quirk_setup(VFIOPCIDevice *vdev);
>  void vfio_vga_quirk_exit(VFIOPCIDevice *vdev);
>  void vfio_vga_quirk_finalize(VFIOPCIDevice *vdev);
> diff --git a/hw/vfio/pci-quirks.c b/hw/vfio/pci-quirks.c
> index fc8d63c8504..81c3e30df77 100644
> --- a/hw/vfio/pci-quirks.c
> +++ b/hw/vfio/pci-quirks.c
> @@ -43,19 +43,19 @@
>  static const struct {
>      uint32_t vendor;
>      uint32_t device;
> -} romblacklist[] =3D {
> +} rom_denylist[] =3D {
>      { 0x14e4, 0x168e }, /* Broadcom BCM 57810 */
>  };
> =20
> -bool vfio_blacklist_opt_rom(VFIOPCIDevice *vdev)
> +bool vfio_opt_rom_in_denylist(VFIOPCIDevice *vdev)
>  {
>      int i;
> =20
> -    for (i =3D 0 ; i < ARRAY_SIZE(romblacklist); i++) {
> -        if (vfio_pci_is(vdev, romblacklist[i].vendor, romblacklist[i].de=
vice)) {
> -            trace_vfio_quirk_rom_blacklisted(vdev->vbasedev.name,
> -                                             romblacklist[i].vendor,
> -                                             romblacklist[i].device);
> +    for (i =3D 0 ; i < ARRAY_SIZE(rom_denylist); i++) {
> +        if (vfio_pci_is(vdev, rom_denylist[i].vendor, rom_denylist[i].de=
vice)) {
> +            trace_vfio_quirk_rom_in_denylist(vdev->vbasedev.name,
> +                                             rom_denylist[i].vendor,
> +                                             rom_denylist[i].device);
>              return true;
>          }
>      }
> diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
> index f74be782091..759a3b1abf4 100644
> --- a/hw/vfio/pci.c
> +++ b/hw/vfio/pci.c
> @@ -900,7 +900,7 @@ static void vfio_pci_size_rom(VFIOPCIDevice *vdev)
> =20
>      if (vdev->pdev.romfile || !vdev->pdev.rom_bar) {
>          /* Since pci handles romfile, just print a message and return */
> -        if (vfio_blacklist_opt_rom(vdev) && vdev->pdev.romfile) {
> +        if (vfio_opt_rom_in_denylist(vdev) && vdev->pdev.romfile) {
>              warn_report("Device at %s is known to cause system instabili=
ty"
>                          " issues during option rom execution",
>                          vdev->vbasedev.name);
> @@ -927,7 +927,7 @@ static void vfio_pci_size_rom(VFIOPCIDevice *vdev)
>          return;
>      }
> =20
> -    if (vfio_blacklist_opt_rom(vdev)) {
> +    if (vfio_opt_rom_in_denylist(vdev)) {
>          if (dev->opts && qemu_opt_get(dev->opts, "rombar")) {
>              warn_report("Device at %s is known to cause system instabili=
ty"
>                          " issues during option rom execution",
> diff --git a/hw/vfio/trace-events b/hw/vfio/trace-events
> index c0e75f24b76..079f53acf28 100644
> --- a/hw/vfio/trace-events
> +++ b/hw/vfio/trace-events
> @@ -49,7 +49,7 @@ vfio_pci_emulated_sub_vendor_id(const char *name, uint1=
6_t val) "%s 0x%04x"
>  vfio_pci_emulated_sub_device_id(const char *name, uint16_t val) "%s 0x%0=
4x"
> =20
>  # pci-quirks.c
> -vfio_quirk_rom_blacklisted(const char *name, uint16_t vid, uint16_t did)=
 "%s %04x:%04x"
> +vfio_quirk_rom_in_denylist(const char *name, uint16_t vid, uint16_t did)=
 "%s %04x:%04x"
>  vfio_quirk_generic_window_address_write(const char *name, const char * r=
egion_name, uint64_t data) "%s %s 0x%"PRIx64
>  vfio_quirk_generic_window_data_read(const char *name, const char * regio=
n_name, uint64_t data) "%s %s 0x%"PRIx64
>  vfio_quirk_generic_window_data_write(const char *name, const char * regi=
on_name, uint64_t data) "%s %s 0x%"PRIx64


