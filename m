Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF1D35F6318
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Oct 2022 10:54:39 +0200 (CEST)
Received: from localhost ([::1]:54098 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogMeM-00086R-7Z
	for lists+qemu-devel@lfdr.de; Thu, 06 Oct 2022 04:54:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45802)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1ogM2K-00013l-TF
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 04:15:21 -0400
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3]:54343
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1ogM2G-00033k-9n
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 04:15:19 -0400
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4Mjkl31fw6z4xFv; Thu,  6 Oct 2022 19:15:11 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1665044111;
 bh=+1evIHzfddRQ/GGJvA8TWQx2+QvK0NYUMJ5F+xh4xSY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=cnPtojDnaf21RmbXU0rBE3ED1glokJs0jJ2Nu3UvYWmuc4posNjeO/vgfgzoesbSw
 z2/gFG0dZofO8ICCmTUJfNFrTd+Hf8pBJX9GU7VfPhTc7fKYW01ZVDkZt6UCZtzLBw
 sKQSaEiEdaRzh85YB5YVErnR1YKSkr396LSCId1o=
Date: Thu, 6 Oct 2022 19:08:20 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Laurent Vivier <lvivier@redhat.com>
Cc: qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Eric Blake <eblake@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Jason Wang <jasowang@redhat.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Markus Armbruster <armbru@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 Greg Kurz <groug@kaod.org>, "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH v10 05/17] net: introduce qemu_set_info_str() function
Message-ID: <Yz6M9Azhfa9RRYA2@yekko>
References: <20221005162051.1120041-1-lvivier@redhat.com>
 <20221005162051.1120041-6-lvivier@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="0UzPK+7sv693mhX+"
Content-Disposition: inline
In-Reply-To: <20221005162051.1120041-6-lvivier@redhat.com>
Received-SPF: pass client-ip=2404:9400:2221:ea00::3;
 envelope-from=dgibson@gandalf.ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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


--0UzPK+7sv693mhX+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 05, 2022 at 06:20:39PM +0200, Laurent Vivier wrote:
> Embed the setting of info_str in a function.
>=20
> Signed-off-by: Laurent Vivier <lvivier@redhat.com>

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>

