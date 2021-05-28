Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DE063941A5
	for <lists+qemu-devel@lfdr.de>; Fri, 28 May 2021 13:08:22 +0200 (CEST)
Received: from localhost ([::1]:37090 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lmaLl-00034n-HP
	for lists+qemu-devel@lfdr.de; Fri, 28 May 2021 07:08:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=775b1f692=Niklas.Cassel@wdc.com>)
 id 1lmaIq-0000NB-Oa; Fri, 28 May 2021 07:05:20 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:28079)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=775b1f692=Niklas.Cassel@wdc.com>)
 id 1lmaIl-0006WT-M7; Fri, 28 May 2021 07:05:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1622199915; x=1653735915;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=bdPTpn3Zx6Rf+f8aWzveYUhfn+gv7nRQknie3MK8F08=;
 b=Q+5uV8qoLRYwd7qIfbTDQQ6JJ7ghNSRddOXiWRD9i+t/1mEQen6M/6mp
 wFIwyeRfrf4Ehac+w8pfAjSsPkBu/db3Nux1hn2hBEBzBEwk4rYHW+Cfg
 RXEHrNhb9fz8SQNT0UaQrLXcFLUIVq78mkOWv3xBl/HnTBQHVCUnXcUj4
 o3y9EZYCeZYgWoXMOYdmFCa4DcmSjPhC7Yq386MB6T+pwjQzqcAN9QhSe
 Ap0AcXPSKVbh2pStk8SH466u/aZjjS3eHfmZZiJtWdMYRJit65r8RWtvS
 fLvLKaI4s14ppHERd/XvaCYr7+jRZaHEkw+XVAKhy5HROOBQJvsjkltZ8 g==;
IronPort-SDR: bkh0aN3rd0mlv9C51WEsZT5E/F6tt0XY1rP4hgDdvRFxsd+5kmHr0nCWA9CeS4JngT2F9HqRK9
 YVREKS6GJfEZ3d1SRFKA5p2Zvk6P9KO6lxDa04QS8hwdUnykIC75RJO3bQhuKFh80lKvDMgoqK
 Gw14vyqSUMUPv75Eesm/Hh4I/5yjMC2PRfJpjaTWeuM4GBGl5Za0fIAzwQJJkIJNYwI6fslY1F
 OSE+2VuEolR6fXdB1KIRSCT8RQubBgP9ma4xlHE6FAdq/f2+mQ0kWCak9HyGIKhB4CLexuoIqg
 OTM=
X-IronPort-AV: E=Sophos;i="5.83,229,1616428800"; d="scan'208";a="169823099"
Received: from mail-bn8nam12lp2169.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.169])
 by ob1.hgst.iphmx.com with ESMTP; 28 May 2021 19:05:09 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jDHwl/yqwo3YlP6+M1LXkBuiq+Fzv2ByuZfaorfVrwADK4e8MC+iN35xSs+9h//nhUoJulf6zGFSYw9fvYC66fg7pme+waeMfFM5o2cevtY/fwOP+v3rjRyS5PVTPOv8A9O6Q+UlCDPmR3jWSfH+kuAoJ54+URgrskia8F2gQDHYbHP1t1p6p5Aiat054H3f/amxUATwOCAYg5eCQA4HJmkfLFiQp5YJcz5w39NUP6oHTchnTQd0c2643Qf9TvAW7wjG9eFotlBUmodaxfGMtlqensXOHV7WKMb3tjESqSkJBanPNlsU79knXNjIfG4sz4T0k0mDPPgNryx/YkVreQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BMcrcizqvgwmKZSPvu5LsAUkz55JM3uWn+Nb1ABFWdM=;
 b=Z7UnSBV1SV8EFqrTDaROIfqLx3GE8RKcy4YUonDtiO59PjwAax4Gc0vVLSfZosdJNixEnNCWijqRoi4wG8xtMC6u0+SN6PbhkaveQo47LAt4LeBCaK2tQvzIFYKpsLDaHX8+XSpcxZkv41BaV1iw1bbZd51csvVUUX6X2VwL986XlpajHbHmbCVMHgz87wVwUlWQe3HVzI7TnezwpiiHvmNypUPmN+nO6Ct7W3ZUksUR0X16OTWGP55R+cUD17WVtS0s3oVJd2OFnoqSLzaUcMNoDfpQvMBbvoJ9QqT2t1YMgeGKVTfkrOS/n0eKUnfi4t1ADRapUitFZeCxMXXCvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BMcrcizqvgwmKZSPvu5LsAUkz55JM3uWn+Nb1ABFWdM=;
 b=VHkdFR7AAlt8d6yMVKtxk2v520JRPR5ky1SEPTmbIWqrsPqHmMS4MXOs9peP5m2rMU+3YKIgq28eztKwHC732ksLyzAmvMKmq/64Cfao1jH3mRwryzmyuLgoAn1rqWSuBQpd/JByhzVyGhadaMAdZdWANXQPbtGhnF3sns/ycGA=
