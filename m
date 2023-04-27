Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A5D546F0DB9
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Apr 2023 23:20:11 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ps91U-0006RF-SA; Thu, 27 Apr 2023 17:19:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1ps91Q-0006PM-Hw; Thu, 27 Apr 2023 17:19:26 -0400
Received: from mout.web.de ([212.227.17.12])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1ps91O-0006k9-R4; Thu, 27 Apr 2023 17:19:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
 t=1682630338; i=lukasstraub2@web.de;
 bh=Wa14Nz+b8PrHBwEkevdUcG4rofU0gZj6rBttq7mBUR0=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=MFVW/MTwHUZGcZC7M34kx74J2rRFzdhUb8/PM84q+ghlBfJ0F9crjV6ItHays7PCU
 4FRPixMKod1w/LRF1iqSF4tlo5iDm3zKCbq8EG1sIIKA9GLNrqH0XsHMc3VXpeJ58l
 Eou3iMXLaIaetSYaCAVg310+UocbcZrnATdXvr9MGbQwakK850Tw/9MDhG8vqAdJCR
 L2bNfDSXNeMnud+tapCpaRHB6STP02kRKHxo79+5heIiJbRGyhr5l0wsEgS8voJBdQ
 Lv3/xEs3xVn27LGz45l5yb7600gQvDcRHF8Ux/9QVC2YzojrH0/2ZpSCiyB46HABLU
 HniavUd9k07eQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from gecko.fritz.box ([82.207.254.107]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MTfol-1piQEp07UD-00UDaM; Thu, 27
 Apr 2023 23:18:58 +0200
Date: Thu, 27 Apr 2023 23:18:56 +0200
From: Lukas Straub <lukasstraub2@web.de>
To: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org, michael.roth@amd.com,
 armbru@redhat.com, eblake@redhat.com, jasowang@redhat.com,
 quintela@redhat.com, zhanghailiang@xfusion.com, philmd@linaro.org,
 thuth@redhat.com, berrange@redhat.com, marcandre.lureau@redhat.com,
 pbonzini@redhat.com, dave@treblig.org, hreitz@redhat.com, kwolf@redhat.com,
 chen.zhang@intel.com, lizhijian@fujitsu.com
Subject: Re: [PATCH v3 4/4] configure: add --disable-colo-proxy option
Message-ID: <20230427211856.54dd2997@gecko.fritz.box>
In-Reply-To: <20230427202946.1007276-5-vsementsov@yandex-team.ru>
References: <20230427202946.1007276-1-vsementsov@yandex-team.ru>
 <20230427202946.1007276-5-vsementsov@yandex-team.ru>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/tOk0rUoZj=AsT69w12v9+N7";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Provags-ID: V03:K1:2ZOAYECv6BG3+7BYrOnM6hGU9Yc9SzsOWxLJez9sKlIGbK1fHPk
 WcXveXipOaqMwjzz1gRqLkTT1Y8kA54pZPpXwvPpDmv627PpdLgvWJ2PntRQnti35r47i2s
 dC/tFoi57nrAbUIQHZLI36FeOvqksqdedhBdILXtFw9TJ9gCELcbt2ly0toGwaBBe17AyB+
 s1R70IeMhnytXQnScxxIA==
UI-OutboundReport: notjunk:1;M01:P0:mnWLTJZ7dJE=;WiPFJ9bR7q+iRa8CtQsyqLRapuz
 BJ8vmbczyAAUNRcOI0kBIVD3SuDB+UGv7DwrMj0n+oMRlN/b6v4nHt+USzL5E2OmbBZYkvLbn
 Bbwphb9nycoJ8INdRgPBF8Z3B928x+2d3XfBei9gAC4AWtZlhFYFfn+NqUm6Xvv1iOE18UqZd
 NHvGi43pQ2VH+/2b8J9VVNNH+P/ywLmBB3t899SErLuOOyww4OglMfzQLt0z3e5O7zWegbOSQ
 erAW/9kx3Mx3ruidG93nqhZbCq5SrLHUtCQMAPM6NzabQxtRJlA9pPeuGpwHbtWLR+5yKBEXL
 kbCgjVGWGrsNOM13Sqq4EnMG3AGwJyTjOs9GqY6bGlSovtNqYjp7K9O6YpQ3aLOEmBWM2TH4w
 QH2Fayb+O4ITTOQrLITcWKLd2vbI/JNYLnIrvxwSgnm6N5MKCzMsxIM9hYawL0HddR6BwiGdx
 ICh5meLQCDsnR5/PlGb/BBzAFDQ7S9paXkCn5RKsXssJrbXPKpRkfcYEL7KWyQxVsLcqzn7PK
 6prWA7nItdDZyCZ+X1M8H9Tn9uCxLQMAp1WQmBHu7hqUYN/id609rudhRbWnplrcQWTOWCweI
 Gi4w5ptjg/DAsQ+osmzpoLiMwWA/9wKtIOA9fb4qw5mIc/a5j5+p6mzgdoGcmG2VE3WZXXF4w
 qPFciA9sqPz0OMntlQ5UqkfA0/s91Z3wwaPk4nisf4MUBG1OdKVbgjFCoh3wHVTlHbdKaAld3
 Ym9p6lqcPZSLRy3vo/2zoP6Aw5YS4ld+JHa7hboR8UA5Hduz6YvYPOu58QIEDSFYLyObZbU6/
 VxisQIwk8hb/gACtJ2F2f7Z5UUt6vFEc4n+CZvXZHasRVjTKQ73r4mPS6G59Bo8tAFX3XummM
 uwA+9QdSOkzqfqUXJj79UnCyl92zA5/CSblFbUXw//TXvjmnMbjHC+BP60lIlR1br9h2wxvmr
 N2e3Kn97JMGImkg77ShRgA0AJMU=
Received-SPF: pass client-ip=212.227.17.12; envelope-from=lukasstraub2@web.de;
 helo=mout.web.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

--Sig_/tOk0rUoZj=AsT69w12v9+N7
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Thu, 27 Apr 2023 23:29:46 +0300
Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru> wrote:

> Add option to not build filter-mirror, filter-rewriter and
> colo-compare when they are not needed.
>=20
> There could be more agile configuration, for example add separate
> options for each filter, but that may be done in future on demand. The
> aim of this patch is to make possible to disable the whole COLO Proxy
> subsystem.
>=20
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
> ---
>  meson_options.txt             |  2 ++
>  net/meson.build               | 14 ++++++++++----
>  scripts/meson-buildoptions.sh |  3 +++
>  stubs/colo-compare.c          |  7 +++++++
>  stubs/meson.build             |  1 +
>  5 files changed, 23 insertions(+), 4 deletions(-)
>  create mode 100644 stubs/colo-compare.c
>=20
> diff --git a/meson_options.txt b/meson_options.txt
> index 2471dd02da..b59e7ae342 100644
> --- a/meson_options.txt
> +++ b/meson_options.txt
> @@ -289,6 +289,8 @@ option('live_block_migration', type: 'feature', value=
: 'auto',
>         description: 'block migration in the main migration stream')
>  option('replication', type: 'feature', value: 'auto',
>         description: 'replication support')
> +option('colo_proxy', type: 'feature', value: 'auto',
> +       description: 'colo-proxy support')
>  option('bochs', type: 'feature', value: 'auto',
>         description: 'bochs image format support')
>  option('cloop', type: 'feature', value: 'auto',
> diff --git a/net/meson.build b/net/meson.build
> index 87afca3e93..4cfc850c69 100644
> --- a/net/meson.build
> +++ b/net/meson.build
> @@ -1,13 +1,9 @@
>  softmmu_ss.add(files(
>    'announce.c',
>    'checksum.c',
> -  'colo-compare.c',
> -  'colo.c',
>    'dump.c',
>    'eth.c',
>    'filter-buffer.c',
> -  'filter-mirror.c',
> -  'filter-rewriter.c',
>    'filter.c',
>    'hub.c',
>    'net-hmp-cmds.c',
> @@ -19,6 +15,16 @@ softmmu_ss.add(files(
>    'util.c',
>  ))
> =20
> +if get_option('replication').allowed() or \
> +    get_option('colo_proxy').allowed()
> +  softmmu_ss.add(files('colo-compare.c'))
> +  softmmu_ss.add(files('colo.c'))
> +endif
> +
> +if get_option('colo_proxy').allowed()
> +  softmmu_ss.add(files('filter-mirror.c', 'filter-rewriter.c'))
> +endif
> +

The last discussion didn't really come to a conclusion, but I still
think that 'filter-mirror.c' (which also contains filter-redirect)
should be left unchanged.

>  softmmu_ss.add(when: 'CONFIG_TCG', if_true: files('filter-replay.c'))
> =20
>  if have_l2tpv3
> diff --git a/scripts/meson-buildoptions.sh b/scripts/meson-buildoptions.sh
> index d4369a3ad8..036047ce6f 100644
> --- a/scripts/meson-buildoptions.sh
> +++ b/scripts/meson-buildoptions.sh
> @@ -83,6 +83,7 @@ meson_options_help() {
>    printf "%s\n" '  capstone        Whether and how to find the capstone =
library'
>    printf "%s\n" '  cloop           cloop image format support'
>    printf "%s\n" '  cocoa           Cocoa user interface (macOS only)'
> +  printf "%s\n" '  colo-proxy      colo-proxy support'
>    printf "%s\n" '  coreaudio       CoreAudio sound support'
>    printf "%s\n" '  crypto-afalg    Linux AF_ALG crypto backend driver'
>    printf "%s\n" '  curl            CURL block device driver'
> @@ -236,6 +237,8 @@ _meson_option_parse() {
>      --disable-cloop) printf "%s" -Dcloop=3Ddisabled ;;
>      --enable-cocoa) printf "%s" -Dcocoa=3Denabled ;;
>      --disable-cocoa) printf "%s" -Dcocoa=3Ddisabled ;;
> +    --enable-colo-proxy) printf "%s" -Dcolo_proxy=3Denabled ;;
> +    --disable-colo-proxy) printf "%s" -Dcolo_proxy=3Ddisabled ;;
>      --enable-coreaudio) printf "%s" -Dcoreaudio=3Denabled ;;
>      --disable-coreaudio) printf "%s" -Dcoreaudio=3Ddisabled ;;
>      --enable-coroutine-pool) printf "%s" -Dcoroutine_pool=3Dtrue ;;
> diff --git a/stubs/colo-compare.c b/stubs/colo-compare.c
> new file mode 100644
> index 0000000000..ec726665be
> --- /dev/null
> +++ b/stubs/colo-compare.c
> @@ -0,0 +1,7 @@
> +#include "qemu/osdep.h"
> +#include "qemu/notify.h"
> +#include "net/colo-compare.h"
> +
> +void colo_compare_cleanup(void)
> +{
> +}
> diff --git a/stubs/meson.build b/stubs/meson.build
> index 8412cad15f..a56645e2f7 100644
> --- a/stubs/meson.build
> +++ b/stubs/meson.build
> @@ -46,6 +46,7 @@ stub_ss.add(files('target-monitor-defs.c'))
>  stub_ss.add(files('trace-control.c'))
>  stub_ss.add(files('uuid.c'))
>  stub_ss.add(files('colo.c'))
> +stub_ss.add(files('colo-compare.c'))
>  stub_ss.add(files('vmstate.c'))
>  stub_ss.add(files('vm-stop.c'))
>  stub_ss.add(files('win32-kbd-hook.c'))



