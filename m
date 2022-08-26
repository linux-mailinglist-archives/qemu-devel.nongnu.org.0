Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 385B35A1F88
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Aug 2022 05:52:09 +0200 (CEST)
Received: from localhost ([::1]:47012 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRQO7-00032k-00
	for lists+qemu-devel@lfdr.de; Thu, 25 Aug 2022 23:52:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <si-wei.liu@oracle.com>)
 id 1oRQMY-0001bK-0w
 for qemu-devel@nongnu.org; Thu, 25 Aug 2022 23:50:30 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:1672)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <si-wei.liu@oracle.com>)
 id 1oRQMT-0003Dj-D6
 for qemu-devel@nongnu.org; Thu, 25 Aug 2022 23:50:29 -0400
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27PLK7c5015889;
 Fri, 26 Aug 2022 03:49:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2022-7-12;
 bh=VofS+IPCGJmZ0bnvSiUoePmtx4MaHLyklGvCcNjpRa0=;
 b=WLejqDF14W/pQ/mRpPkCEhsp/Y62OnU4y7wwURQ0vBfXLOFtNOglTxOu4fNpbopQLRmu
 lsgebQP3DtvrZvbzkFMabtmTCZ8hFWeFa7F/yolcl/7c3G1JV1xGi3fuf688d4PC1bx5
 BWlK1s0ThJTW4OOCW3DFRn+SMrby6mcaCErbWvJrNkKC0mzd1GsC+kquDvf5GZgAV26F
 Wbxa9h4m+0cC4JcGqjPoLyg9si3gmRSwQm5J2Hz9UuI1uMEFRBWQTcnQvRvXn+0s3q7W
 gIP0jK08X1CLEsl6ejK2A3rKWNPjSHr/i9O9OnFvlsWMj/tMH9bypPuOO8hH+YGr75B9 Mw== 
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3j5aww5xbe-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 26 Aug 2022 03:49:41 +0000
Received: from pps.filterd
 (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 27Q3ZdSA018029; Fri, 26 Aug 2022 03:49:40 GMT
Received: from nam04-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam04lp2049.outbound.protection.outlook.com [104.47.73.49])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 3j5n7cj217-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 26 Aug 2022 03:49:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Jvcnoy4p0qdF1jHJxEVQVvmhtmcXClynQcfnqEJlO0QCMPWaXppHNJbwQ/j7NqLk+N4FbGoPN8TJ7LH8v4AIfwDMu2yyjJRzEZhcmdKOEFEjBmmLHVG0b0Y0KpRfsWU8EBzyngYYvG2zR+IFxp4usUnNPkf/n+5GLJx2bXOeAxep5IsuCMGwlAK6fHdKmyxis4T+1X1fVKCBRpo52Tc83wn/e1pQzGowTDJeG+h+Who6hfbiE53YSwHJLG5zBnSjBwSnbyMf23+DE9cNC4UcOl61NJ09cVh1ctca3ij3/tm6AjzgJjQTjVRLSj1tEnwht4gbdl0AA7wlhyu752+K2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VofS+IPCGJmZ0bnvSiUoePmtx4MaHLyklGvCcNjpRa0=;
 b=eF5iigD3N+VqBkZ9tscGvg9CeSMxGRwSH4PK34000bD/ETNORH5zCc8r+QvcXFuXheVIMggGMfsrM+GjANILrXq9o+k6Ic2kKR3cyhGcyxyGOm/IX0BveFGcVpmdNy1vabnqRIACkM2OeQZ1tk8VeLdWuXpR6pCVZ/igsVQtJcgKQLVOaT0EySVpdQvKBD7bZTC5ShwxmKy81Ft3yC+qDl85njmu/dm/hU59celqx0f/TvWWF8h7wpBYlCj2ZP5mbFoYEgY4H+eXENd/pOCnOI/V2IDKjdpPv+zRaTe2PF6a0goTTV745u2xCOb2P0bbdOSs6cynxGJlk/3flPlkHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VofS+IPCGJmZ0bnvSiUoePmtx4MaHLyklGvCcNjpRa0=;
 b=RLVyFvp0TzHPbIhSgooSiEnJqRFyIVPQdpqBk78leXkzPS7FyWwQo6T4eyc2Vee8QAbOOiLufZk0Wwn7y6JXAs+sZ6J4wBHX0XejqDyVRPZWKYBnnIkw7T6j34ZBUBl5Io+6bnNcrDWM/WU3uQT9lNylh0wpxSd4RtgFH5pvWAo=
