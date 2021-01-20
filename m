Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ED3A2FD898
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jan 2021 19:45:32 +0100 (CET)
Received: from localhost ([::1]:51914 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2ITz-0007sf-K4
	for lists+qemu-devel@lfdr.de; Wed, 20 Jan 2021 13:45:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1l2ISP-0007Fc-EQ
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 13:43:53 -0500
Received: from mout.web.de ([217.72.192.78]:57803)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1l2ISN-0003Ii-AU
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 13:43:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1611168206;
 bh=dLjvf1eSuNANJyynJlkxECHdzn2B9lGaBc/ORT7LHjY=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=H0CwuT8hHkH357RcyyvcY9EPQchJMB7+Gkuu2O+GhT00s/of5Qfw/OveKA31qoKPe
 ybBuHsJbBxZxaTK0Jl9994USaBCZ+JI42s8bi5pi7aCKFruLqr8jTinoD/QD76wWg1
 Mwu/L/z+uy4V0tNgIVuV3H83mClz6yvuhEs5Jph0=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from gecko.fritz.box ([88.130.61.127]) by smtp.web.de (mrweb103
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0Md4pC-1lKNX22wl8-00IDhH; Wed, 20
 Jan 2021 19:43:26 +0100
Date: Wed, 20 Jan 2021 19:43:06 +0100
From: Lukas Straub <lukasstraub2@web.de>
To: leirao <lei.rao@intel.com>
Subject: Re: [PATCH 01/10] Remove some duplicate trace code.
Message-ID: <20210120194306.67d87a61@gecko.fritz.box>
In-Reply-To: <1610505995-144129-2-git-send-email-lei.rao@intel.com>
References: <1610505995-144129-1-git-send-email-lei.rao@intel.com>
 <1610505995-144129-2-git-send-email-lei.rao@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/onbB_UdSRE3w7zrZjMoZSYv";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Provags-ID: V03:K1:OxdJJsrqu8DhW2A+XwG/uUFCEiBGmYzhlJfwJASaolbEBl7/x8T
 Q3UvLfZBJxj6vaB3wibLBlczsub/SFV8KrTgx/SNqwZ1Yp1kr9PdT/eIHJPLuKFa73MxLiC
 ZpD/9pKeSWNMhluMQfeJkkWku6sZvMsVeEgJCs8fqCySVcMJgpFo7R9MvHHhDzu6tH0cUyM
 z+oyqO7opOeM2jKFT6eDg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:oXUPL2wHN8o=:UbS4I2C+TAofk47NU4ZqSo
 6CxKna3vb3hu8LQAWayMON91fZl9z091drWzcZTeay4YWvu3gRYV81B+88qapl9/4vfsS1vlg
 k2mw5twOyMn6/c1o3425akOH/Q6upVKOisbmWV2wTkcvi8nq4jMrLRvdctBa9TLE3tOX7os/e
 M9lydmdQ2gVr2YW0o3Uf+et18p/orKBTW/gqKdazkTXzfIbZyXRrk/7/4j2/ExlNQ4JpSTP+7
 AYPDEnXhXbXoN+eCBi7VrZuXvQF0ezIxdTJbouOeXFKHhKbr/KVDlp1Ggj17L2qAJseTD25f+
 96GAqP2vpv6RDPEdupZhOBahr5rb59Sk+IjLHL9KJPp97c0kWvBUPKDHTnkoceuyNLttkzCn8
 zHREyzsCj59uObLJOtGa858U/kct+jIHgOK8Xg+YAFUHVxIcnuf09hmMTvKQ/y5GvP+OYIf9k
 5/g2sHRbrjHgV7w3qvsMPQP1zBSfQybs9w9NEODudGSpHO8HTLnh9pRQaTFSOYKMWmAVwhNzF
 UM7ukfQMq63sseg1woK5O+V3nxNQKWRVgWeGVIWfzmWcxKGOP9isu5PcFkdsZ86VGbX2/nz1G
 z8h95f3Cyt5MKsjFRriPMj2V2AuUGbxAFZuHHIx96zFr88XbzBvat/FjezEwTWUOPhp4nKwr8
 tXZTL7ktpD8rbgPeanzw1bFdI2tl+Sr7AzHvMmPn/sEAZnR5NCcmPTLN9tUqcGJ7KFd500/RD
 IFeV4/xiexI/3Sy3Y+x7PK0HDK3kRmOb/0PpffhnfDejmsgD+QiRg7hgTyNa7MWtehPosjMDR
 i0oJyIbKvu6dev60foxHR5/ps0ksfc1vVUQ43ZEnfGuBm2T9KBiETNOcdAw1Ppu+Q/I9/TDV7
 wkJZYJBteyThCO78Mv1g==
Received-SPF: pass client-ip=217.72.192.78; envelope-from=lukasstraub2@web.de;
 helo=mout.web.de
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: zhang.zhanghailiang@huawei.com, lizhijian@cn.fujitsu.com,
 quintela@redhat.com, jasowang@redhat.com, dgilbert@redhat.com,
 qemu-devel@nongnu.org, chen.zhang@intel.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--Sig_/onbB_UdSRE3w7zrZjMoZSYv
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Wed, 13 Jan 2021 10:46:26 +0800
leirao <lei.rao@intel.com> wrote:

> From: "Rao, Lei" <lei.rao@intel.com>
>=20
> There is the same trace code in the colo_compare_packet_payload.
>=20
> Signed-off-by: Lei Rao <lei.rao@intel.com>

Looks good to me,

Reviewed-by: Lukas Straub <lukasstraub2@web.de>

> ---
>  net/colo-compare.c | 13 -------------
>  1 file changed, 13 deletions(-)
>=20
> diff --git a/net/colo-compare.c b/net/colo-compare.c
> index 84db497..9e18baa 100644
> --- a/net/colo-compare.c
> +++ b/net/colo-compare.c
> @@ -590,19 +590,6 @@ static int colo_packet_compare_other(Packet *spkt, P=
acket *ppkt)
>      uint16_t offset =3D ppkt->vnet_hdr_len;
> =20
>      trace_colo_compare_main("compare other");
> -    if (trace_event_get_state_backends(TRACE_COLO_COMPARE_IP_INFO)) {
> -        char pri_ip_src[20], pri_ip_dst[20], sec_ip_src[20], sec_ip_dst[=
20];
> -
> -        strcpy(pri_ip_src, inet_ntoa(ppkt->ip->ip_src));
> -        strcpy(pri_ip_dst, inet_ntoa(ppkt->ip->ip_dst));
> -        strcpy(sec_ip_src, inet_ntoa(spkt->ip->ip_src));
> -        strcpy(sec_ip_dst, inet_ntoa(spkt->ip->ip_dst));
> -
> -        trace_colo_compare_ip_info(ppkt->size, pri_ip_src,
> -                                   pri_ip_dst, spkt->size,
> -                                   sec_ip_src, sec_ip_dst);
> -    }
> -
>      if (ppkt->size !=3D spkt->size) {
>          trace_colo_compare_main("Other: payload size of packets are diff=
erent");
>          return -1;



--=20


--Sig_/onbB_UdSRE3w7zrZjMoZSYv
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEg/qxWKDZuPtyYo+kNasLKJxdslgFAmAIeboACgkQNasLKJxd
slh+5hAAqOe4ZKi88ruzhD2bDj/IAz5a/eYutDPSU4x+StvXx/Z1fjemki3ygHnv
uSUMxxgghu9C2UZFaVglpb5jBmPVYu6VlKk8Sx1F0Vmu1QKmvg01DXCsIOw2o8qz
o+ASk0qV4hsHGpQ/QCedO6Kdz5mP1HCGH2CSRgYtKLGa7jrVKUT1oJQlkwxrrfnn
tzC+nkQwWMmqtloeN0ujCmboLtBUXr4BrAq53NTa/ZJPH81KH4uRCj+pPtsk+ztw
Ky0ReEzwnDqSyeCxJAijgMuGEafDDP/XehWlydCVPBbCLuZZS01MCR0tCKmqn7BQ
hGU5rxmwN4P3GbGnFh1rO8vzvvYdqAoZNPWt4IKTU1u2UGQekih/yPd79Rk6xgsU
FUc6MF/oNdvuoNB7bzW0yLHRMIJen2kOBMt0XfIW9zSDiyCXLTNrgye666Q7395I
Kpc3qkGqhBzyza5Kqfal6oOAnp4AR+DsEk8jtYDYoflOSpLRL3IUmqsSn8uB/wS/
WxbcVh4Jauak0kZFiL0/5vK9D4kkUVtmNPnhUO2ogRzXNESAB8OP3L891jRHdHyQ
PyeW20cBDAsyR4eqXydgTZTt0tFEPX5TJ1fEpAXw0RVoPyrvxiG1inUXYBElrBmm
VoVgfDWd1BVPCh6TULEtaupnehI6IymnkQ6iRU+KD/Q2ibgJqHc=
=AV8Z
-----END PGP SIGNATURE-----

--Sig_/onbB_UdSRE3w7zrZjMoZSYv--

