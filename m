Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ABD6A532DD1
	for <lists+qemu-devel@lfdr.de>; Tue, 24 May 2022 17:47:13 +0200 (CEST)
Received: from localhost ([::1]:50630 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntWka-0001th-LW
	for lists+qemu-devel@lfdr.de; Tue, 24 May 2022 11:47:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1ntWV8-00084Q-Ag
 for qemu-devel@nongnu.org; Tue, 24 May 2022 11:31:14 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:22228)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1ntWV5-0003Q6-Pa
 for qemu-devel@nongnu.org; Tue, 24 May 2022 11:31:14 -0400
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24OFQFWo001866;
 Tue, 24 May 2022 15:30:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2021-07-09; bh=XjbUDJSsQG+4X535tz3BzbjtqJBfYtJlCnSMhr4Uu2Y=;
 b=LxuqLcp71TbHKo85zW6nZWIdTgGTJRae4St5gzYhlieeTR9neTanzZ4mJunlsCCRsLa/
 OrdE4B6PQwkTEqYfg/jZ8TXBSpFj08sWjfdBAiXX3JwxGtqHRGBEjkBaaPQ7ZnLj3ZXw
 VCi0SCKuntHoJ2ApT5pl89t4NpjqR1vhaRAgO65jw2PwF63bLpsO5pgkeMahM6aZeoqP
 G/rPbsM5xfFgzzG04lJeNw3iI2EZXDErwBsUyF8IA/v9PG5SKRcVxHZSJEAXRK1gqPGe
 G/M4YM/hAWtCZWI7F5zqDJ5mR9lnKWwxNtvbZwGiX3CX8vErELIS5Lmv3LApM9zBG7ys rQ== 
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3g6qya6kkv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 24 May 2022 15:30:58 +0000
Received: from pps.filterd
 (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 24OFSPgP017641; Tue, 24 May 2022 15:30:56 GMT
Received: from nam04-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam08lp2049.outbound.protection.outlook.com [104.47.74.49])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id
 3g6ph2k4x7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 24 May 2022 15:30:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V2qVu/anCTMaPagmjaMG2oByBftIM7MABEtXNHqMVOSNNzf3dxW8XoQr7YcOwEUBSc045ocwvV50u9pnNtRiWzJuFkg4l8Lu0s8MxG2DiZVcLrLTEczViy/RjzutBjwmH9smQDhXf8f7tUyJ0Ws2y/0JIiWmRgzrmWbgbYehjZRiLuiPixziNlbBKYXiya12eaRTx/WL2dh32XyZiR47rzu1sPrrj57HdRqLLAtH6QC52bdDT6mMhcSFw+GrsXY88/bt2+TQbBCwYtchGQQ8TVap0M1lPiIFqKTfarQksJp0rhrsABcmYElVefPUeIHmRtBaxepQEZuEKkqJ5ODU0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XjbUDJSsQG+4X535tz3BzbjtqJBfYtJlCnSMhr4Uu2Y=;
 b=kaZ2oa2w9hv/7Q67FkJ4lMqsYQKoxHa9NOUdUyZTHwerzLOUhMxF2T5pBL3oLSEGKQL3WEn3w73nfCuZ0d8TSu0cUnLQSRT4z13Pv+2J8EkgGSzcNMhIktAnG4sqZNaD41dzHl9L9W1ZpLM8HokvMIM5Q0zmJvYoYV3mYRu2yFt1jPd4TUSxNyiTsKNEujDzQtM3lIC9fBJHlL5vM6JnvueVCOCyaG1Bp3KHULGvkIK/SnNPgfvlj+yV3OSHJ0TnWkdOr9pqWuep1GER+E+l0COYOebIu7f2fUJTbBqcjxjrS2diaYI9N7EkS5VOMFOGBptCp9PW9w3HvG98ZMaDGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XjbUDJSsQG+4X535tz3BzbjtqJBfYtJlCnSMhr4Uu2Y=;
 b=wnIMWh1Yar22GbcZ1+yJMY4kF97PMYgmvlNKVveA4MJfvquiY8he+saWH0XpZnpRR3BKqDUAKpa/lvLCi/HjUJ55OhxhVefbyQTdf7SQwJMmP86BS4igGqwH85yGHfxIln1fqMcYwgTMnBws4pAPH1RHJsw+Kcf9mZKf3fJl1Tg=