Received: from PH0PR04MB7158.namprd04.prod.outlook.com (2603:10b6:510:8::18)
 by PH0PR04MB7575.namprd04.prod.outlook.com (2603:10b6:510:5c::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.22; Fri, 28 May
 2021 11:05:08 +0000
Received: from PH0PR04MB7158.namprd04.prod.outlook.com
 ([fe80::45d7:388e:5cbb:ae1e]) by PH0PR04MB7158.namprd04.prod.outlook.com
 ([fe80::45d7:388e:5cbb:ae1e%6]) with mapi id 15.20.4173.022; Fri, 28 May 2021
 11:05:07 +0000
From: Niklas Cassel <Niklas.Cassel@wdc.com>
To: "kbusch@kernel.org" <kbusch@kernel.org>, "its@irrelevant.dk"
 <its@irrelevant.dk>
Subject: [PATCH] hw/nvme: add param to control auto zone transitioning to zone
 state closed
Thread-Topic: [PATCH] hw/nvme: add param to control auto zone transitioning to
 zone state closed
Thread-Index: AQHXU7FRNLQ7NeS/402zZyMJ0bJ5NA==
Date: Fri, 28 May 2021 11:05:07 +0000
Message-ID: <20210528110459.65387-1-Niklas.Cassel@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.31.1
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [85.226.244.4]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f99e9daf-ce61-4825-50bf-08d921c8745e
x-ms-traffictypediagnostic: PH0PR04MB7575:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <PH0PR04MB75755611CD0B5C93D9D6DC69F2229@PH0PR04MB7575.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:5236;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: DAEOFjaiQQ9/0TXFwFampNoF9mBMyNAQs7LjoBynSC6MT57DC3f/wbBQbxYXU/JA4ROMZxnUByBvV8zUvVBsHCRW6B17Q3rQdAuGF+fP90FmP37Ma+4s/blGJTHLwMvcktYXPGwdKmaTQb+pWtAUbpvKyrgiDX0NYIXYPl5/L9pYiOldvDAA9HN7IqmLvGMRCMwqhJoVE1ne+1HAepAHKVImWPBIifUniEVjkSfb9FFfW5BE3tM6ySMR45sZUlIH62p+EyI5uvjJV57/ABB3r7wAieKYdv0ZxjYg0Vwh4H+FZj172IqEvXO7nDHMQguekuZhFJRDCIqaOlZYJktMGcawbZDXfPD8aRh3+cMFkQlbl4nREZhJCDRENX/zTqtKyAMdmss50k7ew2OMubSQR53yql2ULiCBpAg2ZUg6zr0rfsM5bZJXbcspp9oy0PvNPW3D7TDdZx1GDHk625XZwCgOL/NRriCJ/i20P/s7zMMPj3EzkHIFAn1Kb4bC5TqLfGZBMSp9/0RStrx5Ps1Qz6zyPErJ0BNPYj/UtEtXP2gzmXT3/Yn5Gj1OCyjIbMHZJT7zZhnc9hnjtoy6e5TkyanUKB7r6SmV9Ev+mfO7Jnw=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR04MB7158.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(39860400002)(376002)(136003)(366004)(346002)(1076003)(83380400001)(36756003)(122000001)(64756008)(66446008)(66556008)(66946007)(66476007)(4326008)(91956017)(76116006)(71200400001)(38100700002)(478600001)(110136005)(26005)(316002)(6506007)(6486002)(86362001)(2906002)(2616005)(54906003)(6512007)(186003)(8936002)(5660300002)(8676002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?iso-8859-1?Q?kltIXLq0l8jGb36HjxejEb2MxRGa/b8caFWgxBOIf7/6hQmgrCJODKmQ2P?=
 =?iso-8859-1?Q?33xP2zi9gpSnfTkw71PftvPAgWANd+9xQWh6dqS+bC3C+8waPKWU6kxJeV?=
 =?iso-8859-1?Q?LZXWMBZhcOtYskm3605WPz6jGW18E1dR5xl1xHA+MzTWRRmSAsmLY5oG+Y?=
 =?iso-8859-1?Q?i/v/wwYbmYp0o+ufEv9q7EkPa763mm117BdcquUvae1y19D0ep5gJsFwdP?=
 =?iso-8859-1?Q?Jyz4rrnJtPLRwoXZzn2QH2xNLbpAuH56tGn+aIcUbiRchWjEPbIpjXLC2q?=
 =?iso-8859-1?Q?pMXhiOcYJsp0UwBtu4GdtIY3LniGKUpqraZ2DPcJs+xGMJgCi2lpmVHdaV?=
 =?iso-8859-1?Q?Hm1m1hXY5/ocllFFp6rQbt3qE+ZQQXLVyLTrIfyW8vzo3AILHCKY+2HgvI?=
 =?iso-8859-1?Q?PdK8bY3Z7MBlYv7xWuVEDZ6s1r7LIZnBhgEPkv2Z596ukYOvg+J5q+70Wh?=
 =?iso-8859-1?Q?c0aDsQmGzBl/pgzs1Kxmc05HAX4o/sVQcG7eXdGVfhTYVCP6l4gI8U6lhB?=
 =?iso-8859-1?Q?dPywpwFgzdiJJAQXbWQdDlfRodpKxkfk5rRRKZUq0EyPZATAs+j+8dG7xu?=
 =?iso-8859-1?Q?x77Dhw1KIk2sl5dXRFmDY5CFU+mcTSJSv8YEZw3SCUeVe4ut8PQGMxe/zD?=
 =?iso-8859-1?Q?ue8QXHwQyoa9FhvOka7jZ/4JTZ4L/1dZZp6wjg+aDPUpmd/QmnBKE29ADV?=
 =?iso-8859-1?Q?gbOGtXEeb41UuUwnfGeU8iAuk+dithDHSidZurET2CSwvzNnSieqJiUnzp?=
 =?iso-8859-1?Q?J5zwSyrktUSEjDgZBiLRF0a2oqJ18e/LCWbXBzu/Myn8Kdz/M12uG3Ab63?=
 =?iso-8859-1?Q?T+JAjiUkyuBeSKynnxXc9O/EqvYyry8KhkKMFJTYqmwJ1VtJlRez6147fR?=
 =?iso-8859-1?Q?FgslW0hgLFTJYPK21WjgaaQ2g63xhuLc8huBK75TzG1U1NCpaJS64RXI6x?=
 =?iso-8859-1?Q?OK+vzxEUBwKNk/2RHbeUOoYyUggYjXRYjN4mQTBkYbI6acUHqVcKDgcghN?=
 =?iso-8859-1?Q?f6r8R3XM/pxnIDTKXWdlVQSTBTXq7CpyThPiefHQ3rJ61lD3qOoQsPmeBj?=
 =?iso-8859-1?Q?scf1rsQmK9GPMR1M1OV4WC/aXj+jbY78FSTigjM1wWwRtyqitZdKuGwV1v?=
 =?iso-8859-1?Q?I6SR6qWbjrzFlnkZsub+66P/IREfKg86tSY/DAF5iTgmT+x8SuJ2fzp8CC?=
 =?iso-8859-1?Q?AVKcJWiATFUhVLqvXFzijyCAVA5ULonq89mYKZU6ID9odpUCznxeGfCO0F?=
 =?iso-8859-1?Q?PXa9LXqHyU7bAkCFY9jf4RScDmaC3nW8mIcWu9KREr12sKb77R5e0cQx59?=
 =?iso-8859-1?Q?vVxZVsWkyYBLRGIC1uSOZPkofXx3ZpFZRfaUzbbiPZ/KZlPX+FiUg8snBo?=
 =?iso-8859-1?Q?Okmrz04Ffc?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR04MB7158.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f99e9daf-ce61-4825-50bf-08d921c8745e
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 May 2021 11:05:07.7845 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fun/CW8m+KK6V9Iidd1IAxYEP1sWWwHtT9R4bqAm20VBti+qiKHGZTKYpsFs46dzh8j7mHaMEVgtUszPkjRV3Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR04MB7575
Received-SPF: pass client-ip=216.71.153.144;
 envelope-from=prvs=775b1f692=Niklas.Cassel@wdc.com; helo=esa5.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
Cc: Niklas Cassel <Niklas.Cassel@wdc.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "qemu-block@nongnu.org" <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Niklas Cassel <niklas.cassel@wdc.com>

In the Zoned Namespace Command Set Specification, chapter
2.5.1 Managing resources

"The controller may transition zones in the ZSIO:Implicitly Opened state
to the ZSC:Closed state for resource management purposes."

The word may in this sentence means that automatically transitioning
an implicitly opened zone to closed is completely optional.

Add a new parameter so that the user can control if this automatic
transitioning should be performed or not.

Being able to control this can help with verifying that e.g. a user-space
program behaves properly even without this optional ZNS feature.

The default value is set to true, in order to not change the existing
behavior.

Signed-off-by: Niklas Cassel <niklas.cassel@wdc.com>
---
 hw/nvme/ctrl.c | 9 ++++++++-
 hw/nvme/ns.c   | 2 ++
 hw/nvme/nvme.h | 1 +
 3 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index 40a7efcea9..d00f0297a5 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -141,6 +141,11 @@
  *
  *     zoned.cross_read=3D<enable RAZB, default: false>
  *         Setting this property to true enables Read Across Zone Boundari=
es.
+ *
+ *     zoned.auto_transition=3D<enable auto resource management, default: =
true>
+ *         Indicates if zones in zone state implicitly opened can be
+ *         automatically transitioned to zone state closed for resource
+ *         management purposes.
  */
=20
 #include "qemu/osdep.h"
@@ -1699,7 +1704,9 @@ static uint16_t nvme_zrm_open_flags(NvmeNamespace *ns=
, NvmeZone *zone,
         /* fallthrough */
=20
     case NVME_ZONE_STATE_CLOSED:
-        nvme_zrm_auto_transition_zone(ns);
+        if (ns->params.auto_transition_zones) {
+            nvme_zrm_auto_transition_zone(ns);
+        }
         status =3D nvme_aor_check(ns, act, 1);
         if (status) {
             return status;
diff --git a/hw/nvme/ns.c b/hw/nvme/ns.c
index 3fec9c6273..31dee43d30 100644
--- a/hw/nvme/ns.c
+++ b/hw/nvme/ns.c
@@ -531,6 +531,8 @@ static Property nvme_ns_props[] =3D {
                        params.max_open_zones, 0),
     DEFINE_PROP_UINT32("zoned.descr_ext_size", NvmeNamespace,
                        params.zd_extension_size, 0),
+    DEFINE_PROP_BOOL("zoned.auto_transition", NvmeNamespace,
+                     params.auto_transition_zones, true),
     DEFINE_PROP_END_OF_LIST(),
 };
=20
diff --git a/hw/nvme/nvme.h b/hw/nvme/nvme.h
index 81a35cda14..bd86054db2 100644
--- a/hw/nvme/nvme.h
+++ b/hw/nvme/nvme.h
@@ -100,6 +100,7 @@ typedef struct NvmeNamespaceParams {
     uint32_t max_active_zones;
     uint32_t max_open_zones;
     uint32_t zd_extension_size;
+    bool     auto_transition_zones;
 } NvmeNamespaceParams;
=20
 typedef struct NvmeNamespace {
--=20
2.31.1

