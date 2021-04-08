Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A82DD357BD7
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Apr 2021 07:31:50 +0200 (CEST)
Received: from localhost ([::1]:54202 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUNGf-00039I-N8
	for lists+qemu-devel@lfdr.de; Thu, 08 Apr 2021 01:31:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39684)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1lUNFX-0002GB-OT
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 01:30:39 -0400
Received: from mga02.intel.com ([134.134.136.20]:63540)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1lUNFV-00083R-3j
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 01:30:39 -0400
IronPort-SDR: qdTyNN+0kwHEu5SBP4IUob1rx54eGhovwJgzhvjnR2DurCqIyTeNfriyIua8r4bhX0sA3bSSIM
 bzKtP1UdZN+w==
X-IronPort-AV: E=McAfee;i="6000,8403,9947"; a="180595760"
X-IronPort-AV: E=Sophos;i="5.82,205,1613462400"; d="scan'208";a="180595760"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2021 22:30:35 -0700
IronPort-SDR: 3zwEePF1xqItEZs+dckTygIAnAsCisVcr/81d+WJfOET2pQXq5lxTlyzGSlkJt6y7gYU6QvFpE
 I3ZTY4p1B3cw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,205,1613462400"; d="scan'208";a="422077408"
Received: from fmsmsx604.amr.corp.intel.com ([10.18.126.84])
 by orsmga008.jf.intel.com with ESMTP; 07 Apr 2021 22:30:32 -0700
Received: from shsmsx603.ccr.corp.intel.com (10.109.6.143) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Wed, 7 Apr 2021 22:30:29 -0700
Received: from shsmsx605.ccr.corp.intel.com (10.109.6.215) by
 SHSMSX603.ccr.corp.intel.com (10.109.6.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Thu, 8 Apr 2021 13:30:27 +0800
Received: from shsmsx605.ccr.corp.intel.com ([10.109.6.215]) by
 SHSMSX605.ccr.corp.intel.com ([10.109.6.215]) with mapi id 15.01.2106.013;
 Thu, 8 Apr 2021 13:30:27 +0800
From: "Zhang, Chen" <chen.zhang@intel.com>
To: "Rao, Lei" <lei.rao@intel.com>, "lizhijian@cn.fujitsu.com"
 <lizhijian@cn.fujitsu.com>, "jasowang@redhat.com" <jasowang@redhat.com>,
 "quintela@redhat.com" <quintela@redhat.com>, "dgilbert@redhat.com"
 <dgilbert@redhat.com>, "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "lukasstraub2@web.de" <lukasstraub2@web.de>
Subject: RE: [PATCH v5 05/10] Add a function named packet_new_nocopy for COLO.
Thread-Topic: [PATCH v5 05/10] Add a function named packet_new_nocopy for COLO.
Thread-Index: AQHXJs6IS4e8yQ99LEi2eSFOQHCn1aqqIkhg
Date: Thu, 8 Apr 2021 05:30:27 +0000
Message-ID: <d947308fe00f41ae90b6e2f0241c5c72@intel.com>
References: <1617263249-54501-1-git-send-email-lei.rao@intel.com>
 <1617263249-54501-6-git-send-email-lei.rao@intel.com>
In-Reply-To: <1617263249-54501-6-git-send-email-lei.rao@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.5.1.3
dlp-reaction: no-action
x-originating-ip: [10.239.127.36]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Received-SPF: pass client-ip=134.134.136.20; envelope-from=chen.zhang@intel.com;
 helo=mga02.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
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
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



> -----Original Message-----
> From: Rao, Lei <lei.rao@intel.com>
> Sent: Thursday, April 1, 2021 3:47 PM
> To: Zhang, Chen <chen.zhang@intel.com>; lizhijian@cn.fujitsu.com;
> jasowang@redhat.com; quintela@redhat.com; dgilbert@redhat.com;
> pbonzini@redhat.com; lukasstraub2@web.de
> Cc: qemu-devel@nongnu.org; Rao, Lei <lei.rao@intel.com>
> Subject: [PATCH v5 05/10] Add a function named packet_new_nocopy for
> COLO.
>=20
> From: "Rao, Lei" <lei.rao@intel.com>
>=20
> Use the packet_new_nocopy instead of packet_new in the filter-rewriter
> module. There will be one less memory copy in the processing of each
> network packet.
>=20
> Signed-off-by: Lei Rao <lei.rao@intel.com>
> ---
>  net/colo.c            | 23 +++++++++++++++++++++++
>  net/colo.h            |  1 +
>  net/filter-rewriter.c |  3 +--
>  3 files changed, 25 insertions(+), 2 deletions(-)
>=20
> diff --git a/net/colo.c b/net/colo.c
> index ef00609..58106a8 100644
> --- a/net/colo.c
> +++ b/net/colo.c
> @@ -174,6 +174,29 @@ Packet *packet_new(const void *data, int size, int
> vnet_hdr_len)
>      return pkt;
>  }
>=20
> +/*
> + * packet_new_nocopy will not copy data, so the caller can't release
> + * the data. And it will be released in packet_destroy.
> + */
> +Packet *packet_new_nocopy(void *data, int size, int vnet_hdr_len) {
> +    Packet *pkt =3D g_slice_new(Packet);

We can use g_slice_new0() to avoid "pkt->xxx =3D 0" here.
For the original code also need do this work to optimize code.

Thanks
Chen

> +
> +    pkt->data =3D data;
> +    pkt->size =3D size;
> +    pkt->creation_ms =3D qemu_clock_get_ms(QEMU_CLOCK_HOST);
> +    pkt->vnet_hdr_len =3D vnet_hdr_len;
> +    pkt->tcp_seq =3D 0;
> +    pkt->tcp_ack =3D 0;
> +    pkt->seq_end =3D 0;
> +    pkt->header_size =3D 0;
> +    pkt->payload_size =3D 0;
> +    pkt->offset =3D 0;
> +    pkt->flags =3D 0;
> +
> +    return pkt;
> +}
> +
>  void packet_destroy(void *opaque, void *user_data)  {
>      Packet *pkt =3D opaque;
> diff --git a/net/colo.h b/net/colo.h
> index 573ab91..d91cd24 100644
> --- a/net/colo.h
> +++ b/net/colo.h
> @@ -101,6 +101,7 @@ bool connection_has_tracked(GHashTable
> *connection_track_table,
>                              ConnectionKey *key);  void
> connection_hashtable_reset(GHashTable *connection_track_table);  Packet
> *packet_new(const void *data, int size, int vnet_hdr_len);
> +Packet *packet_new_nocopy(void *data, int size, int vnet_hdr_len);
>  void packet_destroy(void *opaque, void *user_data);  void
> packet_destroy_partial(void *opaque, void *user_data);
>=20
> diff --git a/net/filter-rewriter.c b/net/filter-rewriter.c index 10fe393.=
.cb3a96c
> 100644
> --- a/net/filter-rewriter.c
> +++ b/net/filter-rewriter.c
> @@ -270,8 +270,7 @@ static ssize_t
> colo_rewriter_receive_iov(NetFilterState *nf,
>          vnet_hdr_len =3D nf->netdev->vnet_hdr_len;
>      }
>=20
> -    pkt =3D packet_new(buf, size, vnet_hdr_len);
> -    g_free(buf);
> +    pkt =3D packet_new_nocopy(buf, size, vnet_hdr_len);
>=20
>      /*
>       * if we get tcp packet
> --
> 1.8.3.1


