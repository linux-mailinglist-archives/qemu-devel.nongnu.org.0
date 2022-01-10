Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A82D48A36A
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Jan 2022 00:08:04 +0100 (CET)
Received: from localhost ([::1]:44812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n73lj-00005d-37
	for lists+qemu-devel@lfdr.de; Mon, 10 Jan 2022 18:08:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1n73Q1-0000nD-Md
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 17:45:49 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:16946)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1n73PY-0002Dg-CK
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 17:45:18 -0500
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20AJlinp007280; 
 Mon, 10 Jan 2022 22:45:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=kPki/uxS+m+2EPKDWvN/6bETva/ZOagNMPX7hSueR6E=;
 b=SJ7mcNfWG42k7SMhZs4HSmEKR0h4KS2jNokq41BRAecwpRYS+5Dmp13XiCEXr46bKaL3
 um1JROvXtO+Wj7Atqo846pn4ll37WBJbPqU+0TNZr1h2S5cPBdPo1qJ3uFgD3tj1yU/6
 /q1SO5K867xFuAGoakP2G0JgDvHzRKC3YFzmOWwjDk+BVGLjFLS70fDsZT504M9OxL8v
 sa5XfwackJUyActrwyg2zoKONQVnrXwufd2KFE/3s/Q+rWQsLeOXp/sHCzYALrTwziOf
 21zkzc98JBAvhzcibpPYojRiPeeNDRZ4LCMhJSlAF2K5GAXA9tVYUBizO98Oc63VOkH6 dw== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 3dgkhx1pff-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 10 Jan 2022 22:45:04 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 20AMa6w0153774;
 Mon, 10 Jan 2022 22:45:03 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2108.outbound.protection.outlook.com [104.47.55.108])
 by userp3030.oracle.com with ESMTP id 3deyqw4had-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 10 Jan 2022 22:45:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XYjvZgknYfjdKjCNhcnt+9mp66C4adjUGdm4oWBta3/1c3RYX4SC8O74rf8fwAGCjnZ2sps+IN48yfmxyDMHvv6h3JOYjBAxMAaCzkEhIl5qmAZtMzR1yu+L/xZ/EnoDHSXQrb8z119VcFH2mFC3R57+vMYmHEW5K4XT53NvrEHA9Ke584AXbTDIQBsbsxHZQYxbZ7qp5llw8mGTQuSBL/AQoZ18eUDKLGA6lOqjZHdVttRvTvqFl4vza5vsUuZb5l0zXatSUkPIbPcl0MFv52+bDz54p5TXCVbuQTLARnKxSmbAiabz/id6b5Rq4CqhIpAtEIl+vA8q0KBdNFZ8nA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kPki/uxS+m+2EPKDWvN/6bETva/ZOagNMPX7hSueR6E=;
 b=lMwSw1WKxB1arvlAG4mjUBvd/fbZ1LKKwruHdg2mEgjn3ZedHefhvpcOlkpsf8YsBCFx56GxwLnT993qHUHdABI54jyjX5m+SS6AXdPVZiiKF32n9VW7PerrnygLyYD83vXNqmciNCpcZRnrmyDKcQK0Hw2zCFiFsthks11kVOVVpoARjvSoYpUkq3XxnRuelX6F76G7fllOlR4WqT17x0opshk+IAVEarIo7gSQlccg8tWa8jm7bbG+U5nPr7faLbtTwVwyR9//jhULH7FAHXA+JcDDubeo6aivbmyVDeWNln4NHSNb2ufWxofcqs7ZfUSb1hgMxeyvMsTx2k17hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kPki/uxS+m+2EPKDWvN/6bETva/ZOagNMPX7hSueR6E=;
 b=wfASZ4K7UkdFl/PfIWs3H/AHkBf++ZVaqM+tU4n5ucYf2HnL+gLxdoTuglCz/5pSyd3AZXNmADF2j7x1hSAM0b3h7xU1mr48S5SyFd9nKLmqzsMlX/bNie4P8JP5F9DfJhCBbCHvfQk9aShE9S0JHKKAmCpVpDpiQCA9R6kcVXw=
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by MWHPR1001MB2175.namprd10.prod.outlook.com (2603:10b6:301:2d::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.9; Mon, 10 Jan
 2022 22:45:01 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::d573:6cc0:c616:6f2c]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::d573:6cc0:c616:6f2c%6]) with mapi id 15.20.4867.012; Mon, 10 Jan 2022
 22:45:00 +0000
