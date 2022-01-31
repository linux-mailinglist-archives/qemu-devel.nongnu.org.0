Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 73B4A4A4FBF
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Jan 2022 20:54:29 +0100 (CET)
Received: from localhost ([::1]:35770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEcks-00088a-80
	for lists+qemu-devel@lfdr.de; Mon, 31 Jan 2022 14:54:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37252)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.kanda@oracle.com>)
 id 1nEcaQ-0007OY-CM
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 14:43:38 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:28424)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.kanda@oracle.com>)
 id 1nEcaH-0008Ju-DH
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 14:43:33 -0500
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20VIBIiP010608; 
 Mon, 31 Jan 2022 19:43:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2021-07-09; bh=tDSFcOh5caT8TaphCDeBkArwVoI+/mGLqNDSVCEJJP8=;
 b=lGoO/KM8t9FtTuxf4cgtLy+ha/Gsg0xhYxkV+PS5lxFf1zEE5rkNzSLtO+EY/uzWaDan
 Q5BLzXDMKiCERbcj6DaEibi5x0ZKliPdmSaJbi3UqaVtpqcATbu/J9lWjUBeRjK4W+22
 PVQg9k0Hs2XYpLeij+KgVSPAzYmlH/AefDSeFWJ+U0IuUM9UyvvQ7Buy5xabtrbyisNy
 PWaqa+jlQCC/yFEzDlLEDnG7m9jjQh+5Sxmttkxs3hJ+81FbKHob4vQh9amZ/jOay96M
 /6HmthVZOGP2uw2yZ6dU1ZvDklPeHGt0iHm3z2eIOF1H/j9zgEI2MHyz4D9vudTYaWNS qQ== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 3dxjatru6u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 31 Jan 2022 19:43:24 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 20VJQEx4005659;
 Mon, 31 Jan 2022 19:43:23 GMT
Received: from nam04-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam08lp2169.outbound.protection.outlook.com [104.47.73.169])
 by userp3020.oracle.com with ESMTP id 3dvy1nd025-3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 31 Jan 2022 19:43:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MgVC4G29ykWek9y+dC+/32Y/2OYwSegVETFo5y92RszrhawLXaajYE11ZewRRDyeyBJlE/n7dxSqW48F683xsO1opBPk1vZuRhW6tGgO3zE9NeSkNDxDapx3H/DcETTDTL4l9cnE2XLMP4M+cDoPnGjvNE9gsp2z102By/rQHnOvz6JEtKQIIJjzAOdAEQmKN2sZwZGCPwB4J0sJTU08Iv6CexIDHkNsuPnPCMOrB1ckAY4Cws6W+eV7ZNCWzyoH9huMA/Zv7BFBG/QVaqKg3HK8PCWa5Xp52tGZOTzKbDQ40fz/AnJnOf91BT1V7n6WHe02pMXXlBRuR/L5Vdfayg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tDSFcOh5caT8TaphCDeBkArwVoI+/mGLqNDSVCEJJP8=;
 b=aadBv4ZjewSSbQt1i4aoY/CNWyDW5Pk/E3SkXqISxA076V9hCmA+IMhpZgP70NPBtP3Z6KryQ9aWVhcNCz/vk3MQ4XIlxlc4gQ+SgajRYitlOxHsH4bpF3sUe33nqkejx3IVJgU4cP7IaL+gTQh+FFGUfzZtPNF7GapJNTv0Q5jh/ipEEGpl19EWDfP+s1W8m+m7F4f4PfeHPZ5NkbroQuhwXoyJqdQQdt/NcQTQY6CIua+dYyQ3ByezIbQ3hpprm07u3u+ka204vv47ufoal2VEm0dIQ8ttLiUMkOdmisVLY9yFUsRn+LIu7Xr/Z+bDtDuGMVfg0entrNJ/38bG4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tDSFcOh5caT8TaphCDeBkArwVoI+/mGLqNDSVCEJJP8=;
 b=W8K5ivUb8ik8Pq9X1n1gtKyLVoz3s9ez8xpyzanGZZFQnjSo3L3AI0TwMEVL8wb+1t3/wnk41+rDnvCZEmyDMXTp0blbEu8xkUoHoRZ+UNCMJCaJ7Ukko/+Pj8WEgzGYid/AINZFtoao6apYcA1JuVdAjs6R+rPjp9cjLhwnp4k=