--=20


--Sig_/tOk0rUoZj=AsT69w12v9+N7
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEg/qxWKDZuPtyYo+kNasLKJxdslgFAmRK5sAACgkQNasLKJxd
slixyA/9Hoq26W7dt3lHcEcWs27KeL26RTckWuFDRpIxeImg31qsMOQ0QgGIeV+l
h6Ho+dXR+H0OfC3pNyno0PXofcNp97e8GFdkoCX6Jq6DZXAO5Kf/8ZnhL/EHKR/f
AE2+oFfLJKk93x2OcaegHZ67VAVMF+bvZHseZ/zkIsHew5F+8VgjrwOGAbdffg1N
BtUKIDTKWFrxJzd8MtN7ZANiqGiQFQ07XUZgOM/Eh/ERKuRjkURapZmc5vCsfqpn
5MpiDJxH/7W8Bl4PxUpo2ViGDoM2I1JLVI3Q/5GsouXmT8SyW+Eo3aVC2X9aO/Ne
n0gdt7sWVBwW6veeJTUf6mF1P2JLLoFVPcqLTE3cw4lwGLR3euu3FH70r8Sl9Ec9
bk563Nk4EpEmm/+ueEzIN9Mg1lIonqVvTZkgtKsRMGmI3zN8uVITe3kelDncIKcj
bBCBsPEF4detKwgCk4Kr5FfGdVmRbV1pOjxe/uH85nhf6nuMngqziOGN2zjSAARj
XPIDwRdh7waD+zFOcUexr7K0aqkstRmE8yZoB6nZGzHMIu37OOTkzYAH24gujboP
/iPGimFfoG88gkSKdpw4j32Ym46awq+5f1ZBPC35prwgkfJvhDih1FITW1cXUZn2
mxDMPYoWl6DeIwv3UQHyTJ9OFX5XnfUecVl5NAQxYgb3NlPRDhs=
=3WGl
-----END PGP SIGNATURE-----

--Sig_/tOk0rUoZj=AsT69w12v9+N7--