Received: from MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 by MN2PR10MB3117.namprd10.prod.outlook.com (2603:10b6:208:12f::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.14; Tue, 24 May
 2022 15:30:52 +0000
Received: from MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::e9cb:e1ca:8189:f191]) by MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::e9cb:e1ca:8189:f191%7]) with mapi id 15.20.5273.023; Tue, 24 May 2022
 15:30:52 +0000
From: Jagannathan Raman <jag.raman@oracle.com>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com, mst@redhat.com, f4bug@amsat.org, pbonzini@redhat.com, 
 marcandre.lureau@redhat.com, thuth@redhat.com, bleal@redhat.com,
 berrange@redhat.com, peter.maydell@linaro.org, eduardo@habkost.net,
 marcel.apfelbaum@gmail.com, eblake@redhat.com, armbru@redhat.com,
 quintela@redhat.com, dgilbert@redhat.com, imammedo@redhat.com,
 peterx@redhat.com, john.levon@nutanix.com, thanos.makatos@nutanix.com,
 elena.ufimtseva@oracle.com, john.g.johnson@oracle.com,
 kanth.ghatraju@oracle.com, jag.raman@oracle.com
Subject: [PATCH v10 04/14] vfio-user: build library
Date: Tue, 24 May 2022 11:30:23 -0400
Message-Id: <f131bc091fc6abcdc9faf1ab22a86a7413300d6a.1653404595.git.jag.raman@oracle.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1653404595.git.jag.raman@oracle.com>
References: <cover.1653404595.git.jag.raman@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SA9P221CA0012.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:806:25::17) To MN2PR10MB4013.namprd10.prod.outlook.com
 (2603:10b6:208:185::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3e9847f5-fb96-4b20-db08-08da3d9a6303
X-MS-TrafficTypeDiagnostic: MN2PR10MB3117:EE_
X-Microsoft-Antispam-PRVS: <MN2PR10MB3117C59C180CFDB197CC0C6590D79@MN2PR10MB3117.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3y8NTR+TRsXntuQvZUWl681SXcVrMbAlKVntuVfFB8JrX/5AwHY0MbNGFP0onyiw7piE1MV38tGfXKPTtfet5Zd/N9n9YqthCs74TAKfuAmxuMRNib5pozeHT+G194sfc4pp0kEyMe3aTcwV0gHKLiRedD4QQ2dOjgPM3l5HgsTs4wQe7IHDoGFCVPYmnP8f85p11qMgoOEkba3FZ4tqd1k/L71mNGkwOsn3DbCpEfINK6mqJPDT/9Q0rUqgWZmKUmCestQlfNOt1YTAmn2koJZ/3r79nTiF47vRgrQMr18H+WDT3lPPIgepu4hbvdIVvZIvIWKmXx7KWMORsY9v9evD83ZWYQYkKs+khOLaVmPsd8raXVBSoglYhs/cF5olvHiF6Cv1QCjNimj7xm4RfCNto++btz0CwaXl6MQBe84LgA3dcM/h28t2d2C3Bwtbe49iZkVe+ekpcdvUHLO9s0s9cy1cLqx1Y7GANzXMoGXDrD03XpH4+BBCntPuUD0SFFEtMzYdnpy98Vi3gAFxLVx/g+5lEQBIcggRpQyMOoYCWL5sS3Bv5yboX/Jhy8UM8y5irBJLd7J7dCBPdzFvD/ogjm15tMG+pZPGLhz5YwQDyNvXHvlmYJehx1AdEkay+3DfxzOWtCUiWwjlqqdvCPVFQVLW3OuRilRsCL8JQMP59+qGX4uqkhbPIbTTGGXhidB/r3QelIU+m5HFzDSFlooGvwYF39ihCqGTLVORPURFCGUeIkIQ1PNXTWXWznWizchcHR1xuayBXp4sg0MYlXzw/GMmseAcLX6nJGMiRmJXAyXdZz1LeeoGAXu1zzdbeBinH0InKocFG8zX+xMIGA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4013.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(2906002)(66556008)(38350700002)(5660300002)(38100700002)(7416002)(966005)(86362001)(508600001)(36756003)(4326008)(66946007)(2616005)(6486002)(186003)(6666004)(66476007)(83380400001)(107886003)(8676002)(6506007)(26005)(52116002)(316002)(6916009)(8936002)(6512007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?PT6D1FdKUh+ZpGrWm2Zjeg4GWzMB2QH24b5qEXJJdJRoJh0o/EwM/wur53NT?=
 =?us-ascii?Q?QVS3+beU19iLzblwHx4eiZd/5Ci9LXEtzRxpiuSfqIjsh/0kdX515Fs9NKDs?=
 =?us-ascii?Q?Pk9p36TraytgduzLDmz/CtdtgB5Lg2qd3D50vnz+R2SxLzs0dBvuM0hGi0eZ?=
 =?us-ascii?Q?Rt2Q+wM3D+rSrng0Jm1iZhRIZQDxdFzdhFgrlwduXw4L7LlLmhvBUDwJrVN8?=
 =?us-ascii?Q?Cnd0LTsoCQo21ORhi1RDkewktfZhnFU8Jyyz0m03phEsEuI1E4kZNxUzcwQi?=
 =?us-ascii?Q?5Wg8tBigeVB+8a1xOp5Guo7yERY0flVlodoqAzzT15eTjMxkj+8dVBmJ6h4R?=
 =?us-ascii?Q?Frv7czPptjeH4O7wZNVXIbfNr85kRf/8m6MwTvCPCOxHWwg+xlD/1NxUBAXv?=
 =?us-ascii?Q?LvGdOTF5AnI/gvtTJKiOsoSdSup2SpMK1FkBXLE5J8hBn9L7mPzblq83qzNO?=
 =?us-ascii?Q?FOBICq1ADL6gB0khNaHyCuFnNBnMfHljctc1pcIM1DtR8UJXIocjo4+3zLZS?=
 =?us-ascii?Q?tw1Ehuls4zUUydqf+tstyEEUaB+vJarkfPwfQx+OV/RrwERR3l6mqoPNSY6u?=
 =?us-ascii?Q?rCu6VFKQ2b3NK9kHpJ3xtFOmW+OcyeYUiLYhNDpsypPRkjL6OTw/HRK5b95N?=
 =?us-ascii?Q?Xt9/pTZttqc/xeB/6Saew42JW/yJuNc0YwaGvM5YslFtjwnAg3bOeHJx92Zp?=
 =?us-ascii?Q?MwLV3NXDw7CJoejzxvkLoTfMM8rjwKxa3l29BLudWFrm8SpCA9GU2B/Q9tFb?=
 =?us-ascii?Q?UFUPA+5mfFCU+ccg9O9EBD3iFem+FvpKEtnX4NyZL+PCPCaEjjh1gmSZ3QVI?=
 =?us-ascii?Q?kWOD7TTp2cPKibRjtgWLLFtF+iraZSFv2J/OrrAYSJnZztwkVNgP43+SIUXK?=
 =?us-ascii?Q?3qdh51kfntYC81YJwOU6zmjT+UxZPz2cY/iG6AyS1qrn5nP5U0vJepqG+nNh?=
 =?us-ascii?Q?OkWqGCQX2DEH3R67oMupEuKLqgpFeWSDP3LUGrt+RQqumJFYK8c2SgtGozrb?=
 =?us-ascii?Q?X7/WjYiVXXmNkBjX2TpcYPLWytoa5aeA0lLU/++0bkZ55p2H5UCXXlM8m7oN?=
 =?us-ascii?Q?Fd7QxKeQYwYaGk3vlnA9xt9VevZwy+deybzP2RRsmqYnv8IqcVTd37+TW10e?=
 =?us-ascii?Q?nCe38tGPXhkXFc+ZVBAInw1zropGVWysIklGy6ukpVBdJPtuySBdfz0xlfeL?=
 =?us-ascii?Q?3lGKNP639IJjO4G9J7WJzZdzrQGqjT0VPTbJIhp/ieXh67R43UNb44t1Nku7?=
 =?us-ascii?Q?Y3JiYma+A/esdZZiXz1yEbKNJFdVtx0n/+T61rLBKCvrH7ZwwSykYrPf6jcS?=
 =?us-ascii?Q?udIEV4W0erGLpQMtwQ+jyyqXX8KyboQzpkekKC6Zy8NeWTuE0KFQCm9YOBtx?=
 =?us-ascii?Q?VlJIzQqLRMOZRfTsQ8KTAg9uaPPqOfXpbLm3Ul+iIVloIaj2Vpr7B0FIAOEV?=
 =?us-ascii?Q?FrnMa1Do7blvXkD8jXvMUoJhM5udycZB48AbziDVBaKzfnh++9JoFUoXORgk?=
 =?us-ascii?Q?u9dnivO9AoHEEghalVtW8mlHZ902eLSiGnFJ3HR3E5GtusYGi2AiQ++aRm1k?=
 =?us-ascii?Q?iVE00Irtg7fIDwEKHyukpqBfPLl14PEqkA3xxpzMZrAGm3e5ccumdE4f9Ywd?=
 =?us-ascii?Q?n/kgs1pdRwjOGj0tBYSj7s/VbAov7Lv7xKjoPLmEClortGPniGQBNkW0NYeo?=
 =?us-ascii?Q?L4jgarv3WflZEMFxziAlj472UwFsSojV/it3zZYjprLydHoe9AGM7LJED9hy?=
 =?us-ascii?Q?ZddUIw6OkA=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e9847f5-fb96-4b20-db08-08da3d9a6303
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4013.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2022 15:30:52.6332 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dEZjlaqpVuoLfTssjGP36tir/D0XbqbBfVg6yJPiHNsA9JDKeojoScDpHcJg3fkNdWKvUGUuTKL+U2dhxjsqBA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB3117
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.486, 18.0.874
 definitions=2022-05-24_05:2022-05-23,
 2022-05-24 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 adultscore=0 phishscore=0
 spamscore=0 malwarescore=0 mlxlogscore=999 suspectscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2205240079
X-Proofpoint-GUID: 8QRa2tkcQfwo51-Ja1bp-8LieMipg2FA
X-Proofpoint-ORIG-GUID: 8QRa2tkcQfwo51-Ja1bp-8LieMipg2FA
Received-SPF: pass client-ip=205.220.165.32; envelope-from=jag.raman@oracle.com;
 helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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

add the libvfio-user library as a submodule. build it as a meson
subproject.

libvfio-user is distributed with BSD 3-Clause license and
json-c with MIT (Expat) license

Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
---
 configure                               | 17 +++++++++++++++++
 meson.build                             | 23 ++++++++++++++++++++++-
 .gitlab-ci.d/buildtest.yml              |  1 +
 .gitmodules                             |  3 +++
 Kconfig.host                            |  4 ++++
 MAINTAINERS                             |  1 +
 hw/remote/Kconfig                       |  4 ++++
 hw/remote/meson.build                   |  2 ++
 meson_options.txt                       |  2 ++
 subprojects/libvfio-user                |  1 +
 tests/docker/dockerfiles/centos8.docker |  2 ++
 11 files changed, 59 insertions(+), 1 deletion(-)
 create mode 160000 subprojects/libvfio-user

diff --git a/configure b/configure
index 180ee688dc..d6a36ba8e6 100755
--- a/configure
+++ b/configure
@@ -301,6 +301,7 @@ meson_args=""
 ninja=""
 bindir="bin"
 skip_meson=no
+vfio_user_server="disabled"
 
 # The following Meson options are handled manually (still they
 # are included in the automatically generated help message)
@@ -891,6 +892,10 @@ for opt do
   ;;
   --disable-blobs) meson_option_parse --disable-install-blobs ""
   ;;
+  --enable-vfio-user-server) vfio_user_server="enabled"
+  ;;
+  --disable-vfio-user-server) vfio_user_server="disabled"
+  ;;
   --enable-tcmalloc) meson_option_parse --enable-malloc=tcmalloc tcmalloc
   ;;
   --enable-jemalloc) meson_option_parse --enable-malloc=jemalloc jemalloc
