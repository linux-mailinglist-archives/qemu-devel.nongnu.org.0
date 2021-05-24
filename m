Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8497B38DF87
	for <lists+qemu-devel@lfdr.de>; Mon, 24 May 2021 05:05:14 +0200 (CEST)
Received: from localhost ([::1]:35538 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ll0tv-0000rm-LL
	for lists+qemu-devel@lfdr.de; Sun, 23 May 2021 23:05:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46620)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <acho@suse.com>) id 1ll0jP-0007jd-KW
 for qemu-devel@nongnu.org; Sun, 23 May 2021 22:54:15 -0400
Received: from de-smtp-delivery-102.mimecast.com ([194.104.109.102]:30888)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <acho@suse.com>) id 1ll0jN-0003dO-KU
 for qemu-devel@nongnu.org; Sun, 23 May 2021 22:54:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com;
 s=mimecast20200619; t=1621824852;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FYCafF/WC3LB94/4DMxgi/kgo3C0r5bwiuB1ZQ93ueY=;
 b=bWMxsV430wOISJYamBm4zqMaqXISNf1iwSVnfUsqToa3KtHm9igEz6JZ8Q9smEwLCrMIEH
 z7pAKvvzn6hMO9tcsrMThISoAWjvJbfhFF4ltSJbpShiRMOAPToJ0jFaD8DYo17N/KJ6T1
 7WUO+XEUqYZeUFzrKCS+uu8TgpnguOw=
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2052.outbound.protection.outlook.com [104.47.14.52]) (Using
 TLS) by relay.mimecast.com with ESMTP id de-mta-9-aMR1s0AWM1GRU23p2ZxRMw-1;
 Mon, 24 May 2021 04:54:11 +0200
X-MC-Unique: aMR1s0AWM1GRU23p2ZxRMw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A/xPxyb0Hzf/bM5Zf3y9cBDlkSTQtI3Q+cZmVNx2XW0dF0VVQvQTPA8uPPDuqiqZWNcAODfo69L7mj/MTTLc5apnx7Sd8gRLr+XQUl+K44ehETP7aCtWNJoGhGzFFP2Uj1FFtdD2BEU3tn9UKn+YB3m1jsT/rHVKd1DBTH/BOsUR1NbcteMMWLKCD4Z8P2J47A2sD+JkbSuB410codsPu65blo3Buf6Syz+RrKfIJXybi+SvTN5JuOgavQ17nU7TCLjbA5QBBDdUza+4v+EhBRCE0c2HCyYsdrxo2WBuh/MXsAFq4SwSNe4izFyRg3C5vmybgaSq0U/HhmrMVTJ0nQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2taWfiWgplpiXsSv/r8sccgq7Sz8Kw3XrmIFTPrj9ig=;
 b=IVYuxt54Lhmg8ochuna34Hb+fH793Q0Tk9fQjh7omwThSxkQkLzLPhYEJ8gwnX71Y64Amt6l4g4Qx/9xv6nuInAjZv6kBjZVmPQyDfVB32W03Rk/7QiIsmS/4BX4NB6KDvaKtHleKoBk3qBE4NuxVEabAzWuUYyeKwp/cfBV9mqEQPqfTiqlirV4dZd85w3huO20aNefW3uWqkPFzBw8ePwKdwRGxeBKXVn0YFCc26N8puCT2pWLuHG0SmCXRu/U14icBmkJB6EY82f+v1UnfDuU7IbPZSYM6i/MCZBu9Wdj8yKitgPiJqxOlZe6uWiV0iwM4CgagfBajyQOzuNyFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=suse.com;
