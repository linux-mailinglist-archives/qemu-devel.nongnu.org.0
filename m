Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB4895676A9
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jul 2022 20:39:17 +0200 (CEST)
Received: from localhost ([::1]:55378 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8nS8-00066m-NZ
	for lists+qemu-devel@lfdr.de; Tue, 05 Jul 2022 14:39:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37592)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1o8nDn-00073x-P1
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 14:24:29 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:8072)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1o8nDh-0001oo-Kf
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 14:24:26 -0400
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 265HEGhD004798;
 Tue, 5 Jul 2022 18:24:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 from : subject : to : cc : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=wPI5JNoLv2Yd2wh4IjQMUdXwaeie+UN7/OTiOVv8f/Q=;
 b=k3b6EDJIknt83J5jQDlpSFsVjKzU8zlbB2CBuOyKptBwLMj94V7hlbIotoeY0ZUmJXs2
 +pZ6nDW8ercE4OMCE6TTIhVFOp4TBXTe9TJzli3oP3OHaFDmlo7Zdjb8CIdPCNtHHg4L
 UxAHcmSN8gMWwXpmRfNdBsQ/dwf3U5XrOsAEc3azhRKzpK3+R1NIVtCqtJi0Or47qteq
 06AGOU9QNS+ky4DaRUz1YlPXIiHaFgPz/wAZUmrwe1gRajKmxUIsODCduxmr9tMd2Ot4
 EVCR77wopRIPgbHpkvAzwLfDwoTUvkRjEItIDR560VrUbDfW4biNJVlGx6Dc/BfV10yn ag== 
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3h2ct2f0ar-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 05 Jul 2022 18:24:02 +0000
Received: from pps.filterd
 (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 265IBGnS004759; Tue, 5 Jul 2022 18:24:01 GMT
Received: from nam04-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam04lp2042.outbound.protection.outlook.com [104.47.74.42])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id
 3h2cf2knta-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 05 Jul 2022 18:24:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P/fhZXEGBUS6OvlTKwramyG11uUpoueZgl+SNZg++3yZYa++7MJwUk2BKnoHbo+FNZ2/FKMhrv0Q4g972O5UMHtn2HbPvRGAxvLYL1SzB4KUbIAIEnMVP7MaVQSmko17lghjKLXue38nY+ul4z5nl8EqCaIr/OKsuNdNySfRmk3ZIYL3sJVvyqzzDd7GiTJxwGrDSXb3jqvYommIXVXvvRMAxK2sEmlW/LXJL8owRn7Vm4i/+M1tiM0qytuWhkeOzVnrTkgZ+CLm3E+i8fGi3B4+VGaxeCNEyO9Fy6jXe0lEvLuEzVod9hd0CBcf4I/+lcyvs2ihiaMG5Z2Cpdtbxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wPI5JNoLv2Yd2wh4IjQMUdXwaeie+UN7/OTiOVv8f/Q=;
 b=GodPoIB9gGBGh0AyLrVv1OLduFttgbV0WaEOWEDp4uUD6qWFlnVQ+ujU/AJRAMDZijYsFTupYArmv/SAs/rdmpZmQmu3p+OkpmrHA/ZQPLip4yY4gb1OOViaFWfFslgBx+jkUUBfscBOtlujQmIa+U2OJ3h/WtpsuVPb3HFtH6I/N6OD0w6oWzS6VfbPE5Ipzb7Io2K0fS1+edvbVSqUvOGfJbKKu3xbQm9hJ0O9nxde1n2i0on335G6Cl8N+leU4nS/+MNv5MMerKH3pI3bvicKmL/IvXPKAAUDHz84+GdgTUNEqjT+bwtPdL0BYKt14EumAYOrXVJVwBoy9Dv79g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wPI5JNoLv2Yd2wh4IjQMUdXwaeie+UN7/OTiOVv8f/Q=;
 b=mQbtzSYNtDqsJ8fH/+LetjyYatVuOxCny2KxovWhRz8YXrQZ96ErR0xSAJFyj8cAGLnke02SboJvU/RHIccdtfHjCVc4zWWuG4CCBFxgZiCx+/Mva+2mnPiSR7jE3Zw/HpiG3SpKtFo0FtAiGw30K44TqE3YPGhcJfFgV5qmIs0=