@@ -1796,6 +1801,17 @@ case "$slirp" in
     ;;
 esac
 
+##########################################
+# check for vfio_user_server
+
+case "$vfio_user_server" in
+  enabled )
+    if test "$git_submodules_action" != "ignore"; then
+      git_submodules="${git_submodules} subprojects/libvfio-user"
+    fi
+    ;;
+esac
+
 ##########################################
 # End of CC checks
 # After here, no more $cc or $ld runs
@@ -2207,6 +2223,7 @@ if test "$skip_meson" = no; then
   test "$slirp" != auto && meson_option_add "-Dslirp=$slirp"
   test "$smbd" != '' && meson_option_add "-Dsmbd=$smbd"
   test "$tcg" != enabled && meson_option_add "-Dtcg=$tcg"
+  test "$vfio_user_server" != auto && meson_option_add "-Dvfio_user_server=$vfio_user_server"
   run_meson() {
     NINJA=$ninja $meson setup --prefix "$prefix" "$@" $cross_arg "$PWD" "$source_path"
   }
diff --git a/meson.build b/meson.build
index 9ebc00f032..6e66bb5a8c 100644
--- a/meson.build
+++ b/meson.build
@@ -308,6 +308,10 @@ multiprocess_allowed = get_option('multiprocess') \
   .require(targetos == 'linux', error_message: 'Multiprocess QEMU is supported only on Linux') \
   .allowed()
 
