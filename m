Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 219334CC21F
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 17:03:17 +0100 (CET)
Received: from localhost ([::1]:42678 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPnv9-0003zh-V7
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 11:03:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57604)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1nPnoA-000684-PY
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 10:56:02 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:61270)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1nPno8-0005fD-Rc
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 10:56:02 -0500
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 223FFe5D011426; 
 Thu, 3 Mar 2022 15:55:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=Dr16udgslOFjd3QmbYk4tHl4cJHMCYbR/PTcWzJsD8A=;
 b=QtS20m7FFTV9O2fv0ByOPHYPqfU4QFYRubzbj8zn2Z7MkGpVgcF2ztey0oOwNIgHqWwB
 /X8p65PB/ZIn/YwJO182aMqvQxJVs1VswQowncUIevdh426JfzFkimtb+YkolxqjCsbO
 o12tCwrfL2y4GggxZBHtXCXYptEz4kK3JGv8/Oj0HGsgYrJ9EoFQ7trj40/FseXPdvYK
 ci+K7HamMPybKvIqKU77BobgQmH4WPY1fm1GALU8Z6+ZAY0IB5BPtvTl9ZnX0hs5GHhw
 q3lNnyBEjH0WfZmkIUUti5ztUm6dFQJ7o5AaQdzAcr3PuOXE8lbOouKzBTDy7YYBoKqZ 4A== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 3ehdayyhty-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 03 Mar 2022 15:55:55 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 223FoxlY050600;
 Thu, 3 Mar 2022 15:55:54 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2170.outbound.protection.outlook.com [104.47.58.170])
 by aserp3020.oracle.com with ESMTP id 3efc18wwvr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 03 Mar 2022 15:55:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LFbx6sweKhgxT6yulEtRlO3NjBoPyt+rfEfQFZW1FqQe2QWPsvy/Q4C/eFemspUeW6DTYO4EEJuk5/RQnw8fpUAZXNNuJKck++ZhbH5SpBCdHDxDP3Q/smAEaLT0qfp0loeSIUXq7NiwDPOe/3B+qi7evG3jdIgPbtM15OP1W/9JkFby+3aWgNi/MU9u7AA5Nktli78yK8KVC+51YtLH0B0QcUPjjyghH44ckRvZG2JpC+s/KNvN417EKsMTnmEBcgTuLcgvYpXeS1rAuNA3Afhm1zieOGEwqt1VxEbAtUham/Zvjl2z+cBCE4SFNDzmW3tSVEEo8ctyBTRCL1mOng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Dr16udgslOFjd3QmbYk4tHl4cJHMCYbR/PTcWzJsD8A=;
 b=C3zSGUPycigBJ5pVkUTbhPxyeq4wB+sEVldO4LHIXYMRc2GVT/bglvo8CPNYwhK9upZ+zoADu4zlFw3lqPtT9lM3XDnl6XfxxlbfSleK6IMSzrk9QmBE2MoOzS1K82qfWQfl7PJnFKDOVWjtrvT2HTk1bQp5xBv7tw2cGIeYPk9akoK/xyJtg6Om8noIC4zrSCnA/pe0b5+1h6vRqlttli3JdXgpwwaWMdMVdQEjhmtDeVHSObUi6DuN6tzJQBxtDg/IAGv3hxDMqPZypAETddc9PmrUKMIESMPvGtG1wupyfgotRTehu0UFcGUZ0Y82F0pYui2O56xYw+Ug5r/8VA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dr16udgslOFjd3QmbYk4tHl4cJHMCYbR/PTcWzJsD8A=;
 b=VSwDq/2F6fe0/KZItLE7qzbFxb+chfr4GQWzY4v7mZKzF6gznVy1aVH6fpt1AE2a54JgbfFM65+TkfFpmhpdQlq5+PImycbRAvKN+eD9qn6telRx23FrOX3xByDMgF9vydXfPxpjHvVSarZMGTIbuqe78XdPevKtD+s5nF1pgNo=
