Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 657E23C4F64
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Jul 2021 12:43:59 +0200 (CEST)
Received: from localhost ([::1]:45560 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2tPq-0002jr-Es
	for lists+qemu-devel@lfdr.de; Mon, 12 Jul 2021 06:43:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonah.palmer@oracle.com>)
 id 1m2tJ2-0001ld-Jx; Mon, 12 Jul 2021 06:36:58 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:26718)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonah.palmer@oracle.com>)
 id 1m2tIy-000085-7J; Mon, 12 Jul 2021 06:36:54 -0400
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16CAVunh029748; Mon, 12 Jul 2021 10:36:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : content-type : mime-version;
 s=corp-2020-01-29; bh=z+mkqO1Cs60q6g+THPFvl3PZ7DmLuhNC3DzlDuSviaY=;
 b=MS85m+ccEjHLOo0lyG4wKhYNH26xyc67mqQcvMhF+CNvD8quBwQ1ids9/b565yfHzRUA
 k6APWTAFWPvcuunBL6Q8S+gsL3nJwAE96wor98BnOlMbFtClb8Zg/X0ORYecele/Rq2I
 JHouoRTqjIkhORMgih0RNpYBcWRVhk7c/u+//XEeta8WMWzab0kqPK4TrYdmLxN6Gfw6
 WSFpq86F01Bm6qW56N8YW8DiD1qrfqGNj9t6I/lsnKzaVAV901n9J4hnrwC4RPmhASx2
 7hzcoZvgp4vwjEuWYLHYUil3r3VetsGpseNu2e4G5WyLGUwCvyCIb8gygzg2PcQvSt24 UQ== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 39q2b2jcnd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 12 Jul 2021 10:36:43 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 16CAacxo181318;
 Mon, 12 Jul 2021 10:36:43 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2177.outbound.protection.outlook.com [104.47.58.177])
 by aserp3020.oracle.com with ESMTP id 39q3c6wn4r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 12 Jul 2021 10:36:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cmAxDQagI1rPqENpA7xL9OiFzdlRFGjN4IcX+oBaSD/2QiyNjw8IOiLUdcCnVP5vLVOY7RnUyktBI73+mYatkdg5uftpgmORpOwUUpxnLJKXkwHfD/jgHeUXEMbUbByWZl/vVzF0XlS2hbLxrZ9Kit13ESMMej2+TIy+OLKYECJH+QzAkoEewhLPong2myqs0pnLYdapV8YZSIkCucBk8vPi7A4Gy/zzoBIzB0jgwGDmS93bp/dH672R2hWho9sTyrh/vX3G9SDhE4zEKz+N1pdF63kUWm2l/DYk+1tWSn/k8bLwOkR+tTgtoEgJxZQizUN+343tPQZ/h9Ru4UIong==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z+mkqO1Cs60q6g+THPFvl3PZ7DmLuhNC3DzlDuSviaY=;
 b=ds0mJGja00MTFpVlavgyPv7hTuKkwmuGSebM/upbLN5hF+ONuFZTU9OjugrRVqKWYPLfGUIVfX1txUYM8oLYiPP2ivBG68+s2syPi/YAoTJn+3uGXzqeg/yVd4UCnR2VNttVbf5ddH6kgtqypb0rQuoO0lmxQNXsAM5VKqTsKMjUDdE0IblLbMby2adYyYFy+G/ERhRGHRUNsH71m6yMQ1n0V5Zw8PqPLUkzTSoK+KkxKB9eh/mlH+3MOAgslWkI3IRTUFx+PMRBX1NWrux4ntCSj19nxjckwko2nyUoPrIZUY/1VnvTSt4RbiiFb/d+t0fqut/dz0k2FI5tVGnCmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z+mkqO1Cs60q6g+THPFvl3PZ7DmLuhNC3DzlDuSviaY=;
 b=eKo3duoOLjUK39tHar/DjuXXmjowvEGAqOm5p5jR5g4dmWFSwMDM8HReZQGdpWkkhZJGJ0ggZeWU3l+Awp75+GmD+vHnlTTjZzEd3KA2icoEgHcHn+K4uS+k97bWsBiMbJ9eXgHoSL2enteaHfNLUPH/nE5Z4PyOzclAJY3rDRc=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from PH0PR10MB4664.namprd10.prod.outlook.com (2603:10b6:510:41::11)
 by PH0PR10MB5516.namprd10.prod.outlook.com (2603:10b6:510:10c::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.20; Mon, 12 Jul
 2021 10:36:22 +0000
Received: from PH0PR10MB4664.namprd10.prod.outlook.com
 ([fe80::c0ec:e3aa:9d8f:61c0]) by PH0PR10MB4664.namprd10.prod.outlook.com
 ([fe80::c0ec:e3aa:9d8f:61c0%6]) with mapi id 15.20.4308.026; Mon, 12 Jul 2021
 10:36:22 +0000
From: Jonah Palmer <jonah.palmer@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 0/6] hmp,
 qmp: Add some commands to introspect virtio devices
