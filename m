Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 189583B7431
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Jun 2021 16:23:26 +0200 (CEST)
Received: from localhost ([::1]:34080 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyEe4-00042o-K1
	for lists+qemu-devel@lfdr.de; Tue, 29 Jun 2021 10:23:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <acho@suse.com>) id 1lyEab-0007sh-9j
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 10:19:49 -0400
Received: from de-smtp-delivery-102.mimecast.com ([194.104.109.102]:46667)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <acho@suse.com>) id 1lyEaZ-0003Up-Gj
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 10:19:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com;
 s=mimecast20200619; t=1624976386;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wmk4J4tkx1lA70aVIYeEXvrh31NYRHUZ2+idETr5EeM=;
 b=AL6WzUAjf+svP/E1Q/1/8UcF3P6WCYdeg+f+0ysWeBbA/9TVX7PLzAJSoLWS/5yn1OUl6P
 IPEuRONVIDv64cVM6b94D0+VYhTgkShY/CE3qeoQUiOS6YXsiaK/KI7WAW3TBjxRKxxldq
 1cQlf9Jxx/r3ofdTzfxdo2ec9IIPSbc=
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2112.outbound.protection.outlook.com [104.47.17.112])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-5-_vh21rK5O_mCAQVKINx1hw-1; Tue, 29 Jun 2021 16:19:45 +0200
X-MC-Unique: _vh21rK5O_mCAQVKINx1hw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B0h/K9QwozNiHiOuemqSlhcJMnChKqghjRxXBzK4TZPaRVug2raWU7OQq0N4onGvxwZVQtkvVgfU/tn4wpAVndeAO4D852EpGJDzkUISn6B/Tr0UajSM03WV+tVzIJcAfo2ajU9CAesI56rfgOYRUHRlFI0ni26Ix6CwVVCjXfTW+i3mbIa3FsVa9KIIYEYgFealDHL0HbKGxUOf8+DbswSoIgPSul99MCHPHQsv80KkoxoGcQZY5/in7jaZZ3khsNApfpjMNbyheIX+NAwzAVspuU18wHnMPPL5jajPApnMUx5rbk8DzT6hWIp3DmUN8lNksUcgcEXA+JWXn1Ggow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jnRUYohirJo6bc9I7z1rJ/LBlkcgpHD1uUbF8MRUBvY=;
 b=hXUBjld6k9e10pPHt2g8BoRTsA2M6DGSyA6bTMsq1dsg6P9EqNEIjqE3gcDWf9bJ1HVE/uOBc118+gQRf5RpxraSYkkFs++xFXCebFuySheDTQsuKGCjcpThx+51OzSpuUFTsb30V2mBr4sAfD/nlLNdU57g0qQKeSSg09WmKCosIwxZKB8Im9pYuo40CrE0a182wJ/nJMsU/wAf7dzZiyfB6gIRtJZzXTw9BTqfPWfZ+Pyrm+w9QSuGt4iA4gKzx75qrv8MMVqITkNsv0ge9e6tDez2hiDQqTLbXGajg/bjvzItP4J6zOjH1TsXaFPvnm+YS0pGULXbXFF5fyLkhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=suse.com;
