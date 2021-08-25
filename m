Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE6863F6E45
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Aug 2021 06:24:51 +0200 (CEST)
Received: from localhost ([::1]:54002 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIkT4-0000Y2-UC
	for lists+qemu-devel@lfdr.de; Wed, 25 Aug 2021 00:24:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53998)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mIkGf-0000ig-FW; Wed, 25 Aug 2021 00:12:01 -0400
Received: from ozlabs.org ([203.11.71.1]:35749)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mIkGc-0007UE-Mp; Wed, 25 Aug 2021 00:12:01 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4GvXbt6yw1z9t1r; Wed, 25 Aug 2021 14:11:38 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1629864698;
 bh=jTwg9+XuacKYhJ0n32F2I8kwoZWyJcwo/MKUqwtBpkQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=eON5lEqh31iebrujLcEH0l9Br/AmGFa61myc5aOyofLnJ/h8Ly1Yt/DkIG9LYo3bs
 /7+vRuZ6YM82ycfC2KOKv1GcACPwZujahjBRxjfve9GdaHxIGnOafi4z9+GhWBISWl
 rA7VqX/Xx5Ab5G1V+HUNO9WpuPjn4vUKcsvBTliE=
Date: Wed, 25 Aug 2021 13:49:40 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: [PATCH v7 2/7] spapr.c: handle dev->id in
 spapr_memory_unplug_rollback()
Message-ID: <YSW91BIewJYEwUcs@yekko>
References: <20210825004835.472919-1-danielhb413@gmail.com>
 <20210825004835.472919-3-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="wwOlwJUZSqsGqFFJ"
Content-Disposition: inline
In-Reply-To: <20210825004835.472919-3-danielhb413@gmail.com>
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: armbru@redhat.com, qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 groug@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--wwOlwJUZSqsGqFFJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 24, 2021 at 09:48:30PM -0300, Daniel Henrique Barboza wrote:
> As done in hw/acpi/memory_hotplug.c, pass an empty string if dev->id
> is NULL to qapi_event_send_mem_unplug_error() to avoid relying on
> a behavior that can be changed in the future.
>=20
> Suggested-by: Markus Armbruster <armbru@redhat.com>
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>

> ---
>  hw/ppc/spapr.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
> index 81699d4f8b..4f1ee90e9e 100644
> --- a/hw/ppc/spapr.c
> +++ b/hw/ppc/spapr.c
> @@ -3690,7 +3690,7 @@ void spapr_memory_unplug_rollback(SpaprMachineState=
 *spapr, DeviceState *dev)
>       */
>      qapi_error =3D g_strdup_printf("Memory hotunplug rejected by the gue=
st "
>                                   "for device %s", dev->id);
> -    qapi_event_send_mem_unplug_error(dev->id, qapi_error);
> +    qapi_event_send_mem_unplug_error(dev->id ? : "", qapi_error);
>  }
> =20
>  /* Callback to be called during DRC release. */

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--wwOlwJUZSqsGqFFJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmElvdQACgkQbDjKyiDZ
s5JcrA//fMmI6VQ/3rpId4gtUIMbgs7pBR2UuTaqnhW0QZfngJOg9iv4QOd1oPsk
5wHBjG5vsU2AQQGgeSGdpA1YqDNNr7w2Syg/5cKWy7yB8sqvRTDD3DSksVPOlmwq
64dK3MI68EWvL0YMc92rY7Dg4QzfzYoMpOgrZqwCNVN65Jkj+1IJWMUur3jJLiop
UUw+1KeOJA71x42Zq0QnxIJRgnXg76AcMdX4XiAS5qLoTyV3a6RJrZUcudNm0QoI
kzoKiCDX9F1u+bWw+iql2IoFZE81yj1dq42QYDXAOpCOmMohv/TMPcGZxnrS8Fn/
ezY4DWdiKu2lIesifX4QpKrqgamRqUZLfpZFWkkdrUsFH3hBK1Sd3I7aPKBE6t/h
VLzc9MgdINg+GFbCy5ETwC3eK1VVoVte24xWz41YR4JA/3U54gIj2sv9saLOZ4am
wfim2cLFC15K5hNKXygvoDVC1YlzPyER5ghYp+aMnfrebcbQ9L3hExuOTWga+bWg
u/QRFV+Dq4BUQaUeh9cR8PR6LMGfEYk6ecvwK1ZImBfed0/ai4gdpIBDy5cKUC/U
IgU8z0fBjz7d6nr1IigNFz++Wdh41NqlJPKJbitwFSkUZ7ybbtYXyGtgJKIeCgtD
0DfzOXIWhwVEmMGJBETD96WJQHdPAF55h3RMiJ/o25ctw5lePyk=
=5gME
-----END PGP SIGNATURE-----

--wwOlwJUZSqsGqFFJ--

