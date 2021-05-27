Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A071392BCF
	for <lists+qemu-devel@lfdr.de>; Thu, 27 May 2021 12:28:01 +0200 (CEST)
Received: from localhost ([::1]:53642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lmDF4-0008V8-W4
	for lists+qemu-devel@lfdr.de; Thu, 27 May 2021 06:27:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55422)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <slp@redhat.com>) id 1lmCr7-0004Fg-Pd
 for qemu-devel@nongnu.org; Thu, 27 May 2021 06:03:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57324)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <slp@redhat.com>) id 1lmCqy-0001Wr-9B
 for qemu-devel@nongnu.org; Thu, 27 May 2021 06:03:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622109779;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=RbdBYtYYmD/Jp6XAnLtlm5OCID7BX/E93BpnzgIQC3U=;
 b=fkiTautCldON9hU79x5W75fbRVP6rhxHB9Cjl40GmDMPSOfGzncJJInl/fADMv0QBWJepp
 zm9XExOQY0nJG28cPXgqCwsf7FE7Gxx3a56k30CT0TdcrmO0whgmJ7AyUWMlLE12ml/kp9
 WaiLOVkFYKl2/yv/NekvjGbcVOCd824=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-216-kgtrcQdaMKyxHQumpecA7g-1; Thu, 27 May 2021 06:02:55 -0400
X-MC-Unique: kgtrcQdaMKyxHQumpecA7g-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CE741189C44D;
 Thu, 27 May 2021 10:02:53 +0000 (UTC)
Received: from localhost (unknown [10.33.36.9])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6D4155D9C6;
 Thu, 27 May 2021 10:02:53 +0000 (UTC)
Date: Thu, 27 May 2021 12:02:52 +0200
From: Sergio Lopez <slp@redhat.com>
To: Alexander Graf <agraf@csgraf.de>
Subject: Re: [PATCH v8 03/19] hvf: Move cpu functions into common directory
Message-ID: <20210527100252.lpaez7jvy77f6mru@mhamilton>
References: <20210519202253.76782-1-agraf@csgraf.de>
 <20210519202253.76782-4-agraf@csgraf.de>
MIME-Version: 1.0
In-Reply-To: <20210519202253.76782-4-agraf@csgraf.de>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=slp@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="ioebppql4n2w2rzm"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=slp@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Peter Collingbourne <pcc@google.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Cameron Esfahani <dirty@apple.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, qemu-arm <qemu-arm@nongnu.org>,
 Frank Yang <lfy@google.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--ioebppql4n2w2rzm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 19, 2021 at 10:22:37PM +0200, Alexander Graf wrote:
> Until now, Hypervisor.framework has only been available on x86_64 systems=
.
> With Apple Silicon shipping now, it extends its reach to aarch64. To
> prepare for support for multiple architectures, let's start moving common
> code out into its own accel directory.
>=20
> This patch moves CPU and memory operations over. While at it, make sure
> the code is consumable on non-i386 systems.
>=20
> Signed-off-by: Alexander Graf <agraf@csgraf.de>
> ---
>  accel/hvf/hvf-accel-ops.c  | 308 ++++++++++++++++++++++++++++++++++++-
>  include/sysemu/hvf_int.h   |   4 +
>  target/i386/hvf/hvf-i386.h |   2 -
>  target/i386/hvf/hvf.c      | 302 ------------------------------------
>  target/i386/hvf/x86hvf.h   |   2 -
>  5 files changed, 311 insertions(+), 307 deletions(-)

Reviewed-by: Sergio Lopez <slp@redhat.com>

--ioebppql4n2w2rzm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEvtX891EthoCRQuii9GknjS8MAjUFAmCvbksACgkQ9GknjS8M
AjXBMxAAp4u4hd/WBUZPNvLn0dCqaYvkZkt7HRtzFM88QcZ/RVr3MhqBvLLmQgrE
LRc3UMFI99TQTGuyb2cxFE8+fm6kCp1E7VJcY82bDvOja/XelddmblA22JGl+ho+
nyfijgUAcwtnLyLuMxgVJUqsszJ0jema3RAtRNRDipiITjHizNm+Y5Etmekv8YGj
MG4WO4XEX3fMlQNFE40ZKAqweRCrnRNGlYQL5/GROk4D8i9T6TwtDkNZe/UxraPi
IYGRkVqkZHxTVQIXKovO3AN7jUCVkes0DGWBBSLxkiEbLN3o6SNYw0AYeZpbxUXf
2UtcIoKjSS+V6NIOdGUakx1YZ3WZfDdS/oxg7Uivm4hCpTLudRv8O54ovQkChjSv
4IUgUboM7pZMmHAtrvd9QArpR8yVXGaHmV+EWar/vNxNVInt9IdvDzQEju387D1q
rrds6DN4WzDDXZ2KIZdLgl3rZHlJpJ0xjDsoR5VjVghs6JrREvKVDvWxPEBHTq6M
mO3k8K+1AZ4H7LQYaSAvlyaEt21UsVa1fZIKghtDsZvzufyYtTqN3oJC9Okfr7ju
tL+W4MyPMD6sZsD9yWdmzvSeo4MlRy0IOBEwu4EbzRDHYtfvZrlmXRxgVlJl7JPp
N5JWFTbRSclM8Dc8gZrxOL610KjIao0y7/Piab4rXYA4o+uRbbI=
=CTzM
-----END PGP SIGNATURE-----

--ioebppql4n2w2rzm--


