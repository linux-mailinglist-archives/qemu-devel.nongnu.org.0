Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C0B8402B5D
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Sep 2021 17:11:13 +0200 (CEST)
Received: from localhost ([::1]:59912 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNcki-0002to-Go
	for lists+qemu-devel@lfdr.de; Tue, 07 Sep 2021 11:11:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38992)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mNcau-0001Q7-Et
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 11:01:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32432)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mNcas-0001E3-C2
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 11:01:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631026860;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=CtoG6FGhNe9F2YXqC+Pd5VUU/GSAKaRyvQcF+tAjYh8=;
 b=Os3BSU8RG7tpPIeuju12TxTWllcx+Un4FeOj3VrFUFzWUhsPXGF1t/XqSYjFbEtmNZxUVx
 T52N70YMGaNPgcnxtddZhhxHiYA6APHxxVTAXjQbRnE0TweBS0rNrS5iwcUq2Ege5TxTvx
 pTJTZ+2rndjdc5rgLlv3EczgP1o/pm4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-363-HK0KLyyDNyeN9qXWA22rbA-1; Tue, 07 Sep 2021 11:00:57 -0400
X-MC-Unique: HK0KLyyDNyeN9qXWA22rbA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EC0641883522;
 Tue,  7 Sep 2021 15:00:55 +0000 (UTC)
Received: from localhost (unknown [10.39.194.246])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BE2E35C1D0;
 Tue,  7 Sep 2021 15:00:52 +0000 (UTC)
Date: Tue, 7 Sep 2021 16:00:51 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Subject: Re: [PATCH RFC v2 10/16] vfio-user: pci_user_realize PCI setup
Message-ID: <YTd+o9EidVsWxXGf@stefanha-x1.localdomain>
References: <cover.1629131628.git.elena.ufimtseva@oracle.com>
 <b6ccfc654915781b1bd16aec4e3f98600f2577ef.1629131628.git.elena.ufimtseva@oracle.com>
MIME-Version: 1.0
In-Reply-To: <b6ccfc654915781b1bd16aec4e3f98600f2577ef.1629131628.git.elena.ufimtseva@oracle.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="HypIrOimBGtUZeRG"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: john.g.johnson@oracle.com, jag.raman@oracle.com, swapnil.ingle@nutanix.com,
 john.levon@nutanix.com, qemu-devel@nongnu.org, alex.williamson@redhat.com,
 thanos.makatos@nutanix.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--HypIrOimBGtUZeRG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 16, 2021 at 09:42:43AM -0700, Elena Ufimtseva wrote:
> @@ -3423,6 +3478,91 @@ static void vfio_user_pci_realize(PCIDevice *pdev,=
 Error **errp)
>          goto error;
>      }
> =20
> +    /* Get a copy of config space */
> +    ret =3D vfio_user_region_read(vbasedev, VFIO_PCI_CONFIG_REGION_INDEX=
, 0,
> +                                MIN(pci_config_size(pdev), vdev->config_=
size),
> +                                pdev->config);
> +    if (ret < (int)MIN(pci_config_size(&vdev->pdev), vdev->config_size))=
 {
> +        error_setg_errno(errp, -ret, "failed to read device config space=
");
> +        goto error;
> +    }
> +
> +    /* vfio emulates a lot for us, but some bits need extra love */
> +    vdev->emulated_config_bits =3D g_malloc0(vdev->config_size);
> +
> +    /* QEMU can choose to expose the ROM or not */
> +    memset(vdev->emulated_config_bits + PCI_ROM_ADDRESS, 0xff, 4);
> +    /* QEMU can also add or extend BARs */
> +    memset(vdev->emulated_config_bits + PCI_BASE_ADDRESS_0, 0xff, 6 * 4)=
;
> +    vdev->vendor_id =3D pci_get_word(pdev->config + PCI_VENDOR_ID);
> +    vdev->device_id =3D pci_get_word(pdev->config + PCI_DEVICE_ID);
> +
> +    /* QEMU can change multi-function devices to single function, or rev=
erse */
> +    vdev->emulated_config_bits[PCI_HEADER_TYPE] =3D
> +                                              PCI_HEADER_TYPE_MULTI_FUNC=
TION;
> +
> +    /* Restore or clear multifunction, this is always controlled by QEMU=
 */
> +    if (vdev->pdev.cap_present & QEMU_PCI_CAP_MULTIFUNCTION) {
> +        vdev->pdev.config[PCI_HEADER_TYPE] |=3D PCI_HEADER_TYPE_MULTI_FU=
NCTION;
> +    } else {
> +        vdev->pdev.config[PCI_HEADER_TYPE] &=3D ~PCI_HEADER_TYPE_MULTI_F=
UNCTION;
> +    }
> +
> +    /*
> +     * Clear host resource mapping info.  If we choose not to register a
> +     * BAR, such as might be the case with the option ROM, we can get
> +     * confusing, unwritable, residual addresses from the host here.
> +     */
> +    memset(&vdev->pdev.config[PCI_BASE_ADDRESS_0], 0, 24);
> +    memset(&vdev->pdev.config[PCI_ROM_ADDRESS], 0, 4);
> +
> +    vfio_pci_size_rom(vdev);
> +
> +    vfio_bars_prepare(vdev);
> +
> +    vfio_msix_early_setup(vdev, &err);
> +    if (err) {
> +        error_propagate(errp, err);
> +        goto error;
> +    }
> +
> +    vfio_bars_register(vdev);
> +
> +    ret =3D vfio_add_capabilities(vdev, errp);
> +    if (ret) {
> +        goto out_teardown;
> +    }

I haven't audited the common code to find places where the contents of
the PCI Configuration Space are trusted. Input validation may need to be
performed on offsets and other inputs that we read from the device.

Otherwise:

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--HypIrOimBGtUZeRG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmE3fqMACgkQnKSrs4Gr
c8iAdwf/UfyGtcIL86hCT6KD5Se5nBUElvJbd6fTA3gxxs6jiUEqFZJrLEj026X9
f06Gv1KzvgIgYllSXUSKSy/GKxt7HwY9r6ol9ZnCYisTjqxW1rErRzwx/338XmIo
96SbznYpxgm+Eea/s6SrTPEzbxKb1KRS9AL3eDua0LdQ37SUCetIBMSuuqTE8JVu
dQ8XVubMG2DRSSWShDmfQ83gDZ3evYgGQOr6+ENO27nx5Ks6FkHhJsJ5GWdvyyys
3FOdc8dAYw00sFfRjhSeadIMpgCoifSKUUGIjna8UwKr1B3MShYEJwiYz6WGIyx1
5QELu6TUhFJXXEV8URiM1ggC56IRog==
=PfWa
-----END PGP SIGNATURE-----

--HypIrOimBGtUZeRG--