Received: from SA1PR10MB5841.namprd10.prod.outlook.com (2603:10b6:806:22b::16)
 by BLAPR10MB5362.namprd10.prod.outlook.com (2603:10b6:208:333::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.19; Mon, 31 Jan
 2022 19:43:20 +0000
Received: from SA1PR10MB5841.namprd10.prod.outlook.com
 ([fe80::58ef:3181:b9d4:b716]) by SA1PR10MB5841.namprd10.prod.outlook.com
 ([fe80::58ef:3181:b9d4:b716%5]) with mapi id 15.20.4930.021; Mon, 31 Jan 2022
 19:43:20 +0000
From: Mark Kanda <mark.kanda@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 2/3] hmp: Support for querying stats
Date: Mon, 31 Jan 2022 13:43:11 -0600
Message-Id: <20220131194312.1192626-3-mark.kanda@oracle.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220131194312.1192626-1-mark.kanda@oracle.com>
References: <20220131194312.1192626-1-mark.kanda@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SA9P221CA0008.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:806:25::13) To SA1PR10MB5841.namprd10.prod.outlook.com
 (2603:10b6:806:22b::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ddcba4ab-326d-4e1c-8dd0-08d9e4f1ef44
X-MS-TrafficTypeDiagnostic: BLAPR10MB5362:EE_
X-Microsoft-Antispam-PRVS: <BLAPR10MB5362C826CE43E4E646A8FEBCF9259@BLAPR10MB5362.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:148;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fxTnih4nE6mnqiDDp1L45srULgfI3pHCcfT0Hxr/2hVlFW2ukm8V939gwny7oZH0enMGMqH1TQY7kbJrzPFDm7eQsMyA276gzAZp2Qu/PdCNnC1yUjoWIPAyAaLkmp0NKIib3HuNCG2tkP2YhLkiSpfHUH21THEndJfccLiLc33lQ1KLxDl1UY08TL7EtL0WwKoUUXI6JPCIWhA1olnIc7JY8Rx/tsw6A+1oQqB8jfcHZ09aWWrn/0HJoKY9Jd2GDNDDyWl7/iK2lczEHmJBAvFwU7zzYD67q/i/ZuM7KNzP0ci28eflHP2my62ndXTFPZqcBc+B0ty7rqtmGOo/K2QD7H+imi8DjlbWjlHQcyvWeGZ/Mt6lPwhRHh05QyNtbKYQw9zuw425NUXQRudmCo0EjacyAjl9xoRBv7KCu1rOEGwOi3HJ+HHXKh0AHJDmw3PKtvnoWJCBE6S0rucU9q653MXhArtnqtC4aq2+Pam5PHKJ6yTF1juPh8pJwyvEXYHR390kFlCKZtrv6WKZ04L5Mma1q+4wfdFFAWufZz8TUpdx1aGfkTN8ndHdKgxNWWczGuTmylQQR3frTA26/g+tXk+tFUuZDjoxdBK8ajVNskGWlJf/NzDzhsBElEzhzS9Hyk567jX4jjzpdtGzR32bCHI+cYwOoi+ac6wPHIQ3LtSVJLApAfHHED79yucvkmWIjisXrcMN0cNnJ9JqeA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR10MB5841.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(26005)(508600001)(186003)(36756003)(107886003)(1076003)(2616005)(316002)(6916009)(52116002)(6506007)(6666004)(6486002)(2906002)(86362001)(4326008)(8936002)(8676002)(30864003)(6512007)(44832011)(5660300002)(66556008)(66476007)(38350700002)(38100700002)(66946007)(20210929001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?XfB4A5HjC/p99rHXRW0gwLOOiGEhwjPO1zHOg6uynnHaEPfMWIVVns3OEY0L?=
 =?us-ascii?Q?Ex9XAt1I/9epzDS2/0QhfrFLF7l2krzWI9Fuu0mexJBfr70HPz7wYNAjTjxY?=
 =?us-ascii?Q?maDd3QEHKfT2hbCsRPlAy98A/HIZjSCLwHdv2i9mTj0iBPOBl70Ee+HmEqKQ?=
 =?us-ascii?Q?Wy8Z78XXcOKiRhIyI4P9VjwaaMZnYvAhyupobXPXUiP+eYbLTJ/e128SiVWE?=
 =?us-ascii?Q?8bMDKYa7lIsfcsuLFSE3uS+PSUj4qpu3iftbtQowwd7l9tall5FcpZFnUOSa?=
 =?us-ascii?Q?aNola/5VGGbF941X0W5YZ2PiMvOVuZme3jFMI7IVUDcNDocjTETynurVpQ2y?=
 =?us-ascii?Q?OEAJUAFSicIEoPzq4Rz9zxJICmnh3RV5czIw5fj4N6A2UHfbKxo7ol8QSxjR?=
 =?us-ascii?Q?XP03Nl1fhR5bzDKDHnKZGLgSxcTwFPk9n28qg0dpOSdSBOzY4Pr3cNkMeY1x?=
 =?us-ascii?Q?j1BNFihtVWHv1qxZTspsnTDOjrlHLA3fjrq1yJ0D0LTcbRSKCFcul0Mb8WGa?=
 =?us-ascii?Q?QoA9vFkObu/ipXZ+ijMACjb/yP1J7bXh+ATfHY82/o7CLDV0rdIj+l4e3FAB?=
 =?us-ascii?Q?q72IbFUPJtQ9yXscmicGOJmv0ael/J+Fb7uZlcarOLaeydUWcqN17V8ZBIGl?=
 =?us-ascii?Q?Y3JKjFqCWBeWpQED3KufkTupkRCz+jhHNHBC4vjxB8bUgUDCiPjxi5nSByti?=
 =?us-ascii?Q?N1H6YyaWnxl7yRGelwBAo6lmpyDXThyX+pzFp2u8D9mCfRfG2X8jzv5trPtz?=
 =?us-ascii?Q?QG2ddeuaHpbyMy0VWfhJ0/y9x0ItHGOnya+lApvAtGp0iFnynue4eTJh/E8q?=
 =?us-ascii?Q?oR2u76yRHsBd0qav9mJ+tdvkABMWE1KMNtgSrGsNaDvjefmeR1UpugkPOza7?=
 =?us-ascii?Q?crhL+SlELIkC8iuDkknIicgWcBh8kLixpq5PyDeVtqugVaSXVbIqEjccyWXc?=
 =?us-ascii?Q?z70R8mgDB6rQzjrzmy8IJQjqJ2lc684sF+7FR3e82nLgsCrsthEn4O90hAep?=
 =?us-ascii?Q?jfNUAMbg1tODyHucdnNt+er9mlUnoVEpTLt+YtLYc3kdPyf0A3yAimtccZ5p?=
 =?us-ascii?Q?OKlIhp9S3OJz4c8YG8YACSXYEaTkzGQ7Tp3JjQggeci8+aAPzYDnCCR5ykGz?=
 =?us-ascii?Q?6JBDRYOoNUICe5d07NqGPuEf0mUIo5UXQHPrmjTqJPHMcoFEYVvi4vtW8Znt?=
 =?us-ascii?Q?1eXllYbSYXBXmvyiqZ2zva3XIBt1hHEL2Pt5Mq8GXpN3qVAUujSo/+ddrFf3?=
 =?us-ascii?Q?3CiB9xxIkJvY8g5iXf7nmFlCYFMnC98FfxYSUglEUapiu++x2YilcDLMui2u?=
 =?us-ascii?Q?PphqVa5DHC3mbsNDb5v+yWwTVmoUJwPNxmWttb1uzd+UUAm/xNC05vvY+NHF?=
 =?us-ascii?Q?U2u4h3iSA7Eb/Z6pWS3gBieDD6t+6xmAZVZ87OIDVlsl6DePR+bGi3hFWLHT?=
 =?us-ascii?Q?tYfp+XGNrdtH8mAoFKaKCony8f+3LW+rYBy/YqWWFYABxFHnK7IDyMHCL70j?=
 =?us-ascii?Q?1g0UZq6x68HmksG6ORxV84nfoPwTV116GtfYR3Oa9ai4Q6VMNmsrCziN6P3K?=
 =?us-ascii?Q?Kob+n0u+5fwipHSfNJgkiNMIRY05ZD2rfdklqpB3mUM7zy0aC+wYhWSgvCvx?=
 =?us-ascii?Q?qbNI6pK+urqUZNaxn4eDj0c=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ddcba4ab-326d-4e1c-8dd0-08d9e4f1ef44
X-MS-Exchange-CrossTenant-AuthSource: SA1PR10MB5841.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2022 19:43:20.3384 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q0fQhxL+MPeqQysDomDJzuIIfAfWpxfA78G8+Lx63fGQnNxAW4ARkFoMcDfhP72NRDKouP4Nmt7ihagSAndoUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB5362
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10244
 signatures=673430
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 mlxscore=0 spamscore=0
 bulkscore=0 adultscore=0 mlxlogscore=999 phishscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2201310125
X-Proofpoint-GUID: _lBkZM55f6iuXEf8VrLCZg3w7dmwvAax
X-Proofpoint-ORIG-GUID: _lBkZM55f6iuXEf8VrLCZg3w7dmwvAax
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=mark.kanda@oracle.com; helo=mx0a-00069f02.pphosted.com
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
Cc: pbonzini@redhat.com, berrange@redhat.com, armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Leverage the QMP support for querying stats. The interface supports the same
arguments as the QMP interface. Wildcard char (*) is accepted for names and
stats target.

Examples (with fd-based KVM stats):

- Display all stats
(qemu) info stats
vm
  provider: kvm
    max_mmu_page_hash_collisions (peak): 0
    max_mmu_rmap_size (peak): 0
...
vcpu (qom path: /machine/unattached/device[0])
  provider: kvm
    guest_mode (instant): 0
    directed_yield_successful (cumulative): 0
...

(qemu) info stats-schemas
vm
  provider: kvm
    max_mmu_page_hash_collisions (peak)
    max_mmu_rmap_size (peak)
...
vcpu
  provider: kvm
    guest_mode (instant)
    directed_yield_successful (cumulative)

- Display 'halt_wait_ns' and 'exits' for vCPUs with qom paths
/machine/unattached/device[2] and /machine/unattached/device[4]:

(qemu) info stats exits,halt_wait_ns /machine/unattached/device[2],
/machine/unattached/device[4]

vcpu (qom path: /machine/unattached/device[2])
  provider: kvm
    exits (cumulative): 52369
    halt_wait_ns (cumulative nanoseconds): 416092704390
vcpu (qom path: /machine/unattached/device[4])
  provider: kvm
    exits (cumulative): 52550
    halt_wait_ns (cumulative nanoseconds): 419637402657

- Display all VM stats for provider KVM:

(qemu) info stats * vm kvm
vm
  provider: kvm
    max_mmu_page_hash_collisions (peak): 0
    max_mmu_rmap_size (peak): 0
    nx_lpage_splits (instant): 51
...

Signed-off-by: Mark Kanda <mark.kanda@oracle.com>
---
 hmp-commands-info.hx  |  28 ++++
 include/monitor/hmp.h |   2 +
 monitor/hmp-cmds.c    | 288 ++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 318 insertions(+)

diff --git a/hmp-commands-info.hx b/hmp-commands-info.hx
index e90f20a107..7365a8e002 100644
--- a/hmp-commands-info.hx
+++ b/hmp-commands-info.hx
@@ -879,3 +879,31 @@ SRST
   ``info sgx``
     Show intel SGX information.
 ERST
+
+    {
+        .name       = "stats",
+        .args_type  = "names:s?,paths:s?,provider:s?",
+        .params     = "[names] [paths] [provider]",
+        .help       = "show statistics; optional comma separated names, "
+	              "vcpu qom paths, and provider",
+        .cmd        = hmp_info_stats,
+    },
+
+SRST
+  ``stats``
+    Show stats
+ERST
+
+    {
+        .name       = "stats-schemas",
+        .args_type  = "provider:s?",
+        .params     = "[provider]",
+        .help       = "show statistics schema for each provider",
+        .cmd        = hmp_info_stats_schemas,
+    },
+
+SRST
+  ``stats-schemas``
+    Show stats per schema
+ERST
+
diff --git a/include/monitor/hmp.h b/include/monitor/hmp.h
index 96d014826a..a748511105 100644
--- a/include/monitor/hmp.h
+++ b/include/monitor/hmp.h
@@ -133,5 +133,7 @@ void hmp_info_dirty_rate(Monitor *mon, const QDict *qdict);
 void hmp_calc_dirty_rate(Monitor *mon, const QDict *qdict);
 void hmp_human_readable_text_helper(Monitor *mon,
                                     HumanReadableText *(*qmp_handler)(Error **));
+void hmp_info_stats(Monitor *mon, const QDict *qdict);
+void hmp_info_stats_schemas(Monitor *mon, const QDict *qdict);
 
 #endif
diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
index 8c384dc1b2..19b2a585d6 100644
--- a/monitor/hmp-cmds.c
+++ b/monitor/hmp-cmds.c
@@ -2178,3 +2178,291 @@ void hmp_info_memory_size_summary(Monitor *mon, const QDict *qdict)
     }
     hmp_handle_error(mon, err);
 }
