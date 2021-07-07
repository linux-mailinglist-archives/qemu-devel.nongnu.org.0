Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A20183BED0B
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 19:29:36 +0200 (CEST)
Received: from localhost ([::1]:39480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1BMd-0003UU-LV
	for lists+qemu-devel@lfdr.de; Wed, 07 Jul 2021 13:29:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48140)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1m1BKa-0000VK-3B
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 13:27:28 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:30834)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1m1BKU-0006lS-Od
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 13:27:27 -0400
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 167HCO7H011975; Wed, 7 Jul 2021 17:27:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2020-01-29;
 bh=CXjA6O10ApJ3Orff5/HyR0N6EBqwAEKL00jhNWsaNZk=;
 b=AnClhxPpYyOiAYcJ1w6JzVNn0fTvNwCVNjCxkCBEuuRyHuRo8Fmcr3vMlXKVw51LyFYB
 BPYGJW1wNbnedAMGuESF+2QiFyfXpl2g+H58vXPr+lFhcUyU/1zMAUwHXCALWJxuiBSm
 JaQtv2WR2yhLTf5sRltxkDCPi774PDuOGhJuhHXfVLMdahjRRIMixLWjeg0K5pGj7gOk
 CA/Lr1lEf984tJ1WcU0gDCsLxKMQmMI1IOnnrTKK3kaHMp2bxH4XfUpzSxvkh7nfuAqS
 H2iX9HOLijYm53rRWhsmAk1/W2VWS1+J5wcpzeCpWtja+Glg1OFaD6IKw/dD2wDWszKT gg== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 39nbsxrqn8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 07 Jul 2021 17:27:20 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 167HAVQk053006;
 Wed, 7 Jul 2021 17:27:18 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2108.outbound.protection.outlook.com [104.47.58.108])
 by aserp3030.oracle.com with ESMTP id 39nbg2je13-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 07 Jul 2021 17:27:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e5eV8Y4C6UNYVyClaeuAhpmb5Qv1C/xWNShMXvXxgU6g6THZK/PUaszWneLDdhO4P78bHnYn8gw69y4yJpcAIUe1Fm2f4VVHmsg/kYBiPLyUHMlf/JTWhKFEjt41tXw9Qxp9+6fe4Ak8Cffj+91rm/wyGgh0JwG+z61xSUQYUX01IDL/4n/VGbLn+Wassk+Lsz67yWN79vTCO096ZsC1k3e6XN7l8V/J1Q9fnJMMwjA+zgeXVFqT2PVr9O/tyUvyjDkXqEIAenpAd1u3T1Vk+EBsoS3wE7VjlFC5mmLEgiLp3GVqNlo8SKnnAQZZMcmQF6yY51HnRsO16h1ZvkuLiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CXjA6O10ApJ3Orff5/HyR0N6EBqwAEKL00jhNWsaNZk=;
 b=m02FqeiZbpaD43CWVwnE/Fd1m98jgOLGHNIVoSa/amaW5Vdu/dBV1CHmsBi6PCmH8TogYm8t88Xr0fABmu2w9XmxAyDb6htmRp86OF3WySYh7V3jzcioYw6jcPW1gF4m1kkvLHI7GjwTDURDEZeDUw8i5lKboosmQhceCeKSFxEMvp4f8DTzAmrFHxZKNQfuIKhE93eqrRGPHHH23FmbzlThjcHB1BCXaCxUzGNtbtdG/F19q2yVwQ6sGT08wBEImXsEVKDxqzhpySlZ58d/hScqNBbHQmg2Vu/Sn/gZMPs1i6Nd1OKXwBn1W/cXnz0aWoxgFKdN44pnD4JKKMNhnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CXjA6O10ApJ3Orff5/HyR0N6EBqwAEKL00jhNWsaNZk=;
 b=a2csfGkz7XUOYTD5j+TD+SBqqzlUaDT+xouNHhs4vk6QPb1CHOZSh7ZWTIFwQn6KjVfGb32fnPMMmk8pj7Ho3lrtf7MJYjiZAN464nXJMvZMApjUMUqA/GcfMa/upSOOmSAgqtbQ7FVNheJ/m6WsY+nyixrnU7i8xK8Y4/oWgkI=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB3240.namprd10.prod.outlook.com (2603:10b6:a03:155::17)
 by BY5PR10MB4180.namprd10.prod.outlook.com (2603:10b6:a03:211::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.20; Wed, 7 Jul
 2021 17:27:16 +0000
Received: from BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::59e7:5c8c:71fb:a6ba]) by BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::59e7:5c8c:71fb:a6ba%7]) with mapi id 15.20.4287.033; Wed, 7 Jul 2021
 17:27:16 +0000
