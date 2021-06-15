Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED19D3A8399
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 17:05:46 +0200 (CEST)
Received: from localhost ([::1]:52196 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltAdN-0002xR-VK
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 11:05:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51062)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1ltAaD-00007g-TM
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 11:02:29 -0400
Received: from mout.web.de ([217.72.192.78]:39031)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1ltAa8-0004n2-G0
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 11:02:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1623769326;
 bh=2hk6kFdeprV2A7CZ9RU9LIMdN3MwAmuH8VijVyU6Jcg=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=YZF16buCqtFL/WkRgH2oJTu8hUreyttIo0ruTCIE8uyV8Y6pCQ/M1mBL5ibvD/pGo
 /r5VfHGPAW2EpOE0Kx8zEguewDQRsW9eU2gYgahvo5oNGWXrh6wDZ23QJymz47g7uC
 yXBKPJ5lhGO0NWZeds9CaNwBE4aMMAcuENAwMJ0M=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from gecko.fritz.box ([87.123.206.51]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1N0qr9-1l7xmN1IEn-00wqNV; Tue, 15
 Jun 2021 17:02:06 +0200
Date: Tue, 15 Jun 2021 17:01:48 +0200
From: Lukas Straub <lukasstraub2@web.de>
To: Zhang Chen <chen.zhang@intel.com>
Subject: Re: [PATCH V8 1/6] qapi/net: Add IPFlowSpec and QMP command for
 COLO passthrough
Message-ID: <20210615170148.707b092e@gecko.fritz.box>
In-Reply-To: <20210615113740.2278015-2-chen.zhang@intel.com>
References: <20210615113740.2278015-1-chen.zhang@intel.com>
 <20210615113740.2278015-2-chen.zhang@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/O+vf3edauF=gq2Hgx28L8eM";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Provags-ID: V03:K1:os5dEiCQquEiLPpbXVUcCkJtc71EG0fkoKxDKx2mfczRLKUbAjH
 iqKFwzmBOzDPJpSuO/0cIsqygjFJe+PEV93T7E9D+3mIJRLIi39jDA+OCgQTOhgMeQXyFb2
 5Kvi6euLoOkiXk+8JDQ92P/QU8C0p3PgxcKgrNYN076BoSLMb8ROOReX2AemVrzLeYyc5xY
 UAoa+X9zP++enaUvexIXA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:JaXjzklpDKc=:BTmrM9vug/k4qYXJ2rfWqF
 /nET4Xq6wsOIrleoZEQZsWQYLWYcFZprH6iBeavJxXIfzbkgy7DYJwM7EnhW4NfvuzpwKvqZ5
 LLD46awIGxuH/G9VGVIk5XD2AVHmBHk+wrGOTC+b6hh7rgFOnRtIJnK1hqlPXh3+z61a5iaHW
 UDM498/Zh+FESzT9m6jtwuk6FbVA8DsbvtefU1RHUqonBMJPV6IQux/U28ldPuqjOHPQRhfBX
 Ns9A3aLLkCuyy5MGUVZ7u6z54HFG7DD5RdbpTVCaFPy9dx8XVgZoM1RgVOdpPuAVkiMFMOaPH
 vXjui6m/hfbTgyPBsCE/Vk26Wui3rIna5nCmhc4lkdC5odu2L4nbCXeZwJjEZf70nOQDvwDvk
 H1loBlnELt+WiUei1YbAnDTMN8AAyI7YAVo7DySAm+0W3lqvvC2e31CbgIa/KZhV/kp6SO7BX
 kf6d7wE8A8GsHmnVYd7acOlj49u2t01B9rk2xi9i0KtJu2TmKxgwLVpYVomvSlQ9QY21uGEp+
 BWnaHEdp3J3JiWFrdN90nJOp2+WLsBADgN6P0FP4lIXvCnuPs+DU4f1U9nXEt5cewxHyZMcnu
 zihp8RI307XTBYb+FZiUBEaJSPplmWFg6rrO0gyX7kVR5Pu4i8uPVsBwChmVB8aY6ijBNH5MI
 ci0ak0BkCxndu6PVT/5KdOjBQvOydIhZ7XfvjElpOMv7/wZpaToAKmOkmqrUXKsNtNfKxhuoi
 lhqnlGHgPgRFqC5bODHNp3plW+U3a2MvKQGMpr712fXH5ys4QtN4059vty12xQwKG/ZqNz6r0
 m2wujCTGMypwg5oQl+mf7Zh4WUM7xYASWRDQ6+9tI/SH0fGkaSKjwqdv2q1Mf74FHaLC5Vt3J
 3oK8A86D0oscu/+417dN3Z7Dp6hRxBSBlhcjIxZEgIYVJ4MX4EmuICFnx+usyXDzMbhkPTruj
 bGhAHK2A/Ak+d4HIfZo6Y2C/l2AbnGAUzN0gcXIdKBUw5dLZSPbMfphx4AIcnY086KNuapGfN
 ZSzW4gxYGWhWqZZXBvdx4tyw5MvGFMGawo0houNA8v3eDqUGMwI61JNxAli2brqp0CFj3ocDw
 AjDJcbYYqyrRfQfWO1lis7w1H1wFFg6Gg+nLvDTeh//2YwehHlXhGOjCg==
Received-SPF: pass client-ip=217.72.192.78; envelope-from=lukasstraub2@web.de;
 helo=mout.web.de
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: "Daniel P. =?UTF-8?B?QmVycmFuZ8Op?=" <berrange@redhat.com>,
 Li Zhijian <lizhijian@cn.fujitsu.com>, Jason Wang <jasowang@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-dev <qemu-devel@nongnu.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Zhang Chen <zhangckid@gmail.com>,
 Eric Blake <eblake@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--Sig_/O+vf3edauF=gq2Hgx28L8eM
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Tue, 15 Jun 2021 19:37:35 +0800
Zhang Chen <chen.zhang@intel.com> wrote:

> Since the real user scenario does not need COLO to monitor all traffic.
> Add colo-passthrough-add and colo-passthrough-del to maintain
> a COLO network passthrough list. Add IPFlowSpec struct for all QMP comman=
ds.
> All the fields of IPFlowSpec are optional.
>=20
> Signed-off-by: Zhang Chen <chen.zhang@intel.com>
> ---
>  net/net.c     | 10 +++++++
>  qapi/net.json | 74 +++++++++++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 84 insertions(+)
>=20
> diff --git a/net/net.c b/net/net.c
> index 76bbb7c31b..f913e97983 100644
> --- a/net/net.c
> +++ b/net/net.c
> @@ -1195,6 +1195,16 @@ void qmp_netdev_del(const char *id, Error **errp)
>      }
>  }
> =20
> +void qmp_colo_passthrough_add(IPFlowSpec *spec, Error **errp)
> +{
> +    /* TODO implement setup passthrough rule */
> +}
> +
> +void qmp_colo_passthrough_del(IPFlowSpec *spec, Error **errp)
> +{
> +    /* TODO implement delete passthrough rule */
> +}
> +
>  static void netfilter_print_info(Monitor *mon, NetFilterState *nf)
>  {
>      char *str;
> diff --git a/qapi/net.json b/qapi/net.json
> index 7fab2e7cd8..91f2e1495a 100644
> --- a/qapi/net.json
> +++ b/qapi/net.json
> @@ -7,6 +7,7 @@
>  ##
> =20
>  { 'include': 'common.json' }
> +{ 'include': 'sockets.json' }
> =20
>  ##
>  # @set_link:
> @@ -696,3 +697,76 @@
>  ##
>  { 'event': 'FAILOVER_NEGOTIATED',
>    'data': {'device-id': 'str'} }
> +
> +##
> +# @IPFlowSpec:
> +#
> +# IP flow specification.
> +#
> +# @protocol: Transport layer protocol like TCP/UDP, etc. The protocol is=
 the
> +#            string instead of enum, because it can be passed to getprot=
obyname(3)
> +#            and avoid duplication with /etc/protocols.
> +#
> +# @object-name: The @object-name means packet handler in Qemu. Because n=
ot
> +#               all the network packet must pass the colo-compare module,
> +#               the net-filters are same situation. There modules attach=
 to
> +#               netdev or chardev to work, VM can run multiple modules
> +#               at the same time. So it needs the object-name to set
> +#               the effective module.

Again: "@object-name: The id of the colo-compare object to add the filter t=
o."

> +# @source: Source address and port.
> +#
> +# @destination: Destination address and port.
> +#
> +# Since: 6.1
> +##
> +{ 'struct': 'IPFlowSpec',
> +  'data': { '*protocol': 'str', '*object-name': 'str',
> +    '*source': 'InetSocketAddressBase',
> +    '*destination': 'InetSocketAddressBase' } }
> +
> +##
> +# @colo-passthrough-add:
> +#
> +# Add passthrough entry IPFlowSpec to the COLO-compare instance.
> +# The protocol and source/destination IP/ports are optional. if the user
> +# only inputs part of the information, this will match all traffic.
> +#
> +# Returns: Nothing on success
> +#
> +# Since: 6.1
> +#
> +# Example:
> +#
> +# -> { "execute": "colo-passthrough-add",
> +#      "arguments": { "protocol": "tcp", "object-name": "object0",
> +#      "source": {"host": "192.168.1.1", "port": "1234"},
> +#      "destination": {"host": "192.168.1.2", "port": "4321"} } }
> +# <- { "return": {} }
> +#
> +##
> +{ 'command': 'colo-passthrough-add', 'boxed': true,
> +     'data': 'IPFlowSpec' }
> +
> +##
> +# @colo-passthrough-del:
> +#
> +# Delete passthrough entry IPFlowSpec to the COLO-compare instance.
> +# The protocol and source/destination IP/ports are optional. if the user
> +# only inputs part of the information, this will match all traffic.
> +#
> +# Returns: Nothing on success
> +#
> +# Since: 6.1
> +#
> +# Example:
> +#
> +# -> { "execute": "colo-passthrough-del",
> +#      "arguments": { "protocol": "tcp", "object-name": "object0",
> +#      "source": {"host": "192.168.1.1", "port": "1234"},
> +#      "destination": {"host": "192.168.1.2", "port": "4321"} } }
> +# <- { "return": {} }
> +#
> +##
> +{ 'command': 'colo-passthrough-del', 'boxed': true,
> +     'data': 'IPFlowSpec' }



--=20


--Sig_/O+vf3edauF=gq2Hgx28L8eM
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEg/qxWKDZuPtyYo+kNasLKJxdslgFAmDIwNwACgkQNasLKJxd
slhX7w/9Er4VFriJrStvUCoTKforCW0xckNWNJjlkhrZLKblhllHdCD/XQYjbYHr
8Hqk4/t4C6k7p0/swTIJayiqHfxDt86wWN1I9cIYdklZhR6s7odmeUO4ssoPB0bm
6E4SeVVT3CqKcHvXyWuLbzPlaUk/CvdGGQB2Lb/XGHH+nweZRi2KCj2TJ9Ehwug8
R4Qg77OpzOldl9uRQjg4Nm3C949y8u36OKp28Xg2Dk3OJF57FBWXTzc5fdsVAewb
j+vY1zI4kTTEHw735RVOfM06BimGaB9qAPcba9PUC/2S3gYZx1Q/hY3b9vfAQSG3
k+BI9bqZpIDz8JOqNzKQxC4LeVR3f7EofuV/wypZbimCFW0mYf5lpw8KBHauHbpp
9krlKGb6vKEXE5N1MHs1bOhu5pDwrcbQYoBd0mUlXsPigNlvli2kV3brOVp8wjNd
Q+u6QTfsvZ/VzmiXhj7TcBdERif+uCkqLKRCMfCnRAUqs/S1WsvV0vH4VuFaRVVb
JP4x8n/NEU27fauEij/JwDq/KNqFKnxutnYLUeSI86+HaZ9x06zzbSC8g3rd+GDe
01ICR1va+f/d8B+euJzIast4YfRvlkOXt5i8ymg1DiNWJzG8KaLsXvY7lO+oQvGo
ymtYJmUC0mZy+VsHd3C/+UhUjEEpnub7vsz6Inb8d7fVd2bNXV8=
=w9AF
-----END PGP SIGNATURE-----

--Sig_/O+vf3edauF=gq2Hgx28L8eM--

