Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C08615485F6
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Jun 2022 17:32:23 +0200 (CEST)
Received: from localhost ([::1]:46460 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o0m3C-0005QM-Eo
	for lists+qemu-devel@lfdr.de; Mon, 13 Jun 2022 11:32:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33422)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1o0m1E-0003jC-QQ
 for qemu-devel@nongnu.org; Mon, 13 Jun 2022 11:30:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37939)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1o0m1B-00084D-SR
 for qemu-devel@nongnu.org; Mon, 13 Jun 2022 11:30:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655134217;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2qABwwILyWr7/nLtu1q8BwaTF2EX+ZtD62wMUKQHxBA=;
 b=afIQGd51teCG8aJ2660D4TGJJudnkVIWBrTNMw8RUojtD5zzXYmrnamtjRRvUSgh64BVzg
 L7dErVyo6Oudhe7wxZYIRNIMpeloSz3GBxBygrHy00YfzMi1Qh2afFbXNf7w2cxHxJjC4s
 zPNzi1gAKwp6bztA39id10FY/3uBRhk=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-508-ODpWQ_MbOia1_37BOZ85ug-1; Mon, 13 Jun 2022 11:30:15 -0400
X-MC-Unique: ODpWQ_MbOia1_37BOZ85ug-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E5F911C05133;
 Mon, 13 Jun 2022 15:30:14 +0000 (UTC)
Received: from localhost (unknown [10.39.192.87])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 094592166B26;
 Mon, 13 Jun 2022 15:30:13 +0000 (UTC)
Date: Mon, 13 Jun 2022 16:30:12 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Jagannathan Raman <jag.raman@oracle.com>
Cc: qemu-devel@nongnu.org, mst@redhat.com, alex.williamson@redhat.com,
 f4bug@amsat.org, pbonzini@redhat.com, marcandre.lureau@redhat.com,
 thuth@redhat.com, bleal@redhat.com, berrange@redhat.com,
 peter.maydell@linaro.org, eduardo@habkost.net,
 marcel.apfelbaum@gmail.com, eblake@redhat.com, armbru@redhat.com,
 quintela@redhat.com, dgilbert@redhat.com, imammedo@redhat.com,
 peterx@redhat.com, john.levon@nutanix.com,
 thanos.makatos@nutanix.com, elena.ufimtseva@oracle.com,
 john.g.johnson@oracle.com, kanth.ghatraju@oracle.com
Subject: Re: [PATCH v11 13/14] vfio-user: handle device interrupts
Message-ID: <YqdYBGzfmsw7odJd@stefanha-x1.localdomain>
References: <cover.1654889541.git.jag.raman@oracle.com>
 <1baf753065d5d135b7638fa099c6929767aba1f5.1654889541.git.jag.raman@oracle.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="BEkcujKRBQpp3vDd"
Content-Disposition: inline
In-Reply-To: <1baf753065d5d135b7638fa099c6929767aba1f5.1654889541.git.jag.raman@oracle.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--BEkcujKRBQpp3vDd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 10, 2022 at 03:50:40PM -0400, Jagannathan Raman wrote:
> @@ -307,6 +315,38 @@ bool msi_is_masked(const PCIDevice *dev, unsigned in=
t vector)
>      return mask & (1U << vector);
>  }
> =20
> +void msi_set_irq_state(PCIDevice *dev, int vector, bool mask, Error **er=
rp)

The function name is non-obvious. This function masks or unmasks an MSI
vector. Maybe call it msi_set_mask()?

> +{
> +    ERRP_GUARD();
> +    uint16_t flags =3D pci_get_word(dev->config + msi_flags_off(dev));
> +    bool msi64bit =3D flags & PCI_MSI_FLAGS_64BIT;
> +    uint32_t irq_state, vector_mask, pending;
> +
> +    if (vector > PCI_MSI_VECTORS_MAX) {
> +        error_setg(errp, "msi: vector %d not allocated. max vector is %d=
",
> +                   vector, PCI_MSI_VECTORS_MAX);
> +    }

Missing return statement?

> @@ -131,6 +136,31 @@ static void msix_handle_mask_update(PCIDevice *dev, =
int vector, bool was_masked)
>      }
>  }
> =20
> +void msix_set_irq_state(PCIDevice *dev, int vector, bool mask, Error **e=
rrp)

Same naming question here.

--BEkcujKRBQpp3vDd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmKnWAQACgkQnKSrs4Gr
c8hL/Af8Ce2Ifcr41HdNEjuUbN+Rh0Eu4XpP13vNiScJ2P9Q5B14vr5NM+T4qAOf
5vE9THHq2I4rd9Zh4zEm25ZkFgLdicepnweJAX2Cjk/ldb0usqU4G2U4nA4qOYfR
UEe/T71MgsD49r8ZbRBr89deHnhLfb7lL9iRbtuh4vwJKR369pFeOPAzBaD4Eqyy
KpzjHpBm1vvdEOYQjeEyavSzNZ8wryzyLpN7HFkW+bizgvTbO6gQW0x7+9CZrI+G
CkmT1Mna986CfaZznntmIhsq319wXonsKYZkKT+WOiBS2OJlVO0YpcNemUF+P3kv
lVErE9Dm6qNKIDD/OzUI/BsUUW90Wg==
=HS8m
-----END PGP SIGNATURE-----

--BEkcujKRBQpp3vDd--