Received: from VI1PR0402MB3744.eurprd04.prod.outlook.com
 (2603:10a6:803:16::25) by VI1PR04MB4126.eurprd04.prod.outlook.com
 (2603:10a6:803:47::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.23; Mon, 24 May
 2021 02:54:09 +0000
Received: from VI1PR0402MB3744.eurprd04.prod.outlook.com
 ([fe80::b446:f4ea:d07c:ef5f]) by VI1PR0402MB3744.eurprd04.prod.outlook.com
 ([fe80::b446:f4ea:d07c:ef5f%7]) with mapi id 15.20.4150.027; Mon, 24 May 2021
 02:54:09 +0000
From: "Cho, Yu-Chen" <acho@suse.com>
To: qemu-devel@nongnu.org,
	qemu-s390x@nongnu.org
CC: cohuck@redhat.com, thuth@redhat.com, richard.henderson@linaro.org,
 cfontana@suse.de, david@redhat.com, pasic@linux.ibm.com,
 borntraeger@de.ibm.com, pbonzini@redhat.com, acho@suse.com
Subject: [RFC v4 14/14] MAINTAINERS: update s390x directories
Date: Mon, 24 May 2021 10:52:56 +0800
Message-ID: <20210524025256.22252-14-acho@suse.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210524025256.22252-1-acho@suse.com>
References: <20210524025256.22252-1-acho@suse.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [114.24.18.39]
X-ClientProxiedBy: HK2PR04CA0057.apcprd04.prod.outlook.com
 (2603:1096:202:14::25) To VI1PR0402MB3744.eurprd04.prod.outlook.com
 (2603:10a6:803:16::25)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (114.24.18.39) by
 HK2PR04CA0057.apcprd04.prod.outlook.com (2603:1096:202:14::25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4150.23 via Frontend Transport; Mon, 24 May 2021 02:54:05 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7440f438-ff78-4dfb-1e02-08d91e5f3401
X-MS-TrafficTypeDiagnostic: VI1PR04MB4126:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB41265B2B724B75669DE6992DA0269@VI1PR04MB4126.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:949;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7HfzmhR+f4zIj79ifUVHyimYrsP+5QFGlYouAvU7a6rhA+FhTgawwsWKJEF32MPE62qTyQ4NVq8gIU3nK8Jqnr9aSabHuhLsTlJRj3k47Isg+gmOK/kymiJRqRFkYSlCWelPlZ7lL+4yqV/jo8CaobFoIfDaDu/z7fJtRfgQL1b8UkjRi/VtpK0ZSctDrZCvBotRU7Y2l+ZrJo3UahYDoKm5blgWsN5C7KbxDd1wcB6pSitdLab6+Rcp4l0hUSwptRTKBuh9ZsbcV6+MEdy+aFRJxojmI0MGyHp6bGyFA6DoQdPMv39inkRtzyUJgyFVzbuuY6VjcWh7fV8hB3I7It4yqTtUKGJzyYGV6YdLSKxI/kPoZUKGEbJues0loqxIqlGizNNB39rNogQuo+QsIUSQAVeI0ylql/wCfOXnPRG3ARPGfzzEaL2H2TM/ezL/kLDu3755erR3qLirDy/Qcs51mipsYO312STvjcn6rZbnYclp5GUcEqMwZOfQefdZNZtND6FzR724OOpdoxi8F0sz6dFjiKGGe84NGA7kV/NbUYTJyVnEvW2Ujem+0E8Y006fK/JWJZlZEXasrLWT0yMO3BssHBPcT6K/7QThCVet8scguoGb45N567okAcp7wG+XQXkKiJR/oCSp3JqSVr1GASYMwRGsM11fWUxdJWGRUksvSNeEIrzLq4pQQnjg
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR0402MB3744.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(346002)(136003)(376002)(396003)(39860400002)(36756003)(316002)(66476007)(38100700002)(8676002)(38350700002)(86362001)(52116002)(478600001)(66946007)(8936002)(1076003)(2906002)(956004)(26005)(6512007)(16526019)(6506007)(15650500001)(186003)(83380400001)(2616005)(6666004)(4326008)(7416002)(5660300002)(6486002)(107886003)(66556008)(69590400013);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?M9UMBUfXdjoUr70AqxCWhpnzuxiIB1DYRpjGcIMtWBr1hAf7m2qsDe37qqRy?=
 =?us-ascii?Q?WU3/yB8VtqczQodShpvoXyAEtl2J0nIBPtaqHgXvxhceZam2bwu78/hvx70s?=
 =?us-ascii?Q?FMisb8UVZ6bAdv5txdr169FON+rXH5QlLQkMolzTWXT8skOFG07YQGQzdZer?=
 =?us-ascii?Q?Wu3b9wao2wkDLjoTr16n89X2aHg9m3jf9hK5cCaOY5gTZMwUUNw3I/pGDJUW?=
 =?us-ascii?Q?R5MSnMTYx2uDDFguBzFTnD8ceAkN7KlTaZIcCqhIliITZCygxU2DHVwFkTPS?=
 =?us-ascii?Q?7mKbfCAI3z0cy/G3eQ6T0N4Vi2jjWlMX0PdjXMDCsMAiVo6f5/N4Tf4YDLFZ?=
 =?us-ascii?Q?jsPToKAb2J849HJEBVSG/2bn3XAX2Dr/+ii/gr6pcG04R84pvHTzufM5nnDE?=
 =?us-ascii?Q?9mWj4DxKB2qax+80QD18SaamCM93sTD1cayG4eYhq14Qcq7nipyKcwn/ytY/?=
 =?us-ascii?Q?VQkcnnluLX1+Mosr+quduvJsoAtbwww0Ni4tVIBm30Hw+Vnq6X0dj6V/D0LM?=
 =?us-ascii?Q?w44wwxbJ2k+0X4h1ESDfEiBdNjTpAGXDxEZtB5KqgtVql67itbCphOqhuOMg?=
 =?us-ascii?Q?YxQjLqMXeYugFYM7DGczolumtJuHR2t30MPN/q5rOUHVmuVaykxUlQ1WyCUP?=
 =?us-ascii?Q?qI/h/qkyDsl0g8wcblwOE9PRCyjUKo8DhhSdvzcPCu0sNyJoOKMMRScLvBZo?=
 =?us-ascii?Q?0xQd2jFnG2eaYe8LOFcop6Su7QaOloknviLoIMIDKZ18rS2rLGHqVH/vSu77?=
 =?us-ascii?Q?BRwZDeNgnEUZlSWdrCygZJsMt4oZDGQjdJrAlDT6HY5zh3ZhV8BShGQd4P0x?=
 =?us-ascii?Q?hHezGypoKlgGbqcQ4LnPCD1QgQAbyWrGpMng/8AyI5pYI+XkzcWiSTHt/MHG?=
 =?us-ascii?Q?mFCLJgXOawBFzjuhCjx1Ofkh7NxfmUVN9eIwBO8MOJoKOJsBzrNthPa12SdL?=
 =?us-ascii?Q?CBBg2IIyCMeLA5K1lwvnCFz+mIXS0dNxLe5evpAJRLRdVfc4QWmQf5ta6Gff?=
 =?us-ascii?Q?sVimBVDPoZOH3I9f3jmqJm2WIL+dRvGPDADaKv8utXQIYgWHxel5UPZ6p25Q?=
 =?us-ascii?Q?uzFL0rO0ttncazG/YkDvFwkoJtoGkF4Gh5t4mh8jUJ7NVwntOGTpWT6hC62d?=
 =?us-ascii?Q?N3lbATkOQ7AQ0SOwCehJ1ut0w5ybHSKcDbLPScTGh3T8LjWjNCoW3lHG9UWX?=
 =?us-ascii?Q?BqCZBBgLsORIcC3rHjVT4gJrNhlFz3xCS1dVR3PRbW2w6mxHbEPZ0c3PSPBX?=
 =?us-ascii?Q?DIdgwCHtqVxcCvFiK2zsCALy7G0JcNFcOUerHhWkUfqudA+bKzluPJaKfATg?=
 =?us-ascii?Q?wgnXMClB481ArhDdV8JQ92Fo?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7440f438-ff78-4dfb-1e02-08d91e5f3401
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0402MB3744.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2021 02:54:09.6238 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M80v9r25q/fg3g2F5mn49o6G5VQDk9g0qq4ulsJuQXbKJW5/GhLZUhpZKmcZwcD7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4126
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

After the reshuffling, update MAINTAINERS accordingly.
Make use of the new directories:

target/s390x/kvm/
target/s390x/tcg/

Signed-off-by: Claudio Fontana <cfontana@suse.de>
Signed-off-by: Cho, Yu-Chen <acho@suse.com>
---
 MAINTAINERS | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 89741cfc19..8578927961 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -293,7 +293,7 @@ S390 TCG CPUs
 M: Richard Henderson <richard.henderson@linaro.org>
 M: David Hildenbrand <david@redhat.com>
 S: Maintained
-F: target/s390x/
+F: target/s390x/tcg
 F: hw/s390x/
 F: disas/s390.c
 F: tests/tcg/s390x/
@@ -389,14 +389,12 @@ M: Halil Pasic <pasic@linux.ibm.com>
 M: Cornelia Huck <cohuck@redhat.com>
 M: Christian Borntraeger <borntraeger@de.ibm.com>
 S: Supported
-F: target/s390x/kvm.c
-F: target/s390x/kvm_s390x.h
-F: target/s390x/kvm-stub.c
+F: target/s390x/kvm/
 F: target/s390x/ioinst.[ch]
 F: target/s390x/machine.c
 F: target/s390x/sigp.c
 F: target/s390x/cpu_features*.[ch]
-F: target/s390x/cpu_models.[ch]
+F: target/s390x/cpu_models*.[ch]
 F: hw/s390x/pv.c
 F: include/hw/s390x/pv.h
 F: hw/intc/s390_flic.c
--=20
2.31.1