+
+static void print_stats_schema_value(Monitor *mon, StatsSchemaValue *value)
+{
+    monitor_printf(mon, "    %s (%s", value->name, StatType_str(value->type));
+
+    if (value->unit == STAT_UNIT_SECONDS &&
+        value->exponent >= -9 && value->exponent <= 0 &&
+        value->exponent % 3 == 0 && value->base == STAT_BASE_POW10) {
+
+        const char *si_prefix[] = { "", "milli", "micro", "nano" };
+        monitor_printf(mon, " %s", si_prefix[value->exponent / -3]);
+
+    } else if (value->unit == STAT_UNIT_BYTES &&
+        value->exponent >= 0 && value->exponent <= 40 &&
+        value->exponent % 10 == 0 && value->base == STAT_BASE_POW2) {
+
+        const char *si_prefix[] = {
+            "", "kilo", "mega", "giga", "tera" };
+        monitor_printf(mon, " %s", si_prefix[value->exponent / 10]);
+
+    } else if (value->exponent) {
+        /* Print the base and exponent as "x <base>^<exp>" */
+        monitor_printf(mon, " x %s^%d", StatBase_str(value->base),
+                       value->exponent);
+    }
+
+    /* Don't print "none" unit type */
+    monitor_printf(mon, "%s)", value->unit == STAT_UNIT_NONE ?
+                   "" : StatUnit_str(value->unit));
+}
+
+static StatsSchemaValueList *find_schema_value_list(
+    StatsSchemaProviderList *list, StatsProvider provider)
+{
+    StatsSchemaProviderList *schema_provider_list;
+
+    for (schema_provider_list = list;
+         schema_provider_list;
+         schema_provider_list = schema_provider_list->next) {
+        if (schema_provider_list->value->provider == provider) {
+            return schema_provider_list->value->stats;
+        }
+    }
+    return NULL;
+}
+
+static void print_stats_results_entry_list(Monitor *mon, StatsTarget type,
+                                           StatsResultsEntryList *list,
+                                           StatsSchemaProviderList *schema)
+{
+    StatsResultsEntryList *results_entry_list;
+
+    for (results_entry_list = list;
+         results_entry_list;
+         results_entry_list = results_entry_list->next) {
+
+        StatsResultsEntry *results_entry = results_entry_list->value;
+        monitor_printf(mon, "  provider: %s\n",
+                       StatsProvider_str(results_entry->provider));
+
+        /* Find provider schema */
+        StatsSchemaValueList *schema_value_list =
+            find_schema_value_list(schema, results_entry->provider);
+        StatsList *stats_list;
+
+        for (stats_list = results_entry->stats;
+             stats_list;
+             stats_list = stats_list->next,
+                 schema_value_list = schema_value_list->next) {
+
+            Stats *stats = stats_list->value;
+            StatsValue *stats_value = stats->value;
+            StatsSchemaValue *schema_value = schema_value_list->value;
+
+            /* Find schema entry */
+            while (!g_str_equal(stats->name, schema_value->name)) {
+                if (!schema_value_list->next) {
+                    monitor_printf(mon, "failed to find schema entry for %s\n",
+                                   stats->name);
+                    return;
+                }
+                schema_value_list = schema_value_list->next;
+                schema_value = schema_value_list->value;
+            }
+
+            print_stats_schema_value(mon, schema_value);
+
+            if (stats_value->type == QTYPE_QNUM) {
+                monitor_printf(mon, ": %ld\n", stats_value->u.scalar);
+            } else if (stats_value->type == QTYPE_QDICT) {
+                uint64List *list;
+                int i;
+
+                monitor_printf(mon, ": ");
+                for (list = stats_value->u.list.list, i = 1;
+                     list;
+                     list = list->next, i++) {
+                    monitor_printf(mon, "[%d]=%ld ", i, list->value);
+                }
+                monitor_printf(mon, "\n");
+            }
+        }
+    }
+}
+
+static const char wildcard[] = "*";
+static StatsFilter *stats_filter(StatsTarget target, const char *name,
+                                 StatsProvider provider)
+{
+    StatsFilter *filter = g_malloc0(sizeof(*filter));
+    filter->target = target;
+
+    switch (target) {
+    case STATS_TARGET_VM:
+        if (name && !g_str_equal(name, wildcard)) {
+            filter->u.vm.fields = strList_from_comma_list(name);
+            filter->u.vm.has_fields = true;
+        }
+        if (provider != STATS_PROVIDER__MAX) {
+            filter->u.vm.provider = provider;
+            filter->u.vm.has_provider = true;
+        }
+        break;
+    case STATS_TARGET_VCPU:
+        if (name && !g_str_equal(name, wildcard)) {
+            filter->u.vcpu.fields = strList_from_comma_list(name);
+            filter->u.vcpu.has_fields = true;
+        }
+        if (provider != STATS_PROVIDER__MAX) {
+            filter->u.vcpu.provider = provider;
+            filter->u.vcpu.has_provider = true;
+        }
+        break;
+    default:
+        break;
+    }
+    return filter;
+}
+
+void hmp_info_stats(Monitor *mon, const QDict *qdict)
+{
+    const char *names = qdict_get_try_str(qdict, "names");
+    const char *paths = qdict_get_try_str(qdict, "paths");
+    const char *provider = qdict_get_try_str(qdict, "provider");
+
+    StatsProvider stats_provider = STATS_PROVIDER__MAX;
+    StatsTarget target;
+    Error *err = NULL;
+
+    if (provider) {
+        for (stats_provider = 0; stats_provider < STATS_PROVIDER__MAX;
+             stats_provider++) {
+            if (g_str_equal(StatsProvider_str(stats_provider), provider)) {
+                break;
+            }
+        }
+        if (stats_provider == STATS_PROVIDER__MAX) {
+            monitor_printf(mon, "invalid stats filter provider %s\n",
+                           provider);
+            goto exit;
+        }
+    }
+
+    for (target = 0; target < STATS_TARGET__MAX; target++) {
+        StatsResults *stats_results = NULL;
+        StatsSchemaResult *schema_results = NULL;
+        StatsFilter *filter = stats_filter(target, names, stats_provider);
+
+        switch (target) {
+        case STATS_TARGET_VM:
+            if (paths && !g_str_equal(paths, wildcard) &&
+                !g_str_equal(paths, StatsTarget_str(STATS_TARGET_VM))) {
+                break;
+            }
+            stats_results = qmp_query_stats(filter, &err);
+            schema_results =
+                qmp_query_stats_schemas(provider ? true : false,
+                                        stats_provider, &err);
+
+            if (!stats_results->u.vm.list) {
+                break;
+            }
+            monitor_printf(mon, "%s\n", StatsTarget_str(STATS_TARGET_VM));
+            print_stats_results_entry_list(mon, STATS_TARGET_VM,
+                                           stats_results->u.vm.list,
+                                           schema_results->vm);
+            break;
+        case STATS_TARGET_VCPU:
+            if (paths && !g_str_equal(paths, wildcard) &&
+                !g_str_equal(paths, StatsTarget_str(STATS_TARGET_VCPU))) {
+                /* apply filter for specified paths */
+                filter->u.vcpu.paths = strList_from_comma_list(paths);
+                filter->u.vcpu.has_paths = true;
+            }
+
+            stats_results = qmp_query_stats(filter, &err);
+            schema_results =
+                qmp_query_stats_schemas(provider ? true : false,
+                                        stats_provider, &err);
+
+            VCPUResultsEntryList *results_entry_list;
+            for (results_entry_list = stats_results->u.vcpu.list;
+                 results_entry_list;
+                 results_entry_list = results_entry_list->next) {
+                monitor_printf(mon, "%s (qom path: %s)\n",
+                               StatsTarget_str(STATS_TARGET_VCPU),
+                               results_entry_list->value->path);
+                print_stats_results_entry_list(mon, STATS_TARGET_VCPU,
+                                               results_entry_list->value->list,
+                                               schema_results->vcpu);
+            }
+            break;
+        default:
+            break;
+        }
+        qapi_free_StatsFilter(filter);
+        qapi_free_StatsSchemaResult(schema_results);
+        qapi_free_StatsResults(stats_results);
+    }
+
+exit:
+    if (err) {
+        monitor_printf(mon, "%s\n", error_get_pretty(err));
+        error_free(err);
+    }
+}
+
+static void print_stats_schema_list(Monitor *mon, StatsSchemaProviderList *list)
+{
+    StatsSchemaProviderList *schema_provider_list;
+
+    for (schema_provider_list = list;
+         schema_provider_list;
+         schema_provider_list = schema_provider_list->next) {
+
+        StatsSchemaProvider *schema_provider =
+            schema_provider_list->value;
+        monitor_printf(mon, "  provider: %s\n",
+                       StatsProvider_str(schema_provider->provider));
+
+        StatsSchemaValueList *schema_value_list;
+        for (schema_value_list = schema_provider->stats;
+             schema_value_list;
+             schema_value_list = schema_value_list->next) {
+
+            StatsSchemaValue *schema_value = schema_value_list->value;
+            print_stats_schema_value(mon, schema_value);
+            monitor_printf(mon, "\n");
+        }
+    }
+}
+
+void hmp_info_stats_schemas(Monitor *mon, const QDict *qdict)
+{
+    const char *provider = qdict_get_try_str(qdict, "provider");
+    StatsProvider stats_provider = STATS_PROVIDER__MAX;
+    StatsSchemaResult *schema_result;
+    Error *err = NULL;
+
+    if (provider) {
+        for (stats_provider = 0; stats_provider < STATS_PROVIDER__MAX;
+             stats_provider++) {
+            if (g_str_equal(StatsProvider_str(stats_provider), provider)) {
+                break;
+            }
+        }
+        if (stats_provider == STATS_PROVIDER__MAX) {
+            monitor_printf(mon, "invalid stats filter provider %s\n", provider);
+            return;
+       }
+    }
+
+    schema_result =
+        qmp_query_stats_schemas(provider ? true : false, stats_provider, &err);
+
+    if (err) {
+        monitor_printf(mon, "%s\n", error_get_pretty(err));
+        error_free(err);
+        return;
+    }
+
+    monitor_printf(mon, "%s\n", StatsTarget_str(STATS_TARGET_VM));
+    print_stats_schema_list(mon, schema_result->vm);
+    monitor_printf(mon, "%s\n", StatsTarget_str(STATS_TARGET_VCPU));
+    print_stats_schema_list(mon, schema_result->vcpu);
+
+    qapi_free_StatsSchemaResult(schema_result);
+}
-- 
2.27.0