Message-ID: <ba9ba02b-bfa4-30ab-2236-85c2515fa5d1@oracle.com>
Date: Mon, 10 Jan 2022 16:44:26 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v11 06/10] ACPI ERST: build the ACPI ERST table
Content-Language: en-US
To: "Michael S. Tsirkin" <mst@redhat.com>
References: <1639582695-7328-1-git-send-email-eric.devolder@oracle.com>
 <1639582695-7328-7-git-send-email-eric.devolder@oracle.com>
 <20220106054104-mutt-send-email-mst@kernel.org>
From: Eric DeVolder <eric.devolder@oracle.com>
In-Reply-To: <20220106054104-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA0PR11CA0026.namprd11.prod.outlook.com
 (2603:10b6:806:d3::31) To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e10a859a-b394-4a53-d587-08d9d48ad206
X-MS-TrafficTypeDiagnostic: MWHPR1001MB2175:EE_
X-Microsoft-Antispam-PRVS: <MWHPR1001MB2175C0FFB038F79F169DBE6997509@MWHPR1001MB2175.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ceHNkBa2O7A03reqAaC2o+/b52l5kq++7D5MjTm9gEkJsvFL10JenwMiORXWlf+97hN+3oM9X8M+YcpgVrpdplDzznsLUtn0biK2P0/i4L5vNC6fESX0iYCcFEn9x1uNSOaRLG/8cg5LU9P8JiXSGvixcZBQPvB7FI2CvItpelsHG/Sm6EUamaUHcpjj+SN+qmLdO7CknfD49tBVAMMHIch9rqWg2vci7NB9uikQ8NF68mkgdFVn+A/yGjRcwSxjf/OWv8DFE+Zf0xkmMWLLqvjD3DIlQJu6aEZQN51P6WNznYVp4n3cD+JvoAltCIsO0jMmTm3MXQ0SJPGGLytjpIHhqwO+68U2Cm49S2EQxpC4QftpudJ0X/ToCMfKR6g6A+Z6F0vzoiEkJfOzsgUsC6Bx2y1ocCbq5LQqJykeAhNKFYam+KdC7GsAtQFTBTNqYgEA/QpyzgrbTnGeF3xs+L2if85lubGUuzUlVIfBiEi3ClAkSJov+9iYMrj+vNXRrBLTg2VznxDyZ9bRN2z7bS50VNhdcnx9aJbjvSVPMROCSg9k9oBZzNPnYboMZGNtKSNZgbdGh+1CRMuHbXLnYRL/kzcgq9bxn4yZ7rpMx4WBGRjRvu6lvs+COCkTvsKKr65dcJBlOe8N64DMvO7XUCkeJ1rBfm1dJ5pNKuRXINdcVfpRSHms/lKb/34smrLSErZWjKH48kzTbOfXyNfUrLaO3VbBe7OnhT5LgHz8zww=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR10MB4531.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(6486002)(2906002)(4326008)(8676002)(31686004)(66476007)(6666004)(6506007)(83380400001)(66946007)(66556008)(6512007)(316002)(6916009)(107886003)(86362001)(38100700002)(8936002)(508600001)(36756003)(53546011)(186003)(2616005)(5660300002)(31696002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?enVldERaRmxLbVNiNUZYYk9vOTZsTGNVVUdwakVqUHRnNVU5RWE4eGpKaUZ5?=
 =?utf-8?B?ckVJaFhvQ3NaV2l5T09zNittMVFzOXdzbG4zN3l5aFgwOXRBM3F2dDFhZ2Mw?=
 =?utf-8?B?dTg3SEg0OE9oYVNZalVTTHFndnNqZWFKL0RKTkRMdHFuemdWMlJodUQ0V0lQ?=
 =?utf-8?B?SDVXanVCS0VOUXJKQnZic01iZHNodExDWEtDNE96Smh5cGxzMWRkSXhSd2NH?=
 =?utf-8?B?NmV4Q1Zja0JZTGdEN1ZkRHMvWUN1MUFDdUxpR2VvdWp4bkQ4NndRRkZPTFhR?=
 =?utf-8?B?VGhLdFhncmJEcEVRWFA1eGVSMXZLSHcxaW56Z0crdDJjVDNTUUR3bDJyUWFw?=
 =?utf-8?B?Q25FMElyZ0lPTVBvTGpLdlRBdWlXSlNLcG02cnJHaEtQdlhGWWJkTytRNm1v?=
 =?utf-8?B?ODJBaUNCbzZxOHhORlY5eis1cTFCZ2hGWXJRcW5rTFFpRXNteTZla09VZVRN?=
 =?utf-8?B?RTc3SHJnWUdGdWp0eHNma3ErcEt3ZnFEYVRHc2YxQTNGc293UmprbnRCYlBo?=
 =?utf-8?B?TGNPUS9Jb2h5VXp1ejNvNzhmMEUvbE5FN2V4TnFGWGtQRlJnRDQwZ1cxV1hU?=
 =?utf-8?B?T1Z0cDZjUzlqOC90OVBOREtTYjhBcFUvSGl0NkRhOGh1Y3N2a1hndHVYYVFj?=
 =?utf-8?B?WTc3RS9KUmVNWFo2TUNQK3JOeWRlSTBQMmFRVE9RNkxEV1FXNXpqNnUyNGU5?=
 =?utf-8?B?U1Zta3ZKMmJZb1V1UU1nR3ZwYmVHTENTSjhlWFVnUGdqQU8zZElrdVU5dmpK?=
 =?utf-8?B?VlpLTXpDcDdkVzRqMVFqRzBnMmdQSVh1U3o2TEdydFo4OVYwcFFLTXFSTkZJ?=
 =?utf-8?B?ejlOU2w0UTBtbml6bFdOcld5OXV3NE13QUFOQzFJZzdyZE1aTm1xZHVCR3hQ?=
 =?utf-8?B?eEw4ekpFNHF3Sm5LL09Cam1qMGNIcDdVdG1WNHdjUllHemQ3TXN6Q3dudEdv?=
 =?utf-8?B?Ky90eFJ0eDZjWEluNlc2ZUQraDVBWUc0Rk1YUm1yRHJvMGNOS3ZFWG5NbXZs?=
 =?utf-8?B?cG9YZklJM0EydXcrSlEyV0lteGsyaFU4Z2orTHNaR2NoYnh1T21XVWduaWdy?=
 =?utf-8?B?Sjd2Zmh5NUV3QWkwZW5xQXpZdnF1RnRDMnZLNkJIcFpGdVpqSGlRQTlQdzBD?=
 =?utf-8?B?QTRLTHhPbWllbXJmT2VtSlZIMmFKbGNSaUVla1NCSW02c01mQXhENnQ5ZXB5?=
 =?utf-8?B?Tld6MDBidnFGbk05T2x5eGxBMFNaSlNMT0w4NWhrOWFUUmdhZ3diTGI0cG95?=
 =?utf-8?B?QVRLOW42R29sMUZ2eXVFclVqRnkyNEpXV0k2a0lXKzJ2dThFcGZPTEFTN1BG?=
 =?utf-8?B?S2JtcEJMcmx3bWlSMFV3L0JoZkVSREUyeWRydklZV1EwamVLSUViM0M0WW90?=
 =?utf-8?B?RE1FUG84ZFJ0WG9KSGZ2MlRieHZHdGVJZnkwREp2NDlUMXpoL0tCWmwva1pJ?=
 =?utf-8?B?bXlaeWlubWlSNXJHckRvRThsSjEyb1NqZzJHRmU4SDF1TGV3eW9sblFWMWNQ?=
 =?utf-8?B?RWlFTlNxbXpwRXdjNUVzVkF0aGxWVWFtUVo0a25nUGZ6L0dkQ201c0FWeUZk?=
 =?utf-8?B?TUJrZmRSZjNWRFBYTkVBM0p2T3JzS1ptS2d2cDVPU0xXUk5iNGFlVEFyZlpP?=
 =?utf-8?B?MnBDWEE3M0FIUFVsWkNraEJzRUFOcHZnUWJobnU2VnN2QzRSV2h3N0RwZWRa?=
 =?utf-8?B?Q1E5YmcveHZMQnlZZExwZEJ1SnpPRzJXVDBLdGRnZ1JaR29tZFhnaGVpVlJU?=
 =?utf-8?B?Nk1wdXJnS3JCTmNtTWRHRGszRTdLK3ppenVJWnNhd2lHSmoyYXVqZzE5MDE0?=
 =?utf-8?B?SXhQaDNtTWhZeVlVVk5pUXdocExpOGZuTlZXazRwNGp3anFZQmpFVWdTdnEr?=
 =?utf-8?B?Ylo0UktmUUxKL1MwcXlFR1dsOTZ1bHpvVnpzc2ZDS0hwVGJOeEphNG5jNlVP?=
 =?utf-8?B?Zm9xb3VqOGI4M1FrQnRQYUM4RkNxRDhiQ3RsUlBpc3dCRVI5SU9OMDFpUnJ0?=
 =?utf-8?B?Qy9UcXZBanV0aHJYVGtMZm05SU10cHJwUTNKUmt4RVR6eW5mQ1k4bGdsWVAx?=
 =?utf-8?B?b0ZoYmZoZFhOTy9lcDNROEFodVY4dzVqdzhPaWp4YTFFV3YwSjByWGY0UWxp?=
 =?utf-8?B?VUxpcS9pWEtraE9oQWFjcUxPTmxUZW1tdUEzY256QWJETVRIWU5zUTRiYnR6?=
 =?utf-8?B?WlZKWUc3MlFRMmd0V1VCSTdNT0QzV2RyNmNkZTkySG1hVk56N0JOSGtodE80?=
 =?utf-8?B?RXRpWnZ1TFIzNml1dUs5K21Pb015YVNNR0YyNXNOZWpQNjJBK0xtYkdFd2Yr?=
 =?utf-8?Q?yNqOCcaQ0NCHCefn4V?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e10a859a-b394-4a53-d587-08d9d48ad206
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2022 22:45:00.8298 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k66TBUh53YL3IqTer+xfztJfvWvylKof3RxwnKBhXWecRqgNAXBueMf5sU2Q9a1UdlEOEzKVEdK0GPvSnKEgMeAVQK85QCHIvT0uYCbtvRY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1001MB2175
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10223
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 suspectscore=0 spamscore=0
 mlxlogscore=999 adultscore=0 phishscore=0 malwarescore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2201100146
X-Proofpoint-GUID: MHOccTRHaK5vH1u4NE1vAGQvRz9HKEFn
X-Proofpoint-ORIG-GUID: MHOccTRHaK5vH1u4NE1vAGQvRz9HKEFn
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=eric.devolder@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: berrange@redhat.com, ehabkost@redhat.com, konrad.wilk@oracle.com,
 qemu-devel@nongnu.org, pbonzini@redhat.com, ani@anisinha.ca,
 imammedo@redhat.com, boris.ostrovsky@oracle.com, rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Thanks for looking at this Michael, I've an inline response below.
eric

On 1/6/22 04:45, Michael S. Tsirkin wrote:
> On Wed, Dec 15, 2021 at 10:38:11AM -0500, Eric DeVolder wrote:
>> This builds the ACPI ERST table to inform OSPM how to communicate
>> with the acpi-erst device.
>>
>> Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>
>> ---
>>   hw/acpi/erst.c | 188 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++
>>   1 file changed, 188 insertions(+)
>>
>> diff --git a/hw/acpi/erst.c b/hw/acpi/erst.c
>> index bb6cad4..05177b3 100644
>> --- a/hw/acpi/erst.c
>> +++ b/hw/acpi/erst.c
>> @@ -59,6 +59,27 @@
>>   #define STATUS_RECORD_STORE_EMPTY     0x04
>>   #define STATUS_RECORD_NOT_FOUND       0x05
>>   
>> +/* ACPI 4.0: Table 17-19 Serialization Instructions */
>> +#define INST_READ_REGISTER                 0x00
>> +#define INST_READ_REGISTER_VALUE           0x01
>> +#define INST_WRITE_REGISTER                0x02
>> +#define INST_WRITE_REGISTER_VALUE          0x03
>> +#define INST_NOOP                          0x04
>> +#define INST_LOAD_VAR1                     0x05
>> +#define INST_LOAD_VAR2                     0x06
>> +#define INST_STORE_VAR1                    0x07
>> +#define INST_ADD                           0x08
>> +#define INST_SUBTRACT                      0x09
>> +#define INST_ADD_VALUE                     0x0A
>> +#define INST_SUBTRACT_VALUE                0x0B
>> +#define INST_STALL                         0x0C
>> +#define INST_STALL_WHILE_TRUE              0x0D
>> +#define INST_SKIP_NEXT_INSTRUCTION_IF_TRUE 0x0E
>> +#define INST_GOTO                          0x0F
>> +#define INST_SET_SRC_ADDRESS_BASE          0x10
>> +#define INST_SET_DST_ADDRESS_BASE          0x11
>> +#define INST_MOVE_DATA                     0x12
>> +
>>   /* UEFI 2.1: Appendix N Common Platform Error Record */
>>   #define UEFI_CPER_RECORD_MIN_SIZE 128U
>>   #define UEFI_CPER_RECORD_LENGTH_OFFSET 20U
>> @@ -172,6 +193,173 @@ typedef struct {
>>   
>>   /*******************************************************************/
>>   /*******************************************************************/
>> +
>> +/* ACPI 4.0: 17.4.1.2 Serialization Instruction Entries */
>> +static void build_serialization_instruction_entry(GArray *table_data,
>> +    uint8_t serialization_action,
>> +    uint8_t instruction,
>> +    uint8_t flags,
>> +    uint8_t register_bit_width,
>> +    uint64_t register_address,
>> +    uint64_t value)
>> +{
>> +    /* ACPI 4.0: Table 17-18 Serialization Instruction Entry */
>> +    struct AcpiGenericAddress gas;
>> +    uint64_t mask;
>> +
>> +    /* Serialization Action */
>> +    build_append_int_noprefix(table_data, serialization_action, 1);
>> +    /* Instruction */
>> +    build_append_int_noprefix(table_data, instruction         , 1);
>> +    /* Flags */
>> +    build_append_int_noprefix(table_data, flags               , 1);
>> +    /* Reserved */
>> +    build_append_int_noprefix(table_data, 0                   , 1);
>> +    /* Register Region */
>> +    gas.space_id = AML_SYSTEM_MEMORY;
>> +    gas.bit_width = register_bit_width;
>> +    gas.bit_offset = 0;
>> +    gas.access_width = ctz32(register_bit_width) - 2;
>> +    gas.address = register_address;
>> +    build_append_gas_from_struct(table_data, &gas);
>> +    /* Value */
>> +    build_append_int_noprefix(table_data, value  , 8);
>> +    /* Mask */
>> +    mask = (1ULL << (register_bit_width - 1) << 1) - 1;
>> +    build_append_int_noprefix(table_data, mask  , 8);
>> +}
>> +
>> +/* ACPI 4.0: 17.4.1 Serialization Action Table */
>> +void build_erst(GArray *table_data, BIOSLinker *linker, Object *erst_dev,
>> +    const char *oem_id, const char *oem_table_id)
>> +{
>> +    GArray *table_instruction_data;
>> +    unsigned action;
>> +    pcibus_t bar0 = pci_get_bar_addr(PCI_DEVICE(erst_dev), 0);
>> +    AcpiTable table = { .sig = "ERST", .rev = 1, .oem_id = oem_id,
>> +                        .oem_table_id = oem_table_id };
>> +
>> +    trace_acpi_erst_pci_bar_0(bar0);
>> +
>> +    /*
>> +     * Serialization Action Table
>> +     * The serialization action table must be generated first
>> +     * so that its size can be known in order to populate the
>> +     * Instruction Entry Count field.
>> +     */
>> +    table_instruction_data = g_array_new(FALSE, FALSE, sizeof(char));
>> +
>> +    /*
>> +     * Macros for use with construction of the action instructions
>> +     */
>> +#define build_read_register(action, width_in_bits, reg) \
>> +    build_serialization_instruction_entry(table_instruction_data, \
>> +        action, INST_READ_REGISTER, 0, width_in_bits, \
>> +        bar0 + reg, 0)
>> +
>> +#define build_read_register_value(action, width_in_bits, reg, value) \
>> +    build_serialization_instruction_entry(table_instruction_data, \
>> +        action, INST_READ_REGISTER_VALUE, 0, width_in_bits, \
>> +        bar0 + reg, value)
>> +
>> +#define build_write_register(action, width_in_bits, reg, value) \
>> +    build_serialization_instruction_entry(table_instruction_data, \
>> +        action, INST_WRITE_REGISTER, 0, width_in_bits, \
>> +        bar0 + reg, value)
>> +
>> +#define build_write_register_value(action, width_in_bits, reg, value) \
>> +    build_serialization_instruction_entry(table_instruction_data, \
>> +        action, INST_WRITE_REGISTER_VALUE, 0, width_in_bits, \
>> +        bar0 + reg, value)
> 
> I'm not sure why these are macros not functions.
> But assuming it's preferable this way, pls make them
> use ALL_CAPS as per QEMU coding style.
> 

For brevity I chose to have these 4 macros of 4 lines each, rather than replicate 4 functions of 25 
lines each.

I have uppercased the macros to follow style.rst.

I've posted v12 with these changes.

Thanks!
eric

> 
>> +
>> +    /* Serialization Instruction Entries */
>> +    action = ACTION_BEGIN_WRITE_OPERATION;
>> +    build_write_register_value(action, 32, ERST_ACTION_OFFSET, action);
>> +
>> +    action = ACTION_BEGIN_READ_OPERATION;
>> +    build_write_register_value(action, 32, ERST_ACTION_OFFSET, action);
>> +
>> +    action = ACTION_BEGIN_CLEAR_OPERATION;
>> +    build_write_register_value(action, 32, ERST_ACTION_OFFSET, action);
>> +
>> +    action = ACTION_END_OPERATION;
>> +    build_write_register_value(action, 32, ERST_ACTION_OFFSET, action);
>> +
>> +    action = ACTION_SET_RECORD_OFFSET;
>> +    build_write_register(action, 32, ERST_VALUE_OFFSET, 0);
>> +    build_write_register_value(action, 32, ERST_ACTION_OFFSET, action);
>> +
>> +    action = ACTION_EXECUTE_OPERATION;
>> +    build_write_register_value(action, 32, ERST_VALUE_OFFSET,
>> +        ERST_EXECUTE_OPERATION_MAGIC);
>> +    build_write_register_value(action, 32, ERST_ACTION_OFFSET, action);
>> +
>> +    action = ACTION_CHECK_BUSY_STATUS;
>> +    build_write_register_value(action, 32, ERST_ACTION_OFFSET, action);
>> +    build_read_register_value(action, 32, ERST_VALUE_OFFSET, 0x01);
>> +
>> +    action = ACTION_GET_COMMAND_STATUS;
>> +    build_write_register_value(action, 32, ERST_ACTION_OFFSET, action);
>> +    build_read_register(action, 32, ERST_VALUE_OFFSET);
>> +
>> +    action = ACTION_GET_RECORD_IDENTIFIER;
>> +    build_write_register_value(action, 32, ERST_ACTION_OFFSET, action);
>> +    build_read_register(action, 64, ERST_VALUE_OFFSET);
>> +
>> +    action = ACTION_SET_RECORD_IDENTIFIER;
>> +    build_write_register(action, 64, ERST_VALUE_OFFSET, 0);
>> +    build_write_register_value(action, 32, ERST_ACTION_OFFSET, action);
>> +
>> +    action = ACTION_GET_RECORD_COUNT;
>> +    build_write_register_value(action, 32, ERST_ACTION_OFFSET, action);
>> +    build_read_register(action, 32, ERST_VALUE_OFFSET);
>> +
>> +    action = ACTION_BEGIN_DUMMY_WRITE_OPERATION;
>> +    build_write_register_value(action, 32, ERST_ACTION_OFFSET, action);
>> +
>> +    action = ACTION_GET_ERROR_LOG_ADDRESS_RANGE;
>> +    build_write_register_value(action, 32, ERST_ACTION_OFFSET, action);
>> +    build_read_register(action, 64, ERST_VALUE_OFFSET);
>> +
>> +    action = ACTION_GET_ERROR_LOG_ADDRESS_LENGTH;
>> +    build_write_register_value(action, 32, ERST_ACTION_OFFSET, action);
>> +    build_read_register(action, 64, ERST_VALUE_OFFSET);
>> +
>> +    action = ACTION_GET_ERROR_LOG_ADDRESS_RANGE_ATTRIBUTES;
>> +    build_write_register_value(action, 32, ERST_ACTION_OFFSET, action);
>> +    build_read_register(action, 32, ERST_VALUE_OFFSET);
>> +
>> +    action = ACTION_GET_EXECUTE_OPERATION_TIMINGS;
>> +    build_write_register_value(action, 32, ERST_ACTION_OFFSET, action);
>> +    build_read_register(action, 64, ERST_VALUE_OFFSET);
>> +
>> +    /* Serialization Header */
>> +    acpi_table_begin(&table, table_data);
>> +
>> +    /* Serialization Header Size */
>> +    build_append_int_noprefix(table_data, 48, 4);
>> +
>> +    /* Reserved */
>> +    build_append_int_noprefix(table_data,  0, 4);
>> +
>> +    /*
>> +     * Instruction Entry Count
>> +     * Each instruction entry is 32 bytes
>> +     */
>> +    g_assert((table_instruction_data->len) % 32 == 0);
>> +    build_append_int_noprefix(table_data,
>> +        (table_instruction_data->len / 32), 4);
>> +
>> +    /* Serialization Instruction Entries */
>> +    g_array_append_vals(table_data, table_instruction_data->data,
>> +        table_instruction_data->len);
>> +    g_array_free(table_instruction_data, TRUE);
>> +
>> +    acpi_table_end(linker, &table);
>> +}
>> +
>> +/*******************************************************************/
>> +/*******************************************************************/
>>   static uint8_t *get_nvram_ptr_by_index(ERSTDeviceState *s, unsigned index)
>>   {
>>       uint8_t *rc = NULL;
>> -- 
>> 1.8.3.1
> 