Received: from BYAPR10MB3287.namprd10.prod.outlook.com (2603:10b6:a03:15c::11)
 by SJ1PR10MB5954.namprd10.prod.outlook.com (2603:10b6:a03:48b::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.14; Fri, 26 Aug
 2022 03:49:38 +0000
Received: from BYAPR10MB3287.namprd10.prod.outlook.com
 ([fe80::dcf7:95c3:9991:e649]) by BYAPR10MB3287.namprd10.prod.outlook.com
 ([fe80::dcf7:95c3:9991:e649%7]) with mapi id 15.20.5566.015; Fri, 26 Aug 2022
 03:49:38 +0000
Message-ID: <5b610780-b9e6-1499-cd30-bb08a1f90aa6@oracle.com>
Date: Thu, 25 Aug 2022 20:49:32 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 4/5] virtio-net: Update virtio-net curr_queue_pairs in
 vdpa backends
Content-Language: en-US
To: Jason Wang <jasowang@redhat.com>
Cc: =?UTF-8?Q?Eugenio_P=c3=a9rez?= <eperezma@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Cindy Lu <lulu@redhat.com>,
 Eli Cohen <eli@mellanox.com>, Cornelia Huck <cohuck@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Liuxiangdong
 <liuxiangdong5@huawei.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>,
 Harpreet Singh Anand <hanand@xilinx.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Parav Pandit <parav@mellanox.com>, Gautam Dawar <gdawar@xilinx.com>,
 Stefano Garzarella <sgarzare@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>
References: <20220819171329.3597027-1-eperezma@redhat.com>
 <20220819171329.3597027-5-eperezma@redhat.com>
 <7debe883-819a-f083-aa72-8b9e05ca5be8@redhat.com>
 <8aafb501-a852-bc45-8989-b48644c5e1f5@oracle.com>
 <CACGkMEuzxCRn9AqMiu_MJ_6QuQ1n_puEECvXvO3mCNRoYJuemA@mail.gmail.com>
