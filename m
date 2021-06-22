Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B75A23B0145
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Jun 2021 12:22:53 +0200 (CEST)
Received: from localhost ([::1]:60410 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvdYS-0002S5-NR
	for lists+qemu-devel@lfdr.de; Tue, 22 Jun 2021 06:22:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44800)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <acho@suse.com>) id 1lvdTV-0002Kt-KN
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 06:17:45 -0400
Received: from de-smtp-delivery-102.mimecast.com ([194.104.111.102]:41414)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <acho@suse.com>) id 1lvdTT-0005zZ-Qy
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 06:17:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com;
 s=mimecast20200619; t=1624357062;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wmk4J4tkx1lA70aVIYeEXvrh31NYRHUZ2+idETr5EeM=;
 b=SbqH+/0kl0YpiecQe+hTxH480IqPuunSAZcX/WxwsQTV/7X9MH5moQtNdwj405FL+884FB
 U+2tOxjjl++lsIRAdi0ra0llnP8mYrzRcwMkmvmpRqZldkuo5A+61DCN03g5l6ePr9tomH
 LAWVN2bUdl549hoiMJgVpLdvbIFZdqE=
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01lp2057.outbound.protection.outlook.com [104.47.0.57]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-32-USgzZuPgO2ygAGIhugzNgA-1; Tue, 22 Jun 2021 12:17:41 +0200
X-MC-Unique: USgzZuPgO2ygAGIhugzNgA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oSLI+pRy/fi22RU84OfvB3Y186ZtkvvtNJfVGUWYguG8l/okcaHMwdB1YEuWTMvn4S012AKd+Y/QraKg0bZkpfNPcVroe9qGyGBtWKPYvCDF46jAgJlqYMWC890q3P5W86t0f1Jbjn3TCBG5v5O5nchYmPExIEF5Bes8He6GDqyOCdVhqggXECBJVza9ZRR26USJnJH+GoSlCAO+MkHHSMPa2cBRq8+LTKW7ApoIFsTK7haeaKuRAqtvzQYxQC3rPFYpIz2JarB5+EPBxK+uT25Z7IyYIeV68wXaGR2w5h/5YyAlWiTYPAzSaRrS6H+/hEoO33lKWOoLbwO8s6CmLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jnRUYohirJo6bc9I7z1rJ/LBlkcgpHD1uUbF8MRUBvY=;
 b=KKUzlO5vMhjiSPB0SmffrTi5kmXBWEt8C62SiAjqNHAJv1XeOyBa1rNschjbp+cJbsNQXw0GDVGGY07GELRNvItO5/xnRDPbyLr/iKZN8lwOmxEQRtUO79LL+8solQaxmq/OnZ5NfP1lyak71t2DziokVleqiiBj5dug1fFbY7uii2qwVcsOUiiXLKkm0886u4PDd28CFZHoKys1ku0MCdGgUT/Np8uH91+HfLZtou4/w2vdUuHE7au7eOBUHaOYgM0E9DGhmuZ2ZGJTdzHpPCxVTd3tYbElji54SN7kIpRL2G+9XsQCY1uVxCe+atJhnuoEGvth8Yf8fS/Hy3xVaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=suse.com;
