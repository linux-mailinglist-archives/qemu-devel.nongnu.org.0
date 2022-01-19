Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB2864942A0
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Jan 2022 22:51:27 +0100 (CET)
Received: from localhost ([::1]:34654 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAIrV-0002kT-O7
	for lists+qemu-devel@lfdr.de; Wed, 19 Jan 2022 16:51:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58082)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nAIix-0007d7-6J
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 16:42:38 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:38828)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nAIit-0007H0-Ty
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 16:42:34 -0500
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20JJXoEm032613; 
 Wed, 19 Jan 2022 21:42:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : content-type : content-transfer-encoding :
 mime-version; s=corp-2021-07-09;
 bh=dyWplkGsMn9ULuUq0iexMLNiaHFr0c6f8czUHH+U+aQ=;
 b=ywcPAl33kTjYAA8jKvUYgs6DSiUx3//Y6pFmmAw8nuHL6YkMEEcO4sTfumk5pGUfInk6
 O8VfmPdTLrarMF4POenWQmGubDpDoWSbICQwwuDHIkSYcoed8Tfb8EuwrkA4BFx4YltP
 HY+hHaB6vfZdpsQayaBA5UaDrp9jwyPegLkt80duTqU2E/en/kwGJzKR35Edc4/nU/zR
 n5Gwi81Bs4LBnjs+xmU++aPVn9L7nUi+JfMENZdX+oBVTSzIszG1KNiROWhZTYjqXjWD
 GNka5UL3Yd/qIKJ3L61b5C/+nhF+FEsL21YQMzBcRCxj0lvmEhsgKtjAskG9zk+/jzxd LA== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 3dnc4q6hwh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 19 Jan 2022 21:42:20 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 20JLa6fx131728;
 Wed, 19 Jan 2022 21:42:19 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2177.outbound.protection.outlook.com [104.47.59.177])
 by userp3020.oracle.com with ESMTP id 3dkqqr64c6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 19 Jan 2022 21:42:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IqUne23E41W+EZ5QJPUQpwaJKpu67VWAAuE6cyfulMPfLpQGtL1/mDU9gPRa/W9HbSz86J15Q1+noux5UKICw0IIYIiov0wCbXhb+5y7vYsYsaArE0VGkzrn/85JAZkHV+SqnJsX+S9iw83EisLDRWCy5L0sjLFgxd9p8rOzRELM/GtK/jQ+fRS/+HuXyQjRLnQ+0PijD12x+1V2KX60nfQRmX0pOXtmK0amitfnupF0nN2D0VU3GWulm1Fkx25ej/FiFRzqumHUYpwBl8euaijafoB90NWpxqTTpjEbtCbjS5xMMeYfyv2UvBGyBadRjIZ6TPhLjaYMiFRHnY0XJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dyWplkGsMn9ULuUq0iexMLNiaHFr0c6f8czUHH+U+aQ=;
 b=hq6Cz2rvLw0CsfakPAhSTYkZrpuLCh4k9NeR3ft2IG9ImXVAP5IK5hd2lN92YRyDDfbeaGUqr3Gim8+a3LOpeUuwsQ1PJISQu3MdAVsrvvWeNi73svwznT8SWw7xpGonuZ39pJOY+p5idA2MpFX4RRfd3TG7sRf74GXXXI8qeYQ61PRu/6tzYVDrn65n2NyKy3sK3IOT3z5jzgBRkx0gjg8cCJKrGqyEMt4UV/eZddecIVKVrkQ/6BNyqEygFxFHTcZReQ9lrnsO6KX52QA/0Z5Erg+Wip3M6D8WXzP/rKIsi8RpWq1tz8Ad0I+127hCsHSPgkpz3AmLPHl3mZo/eQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dyWplkGsMn9ULuUq0iexMLNiaHFr0c6f8czUHH+U+aQ=;
 b=Q5WOtdPz+HvYut6kosX+Og3H7XbQxEp6Fba4eiseliuCS9l8coqMoOhxLrnJE7WMLbps6qrlMDP/NDSup+paVGVq8d2QzL6Uckt9THesrEvPRzbu6A/KQoQ+LW9d4hAH0sKzsHRUK5yPxWlctN0l791Gb8NSOpi9dBt0QmNF3vo=
