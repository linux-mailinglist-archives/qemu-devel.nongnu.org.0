Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BFAF2D7DFE
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 19:24:25 +0100 (CET)
Received: from localhost ([::1]:34006 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knn5c-0001M0-9H
	for lists+qemu-devel@lfdr.de; Fri, 11 Dec 2020 13:24:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38660)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <saipava@xilinx.com>)
 id 1knn0W-0004sr-JT
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 13:19:08 -0500
Received: from mail-co1nam04on0611.outbound.protection.outlook.com
 ([2a01:111:f400:fe4d::611]:40321
 helo=NAM04-CO1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <saipava@xilinx.com>)
 id 1knn0T-0001DP-HW
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 13:19:08 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NOJTn7StDgi49s/S5sPF0mLP99F/j7lGjaIKliIWPe+IKDNOxDMRmLl/pJucAs4x7n1Iwy/gLIPRk4Eruxt29DTuBniiTmF9m3Lx4LojrcNA0Nb0YF4D8ibskfJXs03DdrayFBktA6++kVFOWCYqCQlP8gGP5OBsv6thjSwCvYeLcLZ5UlBapNfKY30/igDcQkBPBapFze4LYTBvZUfe7ERi2C2dqpHNwtX/93NK6rsus4vH7SDAiyGnj/W1xP+SPvaZDa+bqihyl4DLeEu5IA348foEdNKm3HOKiunTjDztvIoUpAnDJYUEjW4fRHRFbH8i4Tr73TvHd7XIQ8xGnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7LusyJMuRsTX4DaePSMq0YsaMNS3pJTqv4k3X6L6eyE=;
 b=Td/hRXZinPc2KTZPd30AjUewLWio7eBhbCN/pBx8w7Hy0dMi2taDd40OaII+L8fl98G1N0upj3yVCaLa/RKQ1DMsS06lqM1JvVjReirc5wZ68TCQbkzMzLIWiJdvUduWCwVi7dcPyobYLUez8aE8Oa2IFD5ca2Sy2Jc+iP3WcwY+udssrMnN8a9WHZIvQGxoYMFO1yV0iZjdCUW49YNCVPXD+cyoRdFukizjFzSF5KAE7Wf5CAdZm/DOFXAxUlBIi8EzZtKlgwlbjkT+kwY7+WMYFvZnTNkuDl+sqantMNJNBAhtfDOdIiakYZcc895Izjj5eKW0WxdeYFy2cafVzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xilinx.com; dmarc=pass action=none header.from=xilinx.com;
 dkim=pass header.d=xilinx.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7LusyJMuRsTX4DaePSMq0YsaMNS3pJTqv4k3X6L6eyE=;
 b=M55mvqbg5PyZUcJi6ZYvlJo32jCYeBcZKlPQ7fLNkkRm7JNPZN4OcOib4RO+3oxBbbrpY5z/X5GKjqY3PqC8XoexjyykvPAUDQiXUqjxr9hdTJveVwugqLdbTNQlifrafZFMYxICAEpk3Vx5onqHqAuzq7+2lUk1XEugRY/uQS0=
