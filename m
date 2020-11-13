Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 465D72B1487
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Nov 2020 04:06:19 +0100 (CET)
Received: from localhost ([::1]:53786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdPPl-0002cX-SX
	for lists+qemu-devel@lfdr.de; Thu, 12 Nov 2020 22:06:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34210)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1kdPOe-00024A-Hw
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 22:05:08 -0500
Received: from mga05.intel.com ([192.55.52.43]:3360)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1kdPOb-0007XK-Hh
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 22:05:08 -0500
IronPort-SDR: Zjh0nzDaj/nXzodqTNSXm8U+9jA3YjAjdvkUZy7186BxP9rFDaHcKUMJX5v4x9xE4mlGg3FMEC
 GcYe2wBIElTg==
X-IronPort-AV: E=McAfee;i="6000,8403,9803"; a="255128481"
X-IronPort-AV: E=Sophos;i="5.77,473,1596524400"; d="scan'208";a="255128481"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2020 19:04:58 -0800
IronPort-SDR: Pml6OCDu2GX41FkHgg00dCF9Zwmie3QaBkG6hCNdX2fXzkXYmME71s63rae/3IPEB/RyEAO/FJ
 341udppof+XA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,473,1596524400"; d="scan'208";a="530904160"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga006.fm.intel.com with ESMTP; 12 Nov 2020 19:04:58 -0800
Received: from shsmsx605.ccr.corp.intel.com (10.109.6.215) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Thu, 12 Nov 2020 19:04:57 -0800
Received: from shsmsx605.ccr.corp.intel.com (10.109.6.215) by
 SHSMSX605.ccr.corp.intel.com (10.109.6.215) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Fri, 13 Nov 2020 11:04:55 +0800
Received: from shsmsx605.ccr.corp.intel.com ([10.109.6.215]) by
 SHSMSX605.ccr.corp.intel.com ([10.109.6.215]) with mapi id 15.01.1713.004;
 Fri, 13 Nov 2020 11:04:55 +0800
From: "Zhang, Chen" <chen.zhang@intel.com>
To: Eduardo Habkost <ehabkost@redhat.com>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Subject: RE: [PATCH v2 09/12] colo: Use class properties
Thread-Topic: [PATCH v2 09/12] colo: Use class properties
Thread-Index: AQHWuFnib/BP9+pBeEeO2o9QHVgZlKnFYekA
Date: Fri, 13 Nov 2020 03:04:55 +0000
Message-ID: <3ee0a0cdbdca455384114c8c2dfb251e@intel.com>
References: <20201111183823.283752-1-ehabkost@redhat.com>
 <20201111183823.283752-10-ehabkost@redhat.com>
In-Reply-To: <20201111183823.283752-10-ehabkost@redhat.com>
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
Received-SPF: pass client-ip=192.55.52.43; envelope-from=chen.zhang@intel.com;
 helo=mga05.intel.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/12 22:04:58
