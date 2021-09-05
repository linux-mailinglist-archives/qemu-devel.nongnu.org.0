Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C42B400F55
	for <lists+qemu-devel@lfdr.de>; Sun,  5 Sep 2021 13:50:09 +0200 (CEST)
Received: from localhost ([::1]:55876 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMqf1-0004yc-On
	for lists+qemu-devel@lfdr.de; Sun, 05 Sep 2021 07:50:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58498)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1mMqdZ-0003tR-LZ
 for qemu-devel@nongnu.org; Sun, 05 Sep 2021 07:48:37 -0400
Received: from mout.web.de ([212.227.17.12]:44229)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1mMqdW-0002UZ-Lx
 for qemu-devel@nongnu.org; Sun, 05 Sep 2021 07:48:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1630842500;
 bh=Wv3ZlGW1xhCA1GssMFHIOnKBkn4gG0174Fw1/99ADdE=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=abQNmtBQDthF4OapESc9+/ERCg/5k7s41KnCfX5dsPqBnDS2d+ob1eQLE3XnUTe3A
 fnJxHJazlS4e0duz3almFawbqVtl5NImu+Bo00cjJNeej0QweiKQVo+HwWHfQT6lDb
 V+PN+2ZihoBMoR68xJhmip41ZcdbwolfRPdfHCM8=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from gecko.fritz.box ([94.134.180.255]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MVJRl-1mVOyJ2thn-00SEp0; Sun, 05
 Sep 2021 13:48:20 +0200
Date: Sun, 5 Sep 2021 11:48:10 +0000
From: Lukas Straub <lukasstraub2@web.de>
To: "Zhang, Chen" <chen.zhang@intel.com>
Subject: Re: [PATCH v2] net/colo: check vnet_hdr_support flag when using
 virtio-net
Message-ID: <20210905114810.0cbb688e@gecko.fritz.box>
In-Reply-To: <BN0PR11MB575712EA5EBD922254BBB4819BC79@BN0PR11MB5757.namprd11.prod.outlook.com>
References: <20210819012717.318050-1-tao3.xu@intel.com>
 <20210821162524.3b112708@gecko.fritz.box>
 <BN0PR11MB575712EA5EBD922254BBB4819BC79@BN0PR11MB5757.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/QVZH6X+GSrq9uV=DM7x8Wfi";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Provags-ID: V03:K1:vEiaqHuOnfq5aEXDzLTYyS5xovFvhKxL6im12UgSDKu2Iu7D9io
 QUr/RReNM+uBL0IZ7SM10dbH0XrBjZ6lr0wunaqKwrtFqZrjhxfMIRJidPRG3k1plvTHFQp
 1/TCaNcTIYiQpw1aDOk1668OT+1m2iK6QHUgkUWiWfhBxWf9uHtk6ru6Cpq30M2WlrGOm+m
 mWDHidQdn6xnczjxlc6Vw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Uk9dZkuofyA=:IFFu5aGRXg21/GfGkP6u1E
 GrA5AbMz0MD3gXhfmXIH62oOFTVt9Xn3ZszIamvBDaZQV2bWTGSJaN5aI9xoKXOa2oBaMACoT
 mlK9IRZjrSnEBbKcBMEOuKhAdPiiM8z+ctro1ysiluX/uuOxPT0pb0sl736PsssrHYeshKQTH
 8qLzrKDZSNaK0R7RE8ojBD/N8+9HbxxiCxp6a2VUzFeCas4gQTaGNTyScEN4HkWw8JHZGbs1T
 tdB6lJiJ27pbWnQD12qO88LbDzXnHF9Sz/2/boHLRFnfCy6+oAUNTMnaj5PIQSjs3yrv8+Okw
 HVpA8AaMOxqz3ol/kYdYyIN6Lt+ix8cOi7U+6gpgrUJI8OgkphUQRq3NfvEQQaJHODZ3FewYQ
 noUE2WhQa1u8b75VtqyzBOgz5Pk4PPqIVAA1CFT+5zG3MwtAcWBTRoMS15LTmf/fCfJcUK6Q9
 QLH6miOMZqe2qbRE2F1MRB1jl4yS4goDNmufR27lyOjc3wile4/aXO+UOO7XxYWG9oCYigMW6
 ybipgzJo0xpl1qQpEY3rgIEXX3Zgme4fNG+eoer6g4tNxlhq0s+ijgiNXY8HmKrUb/UPHno7X
 U03V11PvdgyIWS512nyYmKVZcs/V2kDGMy+d/wMNTEnUHXl08WYta8ajMz1ZVDLhLbF1nrok7
 FvDPRMV4mW2eJpIJQF7IQcoaWW/xjJNhdeVkWEUhwjlFOszil1PanEpoWjNiDYusDOZe00215
 n+HNLt6C+xYbzFI5B2T8pDak0i4XN3cCSL/JmKBCy9oKNLoR+0lP2Jj295/x30ylSlNZVguxE
 0fSLsCjBoyGHq7Y6ZD42mO1Yi+DD9BYdTUG7m7GK4sDYSlXH2i6Z0aShDMilcCK5iJaNq8jyU
 C/FZ6K9GvoFVM1axCG57g+oPRP/460iCfPJ+YbaBOEJUM7Uc1OUEj5ZScYvPt7dM3oPgKzQIB
 6n5+uiCHDYT4D/wNghK1jDyiDIuwq7VAAElciHsuJqFsxiqtJWf8av49ZKrDgF1hIt3oZqx0j
 p9vj638cNwoP4nLwWEOwBTEYSCylx2lX8Ds0alfA8ui4HY3RYJnxxrUPc6mEDRC3tUUwEoAPw
 S7xUOUosfruQY2UNWc74Vau0SNt6H7dObCz8DQAyt5ogOINbJKmoyqAXw==
Received-SPF: pass client-ip=212.227.17.12; envelope-from=lukasstraub2@web.de;
 helo=mout.web.de
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: "Xu, Tao3" <tao3.xu@intel.com>, "jasowang@redhat.com" <jasowang@redhat.com>,
 "lizhijian@cn.fujitsu.com" <lizhijian@cn.fujitsu.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--Sig_/QVZH6X+GSrq9uV=DM7x8Wfi
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Thu, 26 Aug 2021 05:49:23 +0000
"Zhang, Chen" <chen.zhang@intel.com> wrote:

> > -----Original Message-----
> > From: Lukas Straub <lukasstraub2@web.de>
> > Sent: Sunday, August 22, 2021 12:25 AM
> > To: Xu, Tao3 <tao3.xu@intel.com>
> > Cc: Zhang, Chen <chen.zhang@intel.com>; lizhijian@cn.fujitsu.com;
> > jasowang@redhat.com; qemu-devel@nongnu.org
> > Subject: Re: [PATCH v2] net/colo: check vnet_hdr_support flag when using
> > virtio-net
> >=20
> > On Thu, 19 Aug 2021 09:27:17 +0800
> > Tao Xu <tao3.xu@intel.com> wrote:
> >  =20
> > > When COLO use only one vnet_hdr_support parameter between COLO =20
> > network =20
> > > filter(filter-mirror, filter-redirector or filter-rewriter and
> > > colo-compare, packet will not be parsed correctly. Acquire network
> > > driver related to COLO, if it is nirtio-net, check vnet_hdr_support
> > > flag of COLO network filter and colo-compare.
> > >
> > > Signed-off-by: Tao Xu <tao3.xu@intel.com>
> > > Signed-off-by: Zhang Chen <chen.zhang@intel.com>
> > > ---
> > >
> > > Changelog:
> > > v2:
> > >      Detect virtio-net driver and apply vnet_hdr_support
> > >      automatically. (Jason)
> > > ---
> > >  net/colo-compare.c    | 57 =20
> > +++++++++++++++++++++++++++++++++++++++++++ =20
> > >  net/colo.c            | 20 +++++++++++++++
> > >  net/colo.h            |  4 +++
> > >  net/filter-mirror.c   | 21 ++++++++++++++++
> > >  net/filter-rewriter.c | 10 ++++++++
> > >  qapi/qom.json         |  6 +++++
> > >  qemu-options.hx       |  6 +++--
> > >  7 files changed, 122 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/net/colo-compare.c b/net/colo-compare.c index
> > > b100e7b51f..870bd05a41 100644
> > > --- a/net/colo-compare.c
> > > +++ b/net/colo-compare.c
> > > @@ -110,6 +110,7 @@ struct CompareState {
> > >      char *sec_indev;
> > >      char *outdev;
> > >      char *notify_dev;
> > > +    char *netdev;
> > >      CharBackend chr_pri_in;
> > >      CharBackend chr_sec_in;
> > >      CharBackend chr_out;
> > > @@ -838,6 +839,28 @@ static int compare_chr_can_read(void *opaque)
> > >      return COMPARE_READ_LEN_MAX;
> > >  }
> > >
> > > +static int colo_set_default_netdev(void *opaque, QemuOpts *opts,
> > > +Error **errp) {
> > > +    const char *colo_obj_type, *netdev_from_filter;
> > > +    char **netdev =3D (char **)opaque;
> > > +
> > > +    colo_obj_type =3D qemu_opt_get(opts, "qom-type");
> > > +
> > > +    if (colo_obj_type &&
> > > +        (strcmp(colo_obj_type, "filter-mirror") =3D=3D 0 ||
> > > +         strcmp(colo_obj_type, "filter-redirector") =3D=3D 0 ||
> > > +         strcmp(colo_obj_type, "filter-rewriter") =3D=3D 0)) {
> > > +        netdev_from_filter =3D qemu_opt_get(opts, "netdev");
> > > +        if (*netdev =3D=3D NULL) {
> > > +            *netdev =3D g_strdup(netdev_from_filter);
> > > +        } else if (strcmp(*netdev, netdev_from_filter) !=3D 0) {
> > > +            warn_report("%s is using a different netdev from other C=
OLO "
> > > +                        "component", colo_obj_type);
> > > +        }
> > > +    }
> > > +    return 0;
> > > +}
> > > + =20
> >=20
> > Hi,
> > This doesn't properly handle the case where there are multiple network
> > devices and one is virtio-net and the other isn't. This would be a regr=
ession as
> > this worked fine before. =20
>=20
> No, If have multiple network device this patch just report a warning for =
it.
> You can still use virtio-net and others at the same time.

As you see it sets netdev to the first filter's netdev. So if
the first netdev is virtio-net and the 2nd is e1000 (for example) it'll
see virtio-net first and set *netdev to it for _both_ devices. Then it
sees the e1000 and prints the warning, but *netdev is still set to
virtio-net. So it'll enable vnet_hdr for e1000 too and segfault when
processing a packet because e1000 doesn't support vnet_hdr.

> >  =20
> > >  /*
> > >   * Called from the main thread on the primary for packets
> > >   * arriving over the socket from the primary.
> > > @@ -1050,6 +1073,21 @@ static void compare_set_vnet_hdr(Object *obj,
> > >      s->vnet_hdr =3D value;
> > >  }
> > >
> > > +static char *compare_get_netdev(Object *obj, Error **errp) {
> > > +    CompareState *s =3D COLO_COMPARE(obj);
> > > +
> > > +    return g_strdup(s->netdev);
> > > +}
> > > +
> > > +static void compare_set_netdev(Object *obj, const char *value, Error
> > > +**errp) {
> > > +    CompareState *s =3D COLO_COMPARE(obj);
> > > +
> > > +    g_free(s->netdev);
> > > +    s->netdev =3D g_strdup(value);
> > > +}
> > > +
> > >  static char *compare_get_notify_dev(Object *obj, Error **errp)  {
> > >      CompareState *s =3D COLO_COMPARE(obj); @@ -1274,6 +1312,12 @@
> > > static void colo_compare_complete(UserCreatable *uc, Error **errp)
> > >          max_queue_size =3D MAX_QUEUE_SIZE;
> > >      }
> > >
> > > +    if (!s->netdev) {
> > > +        /* Set default netdev as the first colo netfilter found */
> > > +        qemu_opts_foreach(qemu_find_opts("object"),
> > > +                          colo_set_default_netdev, &s->netdev, NULL);
> > > +    }
> > > +
> > >      if (find_and_check_chardev(&chr, s->pri_indev, errp) ||
> > >          !qemu_chr_fe_init(&s->chr_pri_in, chr, errp)) {
> > >          return;
> > > @@ -1289,6 +1333,16 @@ static void =20
> > colo_compare_complete(UserCreatable *uc, Error **errp) =20
> > >          return;
> > >      }
> > >
> > > +    if (!s->vnet_hdr &&
> > > +        qemu_opts_foreach(qemu_find_opts("device"),
> > > +                          vnet_driver_check, s->netdev, NULL)) {
> > > +        /*
> > > +         * colo compare needs 'vnet_hdr_support' when it works on vi=
rtio-net,
> > > +         * add 'vnet_hdr_support' automatically
> > > +         */
> > > +        s->vnet_hdr =3D true;
> > > +    }
> > > + =20
> >=20
> > There is no way to disable vnet_hdr_support with virtio-net now. =20
>=20
> Yes, It looks no reason to do this.
> Please show me some details?
>=20
> Thanks
> Chen
>=20
> >  =20
> > >      net_socket_rs_init(&s->pri_rs, compare_pri_rs_finalize, s->vnet_=
hdr);
> > >      net_socket_rs_init(&s->sec_rs, compare_sec_rs_finalize,
> > > s->vnet_hdr);
> > >
> > > @@ -1400,6 +1454,9 @@ static void colo_compare_init(Object *obj)
> > >      s->vnet_hdr =3D false;
> > >      object_property_add_bool(obj, "vnet_hdr_support", =20
> > compare_get_vnet_hdr, =20
> > >                               compare_set_vnet_hdr);
> > > +    /* colo compare can't varify that netdev is correct */
> > > +    object_property_add_str(obj, "netdev", compare_get_netdev,
> > > +                            compare_set_netdev);
> > >  }
> > >
> > >  void colo_compare_cleanup(void)
> > > diff --git a/net/colo.c b/net/colo.c
> > > index 3a3e6e89a0..4a03780f45 100644
> > > --- a/net/colo.c
> > > +++ b/net/colo.c
> > > @@ -243,3 +243,23 @@ bool connection_has_tracked(GHashTable
> > > *connection_track_table,
> > >
> > >      return conn ? true : false;
> > >  }
> > > +
> > > +/* check the network driver related to COLO, return 1 if it is
> > > +virtio-net */ int vnet_driver_check(void *opaque, QemuOpts *opts,
> > > +Error **errp) {
> > > +    const char *driver_type, *netdev_from_driver;
> > > +    char *netdev_from_filter =3D (char *)opaque;
> > > +
> > > +    driver_type =3D qemu_opt_get(opts, "driver");
> > > +    netdev_from_driver =3D qemu_opt_get(opts, "netdev");
> > > +
> > > +    if (!driver_type || !netdev_from_driver || !netdev_from_filter) {
> > > +        return 0;
> > > +    }
> > > +
> > > +    if (g_str_has_prefix(driver_type, "virtio-net") &&
> > > +        strcmp(netdev_from_driver, netdev_from_filter) =3D=3D 0) {
> > > +        return 1;
> > > +    }
> > > +    return 0;
> > > +}
> > > diff --git a/net/colo.h b/net/colo.h
> > > index d91cd245c4..d401fc76b6 100644
> > > --- a/net/colo.h
> > > +++ b/net/colo.h
> > > @@ -18,6 +18,9 @@
> > >  #include "qemu/jhash.h"
> > >  #include "qemu/timer.h"
> > >  #include "net/eth.h"
> > > +#include "qemu/option.h"
> > > +#include "qemu/option_int.h"
> > > +#include "qemu/config-file.h"
> > >
> > >  #define HASHTABLE_MAX_SIZE 16384
> > >
> > > @@ -104,5 +107,6 @@ Packet *packet_new(const void *data, int size, int
> > > vnet_hdr_len);  Packet *packet_new_nocopy(void *data, int size, int
> > > vnet_hdr_len);  void packet_destroy(void *opaque, void *user_data);
> > > void packet_destroy_partial(void *opaque, void *user_data);
> > > +int vnet_driver_check(void *opaque, QemuOpts *opts, Error **errp);
> > >
> > >  #endif /* NET_COLO_H */
> > > diff --git a/net/filter-mirror.c b/net/filter-mirror.c index
> > > f20240cc9f..69ca9c9839 100644
> > > --- a/net/filter-mirror.c
> > > +++ b/net/filter-mirror.c
> > > @@ -12,6 +12,7 @@
> > >  #include "qemu/osdep.h"
> > >  #include "net/filter.h"
> > >  #include "net/net.h"
> > > +#include "net/colo.h"
> > >  #include "qapi/error.h"
> > >  #include "qom/object.h"
> > >  #include "qemu/main-loop.h"
> > > @@ -224,6 +225,16 @@ static void filter_mirror_setup(NetFilterState *=
nf, =20
> > Error **errp) =20
> > >          return;
> > >      }
> > >
> > > +    if (!s->vnet_hdr &&
> > > +        qemu_opts_foreach(qemu_find_opts("device"),
> > > +                          vnet_driver_check, nf->netdev_id, NULL)) {
> > > +        /*
> > > +         * filter mirror needs 'vnet_hdr_support' when colo filter m=
odules
> > > +         * work on virtio-net, add 'vnet_hdr_support' automatically
> > > +         */
> > > +        s->vnet_hdr =3D true;
> > > +    }
> > > +
> > >      qemu_chr_fe_init(&s->chr_out, chr, errp);  }
> > >
> > > @@ -252,6 +263,16 @@ static void filter_redirector_setup(NetFilterSta=
te =20
> > *nf, Error **errp) =20
> > >          }
> > >      }
> > >
> > > +    if (!s->vnet_hdr &&
> > > +        qemu_opts_foreach(qemu_find_opts("device"),
> > > +                          vnet_driver_check, nf->netdev_id, NULL)) {
> > > +        /*
> > > +         * filter redirector needs 'vnet_hdr_support' when colo filt=
er modules
> > > +         * work on virtio-net, add 'vnet_hdr_support' automatically
> > > +         */
> > > +        s->vnet_hdr =3D true;
> > > +    }
> > > +
> > >      net_socket_rs_init(&s->rs, redirector_rs_finalize, s->vnet_hdr);
> > >
> > >      if (s->indev) {
> > > diff --git a/net/filter-rewriter.c b/net/filter-rewriter.c index
> > > cb3a96cde1..637ef4ce71 100644
> > > --- a/net/filter-rewriter.c
> > > +++ b/net/filter-rewriter.c
> > > @@ -388,6 +388,16 @@ static void colo_rewriter_setup(NetFilterState
> > > *nf, Error **errp)  {
> > >      RewriterState *s =3D FILTER_REWRITER(nf);
> > >
> > > +    if (!s->vnet_hdr &&
> > > +        qemu_opts_foreach(qemu_find_opts("device"),
> > > +                          vnet_driver_check, nf->netdev_id, NULL)) {
> > > +        /*
> > > +         * filter rewriter needs 'vnet_hdr_support' when colo filter=
 modules
> > > +         * work on virtio-net, add 'vnet_hdr_support' automatically
> > > +         */
> > > +        s->vnet_hdr =3D true;
> > > +    }
> > > +
> > >      s->connection_track_table =3D =20
> > g_hash_table_new_full(connection_key_hash, =20
> > >                                                        connection_key=
_equal,
> > >                                                        g_free, diff
> > > --git a/qapi/qom.json b/qapi/qom.json index 6d5f4a88e6..442a963ba4
> > > 100644
> > > --- a/qapi/qom.json
> > > +++ b/qapi/qom.json
> > > @@ -241,6 +241,11 @@
> > >  # @notify_dev: name of the character device backend to be used to =20
> > communicate =20
> > >  #              with the remote colo-frame (only for Xen COLO)
> > >  #
> > > +# @netdev: id of the network device backend to colo-compare, although
> > > +#          colo-compare doesn't depend on network device directly, t=
his
> > > +#          parameter help colo-compare know what network driver it is
> > > +#          working on
> > > +#
> > >  # @compare_timeout: the maximum time to hold a packet from =20
> > @primary_in for =20
> > >  #                   comparison with an incoming packet on @secondary=
_in in
> > >  #                   milliseconds (default: 3000)
> > > @@ -264,6 +269,7 @@
> > >              'outdev': 'str',
> > >              'iothread': 'str',
> > >              '*notify_dev': 'str',
> > > +            '*netdev': 'str',
> > >              '*compare_timeout': 'uint64',
> > >              '*expired_scan_cycle': 'uint32',
> > >              '*max_queue_size': 'uint32', diff --git a/qemu-options.hx
> > > b/qemu-options.hx index 83aa59a920..b31ce3c87d 100644
> > > --- a/qemu-options.hx
> > > +++ b/qemu-options.hx
> > > @@ -4957,12 +4957,14 @@ SRST
> > >          stored. The file format is libpcap, so it can be analyzed wi=
th
> > >          tools such as tcpdump or Wireshark.
> > >
> > > -    ``-object colo- =20
> > compare,id=3Did,primary_in=3Dchardevid,secondary_in=3Dchardevid,outdev=
=3Dchard
> > evid,iothread=3Did[,vnet_hdr_support][,notify_dev=3Did][,compare_timeou=
t=3D@
> > var{ms}][,expired_scan_cycle=3D@var{ms}][,max_queue_size=3D@var{size}]`=
` =20
> > > +    ``-object
> > > + colo- =20
> > compare,id=3Did,primary_in=3Dchardevid,secondary_in=3Dchardevid,outde =
=20
> > > + v=3Dchardevid,iothread=3Did[,netdev=3Dnetdevid][,vnet_hdr_support][=
,notify
> > > + =20
> > _dev=3Did][,compare_timeout=3D@var{ms}][,expired_scan_cycle=3D@var{ms}]=
[,
> > m =20
> > > + ax_queue_size=3D@var{size}]``
> > >          Colo-compare gets packet from primary\_in chardevid and
> > >          secondary\_in, then compare whether the payload of primary p=
acket
> > >          and secondary packet are the same. If same, it will output
> > >          primary packet to out\_dev, else it will notify COLO-framewo=
rk to do
> > > -        checkpoint and send primary packet to out\_dev. In order to
> > > +        checkpoint and send primary packet to out\_dev. Although col=
o- =20
> > compare =20
> > > +        does not depend on network device directly, netdevid help
> > > +        colo-compare know what network driver it is working on. In
> > > + order to
> > >          improve efficiency, we need to put the task of comparison in
> > >          another iothread. If it has the vnet\_hdr\_support flag,
> > >          colo compare will send/recv packet with vnet\_hdr\_len. =20
> >=20
> >=20
> >=20
> > -- =20
>=20



--=20


--Sig_/QVZH6X+GSrq9uV=DM7x8Wfi
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEg/qxWKDZuPtyYo+kNasLKJxdslgFAmE0rnoACgkQNasLKJxd
sligiw//RUMknPtVStEkn9PfB6KubAGWPpgA+SRLJ/9qIdDzXm1PSi/+CNijlaMr
CG8Ar19K9x6VGXsalpDgGct+F6+VcV8znI/rFM2Sk9Yc241W1wPr1MN52bpTzyAt
W5ZX/pqtDOvef21u8Quh2NtgA0dK7tMOcLpe+C9OKtOHyxijQ0q+8pjyXV2TTazf
m3l3KiikK5cxK0JSLR2ttiwqIitVgBHN962DLNA758qDxlccqIB1Gqqv7TbSPW2f
CpwAx7o9iK1hA7i85Ys9ZbukL9rUoCGIP6KHlebbjTuHyv8vtrZ6B60CKmlesqGy
iY3oBfM+u5e/wvz2RGI7sCWRVOZr/NtxXB4tlvMSh/vkY+UCleqJKQwu9dGBe1Id
GCMBAaepks2ze3ccnuQBOqtZXejs5fBeGJx+67F/uaO1flqrU+QEfJwQD6bQW2k3
tVn1coAXJezY5gk/JUaUEbd8MXd51nUS7mYmOqLLXJYcLW1RTK9JQCRymsnnRW8I
Hkj3Xtv/6Fua1fJ2+2TTrQQeY0BgyGMB5Y7ciAZwnup3ZGAveMn+9BGvIPIixTY/
hrhOx+LEOX2hHZD1/hcd2dM6KlU49trFZs2zCvWsKhsFTxwqJhyfXKx+OfoPa3H2
ifY2IF686/+i9F7J0h9oikQXJFWLJyOMrw+kMTHllVKZc/cuAeg=
=utUz
-----END PGP SIGNATURE-----

--Sig_/QVZH6X+GSrq9uV=DM7x8Wfi--

