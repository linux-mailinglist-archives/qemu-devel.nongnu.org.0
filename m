Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 04C024A4FB4
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Jan 2022 20:49:58 +0100 (CET)
Received: from localhost ([::1]:55606 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEcgW-0002Er-SP
	for lists+qemu-devel@lfdr.de; Mon, 31 Jan 2022 14:49:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37248)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.kanda@oracle.com>)
 id 1nEcaQ-0007OT-ES
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 14:43:38 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:26940)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.kanda@oracle.com>)
 id 1nEcaH-0008Jq-DV
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 14:43:32 -0500
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20VIGFGa010041; 
 Mon, 31 Jan 2022 19:43:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=corp-2021-07-09;
 bh=+Kz8wxEA5aliue5WMIQKItUMUNT4CVt/6+0jLBm3clc=;
 b=mJ61dvbhrXwafymvXzifkK/MN1yL7yGOMmKQU48whGG2lz5pYkkDrHbEUo1cGQ4y9RZp
 ICRjrL/qk5qg7iZ6/wUHIO1s/KYkBbQ5zlm1Atqn2p271CjBWd2QxtMmdlSZRVP8jSio
 fgJYt4kb658PaTQ8IdM1gJPgwIZx646Z3u/SAjw1hQIe6oULY2gn3iJTi39LdyS1ihvP
 pjgauGYUAwfRn/xNZLKlMDKiF2+J4hCEpSkgfh+WDwXUAQNTBAk8oNIvyaZSjh17GcvQ
 VfUacHBO/3YAAdLkwKYyQh4e7mlZuTwVrX71TBP+KcW7ZO42CUdYg43wWS7OyRxC0inp 8g== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 3dxjac0tbs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 31 Jan 2022 19:43:23 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 20VJQEx2005659;
 Mon, 31 Jan 2022 19:43:22 GMT
Received: from nam04-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam08lp2169.outbound.protection.outlook.com [104.47.73.169])
 by userp3020.oracle.com with ESMTP id 3dvy1nd025-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 31 Jan 2022 19:43:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mSDxukGa2CBWCJDQBPEzi/VGpWkRKtQvnSRu7rY4UoPPrss0qJ0AXK0SFZeoNKCu2IYpVkbByJCNfUVLs4n2txivUZYL9dhrntiaRTTyIDdXY9dN9qIu9MotCbW33/q0zSaRkI1ERTB8KZPlP6AfqTxxqnvj4r+33+vTzVOmGWGVatTwwU45ADm5sqiaaAQGVQdMiX+sEygtPFAMS6YH2pq6mds9x6iVYA1fwQehbgLYKKmdutNOjc/8fkoWJf2HUiL3/EuvsXpZRgZQ2yHv9hSQrXSrEce9ujR8XnkIElcT6Od+KAhXRpfqzLrwSOjhuEhFEHm/Ja9i4/Kfnz9XDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+Kz8wxEA5aliue5WMIQKItUMUNT4CVt/6+0jLBm3clc=;
 b=Oc+LUgrZvpSermPeqeDuvRgGXj7APvKfugWh3nij/ra3h/W1pkBJ5tSekjMPeHxVx9DQe8ed2enQUddApAK3/RvyYtlUfaGLH/RzM6fKELuZEPE51gHaqHv/SW4gOD+bSfclg+eDKe44ZtCDt8K1X1Hfb+IfSgPOJ892/Y2qKJPA9XE8eHuzFTObWanrrcVQ+gHhuz5d6rOu/2kKEvONY/qRF3VL4LITVzSnnXlsPWhZ2B7PNdyIeDRxoobujzeNM+dcdnhyIivJgJdTOmA1DznH1gTlZQOMlc+F2R2CTSyLVa52U7uemLwg8luPPCTxlHzMaFriGqSHK4Iuj+CETQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+Kz8wxEA5aliue5WMIQKItUMUNT4CVt/6+0jLBm3clc=;
 b=dZBIxvmQZ98/ELWYukw8fdHqWvgvM7d19jLccWW1lLleF116tuACwGrVfPUMIWpn4B2rEgmUQyp3RX844bFRxQcYMZ/SjrxFJ5yovWs0iQ15hiPsWSW3dp2PfMJ2GL52G6QOHF1SS5ed9+wmqEEBu0/NQgiC0YwL2XdSoQRmwI4=