From: Si-Wei Liu <si-wei.liu@oracle.com>
Organization: Oracle Corporation
In-Reply-To: <CACGkMEuzxCRn9AqMiu_MJ_6QuQ1n_puEECvXvO3mCNRoYJuemA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SA0PR11CA0043.namprd11.prod.outlook.com
 (2603:10b6:806:d0::18) To BYAPR10MB3287.namprd10.prod.outlook.com
 (2603:10b6:a03:15c::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b6192f2b-6095-4faf-8aea-08da8715ff9b
X-MS-TrafficTypeDiagnostic: SJ1PR10MB5954:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: k7X/94P4KUmlvxax6h7fYx8QkkCdzlds8egP4XHJnGZsG4HLQFJ1tQmz2MTEb1tQ+g18ooNOP4vpvurm2SUm6dmc8iNlacTPl7/JkBDCo3rgCgTlXb/5p0QZ4w1iu1vr/Z4jtgq0xri+u0oxPeYFg5uBcFUyK+bCOwqLl8sYixXn4zzdupB89m67vXiC1VEw2viiH9/1t3KljGoHi1o3N3r9I1LGrTQ4FkOLgFJBDovQj9w0cXyZwDnOi/bjx+u8Ux/IomAePrGFzAhpXi+9KneRfB7m2INuNVgHso6U0RQoY/p8Bt8aaKl2JMQ79/OpFAha0zVFTkJttwva+Fc1xXMRNFmmTDz+YAfVXmrsx1Ln6avO4ahCKGAogW+y8CqonnvM7HttLYHK5qov9FEjxLpXO5JPY8GfPCzVdSdFL81N+0ePaE/QBc7hzLx24SnsjOAdhFU4lYmPhNS8ZrN2SDuG/ZiUsgdca+47KeKmIgYNvkVGWm2XzGaFx/5piRjwcF6TiSnb9I9JXU5ukhhaGLwyAQNJx7VRpPNb9HfuQ9G1gKYfZCKCYjR2QWgWDDeGAGAiDloV7Y/3iJVObAEur/kaLpEWovX0ZMW+r5dulrSfQLD4NhDqNGpcrjvBHW1gN121GA1GdhAMBZUKy7/7ht1huayZvH6oYGoxRHiWNj2mIRa1/PLYQAOOz54/IhnrabX1yj2Yt9EDRkGxMshAPRFJeBtKfOHOXaUVTygm2Zyv5IHntWSMdEJVKwO5MYyxF0pGMmYdxDg7Q0BgD+0JmkmDS3012tXlgbiLqaiHZeg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3287.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(39860400002)(366004)(396003)(346002)(376002)(136003)(186003)(2616005)(86362001)(31696002)(38100700002)(66574015)(5660300002)(83380400001)(7416002)(31686004)(8936002)(4326008)(6486002)(2906002)(41300700001)(15650500001)(36756003)(6666004)(53546011)(6916009)(66556008)(6512007)(478600001)(36916002)(26005)(6506007)(54906003)(66476007)(316002)(66946007)(8676002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MlM4NmdKelBUVGsrMnFzb2ZuNlJPY3JvL2pZb3g4bnNpSlg2ZGdhSUx2dWtZ?=
 =?utf-8?B?c09CNjZubTlUM1N5aU1RTjI4TEZiR3QyUXFZVXJlRW5hb1NmZVJkNWxqNDY2?=
 =?utf-8?B?REM3Y1BHYUNqcitFcmhVczVRQjBsRldIZm5PM2hVVmFMaU1VOE5Td29DbzF0?=
 =?utf-8?B?R3J1QjlKa1RnYytRWTgwcUVReGpqMy9FMjJCK3JIVVhmRnplMVp2bC9mSXZ6?=
 =?utf-8?B?c3pmcnFZMXNKRWsvRUdsS1Z4TThSSG5zV2ZObEl6Nm5vaXFTSWMxUWNqOTYz?=
 =?utf-8?B?REdiWlh0Q3BaY2tUdFo0QkZpM243UTJZdzRibWYvb1ZpenVXMWsrU3pab2hP?=
 =?utf-8?B?ZVZocm9uSmpZV1Y0Y0VXcDYwSzJFQ3dvZ1dlcWJSRFg0dWpHV1RiS2ZXSEEz?=
 =?utf-8?B?OUJhdXRWNGhkczJISUF5MUFFVkpzcFBoMmpKa1BHWDNmSG1MOUdmOU1YcUEr?=
 =?utf-8?B?UDlLWkcwaTlqdkFxcTBtQkFHUG13TTVkd2kyZVA1c1lCc3B1MGw5R0wvUlA3?=
 =?utf-8?B?VVVnRXhENnlFRFVaTlB1YjlPK3JmV1FKVDJNQVlMeWt5SkZUQkJ3bmt1OWVV?=
 =?utf-8?B?Z05sVnhvY1NvQVZpdXVEZ0hVNEFKSERVNzlDd0RuZnVkeGJHN1MrdE1WRk9a?=
 =?utf-8?B?SDh0WVRmOHYzTVVKNFVOeWpnTjlRc1NIcHVBTWxoK1ZuYkFJWGJDWTFuditx?=
 =?utf-8?B?WXd3cW9IRytLL2FLdWIrRXZMNnZ1dVRHazhabGpPYWp4UnQ1NW5naEhUWlZX?=
 =?utf-8?B?T2RwcnJoM0RTdjJianN4TmZoVDUzMFJpcXdRN0FiR2gxT3RhN2c3b3E0bE9h?=
 =?utf-8?B?c3FhN2FJd2hINkk4dEo0WjZhRk1uaU1mQy9iSUEwYjZRTk4ydS9lRWpFTEFs?=
 =?utf-8?B?Y1FXQUxEYmY1KzdEaDFsTXB5dHVqNFZPOGFWMkFCdlZsYTFUaWhIQkZVVlRS?=
 =?utf-8?B?VWpWbWRXM20yWkNmVW5aNVlnQkJVS2RQWW0xREExenVCWENVTFh0eVU5V2Uw?=
 =?utf-8?B?YUhydnJKYmpVK0cyQ1NKSHU3TWI0WmFndHRIN3VFMzFFNGxEMWlxOE5rMU9p?=
 =?utf-8?B?NG1vWWNXRDhacjFzZ2ZoT3lYLzV5eW8vUGk1TEJqMVNMdGc1SzRhTHB1MUs0?=
 =?utf-8?B?NmthODV5WjYra0Rhb2w1WldpaTZyenlSM25NQWFnUGlLRTBPVE9oVnM0L1NK?=
 =?utf-8?B?Y2t2YkJReEFEUUhRWTFYcVErTXVMYm9qR2dGb1BVTmszZE5TV2VHcDRFdUNs?=
 =?utf-8?B?V293MG14WEpsKytZMkFFWUVKMDRVYWdRRjdJMWtjZ1llM3BlbkdmaUVZS1VZ?=
 =?utf-8?B?dVlkQkhKR3dCcUpnU0ZkWmpOa3RMUzQ2d0ZSRWU2aFNQUTh6TXhJNUwydFRN?=
 =?utf-8?B?N0I0ZVk5elNYWTQvN2lMWHNGTnpJRHNUZzQ4eFcyR1RXZVJoclh6SlFkaWQr?=
 =?utf-8?B?QUpsY3F6Nm54bG9vVnlQSDd4b3E0WERERk1LVnlEaG1WU0JFaXZHN29JSlJa?=
 =?utf-8?B?SlVNMTVKdzBrajV0TWV3Qlk4MEYreU5YenpDMjdRZDRVckpYZ2tyLzg4T0JE?=
 =?utf-8?B?UjhrWVh4RS9NL3FJcnJQdjlNT1VqeFQ3THhWYkpmU1FTMjcvZmtHeUJCWTc0?=
 =?utf-8?B?VXM2cFpEREVkb0FnVEVDRmJhL2syOUkyOTZZY1FxU2ZGWVM0NCtlNHg5V25N?=
 =?utf-8?B?dC8wbGQ5VFlqTU1FRFJvSWJOZFVaQjNzTWs4Vk9QcncyU0pUZGRRZ1IzMWNt?=
 =?utf-8?B?TVNKMVAyOExrbE9KUlJuRkc0d0p3YlphMGdXL2U4SVpBUWZ5RXRzNHZ2QUR4?=
 =?utf-8?B?SFg3czFoTE90bXBCNm1LRk1ENG03TjN5Rmt0T2tOMHBtaWNrUDRhZVpYdnoy?=
 =?utf-8?B?aVg4M08xeTd3ZTlReEIzcGM0NUtnUFlaNThFY3NJalFqSXhkUDJVY0kxQXlx?=
 =?utf-8?B?NDdLaTZxTXhlQ2t0OWVUUmxUcklsdTRSRWFPMTVLVjh4Q24rdkVkcy9meThl?=
 =?utf-8?B?cmZBRWsxRHFrOFQyU1BJalc2UGJpMVJ3ZUFNT0VyVGwwVS96TTcvdTNpWkhF?=
 =?utf-8?B?NzRobC9JcGFldnRBZ0xScTE2dW1mSDNxRG1SZjNKWU9xcW5oT0ZEMHM0RG1h?=
 =?utf-8?Q?hxLaNJA5ErVWLBzynOHBjHj+Q?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b6192f2b-6095-4faf-8aea-08da8715ff9b
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2022 03:49:38.0355 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dYVhFPsK6nTtg0bLkVVQucr18OPH4K4z/zPe+tRCYluMg5wf52dOr4Jw2iDSTMq7ibohLfcI/KZSeZL8EkEBYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR10MB5954
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-26_02,2022-08-25_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 suspectscore=0 phishscore=0
 mlxlogscore=999 adultscore=0 mlxscore=0 malwarescore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2207270000
 definitions=main-2208260013
X-Proofpoint-GUID: E4ODHgYtLlyBksbjCxZ1Dwv7z88qvhHK
X-Proofpoint-ORIG-GUID: E4ODHgYtLlyBksbjCxZ1Dwv7z88qvhHK
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=si-wei.liu@oracle.com; helo=mx0b-00069f02.pphosted.com
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

Hi Jason,

On 8/24/2022 7:53 PM, Jason Wang wrote:
> On Thu, Aug 25, 2022 at 8:38 AM Si-Wei Liu <si-wei.liu@oracle.com> wrote:
>>
>>
>> On 8/23/2022 9:27 PM, Jason Wang wrote:
>>> 在 2022/8/20 01:13, Eugenio Pérez 写道:
>>>> It was returned as error before. Instead of it, simply update the
>>>> corresponding field so qemu can send it in the migration data.
>>>>
>>>> Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
>>>> ---
>>>
>>> Looks correct.
>>>
>>> Adding Si Wei for double check.
>> Hmmm, I understand why this change is needed for live migration, but
>> this would easily cause userspace out of sync with the kernel for other
>> use cases, such as link down or userspace fallback due to vdpa ioctl
>> error. Yes, these are edge cases.
> Considering 7.2 will start, maybe it's time to fix the root cause
> instead of having a workaround like this?
The fix for the immediate cause is not hard, though what is missing from 
my WIP series for a full blown fix is something similar to Shadow CVQ 
for all general cases than just live migration: QEMU will have to apply 
the curr_queue_pairs to the kernel once switched back from the userspace 
virtqueues. I think Shadow CVQ won't work if ASID support is missing 
from kernel. Do you think if it bother to build another similar 
facility, or we reuse Shadow CVQ code to make it work without ASID support?

I have been a bit busy with internal project for the moment, but I hope 
I can post my series next week. Here's what I have for the relevant 
patches from the WIP series.

diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
index dd0d056..16edfa3 100644
--- a/hw/net/virtio-net.c
+++ b/hw/net/virtio-net.c
@@ -361,16 +361,13 @@ static void 
virtio_net_drop_tx_queue_data(VirtIODevice *vdev, VirtQueue *vq)
      }
  }