Date: Mon, 12 Jul 2021 06:35:31 -0400
Message-Id: <1626086137-16292-1-git-send-email-jonah.palmer@oracle.com>
X-Mailer: git-send-email 1.8.3.1
Content-Type: text/plain
X-ClientProxiedBy: SN4PR0701CA0019.namprd07.prod.outlook.com
 (2603:10b6:803:28::29) To PH0PR10MB4664.namprd10.prod.outlook.com
 (2603:10b6:510:41::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from jonpalme-lnx.us.oracle.com (209.17.40.41) by
 SN4PR0701CA0019.namprd07.prod.outlook.com (2603:10b6:803:28::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.19 via Frontend
 Transport; Mon, 12 Jul 2021 10:36:20 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9740ba92-4248-49e3-948a-08d94520e493
X-MS-TrafficTypeDiagnostic: PH0PR10MB5516:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <PH0PR10MB5516ABEA93618199B03D1730E8159@PH0PR10MB5516.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3J2KdQ5cf3DDAcRZAVurFAEyPgFH6XYOBFkY5NcXvzLO5ERAwBUCcHjhxqYOn+cIjxa7fzkXQE5jR5/nskvRiiNB9YSKWPd/XE2/8iC3zVr9d5f2LaCcB+rLCwuMx+5Q993CKPQAZy0QGgq4PDe/oSe5C8Ht1iStlNz28CLg3TLQcAkQ0EIdYIxU991j+t1MEiox2xifh8baHzLC3WWaTXr7ZR/Wz4nsvDo17MaZpcfmOPnvCeW8C0SIujaLuNZ8/O0ZEopo2Umfv1vFuK3XW9cjEXrblLgrl9rCiICzoIZzD2zY3eonz4d3NisDweaJDO73boY48VNtAdKEKFGhfQSb+NqMEgiEV3NJk46D05qXJduwhvxO9uQIlLlQMSRmOzZG/kpfkrAl23yYtixf5ByNz6tm0S00jMvVYnSNIO1npuWksZIGnos+PuIGU40scpVljMaUE311hsZQuYM9jGrq5x6UOhB/TZdqXbpxXMD/PxFDg8HPQgVQravIqH4NW4poTMY9QV0Bvz2nPPF9XISGrF2TRN5L9Bm6GZh5D4HCIPaDA9ZVG2JMPqEHrq87hy7xsGxpTv+EDBx6IK7+PReAg+rIv2j3t3JbIOksqTdlg+3yXJansxID/IkTrE6BNormbEAetyu+9ZfISruaLafoRc4uJ1jcRDlSR0ckkXS89Nl10HlXL5Jpg7R7a5Itf5ayUNcdJ5+CvUF6LUrCnmjVCHUfiTHzBQ258mJpoKNDCXW7ScXaK1ToXzxWDJQiIrM9NPX2njm93t/BUT3QmGUuhmKduOGH7G/UK3s2fvy6waIISS50b+Wfr4I2CwZHHOuWERCqh6idy/KOT5RC8A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR10MB4664.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(376002)(396003)(39860400002)(136003)(366004)(346002)(2906002)(4326008)(36756003)(7416002)(8676002)(7696005)(52116002)(316002)(956004)(8936002)(2616005)(107886003)(6486002)(44832011)(86362001)(38100700002)(26005)(38350700002)(186003)(5660300002)(478600001)(66946007)(966005)(6916009)(66476007)(66556008)(83380400001)(6666004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?R4e3Dm84xbNkjM//EM/TJz8gZ8UoIBa8nkUjb/+dVWYYigxqPJ8aILzJrbD1?=
 =?us-ascii?Q?36yTtJ6gTmu5o0FetdcoD8DVaq9Kg55Z5Xp9qQdWpq1SFJ75jQi+Bv4rWxR1?=
 =?us-ascii?Q?bhy96UTIiQMf5q4pL6cntRT5oidocCc+1G9fCyGYKfUHa6kvopaMwYxa1rYs?=
 =?us-ascii?Q?C9YkSlPRPmFVhkPDVFYBpOPeTEJvkP9BqG0mohgv4O69/Kxk6KWOpSrQTXxR?=
 =?us-ascii?Q?jKR5viEycSyHUOfJkg+Pn5KymPpzUYz8u7PKCoVXAUUHmstsW9hAJmg+MA1J?=
 =?us-ascii?Q?KGvndbnhT0mShWPbfOd11srERzH6N4jXy+2jiHG//0MQnhHHHY0UClv6q0N6?=
 =?us-ascii?Q?PMLhjnwXqGmBNe2lV9TZWZeF4N5g16HA5pbHwy1XFF4Dm/RFgiUVNjQTwjFn?=
 =?us-ascii?Q?AcwApV/Tf3VHaIDZ3WstMIVAy7Hu4jLUpW1GG0/BioUfng8+QPQSQvv67hEF?=
 =?us-ascii?Q?Poy8MpdTM0ztCr6GWZ9MffaeBhjszmGhT2VXvCJwzrjBhxC2Ml7hekiMtIcz?=
 =?us-ascii?Q?TK5O8dttSvz/6Sqyc1ffwXoROwzZB53nm0lXco2LB/mmvxGejDqaQNaUssbu?=
 =?us-ascii?Q?ihzS5oxUPeGBluchVpRwYJxJ78cN9RamWm6/zhJRSt9PnKqurKtXWdLvX7+5?=
 =?us-ascii?Q?uUDQp7Y88UtmyvILDYD4dPLnj2wKsRuO+fJ+wjNu8gyWmRRRQgSn8gh9XFlt?=
 =?us-ascii?Q?PLnpquFbbVvqMwr7Q0sbe3Y1Zu+A0+sKB0GLzTcrkykjFqLWop1cDfAmWFSI?=
 =?us-ascii?Q?jqad/vcurt9wacJp4LRrjG3bSwpsCPYfUiTEiMN2W/bV2PUZucfyCFc2ipYt?=
 =?us-ascii?Q?eF9EB6WqnZHaHJvJidjyd8unb4olqCL889828MtpAU6HamBvRIqsQFWoZ3HU?=
 =?us-ascii?Q?0vrIjKnNRPSKGj+5olqcI6Iw3TYgGQkjBKac0/h4XcwjKEtrvBdtKeJ+w7zj?=
 =?us-ascii?Q?8Q2pDi7y6x/SAUbo3kpCgoa1YiscUs5c7pncJx4kzr+77YWNjAH6PjecpT7A?=
 =?us-ascii?Q?0Vh7khjIoXatKFpBYFRxAUJLDJGcbmZktYerhtXbNKiebbY7vFwRHaEwwNpg?=
 =?us-ascii?Q?U2ATyOHkM4vd7w9VTHJ++Ic6GE+Mage0DN/TBXZH6pHJey24cAwmX7NW1pbd?=
 =?us-ascii?Q?fCflUNREG+wkYBuRWsL+C1Dt3DW3Ui/VQNGi244hJbeIidt9ca5L7Bth0Ao3?=
 =?us-ascii?Q?iqVYZGAXQ6FG4BoSxs8kWLR4OO3boD5JysV2Uog8tn26kQcF1Kl/Y7rCCLfF?=
 =?us-ascii?Q?/xVsAdI1hmWQdij2rsBmftpR3GNS25Ab4m7fM7Zl6ltIZQitCYlkDIyaM6GD?=
 =?us-ascii?Q?GLEQiWoUSYVppkFGclPt9zCV?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9740ba92-4248-49e3-948a-08d94520e493
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB4664.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2021 10:36:22.7734 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3pmxXQNouHwFJEjQxqX71/+0kGjd8RhC1GbAR+pIq/uzQ2OMSl84+VS1XYgYYp8lAip7zHLPEjLyqOetbn01nw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB5516
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10042
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 malwarescore=0 mlxscore=0
 suspectscore=0 phishscore=0 adultscore=0 mlxlogscore=999 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2107120082
X-Proofpoint-GUID: YKtcq-D5STteMJT7IF24npFAMbcK6AqL
X-Proofpoint-ORIG-GUID: YKtcq-D5STteMJT7IF24npFAMbcK6AqL
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=jonah.palmer@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_BL=0.01,
 RCVD_IN_MSPIKE_L3=0.9, SPF_HELO_NONE=0.001,
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
Cc: fam@euphon.net, mst@redhat.com, jasowang@redhat.com, kraxel@redhat.com,
 si-wei.liu@oracle.com, joao.m.martins@oracle.com, qemu-block@nongnu.org,
 david@redhat.com, armbru@redhat.com, marcandre.lureau@redhat.com,
 jonah.palmer@oracle.com, thuth@redhat.com, amit@kernel.org,
 michael.roth@amd.com, dgilbert@redhat.com, eric.auger@redhat.com,
 dmitrii.stepanov@cloud.ionos.com, stefanha@redhat.com, kwolf@redhat.com,
 laurent@vivier.eu, mreitz@redhat.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This series introduces new QMP/HMP commands to dump the status of a
virtio device at different levels.

[Jonah: Rebasing previous patchset from March for Qemu 6.1
(here: https://lore.kernel.org/qemu-devel/1616084984-11263-1-git-send-email-jonah.palmer@oracle.com/)
from Laurent's original qmp/hmp virtio commands from last May
(here: https://lore.kernel.org/qemu-devel/20200507134800.10837-1-lvivier@redhat.com/)
which included updating Makefile to meson.build, adding all virtio/vhost types, and
other minor patching (e.g. qmp_x_debug_query_virtio uses QAPI_LIST_PREPEND rather
than open coding to iterate through list of virtio devices, see patch 1/6).

Also, added new features (since Qemu 6.1) to virtio-gpu, virtio-net, and
virtio-balloon. Lastly, added display for the virtio device name in a
few of the qmp/hmp commands as well as relative indicies for vrings 
(see patches 4/6, 6/6).]

1. Main command

HMP Only:

    virtio [subcommand]

    Example:

        List all sub-commands:

        (qemu) virtio
        virtio query -- List all available virtio devices
        virtio status path -- Display status of a given virtio device
        virtio queue-status path queue -- Display status of a given virtio queue
        virtio queue-element path queue [index] -- Display element of a given virtio queue

2. List available virtio deices in the machine

HMP Form:

    virtio query

    Example:

        (qemu) virtio query
        /machine/peripheral-anon/device[2]/virtio-backend [virtio-scsi]
        /machine/peripheral-anon/device[1]/virtio-backend [virtio-net]
        /machine/peripheral-anon/device[0]/virtio-backend [virtio-serial]

QMP Form:

    { 'command': 'x-debug-query-virtio', 'returns': ['VirtioInfo'] }

    Example:

        -> { "execute": "x-debug-query-virtio" }
        <- { "return": [
                {
                    "path": "/machine/peripheral-anon/device[2]/virtio-backend",
                    "type": "virtio-scsi"
                },
                {
                    "path": "/machine/peripheral-anon/device[1]/virtio-backend",
                    "type": "virtio-net"
                },
                {
                    "path": "/machine/peripheral-anon/device[0]/virtio-backend",
                    "type": "virtio-serial"
                }
            ]
        }

3. Display status of a given virtio device

HMP Form:

    virtio status <path>

    Example:

        (qemu) virtio status /machine/peripheral-anon/device[2]/virtio-backend
        /machine/peripheral-anon/device[2]/virtio-backend:
            Device Id:          8
            Guest features:     event-idx, indirect-desc, version-1, change,
                                hotplug
            Host features:      event-idx, indirect-desc, bad-feature, version-1,
                                any-layout, notify-on-empty, change, hotplug
            Backend features:
            Endianness:         little
            VirtQueues:         4

QMP Form:

    { 'command': 'x-debug-virtio-status',
      'data': { 'path': 'str' },
      'returns': 'VirtioStatus'
    }

    Example:

        -> { "execute": "x-debug-virtio-status"
             "arguments": {
                "path": "/machine/peripheral-anon/device[2]/virtio-backend"
             }
           }
        <- { "return": {
                "device-endian": "little",
                "device-id": 8,
                "backend-features": {
                    "transport": [
                    ],
                    "type": "virtio-scsi",
                    "features": [
                    ]
                },
                "num-vqs": 4,
                "guest-features": {
                    "transport": [
                        "event-idx",
                        "indirect-desc",
                        "version-1"
                    ],
                    "type": "virtio-scsi",
                    "features": [
                        "change",
                        "hotplug"
                    ]
                },
                "host-features": {
                    "transport": [
                        "event-idx",
                        "indirect-desc",
                        "bad-feature",
                        "version-1",
                        "any-layout",
                        "notify-on-empty"
                    ],
                    "type": "virtio-scsi",
                    "features": [
                        "change",
                        "hotplug"
                    ]
                }
            }
        }

4. Display status of a given virtio queue

HMP Form:

    virtio queue-status <path> <queue>

    Example:

        (qemu) virtio queue-status /machine/peripheral-anon/device[2]/virtio-backend 3
        /machine/peripheral-anon/device[2]/virtio-backend:
            device_type:            virtio-scsi
            index:                  3
            inuse:                  0
            last_avail_idx:         4174 (78 % 256)
            shadow_avail_idx:       4174 (78 % 256)
            signalled_used:         4174 (78 % 256)
            signalled_used_valid:   1
            VRing:
                num:            256
                num_default:    256
                align:          4096
                desc:           0x000000003cf9e000
                avail:          0x000000003cf9f000
                used:           0x000000003cf9f240

QMP Form:

    { 'command': 'x-debug-virtio-queue-status',
      'data': { 'path': 'str', 'queue': 'uint16' },
      'returns': 'VirtQueueStatus'
    }

    Example:

        -> { "execute": "x-debug-virtio-queue-status",
            "arguments": {
                "path": "/machine/peripheral-anon/decice[2]/virtio-backend",
                "queue": 3
            }
           }
        <- { "return": {
                "signalled-used": 4188,
                "inuse": 0,
                "vring-align": 4096,
                "vring-desc": 1023008768,
                "signalled-used-valid": 1,
                "vring-num-default": 256,
                "vring-avail": 1023012864,
                "queue-index": 3,
                "last-avail-idx": 4188,
                "vring-used": 1023013440,
                "used-idx": 4188,
                "device-type": "virtio-scsi",
                "shadow-avail-idx": 4188
                "vring-num": 256
           }
          }

5. Display element of a given virtio queue

HMP Form:

    virtio queue-element <path> <queue> [index]

    Example:

        Dump the information of the head element of the third queue of virtio-scsi:

        (qemu) virtio queue-element /machine/peripheral-anon/device[3]/virtio-backend 3
        index: 122
        ndescs: 3
        descs: addr 0x7302d000 len 4096 (write), addr 0x3c951763 len 108 (write, next),
               addr 0x3c951728 len 51 (next)

        (qemu) xp/128x 0x7302d000
        000000007302d000: 0xce 0x14 0x56 0x77 0x78 0x7f 0x00 0x00
        000000007302d008: 0x05 0x00 0x00 0x00 0x00 0x00 0x00 0x00
        000000007302d010: 0xf9 0x00 0x00 0x00 0x00 0x00 0x00 0x00
        000000007302d018: 0x4f 0xf9 0x55 0x77 0x78 0x7f 0x00 0x00
        ...

QMP Form:

    { 'command': 'x-debug-virtio-queue-element',
      'data': { 'path': 'str', 'queue': 'uint16', '*index': 'uint16' },
      'returns': 'VirtioQueueElement'
    }

    Example:

        -> { "execute": "x-debug-virtio-queue-element",
             "arguments": {
                "path": "/machine/peripheral-anon/device[2]/virtio-backend",
                "queue": 0
             }
           }
        <- { "return": {
                "index": 122,
                "ndescs": 3,
                "descs": [
                    {
                        "flags": [
                            "write"
                        ],
                        "len": 4096,
                        "addr": 1929564160
                    },
                    {
                        "flags": [
                            "write",
                            "next"
                        ],
                        "len": 108,
                        "addr": 1016403811
                    },
                    {
                        "flags": [
                            "next"
                        ],
                        "len": 51,
                        "addr": 1016403752
                    }
                ]
            }
        }

[Jonah:
Comments:

One thing worth mentioning that this patch series adds is some maintenance
burden. More specifically, the following would need to be done if a new
virtio device type (with features) were to be added:

 - In the new */virtio-<device>.c: add #include "qapi/qapi-visit-virtio.h"
   and define a qmp_virtio_feature_map_t map structure with device feature
   entries (e.g. FEATURE_ENTRY(_FEATURE_))

 - In qapi/virtio.json: define a new enumeration of Virtio<Device>Feature
   (including its enumerated features) and define a new
   VirtioDeviceFeaturesOptions<Device> and add it to VirtioDeviceFeatures

 - In hw/virtio/virtio.c: add a case to switch statements in qmp_decode_features
   and hmp_virtio_dump_features

If you're just adding a new feature for an already existing virtio device:

 - In */virtio-<device>.c: add the new FEATURE_ENTRY(_FEATURE_) in the
   device's qmp_virtio_feature_map_t structure

 - In qapi/virtio.json: add the enumeration of the new virtio device
   feature in the corresponding Virtio<Device>Feature JSON structure

In the previous patch series (v4) there was a comment regarding the
implementation of the switch case in hmp_virtio_dump_features. It would
be nice to not need to explicitly define a case for each virtio device
type (with features) here, but it's not very clear (to me) on how this
could be achieved (and optimally we'd probably want something similar for
qmp_decode_features as well).

The suggestion to this problem (from last May) was to do something like:

    if (features->type < something_MAX) {
        features_str = anarray[features->type];
        ...
        monitor_printf(mon, "%s", features_str(list->value));
        ...
    }

But, (1): the device type enumerations were changed to "flat" enums in v4
and, as I understand it, flat enums have no value associated with them so
we wouldn't be able to use it to index anarray. And (2): not every virtio
device has features (e.g. virtio-9p, virtio-input, vhost-user-fs, etc.)
so we'd still need to take that into account and filter-out those devices
as well.

I've looked at it for awhile but, at least to me, it wasn't obvious how
this could be done.

Note: for patch 5/6, checkpatch.pl gives the following error:

   ERROR: "foo * bar" should be "foo *bar"
   #329: FILE: hw/virtio/virtio.c:4164
            type##FeatureList * list = features->u.field.features;

But doing both 'type##FeatureList * list = ...' and
'type##FeatureList *list = ...' give errors, so I just left it as the former
representation. ]

v6: rebased for upstream (Qemu 6.1)
    add all virtio/vhost types in same order as 
    include/standard-headers/linux/virtio_ids.h
    use QAPI_LIST_PREPEND in qmp_x_debug_query_virtio rather than open
    coding

v5: rebased for upstream
    add device name, used index, and relative indicies to virtio queue-status
    HMP command
    add device name to virtio queue-status QMP command
    add new virtio device features

v4: re-send series as v3 didn't reach qemu-devel

v3: use qapi_free_VirtioInfoList() on the head of the list, not on the tail.
    Prefix the QMP commands with 'x-debug-'

v2: introduce VirtioType enum
    use an enum for the endianness
    change field names to stick to naming convertions (s/_/-/)
    add a patch to decode feature bits
    don't check if the queue is empty to allow display of old elements
    use enum for desc flags
    manage indirect desc
    decode device features in the HMP command

Laurent Vivier (6):
  qmp: add QMP command x-debug-query-virtio
  qmp: add QMP command x-debug-virtio-status
  qmp: decode feature bits in virtio-status
  qmp: add QMP command x-debug-virtio-queue-status
  qmp: add QMP command x-debug-virtio-queue-element
  hmp: add virtio commands

 docs/system/monitor.rst      |   2 +
 hmp-commands-virtio.hx       | 162 ++++++++++++
 hmp-commands.hx              |  10 +
 hw/block/virtio-blk.c        |  23 ++
 hw/char/virtio-serial-bus.c  |  11 +
 hw/display/virtio-gpu-base.c |  12 +
 hw/net/virtio-net.c          |  38 +++
 hw/scsi/virtio-scsi.c        |  12 +
 hw/virtio/meson.build        |   2 +
 hw/virtio/virtio-balloon.c   |  14 +
 hw/virtio/virtio-iommu.c     |  14 +
 hw/virtio/virtio-stub.c      |  34 +++
 hw/virtio/virtio.c           | 574 ++++++++++++++++++++++++++++++++++++++++
 include/hw/virtio/virtio.h   |  14 +
 include/monitor/hmp.h        |   4 +
 meson.build                  |   1 +
 monitor/misc.c               |  17 ++
 qapi/meson.build             |   1 +
 qapi/qapi-schema.json        |   1 +
 qapi/virtio.json             | 604 +++++++++++++++++++++++++++++++++++++++++++
 tests/qtest/qmp-cmd-test.c   |   1 +
 21 files changed, 1551 insertions(+)
 create mode 100644 hmp-commands-virtio.hx
 create mode 100644 hw/virtio/virtio-stub.c
 create mode 100644 qapi/virtio.json

-- 
1.8.3.1