+vfio_user_server_allowed = get_option('vfio_user_server') \
+  .require(targetos == 'linux', error_message: 'vfio-user server is supported only on Linux') \
+  .allowed()
+
 have_tpm = get_option('tpm') \
   .require(targetos != 'windows', error_message: 'TPM emulation only available on POSIX systems') \
   .allowed()
@@ -2358,7 +2362,8 @@ host_kconfig = \
   (have_virtfs ? ['CONFIG_VIRTFS=y'] : []) + \
   ('CONFIG_LINUX' in config_host ? ['CONFIG_LINUX=y'] : []) + \
   (have_pvrdma ? ['CONFIG_PVRDMA=y'] : []) + \
-  (multiprocess_allowed ? ['CONFIG_MULTIPROCESS_ALLOWED=y'] : [])
+  (multiprocess_allowed ? ['CONFIG_MULTIPROCESS_ALLOWED=y'] : []) + \
+  (vfio_user_server_allowed ? ['CONFIG_VFIO_USER_SERVER_ALLOWED=y'] : [])
 
 ignored = [ 'TARGET_XML_FILES', 'TARGET_ABI_DIR', 'TARGET_ARCH' ]
 
@@ -2650,6 +2655,21 @@ if have_system
   endif
 endif
 
+libvfio_user_dep = not_found
+if have_system and vfio_user_server_allowed
+  have_internal = fs.exists(meson.current_source_dir() / 'subprojects/libvfio-user/meson.build')
+
+  if not have_internal
+    error('libvfio-user source not found - please pull git submodule')
+  endif
+
+  libvfio_user_proj = subproject('libvfio-user')
+
+  libvfio_user_lib = libvfio_user_proj.get_variable('libvfio_user_dep')
+
+  libvfio_user_dep = declare_dependency(dependencies: [libvfio_user_lib])
+endif
+
 fdt = not_found
 if have_system
   fdt_opt = get_option('fdt')