-static void virtio_net_set_status(struct VirtIODevice *vdev, uint8_t 
status)
+static void virtio_net_queue_status(struct VirtIONet *n, uint8_t status)
  {
-    VirtIONet *n = VIRTIO_NET(vdev);
+    VirtIODevice *vdev = VIRTIO_DEVICE(n);
      VirtIONetQueue *q;
      int i;
      uint8_t queue_status;

-    virtio_net_vnet_endian_status(n, status);
-    virtio_net_vhost_status(n, status);
-
      for (i = 0; i < n->max_queue_pairs; i++) {
          NetClientState *ncs = qemu_get_subqueue(n->nic, i);
          bool queue_started;
@@ -418,6 +415,15 @@ static void virtio_net_set_status(struct 
VirtIODevice *vdev, uint8_t status)
      }
  }

+static void virtio_net_set_status(struct VirtIODevice *vdev, uint8_t 
status)
+{
+    VirtIONet *n = VIRTIO_NET(vdev);
+
+    virtio_net_vnet_endian_status(n, status);
+    virtio_net_vhost_status(n, status);
+    virtio_net_queue_status(n, status);
+}
+
  static void virtio_net_set_link_status(NetClientState *nc)
  {
      VirtIONet *n = qemu_get_nic_opaque(nc);
@@ -1380,7 +1386,6 @@ static int virtio_net_handle_mq(VirtIONet *n, 
uint8_t cmd,
  {
      VirtIODevice *vdev = VIRTIO_DEVICE(n);
      uint16_t queue_pairs;
-    NetClientState *nc = qemu_get_queue(n->nic);

      virtio_net_disable_rss(n);
      if (cmd == VIRTIO_NET_CTRL_MQ_HASH_CONFIG) {
@@ -1412,22 +1417,10 @@ static int virtio_net_handle_mq(VirtIONet *n, 
uint8_t cmd,
          return VIRTIO_NET_ERR;
      }

-    /* Avoid changing the number of queue_pairs for vdpa device in
-     * userspace handler. A future fix is needed to handle the mq
-     * change in userspace handler with vhost-vdpa. Let's disable
-     * the mq handling from userspace for now and only allow get
-     * done through the kernel. Ripples may be seen when falling
-     * back to userspace, but without doing it qemu process would
-     * crash on a recursive entry to virtio_net_set_status().
-     */
-    if (nc->peer && nc->peer->info->type == NET_CLIENT_DRIVER_VHOST_VDPA) {
-        return VIRTIO_NET_ERR;
-    }
-
      n->curr_queue_pairs = queue_pairs;
      /* stop the backend before changing the number of queue_pairs to 
avoid handling a
       * disabled queue */
-    virtio_net_set_status(vdev, vdev->status);
+    virtio_net_queue_status(n, vdev->status);
      virtio_net_set_queue_pairs(n);

      return VIRTIO_NET_OK;

----
Regards,
-Siwei
>
> THanks
>
>> Not completely against it, but I
>> wonder if there's a way we can limit the change scope to live migration
>> case only?
>>
>> -Siwei
>>
>>> Thanks
>>>
>>>
>>>>    hw/net/virtio-net.c | 17 ++++++-----------
>>>>    1 file changed, 6 insertions(+), 11 deletions(-)
>>>>
>>>> diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
>>>> index dd0d056fde..63a8332cd0 100644
>>>> --- a/hw/net/virtio-net.c
>>>> +++ b/hw/net/virtio-net.c
>>>> @@ -1412,19 +1412,14 @@ static int virtio_net_handle_mq(VirtIONet *n,
>>>> uint8_t cmd,
>>>>            return VIRTIO_NET_ERR;
>>>>        }
>>>>    -    /* Avoid changing the number of queue_pairs for vdpa device in
>>>> -     * userspace handler. A future fix is needed to handle the mq
>>>> -     * change in userspace handler with vhost-vdpa. Let's disable
>>>> -     * the mq handling from userspace for now and only allow get
>>>> -     * done through the kernel. Ripples may be seen when falling
>>>> -     * back to userspace, but without doing it qemu process would
>>>> -     * crash on a recursive entry to virtio_net_set_status().
>>>> -     */
>>>> +    n->curr_queue_pairs = queue_pairs;
>>>>        if (nc->peer && nc->peer->info->type ==
>>>> NET_CLIENT_DRIVER_VHOST_VDPA) {
>>>> -        return VIRTIO_NET_ERR;
>>>> +        /*
>>>> +         * Avoid updating the backend for a vdpa device: We're only
>>>> interested
>>>> +         * in updating the device model queues.
>>>> +         */
>>>> +        return VIRTIO_NET_OK;
>>>>        }
>>>> -
>>>> -    n->curr_queue_pairs = queue_pairs;
>>>>        /* stop the backend before changing the number of queue_pairs
>>>> to avoid handling a
>>>>         * disabled queue */
>>>>        virtio_net_set_status(vdev, vdev->status);