Received: from VI1PR0402MB3744.eurprd04.prod.outlook.com
 (2603:10a6:803:16::25) by VI1PR04MB5405.eurprd04.prod.outlook.com
 (2603:10a6:803:d6::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.19; Tue, 22 Jun
 2021 10:17:39 +0000
Received: from VI1PR0402MB3744.eurprd04.prod.outlook.com
 ([fe80::28dc:6111:d2dd:4777]) by VI1PR0402MB3744.eurprd04.prod.outlook.com
 ([fe80::28dc:6111:d2dd:4777%3]) with mapi id 15.20.4242.023; Tue, 22 Jun 2021
 10:17:39 +0000
From: "Cho, Yu-Chen" <acho@suse.com>
To: qemu-devel@nongnu.org,
	qemu-s390x@nongnu.org
CC: cfontana@suse.com, acho@suse.com, Claudio Fontana <cfontana@suse.de>,
 Cornelia Huck <cohuck@redhat.com>
Subject: [RFC v5 01/13] target/s390x: meson: add target_user_arch
Date: Tue, 22 Jun 2021 18:17:14 +0800
Message-ID: <20210622101726.20860-2-acho@suse.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210622101726.20860-1-acho@suse.com>
References: <20210622101726.20860-1-acho@suse.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [1.169.30.211]
X-ClientProxiedBy: HK2PR04CA0065.apcprd04.prod.outlook.com
 (2603:1096:202:14::33) To VI1PR0402MB3744.eurprd04.prod.outlook.com
 (2603:10a6:803:16::25)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost (1.169.30.211) by
 HK2PR04CA0065.apcprd04.prod.outlook.com (2603:1096:202:14::33) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4242.16 via Frontend Transport; Tue, 22 Jun 2021 10:17:38 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 59fc14eb-3fbf-4c37-dae5-08d93566f6bf
X-MS-TrafficTypeDiagnostic: VI1PR04MB5405:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB54056EB443056C19D34D130CA0099@VI1PR04MB5405.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nNKwt8psUETgDj60V0KQQF1d37L7PCcP+XYNPm0p1f5IkQTJZBG9Entz5qUrNGsbH/OPi1HD9TQa7SoW669Vc0uWaDsQ7MBZDyjt/xIy/nZngTDi6qtZd6aQJQTOF+RtMVTeuCLzydJkwkjqPtixciSkveXoaGHtXEuqqWMpDx3JdLDiiMbMA2zybvzt9sNSrqlKkbyRPRCnCswb8WisGIcUXSrxvi9gNOL6ZdL4T8uTFtpWKd6oo+IIEbHlUthNn7hMTp8m+mF48VIFHwvd6FVfju4JDA4Z6BePd4u+tPCgBeQv4/OqHkJWG5qsVAqDIm+c92F29wi+cBT96e83scQkqYwhxa0E7A2E32o9QpACFUTDZZRWggVyhhswaYuF44WgeyB+mQZByokqzC2V/HukqfCmBKa5n701/4byupmZa5UBo+QrKXOiJQSdSnD3BPB9RvtMg8RdLalg8lI+vDGtPykgaPZ2DC2sg8r5ukhdACC6djEdhBv4zf54sHiF636Cwjm3lVQKz8L+k+e6mtE4dn5j3t2U/S+1vIg3n6svYb3a0dMG5WJc7DwWctSajPCJkFD1W2lKTv6vFFU4Ua8QS6AAl4xQ4BDvKpp3T+42ffIaEnUUAWfqC3j4saWXM+3h/KuL2HMwnuAwd/PN+g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR0402MB3744.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(396003)(376002)(136003)(39850400004)(346002)(4326008)(316002)(956004)(86362001)(2906002)(66946007)(6666004)(6496006)(2616005)(66556008)(66476007)(8676002)(186003)(16526019)(26005)(8936002)(36756003)(478600001)(38100700002)(4744005)(5660300002)(83380400001)(54906003)(1076003)(6486002)(36456004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?QuIxKC34QmEc1MK5N8oJcYbPzMIKqEbRneT2j21UTiGZtqHBTs0ncrCUQa2e?=
 =?us-ascii?Q?MgLpasb/15z5pKkddfaUzv3PZevaEWQZckyHNTTJ5TciY+uVdIhLh/iZ+UgY?=
 =?us-ascii?Q?YMUkUmZJLISB7qYY/OuiJbZtL9TMC0QzqswxnGiaSpVHlG1f/G1Bqjy0DJiC?=
 =?us-ascii?Q?7zZAO9Ylapwf7BZuWC3VWnnAwvBZB5fA+lVL7JdhtlcccooPDI1c76/Tg5K3?=
 =?us-ascii?Q?r/Mtx+cZRDUncI6739TK/DkgMBDm0WcuZ0wuFDsVmJtqKX2+DPkmjv7V7ws4?=
 =?us-ascii?Q?DmGrsG2eTMH7ZiR4mlLv30cHFsYbJlnszxNroymU+UZC6AMQGovj1YTkN7zE?=
 =?us-ascii?Q?mHl9A+kD6XCVEM6bHOjh23m95i48mN5+6P4N5FcduVxiWYYFGYNaIErzSh/f?=
 =?us-ascii?Q?3DhViE24XNEfbGqjU9auMkuR/zj6Nru2sWRSC8CtTvn8jRiUIAe6yWciRehh?=
 =?us-ascii?Q?+dltbU+AHq87GyUd6uy2z3gA1MzeN1JCAyObhSEXj7KIkh/Uebd0RXeNRgS8?=
 =?us-ascii?Q?RdhwCjKcIRSRPHM+HY2ZhZZIOwDp5I6Bg2bdM3PGUkapCb3ao18aRS63XolH?=
 =?us-ascii?Q?wC+c83Rg9bAUt3piHPAiDHhchEmi6ML/brt0WOvLWBBFRfocX29sfiDgefQu?=
 =?us-ascii?Q?hMUzEIZiKZQOEq759r0CZ3zqHs8cQ1hYKs37qkFPBjvwAi0Iat41Ke93Kx6t?=
 =?us-ascii?Q?ClDvTh9v+lw895sS0Etk/vJuCghJ7kZMhAKJa24FvtoeD3PVca970oDYB7qx?=
 =?us-ascii?Q?0BSA9ZwZQzNWJHRxqWtJLDFneE1Zut2WGPeKM+HpaH4kve1ltxal0IDt1fXm?=
 =?us-ascii?Q?thDaTzqvYwnuIvLU7nWjS4vlOBzemMOEQKgpo1HDvagohLhni75Sld0hhrOc?=
 =?us-ascii?Q?XR+V5h3ReorEyIF0OHqYNLFmbNex7tFpp6IAmY/XHKLkP5t6yaXlp+QdHJNI?=
 =?us-ascii?Q?P1mF0vrnFuoEh7UQBENTSRIxByISJ2vfYH0AlyGDezja6PbZ5toK7SDmvgbW?=
 =?us-ascii?Q?sWhtzG1fqnf0zCos9VSO29Vk4FbUWq9QkKKsAeLehdySLyU0eP54+RFUsbXc?=
 =?us-ascii?Q?RNNLJtitHl0Qfbadjn053+Wra4tOuk9NNDG54ZUyUu5RcyuXaYvxIv3nQ8st?=
 =?us-ascii?Q?3ebn0m4hKMF82rlPU6YkefP7WuCkqqvbSS8teuB01wi/wr2xpJWWv+6Y9MJ6?=
 =?us-ascii?Q?dZOGrl9zBi02Qu3g6uniUtlmjIM+TUFSRteh8fKgMhm6B6kbYKp5eJ+CseeU?=
 =?us-ascii?Q?i0sg1XJaRRgbk+I1sp6dARl8yaceXajYsnlS4PGRQ7bOAg8Ai88MnltgKoW5?=
 =?us-ascii?Q?ZZmemB1+MKgGxEav7JnqILmS?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 59fc14eb-3fbf-4c37-dae5-08d93566f6bf
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0402MB3744.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2021 10:17:39.3520 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 65jKO6AVN8CdHjSUE5szJ5/PiYsx5OAP7sJz7i4/APKHf1ir9YjTbXHqCShpEkeR
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5405
Received-SPF: pass client-ip=194.104.111.102; envelope-from=acho@suse.com;
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


