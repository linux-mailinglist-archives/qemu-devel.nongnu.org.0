Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D275F3CCE06
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Jul 2021 08:38:23 +0200 (CEST)
Received: from localhost ([::1]:55138 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5Mv0-0007NY-QV
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 02:38:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33490)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <elena.ufimtseva@oracle.com>)
 id 1m5MlM-0004Gy-7i
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 02:28:24 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:18188)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <elena.ufimtseva@oracle.com>)
 id 1m5MlK-0002PC-Am
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 02:28:23 -0400
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16J6GRap009277; Mon, 19 Jul 2021 06:28:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=corp-2021-07-09;
 bh=/hS5CpjMLdtm3U5k0GxHkxqpLA5oUleaolkzeUPEWTE=;
 b=xoxBpd0i41gW437PJAXM7KAP/+kJ5yR1J7MC0XzyfJdWwBMJiNrD4PS2CwiqVtoccuOw
 ZQv4mciEG3b31QZZOUpDVAJrJVb6bFPH/muzdObekhKvR/UKVM5Idhc7DYK+CuTaKvA3
 g8PXEgYmf3MkDDmTJfwf6AYT3ZaHLb5xvhv6oz6NcYUPpD3y53pZOE6xNywn2c7Ze/mU
 gxP98iLpZYADLz/w03A0/spsI1O2iLvR4ALh/WA4Qr8ekfXPbRO1OzNTWEYKYLd3GYH+
 p5+EIHVoxkCtyluOnFH6RJvKfNGdJAPqMfRjMAeQBk8O8BWbZ8kxN6eZ4fkYqlJZmmTL Yg== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=corp-2020-01-29;
 bh=/hS5CpjMLdtm3U5k0GxHkxqpLA5oUleaolkzeUPEWTE=;
 b=SOkP9AVaZUHG4WNUB8CjRW5W4uRgBVNj3ovP5gmI1Y3qb5uLxmFdJ++ls/NYnkXN+VPI
 JX+xLC63ZOf0y/ShERJPJ1StjW++9T3iNQd4rI33T4G0Cmf/niG+2S7w+1ARk9vTkFRk
 vKbWpoRfez+6cke0KvajalojRmOPbj9MXrMf+aW0k0NXeeo5UbYNchgP2IcZJG8fU6Se
 sL3zBCdx73aNnkL4MwEPKep4EepQex4Qn0S/CzTNz5NgIfImTJeYy+gwYqYtHGRR59S7
 NdmF6wBn8Ke3Csjarh5COUekEp8oodipXbHaNUUn3nAhB35u7B/a72wEsgRsRpsGEWoU mA== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 39vrn5gkjb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 19 Jul 2021 06:28:07 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 16J6G9Sx086873;
 Mon, 19 Jul 2021 06:28:05 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2174.outbound.protection.outlook.com [104.47.57.174])
 by userp3020.oracle.com with ESMTP id 39v8ys1vt5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 19 Jul 2021 06:28:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PR8GSxnokknTf8fW/mWocrXzfggbg9rRKcG8KyEPM1lcB1QKAI/85Rzq6lkT0RWlV8JWH+g6vcrPmoGLvyTCuQmb/PCn+oCEQf2jGAJRGTpwoem3LFGTqSqR9vLMSVGOGwjRmUE3MkxRqeqGYzvOMIbIxldWAKb3J7BryT1sIZ4lbgmIZcgKbsM9laqX7YAzbKB4um7wzz2xo+5oqxvRC1LZytqwCZXqPAJLmA4cRzRRVxTngotk1NUk497pyr3Cm+EBBYmSVDOWbRUuqwG6juTXSK+AmpZyZ016gZkVlTzt7LHgKpt4AVCz82ahMAxzT1HyOeLqMAluqJ/ku2ZbUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/hS5CpjMLdtm3U5k0GxHkxqpLA5oUleaolkzeUPEWTE=;
 b=UJ9kEe3zajBDbNQr90uO5wA28faZAVM6UOY8bMxc4/Ik8l0ZpBlKunvXO5znMy6DZHT9Zuug3MZUhdJnTJ88RrI75to83Q4jltSooAyFph/xJDynSF/dVW6bR5xZgcU7SZTbH+H7ooXqB6EzWYo+XWdRqkLXERSd3lJZQYXqd4ueM5hmGWBZaHstcjdOt51Ia2x30qbzIlfEnyF52Om9dGJ909MEtZdT83b760VaY3RwNidW+OYUUzZwUeeJIsg6L7Tw1pPDE4pl4N8Nz8nNOYksBqtEtFhPOOzuGi/biWpfm1ccoRsrXDnh4wrBhL3+PtRBZIvWqe48EWc9x8pVJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/hS5CpjMLdtm3U5k0GxHkxqpLA5oUleaolkzeUPEWTE=;
 b=zB/LRUX/eMu9qLDGCODEwJkto/ThptgN4kzyFUaE6YCQUJE//gNIRdVdbcsLeffmFJxpvp+klNIc1uLJD92LGMEi9iPJ9RMV2yP9KaLdsIdB96IhpVvGQjE7m6yhDjN8Z0RCwOwPiir5g3LGhWY1LSCe6S+QdlHpluutPONN4k4=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB2869.namprd10.prod.outlook.com (2603:10b6:a03:85::17)
 by SJ0PR10MB4814.namprd10.prod.outlook.com (2603:10b6:a03:2d5::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.22; Mon, 19 Jul
 2021 06:28:04 +0000
Received: from BYAPR10MB2869.namprd10.prod.outlook.com
 ([fe80::5891:a7dc:5c2b:5539]) by BYAPR10MB2869.namprd10.prod.outlook.com
 ([fe80::5891:a7dc:5c2b:5539%7]) with mapi id 15.20.4331.032; Mon, 19 Jul 2021
 06:28:04 +0000
From: Elena Ufimtseva <elena.ufimtseva@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH RFC 00/19] vfio-user implementation
Date: Sun, 18 Jul 2021 23:27:39 -0700
Message-Id: <cover.1626675354.git.elena.ufimtseva@oracle.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR16CA0022.namprd16.prod.outlook.com
 (2603:10b6:a03:1a0::35) To BYAPR10MB2869.namprd10.prod.outlook.com
 (2603:10b6:a03:85::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from nuker.hsd1.ca.comcast.net
 (2601:642:4000:a09:3c73:d99e:ec8c:2487) by
 BY5PR16CA0022.namprd16.prod.outlook.com (2603:10b6:a03:1a0::35) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21 via Frontend
 Transport; Mon, 19 Jul 2021 06:28:03 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 208f02c4-beb1-4df7-c013-08d94a7e5d32
X-MS-TrafficTypeDiagnostic: SJ0PR10MB4814:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SJ0PR10MB4814E64975C7DE77BF4DE57B8CE19@SJ0PR10MB4814.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qcN0ruQlAeXQ7tUWAd8PRqoaRTIukoOhx1iFHOLivtcJcgG70b9so4yoiACzFwhnW6RResKLNoh6Ivyo6oT8ZAdjjC1IJ/6vJd+97Gd5ju2jsoVYvOE/2T5HUxbAKHsVeDQIdGRA1rkVI9fEx3GFT4FYtzE9nfdbpiRXyEXXMW/PQw1Vja930YO02B+tbu2Zh2ptNoWr4CDi66VFyYbBjc3WACTUYr47w1N/wTATJlr0xfF5X4dJys2zvkxNpRxThzbFNP9MQ+lQlDn6X603ZuvJCkpcnE9/Ya95oO9B1335ElgmaCGCyHq6sWap1DaeLRI06SB4VNIERHdRH/G9Rc2sRDS14AsrjgNGnmculyZO/mKjtQ1xFXCtIwXEOh135xot2VZ02lAkls9tGqsibgWGJSu4vypkqJ3MQO1zkNWDeau52y3f64QVfPbaBMoGS6IRv4+rAlh5QK8oFGmgiKqtbXTJQIyD+4/kaIWPqke9Au7h3OUPbFVPXA6KdITfG6nWaBbQluF6GgcKxeredXawOULRHApS5JoZeaapaeMTL7uq1HEkq1PMXuJshu8X7ePMpsooiGJtjh4/tG+kc8rJbtAZc8gno2xtQsJ1bunHb4rS+IWZxFASvMwknG+bH+wSYLFGBVXps9fFtJQI4p8a6tG2AHBOEs6Xs8aApzumIXzszSUUikgwRR7wtuC9W/Fg9Qbq2t8EzrMar1VIlPB0LJudNOBqM6AHHr9lf8lVxCLajZ55wyKnost6WPlk4A4MD6ztNnek0B7eHK05GQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB2869.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(396003)(39860400002)(366004)(376002)(346002)(136003)(2906002)(6486002)(5660300002)(316002)(6512007)(186003)(66476007)(44832011)(66556008)(2616005)(6506007)(38100700002)(6916009)(52116002)(6666004)(8936002)(86362001)(107886003)(8676002)(966005)(83380400001)(66946007)(478600001)(36756003)(4326008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?mHu0Pv/xKosOAZteeSokJQprCAkVSCq5MEXGVhQ4MTwSsfDiqNp5emHqMcqN?=
 =?us-ascii?Q?9tbi5+cW9mnUoDucMyuxAPmJB0ry6kCAXNBpKkeFiLgAdlce5Z6Hu2d5klL2?=
 =?us-ascii?Q?WTXfCRmKmykcTrGBjzO+Qt3NfT2fmby5DyqV6FByQ2ElgT5YgTZqSgTeYJTu?=
 =?us-ascii?Q?Zp9J0bMmZNa4XQslCmSpBiHDUIuKeUz/Jp3CqHs5EgYSLY0eFVaevGGsoS8V?=
 =?us-ascii?Q?crCHdhBwTZkWD2GYj2xbsnDeZ8+74azM3ldiDrZDs77W17e8cZrrNCcWut2B?=
 =?us-ascii?Q?x6w20vRHXyDv3nvJqgvqcWSko8Ap9O6SM+gjtQPuid4/talZ/aYaw5fYQ1D4?=
 =?us-ascii?Q?U8o5Pxdn0OSQPuRzxs+3kOb0j69so4eK+4blGqJimx4nTDEWr3+jNqyGvuFR?=
 =?us-ascii?Q?fEpduaT35Ct/Vd4mEI7wLgF1z/rfqsequZAuUWD8oBq2JcrVrgOgSrJf/HoA?=
 =?us-ascii?Q?Zls9z3Qp3UmART4/r/cTBNbgfCab8XytwKy9i7W4V52emfsjdIZI4quCy/IL?=
 =?us-ascii?Q?lKEiNzaYVVlFYHv45KQaYqd1e0SXuLZW9uN4/2ubPaAEotYFFvhGP5Rb+Z9/?=
 =?us-ascii?Q?DyrtYLmmPCM2bMfyRvLXAF87G361JWSA5qwu4iAbCN+1xYTrvDtb3fXat3Wo?=
 =?us-ascii?Q?jvdsFtY6sAQ8JxQSlRiF2HlcWX/TMU6X+dCzb4sCcS24tH3tXCq4gki/tCk2?=
 =?us-ascii?Q?KKNnB2q6VDRlotr28fY0tKsHUnEOhKWk9vZr8MNUVtaknWe1m/dHpN8hhPWv?=
 =?us-ascii?Q?ouSHCn3i7QH5nZX9YtC0KRp9dhO6WCqjJaTUgo5dQIbBsYi7NidyxhJnDJ7J?=
 =?us-ascii?Q?K49ZoF466RP8NuODX6s6hOHcY10XjGaA0zJcop4SiyvG/fu7Ah1HEN7a74YY?=
 =?us-ascii?Q?7tVcF+WH1CwoShaK82Lm9uvAFcpaXDEESrdqrNXnvbil+XRdNeCeVBx0b5uj?=
 =?us-ascii?Q?iRK7XQG6+XAUh5l0sO4WXCRraT73EaJ580kZP6/69G7tVwvJ5k/byUn9nj9N?=
 =?us-ascii?Q?7+F/i5XrGogm2WKijBnX7itrPJtQydTgQlyYPavwBZZTmKs1KKWT+4ciEL7F?=
 =?us-ascii?Q?BGSQOraWrxuAZZ2UwvABG2hqeaYEZHYR516mh33l519nWJjFxJYbJ+B3Jgv4?=
 =?us-ascii?Q?eZjZ5taMKHnU5/EQY8KHvlKpXXziH1RqY6604cWFUK71BxRfelAcwmf+PGEi?=
 =?us-ascii?Q?egCPart0BKN/Rj2CfC8raWx1ppdOi8pCbsFYH1WRQg78JIYDnq/bp21RsL4x?=
 =?us-ascii?Q?n7OO+w/8McQ0SCOCNVJ6f+8wQWXd7uyfGJMxCGU1ftAJSkSjzvGGze7x/rUQ?=
 =?us-ascii?Q?SUV89+0zOUqJLPzGH5zNwGBf/1A9uCARdGS8mxFmABOkJMBru+qdHNFhJ8zN?=
 =?us-ascii?Q?jujtNRdAhh+e17h0tDMwfg/zksOr?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 208f02c4-beb1-4df7-c013-08d94a7e5d32
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB2869.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2021 06:28:04.0547 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1sLJWNtYaZbh1y97u+H+/8GylmL0sYzbEYltjx6GQLtRshVXcWiHTTRzlBTMIQZWfTFxhJacnDANZSDF+nxY/G6xYsvczHt7MYOZSPtOnkw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4814
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10049
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 mlxscore=0 malwarescore=0
 adultscore=0 phishscore=0 suspectscore=0 mlxlogscore=999 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2107190035
X-Proofpoint-GUID: aBcJs7oT2HR7DNCR_OYBInbuZ3BBgCxE
X-Proofpoint-ORIG-GUID: aBcJs7oT2HR7DNCR_OYBInbuZ3BBgCxE
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=elena.ufimtseva@oracle.com; helo=mx0a-00069f02.pphosted.com
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
Cc: elena.ufimtseva@oracle.com, john.g.johnson@oracle.com, jag.raman@oracle.com,
 swapnil.ingle@nutanix.com, john.levon@nutanix.com, alex.williamson@redhat.com,
 stefanha@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi

We are happy to introduce the next stage of the multi-process QEMU project[1].

vfio-user is a protocol that allows a device to be emulated in a separate
process outside of QEMU. It encapsulates the messages sent from QEMU to the
kernel VFIO driver, and sends them to a remote process over a UNIX socket.

The vfio-user framework consists of 3 parts:
 1) The protocol specification.
 2) A server - the VFIO generic device in QEMU that exchanges the protocol messages with the client.
 3) A client - remote process that emulates a device.

