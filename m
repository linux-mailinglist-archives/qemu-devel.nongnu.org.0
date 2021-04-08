Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B98F0357BCC
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Apr 2021 07:23:42 +0200 (CEST)
Received: from localhost ([::1]:44530 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUN8n-0006vj-8T
	for lists+qemu-devel@lfdr.de; Thu, 08 Apr 2021 01:23:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37368)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1lUN73-0006Fy-Bp
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 01:21:53 -0400
Received: from mga12.intel.com ([192.55.52.136]:48306)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1lUN70-0002gj-OK
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 01:21:52 -0400
IronPort-SDR: C7IzrXym6w9nJcxNlT8VFX4qTpig2zJk1ClTJkQY8uYLLsE4yK4mngDZN+qJXiR/Ih8paDJ01R
 tqSqqayQG0Wg==
X-IronPort-AV: E=McAfee;i="6000,8403,9947"; a="172936634"
X-IronPort-AV: E=Sophos;i="5.82,205,1613462400"; d="scan'208";a="172936634"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2021 22:21:43 -0700
IronPort-SDR: 9p9T+KMbFLxkM/BUQw6OET9uu9dAvuZ3tMh5ULxJYN66BbatVkGvJu0SM0YCHc7/V1dYGiKYCV
 TXERQtZdLlcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,205,1613462400"; d="scan'208";a="448520000"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by FMSMGA003.fm.intel.com with ESMTP; 07 Apr 2021 22:21:43 -0700
Received: from shsmsx606.ccr.corp.intel.com (10.109.6.216) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Wed, 7 Apr 2021 22:21:42 -0700
Received: from shsmsx605.ccr.corp.intel.com (10.109.6.215) by
 SHSMSX606.ccr.corp.intel.com (10.109.6.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Thu, 8 Apr 2021 13:21:40 +0800
Received: from shsmsx605.ccr.corp.intel.com ([10.109.6.215]) by
 SHSMSX605.ccr.corp.intel.com ([10.109.6.215]) with mapi id 15.01.2106.013;
 Thu, 8 Apr 2021 13:21:40 +0800
From: "Zhang, Chen" <chen.zhang@intel.com>
To: "Rao, Lei" <lei.rao@intel.com>, "lizhijian@cn.fujitsu.com"
 <lizhijian@cn.fujitsu.com>, "jasowang@redhat.com" <jasowang@redhat.com>,
 "quintela@redhat.com" <quintela@redhat.com>, "dgilbert@redhat.com"
 <dgilbert@redhat.com>, "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "lukasstraub2@web.de" <lukasstraub2@web.de>
Subject: RE: [PATCH v5 01/10] Remove some duplicate trace code.
Thread-Topic: [PATCH v5 01/10] Remove some duplicate trace code.
Thread-Index: AQHXJs6AFML6eIpsDk+Amj7c7iSD3qqqID/g
Date: Thu, 8 Apr 2021 05:21:40 +0000
Message-ID: <3e2cb8d558e14f18b3108fdcb489e7b8@intel.com>
References: <1617263249-54501-1-git-send-email-lei.rao@intel.com>
 <1617263249-54501-2-git-send-email-lei.rao@intel.com>
In-Reply-To: <1617263249-54501-2-git-send-email-lei.rao@intel.com>
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
Received-SPF: pass client-ip=192.55.52.136; envelope-from=chen.zhang@intel.com;
 helo=mga12.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
> Subject: [PATCH v5 01/10] Remove some duplicate trace code.
>=20
> From: "Rao, Lei" <lei.rao@intel.com>
>=20
> There is the same trace code in the colo_compare_packet_payload.
>=20
> Signed-off-by: Lei Rao <lei.rao@intel.com>
> Reviewed-by: Li Zhijian <lizhijian@fujitsu.com>

Reviewed-by: Zhang Chen <chen.zhang@intel.com>

Thanks
Chen

> ---
>  net/colo-compare.c | 13 -------------
>  1 file changed, 13 deletions(-)
>=20
> diff --git a/net/colo-compare.c b/net/colo-compare.c index 9d1ad99..c142c=
08
> 100644
> --- a/net/colo-compare.c
> +++ b/net/colo-compare.c
> @@ -590,19 +590,6 @@ static int colo_packet_compare_other(Packet *spkt,
> Packet *ppkt)
>      uint16_t offset =3D ppkt->vnet_hdr_len;
>=20
>      trace_colo_compare_main("compare other");
> -    if (trace_event_get_state_backends(TRACE_COLO_COMPARE_IP_INFO))
> {
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
>          trace_colo_compare_main("Other: payload size of packets are
> different");
>          return -1;
> --
> 1.8.3.1