> ---
>  include/net/net.h |  1 +
>  net/l2tpv3.c      |  3 +--
>  net/net.c         | 17 ++++++++++++-----
>  net/slirp.c       |  5 ++---
>  net/socket.c      | 33 ++++++++++++++-------------------
>  net/tap-win32.c   |  3 +--
>  net/tap.c         | 13 +++++--------
>  net/vde.c         |  3 +--
>  net/vhost-user.c  |  3 +--
>  net/vhost-vdpa.c  |  2 +-
>  10 files changed, 39 insertions(+), 44 deletions(-)
>=20
> diff --git a/include/net/net.h b/include/net/net.h
> index 025dbf1e143b..3db75ff841ff 100644
> --- a/include/net/net.h
> +++ b/include/net/net.h
> @@ -177,6 +177,7 @@ ssize_t qemu_send_packet_async(NetClientState *nc, co=
nst uint8_t *buf,
>  void qemu_purge_queued_packets(NetClientState *nc);
>  void qemu_flush_queued_packets(NetClientState *nc);
>  void qemu_flush_or_purge_queued_packets(NetClientState *nc, bool purge);
> +void qemu_set_info_str(NetClientState *nc, const char *fmt, ...);
>  void qemu_format_nic_info_str(NetClientState *nc, uint8_t macaddr[6]);
>  bool qemu_has_ufo(NetClientState *nc);
>  bool qemu_has_vnet_hdr(NetClientState *nc);
> diff --git a/net/l2tpv3.c b/net/l2tpv3.c
> index af373e5c300c..350041a0d6c0 100644
> --- a/net/l2tpv3.c
> +++ b/net/l2tpv3.c
> @@ -723,8 +723,7 @@ int net_init_l2tpv3(const Netdev *netdev,
> =20
>      l2tpv3_read_poll(s, true);
> =20
> -    snprintf(s->nc.info_str, sizeof(s->nc.info_str),
> -             "l2tpv3: connected");
> +    qemu_set_info_str(&s->nc, "l2tpv3: connected");
>      return 0;
>  outerr:
>      qemu_del_net_client(nc);
> diff --git a/net/net.c b/net/net.c
> index ffe3e5a2cf1d..41e05137d431 100644
> --- a/net/net.c
> +++ b/net/net.c
> @@ -141,13 +141,20 @@ char *qemu_mac_strdup_printf(const uint8_t *macaddr)
>                             macaddr[3], macaddr[4], macaddr[5]);
>  }
> =20
> +void qemu_set_info_str(NetClientState *nc, const char *fmt, ...)
> +{
> +    va_list ap;
> +
> +    va_start(ap, fmt);
> +    vsnprintf(nc->info_str, sizeof(nc->info_str), fmt, ap);
> +    va_end(ap);
> +}
> +
>  void qemu_format_nic_info_str(NetClientState *nc, uint8_t macaddr[6])
>  {
> -    snprintf(nc->info_str, sizeof(nc->info_str),
> -             "model=3D%s,macaddr=3D%02x:%02x:%02x:%02x:%02x:%02x",
> -             nc->model,
> -             macaddr[0], macaddr[1], macaddr[2],
> -             macaddr[3], macaddr[4], macaddr[5]);
> +    qemu_set_info_str(nc, "model=3D%s,macaddr=3D%02x:%02x:%02x:%02x:%02x=
:%02x",
> +                      nc->model, macaddr[0], macaddr[1], macaddr[2],
> +                      macaddr[3], macaddr[4], macaddr[5]);
>  }
> =20
>  static int mac_table[256] =3D {0};
> diff --git a/net/slirp.c b/net/slirp.c
> index 8679be644420..14a8d592774c 100644
> --- a/net/slirp.c
> +++ b/net/slirp.c
> @@ -611,9 +611,8 @@ static int net_slirp_init(NetClientState *peer, const=
 char *model,
> =20
>      nc =3D qemu_new_net_client(&net_slirp_info, peer, model, name);
> =20
> -    snprintf(nc->info_str, sizeof(nc->info_str),
> -             "net=3D%s,restrict=3D%s", inet_ntoa(net),
> -             restricted ? "on" : "off");
> +    qemu_set_info_str(nc, "net=3D%s,restrict=3D%s", inet_ntoa(net),
> +                      restricted ? "on" : "off");
> =20
>      s =3D DO_UPCAST(SlirpState, nc, nc);
> =20
> diff --git a/net/socket.c b/net/socket.c
> index bfd8596250c4..ade1ecf38b87 100644
> --- a/net/socket.c
> +++ b/net/socket.c
> @@ -179,7 +179,7 @@ static void net_socket_send(void *opaque)
>          s->fd =3D -1;
>          net_socket_rs_init(&s->rs, net_socket_rs_finalize, false);
>          s->nc.link_down =3D true;
> -        memset(s->nc.info_str, 0, sizeof(s->nc.info_str));
> +        qemu_set_info_str(&s->nc, "");
> =20
>          return;
>      }
> @@ -387,16 +387,15 @@ static NetSocketState *net_socket_fd_init_dgram(Net=
ClientState *peer,
>      /* mcast: save bound address as dst */
>      if (is_connected && mcast !=3D NULL) {
>          s->dgram_dst =3D saddr;
> -        snprintf(nc->info_str, sizeof(nc->info_str),
> -                 "socket: fd=3D%d (cloned mcast=3D%s:%d)",
> -                 fd, inet_ntoa(saddr.sin_addr), ntohs(saddr.sin_port));
> +        qemu_set_info_str(nc, "socket: fd=3D%d (cloned mcast=3D%s:%d)", =
fd,
> +                          inet_ntoa(saddr.sin_addr), ntohs(saddr.sin_por=
t));
>      } else {
>          if (sa_type =3D=3D SOCKET_ADDRESS_TYPE_UNIX) {
>              s->dgram_dst.sin_family =3D AF_UNIX;
>          }
> =20
> -        snprintf(nc->info_str, sizeof(nc->info_str),
> -                 "socket: fd=3D%d %s", fd, SocketAddressType_str(sa_type=
));
> +        qemu_set_info_str(nc, "socket: fd=3D%d %s", fd,
> +                          SocketAddressType_str(sa_type));
>      }
> =20
>      return s;
> @@ -430,7 +429,7 @@ static NetSocketState *net_socket_fd_init_stream(NetC=
lientState *peer,
> =20
>      nc =3D qemu_new_net_client(&net_socket_info, peer, model, name);
> =20
> -    snprintf(nc->info_str, sizeof(nc->info_str), "socket: fd=3D%d", fd);
> +    qemu_set_info_str(nc, "socket: fd=3D%d", fd);
> =20
>      s =3D DO_UPCAST(NetSocketState, nc, nc);
> =20
> @@ -497,9 +496,8 @@ static void net_socket_accept(void *opaque)
>      s->fd =3D fd;
>      s->nc.link_down =3D false;
>      net_socket_connect(s);
> -    snprintf(s->nc.info_str, sizeof(s->nc.info_str),
> -             "socket: connection from %s:%d",
> -             inet_ntoa(saddr.sin_addr), ntohs(saddr.sin_port));
> +    qemu_set_info_str(&s->nc, "socket: connection from %s:%d",
> +                      inet_ntoa(saddr.sin_addr), ntohs(saddr.sin_port));
>  }
> =20
>  static int net_socket_listen_init(NetClientState *peer,
> @@ -597,9 +595,8 @@ static int net_socket_connect_init(NetClientState *pe=
er,
>          return -1;
>      }
> =20
> -    snprintf(s->nc.info_str, sizeof(s->nc.info_str),
> -             "socket: connect to %s:%d",
> -             inet_ntoa(saddr.sin_addr), ntohs(saddr.sin_port));
> +    qemu_set_info_str(&s->nc, "socket: connect to %s:%d",
> +                      inet_ntoa(saddr.sin_addr), ntohs(saddr.sin_port));
>      return 0;
>  }
> =20
> @@ -642,9 +639,8 @@ static int net_socket_mcast_init(NetClientState *peer,
> =20
>      s->dgram_dst =3D saddr;
> =20
> -    snprintf(s->nc.info_str, sizeof(s->nc.info_str),
> -             "socket: mcast=3D%s:%d",
> -             inet_ntoa(saddr.sin_addr), ntohs(saddr.sin_port));
> +    qemu_set_info_str(&s->nc, "socket: mcast=3D%s:%d",
> +                      inet_ntoa(saddr.sin_addr), ntohs(saddr.sin_port));
>      return 0;
> =20
>  }
> @@ -697,9 +693,8 @@ static int net_socket_udp_init(NetClientState *peer,
> =20
>      s->dgram_dst =3D raddr;
> =20
> -    snprintf(s->nc.info_str, sizeof(s->nc.info_str),
> -             "socket: udp=3D%s:%d",
> -             inet_ntoa(raddr.sin_addr), ntohs(raddr.sin_port));
> +    qemu_set_info_str(&s->nc, "socket: udp=3D%s:%d", inet_ntoa(raddr.sin=
_addr),
> +                      ntohs(raddr.sin_port));
>      return 0;
>  }
> =20
> diff --git a/net/tap-win32.c b/net/tap-win32.c
> index 7466f22e77a4..a49c28ba5dc5 100644
> --- a/net/tap-win32.c
> +++ b/net/tap-win32.c
> @@ -789,8 +789,7 @@ static int tap_win32_init(NetClientState *peer, const=
 char *model,
> =20
>      s =3D DO_UPCAST(TAPState, nc, nc);
> =20
> -    snprintf(s->nc.info_str, sizeof(s->nc.info_str),
> -             "tap: ifname=3D%s", ifname);
> +    qemu_set_info_str(&s->nc, "tap: ifname=3D%s", ifname);
> =20
>      s->handle =3D handle;
> =20
> diff --git a/net/tap.c b/net/tap.c
> index e203d07a1216..1210a0436de8 100644
> --- a/net/tap.c
> +++ b/net/tap.c
> @@ -630,8 +630,7 @@ int net_init_bridge(const Netdev *netdev, const char =
*name,
>      }
>      s =3D net_tap_fd_init(peer, "bridge", name, fd, vnet_hdr);
> =20
> -    snprintf(s->nc.info_str, sizeof(s->nc.info_str), "helper=3D%s,br=3D%=
s", helper,
> -             br);
> +    qemu_set_info_str(&s->nc, "helper=3D%s,br=3D%s", helper, br);
> =20
>      return 0;
>  }
> @@ -690,14 +689,12 @@ static void net_init_tap_one(const NetdevTapOptions=
 *tap, NetClientState *peer,
>      }
> =20
>      if (tap->has_fd || tap->has_fds) {
> -        snprintf(s->nc.info_str, sizeof(s->nc.info_str), "fd=3D%d", fd);
> +        qemu_set_info_str(&s->nc, "fd=3D%d", fd);
>      } else if (tap->has_helper) {
> -        snprintf(s->nc.info_str, sizeof(s->nc.info_str), "helper=3D%s",
> -                 tap->helper);
> +        qemu_set_info_str(&s->nc, "helper=3D%s", tap->helper);
>      } else {
> -        snprintf(s->nc.info_str, sizeof(s->nc.info_str),
> -                 "ifname=3D%s,script=3D%s,downscript=3D%s", ifname, scri=
pt,
> -                 downscript);
> +        qemu_set_info_str(&s->nc, "ifname=3D%s,script=3D%s,downscript=3D=
%s", ifname,
> +                          script, downscript);
> =20
>          if (strcmp(downscript, "no") !=3D 0) {
>              snprintf(s->down_script, sizeof(s->down_script), "%s", downs=
cript);
> diff --git a/net/vde.c b/net/vde.c
> index 1083916bcf52..c0a08662cc30 100644
> --- a/net/vde.c
> +++ b/net/vde.c
> @@ -98,8 +98,7 @@ static int net_vde_init(NetClientState *peer, const cha=
r *model,
> =20
>      nc =3D qemu_new_net_client(&net_vde_info, peer, model, name);
> =20
> -    snprintf(nc->info_str, sizeof(nc->info_str), "sock=3D%s,fd=3D%d",
> -             sock, vde_datafd(vde));
> +    qemu_set_info_str(nc, "sock=3D%s,fd=3D%d", sock, vde_datafd(vde));
> =20
>      s =3D DO_UPCAST(VDEState, nc, nc);
> =20
> diff --git a/net/vhost-user.c b/net/vhost-user.c
> index b1a0247b5981..3a6b90da8661 100644
> --- a/net/vhost-user.c
> +++ b/net/vhost-user.c
> @@ -341,8 +341,7 @@ static int net_vhost_user_init(NetClientState *peer, =
const char *device,
>      user =3D g_new0(struct VhostUserState, 1);
>      for (i =3D 0; i < queues; i++) {
>          nc =3D qemu_new_net_client(&net_vhost_user_info, peer, device, n=
ame);
> -        snprintf(nc->info_str, sizeof(nc->info_str), "vhost-user%d to %s=
",
> -                 i, chr->label);
> +        qemu_set_info_str(nc, "vhost-user%d to %s", i, chr->label);
>          nc->queue_index =3D i;
>          if (!nc0) {
>              nc0 =3D nc;
> diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
> index 4bc3fd01a878..e1865bea6aa3 100644
> --- a/net/vhost-vdpa.c
> +++ b/net/vhost-vdpa.c
> @@ -593,7 +593,7 @@ static NetClientState *net_vhost_vdpa_init(NetClientS=
tate *peer,
>          nc =3D qemu_new_net_control_client(&net_vhost_vdpa_cvq_info, pee=
r,
>                                           device, name);
>      }
> -    snprintf(nc->info_str, sizeof(nc->info_str), TYPE_VHOST_VDPA);
> +    qemu_set_info_str(nc, TYPE_VHOST_VDPA);
>      s =3D DO_UPCAST(VhostVDPAState, nc, nc);
> =20
>      s->vhost_vdpa.device_fd =3D vdpa_device_fd;

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--0UzPK+7sv693mhX+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEoULxWu4/Ws0dB+XtgypY4gEwYSIFAmM+jOMACgkQgypY4gEw
YSJU/xAAxYpMSiEOQHhugQn4ANmCtXw6uPBZ0bRoxO88MEwgKT/cF+d0JycKXyKR
G4rffpk+KQNbDW9m7xQE/ujq4hfsl+aRjU+j7LeSwOoDmwuAuUtmjp5C2FWH5/sa
k/B7ncUBn7M6SDnwp/Fd06XIP/lYuOw/A7chTsUsKGO58X74TlImxX1qpxFdOvsc
CjjoIzwBVrtsjqYb27T9TSCSGFKf6Km3QQkieY4AKjTWBG8+WfL490VMICcyBQLR
oE88UMrLUBS3DLP0nCDkoXn9EO9rUS5+3Cf0XNj4Rdu88At5d6PxyYoPG4rLybiu
0Wgo7oRt5EE38mityrVp2ddAoIOAzhwCYoWxRtXuP9CM2f1/B98QBUzggSpMzFfE
HqeWfSTxzShQAFU8tsI8RK9YPm9cvRB51jCeAtV8lc5WjXLb+woQWd5F33VQFMEV
OBp1U7uqfJ1kCXR3f6pF+uMm973X12puX/9v4+7wIpukgq03kiwSzKKsZ+wo0PLR
7RH41GrWjVP5M/s8GqernfBCvMa/DjzJ4QT79g4RM1O/MqHqg0UKdc7IxyF3RVIQ
LNOGwU1rRgBZOob1N/s9g71AwTbHIQ/op8QwYd4EKSRHQwKBxcTArBJFPu8ZYk2x
UMP2s33498a6D5v9ZEdUe0gqTslDZoYmqhiGCFGrQNWOCdXbe2g=
=IEB5
-----END PGP SIGNATURE-----

--0UzPK+7sv693mhX+--

