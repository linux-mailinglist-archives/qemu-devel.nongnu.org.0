Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1CE96E8F90
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 12:10:26 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppREf-0006WN-Mc; Thu, 20 Apr 2023 06:09:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1ppREd-0006VU-IK; Thu, 20 Apr 2023 06:09:51 -0400
Received: from mout.web.de ([212.227.17.11])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1ppREb-0007FE-Gl; Thu, 20 Apr 2023 06:09:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
 t=1681985364; i=lukasstraub2@web.de;
 bh=K+1H05wDJheDbYjKYTCbsw1CaLKFToLi2piF96jRxRA=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=oLX5KuOrACe97MNfuK053zlWIMrbZi3Yb44pKE5lnoC6a43FHbG6eM5nhbTIGQkhC
 FVkMUoSS5wu3HBQbXSYhUOuwDixqfuavThj1q9/bmFYUgZKFnaiZl8V78bYJ4ErvCc
 lNxNoLFihG0vpXyOYdHz2AdtJjguz0CP/JPktXPuW2wkDJ10sYAdrvUkQAoQ2XcjyA
 LXDNwZTmINwp4gW4biEXX3IVp+ysBpP6FacGausVcxYebfdkFeAUjgAEkL4Oo2Qxmu
 hCb7Ep9bWYGz6cmO7dohVs/HXducO/QawPbHlLft9pTEAIfTUUhIWR2BOyVzSPi8uK
 iJYp/4Ai4p4hA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from gecko.fritz.box ([82.207.254.123]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MG994-1q5yZ62txc-00GsE0; Thu, 20
 Apr 2023 12:09:24 +0200
Date: Thu, 20 Apr 2023 12:09:21 +0200
From: Lukas Straub <lukasstraub2@web.de>
To: "Zhang, Chen" <chen.zhang@intel.com>
Cc: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-block@nongnu.org"
 <qemu-block@nongnu.org>, "michael.roth@amd.com" <michael.roth@amd.com>,
 "armbru@redhat.com" <armbru@redhat.com>, "eblake@redhat.com"
 <eblake@redhat.com>, "jasowang@redhat.com" <jasowang@redhat.com>,
 "quintela@redhat.com" <quintela@redhat.com>, "Zhang, Hailiang"
 <zhanghailiang@xfusion.com>, "philmd@linaro.org" <philmd@linaro.org>,
 "thuth@redhat.com" <thuth@redhat.com>, "berrange@redhat.com"
 <berrange@redhat.com>, "marcandre.lureau@redhat.com"
 <marcandre.lureau@redhat.com>, "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "dave@treblig.org" <dave@treblig.org>, "hreitz@redhat.com"
 <hreitz@redhat.com>, "kwolf@redhat.com" <kwolf@redhat.com>,
 "lizhijian@fujitsu.com" <lizhijian@fujitsu.com>
Subject: Re: [PATCH v2 4/4] configure: add --disable-colo-filters option
Message-ID: <20230420100921.63b1e51b@gecko.fritz.box>
In-Reply-To: <MWHPR11MB0031567319A3C4CE499F3CF99B639@MWHPR11MB0031.namprd11.prod.outlook.com>
References: <20230419225232.508121-1-vsementsov@yandex-team.ru>
 <20230419225232.508121-5-vsementsov@yandex-team.ru>
 <MWHPR11MB0031567319A3C4CE499F3CF99B639@MWHPR11MB0031.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/B+Gx.od59WH+2AQN1vSW0A.";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Provags-ID: V03:K1:Jt/Dq1e+JTUW1oy77+4jrFSb8EQ/eEX8IuMbvFzil0SvG8KH1dV
 LdZzqcELX1rZInwC+0CdLPeXPGokm2rnLGTpjfmVMQ5IytSh0Bq7kUwRthjpb6y3swrCrsc
 UMrzMymR2QS8EFeLHWFqFzD3+uQPxWFSFX/yR1tx+xSX7mH3bR6aTTKrZqJTeRawtq7kFiz
 nBQqMcRHkoaiyXKgLGVmA==
UI-OutboundReport: notjunk:1;M01:P0:NmfMvi+ZgtM=;/mQMKhY9b4UgbUsI8/kv7bPHgfq
 GyONfKdGMJy9204KDsb0Kg+K47ONJYUCx5vxXmpGTJy8GP4dBI7L63kqHdqSGyb8PApJJY9d5
 8c/eButzrTQbZHxrkkZXFnz/rxl+c95oAPFBw8GbsTN8lkQ54+92Ammr3QbKcLyWiovgm1Sap
 3N9Ew6wcMeokxDEM50EN+a203HXCQm8JPbm7KDp1VPn85otty0KmDJIvEGaytUZOC367G1FmY
 sOQ35f44QrYWmmIM0zeyEc+JUVKVNqjI4MyWQnGWLGOZcLkAhzThhP6WD5sGMkk4rD4ZXYpVs
 YMO2v586ZD7LQFWtwpiS1ZRqV7d4C5nvWnewzdXQf84cRj5zsYeMQZv/ynyrjc6BQzxwig+/v
 RtqFSjHJiBayOHUITC62Qz1JwALBEcdVsqkawyfKOdygV0lS38ZX5Io5cDxBACz+05rEe739z
 6yKz9egnLYWiEX7S8Rv54i5tgVAVgw7CdigZS5406HBA2ej0x5USIVegsjpk026F8hG6SJO62
 U0+rkHbZQA8XUNhylNYZkXMpHUsZzc2xgHazEZK3XJpphtWue2NF3yG0BT1FBZLdJypduSk3b
 RBZ+90wLsjCtGp9mIdG2SaIuS1b2tslrusiXJCi/olxW88eSmh2jwIn4hNsPEmlSY3d4T/bcF
 kpaoPTxFJnoaoVs81aFRfHRHftDlBDmCWWc4TG5uD4P7FuR8FTCEuQbBPn+pB1wYt+1B0ecB+
 BkvM8VeTZ68O57BjcHuBAGN5id8EsalIHmjNwFZQZhNZ/8GlmBCQJ5IUvsmxRAbnriu20j5Av
 WRLXwq4x/q0x3WCGrZl1Mh6f3y9BmWlgdTIWrzcjchlcGgXtIVKqIDczeHm2Q8m5iC9ZW3mXU
 8qd08EI0qHw2iGRhfGBkkz7trOqG3uZvj+SEg98uHP1C4neacW7oog51N3R+fr7d/gX5236ML
 oN6MkjvxXJ2Fwy6zkq0U0y38TLM=
Received-SPF: pass client-ip=212.227.17.11; envelope-from=lukasstraub2@web.de;
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

--Sig_/B+Gx.od59WH+2AQN1vSW0A.
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Thu, 20 Apr 2023 09:09:48 +0000
"Zhang, Chen" <chen.zhang@intel.com> wrote:

> > -----Original Message-----
> > From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
> > Sent: Thursday, April 20, 2023 6:53 AM
> > To: qemu-devel@nongnu.org
> > Cc: qemu-block@nongnu.org; michael.roth@amd.com; armbru@redhat.com;
> > eblake@redhat.com; jasowang@redhat.com; quintela@redhat.com; Zhang,
> > Hailiang <zhanghailiang@xfusion.com>; philmd@linaro.org;
> > thuth@redhat.com; berrange@redhat.com; marcandre.lureau@redhat.com;
> > pbonzini@redhat.com; dave@treblig.org; hreitz@redhat.com;
> > kwolf@redhat.com; Zhang, Chen <chen.zhang@intel.com>;
> > lizhijian@fujitsu.com; Vladimir Sementsov-Ogievskiy <vsementsov@yandex-=
 =20
> > team.ru> =20
> > Subject: [PATCH v2 4/4] configure: add --disable-colo-filters option
> >=20
> > Add option to not build COLO Proxy subsystem if it is not needed. =20
>=20
> I think no need to add the --disable-colo-filter option.
> Net-filters just general infrastructure. Another example is COLO also
> use the -chardev socket to connect each filters. No need to add the --dis=
able-colo-chardev....
> Please drop this patch.=20
> But for COLO network part, still something need to do:
> You can add --disable-colo-proxy not to build the net/colo-compare.c  if =
it is not needed.
> This file just for COLO and not belong to network filters.

And net/filter-rewriter.c is just for COLO too.

So in summary just drop net/filter-mirror.c from this patch?

>=20
> Thanks
> Chen
>=20
> >=20
> > Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
> > ---
> >  meson.build                   |  1 +
> >  meson_options.txt             |  2 ++
> >  net/meson.build               | 11 ++++++++---
> >  scripts/meson-buildoptions.sh |  3 +++
> >  4 files changed, 14 insertions(+), 3 deletions(-)
> >=20
> > diff --git a/meson.build b/meson.build
> > index c44d05a13f..5b2fdfbd3a 100644
> > --- a/meson.build
> > +++ b/meson.build
> > @@ -1962,6 +1962,7 @@ config_host_data.set('CONFIG_GPROF',
> > get_option('gprof'))
> > config_host_data.set('CONFIG_LIVE_BLOCK_MIGRATION',
> > get_option('live_block_migration').allowed())
> >  config_host_data.set('CONFIG_QOM_CAST_DEBUG',
> > get_option('qom_cast_debug'))
> > config_host_data.set('CONFIG_REPLICATION',
> > get_option('replication').allowed())
> > +config_host_data.set('CONFIG_COLO_FILTERS',
> > +get_option('colo_filters').allowed())
> >=20
> >  # has_header
> >  config_host_data.set('CONFIG_EPOLL', cc.has_header('sys/epoll.h')) dif=
f --git
> > a/meson_options.txt b/meson_options.txt index fc9447d267..ffe81317cb
> > 100644
> > --- a/meson_options.txt
> > +++ b/meson_options.txt
> > @@ -289,6 +289,8 @@ option('live_block_migration', type: 'feature', val=
ue:
> > 'auto',
> >         description: 'block migration in the main migration stream')
> > option('replication', type: 'feature', value: 'auto',
> >         description: 'replication support')
> > +option('colo_filters', type: 'feature', value: 'auto',
> > +       description: 'colo_filters support')
> >  option('bochs', type: 'feature', value: 'auto',
> >         description: 'bochs image format support')  option('cloop', typ=
e: 'feature',
> > value: 'auto', diff --git a/net/meson.build b/net/meson.build index
> > 38d50b8c96..7e54744aea 100644
> > --- a/net/meson.build
> > +++ b/net/meson.build
> > @@ -1,12 +1,9 @@
> >  softmmu_ss.add(files(
> >    'announce.c',
> >    'checksum.c',
> > -  'colo.c',
> >    'dump.c',
> >    'eth.c',
> >    'filter-buffer.c',
> > -  'filter-mirror.c',
> > -  'filter-rewriter.c',
> >    'filter.c',
> >    'hub.c',
> >    'net-hmp-cmds.c',
> > @@ -22,6 +19,14 @@ if get_option('replication').allowed()
> >    softmmu_ss.add(files('colo-compare.c'))
> >  endif
> >=20
> > +if get_option('replication').allowed() or
> > +get_option('colo_filters').allowed()
> > +  softmmu_ss.add(files('colo.c'))
> > +endif
> > +
> > +if get_option('colo_filters').allowed()
> > +  softmmu_ss.add(files('filter-mirror.c', 'filter-rewriter.c')) endif
> > +
> >  softmmu_ss.add(when: 'CONFIG_TCG', if_true: files('filter-replay.c'))
> >=20
> >  if have_l2tpv3
> > diff --git a/scripts/meson-buildoptions.sh b/scripts/meson-buildoptions=
.sh
> > index 009fab1515..cf9d23369f 100644
> > --- a/scripts/meson-buildoptions.sh
> > +++ b/scripts/meson-buildoptions.sh
> > @@ -83,6 +83,7 @@ meson_options_help() {
> >    printf "%s\n" '  capstone        Whether and how to find the capston=
e library'
> >    printf "%s\n" '  cloop           cloop image format support'
> >    printf "%s\n" '  cocoa           Cocoa user interface (macOS only)'
> > +  printf "%s\n" '  colo-filters    colo_filters support'
> >    printf "%s\n" '  coreaudio       CoreAudio sound support'
> >    printf "%s\n" '  crypto-afalg    Linux AF_ALG crypto backend driver'
> >    printf "%s\n" '  curl            CURL block device driver'
> > @@ -236,6 +237,8 @@ _meson_option_parse() {
> >      --disable-cloop) printf "%s" -Dcloop=3Ddisabled ;;
> >      --enable-cocoa) printf "%s" -Dcocoa=3Denabled ;;
> >      --disable-cocoa) printf "%s" -Dcocoa=3Ddisabled ;;
> > +    --enable-colo-filters) printf "%s" -Dcolo_filters=3Denabled ;;
> > +    --disable-colo-filters) printf "%s" -Dcolo_filters=3Ddisabled ;;
> >      --enable-coreaudio) printf "%s" -Dcoreaudio=3Denabled ;;
> >      --disable-coreaudio) printf "%s" -Dcoreaudio=3Ddisabled ;;
> >      --enable-coroutine-pool) printf "%s" -Dcoroutine_pool=3Dtrue ;;
> > --
> > 2.34.1 =20
>=20
>=20