X-ACL-Warn: Detected OS   = FreeBSD 9.x or newer [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: John Snow <jsnow@redhat.com>, Jason Wang <jasowang@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 Li Zhijian <lizhijian@cn.fujitsu.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Looks good for me, but Qemu still have lots of parts use object_property_ad=
d, do you have plan to change it?

Reviewed-by: Zhang Chen <chen.zhang@intel.com>

Thanks
Chen

> -----Original Message-----
> From: Eduardo Habkost <ehabkost@redhat.com>
> Sent: Thursday, November 12, 2020 2:38 AM
> To: qemu-devel@nongnu.org
> Cc: Daniel P. Berrange <berrange@redhat.com>; John Snow
> <jsnow@redhat.com>; Paolo Bonzini <pbonzini@redhat.com>; Zhang, Chen
> <chen.zhang@intel.com>; Li Zhijian <lizhijian@cn.fujitsu.com>; Jason Wang
> <jasowang@redhat.com>
> Subject: [PATCH v2 09/12] colo: Use class properties
>=20
> Instance properties make introspection hard and are not shown by "-
> object ...,help".  Convert them to class properties.
>=20
> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
> ---
> This was originally submitted as part of the series:
> Subject: [PATCH 00/12] qom: Make all -object types use only class propert=
ies
> Message-Id: <20201009160122.1662082-1-ehabkost@redhat.com>
> https://lore.kernel.org/qemu-devel/20201009160122.1662082-1-
> ehabkost@redhat.com
> ---
> Cc: Zhang Chen <chen.zhang@intel.com>
> Cc: Li Zhijian <lizhijian@cn.fujitsu.com>
> Cc: Jason Wang <jasowang@redhat.com>
> Cc: qemu-devel@nongnu.org
> ---
>  net/colo-compare.c | 57 +++++++++++++++++++++++-----------------------
>  1 file changed, 29 insertions(+), 28 deletions(-)
>=20
> diff --git a/net/colo-compare.c b/net/colo-compare.c index
> 3a45d64175..017e82dd8b 100644
> --- a/net/colo-compare.c
> +++ b/net/colo-compare.c
> @@ -1375,6 +1375,35 @@ static void colo_compare_class_init(ObjectClass
> *oc, void *data)  {
>      UserCreatableClass *ucc =3D USER_CREATABLE_CLASS(oc);
>=20
> +    object_class_property_add_str(oc, "primary_in",
> +                                  compare_get_pri_indev, compare_set_pri=
_indev);
> +    object_class_property_add_str(oc, "secondary_in",
> +                                  compare_get_sec_indev, compare_set_sec=
_indev);
> +    object_class_property_add_str(oc, "outdev",
> +                                  compare_get_outdev, compare_set_outdev=
);
> +    object_class_property_add_link(oc, "iothread", TYPE_IOTHREAD,
> +                                  offsetof(CompareState, iothread),
> +                                  object_property_allow_set_link,
> +                                  OBJ_PROP_LINK_STRONG);
> +    /* This parameter just for Xen COLO */
> +    object_class_property_add_str(oc, "notify_dev",
> +                                  compare_get_notify_dev,
> + compare_set_notify_dev);
> +
> +    object_class_property_add(oc, "compare_timeout", "uint32",
> +                              compare_get_timeout,
> +                              compare_set_timeout, NULL, NULL);
> +
> +    object_class_property_add(oc, "expired_scan_cycle", "uint32",
> +                              compare_get_expired_scan_cycle,
> +                              compare_set_expired_scan_cycle, NULL,
> + NULL);
> +
> +    object_class_property_add(oc, "max_queue_size", "uint32",
> +                              get_max_queue_size,
> +                              set_max_queue_size, NULL, NULL);
> +
> +    object_class_property_add_bool(oc, "vnet_hdr_support",
> compare_get_vnet_hdr,
> +                                   compare_set_vnet_hdr);
> +
>      ucc->complete =3D colo_compare_complete;  }
>=20
> @@ -1382,35 +1411,7 @@ static void colo_compare_init(Object *obj)  {
>      CompareState *s =3D COLO_COMPARE(obj);
>=20
> -    object_property_add_str(obj, "primary_in",
> -                            compare_get_pri_indev, compare_set_pri_indev=
);
> -    object_property_add_str(obj, "secondary_in",
> -                            compare_get_sec_indev, compare_set_sec_indev=
);
> -    object_property_add_str(obj, "outdev",
> -                            compare_get_outdev, compare_set_outdev);
> -    object_property_add_link(obj, "iothread", TYPE_IOTHREAD,
> -                            (Object **)&s->iothread,
> -                            object_property_allow_set_link,
> -                            OBJ_PROP_LINK_STRONG);
> -    /* This parameter just for Xen COLO */
> -    object_property_add_str(obj, "notify_dev",
> -                            compare_get_notify_dev, compare_set_notify_d=
ev);
> -
> -    object_property_add(obj, "compare_timeout", "uint32",
> -                        compare_get_timeout,
> -                        compare_set_timeout, NULL, NULL);
> -
> -    object_property_add(obj, "expired_scan_cycle", "uint32",
> -                        compare_get_expired_scan_cycle,
> -                        compare_set_expired_scan_cycle, NULL, NULL);
> -
> -    object_property_add(obj, "max_queue_size", "uint32",
> -                        get_max_queue_size,
> -                        set_max_queue_size, NULL, NULL);
> -
>      s->vnet_hdr =3D false;
> -    object_property_add_bool(obj, "vnet_hdr_support",
> compare_get_vnet_hdr,
> -                             compare_set_vnet_hdr);
>  }
>=20
>  static void colo_compare_finalize(Object *obj)
> --
> 2.28.0


