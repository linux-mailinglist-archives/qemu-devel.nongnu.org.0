Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B2CF441DE55
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Sep 2021 18:03:30 +0200 (CEST)
Received: from localhost ([::1]:55336 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVyWv-0003uZ-NU
	for lists+qemu-devel@lfdr.de; Thu, 30 Sep 2021 12:03:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41520)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=9907f52c21=jtanen@fb.com>)
 id 1mVyMh-0007oR-9h
 for qemu-devel@nongnu.org; Thu, 30 Sep 2021 11:52:55 -0400
Received: from mx0a-00082601.pphosted.com ([67.231.145.42]:20734)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=9907f52c21=jtanen@fb.com>)
 id 1mVyMf-00039j-4e
 for qemu-devel@nongnu.org; Thu, 30 Sep 2021 11:52:54 -0400
Received: from pps.filterd (m0044010.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18UDgtXc001529; 
 Thu, 30 Sep 2021 08:52:49 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : content-type : content-transfer-encoding :
 mime-version; s=facebook; bh=iFtsbgqys2wixYdTlTr10YtErqj3IJobmk4Q0G0W2pY=;
 b=TtcYXIoC6rXMIK2pjhgzbzuOzSBLrWMvOmF0c1eNuRxK1UNyPwLnXw5LT2cGhvky1sid
 6sYzaZbD4hv5yZ505QKEc15dH7yskToU6mPR1/fW42XN3MNReQUqWqs/EHTUMHA3Wbyp
 0oeyO4mQtCLsIY5XZxolrsg6LJipn+EH1Vw= 
Received: from mail.thefacebook.com ([163.114.132.120])
 by mx0a-00082601.pphosted.com with ESMTP id 3bcvtk7r8a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 30 Sep 2021 08:52:49 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (100.104.98.9) by
 o365-in.thefacebook.com (100.104.94.230) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.14; Thu, 30 Sep 2021 08:52:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l9UcKmkvwp6o5cFsHT0VSn3EVbs6Z8KA0BYFQ6HGMIEsRn7wUtZK4VWVzZb7I9ovqUSSvQ8DiXwxwtX8bm5M2XGXLXFPIbqPyQBlhGxX3kEHGgGEz67Y9mQqjV42iZBCr5041/nfV+Rt5aFZdoCNIqhRnsbBlMGfiJo76yep7sqHPYRaOJKrhrMPruMlROqURutKJQbu81LzHL4oHjYUTQZPjvkjp7ehW79vJxs/Cgd/+j6wx9y9COPGYt1qtG0ipIYs1jlrfOlfTbcfYe6gj47weRts2YbtE8AycSEKCOLbJb5lhF+bhKRbmffxlES/NNDZOdbj5Pv5UIpfZygmcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=iFtsbgqys2wixYdTlTr10YtErqj3IJobmk4Q0G0W2pY=;
 b=RHbySiLLLNODZ0ww/GggcXVG5Us6ogYKQDcGfL+uPwBGvbVZrr0PtxbQL5fRPpf+px5E1/B6C08jL4JOaJn17r3X12QC4Ldw+Ebt7wB7qzpZvvmg9cjJVLpzvOvKaHpCVIcA33hAjpQfAhPHoOK3Zh1RRc4luaw9+wuUk9R6tiWANwEmM0tgrM3KdhWkVZ8AXOOJov89GMILnfiNT5Zw5PYPQxUELNluHLG9U2ykJZUsGEUuEdEEyoj0HobrBNMYBMfU2Fd9r8DabxWGk02znmGF3aIui+x/wInnIomw6rglUgL43Np805EsTNL2x1sl9I/yJn3Vks9/2vb6mfF4fQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
Received: from SA1PR15MB4484.namprd15.prod.outlook.com (2603:10b6:806:197::5)
 by SN6PR15MB2272.namprd15.prod.outlook.com (2603:10b6:805:26::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.16; Thu, 30 Sep
 2021 15:52:46 +0000
Received: from SA1PR15MB4484.namprd15.prod.outlook.com
 ([fe80::e92c:9d8e:a9b0:5b6e]) by SA1PR15MB4484.namprd15.prod.outlook.com
 ([fe80::e92c:9d8e:a9b0:5b6e%2]) with mapi id 15.20.4566.017; Thu, 30 Sep 2021
 15:52:46 +0000
From: Joe Tanen <jtanen@fb.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
CC: Joe Tanen <jtanen@fb.com>, "dirty@apple.com" <dirty@apple.com>
Subject: [PATCH v1] Use CLOCK_MONOTONIC_RAW if available for get_clock().
Thread-Topic: [PATCH v1] Use CLOCK_MONOTONIC_RAW if available for get_clock().
Thread-Index: AQHXthKyRjSgKbhwdUGK66yq8X/F5Q==
Date: Thu, 30 Sep 2021 15:52:46 +0000
Message-ID: <SA1PR15MB4484B78AA300C0D419BA70DFABAA9@SA1PR15MB4484.namprd15.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
suggested_attachment_session_id: 424d99b3-03d8-63b2-0adf-102c57d3c3ce
authentication-results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=fb.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 55485472-cab1-49c3-347e-08d9842a58fd
x-ms-traffictypediagnostic: SN6PR15MB2272:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SN6PR15MB2272A66A037E0B5C897034EDABAA9@SN6PR15MB2272.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: DodH8CHOFbzb5xzhm770oEBNhXvv295BoaHvqO3tSB4mfdeSp0GpvBVKQorrgo7hRjEjdnxgU3P3zYdP29vm7HhmdEqoOz/6HI+XDwdNbm4HzRIELOZ+OSixepUN0etz/hwD6edv+lO7ODgJqOLBYn1nBNg1GyTy3P6OQdY5GZSixCRELuKHgMStMKGMEA6p59Kx4m7L6eyIkZ+QB5JZAkfeNdvI3Wh5Zr1JRtR2ckZAaPdAXw68DJU/laN2zk6OwvZzbyqz3J9uu/mWYbhsG0h0SYpZzKrxwhRMfvBNI5b6W1SicdE/6tUSdiwsT7o1CjlZc4HMa2v4q3xBBHv685ZHV/eZgmKLsL38X5FLjLP8MPJ3LGUibm7vZDsjNpRlWsCFNapeSz7qUn9g0KWiTie/LvDF5BEPTWyUPmo3QAV8/zUgbTZjw854elHmvQHi+v/ikr222vXWJgjOzKT9NoGn6AFZunpVkWYyT/sLL6FDUOR/0qF7AGhfCRYj9FFkoH38513Y023AV7UU1rJ0sKuc5hl8rrpgUbWY2UwvJ22UKUoMDtTJAxmiXC3C9vo0aK3G6hZAcLtWJ+akUnMOXg7olkgx7uDmRVk8Q3nerW9oy1J4Hh6uZ1ooohBQrVyJ93dbG7jFvi9tVpbQ4joe+0LOiLu947f4x4IOhVe7ujJXOv/BSg4jcV8PpvVEy10YIgjnmJ0nyknfnaLewK6rEzomOKpap50UkAbl/2Vj7r4Xqt6ZonCFN4Z4TgxX1VsCeIKfSSps9SkiFfW6hOsFAQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR15MB4484.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(38070700005)(4326008)(54906003)(508600001)(5660300002)(55016002)(66446008)(9686003)(52536014)(122000001)(38100700002)(316002)(6916009)(186003)(66476007)(64756008)(66556008)(66946007)(91956017)(76116006)(2906002)(8936002)(6506007)(83380400001)(8676002)(71200400001)(86362001)(7696005)(33656002)(131093003)(21314003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?p/l/ojCVsA3H8UNIpeoLxob7t9JlcDiDbmJfsLQnl2KnjOGtbAwKfH7Wpw?=
 =?iso-8859-1?Q?NCV6VUflad+ZdvmejUMYUUh+ztqykkERpKyq5fZMsV5ZwdsRPGnseRhoUl?=
 =?iso-8859-1?Q?Ljt31Z0i7Dzn0U3hrR3i8Ic13EesRq7lk8jAAlDFkKen9gyBuOtCAUIlEM?=
 =?iso-8859-1?Q?MgvN4lunXuCq/tjXLa+tMhT4uMWvOWFjN1ZW9jp8Cpk7RrtPAuTENtJx+B?=
 =?iso-8859-1?Q?1mc4QZL09nthBYHMopytKOCHAmfGcEJmmpbqfPM2ZXwTXr1/Pzd3WtRcVX?=
 =?iso-8859-1?Q?E8xDstfGsssm9C4BSGT0Ing7hA+TxsKEjy+6iJYapLvOfMi6VRthZm7TMt?=
 =?iso-8859-1?Q?6P6O7pkVKyk6GMosf6vBpNohuNyQTkv/m3+DgymQgK++eR/YlMHHAhyNql?=
 =?iso-8859-1?Q?S5njb8PqZfCWvN2+u99KbFJQCv/NpeLWqSRn83ZA+S/FK0J6R+5bROvHj0?=
 =?iso-8859-1?Q?Ko5oQU4pXmZ0t812LXUvMhW5+0i0hoAD2hRVD4gF2WId7HEPWIPudB3r4c?=
 =?iso-8859-1?Q?N6M59ODMZAShHrC1ZCssHVZich/famE3TgPVtC+LpnrR1YaYSMhK+6+dWT?=
 =?iso-8859-1?Q?Xvfc+AOwxMWwVTVLhz3L+rVHI4dQClr9+cBQWhOzi1HcP+No4Edki6xCj0?=
 =?iso-8859-1?Q?vBdGq4qB2NA4jyC5UbK19vYMnK68+8+4FhVdfZdp5opO86pfiAQhWI2dji?=
 =?iso-8859-1?Q?ACsx4cA/1Y1R8NT5lvx2sEhpKh0Q+8v+ucIvDJmgHpahC1TUMgLEH0Em50?=
 =?iso-8859-1?Q?oX/klQSEq5mZOiYkIh9KyOZEWuuEcXTD43Jyshcc9HXMQ8wi746kNX1z+T?=
 =?iso-8859-1?Q?MmncmTjq0fH0YmFhMZHkojRFft8pH4hBSEC7JNYnvpAYyG0dyJFTn3QWzI?=
 =?iso-8859-1?Q?Xj6phklUzY6dPZyEBU6rr6ZvPfNBdRHvI5Pg+hE0YCwt42pJ4RzhCqHasx?=
 =?iso-8859-1?Q?YuJnoC/VLELkR4AhKeg2obIPRQ8TO7epuvPAuDVB3cimfeGRKXunghlpR/?=
 =?iso-8859-1?Q?aXiswNLAC0K/qiCl23ojsX/TpK0jmIb4u9kW+iq2wZ9HNynVHX1u7io+bq?=
 =?iso-8859-1?Q?Ih8OzatZz3aagmZAc+XmtDgiLeerst5XWwIMxW1r3OpGCkUts0jv7Fn62K?=
 =?iso-8859-1?Q?HCEMSpFNCgDrxpXRF2+Xi1ft0sZ/FTfFTEm5G2rSWuaiLGuctKbrnXv/ns?=
 =?iso-8859-1?Q?smQRmdIl35FmraJ3OLTrsUAVcTZcz2rcbZYBvKDNsnoavxmZ9nZkEAtbwb?=
 =?iso-8859-1?Q?kdWXkZHWfAFrtF0osfiFxeeN2aplHzw5DKAt5ZKp1UO9v90qbwpFazR3aT?=
 =?iso-8859-1?Q?0uasJXXcaSSmXWvD/rAUjI18V+pau7j+Z8eWhqqb9/MFLHNdLwL+E21KeA?=
 =?iso-8859-1?Q?GgxkTM8qROCiHmGtLma3AOGK+uK5zxeQ=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR15MB4484.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 55485472-cab1-49c3-347e-08d9842a58fd
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Sep 2021 15:52:46.4405 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mzWU/J33rk8dHPBGXt2nv6ZWTLlXAlAqyyqoPjdTu9XHPeKR5rFVg6orgIl39PZc
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR15MB2272
X-OriginatorOrg: fb.com
X-Proofpoint-GUID: 88qgpJMnbi8Gs6UkYr9bCnOR3-YEJ9Xz
X-Proofpoint-ORIG-GUID: 88qgpJMnbi8Gs6UkYr9bCnOR3-YEJ9Xz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-30_05,2021-09-30_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 mlxscore=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 mlxlogscore=754
 malwarescore=0 suspectscore=0 impostorscore=0 adultscore=0 bulkscore=0
 clxscore=1015 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2109300098
X-FB-Internal: deliver
Received-SPF: pass client-ip=67.231.145.42;
 envelope-from=prvs=9907f52c21=jtanen@fb.com; helo=mx0a-00082601.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

CLOCK_MONOTONIC_RAW provides an unadjusted system clock on some platforms,=
=0A=
which is closer in spirit to providing a guest with a raw hardware clock th=
an=0A=
CLOCK_MONOTONIC.=0A=
=0A=
Using CLOCK_MONOTONIC_RAW also works around a current issue in OSX where=0A=
CLOCK_MONOTONIC has been observed to go backwards.=0A=
=0A=
Since CLOCK_MONOTONIC_RAW might not be available on all platforms, revert t=
o=0A=
using CLOCK_MONOTONIC if it is not present.=0A=
=0A=
Signed-off-by: Joe Tanen <jtanen@fb.com>=0A=
---=0A=
 include/qemu/timer.h     |  3 ++-=0A=
 util/qemu-timer-common.c | 11 +++++++++++=0A=
 2 files changed, 13 insertions(+), 1 deletion(-)=0A=
=0A=
diff --git a/include/qemu/timer.h b/include/qemu/timer.h=0A=
index 88ef114689..fb8f5074df 100644=0A=
--- a/include/qemu/timer.h=0A=
+++ b/include/qemu/timer.h=0A=
@@ -828,12 +828,13 @@ static inline int64_t get_clock(void)=0A=
 #else=0A=
 =0A=
 extern int use_rt_clock;=0A=
+extern clockid_t rt_clock;=0A=
 =0A=
 static inline int64_t get_clock(void)=0A=
 {=0A=
     if (use_rt_clock) {=0A=
         struct timespec ts;=0A=
-        clock_gettime(CLOCK_MONOTONIC, &ts);=0A=
+        clock_gettime(rt_clock, &ts);=0A=
         return ts.tv_sec * 1000000000LL + ts.tv_nsec;=0A=
     } else {=0A=
         /* XXX: using gettimeofday leads to problems if the date=0A=
diff --git a/util/qemu-timer-common.c b/util/qemu-timer-common.c=0A=
index cc1326f726..5039c5406c 100644=0A=
--- a/util/qemu-timer-common.c=0A=
+++ b/util/qemu-timer-common.c=0A=
@@ -49,13 +49,24 @@ static void __attribute__((constructor)) init_get_clock=
(void)=0A=
 #else=0A=
 =0A=
 int use_rt_clock;=0A=
+clockid_t rt_clock;=0A=
 =0A=
 static void __attribute__((constructor)) init_get_clock(void)=0A=
 {=0A=
     struct timespec ts;=0A=
 =0A=
     use_rt_clock =3D 0;=0A=
+#if (defined(__APPLE__) || defined(__linux__)) && defined(CLOCK_MONOTONIC_=
RAW)=0A=
+    /* CLOCK_MONOTONIC_RAW is not available on all platforms or with all=
=0A=
+     * compiler flags.=0A=
+     */=0A=
+    if (clock_gettime(CLOCK_MONOTONIC_RAW, &ts) =3D=3D 0) {=0A=
+        rt_clock =3D CLOCK_MONOTONIC_RAW;=0A=
+        use_rt_clock =3D 1;=0A=
+    } else=0A=
+#endif=0A=
     if (clock_gettime(CLOCK_MONOTONIC, &ts) =3D=3D 0) {=0A=
+        rt_clock =3D CLOCK_MONOTONIC;=0A=
         use_rt_clock =3D 1;=0A=
     }=0A=
     clock_start =3D get_clock();=0A=
-- =0A=
2.31.1=0A=