Received: from MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 by SA1PR10MB5887.namprd10.prod.outlook.com (2603:10b6:806:22b::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.7; Wed, 19 Jan
 2022 21:42:17 +0000
Received: from MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::98b1:4348:5117:5fc]) by MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::98b1:4348:5117:5fc%7]) with mapi id 15.20.4888.014; Wed, 19 Jan 2022
 21:42:16 +0000
From: Jagannathan Raman <jag.raman@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 00/18] vfio-user server in QEMU
Date: Wed, 19 Jan 2022 16:41:49 -0500
Message-Id: <cover.1642626515.git.jag.raman@oracle.com>
X-Mailer: git-send-email 2.20.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR08CA0043.namprd08.prod.outlook.com
 (2603:10b6:a03:117::20) To MN2PR10MB4013.namprd10.prod.outlook.com
 (2603:10b6:208:185::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d17bc3b4-114d-4c19-ae8f-08d9db948ffe
X-MS-TrafficTypeDiagnostic: SA1PR10MB5887:EE_
X-Microsoft-Antispam-PRVS: <SA1PR10MB5887CDC4B5C8EA665E49CF4990599@SA1PR10MB5887.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Xfs/ZQ9PWj6NGNIZ0oZszp6CEjcx6B726bHQOCRX3CWOCOilMf2JQNeYW/kez+++E3wvPT5vSyymKVpoCS0cdSLVPXgPUF0uD/zQrtgUDImzmW9O5dYz2B0z9cfAp/7F01f7T1v/2Oen3lY2fBqOQxq83gHluI0GKQXtI5qsowaM6U1yaOAmXjrTB8QGFzcTxjZo7/4g7PolV8ROrfvEgkpgjlComFba6JwtS55L3oFjD4KhouxDMgwZMJyTiXtp7E05Itdq2nhafrJPmj+gE8sRuxagjPy01h6wX5fCsdf4xvFYtso5uHxMH5uTp/jjfTkcFOYdmMqhSQ/BIcdDqD5uG6OMmZsui+CkoNlYNQRmbV5JpJoL0Gs3BLw2ehuzViP1jIdAEO+CHH15ERNMP7kgHQZdIWzwRdEXQjwAOpVlf6ni09EL9fGJBhz0WtOIv120nhgUB3rBJGTO8N2CKsREF0cQqnXwuL+eE7UD8/ARPhCdOVcgVlxfYHpZltU9m6yZwv3VY/FF2F+GYzkqyqsdRUC0KUk1FSbHq73/bUzNTJAKyyERIFoH9/3ztAxk1/FTzW43nsPKToMovHgvWOV+hxFkqemiJpzBocaRfAj07CHpBEOOldM0rivuRgW+VoLTTtAZUR1U//5lCmwtMCwobwfWCdbdDrclFF+Z/rsp5KSmy9IZvsvlOR28azuz8AOt39hCLDwb34afUmOvUQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4013.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(5660300002)(186003)(6666004)(6916009)(508600001)(66946007)(66556008)(26005)(7416002)(4326008)(66476007)(86362001)(107886003)(8936002)(38100700002)(38350700002)(8676002)(36756003)(83380400001)(6486002)(2616005)(6512007)(2906002)(6506007)(316002)(52116002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Rk5rYmFWd2x0cTJIRUlFQVFHbGRidTZLeEQ2aDBZdlZqcVp5Tm9IYzVtalFS?=
 =?utf-8?B?YmJLUU9ySVhBTW1oM1lLYlc5Y3JjT0NsS1BhcFZ0a3JiNEMrK1lqcWJXM21O?=
 =?utf-8?B?dW5nUWxwWHJWUGZ4YVNlMjhnMDIrSnhYQ1gzd3QzaUlTSFdVR1NqV21yQ1Fl?=
 =?utf-8?B?MGc5ZmtrcE1POE9rd0hBMm5tWmxmd2hDWjdKRXpqNWFzRnlFVFYzcDFud05I?=
 =?utf-8?B?ZVNIaVE5YlppVEtwc3loSENRMmhsVG43bE9nN3lFNER4R0RzdEt4Qlg1Zitj?=
 =?utf-8?B?eHhlZ051UnBRUFU0cVdPMzUzbWl4QS9NVStKdGdNQWRpY3dTWnZ5OHZBbFlh?=
 =?utf-8?B?SU1mU0tidnh4NHh6ZEl4bUorVVlmUUcyOXBhNGpYOUdlWXNCSlBCU2YrcnZE?=
 =?utf-8?B?TWdFRVlMM29BVGpZcXQyMm1rMnA3cTltaFN6RmNRS3psMmM3RnhkMm5oMitx?=
 =?utf-8?B?b2dWc2NjclFnNjB2Z0xYaTdOdHYzTnNmWExyVnNpWFNrUXpqT1I3SlRrQjQ2?=
 =?utf-8?B?L0lzYTdDenkxOUFHYnJtT1hFb0hYdFNZTTg4dkQrVzVtamtkTUp1cjM2YmhK?=
 =?utf-8?B?M0hjNWU4aUlHME45eUYxZVIxT1lTNVdkVzZ3M2VFcjE0MDRGVkNrWUR6bUcv?=
 =?utf-8?B?Rjd3dzRVbzF1WnY2eGFpdkUxMkx5VlFwNWV4YXhzRWFpYkRMMFV2UEdsOWI3?=
 =?utf-8?B?dHJxM1Z6L2JhVmdFczBYczluaVBRNjZoOWdBY2ZHQ0liUjk0Qy9zR0ppNkpi?=
 =?utf-8?B?Ull3cnRDRlJPMXBSWlFvMHVKclUrSVlqV3ZOdEYxVVVVWEhsK1ZqbVRuaHJq?=
 =?utf-8?B?Q1NiQkdaSHJLTzBycTFGaytiTVZDdUpSTlh6eG9EeFVzeE1wN0pIakVucFRC?=
 =?utf-8?B?TU4rWXB6N3FuS05Xa0o4MHZyUmsxbWhjWE5ZNTkwRW9Xc2c2N3REdnNXcjdZ?=
 =?utf-8?B?eTNxMW5tQnpVUStoVEpyTWFJV0R5dTFscWZ1VTREZ3RnNk9OMXJZMXM3aCtC?=
 =?utf-8?B?Z0Vabm45ejgyK0JadWdPZk0yK2pURk14Rm1VUjhrdS9COXRIV1p2S3YvZE9V?=
 =?utf-8?B?Q0haVXFDK2U0MVFOR21iM2svNjVLb3hUOWVBS1JIYTlRRG9lUU9oeWRBM1px?=
 =?utf-8?B?cXBFOEFOYVk5WUtZS3p5aVkzMHNJT1NJbGJGN3lSLzZWa2EvbGwvMzlwUC90?=
 =?utf-8?B?WWlBZXkzeGN2OG1BelR3R2VZcUZKU2hBVHhZZ0lVWEltRkk0eVYzaXI0VmhZ?=
 =?utf-8?B?dm1pT21QNzZUN0N2T2U2blRlNVhWTTRBdDdwUXk5T1ZFc0VhakdRZ3FNQ3d5?=
 =?utf-8?B?dCtDWGhWZlljTGluN0YvYm53ZjRLc1Exb1YxUVpEUjY4akVWTWNteUdNM0tn?=
 =?utf-8?B?dmh1NytNcGZwYTNlT3JmbnByR2JVNm16M0tGTmVTTkM1c093RkVmN2hTWkta?=
 =?utf-8?B?ZkFWMWVzbmZjdjhUQ2I5bzN1dTR5ZCtFU2tBSUhwZFg3SHk5bXpidWNEV1JE?=
 =?utf-8?B?MHM5NU9yYUNVQTZ6blM0Qm5qajRXS2xvTTV5eVludnU3T3E5OEtFNW5udVF3?=
 =?utf-8?B?WitnbGtvc3VCcW5ONm55VlFtTjMvcHF4bWFycTl5OE9jWE9ORW9VKzBXNXNv?=
 =?utf-8?B?ZnJ5YnB1dVA0QWNPNFpqRVhJV0lTWE45QUtWMTFVWVJwVzdrNGRqVEl2ZGpm?=
 =?utf-8?B?UU56OWhHUU53d2J6TWt5TTVEUm1xTllCZjFVdzIxVWpCL21ycGRhNHBDdzV3?=
 =?utf-8?B?bmpGUHFDQWR6cDBWNVpsb0RLR3pVSWdWME1YTHhpWE1MOG5jRVFCM3N4Znha?=
 =?utf-8?B?N2RrbGprUW1wSDlvVDNaK3drbEtJaXl0M0VGR0pxTzVhMHJaQ29HRjUvT2Fp?=
 =?utf-8?B?Q1RJYWgyendyVitjVFBTYy9vRGkyUjlMVXVybE1aNE5QWGxsQWl1bXdFL04y?=
 =?utf-8?B?YnUrRDZLSTdod2tqdW14cnBISHp1ODgwQis4UUk3U0Z6UVA0anp4MVpDWlpW?=
 =?utf-8?B?NGl2QWp5VDNhYVEwdVAwTFNrMldnUGlHSnF3Ti91Z0Q1citCVk5BRitUUUFl?=
 =?utf-8?B?WU5hc2RhWXcvV1p1RVpsM2JmR3F0czdHRFg4elIwL0RIWFVYVjNBS0NPMEFB?=
 =?utf-8?B?WHFTSkpRd29tcHV5UVlQbDlLVTBBQTJIVU41L0lXWWwvL0d0a21Hd3o5MFJQ?=
 =?utf-8?Q?TKtDOlosLuM53GlhcHnPEKM=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d17bc3b4-114d-4c19-ae8f-08d9db948ffe
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4013.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2022 21:42:16.8986 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HiuEdSN9pGgNSGHuyuoNMfRFAhAbyAOIHPTp1DdGGjZNhZGHzrBNGYRSQQO8G3+b/ZeLzwh+9h9E902qr8rwhQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB5887
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10232
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 phishscore=0
 mlxlogscore=999 malwarescore=0 bulkscore=0 suspectscore=0 spamscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2201190117
X-Proofpoint-GUID: 9MznWntmrWz843D2zQgSC2uuwiKwi8gD
X-Proofpoint-ORIG-GUID: 9MznWntmrWz843D2zQgSC2uuwiKwi8gD
Received-SPF: pass client-ip=205.220.177.32; envelope-from=jag.raman@oracle.com;
 helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: eduardo@habkost.net, elena.ufimtseva@oracle.com, john.g.johnson@oracle.com,
 berrange@redhat.com, bleal@redhat.com, john.levon@nutanix.com, mst@redhat.com,
 armbru@redhat.com, quintela@redhat.com, f4bug@amsat.org,
 marcandre.lureau@gmail.com, stefanha@redhat.com, thanos.makatos@nutanix.com,
 pbonzini@redhat.com, jag.raman@oracle.com, eblake@redhat.com,
 dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

Thank you for taking the time to provide a comprehensive feedback
of the last series of patches. We have addressed all the comments.

We are posting this v5 of the series, which incorporates all the
feedback. Kindly share your feedback for this latest series

We added the following patches to the series:
  - [PATCH v5 03/18] pci: isolated address space for PCI bus
  - [PATCH v5 04/18] pci: create and free isolated PCI buses
  - [PATCH v5 05/18] qdev: unplug blocker for devices
  - [PATCH v5 06/18] vfio-user: add HotplugHandler for remote machine
  - [PATCH v5 07/18] vfio-user: set qdev bus callbacks for remote machine

We made the following changes to the existing patches:

[PATCH v5 09/18] vfio-user: define vfio-user-server object
  - renamed object class member 'daemon' as 'auto_shutdown'
  - set VfioUserServerProperties version to 6.3
  - use SocketAddressType_str to compose error message
  - refuse setting 'socket' and 'device' properties after server starts
  - added VFU_OBJECT_ERROR macro to report error

[PATCH v5 10/18] vfio-user: instantiate vfio-user context
  - set error variable to NULL after transferring ownership with
    error_propagate()

[PATCH v5 11/18] vfio-user: find and init PCI device
  - block hot-unplug of PCI device when it is attached to the server object

[PATCH v5 12/18] vfio-user: run vfio-user context
  - emit a hangup event to the monitor when the client disconnects
  - reset vfu_poll_fd member and disable FD handler during finalize
  - add a comment to explain that attach could block
  - use VFU_OBJECT_ERROR instead of setting error_abort

[PATCH v5 14/18] vfio-user: handle DMA mappings
  - use pci_address_space() to access device's root memory region
  - given we're using one bus per device, mapped memory regions get
    destroyed automatically when device is unplugged

[PATCH v5 15/18] vfio-user: handle PCI BAR accesses
  - use pci_isol_as_io() & pci_isol_as_mem() to access the device's
    PCI/CPU address space. This simultaneously fixes the AddressSpace
    issue noted in the last review cycle

[PATCH v5 16/18] vfio-user: handle device interrupts
  - setting own IRQ handlers for each bus
  - renamed vfu_object_dev_table to vfu_object_dev_to_ctx_table
  - indexing into vfu_object_dev_to_ctx_table with device's
    address pointer instead of devfn
  - not looking up before removing from table

[PATCH v5 17/18] vfio-user: register handlers to facilitate migration
  - use VFU_OBJECT_ERROR instead of setting error_abort

We dropped the following patch from previous series:
  - vfio-user: IOMMU support for remote device

Thank you very much!

Jagannathan Raman (18):
  configure, meson: override C compiler for cmake
  tests/avocado: Specify target VM argument to helper routines
  pci: isolated address space for PCI bus
  pci: create and free isolated PCI buses
  qdev: unplug blocker for devices
  vfio-user: add HotplugHandler for remote machine
  vfio-user: set qdev bus callbacks for remote machine
  vfio-user: build library
  vfio-user: define vfio-user-server object
  vfio-user: instantiate vfio-user context
  vfio-user: find and init PCI device
  vfio-user: run vfio-user context
  vfio-user: handle PCI config space accesses
  vfio-user: handle DMA mappings
  vfio-user: handle PCI BAR accesses
  vfio-user: handle device interrupts
  vfio-user: register handlers to facilitate migration
  vfio-user: avocado tests for vfio-user

 configure                                  |   21 +-
 meson.build                                |   44 +-
 qapi/misc.json                             |   23 +
 qapi/qom.json                              |   20 +-
 include/hw/pci/pci.h                       |   12 +
 include/hw/pci/pci_bus.h                   |   17 +
 include/hw/qdev-core.h                     |   21 +
 include/migration/vmstate.h                |    2 +
 migration/savevm.h                         |    2 +
 hw/pci/msi.c                               |   13 +-
 hw/pci/msix.c                              |   12 +-
 hw/pci/pci.c                               |  186 ++++
 hw/pci/pci_bridge.c                        |    5 +
 hw/remote/machine.c                        |   86 ++
 hw/remote/vfio-user-obj.c                  | 1019 ++++++++++++++++++++
 migration/savevm.c                         |   73 ++
 migration/vmstate.c                        |   19 +
 softmmu/qdev-monitor.c                     |   74 +-
 .gitlab-ci.d/buildtest.yml                 |    2 +
 .gitmodules                                |    3 +
 Kconfig.host                               |    4 +
 MAINTAINERS                                |    3 +
 hw/remote/Kconfig                          |    4 +
 hw/remote/meson.build                      |    3 +
 hw/remote/trace-events                     |   11 +
 meson_options.txt                          |    2 +
 subprojects/libvfio-user                   |    1 +
 tests/avocado/avocado_qemu/__init__.py     |   14 +-
 tests/avocado/vfio-user.py                 |  225 +++++
 tests/docker/dockerfiles/centos8.docker    |    2 +
 tests/docker/dockerfiles/ubuntu2004.docker |    2 +
 31 files changed, 1912 insertions(+), 13 deletions(-)
 create mode 100644 hw/remote/vfio-user-obj.c
 create mode 160000 subprojects/libvfio-user
 create mode 100644 tests/avocado/vfio-user.py

-- 
2.20.1