This patchset implements parts 1 and 2.
The protocol's specification can be found here [2]:
We also include this as the first patch of the series.

The libvfio-user project (https://github.com/nutanix/libvfio-user)
can be used by a remote process to handle the protocol to implement the
third part.
We also worked on implementing a client and will be sending this patch
series shortly.

Contributors:

John G Johnson <john.g.johnson@oracle.com>
John Levon <john.levon@nutanix.com>
Thanos Makatos <thanos.makatos@nutanix.com>
Elena Ufimtseva <elena.ufimtseva@oracle.com>
Jagannathan Raman <jag.raman@oracle.com>

Please send your comments and questions!

Thank you.

References:
[1] https://wiki.qemu.org/Features/MultiProcessQEMU
[2] https://patchwork.kernel.org/project/qemu-devel/patch/20210614104608.212276-1-thanos.makatos@nutanix.com/

John G Johnson (18):
  vfio-user: add VFIO base abstract class
  vfio-user: define VFIO Proxy and communication functions
  vfio-user: Define type vfio_user_pci_dev_info
  vfio-user: connect vfio proxy to remote server
  vfio-user: negotiate protocol with remote server
  vfio-user: define vfio-user pci ops
  vfio-user: VFIO container setup & teardown
  vfio-user: get device info and get irq info
  vfio-user: device region read/write
  vfio-user: get region and DMA map/unmap operations
  vfio-user: probe remote device's BARs
  vfio-user: respond to remote DMA read/write requests
  vfio_user: setup MSI/X interrupts and PCI config operations
  vfio-user: vfio user device realize
  vfio-user: pci reset
  vfio-user: probe remote device ROM BAR
  vfio-user: migration support
  vfio-user: add migration cli options and version negotiation

Thanos Makatos (1):
  vfio-user: introduce vfio-user protocol specification

 docs/devel/index.rst          |    1 +
 docs/devel/vfio-user.rst      | 1809 +++++++++++++++++++++++++++++++++
 hw/vfio/pci.h                 |   25 +-
 hw/vfio/user.h                |  279 +++++
 include/hw/vfio/vfio-common.h |    8 +
 hw/vfio/common.c              |  273 ++++-
 hw/vfio/migration.c           |   35 +-
 hw/vfio/pci.c                 |  547 ++++++++--
 hw/vfio/user.c                |  997 ++++++++++++++++++
 MAINTAINERS                   |   10 +
 hw/vfio/meson.build           |    1 +
 11 files changed, 3879 insertions(+), 106 deletions(-)
 create mode 100644 docs/devel/vfio-user.rst
 create mode 100644 hw/vfio/user.h
 create mode 100644 hw/vfio/user.c

-- 
2.25.1


