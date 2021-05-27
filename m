Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BDA7392C3B
	for <lists+qemu-devel@lfdr.de>; Thu, 27 May 2021 12:59:51 +0200 (CEST)
Received: from localhost ([::1]:52790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lmDjy-0003MW-5C
	for lists+qemu-devel@lfdr.de; Thu, 27 May 2021 06:59:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59394)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <slp@redhat.com>) id 1lmD8X-0006HE-C1
 for qemu-devel@nongnu.org; Thu, 27 May 2021 06:21:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23447)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <slp@redhat.com>) id 1lmD88-0002vT-Nr
 for qemu-devel@nongnu.org; Thu, 27 May 2021 06:21:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622110844;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+Xo0zbAaNDKEmv508LNbp9yEKVEdXWBdj8hvxM1Jhak=;
 b=BI300EfXK10vA06ipxlZwdkcIHXMfnfsx9aNZ5GfqGyT+nUwVWpjMDOWNMtrxgx8Pr8TRJ
 45fwPOcUxil9LlqkS5PniwJomylXHm1CG1m9Dsc+gZFLCZk0kZc8lA72tY8zjQKoOSmh0h
 UkBqsqRYASo3kN/5AcWBUOSvY5xekwY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-593-cDFSVpfCMBKWsu5re3Sdig-1; Thu, 27 May 2021 06:20:40 -0400
X-MC-Unique: cDFSVpfCMBKWsu5re3Sdig-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 994F1104FB68;
 Thu, 27 May 2021 10:20:38 +0000 (UTC)
Received: from localhost (unknown [10.33.36.9])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 362886EF40;
 Thu, 27 May 2021 10:20:38 +0000 (UTC)
Date: Thu, 27 May 2021 12:20:37 +0200
From: Sergio Lopez <slp@redhat.com>
To: Alexander Graf <agraf@csgraf.de>
Subject: Re: [PATCH v8 12/19] hvf: Simplify post reset/init/loadvm hooks
Message-ID: <20210527102037.szj6iayshnm4zryx@mhamilton>
References: <20210519202253.76782-1-agraf@csgraf.de>
 <20210519202253.76782-13-agraf@csgraf.de>
MIME-Version: 1.0
In-Reply-To: <20210519202253.76782-13-agraf@csgraf.de>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=slp@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="yjfj6hhlgtiblote"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=slp@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Peter Collingbourne <pcc@google.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Cameron Esfahani <dirty@apple.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, qemu-arm <qemu-arm@nongnu.org>,
 Frank Yang <lfy@google.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--yjfj6hhlgtiblote
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 19, 2021 at 10:22:46PM +0200, Alexander Graf wrote:
> The hooks we have that call us after reset, init and loadvm really all
> just want to say "The reference of all register state is in the QEMU
> vcpu struct, please push it".
>=20
> We already have a working pushing mechanism though called cpu->vcpu_dirty=
,
> so we can just reuse that for all of the above, syncing state properly th=
e
> next time we actually execute a vCPU.
>=20
> This fixes PSCI resets on ARM, as they modify CPU state even after the
> post init call has completed, but before we execute the vCPU again.
>=20
> To also make the scheme work for x86, we have to make sure we don't
> move stale eflags into our env when the vcpu state is dirty.
>=20
> Signed-off-by: Alexander Graf <agraf@csgraf.de>
> Reviewed-by: Roman Bolshakov <r.bolshakov@yadro.com>
> Tested-by: Roman Bolshakov <r.bolshakov@yadro.com>
> ---
>  accel/hvf/hvf-accel-ops.c | 27 +++++++--------------------
>  target/i386/hvf/x86hvf.c  |  5 ++++-
>  2 files changed, 11 insertions(+), 21 deletions(-)

Reviewed-by: Sergio Lopez <slp@redhat.com>

--yjfj6hhlgtiblote
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEvtX891EthoCRQuii9GknjS8MAjUFAmCvcnQACgkQ9GknjS8M
AjXqgw/7BZGeNexSue/1jX/5eamme5wbatNQK7Przwvaws+hDzuRJjNQERB51Om2
17+tOVDWW0Sz17/l8/JTjEzHdWEwrQw/EQrlWsFa5RyyTQc/yfjUlp546+OKAXqI
hqDQ3kLC5c1k4lke23uAJf/LgKadls6Oj2frZO/bgf1NWimND0KbGSYlrOkaZXLz
DOM8BRtB0sdSjM9JcgCuoZy7rP5EMd1jrS95C4N9Fur041NRAimcEiCTkhunnCQf
GSTIhyY5QphOvkub7IAjpcXvC8efOHFZRg7dYP6b3/kCzVl/jy87Sdz2JF5sr09h
AgZ2GHsOQShuFdU3HtvYKa+8nrdz/Jz+zIEl9lCcURwFTkGliCf3qVuwTvuyqSZU
Yo6VPJAxHpXpVbDL7plxR5+KkKdpaKOApN0QoY0TOVE5nNsGEWylY0DnYFXLasN0
2NNbzx0ZzhlNiPMeHVFRIuKOkSxmqLD78i9hUvv3LgCxvj1bxeZuAOT70M8pLHrJ
9BX3Wgr8FEm1IJKPGlMk+6Csa7M6bGUCPVDhkrjP4VZ9mj2mjDiHS0pMS4p/aRll
E0BvZTOepuS23tTSBVFRYD6u8XvNOqQ7sfmWLQCaXnNNTQEaKVIDXaHGWuuDuVts
pWT8EZPa5KMm0f+nR0WICevkGxG9XSCq3Oa04DuC/6LUAxDAVAg=
=4dYb
-----END PGP SIGNATURE-----

--yjfj6hhlgtiblote--