Received: from BYAPR10MB3240.namprd10.prod.outlook.com (2603:10b6:a03:155::17)
 by BYAPR10MB3558.namprd10.prod.outlook.com (2603:10b6:a03:122::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.19; Tue, 5 Jul
 2022 18:23:58 +0000
Received: from BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::dc4d:56f4:a55b:4e9]) by BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::dc4d:56f4:a55b:4e9%6]) with mapi id 15.20.5395.021; Tue, 5 Jul 2022
 18:23:58 +0000
Message-ID: <1d1870fc-33e1-044f-9b6c-4c885e4c5864@oracle.com>
Date: Tue, 5 Jul 2022 14:23:52 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
From: Steven Sistare <steven.sistare@oracle.com>
Subject: Re: [PATCH V8 04/39] memory: RAM_ANON flag
To: David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>,
 Jason Zeng <jason.zeng@linux.intel.com>,
 Zheng Chuan <zhengchuan@huawei.com>,
 Mark Kanda <mark.kanda@oracle.com>, Guoyi Tu <tugy@chinatelecom.cn>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philippe.mathieu.daude@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>, John Snow <jsnow@redhat.com>
References: <1655304746-102776-1-git-send-email-steven.sistare@oracle.com>
 <1655304746-102776-5-git-send-email-steven.sistare@oracle.com>
 <cfe42f45-25ef-a3f5-318f-a1f0cd99890e@redhat.com>
