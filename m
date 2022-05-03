Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FB71518681
	for <lists+qemu-devel@lfdr.de>; Tue,  3 May 2022 16:22:29 +0200 (CEST)
Received: from localhost ([::1]:53740 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nltQ4-0007Zw-79
	for lists+qemu-devel@lfdr.de; Tue, 03 May 2022 10:22:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42296)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nltL8-0007gp-Mr
 for qemu-devel@nongnu.org; Tue, 03 May 2022 10:17:22 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:16710)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nltL6-0001NF-TU
 for qemu-devel@nongnu.org; Tue, 03 May 2022 10:17:22 -0400
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 243BFGeF032436;
 Tue, 3 May 2022 14:17:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2021-07-09; bh=ezs4Sf67fjK10WgD/7RvcUDz7aSscd9W02JfSQT2ykc=;
 b=I3u9gOkAUpl1AHnH79myWR6YBjHgkemLhZvc15Sk7z94CXfx/WZ2lt5Ss7I7KnerHqmO
 8W7kmEx5c3FCaMNZ1WAKGUm5+WTGwzuL+923o2d9xvXfGEyVBGRZOIi/OHp83nHdwIao
 0aBR8bcSKrl5X5DJmTkABE+I6K8TBtsecZs6EI/iR/pdXaszqM07HVX423RvrTDr6JeD
 Lxs3vpmjalAOWjbEKhTo3dFDHG82nyZyuhwFQkdVE0maAF2OwbAYAtwuALYb3ez4Q0UZ
 TvzqKEKZnANTrEAbhW61F6Nfn07R/FPgSiMeckCN8dek0KMhcqaaTxRDln3Qb05u0wLi /w== 
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3frw0anng5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 03 May 2022 14:17:16 +0000
Received: from pps.filterd
 (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 243EG1s9032338; Tue, 3 May 2022 14:17:12 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2049.outbound.protection.outlook.com [104.47.66.49])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id
 3fsvbmd2q3-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 03 May 2022 14:17:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WSMjfPSQDSD4GfyNqiepc2XISB2wdIIHDecIgTzHft6RoBvlvYsY3dSn39Qb0PSznzH7ZUTWgsrHyKojSMeK2TFZDjl4q1u8Y57NP2SqQfcnfVM9nfEll6egZ8A+msIay6XtCvY9hrl29NS+xpzRhbM2O2YyPDsZsdhSQQtcCn/LW9kyQx3ccdtjS1VJaDR5beaGJBMQnAs3/icjWxscSvHgueRgEZsWkAzYOuTshSb/wriPxnCdohd/17hJSQNSSeJ0LE7iE9OzZ2YgTqW1/5d6qTgPcTT/Gg5k6cEDJN9XWCrP0iN0/WD0hGZM0nfJI0INKoceDupkQyIjrf4KlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ezs4Sf67fjK10WgD/7RvcUDz7aSscd9W02JfSQT2ykc=;
 b=ZfSSbB0qQvRCzFUoRZUazsJ0TiokYYQ1FlKtyF2wYIGvxS8nxlvVQZHjfo6cEAv94JBIdUqlaMkLxgv2WkVPr71OiNTMvmOJut5eNqfjgrRtJ4+QwtHN4v2ij6UgPKiwIWg046GkE+86dpqaUl/isImaZvbGtdOhFGKfrUHtfC2CaVH/cCPCP3vplRhFGlkLuUo2WmHFS683p/cuY8MaOqhD/vN/nl/m/H0DATQ3Ol/rBFG+iW/Mp6v5LD6c5i4GRJtgpsdNsDeEF8RN/VUcaZbUDKBoA0x1igx0XhusYgFz2Ydf/nYR87bplSWRvnVul4FCdwgcE4nGvxQRLedH/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ezs4Sf67fjK10WgD/7RvcUDz7aSscd9W02JfSQT2ykc=;
 b=UlTUaNyHH6jJaB/tWF0aYZ1iRsR2a9O/ZlmFUDYgtz78Q1+2d3QuclP0172N0WxyaOeuk80OZ4gWdDTIxkYLsytcS+r/YXlbiJnvgq5DTKX2csF1LEXLyqghBryfDI6BsZhOeC9A6y9RsKcYRtvvWOHlBhyD7O9sVl/cAF4J2Zg=