--=20


--Sig_/B+Gx.od59WH+2AQN1vSW0A.
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEg/qxWKDZuPtyYo+kNasLKJxdslgFAmRBD1EACgkQNasLKJxd
slgnbw/6A6fMFCU38dPJJfa/Vr0hG1d5kcDvHws6wCBABlK1yVXhPwTG0LV29RRh
znvFCfXFy+0oCCYG/yaO++ZPK8IjLIxt/Q7T674Q1IsWISJVi+t3zuvSnwVxRGAf
ptHW9+GTsCzNhcYGT1nwCEQjbpae3NHISxGtU3PrLQ3WiTwyBdr/Qlm9ow7mO+jq
g0/FRq0SFTsuI2YYllXTATLhdyR23D1ii9m+zeI4ARCnFM1B8DLR0MidzHBfoqgL
fIJ/1/jNJaGhySg21okbeNIsIEAxnPR9Xom+NyBAJ76eY+phy97b2ASQWM6lyK4e
wVEPEAhjfJNkdwY8GJmNoctcje46veQr0d2NIE33HMx7gOfxeKgZri5MM3GlIRam
Yy+zO4pdNDX4ZeyreY5MGrb3XVHelySZyaiqhpfzzDvnn1pQN1kgadY+bLLEj/kW
Ho4t1oid5JaHiRDpxeNEXy1XZOwB8zB1xNPYZRvAlyloeLyFb7dq7RfYJju3Hlxs
gSs9i1HqvyNcwsI3hkIbznMcOtsANNRGMi+3mZKRhY7/BiAGaTYeTI/HwqXp/tSD
oVF6hukjTMm/lfRcmFMz6ZcW0peszBMWLDDOpyj0zlZPzjff7bHFwkx/o+4nJcDP
CpS0O/NONx7jcczsY9P5+kTT7FJloTIitdG4sKf+vwzwYInbc+E=
=318V
-----END PGP SIGNATURE-----

--Sig_/B+Gx.od59WH+2AQN1vSW0A.--