Content-Language: en-US
Organization: Oracle Corporation
In-Reply-To: <cfe42f45-25ef-a3f5-318f-a1f0cd99890e@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN7PR04CA0007.namprd04.prod.outlook.com
 (2603:10b6:806:f2::12) To BYAPR10MB3240.namprd10.prod.outlook.com
 (2603:10b6:a03:155::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1afd4e63-085d-4299-fc89-08da5eb386f5
X-MS-TrafficTypeDiagnostic: BYAPR10MB3558:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oVB1m8LrZOt1VA9E6CjyKxKFvDPPZFBJru1R86Q0lMn0IRDy++Qrrp6D95NKmUSxZxmselkOeBbfj0UIUIpEp67XpgwBypoEuQN3zr2/n0aRi1sjCxbyBgfKx9ONHUNhQQdcPktp0gRPTw+TVThp0ZJVctIAyK5R5TsS7ax7hPf0L/tdtPNU7qtoDZtE+egfYIcB870TRPWMCrlqe6NWfPA1/57JcI8HBhUgN1E3tGCigUzWR5zJWsV4R9FAayszsZd1htqcFCo2UmmnZAbC/XrcseA1L02Wk1GiyfpTVTaedSo1OfxqBet9UMl0TSaAhnn7ePZl6Bdi8s6rYoWJoD/lZ1Rjw3nT5jHhGNLevOkxAWxKjHSw88ysEK/iegD18GZYz3/6QGCkV6qbJmGEn27Qrdh9TLfl91u32YUxilL8ggDwjqpySrzUBTArLBT+DDJ4T90q4EVMOcubTkMMAi3dp/THYAyudr03FsNIlXUZe3cZDJwdFclcI8Eayrx4XmnGtdmPLP8frCdqUkeNrMNdvpJiX9Add3uVqMOSKo3F238BbBp//r0vJ0gHHLCNEeKyHhdl9qGoNI24GnrggWTJN+0HZQn2kAa4iE+/uIeSgc/+oivc4agheCmnJzJySfeAzGmNBLei4qnYuCF2i4FPX6cW4ewVK1eGU0/iSOogxrz67Fz07IM3xVpx+MpyY6OZAabFn0ST3tocZOqx02ceh231rKmf4KqcL+qLGK/aIVMehLLAm7ufuOgOQQKsFhnv3Atq73qVHJUQEYPx5u2105aaBbgNqxJ2KDKfjR78OfcJ+YeKI80SG8kqSRlRJJwHDQqt18zxoJLFxUpNlA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3240.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(346002)(376002)(396003)(136003)(39860400002)(366004)(7416002)(44832011)(478600001)(5660300002)(8936002)(6486002)(53546011)(6506007)(31696002)(86362001)(26005)(6512007)(41300700001)(2906002)(6666004)(36916002)(38100700002)(2616005)(186003)(83380400001)(66946007)(66556008)(66476007)(54906003)(31686004)(36756003)(316002)(4326008)(8676002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TVE1S1BxUHlOWGZVaUZmcHZTay9KOUtJQ2YzbkpMWHcxdUZMbmhmY2JpQnc3?=
 =?utf-8?B?Mm4yR1NBS1lYdXcvMzY0ZXJLVkVLVllxTk5uSW1hVHV1eWtFODMzZEkxcy9k?=
 =?utf-8?B?aDJmWUhFRHA2ektCRGJqUVRXYmI3eDU3Q2VxNUpaV2F0YnhJVHdQQWtKT1dC?=
 =?utf-8?B?NXAvZ2VPQWFzeDg5dlpVQ3QzUElGS0Rsc1RpWjdYRXZtRDlINXNNSUFtbjFQ?=
 =?utf-8?B?TlFQd0ZKbG1NTEhwS21CT0lHc2NMbFFWWkJiaC9QcTBJak14NGNpckR0ZnVk?=
 =?utf-8?B?NWJQazlmMExjSC9jUVBNMGxSUzJBVkNhMHpuTHdIdHEyUTJnZ1g2Nm0xUG1O?=
 =?utf-8?B?M2JNR3F4YWptbUxibW1kVDNpU3RTTnlQNEZuS1BreU1ZRFJkcHlsc2FuUnNq?=
 =?utf-8?B?TWp0c1BXRDY4V1VSeExxNjBUQk5vQlNrMFc3cUNaMDB3Um5YZ1dYc0ZEUUdV?=
 =?utf-8?B?YTFZNTNaa0o4WUlJK3M0WmxKU3VidDFFNDB0WWR3VEVEYUczNXZBM0hlaEpN?=
 =?utf-8?B?eFpKWGFCK3FrWTJpNmxPclFUNGt4UDVhcDF3NG9MREZVZzN4RXN6WjkyRXAw?=
 =?utf-8?B?emVTT1doOVlzcjZIc003cXlvSWJ3NkM0YTdlWUxTa0lrdTRIaHA3VVBhT1cv?=
 =?utf-8?B?TllWY3ZQM3dZaFI0ZzRpL3lJLzE3eHUrRmFKbVZSRW95VFRlSlNmZUFqYmlZ?=
 =?utf-8?B?T1k3OVRRWW50RXZQdnJTZnh0OGthNFhueG1ZUHlhdG9CWm0vS29Sei9WcFhn?=
 =?utf-8?B?Mk1HOWNZWWJNWG9hbFBwMkZxRkJPYjRsa0g2cVk2VWZWYWtOTVg2NkxnTE1E?=
 =?utf-8?B?c0N6ZHpVdW9CRE9YT09XYlFQNldnSEREUS90YmYyUDJMK0VwQnF0Y09jRGtw?=
 =?utf-8?B?Tmw2KzkxcGx5aTg2WmZoNHJWUTdzRk02bWsxOGdNU3BsN3liM3lST0JuNzk0?=
 =?utf-8?B?aGg2L0ZsRk5Eb243aXhMQjdIM3dnd2xGK1huSEcxd2wrekJEN0VXQndqMXdU?=
 =?utf-8?B?S1hRZVhJZ0JpdzZRVzhlVlk5N0RqSENOdU4rZnJtRDdhRUluTkhvN2J6WDRQ?=
 =?utf-8?B?aytTMEhkclpiZ0l5MmZYakFSdXdVY2g0ckVhcEtDMGxqblVDOFFLbmdXbWl4?=
 =?utf-8?B?Ly8yeVcyRkx0V2dHMGdaN0NweDB3dnNDZWFlOTZ4bWVsaXBLYk1DOUpXakdi?=
 =?utf-8?B?K0t4c1ZGeDQ1dFdlV3NmZkdVdTY0S2JpaGR0YWhQc3J4WXl2U28wdWNUd3pW?=
 =?utf-8?B?NVNCVkw5ckQ3WS9wKzJlYVpXRUVzd21oNForMHhrRHl3MWtFOVM3bDNQSkdE?=
 =?utf-8?B?RjEzLy9LTnYwN0VGa2NnaTdUdkxNUnlBakJLUW5YYU8zM3FqRG1GNTFTT2dE?=
 =?utf-8?B?ZFRSSDRxbjh5MmRveXBDd2JRK1hlOElXL25aUWl4T2pTa253emk1bEVEZlho?=
 =?utf-8?B?OHN5NGF0ZnhLTEVoSnR4bHgxV3NCN3ljZE9ISXViZzZNVGxGSENJY1R5WjJ0?=
 =?utf-8?B?VG9QUjF5OUwvMUdVUEY0dnkvOFlhcklsaHZFc2VySVVTYlZaSU5WRHpxV1FW?=
 =?utf-8?B?dnhwYitqc1JyRlBUMEl1OTFUM1pscE9PN05yMUpuUzUzbWZxdXl1aVE4Z3lF?=
 =?utf-8?B?Q3RzelYzdE1nL25kcm5NLy9KV0IyNW1YZDZadTJZaEQwVno2eFJKNFpUZkZN?=
 =?utf-8?B?ME9waFlPZzR3dTZDeUZmd2p0OWNrcS9LYnRGTDdjdUxweHVRSkUvc2lyU3dv?=
 =?utf-8?B?MzM5Szllb2JWeGlCM0MyOXVteUJLMG1hbVBIRXNHNzVGcnRZL2VzWG05KzdK?=
 =?utf-8?B?RGtUZmlZRjNVeTZld0pWWW0wbElMT0lXYmp5WU1rRExxVnBJL0t2aldvaE90?=
 =?utf-8?B?aXgzY0xqZFlXVHJRQmVXS1JvYzlneEtNWTJzQm1jdHUvcmZZdGE5Y3RCci9P?=
 =?utf-8?B?c3BSbGRleDB2bkRmdlc4N2tFd0hDeDhoZlludUtWT3VXVWlMd2t0TzdCbjNh?=
 =?utf-8?B?dCtwN3Y4SW41dmtUcVdhYi9aaDZsSTh0ZW5iK2JHTzYzNmtUNENYRUZzMEFr?=
 =?utf-8?B?ZnhrWGQ3NjcwODhQaUJqM205c1JiVXRaUnlETXIvSlFxVXpoTE5Ec0hWcXI3?=
 =?utf-8?B?dWZRL0NTelFPOWExNUJ3eXJReE5qYlhZSmJWZVNaTDNoQUhxQkkxaGM2THp0?=
 =?utf-8?B?OWc9PQ==?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1afd4e63-085d-4299-fc89-08da5eb386f5
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3240.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2022 18:23:58.6521 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u+MqF5PjVU9BjhqjUZ1ndT5hgJJvnEVA4d+OKJoJmiYJsD4bG/uCLhbmh0r07N+AxytfZQE3ItyN7mhePcGybHrAaVktv+47fqGR3qDXb0w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR10MB3558
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.517, 18.0.883
 definitions=2022-07-05_15:2022-06-28,
 2022-07-05 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 spamscore=0 adultscore=0
 mlxlogscore=999 bulkscore=0 malwarescore=0 mlxscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2204290000
 definitions=main-2207050079
X-Proofpoint-GUID: OuYAdro6HUMv-FGJpdMddygqog5XD8XL
X-Proofpoint-ORIG-GUID: OuYAdro6HUMv-FGJpdMddygqog5XD8XL
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=steven.sistare@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 6/15/2022 4:25 PM, David Hildenbrand wrote:
> On 15.06.22 16:51, Steve Sistare wrote:
>> A memory-backend-ram or a memory-backend-memfd block with the RAM_SHARED
>> flag set is not migrated when migrate_ignore_shared() is true, but this
>> is wrong, because it has no named backing store, and its contents will be
>> lost.  Define a new flag RAM_ANON to distinguish this case.  Cpr will also
>> test this flag, for similar reasons.
>>
>> Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
>> ---
>>  backends/hostmem-epc.c   |  2 +-
>>  backends/hostmem-memfd.c |  1 +
>>  backends/hostmem-ram.c   |  1 +
>>  include/exec/memory.h    |  3 +++
>>  include/exec/ram_addr.h  |  1 +
>>  migration/ram.c          |  3 ++-
>>  softmmu/physmem.c        | 12 +++++++++---
>>  7 files changed, 18 insertions(+), 5 deletions(-)
>>
>> diff --git a/backends/hostmem-epc.c b/backends/hostmem-epc.c
>> index 037292d..cb06255 100644
>> --- a/backends/hostmem-epc.c
>> +++ b/backends/hostmem-epc.c
>> @@ -37,7 +37,7 @@ sgx_epc_backend_memory_alloc(HostMemoryBackend *backend, Error **errp)
>>      }
>>  
>>      name = object_get_canonical_path(OBJECT(backend));
>> -    ram_flags = (backend->share ? RAM_SHARED : 0) | RAM_PROTECTED;
>> +    ram_flags = (backend->share ? RAM_SHARED : 0) | RAM_PROTECTED | MAP_ANON;
> 
> I'm pretty sure that doesn't compile. -> RAM_ANON