Received: from VI1PR0402MB3744.eurprd04.prod.outlook.com
 (2603:10a6:803:16::25) by VE1PR04MB7295.eurprd04.prod.outlook.com
 (2603:10a6:800:1ac::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.22; Tue, 29 Jun
 2021 14:19:43 +0000
Received: from VI1PR0402MB3744.eurprd04.prod.outlook.com
 ([fe80::4c1c:b538:59b8:30f]) by VI1PR0402MB3744.eurprd04.prod.outlook.com
 ([fe80::4c1c:b538:59b8:30f%5]) with mapi id 15.20.4264.026; Tue, 29 Jun 2021
 14:19:43 +0000
From: "Cho, Yu-Chen" <acho@suse.com>
To: qemu-devel@nongnu.org,
	qemu-s390x@nongnu.org
CC: cfontana@suse.com, acho@suse.com, jose.ziviani@suse.com,
 Claudio Fontana <cfontana@suse.de>, Cornelia Huck <cohuck@redhat.com>
Subject: [RFC v6 01/13] target/s390x: meson: add target_user_arch
Date: Tue, 29 Jun 2021 22:19:19 +0800
Message-ID: <20210629141931.4489-2-acho@suse.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210629141931.4489-1-acho@suse.com>
References: <20210629141931.4489-1-acho@suse.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [1.169.28.175]
X-ClientProxiedBy: HKAPR03CA0036.apcprd03.prod.outlook.com
 (2603:1096:203:c9::23) To VI1PR0402MB3744.eurprd04.prod.outlook.com
 (2603:10a6:803:16::25)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost (1.169.28.175) by
 HKAPR03CA0036.apcprd03.prod.outlook.com (2603:1096:203:c9::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4287.8 via Frontend Transport; Tue, 29 Jun 2021 14:19:42 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1c40ce31-9aa4-4ef8-4404-08d93b08f060
X-MS-TrafficTypeDiagnostic: VE1PR04MB7295:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VE1PR04MB7295B104FDD6615E708F4CDEA0029@VE1PR04MB7295.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2khI0VdifgpDCEQ07jazdu9eDP2yAJAhe6nycjfCTKVx7Dq3EIem3A3aHYh5Ip+a1vg/CETUo5NejMiIil/RbwhTWYQXClF2/zbg66H5o9d0NMRsCO7hgbR55wmn+owwkHB4FfLoSTamTZ8EcgcqbY5Z9M809Hdy6iluvwOTvw0UtfhcbVaYueSIYliEiSFBm0GZbPmZ6zahgnI3VjXWLsco1cvgb4gXF5kGTtkh2m8rwl8GWJDjcXekWD5CoKnHA1rc4u4sLPYz+Dn+sSBfqzrf2VNuxgX6GVHtPbC+PBrTT23q3N9Bf412gh7hkzg/PWkJoWh5Q8DiBmdC6E8AFf5D31xRRGg5In4Bf8ydj4lDmd4DZ04GhZtqR1CB8f6YUmOu+8eGBJZFbTH/0VH7z7hQdOMqKoI57Ia9ZMe1uGwYLU6Xg+V4D/cqtsxH63ji2Q0O7q4Q4guUj0kM7OTfTJQ61AhGiIT0VYBhr+IjtcoRQ+0KusNKw4EZ7WsL6GVK4xhuhsXAOQNjQoAdwKnXRN9Vs5wXCzSfKJe999w9xu4Yu55YdsXLFz6HlSmN7Ed3fRi5mNeiEGmROJxEbprNaQMwHWHObjcwB9z/hzWi0edFfvIzEsq3lN0Rm91sJ6bkaVnzfHYXH6DyFGt//opTPC/xTSJrwq9Qoc025ATEWRFQ53Z62G1CUZ1/Gpkczsitn3eO0eA3q8EtVk3BJGbqHg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR0402MB3744.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(136003)(346002)(376002)(396003)(39850400004)(2906002)(316002)(4744005)(4326008)(8676002)(36756003)(66946007)(6496006)(54906003)(8936002)(66476007)(83380400001)(66556008)(1076003)(16526019)(86362001)(6666004)(2616005)(38100700002)(186003)(956004)(6486002)(478600001)(5660300002)(26005)(36456004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?NyE41HcbLDSeoyaGqfLRfU73c65kf9LHRj/m6wwzx+XQuu3MMEZR59mw0OBU?=
 =?us-ascii?Q?fWu8EQIrsnaQpDf6OWKl48JOc7WghlBzC/9GHBJ6m/FhBSgozhLsjI+kSiE5?=
 =?us-ascii?Q?dM6bnkWCuUj48oHQGEwvD9IdLw1TrvSX1Zd2GCLuci2hv4WUOPogR2lNjR/m?=
 =?us-ascii?Q?PxKF0GjBSwM+E1qY4XkuHpcIAv3MQYZpt+TVlhAhTqnKOn/9BCAcwgoxYIgg?=
 =?us-ascii?Q?eN5jVdyC05kfWh0CvwJNW0YCQSd0DMz2bTsQlHOG2aGBPVIjNYolUFwKx70x?=
 =?us-ascii?Q?IfEoRaxR3xpHRdEzCdz5FPraWHmWbiFoLTLjZj0mu7pBPvDXNfE7zM0S/NgN?=
 =?us-ascii?Q?lAWNgy6dEJEwXEd4G89GXfBYKlCB/foXUSN9DAOlL3oG7PPw/75wm2sJgIUK?=
 =?us-ascii?Q?BOjSx5XeoqZKBseyvs1Fjn7ePVL9luxtO0klhX4WW2U/f/odsflMSoilSBUi?=
 =?us-ascii?Q?dWhtYy5LGKzsjW3kENoED/Pd4Z3mPWoK8XiZvGrwOqAUfmWmCeTPgGScFdxK?=
 =?us-ascii?Q?uKRv4r6bnHHypu/KYHYQbgMJdatajp33TduI3vtl1P0vWPy3XlflMnqJKQI+?=
 =?us-ascii?Q?UbxLbiTelRxHmCupriXEe51xM9HZgm0R/n0FM4a/pMYHzPoCJRmF+uCX1uM3?=
 =?us-ascii?Q?ALBJ5ITLb3ddNF/I398yI+aCccY6F//7gpOkNZdXv1htNM0lGmVZO+sqRnLU?=
 =?us-ascii?Q?k4roP1Kr6LA94qGh5Yu6LZ8UnDqkIZnZFPn1/CaR83oO2I5Lz/z5Ug1BoDQf?=
 =?us-ascii?Q?H0s8g57OU7l92NSREfKOWoIC402Si/azppSS4HrW2qil9cAwJbUqP4cUkNlX?=
 =?us-ascii?Q?yuug6diNYzL5buwjrwTvvk6lG62xzAg0os1+/p5WgTS18WGWaHrU2bmcLUGC?=
 =?us-ascii?Q?AsCpRmb2pfDQ1rd5ovV0sS9ObWv8OgpOGo6jv6cGdh6YKgRp13DCHhqCKZTl?=
 =?us-ascii?Q?QNym7RX9IhAS1WUMBKAgfY23yp88jzEkF+ox13EFxRsW6j8kbKXUo2WEWLqp?=
 =?us-ascii?Q?h5voFVFGVevtiudEyB4XwfJj3jnkLwy4sjxUjGnlfpKoHfSTAfN+w3n2vYLm?=
 =?us-ascii?Q?a9BNWxHcBu8jm2BivM6B3TpoYxdaUTtONVHT55KpA7LSFJ1Q81g94CVGsEbG?=
 =?us-ascii?Q?7nMhV1DSAn5jPPOUlii8pYM2qOyi3YqAHnlJY3zi/VLmLYK6on+c+dhGQkD1?=
 =?us-ascii?Q?cDw4SgQuEiv+HuDWA+xztvlzll0rNqUBaGcXWcq+Up5pWQUQ9TE0dDXvfnsR?=
 =?us-ascii?Q?pXRNM+ZfkVJ4F432rVK1t9T+TvxCOrdBuX49U6vQEpdXmA/7XQak7bLzsi1P?=
 =?us-ascii?Q?NAbHIBabPVvWubkJv+a69ZWh?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c40ce31-9aa4-4ef8-4404-08d93b08f060
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0402MB3744.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2021 14:19:42.9512 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 78jNm8aBQtlnKCFsD/bLotvY2MJ21k1eMUvXFaWPg+4CtojCp0JUju/MzFYjkq/q
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7295
Received-SPF: pass client-ip=194.104.109.102; envelope-from=acho@suse.com;
 helo=de-smtp-delivery-102.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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

the lack of target_user_arch makes it hard to fully leverage the
build system in order to separate user code from sysemu code.

Provide it, so that we can avoid the proliferation of #ifdef
in target code.

Signed-off-by: Claudio Fontana <cfontana@suse.de>
Signed-off-by: Cho, Yu-Chen <acho@suse.com>
Acked-by: Cornelia Huck <cohuck@redhat.com>
---
 target/s390x/meson.build | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/target/s390x/meson.build b/target/s390x/meson.build
index c42eadb7d2..1219f64112 100644
--- a/target/s390x/meson.build
+++ b/target/s390x/meson.build
@@ -58,5 +58,8 @@ if host_machine.cpu_family() =3D=3D 's390x' and cc.has_li=
nk_argument('-Wl,--s390-pgs
                        if_true: declare_dependency(link_args: ['-Wl,--s390=
-pgste']))
 endif
=20
+s390x_user_ss =3D ss.source_set()
+
 target_arch +=3D {'s390x': s390x_ss}
 target_softmmu_arch +=3D {'s390x': s390x_softmmu_ss}
+target_user_arch +=3D {'s390x': s390x_user_ss}
--=20
2.32.0


