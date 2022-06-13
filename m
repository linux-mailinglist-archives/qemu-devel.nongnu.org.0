Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 60731549F0C
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Jun 2022 22:29:48 +0200 (CEST)
Received: from localhost ([::1]:40616 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o0qh1-0001yq-4O
	for lists+qemu-devel@lfdr.de; Mon, 13 Jun 2022 16:29:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1o0qem-0007OL-0Q
 for qemu-devel@nongnu.org; Mon, 13 Jun 2022 16:27:28 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:15452)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1o0qei-0001pk-Le
 for qemu-devel@nongnu.org; Mon, 13 Jun 2022 16:27:27 -0400
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25DJdW3s004212;
 Mon, 13 Jun 2022 20:26:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=corp-2021-07-09;
 bh=nkZuXrpfCyHU7jl9c/UvdL+k0Mb0MMzEj8LDjaDiWFk=;
 b=vVtM1uHPWx0yujT8hy/CcS/qRwex9gLOpStyG11s9lRn+Sy42OMmS5SzBW4UaBcZf8Fo
 lylUiylFYPJXR86yLAIZx+nksTmFt+hQHtWaA5zEnzS/5xfypw5Qy3lJmFcOX7rHdytJ
 Fjgpxr+fuxl4E5PBX3zlAnJxO+MT+3JXcFTqnPgeUsHwF73yhiMo2kHGONhO5+x8OClK
 TAKEjuqOq3Mo6tDuw4pVEDiAhLYNivu2DBi60l+O/H1uP59tKkFs0MRJKtEjJXOXrdMc
 f3/fEBTFnePtBZJc9rtkgV65aziK7DMWl8TEvOBffyZyXdqXolaqjZBuIXQ1nFClDMbR zg== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3gmhu2m53c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 13 Jun 2022 20:26:46 +0000
Received: from pps.filterd
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 25DKGLFg040875; Mon, 13 Jun 2022 20:26:45 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2049.outbound.protection.outlook.com [104.47.66.49])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id
 3gpc4hr8py-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 13 Jun 2022 20:26:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cdfbLqW/+0OmaZWvjzYK8sgWmTjg1lVyNn3uBet3kAGFg2/hcwX54UMSPXsCMOG0DORtAuW61r/4g5qUpn8VrzUD7qSwy1JA1qDsRgrtHNHPkPxspulQp2yFqkKNk7BnsEx+1ZRgMuasrRi2ymMt30fVNVd/p4EdXfCwTxkgysSdepD86Z/tu66CokSSpSb4321RdE6wXFXKQfeDS78FBigGM2q7I1uAvIKs7/vlris1+/zKEuPnubrDOTaDqgpLeJMkMv4nYqxK5alqodw9ceYUB1tsooma3V/Fg84Jiovsjn1GbTT+oegYv+fTZj3OYlwAdC0IqAGLHN7m21BdQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nkZuXrpfCyHU7jl9c/UvdL+k0Mb0MMzEj8LDjaDiWFk=;
 b=l9gkKtGLuA9gOk6LJ30JBeK81GxAHGNV0dCDwoxLcWPYQm2fhZRMZ0UWyXvFIVx9uajYsFCk0pAQQ6s9DVF2wzag4B1ZZxxDH7xIczQslMqw0ZtQyvmGCXYqGl98c7KmnsSC0W35/pukjEI2h5VLY4sR1i1Q9xnr24f6Tu+2CCAFIpMPcGOFjV0H/Q8vzM675xicGs6xVgyPySkewRemaBxANs3mFMaozmlsn9ox55NizFOB4VZ6BCEsSKgwSbPZzqQAHhdjEbEKN/QDBKHD/oyGKxBLDrU2cLbBtSfZmGtRyWc/XXb2GN4AiZj81K5azT7p8dWpPM1M0zOpxiYOig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nkZuXrpfCyHU7jl9c/UvdL+k0Mb0MMzEj8LDjaDiWFk=;
 b=gaJtIsy7Aqa1NymBIEm4285YDnb/pJAhTr7hPJww830Th4WBgIfU3ehBdQZ3skWRioLGzYKMu5iw5OKybLfOXUg52ebuJLOrYIZIq8huubvxDpF9BVhSYMEcLZdYvBEawc6201KpIzhEEi+IMUWhX/O34O6decuSzNikIlg23NA=
