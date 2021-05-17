Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B3B0386B80
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 22:37:13 +0200 (CEST)
Received: from localhost ([::1]:33080 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lijzE-0005Gu-8a
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 16:37:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41950)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1lijxH-0003xo-UM
 for qemu-devel@nongnu.org; Mon, 17 May 2021 16:35:13 -0400
Received: from mout.web.de ([212.227.15.14]:40497)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1lijxF-0007Xt-Fz
 for qemu-devel@nongnu.org; Mon, 17 May 2021 16:35:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1621283697;
 bh=CE9raXhL4kaDtIzBQOeGu0ba8u7s21GNTxM5LhRDzX4=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=MRWWNMfgr6wmfykyJTW3mdWcjgSASaGQnPgMGXvBKjk9IXIvl/j71QhSYjirj6zIh
 K8fdGgS1EWsbhWHnxsKDfJJ2h0tFW5VdQ2JjVfl8l9O4NwYAjkJnnvvoqoSVJ6rfoB
 6T/0wgm4kioV4SOa3mCPgHL3Dls7R6Z94S9ohOUE=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from gecko.fritz.box ([88.130.61.102]) by smtp.web.de (mrweb002
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0MYNkX-1lwA3V3Vjd-00VA3j; Mon, 17
 May 2021 22:34:56 +0200
Date: Mon, 17 May 2021 22:34:44 +0200
From: Lukas Straub <lukasstraub2@web.de>
To: Zhang Chen <chen.zhang@intel.com>
Subject: Re: [PATCH V6 1/6] qapi/net: Add IPFlowSpec and QMP command for
 COLO passthrough
Message-ID: <20210517223444.782d99cc@gecko.fritz.box>
In-Reply-To: <20210420151537.64360-2-chen.zhang@intel.com>
References: <20210420151537.64360-1-chen.zhang@intel.com>
 <20210420151537.64360-2-chen.zhang@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/fTa4wvGwfqVdIWf58CmUAiz";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Provags-ID: V03:K1:jSw/t4i6YrOS/3kM7H+6fcDeQ5bcKQCGmT2H2GzWFOU90ouH3LA
 KjYykaWYX6531XPMuGT1Xwgcvev3xcsRBdhJtuEUnxjZkf0TJSOm5xoQGEHwtjbgTcgWM0y
 dJGgHZd2shpDaYkgrEZXK4AUWgtA7rqb/LmhDeuArH/nEVbioJ2Cpyhomwh6jNbt8hh4JIo
 7V7k4H9iNvYu/wUzj7gMQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:8NOamkzMV7c=:wyHR5iKo1U4fQkyM0aWPQY
 eV9BodbjNsh8kcHZ15CnwjVEZxSxaTqZcQRygMaisOVRfT+AMa3Ojxd9iiEcdauxIRgbDV8ki
 oZVmaueFYXU+J/yCfMjwWtGhS/WtV5ZDGe54iFz6kr7ehjBO4toK1Ji8yDW9ubx/mJTpw4Rtb
 5JsW1r0MQzPOJjMsDN74QOyDCuUKlYlbKRFMpxhn6v+K2NSNLkGoP3b4sV+tSaB34gTRgp5O+
 PENZhl66nE3jQnOUo0CHqYgBE6OD1MD1VOkNml5LcaRgnDW5Wnxxl5hND6Mdo6aAKUaNSmNhe
 w9bQZiQGFqHeF/eioKP4vSudb7k7SH3rL7GBQHftcOtgSAUdBjrQ6P+bntVlyXNzKrREt4mc4
 8cWA9Gxo30oAYoSvsUkbb8wYYGy3dDXdpG3348gdmnrGiLPqNsDSrAT/T1WaA79NzhuaR0eAy
 CmtQ8s4zkeUm1uQZ1gHm8jRdon8yzr67QNhzqaj3lvYKECtQIgrvSMoMSYWJe4D01ETJt68nm
 hl0apGATktgt7dAooocothmWs5Yz7x1uSWFVcp3MiqXfaMeQdGKZC+cGKGRM873KkEyQFBcwG
 gRtOlV8agrNg2sD/WLW3cqrvrJGvD1bK6fwwN4ZTpT6kYF+iE+S6o4LpBaKW7QHDs2aEKylAn
 s0k0A/1XIIT9pVKdoddcwzaWXCFX9fWwDANzgFNhvuv/0QIU+lFXb9OO5wD30gdJ7ynotiYD2
 6TVuHqLJ+Gg4ZJLxhwy2Esnw9reKvrIZ1HGbllC165smMmjfTjQJz4Zfb0/+jrUJiU1BTprbF
 gq6NdKBnM/NNua5XBzAHq85pRnC0Ysz4DioM3uyaYkDfer0iSi7BUqkVaB+GFrZl6KAhzfwnA
 gV6poBVPa1VxVxYJm9DglcKNTP7DmtNfCyWHVswYOSsPm4uuzGB8f5lJC0QXHgJvDCLQMuFRx
 sRPyyWIY6r0h4jky+P13mSIjzrTCAfGHTMRZtLT3YtOPSGdiPYMaKnYkZ6IpuFAAOL14p8+ei
 wr+mbPef29UoBndbJZAiocZ5ssIa2sej4vOrCdSkQ5GB060cF3YAtx6LmSOu8fAAz7zbEM3Cz
 BUkDR1yUf+qE1+DXi4FL8Ccs/SLbWAXH+U7pvJI4K1ZWrVRTdyY+4+QPZ/zRZXOWNotuRAlD1
 MnbrYlVhsIMGc++IbhT1y64Ei7vgtkl/OpyI/eeowhYh0yJfLoDw6Rcs6H9Hat2tPbCuQ=
Received-SPF: pass client-ip=212.227.15.14; envelope-from=lukasstraub2@web.de;
 helo=mout.web.de
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--Sig_/fTa4wvGwfqVdIWf58CmUAiz
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Tue, 20 Apr 2021 23:15:32 +0800
Zhang Chen <chen.zhang@intel.com> wrote:

> Since the real user scenario does not need COLO to monitor all traffic.
> Add colo-passthrough-add and colo-passthrough-del to maintain
> a COLO network passthrough list. Add IPFlowSpec struct for all QMP comman=
ds.
> Except protocol field is necessary, other fields are optional.
>=20
> Signed-off-by: Zhang Chen <chen.zhang@intel.com>
> ---
>  net/net.c     | 10 ++++++++
>  qapi/net.json | 68 +++++++++++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 78 insertions(+)
>=20
> diff --git a/net/net.c b/net/net.c
> index edf9b95418..2a6e5f3886 100644
> --- a/net/net.c
> +++ b/net/net.c
> @@ -1196,6 +1196,16 @@ void qmp_netdev_del(const char *id, Error **errp)
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
> index af3f5b0fda..f6e4e37526 100644
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
> @@ -694,3 +695,70 @@
>  ##
>  { 'event': 'FAILOVER_NEGOTIATED',
>    'data': {'device-id': 'str'} }
> +
> +##
> +# @IPFlowSpec:

I think something like "@IPFilterRule" is clearer.

> +# IP flow specification.

"IP filter rule specification"

> +# @protocol: Transport layer protocol like TCP/UDP...
> +#
> +# @object-name: Point out the IPflow spec effective range of object,
> +#               If there is no such part, it means global spec.

I think IPFlowSpec should be kept generic, so object-name should not be
part of it. It should move directly to 'colo-passthrough-add' and
'colo-passthrough-del'.

Also please use clearer wording. Proposal:
"@object-name: The id of the colo-compare object to add the filter to."

Again, if other net filters support the new feature in the future, the
wording can always be changed later.

> +# @source: Source address and port.
> +#
> +# @destination: Destination address and port.
> +#
> +# Since: 6.1
> +##
> +{ 'struct': 'IPFlowSpec',
> +  'data': { 'protocol': 'str', '*object-name': 'str',
> +    '*source': 'InetSocketAddressBase',
> +    '*destination': 'InetSocketAddressBase' } }

I think 'protocol' should be made optional too.

> +##
> +# @colo-passthrough-add:
> +#
> +# Add passthrough entry according to user's needs in COLO-compare.
> +# Source IP/port and destination IP/port both optional, If user just
> +# input parts of infotmation, it will match all.
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
> +# Delete passthrough entry according to user's needs in COLO-compare.
> +# Source IP/port and destination IP/port both optional, If user just
> +# input parts of infotmation, it will match all.
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


--Sig_/fTa4wvGwfqVdIWf58CmUAiz
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEg/qxWKDZuPtyYo+kNasLKJxdslgFAmCi02QACgkQNasLKJxd
slj76Q//Wq0dP63hKdMvVeLw4unJL7gPpWZMOfbUe2FnTzfPRDuC7+j1PK8ig420
AcxpV3g2QswblgYr9lEWneS+74AmJW1//ycWPGxAcHxUuVFB2Xt7TbH/XjP9KkHV
icm0l8VKakukWikXNFzclOAGFY6WCBy4xiETfIzL7lco72t3s7zKobpzqCsUgiRg
5vJYDpr3P8I5iNIsBYPowcmgWueL1ZkBnO6rmFAoo9zGL5Imx3SeeZsFvPygeYyP
m55HEIyDJQZXU19GHQzPBwdjaEVyHaC2rADE3xVV3wSME8chP6Pvmmh3SPuFUJZ3
godieHS+NHuq3gFt1PBkppebDuLO9B3flLP6ofRdsm25E9unWEIfkTz36JxOTlcO
Cjh/ZxITfeqFXfgfia+s/2K/L6I4i2TMUZK2L1iy7VGnYKS4w1b/wfJsCwqklCZG
TeT0qkmqpoHgSWgd8UAi/CzpTyLXWY1rqaexew89l/vwFsXN9Rq/qKDzzoxwqq6r
hu4DWfAw5D6Qt5i3jEDWO/uY/1uFAv0PfUx7h6K5sieFIfl7HJMH37h2kuV7Sv6A
CI1jBzqvwDWwAcLrM6k4t+vyWnGs8WhunufDHyXbngIR7tZt4pLiVtuOoUXMZihp
p2iXSQucXOGZ5kcZrIElsfB+Jrcuh0tSk3/slpPLubAv4kiK0Fo=
=Izya
-----END PGP SIGNATURE-----

--Sig_/fTa4wvGwfqVdIWf58CmUAiz--