@@ -3760,6 +3780,7 @@ summary_info += {'target list':       ' '.join(target_dirs)}
 if have_system
   summary_info += {'default devices':   get_option('default_devices')}
   summary_info += {'out of process emulation': multiprocess_allowed}
+  summary_info += {'vfio-user server': vfio_user_server_allowed}
 endif
 summary(summary_info, bool_yn: true, section: 'Targets and accelerators')
 
diff --git a/.gitlab-ci.d/buildtest.yml b/.gitlab-ci.d/buildtest.yml
index e9620c3074..2263a412e8 100644
--- a/.gitlab-ci.d/buildtest.yml
+++ b/.gitlab-ci.d/buildtest.yml
@@ -166,6 +166,7 @@ build-system-centos:
     IMAGE: centos8
     CONFIGURE_ARGS: --disable-nettle --enable-gcrypt --enable-fdt=system
       --enable-modules --enable-trace-backends=dtrace --enable-docs
+      --enable-vfio-user-server
     TARGETS: ppc64-softmmu or1k-softmmu s390x-softmmu
       x86_64-softmmu rx-softmmu sh4-softmmu nios2-softmmu
     MAKE_CHECK_ARGS: check-build
diff --git a/.gitmodules b/.gitmodules
index b8bff47df8..c4e66ddb6f 100644
--- a/.gitmodules
+++ b/.gitmodules
@@ -64,3 +64,6 @@
 [submodule "tests/lcitool/libvirt-ci"]
 	path = tests/lcitool/libvirt-ci
 	url = https://gitlab.com/libvirt/libvirt-ci.git
