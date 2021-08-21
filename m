Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98FB83F3B6E
	for <lists+qemu-devel@lfdr.de>; Sat, 21 Aug 2021 18:27:07 +0200 (CEST)
Received: from localhost ([::1]:60960 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mHTpq-0005zA-4S
	for lists+qemu-devel@lfdr.de; Sat, 21 Aug 2021 12:27:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53812)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1mHTog-0005JO-Ev
 for qemu-devel@nongnu.org; Sat, 21 Aug 2021 12:25:54 -0400
Received: from mout.web.de ([212.227.15.14]:44229)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1mHTod-0003p6-Uu
 for qemu-devel@nongnu.org; Sat, 21 Aug 2021 12:25:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1629563135;
 bh=ga3lhba+8V17EHg++Hgu40k2b9XB/XXaSf1dzisjz6w=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=nsmJzgV8g2qry65v2FAAv6vWZbadqp7fuQW8FktEWyNN2m+XwY75AGwz6lmKRb8YT
 4zqJoBzyJEX1R2tNjIz3/CPTeJST7KgpLq1bN4vvKd3gBdQm3qlt7zgHSgXTloeO2h
 JaLY1bN5Bi2WX7HyGyuNkEZyYnE5YBHcdAPUcY2M=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from gecko.fritz.box ([94.134.180.44]) by smtp.web.de (mrweb001
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0Lo0Hw-1mxQGN10Aq-00fyfH; Sat, 21
 Aug 2021 18:25:35 +0200
Date: Sat, 21 Aug 2021 16:25:24 +0000
From: Lukas Straub <lukasstraub2@web.de>
To: Tao Xu <tao3.xu@intel.com>
Subject: Re: [PATCH v2] net/colo: check vnet_hdr_support flag when using
 virtio-net
Message-ID: <20210821162524.3b112708@gecko.fritz.box>
In-Reply-To: <20210819012717.318050-1-tao3.xu@intel.com>
References: <20210819012717.318050-1-tao3.xu@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/3f.XE_O/ozPXUDX3pMq6nKH";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Provags-ID: V03:K1:YS3TnVLviQWGt45HHLe0MGwhrowRrCYJJcMjIHBO0wgOt1bKvrQ
 2p0zffI4wWT0bRsMoFCNo9TrZobg3aZVhTqiYJRjXQVW3USkZ81Nyfl8igBsZn+6ISbPxg1
 ++EEAbWiOn0cl6WwYDsx2bhNYTx0xtKq3fmw+WlWhq4SUUd1bwMugVe2E0BzsKN3CPmrEds
 i361KN3/LVsJ3dgahoSMQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:S5ySuHYib6I=:C5CgVijKQ08/ih1YNnAwo6
 Pdi3eU2Nbn3TaGzVoAn7wsA/6y8yWFKjoCwTrAcKMPg1munIY+5O/aT9A7dYmnKzzqTGX4/Kl
 AxPeX2R/F0V1XR5LsJp9oRXDCa4Mt9YyTjZJVck9sPcqTBeDFUs5t7Ff2OAYSYnm3lYT2poYO
 AKuRoY57Ht20TB4LkVodekmBXxjyekUgDl5ztORMNMOXTnIyUn5jne+Ch7Xi9ChuO72IAsfwP
 UCC82oDcPdLyX7i4aX12PztWho6QHEcCJRhMaqAtARCaLRZfoBvIqlDR845ThozoYtPPMApWW
 Ubrbf44vG2BTYlv+CjZk+r38gUXBRXMXwkrcxkuB9/zme6ZWeWj+GKWcQJDUUNy4Np51x7IU4
 ddnEYd0fa/8UkttuM3yzxis7Ig3Pu/93PvBRQx3hWhVr3gWiMOYVCuIXRHYMHaYrOT2QE3Y/1
 detFf+koohK45i6IiyBM9WvZzbaihH9yKDG0tTM81U4NIWLIa37A345JlgiiUkx541OwKTcnE
 fZHGBfnv5a9oRqMxiHeMuVt1iyWhoy5mIzi4AatSyvdtRoFqd1I8GeQ2e1g5Y1+YjEVza94Pd
 m6mtuIhspdhv7XWn+kmrkQMpyeOyZ5/pacNiF8K2y0Qpbyel4QhqSI+FF3AltLYINhRIcCqHW
 sNQZaaTPu5z+TF/0kghwJTmwvRS0RI+yy288eD4xTsn8DiEx3cKvg4PfkhTzHgNdlgnfvDzs8
 5lZdbfXYANzy+dZsCzmS0sSo+w1H6b6s0uFCHoFDwmEb/hhlDmDiJT79b3Hy2tOAPaeeIA3Ja
 GOQ2t8ptV9Q6zmiZszvF4e1BqJOuLKHijY4d0/kZbUGofQQtvPh8mo27+T6KlwZyUDgCe1NZX
 Po87892MuYDyByLz4tzajKK/3N/tl7DKLQZHW1yq78jJuHqkfNNmgZhLa2YZg379synnB5gYK
 9S/bYRdBZwpBAdxRbxBq4O1GU0z4RXEgN3spDnHm74RnmyeCadCuZY3mxtOawsxmJAiF4lalw
 ZlTKQEGLmXo45exAsQOSI0z/KrWSUc3Femzr0U8eDNtySNbbkg/Kh0IGQAR5+MurImFqEPIMu
 WAEuYZw3xRuW0ru2b+GcV7GgMyZ9efJEto83YJlvga9MLgg0T1pQ6WFZw==
Received-SPF: pass client-ip=212.227.15.14; envelope-from=lukasstraub2@web.de;
 helo=mout.web.de
X-Spam_score_int: -9
X-Spam_score: -1.0
X-Spam_bar: -
X-Spam_report: (-1.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_SORBS_WEB=1.5, SPF_HELO_NONE=0.001,
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
Cc: chen.zhang@intel.com, jasowang@redhat.com, qemu-devel@nongnu.org,
 lizhijian@cn.fujitsu.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--Sig_/3f.XE_O/ozPXUDX3pMq6nKH
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Thu, 19 Aug 2021 09:27:17 +0800
Tao Xu <tao3.xu@intel.com> wrote:

> When COLO use only one vnet_hdr_support parameter between
> COLO network filter(filter-mirror, filter-redirector or
> filter-rewriter and colo-compare, packet will not be parsed
> correctly. Acquire network driver related to COLO, if it is
> nirtio-net, check vnet_hdr_support flag of COLO network filter
> and colo-compare.
>=20
> Signed-off-by: Tao Xu <tao3.xu@intel.com>
> Signed-off-by: Zhang Chen <chen.zhang@intel.com>
> ---
>=20
> Changelog:
> v2:
>      Detect virtio-net driver and apply vnet_hdr_support
>      automatically. (Jason)
> ---
>  net/colo-compare.c    | 57 +++++++++++++++++++++++++++++++++++++++++++
>  net/colo.c            | 20 +++++++++++++++
>  net/colo.h            |  4 +++
>  net/filter-mirror.c   | 21 ++++++++++++++++
>  net/filter-rewriter.c | 10 ++++++++
>  qapi/qom.json         |  6 +++++
>  qemu-options.hx       |  6 +++--
>  7 files changed, 122 insertions(+), 2 deletions(-)
>=20
> diff --git a/net/colo-compare.c b/net/colo-compare.c
> index b100e7b51f..870bd05a41 100644
> --- a/net/colo-compare.c
> +++ b/net/colo-compare.c
> @@ -110,6 +110,7 @@ struct CompareState {
>      char *sec_indev;
>      char *outdev;
>      char *notify_dev;
> +    char *netdev;
>      CharBackend chr_pri_in;
>      CharBackend chr_sec_in;
>      CharBackend chr_out;
> @@ -838,6 +839,28 @@ static int compare_chr_can_read(void *opaque)
>      return COMPARE_READ_LEN_MAX;
>  }
> =20
> +static int colo_set_default_netdev(void *opaque, QemuOpts *opts, Error *=
*errp)
> +{
> +    const char *colo_obj_type, *netdev_from_filter;
> +    char **netdev =3D (char **)opaque;
> +
> +    colo_obj_type =3D qemu_opt_get(opts, "qom-type");
> +
> +    if (colo_obj_type &&
> +        (strcmp(colo_obj_type, "filter-mirror") =3D=3D 0 ||
> +         strcmp(colo_obj_type, "filter-redirector") =3D=3D 0 ||
> +         strcmp(colo_obj_type, "filter-rewriter") =3D=3D 0)) {
> +        netdev_from_filter =3D qemu_opt_get(opts, "netdev");
> +        if (*netdev =3D=3D NULL) {
> +            *netdev =3D g_strdup(netdev_from_filter);
> +        } else if (strcmp(*netdev, netdev_from_filter) !=3D 0) {
> +            warn_report("%s is using a different netdev from other COLO "
> +                        "component", colo_obj_type);
> +        }
> +    }
> +    return 0;
> +}
> +

Hi,
This doesn't properly handle the case where there are multiple network
devices and one is virtio-net and the other isn't. This would be a
regression as this worked fine before.

>  /*
>   * Called from the main thread on the primary for packets
>   * arriving over the socket from the primary.
> @@ -1050,6 +1073,21 @@ static void compare_set_vnet_hdr(Object *obj,
>      s->vnet_hdr =3D value;
>  }
> =20
> +static char *compare_get_netdev(Object *obj, Error **errp)
> +{
> +    CompareState *s =3D COLO_COMPARE(obj);
> +
> +    return g_strdup(s->netdev);
> +}
> +
> +static void compare_set_netdev(Object *obj, const char *value, Error **e=
rrp)
> +{
> +    CompareState *s =3D COLO_COMPARE(obj);
> +
> +    g_free(s->netdev);
> +    s->netdev =3D g_strdup(value);
> +}
> +
>  static char *compare_get_notify_dev(Object *obj, Error **errp)
>  {
>      CompareState *s =3D COLO_COMPARE(obj);
> @@ -1274,6 +1312,12 @@ static void colo_compare_complete(UserCreatable *u=
c, Error **errp)
>          max_queue_size =3D MAX_QUEUE_SIZE;
>      }
> =20
> +    if (!s->netdev) {
> +        /* Set default netdev as the first colo netfilter found */
> +        qemu_opts_foreach(qemu_find_opts("object"),
> +                          colo_set_default_netdev, &s->netdev, NULL);
> +    }
> +
>      if (find_and_check_chardev(&chr, s->pri_indev, errp) ||
>          !qemu_chr_fe_init(&s->chr_pri_in, chr, errp)) {
>          return;
> @@ -1289,6 +1333,16 @@ static void colo_compare_complete(UserCreatable *u=
c, Error **errp)
>          return;
>      }
> =20
> +    if (!s->vnet_hdr &&
> +        qemu_opts_foreach(qemu_find_opts("device"),
> +                          vnet_driver_check, s->netdev, NULL)) {
> +        /*
> +         * colo compare needs 'vnet_hdr_support' when it works on virtio=
-net,
> +         * add 'vnet_hdr_support' automatically
> +         */
> +        s->vnet_hdr =3D true;
> +    }
> +

There is no way to disable vnet_hdr_support with virtio-net now.

>      net_socket_rs_init(&s->pri_rs, compare_pri_rs_finalize, s->vnet_hdr);
>      net_socket_rs_init(&s->sec_rs, compare_sec_rs_finalize, s->vnet_hdr);
> =20
> @@ -1400,6 +1454,9 @@ static void colo_compare_init(Object *obj)
>      s->vnet_hdr =3D false;
>      object_property_add_bool(obj, "vnet_hdr_support", compare_get_vnet_h=
dr,
>                               compare_set_vnet_hdr);
> +    /* colo compare can't varify that netdev is correct */
> +    object_property_add_str(obj, "netdev", compare_get_netdev,
> +                            compare_set_netdev);
>  }
> =20
>  void colo_compare_cleanup(void)
> diff --git a/net/colo.c b/net/colo.c
> index 3a3e6e89a0..4a03780f45 100644
> --- a/net/colo.c
> +++ b/net/colo.c
> @@ -243,3 +243,23 @@ bool connection_has_tracked(GHashTable *connection_t=
rack_table,
> =20
>      return conn ? true : false;
>  }
> +
> +/* check the network driver related to COLO, return 1 if it is virtio-ne=
t */
> +int vnet_driver_check(void *opaque, QemuOpts *opts, Error **errp)
> +{
> +    const char *driver_type, *netdev_from_driver;
> +    char *netdev_from_filter =3D (char *)opaque;
> +
> +    driver_type =3D qemu_opt_get(opts, "driver");
> +    netdev_from_driver =3D qemu_opt_get(opts, "netdev");
> +
> +    if (!driver_type || !netdev_from_driver || !netdev_from_filter) {
> +        return 0;
> +    }
> +
> +    if (g_str_has_prefix(driver_type, "virtio-net") &&
> +        strcmp(netdev_from_driver, netdev_from_filter) =3D=3D 0) {
> +        return 1;
> +    }
> +    return 0;
> +}
> diff --git a/net/colo.h b/net/colo.h
> index d91cd245c4..d401fc76b6 100644
> --- a/net/colo.h
> +++ b/net/colo.h
> @@ -18,6 +18,9 @@
>  #include "qemu/jhash.h"
>  #include "qemu/timer.h"
>  #include "net/eth.h"
> +#include "qemu/option.h"
> +#include "qemu/option_int.h"
> +#include "qemu/config-file.h"
> =20
>  #define HASHTABLE_MAX_SIZE 16384
> =20
> @@ -104,5 +107,6 @@ Packet *packet_new(const void *data, int size, int vn=
et_hdr_len);
>  Packet *packet_new_nocopy(void *data, int size, int vnet_hdr_len);
>  void packet_destroy(void *opaque, void *user_data);
>  void packet_destroy_partial(void *opaque, void *user_data);
> +int vnet_driver_check(void *opaque, QemuOpts *opts, Error **errp);
> =20
>  #endif /* NET_COLO_H */
> diff --git a/net/filter-mirror.c b/net/filter-mirror.c
> index f20240cc9f..69ca9c9839 100644
> --- a/net/filter-mirror.c
> +++ b/net/filter-mirror.c
> @@ -12,6 +12,7 @@
>  #include "qemu/osdep.h"
>  #include "net/filter.h"
>  #include "net/net.h"
> +#include "net/colo.h"
>  #include "qapi/error.h"
>  #include "qom/object.h"
>  #include "qemu/main-loop.h"
> @@ -224,6 +225,16 @@ static void filter_mirror_setup(NetFilterState *nf, =
Error **errp)
>          return;
>      }
> =20
> +    if (!s->vnet_hdr &&
> +        qemu_opts_foreach(qemu_find_opts("device"),
> +                          vnet_driver_check, nf->netdev_id, NULL)) {
> +        /*
> +         * filter mirror needs 'vnet_hdr_support' when colo filter modul=
es
> +         * work on virtio-net, add 'vnet_hdr_support' automatically
> +         */
> +        s->vnet_hdr =3D true;
> +    }
> +
>      qemu_chr_fe_init(&s->chr_out, chr, errp);
>  }
> =20
> @@ -252,6 +263,16 @@ static void filter_redirector_setup(NetFilterState *=
nf, Error **errp)
>          }
>      }
> =20
> +    if (!s->vnet_hdr &&
> +        qemu_opts_foreach(qemu_find_opts("device"),
> +                          vnet_driver_check, nf->netdev_id, NULL)) {
> +        /*
> +         * filter redirector needs 'vnet_hdr_support' when colo filter m=
odules
> +         * work on virtio-net, add 'vnet_hdr_support' automatically
> +         */
> +        s->vnet_hdr =3D true;
> +    }
> +
>      net_socket_rs_init(&s->rs, redirector_rs_finalize, s->vnet_hdr);
> =20
>      if (s->indev) {
> diff --git a/net/filter-rewriter.c b/net/filter-rewriter.c
> index cb3a96cde1..637ef4ce71 100644
> --- a/net/filter-rewriter.c
> +++ b/net/filter-rewriter.c
> @@ -388,6 +388,16 @@ static void colo_rewriter_setup(NetFilterState *nf, =
Error **errp)
>  {
>      RewriterState *s =3D FILTER_REWRITER(nf);
> =20
> +    if (!s->vnet_hdr &&
> +        qemu_opts_foreach(qemu_find_opts("device"),
> +                          vnet_driver_check, nf->netdev_id, NULL)) {
> +        /*
> +         * filter rewriter needs 'vnet_hdr_support' when colo filter mod=
ules
> +         * work on virtio-net, add 'vnet_hdr_support' automatically
> +         */
> +        s->vnet_hdr =3D true;
> +    }
> +
>      s->connection_track_table =3D g_hash_table_new_full(connection_key_h=
ash,
>                                                        connection_key_equ=
al,
>                                                        g_free,
> diff --git a/qapi/qom.json b/qapi/qom.json
> index 6d5f4a88e6..442a963ba4 100644
> --- a/qapi/qom.json
> +++ b/qapi/qom.json
> @@ -241,6 +241,11 @@
>  # @notify_dev: name of the character device backend to be used to commun=
icate
>  #              with the remote colo-frame (only for Xen COLO)
>  #
> +# @netdev: id of the network device backend to colo-compare, although
> +#          colo-compare doesn't depend on network device directly, this
> +#          parameter help colo-compare know what network driver it is
> +#          working on
> +#
>  # @compare_timeout: the maximum time to hold a packet from @primary_in f=
or
>  #                   comparison with an incoming packet on @secondary_in =
in
>  #                   milliseconds (default: 3000)
> @@ -264,6 +269,7 @@
>              'outdev': 'str',
>              'iothread': 'str',
>              '*notify_dev': 'str',
> +            '*netdev': 'str',
>              '*compare_timeout': 'uint64',
>              '*expired_scan_cycle': 'uint32',
>              '*max_queue_size': 'uint32',
> diff --git a/qemu-options.hx b/qemu-options.hx
> index 83aa59a920..b31ce3c87d 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -4957,12 +4957,14 @@ SRST
>          stored. The file format is libpcap, so it can be analyzed with
>          tools such as tcpdump or Wireshark.
> =20
> -    ``-object colo-compare,id=3Did,primary_in=3Dchardevid,secondary_in=
=3Dchardevid,outdev=3Dchardevid,iothread=3Did[,vnet_hdr_support][,notify_de=
v=3Did][,compare_timeout=3D@var{ms}][,expired_scan_cycle=3D@var{ms}][,max_q=
ueue_size=3D@var{size}]``
> +    ``-object colo-compare,id=3Did,primary_in=3Dchardevid,secondary_in=
=3Dchardevid,outdev=3Dchardevid,iothread=3Did[,netdev=3Dnetdevid][,vnet_hdr=
_support][,notify_dev=3Did][,compare_timeout=3D@var{ms}][,expired_scan_cycl=
e=3D@var{ms}][,max_queue_size=3D@var{size}]``
>          Colo-compare gets packet from primary\_in chardevid and
>          secondary\_in, then compare whether the payload of primary packet
>          and secondary packet are the same. If same, it will output
>          primary packet to out\_dev, else it will notify COLO-framework t=
o do
> -        checkpoint and send primary packet to out\_dev. In order to
> +        checkpoint and send primary packet to out\_dev. Although colo-co=
mpare
> +        does not depend on network device directly, netdevid help
> +        colo-compare know what network driver it is working on. In order=
 to
>          improve efficiency, we need to put the task of comparison in
>          another iothread. If it has the vnet\_hdr\_support flag,
>          colo compare will send/recv packet with vnet\_hdr\_len.



--=20


--Sig_/3f.XE_O/ozPXUDX3pMq6nKH
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEg/qxWKDZuPtyYo+kNasLKJxdslgFAmEhKPQACgkQNasLKJxd
slhzWRAAp2Zf4DjDMBBl6iCxo0huOfpuEdH9RcwMC4p3c+sH6m5A3Myh7mSbtcJ4
RAaIY8EkNmqhBj56byoWv6GhWDDCCb3OPxZkxeMdB2v7ChYiwTWxtVo9fGqCcfK7
AVI/602Ef3/pngm9IY1qup8fVH6UDxLGHvPq2m05uacdoEMk4hYo1y9B+SPaboVh
VhIk5gRA5OmztVzkutN9hA+iaj4M2uXGsbzdgBk/LzCojzbAx/FDjBnTq1kwIpDL
8LpycSJWmHg/QAibqYfBWzHnEfWHl567qmeezSmw21Zi5ZkY0Ofnk0C4/JP9OgSV
nLKGMITsU99h6D+b7/8cxHZJL1AiPHmrQUxCY1dIEIZLNlVgmi2OOmkdLmi7dLfs
BM6TMSs7EvoNOj8FhP10+xAPG5VbdrNn2iCh4aVLMIPdDeqDPIR6LrisIQKzW5vo
HpPvnsARONyXy7IQPmWckWlMBKl4kmMPlJaRT6w3nbq7AvFTG9MatEj+MDinfCdc
urZerzu9u4cK6Y3ZWmOfH3w3C8XGycNspVKls3ds3FCfbOUvltY22EMnU14udqlR
/gYRV92bvPnz79LT5aNleIt4zSjLx8LV3cOhlBdpiypigpZquzf5WzRKzuSvL+S8
a1VL1WqE9WGCQxMaYJhTNuS+NhYEODzjWEm3kb2I+JjXhpfXh/4=
=LmyF
-----END PGP SIGNATURE-----

--Sig_/3f.XE_O/ozPXUDX3pMq6nKH--

