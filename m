Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FC24507C59
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 00:02:19 +0200 (CEST)
Received: from localhost ([::1]:55020 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ngvvN-0001Zi-TS
	for lists+qemu-devel@lfdr.de; Tue, 19 Apr 2022 18:02:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1ngvtZ-0000cM-16
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 18:00:26 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:19684)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1ngvtT-0005lR-OT
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 18:00:22 -0400
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 23JI6Whd013493; 
 Tue, 19 Apr 2022 20:44:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2021-07-09; bh=2TfzwsdKkoSLpAZcAHPlG4MbvqRV9ya/urKqgtpFuuw=;
 b=N2P3okh7T+llAXN/09I5qkHJ2qk6EZID7omHPMB7mxjoh1E1XOH8sIotHeMO8XAQWJ/z
 tYWcQcV7EfuloBmL6/9xqWdd6yJNRNwI9pt+AEYDPI0kkHTKTmZVPWwxqYvZ3QITXUpA
 6LutglndAgOnJeB+RJ2Ati2UGEULJX2C7dxf+oVs4unVpLfQiUbsF45r7kHpDC2viWTj
 ONvVT36CHRfluKKcecQgfMBEJvKjKu1n0+yv9AqAFOAsSHo2tH08nJePHzt5lcZyppFZ
 5/Uhj8TJOTsyRmWUi4rBCSM/CwnK5IlYYTT9J9Ce5J7TC0+zeZdx6WnjGCOg0SmlBjeL Gw== 
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
 by mx0b-00069f02.pphosted.com with ESMTP id 3ffndtf7ks-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 19 Apr 2022 20:44:42 +0000
Received: from pps.filterd
 (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 23JKajjL020028; Tue, 19 Apr 2022 20:44:41 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2109.outbound.protection.outlook.com [104.47.55.109])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id
 3ffm892msm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 19 Apr 2022 20:44:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aSLr1S0GRj76SNIZw4/4p6fb2h6r65o+/YbZOE1mh3tgGMm2G5al9gZKCxFTG30dt3I9zzstBVDgFX3V4UwONx1LQFr5OVnvg8gjnXEChZAS+6eOUNwtI/yle7fui+LPSR/gR3PJTdCMJs9Duk7kYM581VUywRgVkqcsvb9cnZt6Hsq/DF3YKONRfOBIsB+HC3bHQ2SAyXSawpnZSCclGj8j8LbK3woJGpmL21Db419RQn5EXeN1ReqhCOPzGBAreKjKJH2mZW5aQlQZpwURGU41/gwgXY6ZTEo8sViuGMQMTP6w0nbzsAu8OP+n+FIgg/2DeZyeFbO11Re8VypnNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2TfzwsdKkoSLpAZcAHPlG4MbvqRV9ya/urKqgtpFuuw=;
 b=Fn+viCAn3GuzN8J3UE793cbsDdd3imsJNQzBZAjKmHand3cNqTC874xjltbUeSSUD32geuFlE2xJXiZd4bT3dbH4PKstkEDDMzCCXLH084XIIoVuK57x/E51VejEBIQtpuxDjrUZEdYZ46aelSjB44IQn9NrnDpltJk9A2tpFh3mA2WMn7wZrHxnGAbaiBwFDhBPjnKwd96ZYXmsapemmKJhqm18le5lwuzkHHqJseCSXGltzJGc3uhkGE+536cQ1zeNA0fkQjxusZUzpXwHH+sSfxHKaUPJPFbhR/JeYWy4vqzwpV3OomeWlygFihH2DeoLHFUbFSEVlmMsjVylCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2TfzwsdKkoSLpAZcAHPlG4MbvqRV9ya/urKqgtpFuuw=;
 b=lVRKNVfH3ZtkLPQYqH6V3drEVGZEtfA19ZqoQeUaPykcfb15dNFFqt7M1qMVnJ3G//YfNEc1+a76Ww00Jet/q13cYB/FAztOc+2gCIW0n3yAOJGU0FiRWT+P7nUp489JceOCa22AVFULsQ536KIRsbMZFxF5tjoPRUNrboJ87FI=
Received: from MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 by MWHPR10MB1998.namprd10.prod.outlook.com (2603:10b6:300:10c::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20; Tue, 19 Apr
 2022 20:44:39 +0000
Received: from MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::e104:96ca:aa5c:2bac]) by MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::e104:96ca:aa5c:2bac%4]) with mapi id 15.20.5164.025; Tue, 19 Apr 2022
 20:44:39 +0000