+[submodule "subprojects/libvfio-user"]
+	path = subprojects/libvfio-user
+	url = https://github.com/nutanix/libvfio-user.git
diff --git a/Kconfig.host b/Kconfig.host
index 1165c4eacd..d763d89269 100644
--- a/Kconfig.host
+++ b/Kconfig.host
@@ -42,3 +42,7 @@ config MULTIPROCESS_ALLOWED
 config FUZZ
     bool
     select SPARSE_MEM
+
+config VFIO_USER_SERVER_ALLOWED
+    bool
+    imply VFIO_USER_SERVER
diff --git a/MAINTAINERS b/MAINTAINERS
index dff0200f70..c92d87daac 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3602,6 +3602,7 @@ F: hw/remote/proxy-memory-listener.c
 F: include/hw/remote/proxy-memory-listener.h
 F: hw/remote/iohub.c
 F: include/hw/remote/iohub.h
+F: subprojects/libvfio-user
 
 EBPF:
 M: Jason Wang <jasowang@redhat.com>
diff --git a/hw/remote/Kconfig b/hw/remote/Kconfig
index 08c16e235f..2d6b4f4cf4 100644
--- a/hw/remote/Kconfig
+++ b/hw/remote/Kconfig
@@ -2,3 +2,7 @@ config MULTIPROCESS
     bool
     depends on PCI && PCI_EXPRESS && KVM
     select REMOTE_PCIHOST
+
+config VFIO_USER_SERVER
+    bool
+    depends on MULTIPROCESS
diff --git a/hw/remote/meson.build b/hw/remote/meson.build
index e6a5574242..7da83350c8 100644
--- a/hw/remote/meson.build
+++ b/hw/remote/meson.build
@@ -7,6 +7,8 @@ remote_ss.add(when: 'CONFIG_MULTIPROCESS', if_true: files('remote-obj.c'))
 remote_ss.add(when: 'CONFIG_MULTIPROCESS', if_true: files('proxy.c'))
 remote_ss.add(when: 'CONFIG_MULTIPROCESS', if_true: files('iohub.c'))
 
+remote_ss.add(when: 'CONFIG_VFIO_USER_SERVER', if_true: libvfio_user_dep)
+
 specific_ss.add(when: 'CONFIG_MULTIPROCESS', if_true: files('memory.c'))
 specific_ss.add(when: 'CONFIG_MULTIPROCESS', if_true: files('proxy-memory-listener.c'))
 
diff --git a/meson_options.txt b/meson_options.txt
index 2de94af037..2bf2d20b42 100644
--- a/meson_options.txt
+++ b/meson_options.txt
@@ -88,6 +88,8 @@ option('cfi_debug', type: 'boolean', value: 'false',
        description: 'Verbose errors in case of CFI violation')
 option('multiprocess', type: 'feature', value: 'auto',
        description: 'Out of process device emulation support')
+option('vfio_user_server', type: 'feature', value: 'disabled',
+       description: 'vfio-user server support')
 option('dbus_display', type: 'feature', value: 'auto',
        description: '-display dbus support')
 option('tpm', type : 'feature', value : 'auto',
diff --git a/subprojects/libvfio-user b/subprojects/libvfio-user
new file mode 160000
index 0000000000..b52bff72d4
--- /dev/null
+++ b/subprojects/libvfio-user
@@ -0,0 +1 @@
+Subproject commit b52bff72d4eb646a453d19e19ddbd13ed6111a09
diff --git a/tests/docker/dockerfiles/centos8.docker b/tests/docker/dockerfiles/centos8.docker
index 4b20925bbf..10618bfa83 100644
--- a/tests/docker/dockerfiles/centos8.docker
+++ b/tests/docker/dockerfiles/centos8.docker
@@ -51,6 +51,7 @@ RUN dnf update -y && \
         libbpf-devel \
         libcacard-devel \
         libcap-ng-devel \
+        libcmocka-devel \
         libcurl-devel \
         libdrm-devel \
         libepoxy-devel \
@@ -59,6 +60,7 @@ RUN dnf update -y && \
         libgcrypt-devel \
         libiscsi-devel \
         libjpeg-devel \
+        json-c-devel \
         libnfs-devel \
         libpmem-devel \
         libpng-devel \
-- 
2.20.1


