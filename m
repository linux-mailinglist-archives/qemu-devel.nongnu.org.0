Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A17942E865
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 07:27:46 +0200 (CEST)
Received: from localhost ([::1]:58246 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbFkv-00013I-Mt
	for lists+qemu-devel@lfdr.de; Fri, 15 Oct 2021 01:27:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48290)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <slp@redhat.com>) id 1mbFjy-00005D-Ft
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 01:26:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59568)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <slp@redhat.com>) id 1mbFjs-00081g-06
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 01:26:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634275597;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=aIp0Uo2BmO9o8V+9Mcqn8F7zXMGsbiJvb0UMGcZt3kg=;
 b=ihoaw9fvSztIoeLKwDpRZj9XAMxsDtex00mmuPBv1do/zZJzyI9Ae/gkc+A8O7AzuaKTAl
 i6jfbGTUm81KP15gihYu2GiEMlQiWQUG7wxUYg+fzgTlcfd3MU9++yJt+iPie++CkXcV8e
 3Z8AsyuVp0d8A+CZHHMorhg74AGUlc8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-295-oUOvSEXPN6KJNwM0AmHRyQ-1; Fri, 15 Oct 2021 01:26:33 -0400
X-MC-Unique: oUOvSEXPN6KJNwM0AmHRyQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 404151005315;
 Fri, 15 Oct 2021 05:26:32 +0000 (UTC)
Received: from localhost (unknown [10.33.36.13])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 183715F4E3;
 Fri, 15 Oct 2021 05:26:17 +0000 (UTC)
Date: Fri, 15 Oct 2021 07:26:16 +0200
From: Sergio Lopez <slp@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH] microvm: add device tree support.
Message-ID: <20211015052546.vrjcldk743pyr7je@mhamilton>
References: <20211014193617.2475578-1-kraxel@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211014193617.2475578-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=slp@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="3442fsofrpzrlv3n"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=slp@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
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
Cc: Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Willian Rampazzo <willianr@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--3442fsofrpzrlv3n
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 14, 2021 at 09:36:17PM +0200, Gerd Hoffmann wrote:
> Allows edk2 detect virtio-mmio devices and pcie ecam.
> See comment in hw/i386/microvm-dt.c for more details.
>=20
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> ---
>  hw/i386/microvm-dt.h               |   8 +
>  include/hw/i386/microvm.h          |   4 +
>  hw/i386/microvm-dt.c               | 341 +++++++++++++++++++++++++++++
>  hw/i386/microvm.c                  |   2 +
>  .gitlab-ci.d/buildtest.yml         |   1 -
>  configs/targets/i386-softmmu.mak   |   1 +
>  configs/targets/x86_64-softmmu.mak |   1 +
>  hw/i386/meson.build                |   2 +-
>  8 files changed, 358 insertions(+), 2 deletions(-)
>  create mode 100644 hw/i386/microvm-dt.h
>  create mode 100644 hw/i386/microvm-dt.c

Reviewed-by: Sergio Lopez <slp@redhat.com>

--3442fsofrpzrlv3n
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEvtX891EthoCRQuii9GknjS8MAjUFAmFpEPgACgkQ9GknjS8M
AjW2YA//arsiUfnJiNJ4TFbZHzxFxFaLKj8Io53bDp/3dQW6z2sjc6pxqxsa2CTm
EcYK8q3WzYHLDPzE1yCKfoVs3MLAYnUNl4Kp5lE0QuALMY9Y1JdOJto/3rLLkN5W
aGZd3b80UuBFJueAg8zoPTfQJMqRZb/Nz/drRWJ4jr6lby+cdfxPJKO0agyQE1fp
jMpiXK1QevYmPf+lQVgh7ioOErxXDFjvvSRaog8UE5HetopljkitJO083eHa6d7X
afNmBHgT7jka3Z4hx6NN9O/v2g+Tv0BUAoSmK288gzn/cAzC0Ttfh1pzR2MjtdsF
JJGyPqPxNArqPPfaWi+/s4k9kC8SQdD8WymzQpRmblhNhqP/t6cpWP2HTLBTFk65
wabetFNflu5vFGIDYlie5MtmsQ6hEc2TqY2BYeTiDZssiLWFNQqgtVaZeXD4n4Wt
VIGZy4GU+LjApCgWD3q1sWdyK7bZahXaak7GqknWGHdbXNDOZqT2tePn+3Qkh3zT
2n40Ct8gB8nWhrg5Ze89OcArgKCcIqUNzQO0hpq5R345yT57jSBlig1TnOvUi8Kf
y2Pl2/4a1d9BpL3Gq68szje2jCyIkdjDV00AOqi+Q9IY0ZDr/cvFX2U2HZtIGP2u
X6l8ZYZEuElH4JE0lF8kfu0HBuGxP5qEjlV3TQXSqFqKj87+L5s=
=kDkY
-----END PGP SIGNATURE-----

--3442fsofrpzrlv3n--