Received: from BY5PR02MB6772.namprd02.prod.outlook.com (2603:10b6:a03:206::11)
 by BYAPR02MB4278.namprd02.prod.outlook.com (2603:10b6:a03:55::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.25; Fri, 11 Dec
 2020 18:18:58 +0000
Received: from BY5PR02MB6772.namprd02.prod.outlook.com
 ([fe80::8163:86a2:8279:471c]) by BY5PR02MB6772.namprd02.prod.outlook.com
 ([fe80::8163:86a2:8279:471c%8]) with mapi id 15.20.3632.021; Fri, 11 Dec 2020
 18:18:58 +0000
From: Sai Pavan Boddu <saipava@xilinx.com>
To: Vikram Garhwal <fnuv@xilinx.com>, Edgar Iglesias <edgari@xilinx.com>
Subject: Recall: [PATCH v15 0/4] Add Versal usb model
Thread-Topic: [PATCH v15 0/4] Add Versal usb model
Thread-Index: AQHWz+oYMTNRqoau7ECcOhPIhEJosw==
X-CallingTelephoneNumber: IPM.Note
X-VoiceMessageDuration: 1
X-FaxNumberOfPages: 0
Date: Fri, 11 Dec 2020 18:18:58 +0000
Message-ID: <BY5PR02MB6772485A29E11332EF6D21C1CACA0@BY5PR02MB6772.namprd02.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-TNEF-Correlator: 
authentication-results: xilinx.com; dkim=none (message not signed)
 header.d=none;xilinx.com; dmarc=none action=none header.from=xilinx.com;
x-originating-ip: [149.199.50.128]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: c96d2cf0-740d-4bef-4932-08d89e013aa3
x-ms-traffictypediagnostic: BYAPR02MB4278:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR02MB4278EFF559E5D4F28DEB54EECACA0@BYAPR02MB4278.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4303;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 7zrU65oapXSE5ps2POZT/GZha7Co8zK8uqBzEwd/F5xNPPqLzPOSmF1VJoUxdSQf98tv7AgRNKpYkQkZT3AqBrOOUKElIkIPbp9HUOLOF96DppJ0sUIYjVynZNiaAuXLdBzmhwxuh/uEVqhknZcOYWUCZd1mt9FYSBG1ksukmZke0rvO2x5gNXEZWvoFMC1wsUYYrQ/NXicUJzqzF8EGaZXheE5L+AWuCiJtDh/P/+usViKYWkd2HhX3R5MM4VMZ13c/vjwMbNqcq/PMVSMSzMzLhpoNuuyRFoHYpc0LkB9OX9tDLkA2MzZovxhHUFWg
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR02MB6772.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(346002)(366004)(376002)(66556008)(5660300002)(52536014)(71200400001)(64756008)(9686003)(508600001)(66946007)(55016002)(4326008)(66476007)(2906002)(33656002)(558084003)(26005)(110136005)(6636002)(8676002)(6506007)(86362001)(76116006)(66446008)(7696005)(83380400001)(8936002)(186003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?zlg4uFpc3PWeO+CEEUkBsm2B31BQOTC7y1P944S4icbMdyXd7wofMXIcX+Ol?=
 =?us-ascii?Q?7KmzBKo9yeQLKqsJdvGn+NCHYHsVkQwNLmoLGK2J4vkaaccmW/w/ZpCF0nf0?=
 =?us-ascii?Q?butU+psu+gi0dh/4n4Ei2FbfFCk6HntXEVFPPxEuZK9TerMIKRiwTvANayOg?=
 =?us-ascii?Q?6qi9JY7gET7KwBCEfofMOHvkmfjzEuG8FpGwPAAowoKwxZ8KOrjGmB0gKKoB?=
 =?us-ascii?Q?YzmjSDIL1hGne6i6ROt1dDz2liIyBSIfmJfbW1pXTH6kQHHMmaQCirsd3X9L?=
 =?us-ascii?Q?CmYawxhPLpxru+2zCKWKokwE+VgJM9Bw+xL8fvPPVaGdRSQt4BgN+fXq3q8U?=
 =?us-ascii?Q?eOmv+Vz2/9xFNDtLMPjeUbyS5Pl710NKct86Nb3Q07nQmmpUTl21SfZPc0q1?=
 =?us-ascii?Q?+kxzo3siA6a/Zxr9e8RcpUV03dhgvJzQXuqa/Xl+43irzxn5vZ/gnE8CEM9f?=
 =?us-ascii?Q?17c8hFwZIWiugBdQKHJys8WjoI/7V/SH2ZDWytP9CitnYXfi7vY0GIgtBUb0?=
 =?us-ascii?Q?dJClfjvMWNwzO29AQzumPijJtzH75J2//M3f30o231NLCFqKQYFQYSnN8/Bt?=
 =?us-ascii?Q?wYCR98AKij2jHwbsvHCIZduTocbiPf0ddhSXyNrrtdagnVcIdPheaFFCfnir?=
 =?us-ascii?Q?Jva9SvN4+AWbSf5RU3IQe6cZPIlqXJaSvrClSnVEj4Y1yQNUsil4egA0x+nO?=
 =?us-ascii?Q?jzas1oxvpf4mctoD/p9YfLPq4wGBHyRt/VldL63ymGxknrKxzstZ6+dMYBNm?=
 =?us-ascii?Q?J4GZBcUzlPvD1RnRTk7zMiJNVMKkEz+9xYNVKCwSm9xuiZ/C21VQvKnhDo+T?=
 =?us-ascii?Q?stL4SNXDyCnGhAqcIijLtQcPSj0fS5CyqKEb383hZYDoityfX1yIvtQ6UJob?=
 =?us-ascii?Q?RKmcR66/NGxLiOPQPRDE3HJNHxGnM2T58T+nZIB/Gn2FkmOHqQEERr2h2Us6?=
 =?us-ascii?Q?3ZQj3YVTBy4OClFigrQZAMrgm3TpAGIbl4Pi8ro+xnk=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR02MB6772.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c96d2cf0-740d-4bef-4932-08d89e013aa3
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Dec 2020 18:18:58.7685 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lMgQtFO7eLDMCML1wX7hTmNgCpNlgSccoK0p3Y4dPTZdVnZ2axmVx2rr9n3+KBxCmlAp7IouHkjZQc+SDBTFCg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR02MB4278
Received-SPF: pass client-ip=2a01:111:f400:fe4d::611;
 envelope-from=saipava@xilinx.com;
 helo=NAM04-CO1-obe.outbound.protection.outlook.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, SPF_HELO_PASS=-0.001,
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Sai Pavan Boddu would like to recall the message, "[PATCH v15 0/4] Add Vers=
al usb model".=