Received: from SA1PR10MB5841.namprd10.prod.outlook.com (2603:10b6:806:22b::16)
 by BLAPR10MB5362.namprd10.prod.outlook.com (2603:10b6:208:333::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.19; Mon, 31 Jan
 2022 19:43:19 +0000
Received: from SA1PR10MB5841.namprd10.prod.outlook.com
 ([fe80::58ef:3181:b9d4:b716]) by SA1PR10MB5841.namprd10.prod.outlook.com
 ([fe80::58ef:3181:b9d4:b716%5]) with mapi id 15.20.4930.021; Mon, 31 Jan 2022
 19:43:19 +0000
From: Mark Kanda <mark.kanda@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 0/3] Support fd-based KVM stats
Date: Mon, 31 Jan 2022 13:43:09 -0600
Message-Id: <20220131194312.1192626-1-mark.kanda@oracle.com>
X-Mailer: git-send-email 2.27.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SA9P221CA0008.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:806:25::13) To SA1PR10MB5841.namprd10.prod.outlook.com
 (2603:10b6:806:22b::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3de7ee6e-7122-4467-0a42-08d9e4f1eea7
X-MS-TrafficTypeDiagnostic: BLAPR10MB5362:EE_
X-Microsoft-Antispam-PRVS: <BLAPR10MB5362C6E2ED9EB91B936C0429F9259@BLAPR10MB5362.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bFalwLsPjXZcpQI9cwGyndDSgi3DIcGxicJT7dUElhffGvdCzDZF2pTEVkwI4eN4oREuOOWhZzHT5mJaQ7sTxjtFmxeypcJkKYPt/Xjbc6b8cGRA1eRkCioBX7rU8Z4UU+h5S4msJxOBz3sevqCUhVLEv6FxDH8ADp9eeoWepI1YCD1HiLK68hPew4loGiIGG47M7XZIC4OHp7DB5G27AoySrBSLYxXswkpqbNtoM+g6WUm/YCwaCEpzV008hzw1qeoPxebOtWX0lDL38L2OC3aPO1AANmCXszyxwjBR7G1Cam5IUPZuH9BvVo+FneYepHQXb5PZM0lHB0hnBZCoCxbeyTAFse2SlZ9Dky3JrUuj8T+CHmBn+b0zpMDkVizgjt4ZpDaPZOuwEDRs1gcLvU5Ju1hFzDSFb4VC2DCGBbpbQ8Ls/5c4Nwh468i8Rz+/gP5VvL9keDC9NQhgIarGXUNeGxMtKcOyi+hwhWRGfUIKC1ULtkDlxifDhhSmgGDKP0Egcn0gexiPy6/hhPGauO9FJ4duH26oKIwy+1Ms8SouCiH7BCagocyLnpwpE00zo0Ow/v36OED7Nh4hkjRAl+XUs/LFgfIZkuTbZ8ubLavwGZ+XCq0HwSEp6kG3BVknlTxldnjuCGlMzU3JUDJ1XipZJvm7EyWQGTjx9JmSq2VJz7vsRvdd0wOBvaMF4JS8i9RGhnAZETSB5rwlmtw2mJ1HaKI+fFjFXXFaa2MYMhB+6Ofso9IgqZAsRAAoDo2zZqZKNJQYYhALRsCRpxMLYM0ozjTklOKzhRHMwBZXF88=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR10MB5841.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(26005)(508600001)(186003)(36756003)(107886003)(1076003)(2616005)(316002)(6916009)(52116002)(6506007)(6666004)(6486002)(2906002)(86362001)(4326008)(8936002)(8676002)(966005)(6512007)(44832011)(5660300002)(66556008)(66476007)(38350700002)(38100700002)(66946007)(20210929001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?kTPWCtLB1qzM5sI6osqguRtuFnyyP2a5m5FzFNT92N8tYHt44XQ+YPhL1+Z1?=
 =?us-ascii?Q?LixOQJm6NmU4rzet+rrVvj0EIyXLOU9JU1cyQDAiRppu0gsIyU1pdssbixQB?=
 =?us-ascii?Q?riSGDvUnU49NqQsH2OLXcJcW0kLqH0CrsPpau/w7WNgLQnTR2nCO6xymdsxV?=
 =?us-ascii?Q?kMiJiJ5YE4L9NCnwQFl0leFqEfajSDGYZKralTZ/AUtFUkcM4/u3FJvgRdKd?=
 =?us-ascii?Q?Oc3/XipAu4KnRsyoG2T18qdfY/yAdDYhMFZE15A39d/tpzYQjZ1wDs1LPlJa?=
 =?us-ascii?Q?oXwaGYEb5drfj+rKDoKi87477YZot911Y0bFaI0LYvgEnmUZYin3bQ6JfHzi?=
 =?us-ascii?Q?HvmtqREwcXKiwGl0Fvrwyi9HGNPsDS0iVjazCfFUGBMNNnq+dYBOwSVoptLi?=
 =?us-ascii?Q?rodBa7OFfftQTUMXTRMICn89iq0GIayjcEI1jr68P4HSyrkINhB7KE5WRAql?=
 =?us-ascii?Q?vk9jDpG2xBrhtteGl4WsHY8kCOLpzX5owvLBV3Fnq8gszvcmibF2L/+mDU1S?=
 =?us-ascii?Q?IEJa0IH0LxRY2heW6TD1RIuEQNjbexuDrVQRPPA2I8TPlto9tuKanajH9oSi?=
 =?us-ascii?Q?yU6HjRdbt1Jw9HPayCRHAC/WgPJ9fk8WxusPxoBwy/i25Wk50mEbhoiFR3Pd?=
 =?us-ascii?Q?MS/8qfxRFB9fE9tMM0WVG1uH4VcEE9kE5zreSPB72PRRLsAVMLtabsLovjSb?=
 =?us-ascii?Q?iIO4C32YzyQ2Kj8b2RPMJpb9FZKo03qPr8N+YgzEPQTMSWXbWSjkF0wyQKxL?=
 =?us-ascii?Q?B6zkUGSlnErv3Mvubz21y0JE9qn5j0V4IQwzTHRo00pQYA0fPes7jdV6PTn6?=
 =?us-ascii?Q?p63F83zxj7pQmbTU9/iY5wzWIaPVAHekTH1c76/Dr84YeStjMw71MdID/Up3?=
 =?us-ascii?Q?rrvJ+rgmORLSPUDnT+dnwT2rF45gyKqJ6vLRz7My5f4zYP1bl3HUw+gSgwTR?=
 =?us-ascii?Q?SJkVLaryvhfMaLaRAIA+LzIJQevfMvM4yzcXhpjpg2Wx+fbEIDz+0Lj4ABHf?=
 =?us-ascii?Q?vpH/Rp3vph6biPWhpFGEpKJjtXbe5TaTEZJDjkFzChfjHFzCY4y8dwlxuUcx?=
 =?us-ascii?Q?UEPYzRUgLuuq0/jNDbN1toPzZT2QFgjE7FUvRmqpCEBXqd7l0sKuq4qXa+1g?=
 =?us-ascii?Q?hB/vWO7vjg8+iaakw8c3qolYk/lzGZSZtFSaa2WBG+XvhXemuKmhCJQj+WMn?=
 =?us-ascii?Q?aurqA8Tn+dqShBAlx+3oftW9BBnDvNJc4/OUw+6zUw9thhw0E4iRSuAowWX5?=
 =?us-ascii?Q?ZEYZm5KGO74YlC4vvZwQ8sbjBbcJNTcNloVrrErUCNCbJSiHP+F1ygBtWisT?=
 =?us-ascii?Q?mlzBc0g6BxlxdYgrOrQCEJJ251tprjqg1lo+Xjk1fmYH9UmRn8D3tFZgotug?=
 =?us-ascii?Q?1Thsw7bFcidWZlt8nqMeyFbrfBlBn+q/qQKjr4pR82fi/d0gAw31zbjSM6oi?=
 =?us-ascii?Q?a4jIlKJ3bMakf4cNrtOxO7JtfsciIbhOM+LxcOVDTf/PeIHNAMI8L3/4qE0s?=
 =?us-ascii?Q?YVJA/kEkY0cOVfT6zgyWzhK30xqXtVYaKm1rqCjZmBlU9BziMG1XHH0Unzrd?=
 =?us-ascii?Q?1vaOx6qxdUEUEVYxgGRCUnf8vJl8VxppRrrBry8OslEjSrENHOjmYWUxYU3I?=
 =?us-ascii?Q?y+oRyzh3jOPfWuyYFNOvSzY=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3de7ee6e-7122-4467-0a42-08d9e4f1eea7
X-MS-Exchange-CrossTenant-AuthSource: SA1PR10MB5841.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2022 19:43:19.3217 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z2bnvZ4TLwrXh1QW9uu86xadM8sB9cXSZ1zxL2QYQ2jNO1zvV4mY67EaW6Y6nV30bqaLkYpFXWwS61CF2Y4Y5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB5362
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10244
 signatures=673430
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 mlxscore=0 spamscore=0
 bulkscore=0 adultscore=0 mlxlogscore=933 phishscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2201310125
X-Proofpoint-GUID: RdCeK7RNyCVdIr0V8cGR__0pcGYRTBr-
X-Proofpoint-ORIG-GUID: RdCeK7RNyCVdIr0V8cGR__0pcGYRTBr-
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

v3:
- various QMP API enhancements from v2 review [1] [Daniel, Paolo, Igor]
- general cleanup

v2: [Paolo]
- generalize the interface
- add support for querying stat schema and instances
- add additional HMP semantic processing for a few exponent/unit
   combinations (related to seconds and bytes)

This patchset adds QEMU support for querying fd-based KVM stats. The
kernel support was introduced by:

cb082bfab59a ("KVM: stats: Add fd-based API to read binary stats data")

[1] https://lore.kernel.org/all/20211119195153.11815-1-mark.kanda@oracle.com/

Mark Kanda (3):
  qmp: Support for querying stats
  hmp: Support for querying stats
  kvm: Support for querying fd-based stats

 accel/kvm/kvm-all.c     | 308 ++++++++++++++++++++++++++++++++++++++++
 hmp-commands-info.hx    |  28 ++++
 include/monitor/hmp.h   |   2 +
 include/monitor/stats.h |  36 +++++
 monitor/hmp-cmds.c      | 288 +++++++++++++++++++++++++++++++++++++
 monitor/qmp-cmds.c      | 183 ++++++++++++++++++++++++
 qapi/misc.json          | 253 +++++++++++++++++++++++++++++++++
 7 files changed, 1098 insertions(+)
 create mode 100644 include/monitor/stats.h

-- 
2.27.0