Received: from MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 by PH7PR10MB5723.namprd10.prod.outlook.com (2603:10b6:510:127::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.12; Mon, 13 Jun
 2022 20:26:43 +0000
Received: from MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::e9cb:e1ca:8189:f191]) by MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::e9cb:e1ca:8189:f191%7]) with mapi id 15.20.5332.020; Mon, 13 Jun 2022
 20:26:43 +0000
From: Jagannathan Raman <jag.raman@oracle.com>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com, mst@redhat.com, alex.williamson@redhat.com,
 f4bug@amsat.org, pbonzini@redhat.com, marcandre.lureau@redhat.com,
 thuth@redhat.com, bleal@redhat.com, berrange@redhat.com,
 peter.maydell@linaro.org, eduardo@habkost.net,
 marcel.apfelbaum@gmail.com, eblake@redhat.com, armbru@redhat.com,
 quintela@redhat.com, dgilbert@redhat.com, imammedo@redhat.com,
 peterx@redhat.com, john.levon@nutanix.com, thanos.makatos@nutanix.com,
 elena.ufimtseva@oracle.com, john.g.johnson@oracle.com,
 kanth.ghatraju@oracle.com, jag.raman@oracle.com
Subject: [PATCH v12 00/14] vfio-user server in QEMU
Date: Mon, 13 Jun 2022 16:26:20 -0400
Message-Id: <cover.1655151679.git.jag.raman@oracle.com>
X-Mailer: git-send-email 2.20.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0018.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::23) To MN2PR10MB4013.namprd10.prod.outlook.com
 (2603:10b6:208:185::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a0409d2b-71d1-48e0-12b3-08da4d7b07bb
X-MS-TrafficTypeDiagnostic: PH7PR10MB5723:EE_
X-Microsoft-Antispam-PRVS: <PH7PR10MB5723C24F8F799708E4355B6890AB9@PH7PR10MB5723.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bgrbLkda6WLNiw0GGaAgxUep5WzP94B0xIcShTrv4pSXdCplRf1i9bofwF7uxtZ9KaebUUcX8kNIrwss0lw5FKiUL/TjG8MZrfiUET502YisftkLZL4dvX5Gz3erVldM34wQ5xOCuP4XuWmfU74k0ExrIlBtyxhgsHxfsgAaHZ05/if48uaPf3G2DDWMeVy5Oilz33gqMrE/0B3DVQo4gJz+6V22k3jkvTDo+Dn4WMI1JY6PwLn5msXmlrghu7WWlRmAStEyEu7I3LzOedKZtiHkcRwyOrfAYLig5CLy/x8yIeIX1S47HtdzbEJInbdMQ3qI4DE56jRocdWzeet2xEA3/1R15rsvE7cDIkaEpKLlqJsrfD7ol5PBLSqsCQayk0nqRnPln8RdZhvLMePy6hfFHVmN1uLRGZAyk+pn61yzSTgQC+v9K6zjWDLQq2CDd+IHSI7iV8QxLg8bsDriR/0Nrd956t2+zDEO/k5tJBJuSnSJb7A/PSpfV/pZXFEjB0f/I5ApZ/p90hqlRqn4T16qFA8lUu0g+0I6c8sIiKE1GKPkmhm/6rTV6YuPcYZjzZ2qTw5jauPHLFmPXMD/9Q93YoXA3xf7Bk+OoC+MeC6EObnHmCk07jqmSdkNZZZziUrk8l/eGjAq5swOnG1ZlGAjbIgJO+9Ry0iw4CnvY+Qo8a36q9k61zUJ+Hwg063+I1AoxdAqqiUt3eOjAjatAQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4013.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(366004)(8676002)(36756003)(6486002)(4326008)(6506007)(6666004)(8936002)(5660300002)(38100700002)(508600001)(86362001)(316002)(7416002)(2906002)(107886003)(2616005)(38350700002)(83380400001)(52116002)(66476007)(6512007)(66946007)(186003)(26005)(66556008)(6916009);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5y8OfOrLd9dhcDueFQYfIFCYaCoeRHQOz3qgu75xIGf0lGxfapizDu8YRetf?=
 =?us-ascii?Q?dlvZOMdjsV4m1htRzf4WMDQCu0PRPkqAJ0EJzbjlvmvKI8YbgTsp3uv9MTp4?=
 =?us-ascii?Q?e19h8hEydfUvHgJF9KxvIxPYOCOXRuKtU79IzzKoJoVpZor7xnSmugCuL9gn?=
 =?us-ascii?Q?Aqbqmip98ZNG9eDXoPXF705AvcRrpCV96qcR4Mpj4dbMYyNZz8YmyKxoK6gB?=
 =?us-ascii?Q?1oGxbgo18bmEVwzyDdFNC5Etn/nYzYT6zFBW2TN+j+jMxbsLTAjaIWoCuO3j?=
 =?us-ascii?Q?Ws4BZLLsZD5dLT/H9lH/1eksCMWgN1pPrcRfqZrH4lkA6CSpd2bcDhoh0t6x?=
 =?us-ascii?Q?KhURgEOiwi835okUCbNgM1FOM279sQ03MSP12dSKkM/7OicWvMumSn2FpNNd?=
 =?us-ascii?Q?yr0Pgb01eodtK4AjR1Yf0wtLzVChj7vNwIu1kjPjH6MAgZwDEmH5YxQMYIp9?=
 =?us-ascii?Q?WURV5kipanlXWro3hmvKC1u3U3TvT7NaAKiRSavDev7ibslZWO3GMYBwc796?=
 =?us-ascii?Q?fU9Z02ZOJfTOPPuep5p1y392nVTVN/LxgobYbXTfNh+kqmC8IBJeWAuoCKoj?=
 =?us-ascii?Q?BCK2rLrlSp2pIw/v7HYegKS3Om2ZZnUc1RKqeYd2kWXRcDP5Ys3E9xgWcsYP?=
 =?us-ascii?Q?JpN8TVu6kpnVxFjQxb2JaASxkOiTeMVbGxtZcBw315qUbHCqHRtxNcflUmm4?=
 =?us-ascii?Q?GOoa3L91pZFHIpqqZ21QbKVHjsclhBbc0macn80U2BXh0wR5+7Uv7GLoiwqN?=
 =?us-ascii?Q?S0IyLWXvGXnMnwNGLdPm39MdiQ2dsXHo5sBj33C/aMyPad2Zxr8BFeLqrfK2?=
 =?us-ascii?Q?nhgODfwfM2JFtqEYUgUgqsoECY/03hbORMA+kCzsXlLyijqoz6kGUlZKSZYB?=
 =?us-ascii?Q?rQ7JbRVz5VhK4CHHRk6ntcIgWqpYlzK73WXo+bg4YjaHXlmkQoWDIdCNkCta?=
 =?us-ascii?Q?Q6rFs3SI5lzwxAvDC37ZXb9V2+NLxDZktbAWBqDW354/i8f0kcG39RUnKdTI?=
 =?us-ascii?Q?g7UxFGpCCOk53FeXqmvu6Nq0QxGxLVyitX38FFxjneyk2L9uxaBcLE2NqcTo?=
 =?us-ascii?Q?2x0zmPxHBf08T+SZRyYYVdLJs48mITAjVziT1tlYN+pPix4K/iS8KgW66pKy?=
 =?us-ascii?Q?xOJd6RrvbSOCVknqNLIP5SEYpcPCr3/BhF5DYZInT1Tv4magGrfor8MFQUx1?=
 =?us-ascii?Q?iFSzrv/ZCCHzi3uxKzF2wFi8+oCbJ87FqL/8bTF5Q2X5SbRooI0BPz7wdZxi?=
 =?us-ascii?Q?fc+TzZgwEc1OvWyE2OglCV4C2uuEQRCv3dkoPzz0hanm4rmA7B89Ti7ielJP?=
 =?us-ascii?Q?36Z3YrppLhmSmCNQNjZlZ1OlmoxSRP1OApvijGAT0l4cvjqqqdZxOx7S5cxT?=
 =?us-ascii?Q?wXm5fj0dj9SHpNVs8uhDLKnwbm+hlS4qK8TCA+Cw5a+nK7XAuyauQsAIOtPI?=
 =?us-ascii?Q?2xB2qLI85F6nSKPe/wXqkXTD9D9XhpbJs+1+dSVqUe9NFiPRXCEItz+ywOZF?=
 =?us-ascii?Q?4CJtsyWm8Ux6aMkKpMYtNJhOCEM6xdccq0FgfZw39xbUsUPXSXVLjPGho7d7?=
 =?us-ascii?Q?aOqDMfXG5WQkj9/r5c58+5tow2+K6cxZQ6wdYOmczLrAjC0XQcsHZn+uJIE9?=
 =?us-ascii?Q?bCIVLI+r/J0Vm8W6uMhcJhuTiTaX0gJQ39NizYs5MpEczOwSOJEyf9oTEdT0?=
 =?us-ascii?Q?utWJaXxsEtjwSxQCV4QzGXFohLoEs3jAKUn9JOZiGxYT+aNrmMuN9YsK5sbs?=
 =?us-ascii?Q?DHAFylNivA=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a0409d2b-71d1-48e0-12b3-08da4d7b07bb
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4013.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2022 20:26:43.4862 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fTQNZwqkb0oq5q2CHG6t+U36qZRb4Mz/r8uT14UCGTg6Q2R0CyqZMndg9dhHYK8Yn7NczUtqVmZWqq4qDQQ1FA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB5723
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.517, 18.0.874
 definitions=2022-06-13_08:2022-06-13,
 2022-06-13 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 mlxlogscore=722
 phishscore=0 suspectscore=0 mlxscore=0 spamscore=0 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2206130082
X-Proofpoint-GUID: khSpH2ZVhqGK14yV2N-NhDsWCT2vMfUF
X-Proofpoint-ORIG-GUID: khSpH2ZVhqGK14yV2N-NhDsWCT2vMfUF
Received-SPF: pass client-ip=205.220.177.32; envelope-from=jag.raman@oracle.com;
 helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

This is v12 of the server side changes to enable vfio-user in QEMU.

Thanks so much for reviewing this series and sharing your feedback.

We made the following changes in this series:
[PATCH v12 13/14] vfio-user: handle device interrupts
 - Renamed msi_set_irq_state() and msix_set_irq_state() as
   msi_set_mask() and msix_set_mask() respectively
 - Added missing return statement for error case in msi_set_mask()

Thank you very much!

Jagannathan Raman (14):
  qdev: unplug blocker for devices
  remote/machine: add HotplugHandler for remote machine
  remote/machine: add vfio-user property
  vfio-user: build library
  vfio-user: define vfio-user-server object
  vfio-user: instantiate vfio-user context
  vfio-user: find and init PCI device
  vfio-user: run vfio-user context
  vfio-user: handle PCI config space accesses
  vfio-user: IOMMU support for remote device
  vfio-user: handle DMA mappings
  vfio-user: handle PCI BAR accesses
  vfio-user: handle device interrupts
  vfio-user: handle reset of remote device

 configure                               |  17 +
 meson.build                             |  23 +-
 qapi/misc.json                          |  31 +
 qapi/qom.json                           |  20 +-
 include/exec/memory.h                   |   3 +
 include/hw/pci/msi.h                    |   1 +
 include/hw/pci/msix.h                   |   1 +
 include/hw/pci/pci.h                    |  13 +
 include/hw/qdev-core.h                  |  29 +
 include/hw/remote/iommu.h               |  40 +
 include/hw/remote/machine.h             |   4 +
 include/hw/remote/vfio-user-obj.h       |   6 +
 hw/core/qdev.c                          |  24 +
 hw/pci/msi.c                            |  49 +-
 hw/pci/msix.c                           |  35 +-
 hw/pci/pci.c                            |  13 +
 hw/remote/iommu.c                       | 131 ++++
 hw/remote/machine.c                     |  88 ++-
 hw/remote/vfio-user-obj.c               | 958 ++++++++++++++++++++++++
 softmmu/physmem.c                       |   4 +-
 softmmu/qdev-monitor.c                  |   4 +
 stubs/vfio-user-obj.c                   |   6 +
 tests/qtest/fuzz/generic_fuzz.c         |   9 +-
 .gitlab-ci.d/buildtest.yml              |   1 +
 .gitmodules                             |   3 +
 Kconfig.host                            |   4 +
 MAINTAINERS                             |   5 +
 hw/remote/Kconfig                       |   4 +
 hw/remote/meson.build                   |   4 +
 hw/remote/trace-events                  |  11 +
 meson_options.txt                       |   2 +
 stubs/meson.build                       |   1 +
 subprojects/libvfio-user                |   1 +
 tests/docker/dockerfiles/centos8.docker |   2 +
 34 files changed, 1528 insertions(+), 19 deletions(-)
 create mode 100644 include/hw/remote/iommu.h
 create mode 100644 include/hw/remote/vfio-user-obj.h
 create mode 100644 hw/remote/iommu.c
 create mode 100644 hw/remote/vfio-user-obj.c
 create mode 100644 stubs/vfio-user-obj.c
 create mode 160000 subprojects/libvfio-user

-- 
2.20.1