Received: from BYAPR10MB3240.namprd10.prod.outlook.com (2603:10b6:a03:155::17)
 by DM5PR1001MB2234.namprd10.prod.outlook.com (2603:10b6:4:2c::36)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.26; Thu, 3 Mar
 2022 15:55:52 +0000
Received: from BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::6005:8b9:1b00:b0da]) by BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::6005:8b9:1b00:b0da%6]) with mapi id 15.20.5038.016; Thu, 3 Mar 2022
 15:55:52 +0000
Message-ID: <17c53591-2fe0-57df-7466-112f979fd58d@oracle.com>
Date: Thu, 3 Mar 2022 10:55:49 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH V7 03/29] migration: qemu file wrappers
Content-Language: en-US
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
References: <1640199934-455149-1-git-send-email-steven.sistare@oracle.com>
 <1640199934-455149-4-git-send-email-steven.sistare@oracle.com>
 <YhfMtliUYxGDsDwx@work-vm>
From: Steven Sistare <steven.sistare@oracle.com>
Organization: Oracle Corporation
In-Reply-To: <YhfMtliUYxGDsDwx@work-vm>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN4PR0501CA0050.namprd05.prod.outlook.com
 (2603:10b6:803:41::27) To BYAPR10MB3240.namprd10.prod.outlook.com
 (2603:10b6:a03:155::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f768fdbd-4111-4055-cba8-08d9fd2e4b25
X-MS-TrafficTypeDiagnostic: DM5PR1001MB2234:EE_
X-Microsoft-Antispam-PRVS: <DM5PR1001MB2234BE998F17382D742281F7F9049@DM5PR1001MB2234.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lXql4JNTxq8URQdYXBkhNAsm5CrcqFKEjyAzg/0EKUfESkiHm06mc32Wpu2pq6aIft5y7OeefB7cDdpPzA62Re4REp0bJb5n5Wfe1BNSk+pw6iGd2Vbu37Ys7g7mZIjdObwDd89U79g3SRMPnnLRdLL3fOXIsNTY3nAXMnNggsu24fJWV3EUTAIPD2sMrI6vFIRle0BHVh4u/5Ce5mwRahH3SfuL9ezd3QqRfkaP1poYSzdxZ21hM1ZLWfP5pl/el2zSe4rTaq2c+8DrLiwX4+1T73kigNalSGow1yB5w+n5IR0FdwivREapPbKpROurULzS8WsNTMpnsFKPtu+Web4v457ybb2tBKK0e6Umltv79cEuV2veutZ3bQRAaJaEmGRZJCfBQtW5/1nsVL3LCtGm04Jkp5C8keYqyn4N6LVkY8m9xRBaocXhj+9dUqNgnwPUnH6ibubTjatmdN3v3+u4C1FaypK4FP9tIpujerl2W3X9C1y9o1fic0MXKNoD86HbPUEk5BDeYyc/Cx5VOqXN5qhq1PrZ0FHCUOzdpw6BBihpTuEp2IrzBCnkHviWv47Qp/BARrabcdvBmt10ZotP+lEEMBWxqJ1HLPzU69GFTb3uadxfbjoF87RBJKlZEs2W9rDHFaRYk1beCuLATETyQ9E0gsYQw+lIakUh5dRFhomZRFz+UEl2iuXd2tuecgvpX10TR61OyCP04XQvDkC0LjZ5Ib8T5+XS75a8YvU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3240.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(6486002)(186003)(508600001)(26005)(2616005)(31696002)(7416002)(8936002)(5660300002)(86362001)(44832011)(66946007)(8676002)(66556008)(66476007)(54906003)(38100700002)(4326008)(31686004)(6666004)(6512007)(2906002)(6506007)(53546011)(316002)(36916002)(6916009)(36756003)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UGUrRmFVcU9jSG0zdTJ2MExDWE5UbHhKOHMyQzlQSkJxb0k0NkZIbU1GQUVj?=
 =?utf-8?B?a1p3WHNvQVlvWHY2bTBVazVnckFUZWE2YXlKRjZIRjAyOHUvMEQwL0MyTlBx?=
 =?utf-8?B?OGp1R2NUbVczdEJYVWRjUGljenZxVlNUdUw0UmQvMXNsQjJqVVI4UWxaZCtH?=
 =?utf-8?B?SXpNT25sUkZMcXpJV3pTSVM2Y1dWTkRBYU5IdmpFSE5rL0gvS2dmRGJ1aENG?=
 =?utf-8?B?OGxKYVpoM1hjMmVrTGZuZmhiQkIySU43SlBlTXM2R1F6SFNzd25XRzZwYXF2?=
 =?utf-8?B?Q2g4L0hqdGJLQU5xN1d6TWwvK21Dc3JQcURkOTJhSFdONUM3b2txQzJ4U1BJ?=
 =?utf-8?B?Y3YybkluSUNINmZ6cC9yUXkzV0JuV2Z0QTNORlAyUFJFS2ZkbG5qNjJicUxD?=
 =?utf-8?B?T3RacTQzYlorOThOaEdub3MzZXpyWXpSakxGZHV1TGFlbU1LNVdQWHd0Nk9W?=
 =?utf-8?B?OVc3TEl2YzA5M1dKaXZHQ3hKQUU0MWtCYm5UK0JBYWJISnlmejhFVyt3SVM2?=
 =?utf-8?B?eWpMbkp4bktOQVdSY2t4SmtoREdQeFZ2RElRMVRBNjI2aHVoOTE2VWJjM1R3?=
 =?utf-8?B?eTd2WkZlejdlZE9LTTB5RGpBOWpWWTdnTU1sSVhIM1NQanR5K09ralVCdGZm?=
 =?utf-8?B?WElmdzBOMHRaUUxPNzlRUFkxZ1JZcnhHNDN5QW5qdlpSTlRZMjErSXN2UU8x?=
 =?utf-8?B?TnpHMi85eTVwUnhObGd2enM4UWJXNi9nVFdlRVFLMWZvb05WV0Z1SW9uYjhi?=
 =?utf-8?B?dWJ1OXNpTHZlbDFlRzNVRVZxbS8vcVh5TXdjVXppd3Z1ZDE5N3dFL1ZHTFhJ?=
 =?utf-8?B?TGttZXVSanNHUzg0OTY0d1dFVVJmRXllc0YvS01EbkFXWXYwUUgyU0ZnUWZ6?=
 =?utf-8?B?K1VLR3dxM2NSWm5NM0ZPeDVObm1xR0h6QnhkcjQ2UDQrTHhlWFYvb3IyRGRM?=
 =?utf-8?B?dDlWKytnbU5BajFNaWhzTTJQa0lYQzRqZitKTVY2cDl3N2hzMTR6UzFDTitS?=
 =?utf-8?B?ejM1TTBnVWgrcjc1QVcwbS9MZnBDSDJQQTE4anhYOWdDVmNaZmtkMGFKUGI5?=
 =?utf-8?B?dDN0MktiU2NuMUtJYWkrWEI1b1JBRTJLK1lVSXlCN2dzT09YNWZHUGZXMTFp?=
 =?utf-8?B?TFp5U3ZHalJhdWNWMWNHclVrN1FKTU9YbkdlMkRqelBaRzdsclNnN1hqU0J6?=
 =?utf-8?B?SVR3WStPQ0U0UC93cWZPbXRFT2pyUkJDcTFtL2FrSkRjTTNJOUtCdGgxbnRL?=
 =?utf-8?B?UysyU0ZRcDVBMnQrYW9PZWlNVFZtem9MbFBKdlVFbHdpMkxVNXVyT1JjTGN2?=
 =?utf-8?B?Z1NWblVWa1JhSjZvZkxTd05MQ2tVR1JnZGNJSlNsUU44VnRIWFY0Qm9vNzhO?=
 =?utf-8?B?V29vQU1nS1FUeUttRlZ5Nzlna3hHdGVJUXBPTlVrOFkrSGlnZGVEZzgyQnRz?=
 =?utf-8?B?NlFZMjc5Mnhhc2FoV3p2a0cxdW4wZWMrNkpLRjFwZ2lrMDc3UVV5VjJjWE43?=
 =?utf-8?B?NFlkeTJ5Nmw0enFXNzRxcGd1YUdHQk9qMjBoeTZIQWpaeERUVnZ4bDB0Ulc5?=
 =?utf-8?B?T2NlY3BJZHVWVEN6N0RtRUlGQ1Bkck9XcEI4d3ZYWm1ZU1hYZ2trSmQ3OVl5?=
 =?utf-8?B?dWMyUFVkajByWFlBeUNFR3ZzcjYyTUJ5THFvNUhRU0JNampFWWw0ZU5WL05U?=
 =?utf-8?B?N3RYV0xDT0grbkU1YTUwOFAzOUJ2VGRPZ2hPdGRwL3pjbkwvS1MvaWZzS3VU?=
 =?utf-8?B?Qzk4ZnJwZUgzRjNFeVl2QnZTcjM3L3B6WTVNWDFibEFSd3hCaWN3REZaK0xY?=
 =?utf-8?B?elhJNkVlQzFEdU9TOWw3VjcwSUs0N3FlWU5YVHhOeTZxTXpWNnJGYnlkQm45?=
 =?utf-8?B?MTBhUmo4Znd4cUprSExqMUdudm5PMEN3NDhLRzhCNGpEdEpqRzhIMWhYejEv?=
 =?utf-8?B?eWxmNWdTZ2RFQ1ZRNkdmaEpSUUNIZDZZbXh0b1AzempvZjkrOGhyNHJqekFN?=
 =?utf-8?B?c2YzczNNUm5odHJXM0x3S0N0QzhnNzN3LzQ5OWhQWHB2djU4VklIYUVmUVFh?=
 =?utf-8?B?N3VFUE82Q3BockhJOHhPeGowTUhtN25DN1AwbGNrb1FiNzBuazF3emEvODBI?=
 =?utf-8?B?UjArVlRQNTlSV1NWN0I5bFRpOGVaNVpNVk5ObnVwRlJ1OHhkUU5ZeUE0d050?=
 =?utf-8?B?cUliRXZuektOdUJiaHBXbjIyVkc2dFRBb1NxN1hQVXJpOFN1SGJDZGtsYmRl?=
 =?utf-8?B?ZmZpcUoxckNzMVBtY2lrbmh2SmNnPT0=?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f768fdbd-4111-4055-cba8-08d9fd2e4b25
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3240.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2022 15:55:52.1820 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RpmBXHMxm/bUzZ7SJNgRrarwOBsAes5n/PPrcHzuJyxSV4gdRG9D7OR+H0kqjmNq4hujnMQY/gn8yvCYQMhhXHpU0YzQofijOil8g5znJ0c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1001MB2234
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10275
 signatures=686983
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 mlxscore=0 phishscore=0
 bulkscore=0 adultscore=0 spamscore=0 suspectscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2203030076
X-Proofpoint-GUID: ZrZLAxF50sBD9PL2YEQ-3kq9y4VQJp_x
X-Proofpoint-ORIG-GUID: ZrZLAxF50sBD9PL2YEQ-3kq9y4VQJp_x
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=steven.sistare@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: Jason Zeng <jason.zeng@linux.intel.com>,
 Juan Quintela <quintela@redhat.com>, Eric Blake <eblake@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Zheng Chuan <zhengchuan@huawei.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/24/2022 1:21 PM, Dr. David Alan Gilbert wrote:
> * Steve Sistare (steven.sistare@oracle.com) wrote:
>> Add qemu_file_open and qemu_fd_open to create QEMUFile objects for unix
>> files and file descriptors.
>>
>> Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
>> ---
>>  migration/qemu-file-channel.c | 36 ++++++++++++++++++++++++++++++++++++
>>  migration/qemu-file-channel.h |  6 ++++++
>>  2 files changed, 42 insertions(+)
>>
>> diff --git a/migration/qemu-file-channel.c b/migration/qemu-file-channel.c
>> index bb5a575..afb16d7 100644
>> --- a/migration/qemu-file-channel.c
>> +++ b/migration/qemu-file-channel.c
>> @@ -27,8 +27,10 @@
>>  #include "qemu-file.h"
>>  #include "io/channel-socket.h"
>>  #include "io/channel-tls.h"
>> +#include "io/channel-file.h"
>>  #include "qemu/iov.h"
>>  #include "qemu/yank.h"
>> +#include "qapi/error.h"
>>  #include "yank_functions.h"
>>  
>>  
>> @@ -192,3 +194,37 @@ QEMUFile *qemu_fopen_channel_output(QIOChannel *ioc)
>>      object_ref(OBJECT(ioc));
>>      return qemu_fopen_ops(ioc, &channel_output_ops, true);
>>  }
>> +
>> +QEMUFile *qemu_file_open(const char *path, int flags, int mode,
>> +                         const char *name, Error **errp)
> 
> Can you please make that qemu_fopen_file