From: Jagannathan Raman <jag.raman@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 02/17] qdev: unplug blocker for devices
Date: Tue, 19 Apr 2022 16:44:07 -0400
Message-Id: <26c36cc56c0dd0021aebc9c2b7f9e6dfa1abb67e.1650379269.git.jag.raman@oracle.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1650379269.git.jag.raman@oracle.com>
References: <cover.1650379269.git.jag.raman@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR04CA0029.namprd04.prod.outlook.com
 (2603:10b6:a03:40::42) To MN2PR10MB4013.namprd10.prod.outlook.com
 (2603:10b6:208:185::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a4dcc1c4-dc56-40a6-a4f1-08da22456c17
X-MS-TrafficTypeDiagnostic: MWHPR10MB1998:EE_
X-Microsoft-Antispam-PRVS: <MWHPR10MB1998389386CA7BECD3F8EDB890F29@MWHPR10MB1998.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nnhjHwCcp+ym3GZNyPGC7sM5jh4cTyF1hSRLnfglGxRJ+wNY4CQ/Quu89l4O61IjYC0/t3pKHz5fbGguGp8RMACFuykvXcDL367HNKcRbqJ0Zz6yN3B3RDIcc0/Ed4faDMxPWdPLFx9Srk//HPnECecsQIvaW2M1AVX9H6Uj9ykiVaPQJCAfpctF1G2u7tCTGRisAldHGCbpjhv8aVFY/M8Ou3DCe6O15aCQeJGd1SZ9FZUXBbbL5OfWmCVKpId52Nn73ShB215qvdqcb+O4cELXJu4St+xJctAVS63j4ZDLFaTW4Yr6dzYIVxLD7yIKVopqf40sJsoFVhR6b6GiWwyGFjPiJpX5dxfuRaOi3sMV7Eowo+THS5vZMRkFB41DoISLda/HmZowBLfbqyc7RoCbLzs+l4NHBAHDKNXE76l4YjvlZcKTcnbN8sNDObmRlHHHcR4A4SvcMEkUqj4ear8dmftg317LLTmYUMdLO91q4SsD9v1CQ0ovoGFQSooqq7gypfiPqHqYVEHUT1E1F0tUOUiLnjB+bUnVdlIZCLV1ZFTRqy+msA2bvVdw3S1idJiNMJHQiOM40JKLGGEKNbPmStoX6uXhg/7Nf93EJmwKMr5wPOvETvdfTKT/215p3ve6ZVWIhdqeRA9utEvoy1DbLDHTQRZzkZ64Ds9QBHzpqs5uNRfdIiml8UhLUsNogkJZoqZ7v2bVpktmtTjnDg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4013.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(83380400001)(6486002)(4326008)(66946007)(66556008)(38100700002)(66476007)(8936002)(7416002)(5660300002)(8676002)(38350700002)(2906002)(52116002)(107886003)(508600001)(2616005)(186003)(36756003)(26005)(316002)(6916009)(6506007)(6512007)(6666004)(86362001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?kTPelfn5C/zXvvOC5kmRxcAlcozGk5kTQQw9v/gPkyEt9Sd0loX40rvZifif?=
 =?us-ascii?Q?Kbk3HFskNJb4jJUyDvYX/DjYPQA82AJBRjJQDc4yT3ok+W8ph8j5dvBA/VvO?=
 =?us-ascii?Q?F5Xy+1+xVHRyNyUZIe86IhWEMDpid4ZhQc8cNfiJhA2QUpacn0MKO+C7qLbJ?=
 =?us-ascii?Q?6hDtotyZxFaFU6DgRAW/jO0mRLxi+oJMlPjXR8IVpa/4AyWtWUo+J7eJgsiA?=
 =?us-ascii?Q?D+Qyhf7HzgdDNCsmXdGEkBgBnNVOMMvLDfKHoJBLoAeX0CUieG9M4vrXpTBt?=
 =?us-ascii?Q?KNU6yF6z8IfAEq9NWkbG1FGXbMaCNrNtdKGOh5Nt1kwBb42/dwKp6nbSCd/r?=
 =?us-ascii?Q?F9j+deLKIZBbrPeSUBHt5XiQviqZ94oV8ZlJUZbRAD6jIGSxpfMWktgEF8rg?=
 =?us-ascii?Q?PnBkZSjqoNrNZI1TX2wfMZeKvUAfKEvgFgB8cwY99TnOuZYLIr/Cts4UbFQm?=
 =?us-ascii?Q?pwnDmOuTgZqQAkcJFI3AmheDNMgrd6WACxH+CStpfjFoUAzfkcYIRRnttGRD?=
 =?us-ascii?Q?dx7OPrdoLkWiDvp4oyc5UzB8rx080qnZ1kUut+1O/PsTVwqhdIRGYmriX3eX?=
 =?us-ascii?Q?8N1idICBoSFTZ3O/dZoNgKMOiVnhDv5o7MCRCATDOpk8MxyFfwf+6qsWqTqx?=
 =?us-ascii?Q?ZzovR0K3kJBRoGP6m/b6p7oc7jCg2yf06bjw7yWiYTkUiJZ1tZxYCyFuQ7wL?=
 =?us-ascii?Q?+K2nYbjleARjARJeP3yZWP0fhSThHo8AfkMoUFB5bYJzBJW5W9VmtoCj23rv?=
 =?us-ascii?Q?jZkAYtHSQMfY82Dpl1Usf5RUdMaraZr8FXo35FXWKrQ7PUm/qCfpLpqgdn6A?=
 =?us-ascii?Q?/zgvqgwDG3VUlxwhmM3HRZNV4/IHJthpz8PxlSUBIq3yo72y8Vl9Vn8+TGUD?=
 =?us-ascii?Q?aA7n1PkLB+2IY2X7GGbIakKzSUWlTNCbfx1mp7shwMgSYLCscITtVpDFLuqY?=
 =?us-ascii?Q?oVJfKQj1q+EK/jWhpaGSQo4r/7sqtJsWSyRxZPDuPJtAjsHATdTKZxJZg1iu?=
 =?us-ascii?Q?Qso6ALdXTJFJIWqISpvq8L/bPU7ad5dz9GIOGSiKbZdGWi2VIhi771HM/QZW?=
 =?us-ascii?Q?5u9Ufes1M+aWY3J1wrZlPAluSjzc1CqyvWGbuC2ZojTgiMMd+4vCcqJPrINj?=
 =?us-ascii?Q?jy5HyMCHrYD76gZnAyCcbnEE1HUFS05uMlxlC2vFzSkRVlNTXG3KjUZOcYR5?=
 =?us-ascii?Q?tRzsBPtaIJzrpspE1nwqblZukDFIxdf3c8/2EvlCP9L/Hp6AsMGbYlG3L4wJ?=
 =?us-ascii?Q?ZtaMdLqPScw603uP7S1gqMWkkbiFGDU5HqI2c2ndljBP5HLZYHANe+95Vw44?=
 =?us-ascii?Q?JcWYo+iyWRYhV5P5SBM3gmG7AFdj9Qt0YKX03nkcuswwy1+TFQnXsQfn7ztU?=
 =?us-ascii?Q?OSdE8hTySQJTTcHa276+jNXQeWHgSK32xe3w3mIGU0Yej2N4/O/70pvFJmCs?=
 =?us-ascii?Q?ufvW7r9oL5OXoeq+659wDKM2Vk5TrdlMwx1dKsNQUBxsXTf6pLlDA8BPQ5Os?=
 =?us-ascii?Q?XrfGgJqqAw01psP/E3FIfgyEBynCc1EfJwtens1Vp624oM2hWDirPJYW8XIU?=
 =?us-ascii?Q?klObyHzqwq8F9g++Le9covR9FqfLOrzSC56FQPNJZ986MzMGgr2ciCIvWIhv?=
 =?us-ascii?Q?LTLbZ8tU8KAaaewcBUzK7yqWpjjAtn2LVvohoKXncM96TW+mu145VwlMvRB7?=
 =?us-ascii?Q?rEQbClKMwOX+RTB3AqXXDviMXw1ZKCNiGpU4S2g0Aph5cnZMpMdBDNBEWFl9?=
 =?us-ascii?Q?y9bee1p79w=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a4dcc1c4-dc56-40a6-a4f1-08da22456c17
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4013.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2022 20:44:38.9641 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dUB3E04X0FOiEZpM24Gwdo45uRVnvpgCTyMcnSXcbwpVb+uPuOkm5f8xSMrJreSJtgOWB4G5Idd1EQ78Pyqq1g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR10MB1998
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.486, 18.0.858
 definitions=2022-04-19_07:2022-04-15,
 2022-04-19 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 bulkscore=0
 suspectscore=0 mlxscore=0 spamscore=0 mlxlogscore=999 phishscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2204190115
X-Proofpoint-ORIG-GUID: TUwPVYDyHcPHkXzcEWCyhTIlat3F8NyC
X-Proofpoint-GUID: TUwPVYDyHcPHkXzcEWCyhTIlat3F8NyC
Received-SPF: pass client-ip=205.220.177.32; envelope-from=jag.raman@oracle.com;
 helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: eduardo@habkost.net, elena.ufimtseva@oracle.com, thuth@redhat.com,
 john.g.johnson@oracle.com, berrange@redhat.com, bleal@redhat.com,
 john.levon@nutanix.com, mst@redhat.com, armbru@redhat.com, quintela@redhat.com,
 f4bug@amsat.org, thanos.makatos@nutanix.com, kanth.ghatraju@oracle.com,
 stefanha@redhat.com, marcandre.lureau@redhat.com, pbonzini@redhat.com,
 jag.raman@oracle.com, eblake@redhat.com, dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add blocker to prevent hot-unplug of devices

Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
---
 include/hw/qdev-core.h | 29 +++++++++++++++++++++++++++++
 hw/core/qdev.c         | 24 ++++++++++++++++++++++++
 softmmu/qdev-monitor.c |  4 ++++
 3 files changed, 57 insertions(+)

diff --git a/include/hw/qdev-core.h b/include/hw/qdev-core.h
index 92c3d65208..1b9fa25e5c 100644
--- a/include/hw/qdev-core.h
+++ b/include/hw/qdev-core.h
@@ -193,6 +193,7 @@ struct DeviceState {
     int instance_id_alias;
     int alias_required_for_version;
     ResettableState reset;
+    GSList *unplug_blockers;
 };
 
 struct DeviceListener {
@@ -419,6 +420,34 @@ void qdev_simple_device_unplug_cb(HotplugHandler *hotplug_dev,
 void qdev_machine_creation_done(void);
 bool qdev_machine_modified(void);
 
+/*
+ * qdev_add_unplug_blocker: Adds an unplug blocker to a device
+ *
+ * @dev: Device to be blocked from unplug
+ * @reason: Reason for blocking
+ */
+void qdev_add_unplug_blocker(DeviceState *dev, Error *reason);
+
+/*
+ * qdev_del_unplug_blocker: Removes an unplug blocker from a device
+ *
+ * @dev: Device to be unblocked
+ * @reason: Pointer to the Error used with qdev_add_unplug_blocker.
+ *          Used as a handle to lookup the blocker for deletion.
+ */
+void qdev_del_unplug_blocker(DeviceState *dev, Error *reason);
+
+/*
+ * qdev_unplug_blocked: Confirms if a device is blocked from unplug
+ *
+ * @dev: Device to be tested
+ * @reason: Returns one of the reasons why the device is blocked,
+ *          if any
+ *
+ * Returns: true if device is blocked from unplug, false otherwise
+ */
+bool qdev_unplug_blocked(DeviceState *dev, Error **errp);
+
 /**
  * GpioPolarity: Polarity of a GPIO line
  *
diff --git a/hw/core/qdev.c b/hw/core/qdev.c
index 84f3019440..0806d8fcaa 100644
--- a/hw/core/qdev.c
+++ b/hw/core/qdev.c
@@ -468,6 +468,28 @@ char *qdev_get_dev_path(DeviceState *dev)
     return NULL;
 }
 
+void qdev_add_unplug_blocker(DeviceState *dev, Error *reason)
+{
+    dev->unplug_blockers = g_slist_prepend(dev->unplug_blockers, reason);
+}
+
+void qdev_del_unplug_blocker(DeviceState *dev, Error *reason)
+{
+    dev->unplug_blockers = g_slist_remove(dev->unplug_blockers, reason);
+}
+
+bool qdev_unplug_blocked(DeviceState *dev, Error **errp)
+{
+    ERRP_GUARD();
+
+    if (dev->unplug_blockers) {
+        error_propagate(errp, error_copy(dev->unplug_blockers->data));
+        return true;
+    }
+
+    return false;
+}
+
 static bool device_get_realized(Object *obj, Error **errp)
 {
     DeviceState *dev = DEVICE(obj);
@@ -704,6 +726,8 @@ static void device_finalize(Object *obj)
 
     DeviceState *dev = DEVICE(obj);
 
+    g_assert(!dev->unplug_blockers);
+
     QLIST_FOREACH_SAFE(ngl, &dev->gpios, node, next) {
         QLIST_REMOVE(ngl, node);
         qemu_free_irqs(ngl->in, ngl->num_in);
diff --git a/softmmu/qdev-monitor.c b/softmmu/qdev-monitor.c
index 12fe60c467..9cfd59d17c 100644
--- a/softmmu/qdev-monitor.c
+++ b/softmmu/qdev-monitor.c
@@ -898,6 +898,10 @@ void qdev_unplug(DeviceState *dev, Error **errp)
     HotplugHandlerClass *hdc;
     Error *local_err = NULL;
 
+    if (qdev_unplug_blocked(dev, errp)) {
+        return;
+    }
+
     if (dev->parent_bus && !qbus_is_hotpluggable(dev->parent_bus)) {
         error_setg(errp, QERR_BUS_NO_HOTPLUG, dev->parent_bus->name);
         return;
-- 
2.20.1


