Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 415E8392D8A
	for <lists+qemu-devel@lfdr.de>; Thu, 27 May 2021 14:05:37 +0200 (CEST)
Received: from localhost ([::1]:58624 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lmElc-0004LE-Am
	for lists+qemu-devel@lfdr.de; Thu, 27 May 2021 08:05:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44206)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <slp@redhat.com>) id 1lmE65-0007GC-D0
 for qemu-devel@nongnu.org; Thu, 27 May 2021 07:22:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42984)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <slp@redhat.com>) id 1lmE62-0003Dm-Rl
 for qemu-devel@nongnu.org; Thu, 27 May 2021 07:22:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622114554;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2G71iNdPDnnxJ99LNZyrlfpsy3MBTAdwVeIBbYeskNg=;
 b=ZWfGR920TyCNDH9gT8gSPxU9zSWfacyjjC0piwOyLGjXhvjiya/vFK0vIxwoN7kqiU/hlT
 P+udourjNy8F8a/inPfMIDuCkff+a/+62/uN+u+GW92RgX1I/mavEyXlhgjyIHI7n6CNm4
 s0fy3kF5cBq5dszv1z6XSPgNg++3VGs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-234-Gd366BCbNF2KD-Yexty4OQ-1; Thu, 27 May 2021 07:22:30 -0400
X-MC-Unique: Gd366BCbNF2KD-Yexty4OQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 74EA619251A0;
 Thu, 27 May 2021 11:22:29 +0000 (UTC)
Received: from localhost (unknown [10.33.36.9])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EAF4B5D9CC;
 Thu, 27 May 2021 11:22:28 +0000 (UTC)
Date: Thu, 27 May 2021 13:22:27 +0200
From: Sergio Lopez <slp@redhat.com>
To: Alexander Graf <agraf@csgraf.de>
Subject: Re: [PATCH v8 19/19] hvf: arm: Handle Windows 10 SMC call
Message-ID: <20210527112227.6l3rgc7vh7z3ytvu@mhamilton>
References: <20210519202253.76782-1-agraf@csgraf.de>
 <20210519202253.76782-20-agraf@csgraf.de>
MIME-Version: 1.0
In-Reply-To: <20210519202253.76782-20-agraf@csgraf.de>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=slp@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="ukllmniavdx67ftm"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=slp@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Peter Collingbourne <pcc@google.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Cameron Esfahani <dirty@apple.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, qemu-arm <qemu-arm@nongnu.org>,
 Frank Yang <lfy@google.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--ukllmniavdx67ftm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 19, 2021 at 10:22:53PM +0200, Alexander Graf wrote:
> Windows 10 calls an SMCCC call via SMC unconditionally on boot. It lives
> in the trusted application call number space, but its purpose is unknown.
>=20
> In our current SMC implementation, we inject a UDEF for unknown SMC calls=
,
> including this one. However, Windows breaks on boot when we do this. Inst=
ead,
> let's return an error code.
>=20
> With this patch applied I can successfully boot the current Windows 10
> Insider Preview in HVF.
>=20
> Signed-off-by: Alexander Graf <agraf@csgraf.de>
>=20
> ---
>=20
> v7 -> v8:
>=20
>   - fix checkpatch
> ---
>  target/arm/hvf/hvf.c | 4 ++++
>  1 file changed, 4 insertions(+)

Reviewed-by: Sergio Lopez <slp@redhat.com>
Tested-by: Sergio Lopez <slp@redhat.com>

--ukllmniavdx67ftm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEvtX891EthoCRQuii9GknjS8MAjUFAmCvgPMACgkQ9GknjS8M
AjU1vw//TJLbusVSORSbhQZOFSTffwc/6fwyzPTzuvrJdhinQBqEkAKDVn0J2UCT
Ri9JgXeyCFb1VMiJD25Yr9t5gqUlDYDJdVqfYYmYeD2bwVJozEIekkRM4HEhdl3t
EgaTpJTSRTePp7pxEzDQqt7EcGPLevPB9ksieOCYag3XrBpeFPV5mgt7iz+M+I53
mpgot6ugFBt4t19MeShlAlxrS0CRejsAP0Az/ZVw+uNNqfWp6bqOV2+STDAnG+CL
hQkM/w3Lmckq2kUTVzaL3YGiER5CJ9/PxGmVVBK8smh5F8Yo/xwdCTQXUJqWRfpw
Cqre41e0w8J4Yh5KjIui3pFwk8/3p+sKMGkXPdIFjw7LppWzXJ0mFw+U+CIQxtCN
R9hKClohz7aZC7r57uOQfqQmCDu9L0zyLz6kqOT6dqHfT9URl2qBpi4A9Zb35DYv
KecflvdwkOFaigY6gNbh7eID8fxcQiEcKN62PRmfJcV+L3lTClKzO+g3RwJuKjzj
j+goFDUb4xwxHLDAERVSe8FoORvpQcfCfsizUNIUmFOTfq6LpPhXl3Me8pKfTkZ4
yzLhFuX7ScdVZVoTx94A1wetAZVtsZjdk9ApaovtMnOiqYQqiwoVkEmLfx+GGY0U
dyR9s7MkiA88MmqMQ1bFfmPRXUU9tGfbnS4qH3ILdt5f3vA8USM=
=K++j
-----END PGP SIGNATURE-----

--ukllmniavdx67ftm--