Oh it does, but not what we want!  Thanks for the catch.

>>      memory_region_init_ram_from_fd(&backend->mr, OBJECT(backend),
>>                                     name, backend->size, ram_flags,
>>                                     fd, 0, errp);
>> diff --git a/backends/hostmem-memfd.c b/backends/hostmem-memfd.c
>> index 3fc85c3..c9d8001 100644
>> --- a/backends/hostmem-memfd.c
>> +++ b/backends/hostmem-memfd.c
>> @@ -55,6 +55,7 @@ memfd_backend_memory_alloc(HostMemoryBackend *backend, Error **errp)
>>      name = host_memory_backend_get_name(backend);
>>      ram_flags = backend->share ? RAM_SHARED : 0;
>>      ram_flags |= backend->reserve ? 0 : RAM_NORESERVE;
>> +    ram_flags |= RAM_ANON;
>>      memory_region_init_ram_from_fd(&backend->mr, OBJECT(backend), name,
>>                                     backend->size, ram_flags, fd, 0, errp);
>>      g_free(name);
>> diff --git a/backends/hostmem-ram.c b/backends/hostmem-ram.c
>> index b8e55cd..5e80149 100644
>> --- a/backends/hostmem-ram.c
>> +++ b/backends/hostmem-ram.c
>> @@ -30,6 +30,7 @@ ram_backend_memory_alloc(HostMemoryBackend *backend, Error **errp)
>>      name = host_memory_backend_get_name(backend);
>>      ram_flags = backend->share ? RAM_SHARED : 0;
>>      ram_flags |= backend->reserve ? 0 : RAM_NORESERVE;
>> +    ram_flags |= RAM_ANON;
>>      memory_region_init_ram_flags_nomigrate(&backend->mr, OBJECT(backend), name,
>>                                             backend->size, ram_flags, errp);
>>      g_free(name);
>> diff --git a/include/exec/memory.h b/include/exec/memory.h
>> index f1c1945..0daddd7 100644
>> --- a/include/exec/memory.h
>> +++ b/include/exec/memory.h
>> @@ -203,6 +203,9 @@ typedef struct IOMMUTLBEvent {
>>  /* RAM that isn't accessible through normal means. */
>>  #define RAM_PROTECTED (1 << 8)
>>  
>> +/* RAM has no name outside the qemu process. */
>> +#define RAM_ANON (1 << 9)
> 
> That name is a bit misleading because it mangles anonymous memory with
> an anonymous file, which doesn't provide anonymous memory in "kernel
> speak". Please find a better name, some idea below ...
> 
> I think what you actual want to know is: is this from a real file,
> instead of from an anonymous file or anonymous memory. A real file can
> be re-opened and remapped after closing QEMU. Further, you need
> MAP_SHARED semantics.
> 
> 
> /* RAM maps a real file instead of an anonymous file or no file/fd. */
> #define RAM_REAL_FILE (1 << 9)
> 
> bool ramblock_maps_real_file(RAMBlock *rb)
> {
>     return rb->flags & RAM_REAL_FILE;
> }
> 
> 
> Maybe we can come up with a better name for "real file".

Sure.  Ideas:
  RAM_FILE
  RAM_NAMED
  RAM_NAMED_FILE

> Set the flag from applicable callsites. When setting the flag
> internally, assert that we don't have a fd -- that cannot possibly make
> sense.

It will only be set in hostmem-file.c

> At applicable callsites check for ramblock_maps_real_file() and that
> it's actually a shared mapping. If not, it cannot be preserved by
> restarting QEMU (easily, there might be ways for memfd involving other
> processes).

Memfd is allowed for cpr restart by virtue of being shared and having an
fd which can be mapped, which I test for.  See ram_is_volatile in patch 22.
ramblock_is_anon() becomes !ramblock_is_file().

- Steve