Will do.

>> +{
>> +    g_autoptr(QIOChannelFile) fioc = NULL;
>> +    QIOChannel *ioc;
>> +    QEMUFile *f;
>> +
>> +    if (flags & O_RDWR) {
>> +        error_setg(errp, "qemu_file_open %s: O_RDWR not supported", path);
>> +        return NULL;
>> +    }
>> +
>> +    fioc = qio_channel_file_new_path(path, flags, mode, errp);
>> +    if (!fioc) {
>> +        return NULL;
>> +    }
>> +
>> +    ioc = QIO_CHANNEL(fioc);
>> +    qio_channel_set_name(ioc, name);
>> +    f = (flags & O_WRONLY) ? qemu_fopen_channel_output(ioc) :
>> +                             qemu_fopen_channel_input(ioc);
>> +    return f;
>> +}
>> +
>> +QEMUFile *qemu_fd_open(int fd, bool writable, const char *name)
>> +{
> 
> Can you please make that qemu_fopen_fd

Will do.

>>> +    g_autoptr(QIOChannelFile) fioc = qio_channel_file_new_fd(fd);
> 
> Can you use qio_channel_new_fd for that? Then it creates either
> a socket or file subclass depending what type of fd is passed
> (and gives you a QIOChannel without needing to cast).

The downside is that we must pass and check an errp, which will only be
set for a socket, and this function qemu_fopen_fd is never intended to
be used for sockets.  The file case never fails.  IMO the current code
is better.  Are you OK with keeping it?

- Steve

>> +    QIOChannel *ioc = QIO_CHANNEL(fioc);
>> +    QEMUFile *f = writable ? qemu_fopen_channel_output(ioc) :
>> +                             qemu_fopen_channel_input(ioc);
>> +    qio_channel_set_name(ioc, name);
>> +    return f;
>> +}
>> diff --git a/migration/qemu-file-channel.h b/migration/qemu-file-channel.h
>> index 0028a09..324ae2d 100644
>> --- a/migration/qemu-file-channel.h
>> +++ b/migration/qemu-file-channel.h
>> @@ -29,4 +29,10 @@
>>  
>>  QEMUFile *qemu_fopen_channel_input(QIOChannel *ioc);
>>  QEMUFile *qemu_fopen_channel_output(QIOChannel *ioc);
>> +
>> +QEMUFile *qemu_file_open(const char *path, int flags, int mode,
>> +                         const char *name, Error **errp);
>> +
>> +QEMUFile *qemu_fd_open(int fd, bool writable, const char *name);
>> +
>>  #endif
>> -- 
>> 1.8.3.1
>>
>>