From: Steve Sistare <steven.sistare@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH V5 14/25] pci: export functions for cpr
Date: Wed,  7 Jul 2021 10:20:23 -0700
Message-Id: <1625678434-240960-15-git-send-email-steven.sistare@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1625678434-240960-1-git-send-email-steven.sistare@oracle.com>
References: <1625678434-240960-1-git-send-email-steven.sistare@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0104.namprd03.prod.outlook.com
 (2603:10b6:a03:333::19) To BYAPR10MB3240.namprd10.prod.outlook.com
 (2603:10b6:a03:155::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ca-dev63.us.oracle.com (148.87.23.13) by
 SJ0PR03CA0104.namprd03.prod.outlook.com (2603:10b6:a03:333::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.21 via Frontend
 Transport; Wed, 7 Jul 2021 17:27:16 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ab13a15c-9817-4bd0-e68c-08d9416c775c
X-MS-TrafficTypeDiagnostic: BY5PR10MB4180:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BY5PR10MB4180EFD061798884E52EF9E1F91A9@BY5PR10MB4180.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1013;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Vvn7nUo/mpQUMmCU4YzaOEzKdItSCfg7CjO3o5qBDeq2WHsOd/pgvN73jBsfI2AdmqNuQINi6yILFxc7Utp5hd2pSx4kPMcRDRAj8E/skPVaOqGRJKviL2YGrqJ6zNX8Lds9IuTXFfuc8epgrhc3N9sPDuADPFXss9JCl+pdCu6KV0+xAogDS8fyE8bQUfYsUhT+OmF/6BK2zODql8Flh0s2WJGOfH/DZ23SJlgIShjFetIE1hfdk79/xqOUfgzofbvmdOiTO3bNFxNOU1ZDhYF7d8PwMgiPy5wINHeYyqfFPiBA8JN4IEf+fi92aX0btU/7dZ7meesyZBgXqxU2Aakz/imspcAzPzrf4fHipz5mhz7eftVyq5Dpt82j9BPhEloDR7b1qPM/e35Br2pd5Pj+JJCs9RnDjbjcpRc2FrWsYSgAuyc18VIXRRwOgIBSDQ6GtnqhP4XW3qHVZjKRsdbSlXKqvmGeVhI4VyQTau/1FcKz3TCYxWAOtEcdz43Cdp/faoMaPG8BY1WH4q37ONBsLfQWNB+0/lp+Ts81kBhNBjmOzvHC9HHHoNXgjuvd/HlkpjwYhYZRtPtw/68gkJGIQRNMXUsNJ75yHvzAPz6HYIHeXLeU8QdRNqCBMdMAi9xbFHzcZX+YUcRHB+yg6P3+2t8DyKlswhMAUdWXaO2XzfeJIeGeerx4Wjj4jlbm9uPSgp3EhaumzOW8LODNrA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3240.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(346002)(136003)(396003)(39860400002)(376002)(366004)(52116002)(7696005)(66556008)(2906002)(26005)(478600001)(83380400001)(316002)(107886003)(6486002)(8676002)(86362001)(956004)(2616005)(66476007)(38350700002)(38100700002)(4326008)(54906003)(6916009)(66946007)(8936002)(36756003)(5660300002)(6666004)(186003)(7416002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Z9EtdmEg6EBMW+ReHXPEMqj62E/XJqDbWReHpHAA2hEm/ITDbtlrQkUSj2qp?=
 =?us-ascii?Q?eLUOckCf0jFqXYxDvHJoGWbKx3GIXqSwmyhE+sbJJRqux7QqAFN5ldGqinbH?=
 =?us-ascii?Q?hiuCYipvdlPY5Ipgo6RUllT4WmD0+szQqpFlc9Nq1YnNV1ZxAxU+DJ20MHeR?=
 =?us-ascii?Q?tkNpJDM5AwotPPdZRHDIjiXY/Dt2yNMZVPOJlAZS8Vom1LXDKK3tkWzYsXkX?=
 =?us-ascii?Q?1kcAzSo/DelUexlpg/Vv4Gz60yNqe+2JwKR36Z49UB0NwuzKEuMuy+R1TPRu?=
 =?us-ascii?Q?wawySnaY1Tx5mQHUKSxUXu054Lf5vw1Ltnc3h7E0nW4bD6IzsjAIqPupptQR?=
 =?us-ascii?Q?39VN2smRRLYkVlwnPJXc/iqi9PH9pZilLN2RGuYUwqrVcQDS9cTohpH3l1XL?=
 =?us-ascii?Q?jrqz0mHZsJqXnY8Qvt33O2/gxT0lz6dcSde3/mEQQDfmiqtLtyHA9ad3urys?=
 =?us-ascii?Q?e2iLXY8f+FPRLks/lKr+0fIaMPX55b+OM6jJqn55qviPqZcTuF9RnXHXBqEJ?=
 =?us-ascii?Q?LsEV7aTbQrjdTHV7oNRmJvmLiMmkrr5NNWkKV44X/38wap3lwK8S6oePRe8E?=
 =?us-ascii?Q?EBoZyuKblFmni+XImNLpsxoKjxjAHA+e5LoGToCef8iFgtlQ4Dd9U2rnzjLt?=
 =?us-ascii?Q?3pAU4JvF05eIEh/SM4I9iU0lqUUlk9rd+CTYrMBY2SdliE+xJY3kEv6BopWS?=
 =?us-ascii?Q?mUYyO9BV2YPbTBsiesbN8HQHX+OIN2G4+sSQxp2u2Y/VlLMNslkv9HtymEzb?=
 =?us-ascii?Q?4Cn7/v894hmDk55wKR6YJU8nQQGpQ8IWNPPoWfxDFEt0qe4cq54mSeilNI30?=
 =?us-ascii?Q?AYz3iaEsQHaZLR2fWqjI6o/8WbUz+nMGkvaP+9x8lNTNjdy1SUeZZcRRY+OR?=
 =?us-ascii?Q?LmQRlZtf9YAmWrQVyQeWXBLUSGGMW8KSXWGWmJWgKpFElgdpNPiRnhXR4e5s?=
 =?us-ascii?Q?M8cF72EcXOurZBFwXouFepDQjjFGyOeJT+YDk/9LboZrThyL3AkLv3r9mqPY?=
 =?us-ascii?Q?5UFeqdGb09G3LHKy7VXHkaFipq06kbJScJIj21No/qVE4snTHnTM0hlZGMfY?=
 =?us-ascii?Q?2ETLOejopC/sBC5v1EGRFW404Pm+rcJCMrHOiuHWopYlIIDSa19zBMht3G9/?=
 =?us-ascii?Q?VX6Ct/v1BkvhyM7sCr3EAPDv8ROJ8RNF/3JUtqLKEMYxpvqh0H2B9+OKV7EI?=
 =?us-ascii?Q?ab1X3/k2/3iDIz1DiMnHWgyalRrzF6owgjcNGaIjNyikQd3UQHDG4ygm4YXV?=
 =?us-ascii?Q?d4jK5rGxgcmw5HblXMch2OSBpshK2OkpU5jhGTTi8zABhGS8QaGbsKNE1ZVn?=
 =?us-ascii?Q?BT2OW/RXgfxFB/djdNvlvOro?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab13a15c-9817-4bd0-e68c-08d9416c775c
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3240.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2021 17:27:16.6015 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cpiiWXnr/+jOHk/WPx4+j8MiGgCY67zX6Xy52xB4c6DPIOsh25JcVZSidxhxFc/QUvis8jNyB90kHnsB24gemLC1UBfCE70NQFHPM6t6AYc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4180
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10037
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 mlxlogscore=999
 phishscore=0 adultscore=0 suspectscore=0 spamscore=0 malwarescore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2107070100
X-Proofpoint-ORIG-GUID: 9kadqvVCIknq3GlvPYDDg5o3q7j5VLhe
X-Proofpoint-GUID: 9kadqvVCIknq3GlvPYDDg5o3q7j5VLhe
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=steven.sistare@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Cc: "Daniel P. Berrange" <berrange@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Zeng <jason.zeng@linux.intel.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Steve Sistare <steven.sistare@oracle.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Export msix_is_pending, msix_init_vector_notifiers, and pci_update_mappings
for use by cpr.  No functional change.

Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
---
 hw/pci/msix.c         | 20 ++++++++++++++------
 hw/pci/pci.c          |  3 +--
 include/hw/pci/msix.h |  5 +++++
 include/hw/pci/pci.h  |  1 +
 4 files changed, 21 insertions(+), 8 deletions(-)

diff --git a/hw/pci/msix.c b/hw/pci/msix.c
index ae9331c..73f4259 100644
--- a/hw/pci/msix.c
+++ b/hw/pci/msix.c
@@ -64,7 +64,7 @@ static uint8_t *msix_pending_byte(PCIDevice *dev, int vector)
     return dev->msix_pba + vector / 8;
 }
 
-static int msix_is_pending(PCIDevice *dev, int vector)
+int msix_is_pending(PCIDevice *dev, unsigned int vector)
 {
     return *msix_pending_byte(dev, vector) & msix_pending_mask(vector);
 }
@@ -579,6 +579,17 @@ static void msix_unset_notifier_for_vector(PCIDevice *dev, unsigned int vector)
     dev->msix_vector_release_notifier(dev, vector);
 }
 
+void msix_init_vector_notifiers(PCIDevice *dev,
+                                MSIVectorUseNotifier use_notifier,
+                                MSIVectorReleaseNotifier release_notifier,
+                                MSIVectorPollNotifier poll_notifier)
+{
+    assert(use_notifier && release_notifier);
+    dev->msix_vector_use_notifier = use_notifier;
+    dev->msix_vector_release_notifier = release_notifier;
+    dev->msix_vector_poll_notifier = poll_notifier;
+}
+
 int msix_set_vector_notifiers(PCIDevice *dev,
                               MSIVectorUseNotifier use_notifier,
                               MSIVectorReleaseNotifier release_notifier,
@@ -586,11 +597,8 @@ int msix_set_vector_notifiers(PCIDevice *dev,
 {
     int vector, ret;
 
-    assert(use_notifier && release_notifier);
-
-    dev->msix_vector_use_notifier = use_notifier;
-    dev->msix_vector_release_notifier = release_notifier;
-    dev->msix_vector_poll_notifier = poll_notifier;
+    msix_init_vector_notifiers(dev, use_notifier, release_notifier,
+                               poll_notifier);
 
     if ((dev->config[dev->msix_cap + MSIX_CONTROL_OFFSET] &
         (MSIX_ENABLE_MASK | MSIX_MASKALL_MASK)) == MSIX_ENABLE_MASK) {
diff --git a/hw/pci/pci.c b/hw/pci/pci.c
index 377084f..2590898 100644
--- a/hw/pci/pci.c
+++ b/hw/pci/pci.c
@@ -225,7 +225,6 @@ static const TypeInfo pcie_bus_info = {
 };
 
 static PCIBus *pci_find_bus_nr(PCIBus *bus, int bus_num);
-static void pci_update_mappings(PCIDevice *d);
 static void pci_irq_handler(void *opaque, int irq_num, int level);
 static void pci_add_option_rom(PCIDevice *pdev, bool is_default_rom, Error **);
 static void pci_del_option_rom(PCIDevice *pdev);
@@ -1334,7 +1333,7 @@ static pcibus_t pci_bar_address(PCIDevice *d,
     return new_addr;
 }
 
-static void pci_update_mappings(PCIDevice *d)
+void pci_update_mappings(PCIDevice *d)
 {
     PCIIORegion *r;
     int i;
diff --git a/include/hw/pci/msix.h b/include/hw/pci/msix.h
index 4c4a60c..46606cf 100644
--- a/include/hw/pci/msix.h
+++ b/include/hw/pci/msix.h
@@ -32,6 +32,7 @@ int msix_present(PCIDevice *dev);
 bool msix_is_masked(PCIDevice *dev, unsigned vector);
 void msix_set_pending(PCIDevice *dev, unsigned vector);
 void msix_clr_pending(PCIDevice *dev, int vector);
+int msix_is_pending(PCIDevice *dev, unsigned vector);
 
 int msix_vector_use(PCIDevice *dev, unsigned vector);
 void msix_vector_unuse(PCIDevice *dev, unsigned vector);
@@ -41,6 +42,10 @@ void msix_notify(PCIDevice *dev, unsigned vector);
 
 void msix_reset(PCIDevice *dev);
 
+void msix_init_vector_notifiers(PCIDevice *dev,
+                                MSIVectorUseNotifier use_notifier,
+                                MSIVectorReleaseNotifier release_notifier,
+                                MSIVectorPollNotifier poll_notifier);
 int msix_set_vector_notifiers(PCIDevice *dev,
                               MSIVectorUseNotifier use_notifier,
                               MSIVectorReleaseNotifier release_notifier,
diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
index 6be4e0c..bef3e49 100644
--- a/include/hw/pci/pci.h
+++ b/include/hw/pci/pci.h
@@ -902,5 +902,6 @@ extern const VMStateDescription vmstate_pci_device;
 }
 
 MSIMessage pci_get_msi_message(PCIDevice *dev, int vector);
+void pci_update_mappings(PCIDevice *d);
 
 #endif
-- 
1.8.3.1