Received: from MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 by MN2PR10MB3358.namprd10.prod.outlook.com (2603:10b6:208:12f::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.24; Tue, 3 May
 2022 14:17:11 +0000
Received: from MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::e9cb:e1ca:8189:f191]) by MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::e9cb:e1ca:8189:f191%7]) with mapi id 15.20.5206.013; Tue, 3 May 2022
 14:17:11 +0000
From: Jagannathan Raman <jag.raman@oracle.com>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com, mst@redhat.com, f4bug@amsat.org, pbonzini@redhat.com, 
 marcandre.lureau@redhat.com, thuth@redhat.com, bleal@redhat.com,
 berrange@redhat.com, eduardo@habkost.net, marcel.apfelbaum@gmail.com,
 eblake@redhat.com, armbru@redhat.com, quintela@redhat.com,
 dgilbert@redhat.com, imammedo@redhat.com, peterx@redhat.com,
 john.levon@nutanix.com, thanos.makatos@nutanix.com,
 elena.ufimtseva@oracle.com, john.g.johnson@oracle.com,
 kanth.ghatraju@oracle.com, jag.raman@oracle.com
Subject: [PATCH v9 03/17] remote/machine: add HotplugHandler for remote machine
Date: Tue,  3 May 2022 10:16:44 -0400
Message-Id: <e5b3fc43a13d38bd4e1876abd1d094d70785e72a.1651586203.git.jag.raman@oracle.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1651586203.git.jag.raman@oracle.com>
References: <cover.1651586203.git.jag.raman@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SA9PR11CA0005.namprd11.prod.outlook.com
 (2603:10b6:806:6e::10) To MN2PR10MB4013.namprd10.prod.outlook.com
 (2603:10b6:208:185::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 30cd5452-90d1-49db-6f1d-08da2d0f9d4e
X-MS-TrafficTypeDiagnostic: MN2PR10MB3358:EE_
X-Microsoft-Antispam-PRVS: <MN2PR10MB3358D8A6DBC07ECB0EDC648B90C09@MN2PR10MB3358.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6uV4CltSxwgWLFWbX4Jx7KBN9s8kxGTgB6mG4UGrEHATuk+EkKyFc2c4b0bF8giQM+uh+FMT6x9malAe5v/TM3hdbvzwaytp83zu44y5lY9/5qpBh6pxBU5Vz6kz5R/khi5RoijacNo/Hy55SJ4mOakt/NyB6iQYfoJdLPzPDsk/D9kN36XaAAD8vtfSk1xevwYGa47T4d9s6RpUD9Url0lUkW6k+2k+bnugoIr40frvMv6NOdqeFCqtuhwR4fT0ueK3DQgwFTkAWjV4VVp5PTgRxkTIcvGxKzeYvVtoFI7TZXDw/m9RnAsFqDgtIYwIvid7TnlZ/jSxP3ngSlH25Q3ajYHoWiqSlOi3dc4ReVyAWFOoicK05MYBOskgXmqnKdJ7zjHXdk5MajmZph/BQGObBAYsSx7Of4Fr5Yo59ot464AftccVTgEWyFDfFNIF3G1DnQqJTVo110QBFjDwzvebKFhofWM2dlH4BkRjtHmhfl2BecF/xoVDqpK+6Ua6lCMxGB+2dMcHfmflKXEONo5HNybSj2wWTiH6Pf6BWT7lP5Haf36MVcYtM1QnPY9tMFUVCAyuyc+sRuoTW3J5LTK44En6sPXEt1rlpc27vo4712G0Oa7oMEnyKR5mh6BOGJJIhaEpw2dhI8MX37+H5XkNTzEvySmfVOJm8jHPYTni+eFUyn/rVza6YRme0ret+0uGgMNn1L48WoBfGokbxQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4013.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(36756003)(66946007)(2616005)(6506007)(186003)(107886003)(2906002)(6486002)(6916009)(316002)(38350700002)(38100700002)(7416002)(5660300002)(8936002)(6512007)(86362001)(4326008)(6666004)(52116002)(66476007)(508600001)(8676002)(26005)(66556008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?VRz4HrTo0M77HUR7dgb3GT+FUlxurOnFOwjEmFhjWb4QrApmkTQotFsGhBhT?=
 =?us-ascii?Q?bXh8mRRquZf+sh0aXzfmnTmJBMi0jdEtS7G7k9unr+WAkP21rkW9gHMEdAFF?=
 =?us-ascii?Q?oO131wnDixDFfqqKoHUsUP5qRFUSK/K4gNTirNGaqaBOXUQAX+bX1O/jzj1N?=
 =?us-ascii?Q?lm3c9saVSZM0EmrkXzA0DT1Hyq7vHJG60L13QP+cZiUHLLUGM2guk7kSSxwk?=
 =?us-ascii?Q?9ZS58w4Z7CuBj8oJSAnTASfUbFZrqMYL92hv/Y7cEMvlY/TBc89Z998WmBuR?=
 =?us-ascii?Q?1BXyKSrQ3SdJz5ngJdAoIIjBxCkPLDpCTHAZcAgQPzPO9LX0obKvJSoa1THE?=
 =?us-ascii?Q?olA6AcVJ1SVx7ws9fdPJAhAUkpoQ4rtNrpOlnizdcRufbZJp+U+U5q7Y076D?=
 =?us-ascii?Q?2AaHbqfdrEqq6VOoDvgSSNiRWAcqWkdxlQ9FQhb7wAkrPeL4M6fbjcRwmOSt?=
 =?us-ascii?Q?XHfwucPkrexTCD7v2a/hK2+EJtrebrX+SFO9z8H2TqVQCaWWF1L77VhGjHoy?=
 =?us-ascii?Q?DS6zqdYMzccnQCkS7ZpbVkXRVwoU864wjfzHMzplL1VdPRYugQfnSMlJu6SD?=
 =?us-ascii?Q?qSFxnQHnatbDQ5xTCKJ/gYqH7fT7v/IMPcpDTFAjJeb+uf7U+hdEAa7vMhw9?=
 =?us-ascii?Q?ZgEtsScb0fv6Wslz1aIUHIBgDKFtZTgX+Os/spyGsq3h39sTrR888JEmOrRn?=
 =?us-ascii?Q?RJrj6tIS+LbDaGo4y05ojmB22a75NnHI2AUy7FnN71XiDyUKxJYNVj+aSyAu?=
 =?us-ascii?Q?i3ibN3TSqOx2UqO6dVGS/hOMOr3PNp78gWgK6svEnatwYVp0gyp+ud+pJNLO?=
 =?us-ascii?Q?mC7jvXIWT16OUjOIaknyshVQ1/uJebzujtm3kJCbw8QbLqEFaxFwebo4aTQ3?=
 =?us-ascii?Q?RkMUAx5A8GRo9g8DB8U70u5dF6D8p37RIVOlZ4/6b3q2xRgKhqpLPlXQW4/L?=
 =?us-ascii?Q?P09sRqowBg13UfKMFaskHYBX0ir9Al6dm8u3FKUl6pYwuAmXlZ6Qlkh+xQ1x?=
 =?us-ascii?Q?QJv71aVZx8APaHXFYTAnwjSN3wUggjcCH/dowkkncTto+5GhQFRb9/nElXcd?=
 =?us-ascii?Q?jURl6sU7uTvWuY5bOwm9z58zlHg1AihviYOIaCXKV2S9+ntUad0C2m//F0On?=
 =?us-ascii?Q?/5CURbX2zPAZCJY5EgcOGYjBDRJ8/0Te4Bd6BQKapJPg026FB5UcJpPnciee?=
 =?us-ascii?Q?DZa9GdZT2d1soJfuZA2khPo+4ow2AZPNy6+EuDjYECZ0Q/3IHsTOuVEs3PKf?=
 =?us-ascii?Q?6V2TVaMMLNauGGKN6TCPwoHuSXcc10RR002CGDGRAz1eLY/eveWOScaHHFYN?=
 =?us-ascii?Q?NgV7qwnFlDzGbGROjE+gkEs1WyLpy5dAMm3rLq9rLASHrgYJQiPcd/AYu3R5?=
 =?us-ascii?Q?7JjEOeQhCI8B2N+Q523sATYOhw5n5CJLSyKfFnkP0Lx8737ieTG/t02t+rW8?=
 =?us-ascii?Q?pQY82upnMMMPpAK1ZBmMiHG9fezjonTIm2Jj+Qk+YRGDGKJDVWuinOtw5A6w?=
 =?us-ascii?Q?q2zkqVB5Be6iwyR4BI3N7ebECt9uZKHIPQfpS11Ho/RMPacNxiylWEnydeE7?=
 =?us-ascii?Q?KjSCeQjAiE8tH19Um2VF6y8bX0JtXnC6zygOcIG9U2w14j/kd8KSP/jrS6Bt?=
 =?us-ascii?Q?zcPpLzlCRjV4+fIDmwVdo2YgJL+j4jvBoC4ccQe5UTIMD7r3iNnDG3NjqPpS?=
 =?us-ascii?Q?+C0DiBPZxOLipQv6dM5f+WOWkfcplfCViMno+GADekmGal7bC3mLtMcBGuzI?=
 =?us-ascii?Q?ux24UVjrww=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 30cd5452-90d1-49db-6f1d-08da2d0f9d4e
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4013.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2022 14:17:11.5456 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XrYzFLLLRhlh3eR/t0/1fzcNiXycOT8kBWKI6Z9xCUiHOgA5f7oaDtS4ZGQuCoUstRvTj1EdNK2oQE6uM4TqwQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB3358
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.486, 18.0.858
 definitions=2022-05-03_05:2022-05-02,
 2022-05-03 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 bulkscore=0 spamscore=0
 malwarescore=0 adultscore=0 suspectscore=0 mlxscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2205030103
X-Proofpoint-GUID: 4PNbYRcK00AaHdlgd42Mb5G1kueaPc3v
X-Proofpoint-ORIG-GUID: 4PNbYRcK00AaHdlgd42Mb5G1kueaPc3v
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

Allow hotplugging of PCI(e) devices to remote machine

Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 hw/remote/machine.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/hw/remote/machine.c b/hw/remote/machine.c
index 92d71d47bb..a97e53e250 100644
--- a/hw/remote/machine.c
+++ b/hw/remote/machine.c
@@ -20,6 +20,7 @@
 #include "qapi/error.h"
 #include "hw/pci/pci_host.h"
 #include "hw/remote/iohub.h"
+#include "hw/qdev-core.h"
 
 static void remote_machine_init(MachineState *machine)
 {
@@ -53,14 +54,19 @@ static void remote_machine_init(MachineState *machine)
 
     pci_bus_irqs(pci_host->bus, remote_iohub_set_irq, remote_iohub_map_irq,
                  &s->iohub, REMOTE_IOHUB_NB_PIRQS);
+
+    qbus_set_hotplug_handler(BUS(pci_host->bus), OBJECT(s));
 }
 
 static void remote_machine_class_init(ObjectClass *oc, void *data)
 {
     MachineClass *mc = MACHINE_CLASS(oc);
+    HotplugHandlerClass *hc = HOTPLUG_HANDLER_CLASS(oc);
 
     mc->init = remote_machine_init;
     mc->desc = "Experimental remote machine";
+
+    hc->unplug = qdev_simple_device_unplug_cb;
 }
 
 static const TypeInfo remote_machine = {
@@ -68,6 +74,10 @@ static const TypeInfo remote_machine = {
     .parent = TYPE_MACHINE,
     .instance_size = sizeof(RemoteMachineState),
     .class_init = remote_machine_class_init,
+    .interfaces = (InterfaceInfo[]) {
+        { TYPE_HOTPLUG_HANDLER },
+        { }
+    }
 };
 
 static void remote_machine_register_types(void)
-- 
2.20.1


