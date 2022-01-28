Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1495149FF88
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Jan 2022 18:28:17 +0100 (CET)
Received: from localhost ([::1]:39258 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDV2m-0002g0-5f
	for lists+qemu-devel@lfdr.de; Fri, 28 Jan 2022 12:28:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37544)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1nDTgu-0007jD-3U
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 11:01:39 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:7768)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1nDTgp-0002ru-MJ
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 11:01:34 -0500
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20SFSw6B015124; 
 Fri, 28 Jan 2022 16:01:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=qpBY0+mMYcs666k4ZTZ8oUpjtQ+VJviNyP4KXWEZ8hg=;
 b=ors3C9UFgzfy6wzdOiTx11wnPHysSErZBkOp4VBDGZ2q+/82V75dmqLsS9bHN4tP5y0h
 pU1/rhRrEV1uA95enwocOle88sDM/K0REso5r+WN/8mjKijH/fFumlIMTcguxIn1t1q5
 1GyQbrMtoKGyg0M4yKk7bYgGG+Eo67fAvLBNRSjOLlxyx7Sq3V+7DU25TYCys2TLoSNp
 UgDhkE3qUubEOi4iAiASTZOwiDg7H5MvH7pG+aAQY9ISbNp1P3nTkp04CNFjZKwIHCCy
 Pr92BaYcQyTDNAJ9Egdlz8ua1X43kJmYpLt2YYg8wVA/+hd0b7DkriRF43bJrIr3oEe4 XA== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 3duwrxknrt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 28 Jan 2022 16:01:26 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 20SG0v4q136103;
 Fri, 28 Jan 2022 16:01:25 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2103.outbound.protection.outlook.com [104.47.55.103])
 by aserp3020.oracle.com with ESMTP id 3dtaxcnvk1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 28 Jan 2022 16:01:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gRciUK1vtvL+8Th85TXJW6z3qIGlK5W54D1NtZ0Z23v/sijs584+oi+AdmuADSWFpdsjMZBZ40O5vvfxrYS/onJ5Z7PoVN8XR84jebIL/1xi82glevGorBwTSj3Pcd+IUYqgHR26flaIrOp0jrNcCMWGrdXeMiqgZ1/bbhIOK5qtdtAEBCU+Y3IvkZsjcBTbD7qTq3yXFiGpwNe7s63yLY+TMCD1k5nOaJ/lGdVadHt8OpraBMOhs++PUk5OTXKL3ZgDq8E8y/fN1MRNcaxsDVBjrUjlvb/247jgeVlf+RyPjQ9vkHy8x5HuY+w+TBKo1eI/mdUnixmJS16VjaC2vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qpBY0+mMYcs666k4ZTZ8oUpjtQ+VJviNyP4KXWEZ8hg=;
 b=GYib1WiyhOuJXwFPr5OqT/64F+O0XfRZfkbA1BG6GRJHgBKm+bTVxTne4f7BI52LnrHxbbCsbAsHPhfeGN5gLYfYkcztFRWcnthoppg3wHFBLUA6/K2FfqyNMLTt0GVQAglnk+zHFU1SoJ0ii1sHdWuZLmUSWrDIICLbIGCvYHJZvI4wWVxEZalR74kcDdU4mUHhUEUUP/u5fq0ER7zGH9H4qSoeVWIrSBsq3pE1DLv2NBW73dRxv02hkwNY6NJgJWjxq/qL4K75TXNRiSyluSsWVQi7Kqw4ALYPbmhsz7Wg+lP7xBsYX1wb07P2l+I+Q/cJ7Wdb1zBGJWiK6fcFKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qpBY0+mMYcs666k4ZTZ8oUpjtQ+VJviNyP4KXWEZ8hg=;
 b=ucx433aheooiNAPUVD9iGT/RBAp2zqBm753p5smFruwOtJUR2YTiTE3NWXoESYzGTEF7bVF1R7ew/+HaNVwGYp4z+66RjDAaAY+xQU/KGzVoir8/Yl7ekTb2iV6gcuOO9c6wPYpfEIl/TseYUWZy8DuoC816xqCmZyBQ77/Ks7Q=
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by PH0PR10MB5794.namprd10.prod.outlook.com (2603:10b6:510:ff::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.7; Fri, 28 Jan
 2022 16:01:22 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::ac06:be4:5723:771c]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::ac06:be4:5723:771c%4]) with mapi id 15.20.4930.019; Fri, 28 Jan 2022
 16:01:22 +0000
Message-ID: <db012849-b7ec-eecc-bf41-a6b211c021f0@oracle.com>
Date: Fri, 28 Jan 2022 10:01:18 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v14 06/10] ACPI ERST: build the ACPI ERST table
Content-Language: en-US
To: "Michael S. Tsirkin" <mst@redhat.com>
References: <1643214514-2839-1-git-send-email-eric.devolder@oracle.com>
 <1643214514-2839-7-git-send-email-eric.devolder@oracle.com>
 <alpine.OSX.2.20.2201271401250.42000@athabasca.local>
 <1f544cb3-7434-3480-63fc-ff317327ea78@oracle.com>
 <20220127193136-mutt-send-email-mst@kernel.org>
 <c5460e4e-61dd-78ad-6703-e518a8302097@oracle.com>
 <20220128105311-mutt-send-email-mst@kernel.org>
From: Eric DeVolder <eric.devolder@oracle.com>
In-Reply-To: <20220128105311-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN4PR0801CA0022.namprd08.prod.outlook.com
 (2603:10b6:803:29::32) To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0d261f77-02d4-44b0-fb2c-08d9e2776de5
X-MS-TrafficTypeDiagnostic: PH0PR10MB5794:EE_
X-Microsoft-Antispam-PRVS: <PH0PR10MB579455505FF024DDC62DD5AA97229@PH0PR10MB5794.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hWzb3i6ywHhPVWxelC9I3aV04rvvaLKqelat9wEyjiVS0EQm7eUo8TfYkBw3UYp7H/Q2hK2uUZ2K9g8nIlIvPkaKAP5dTp77Zeaq2JIAWseRjPybMdXyjsPjQnuF06bRW129TfqVYpy8ShOlcPnXpHFvwc3AzCIMYaj9VLM5JgI3lEW4+kw343+B9kHprjwMVhX8xlZ0SCOrF2Vq+ELGKs/qfckKbCLvfrylNFxjgdcd0DyjlGO0fDIz0kUa7CDUhTHWak7anWm4t9IlMF7xnX/eHykDQhsVMkL0Gl6/MQP79Ojl3G+RbKzZbMc/zto5zkpllcovjj0ArnraHl194mLd4El3QoE+ozbmPWgpbE2U7Ulf6FKuVj6J88pmfLIa/QFE8FeLY+WQgVf4JRpQXDlbU3YnTxTXtLEhjiODXecb9a+akouu9m3a6wennJ3t5LCq1D9lET04NKdwFgbwvnL3Cs1mh7DSAX+FUXdqC7zzQ5qI3SpVaPnI7VSJrST1HbyIe3zkQ0BWMMOhV+qu4R4apepvUe+hRrKwJEK2E02XQKfeG42TPU+xzuziuExin/9ORLMfIvF2DEayUJZQT84Z1yCPh+ZdJmLDqwEIg/TLHdEKZtWrBsXbHSqeDNPU/3scfOxP9at/DT7a4sVO57WTS8bLArYJXIgh9rHbXekxFwP9TO4h1pnkJwAEE+klWWAF4Ba8ALMWcJI61X8tHggs99xuaPpW5Ex5BeTxWbM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR10MB4531.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(316002)(31686004)(8936002)(6512007)(8676002)(66946007)(31696002)(508600001)(2906002)(6916009)(6506007)(53546011)(36756003)(66476007)(66556008)(6666004)(2616005)(5660300002)(186003)(38100700002)(86362001)(6486002)(107886003)(83380400001)(30864003)(4326008)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N1RKVW9QczJ6eGQ5QlIwZXpWMmV2T1dCOW5jWnl6ZUtQMitXT3NMQXJnYUxM?=
 =?utf-8?B?QzNiaUEwdjJYa1hERGRZMm5jcnEwbGJ3S0dWbXhBUEtLYm5jRWJTSnkwVVNi?=
 =?utf-8?B?NTI5VTlJSEdhcTdwMy9aeSttLy93Wkw5emNTY0RZYVZ6S3pEOHRtOVJPemNW?=
 =?utf-8?B?R1o0bko1TzAyNkdtckttMmkvZzJrSEk1REVxaVAranNXRU1sdEhrd1NERE5p?=
 =?utf-8?B?SWliREd4S05mWS9rK3AxTTVmdXk1M3lXeUt3dHQwUmt6YXdiVW43VUxwbU42?=
 =?utf-8?B?SjBBTjdXTVBXUzJLZHEvcWNlWWlNSk1SWHFLNXBhUGloZ3Vjcnhpa09oK01N?=
 =?utf-8?B?Zk01czlqcys4ZDI0ckhOZFVXeUJPTHNPSkFLMnpLcGZKeFVYSUllRktSdGw5?=
 =?utf-8?B?eGlvODhBanR6MWhpZUJDU2dvNzEzc0twbHJOV25HVnkyeXcvMmcxU1JXOXBB?=
 =?utf-8?B?VGdaZ1M4ZlIyU04vOHJ5dXRteTNQeGtHcHNxN1Fla0I2bk1sSlducmpWbzRl?=
 =?utf-8?B?NEZHMlg3U0VzZjRjVzhBMVh5akl4eVpzUGt5WXl2M1RrZDlUcnlkaE1yMG82?=
 =?utf-8?B?SmhMTVVtTW5XRUNENmhCRlFNZEg1THloS2dCTVdBUmdMTGlENE5JUENXeTZW?=
 =?utf-8?B?cFU0N3pTYjBPek5zZlZGWjU2MnoxcytDUFRZL0oxMUFRK2NKdDRNZTRtU3lX?=
 =?utf-8?B?RytEWHExQnVkdU5RRzR2bnlYRU9iajFBemEvOG9BcEFCUmkwa1BBOUcwREtZ?=
 =?utf-8?B?Mis0ekV6R3R1ZTQ4ejdQR0k0d3AzbmpKeEZFS0lJc1N0N24ra0h4Y1M1TVB6?=
 =?utf-8?B?Yjh1Sys5cXhaQXVQTVBjVEVvck5HRnZlVFpDcFdhQTZHVjVqaHI0NnJqZWtC?=
 =?utf-8?B?ektuVCthSmlnc1lrMTBSdCtsWjFjdXBKOU9vSFEydUE5NmJSL3I2YmgwVW1o?=
 =?utf-8?B?Q3lVUE90MVdYODhMTnB3ajVsZXdrZXFRTHhMZGVjb0tPS1dveU5IM0tIdWRn?=
 =?utf-8?B?dTllUXZuWVFsWDA0b2ZiQXJudVh1THFST005Ym5GSHpDVytrRGhqMEUraVNj?=
 =?utf-8?B?QVhlYm8rU2tZNTdxRzVrU0RyQlhLZmZqVzFkMFNkNjM3RXNyMVltZy9oWmFC?=
 =?utf-8?B?QU9UaFRtZDZKSksxMzhrQWdYdUFkSkkxeTJWSXJ0QThiQk5ybmF2UU8vSVQr?=
 =?utf-8?B?QmlFdDNsOEVpSFh2dE5MNUNMWVFMcCtkQnZtaCtiNURhTTE5SVJwSURXYVpV?=
 =?utf-8?B?aG12UVhQdDl5aklINHU3NFNoaTdkVlZKZHBtN29SN2VkMkt1LzhaVElabFYv?=
 =?utf-8?B?Qm9tK0pGQ3Nic04wQlI5blB2bWtJenJBazdLMHg3RENsMU80MENCWDJPS0pU?=
 =?utf-8?B?TkM0QkdNYm94amdiV3QyT2RXTVMzRFg0UWt0ckM5ZWNJc2xSOTkvZ3F4MEQx?=
 =?utf-8?B?OU95aEh5Y2Q0dkczTjBFL0lVWUd4NEoxaGllNGdrTGNLVUl0c0w0ZGVYSzdp?=
 =?utf-8?B?S0lEa1JqQ1V3WjRKbEtJbTZKaFUwY2VMKy92VUpFSzlUTlRseGRaMVBSRWp1?=
 =?utf-8?B?VVJKR3QyWmFCaUpsdlVFeEg0TmhDcXljemMyNUV3c2h1S2hMY2ZrZDViNTNU?=
 =?utf-8?B?c0ZrTVhWU29Oek40MGQwU1ZFYk4wRDdyWEllMjNhM3BUQ0NiRlk0MHdzaTVH?=
 =?utf-8?B?bjYrRTVqRzZQMENXM1dJMzI3VVEzSktlV1RTazFIaHFqbGY1Q2o2YjMxUjFj?=
 =?utf-8?B?ZnYwNEVOK0NKYkFtKzBTMXJ4RVR6SW9IbWJpemE3MDJ1b1NTNG1rZ1dpbUhB?=
 =?utf-8?B?RDNjdEhDU3NRQjlDWlRxY2hpVW15aS8xZ2tnUHZ0N3hoNmhRZ2VQTmhuNjNK?=
 =?utf-8?B?c0hWcFdwVmZ5aENZcWc2eXlFRlVCVFNMcGhmMGM2SDJNVmhOYk1QTmRlbmNL?=
 =?utf-8?B?U0VBZmZJVjV6UkNjSGhPL3V6M1pJYnUzNU5zUmJpcTREZTJKeW5nbFZGcjN0?=
 =?utf-8?B?dE14bkdhQzVDRUhRMTRMQThYNHkrbVIxR3JkcVdiRVpObktSbjlUeTNYMHFw?=
 =?utf-8?B?SGU0QUEvTkQzcnhKYi91eXNHc0VCb2IxTEhFdzR0Skd5OXBYQkEycWNzdmhR?=
 =?utf-8?B?cUZwa052V0hHOUdmVHcwUWNSSHJpeFNaWDZxNHAybk5NWUNWYWdwbkgxb1pO?=
 =?utf-8?B?YWZYdnlPMnE3cnJzdVdLTGVUajRIVmc3TGg5bjdHcVZMdzUyTTltNHFCZVF2?=
 =?utf-8?B?ZC9ab2hBV01tRG1XNDJCbzhrem5sMWh0QTFiTWowYWUzSTBXM1RiZW1xUWQv?=
 =?utf-8?Q?gxrejMd+PiBRF/ZpUL?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d261f77-02d4-44b0-fb2c-08d9e2776de5
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2022 16:01:22.5222 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fEe79Ed85eaKqQ866JK7Xghk7YvAzEUni29ddTtK8bCmj5qEXr17h5kYSMErsHizki4+QtwRnuDRREpOWK9MrcTwHi5yCuJFR6XWDlkwIto=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB5794
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10240
 signatures=669575
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 bulkscore=0 mlxscore=0
 phishscore=0 suspectscore=0 spamscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2201280101
X-Proofpoint-GUID: w_obxCeWIni-PAOqG1Sb_OLtt0PQY7Ru
X-Proofpoint-ORIG-GUID: w_obxCeWIni-PAOqG1Sb_OLtt0PQY7Ru
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=eric.devolder@oracle.com; helo=mx0a-00069f02.pphosted.com
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
Cc: berrange@redhat.com, ehabkost@redhat.com, konrad.wilk@oracle.com,
 qemu-devel@nongnu.org, pbonzini@redhat.com, Ani Sinha <ani@anisinha.ca>,
 imammedo@redhat.com, boris.ostrovsky@oracle.com, rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Michael, thanks! See inline response below, please.
eric

On 1/28/22 09:54, Michael S. Tsirkin wrote:
> On Fri, Jan 28, 2022 at 09:11:41AM -0600, Eric DeVolder wrote:
>> Michael,
>> Thanks for examining this. Inline response below.
>> eric
>>
>> On 1/27/22 18:37, Michael S. Tsirkin wrote:
>>> On Thu, Jan 27, 2022 at 04:02:07PM -0600, Eric DeVolder wrote:
>>>> Ani,
>>>> Thanks for the RB! Inline responses below.
>>>> eric
>>>>
>>>> On 1/27/22 02:36, Ani Sinha wrote:
>>>>>
>>>>>
>>>>> On Wed, 26 Jan 2022, Eric DeVolder wrote:
>>>>>
>>>>>> This builds the ACPI ERST table to inform OSPM how to communicate
>>>>>> with the acpi-erst device.
>>>>>
>>>>> There might be more optimizations possible but I think we have messaged
>>>>> this code enough. We can further rework the code if needed in subsequent
>>>>> patches once this is pushed.
>>>>>
>>>>>>
>>>>>> Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>
>>>>>
>>>>> with some minor comments,
>>>>>
>>>>> Reviewed-by: Ani Sinha <ani@anisinha.ca>
>>>>>
>>>>>>     hw/acpi/erst.c | 225 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++
>>>>>>     1 file changed, 225 insertions(+)
>>>>>>
>>>>>> diff --git a/hw/acpi/erst.c b/hw/acpi/erst.c
>>>>>> index fe9ba51..5d5a639 100644
>>>>>> --- a/hw/acpi/erst.c
>>>>>> +++ b/hw/acpi/erst.c
>>>>>> @@ -59,6 +59,27 @@
>>>>>>     #define STATUS_RECORD_STORE_EMPTY     0x04
>>>>>>     #define STATUS_RECORD_NOT_FOUND       0x05
>>>>>>
>>>>>> +/* ACPI 4.0: Table 17-19 Serialization Instructions */
>>>>>> +#define INST_READ_REGISTER                 0x00
>>>>>> +#define INST_READ_REGISTER_VALUE           0x01
>>>>>> +#define INST_WRITE_REGISTER                0x02
>>>>>> +#define INST_WRITE_REGISTER_VALUE          0x03
>>>>>> +#define INST_NOOP                          0x04
>>>>>> +#define INST_LOAD_VAR1                     0x05
>>>>>> +#define INST_LOAD_VAR2                     0x06
>>>>>> +#define INST_STORE_VAR1                    0x07
>>>>>> +#define INST_ADD                           0x08
>>>>>> +#define INST_SUBTRACT                      0x09
>>>>>> +#define INST_ADD_VALUE                     0x0A
>>>>>> +#define INST_SUBTRACT_VALUE                0x0B
>>>>>> +#define INST_STALL                         0x0C
>>>>>> +#define INST_STALL_WHILE_TRUE              0x0D
>>>>>> +#define INST_SKIP_NEXT_INSTRUCTION_IF_TRUE 0x0E
>>>>>> +#define INST_GOTO                          0x0F
>>>>>> +#define INST_SET_SRC_ADDRESS_BASE          0x10
>>>>>> +#define INST_SET_DST_ADDRESS_BASE          0x11
>>>>>> +#define INST_MOVE_DATA                     0x12
>>>>>> +
>>>>>>     /* UEFI 2.1: Appendix N Common Platform Error Record */
>>>>>>     #define UEFI_CPER_RECORD_MIN_SIZE 128U
>>>>>>     #define UEFI_CPER_RECORD_LENGTH_OFFSET 20U
>>>>>> @@ -172,6 +193,210 @@ typedef struct {
>>>>>>
>>>>>>     /*******************************************************************/
>>>>>>     /*******************************************************************/
>>>>>> +typedef struct {
>>>>>> +    GArray *table_data;
>>>>>> +    pcibus_t bar;
>>>>>> +    uint8_t instruction;
>>>>>> +    uint8_t flags;
>>>>>> +    uint8_t register_bit_width;
>>>>>> +    pcibus_t register_offset;
>>>>>> +} BuildSerializationInstructionEntry;
>>>>>> +
>>>>>> +/* ACPI 4.0: 17.4.1.2 Serialization Instruction Entries */
>>>>>> +static void build_serialization_instruction(
>>>>>> +    BuildSerializationInstructionEntry *e,
>>>>>> +    uint8_t serialization_action,
>>>>>> +    uint64_t value)
>>>>>> +{
>>>>>> +    /* ACPI 4.0: Table 17-18 Serialization Instruction Entry */
>>>>>> +    struct AcpiGenericAddress gas;
>>>>>> +    uint64_t mask;
>>>>>> +
>>>>>> +    /* Serialization Action */
>>>>>> +    build_append_int_noprefix(e->table_data, serialization_action, 1);
>>>>>> +    /* Instruction */
>>>>>> +    build_append_int_noprefix(e->table_data, e->instruction, 1);
>>>>>> +    /* Flags */
>>>>>> +    build_append_int_noprefix(e->table_data, e->flags, 1);
>>>>>> +    /* Reserved */
>>>>>> +    build_append_int_noprefix(e->table_data, 0, 1);
>>>>>> +    /* Register Region */
>>>>>> +    gas.space_id = AML_SYSTEM_MEMORY;
>>>>>> +    gas.bit_width = e->register_bit_width;
>>>>>> +    gas.bit_offset = 0;
>>>>>> +    gas.access_width = ctz32(e->register_bit_width) - 2;
>>>>>
>>>>> Should this be casted as unit8_t?
>>>> OK, done.
>>>>
>>>>>
>>>>>> +    gas.address = (uint64_t)(e->bar + e->register_offset);
>>>>>> +    build_append_gas_from_struct(e->table_data, &gas);
>>>>>> +    /* Value */
>>>>>> +    build_append_int_noprefix(e->table_data, value, 8);
>>>>>> +    /* Mask */
>>>>>> +    mask = (1ULL << (e->register_bit_width - 1) << 1) - 1;
>>>>>> +    build_append_int_noprefix(e->table_data, mask, 8);
>>>>>> +}
>>>>>> +
>>>>>> +/* ACPI 4.0: 17.4.1 Serialization Action Table */
>>>>>> +void build_erst(GArray *table_data, BIOSLinker *linker, Object *erst_dev,
>>>>>> +    const char *oem_id, const char *oem_table_id)
>>>>>> +{
>>>>>> +    /*
>>>>>> +     * Serialization Action Table
>>>>>> +     * The serialization action table must be generated first
>>>>>> +     * so that its size can be known in order to populate the
>>>>>> +     * Instruction Entry Count field.
>>>>>> +     */
>>>>>> +    GArray *table_instruction_data = g_array_new(FALSE, FALSE, sizeof(char));
>>>>>> +    pcibus_t bar0 = pci_get_bar_addr(PCI_DEVICE(erst_dev), 0);
>>>>>> +    AcpiTable table = { .sig = "ERST", .rev = 1, .oem_id = oem_id,
>>>>>> +                        .oem_table_id = oem_table_id };
>>>>>> +    /* Contexts for the different ways ACTION and VALUE are accessed */
>>>>>> +    BuildSerializationInstructionEntry rd_value_32_val = {
>>>>>> +        .table_data = table_instruction_data,
>>>>>> +        .bar = bar0,
>>>>>> +        .instruction = INST_READ_REGISTER_VALUE,
>>>>>> +        .flags = 0,
>>>>>> +        .register_bit_width = 32,
>>>>>> +        .register_offset = ERST_VALUE_OFFSET,
>>>>>> +    };
>>>>>> +    BuildSerializationInstructionEntry rd_value_32 = {
>>>>>> +        .table_data = table_instruction_data,
>>>>>> +        .bar = bar0,
>>>>>> +        .instruction = INST_READ_REGISTER,
>>>>>> +        .flags = 0,
>>>>>> +        .register_bit_width = 32,
>>>>>> +        .register_offset = ERST_VALUE_OFFSET,
>>>>>> +    };
>>>>>> +    BuildSerializationInstructionEntry rd_value_64 = {
>>>>>> +        .table_data = table_instruction_data,
>>>>>> +        .bar = bar0,
>>>>>> +        .instruction = INST_READ_REGISTER,
>>>>>> +        .flags = 0,
>>>>>> +        .register_bit_width = 64,
>>>>>> +        .register_offset = ERST_VALUE_OFFSET,
>>>>>> +    };
>>>>>> +    BuildSerializationInstructionEntry wr_value_32_val = {
>>>>>> +        .table_data = table_instruction_data,
>>>>>> +        .bar = bar0,
>>>>>> +        .instruction = INST_WRITE_REGISTER_VALUE,
>>>>>> +        .flags = 0,
>>>>>> +        .register_bit_width = 32,
>>>>>> +        .register_offset = ERST_VALUE_OFFSET,
>>>>>> +    };
>>>>>> +    BuildSerializationInstructionEntry wr_value_32 = {
>>>>>> +        .table_data = table_instruction_data,
>>>>>> +        .bar = bar0,
>>>>>> +        .instruction = INST_WRITE_REGISTER,
>>>>>> +        .flags = 0,
>>>>>> +        .register_bit_width = 32,
>>>>>> +        .register_offset = ERST_VALUE_OFFSET,
>>>>>> +    };
>>>>>> +    BuildSerializationInstructionEntry wr_value_64 = {
>>>>>> +        .table_data = table_instruction_data,
>>>>>> +        .bar = bar0,
>>>>>> +        .instruction = INST_WRITE_REGISTER,
>>>>>> +        .flags = 0,
>>>>>> +        .register_bit_width = 64,
>>>>>> +        .register_offset = ERST_VALUE_OFFSET,
>>>>>> +    };
>>>>>> +    BuildSerializationInstructionEntry wr_action = {
>>>>>> +        .table_data = table_instruction_data,
>>>>>> +        .bar = bar0,
>>>>>> +        .instruction = INST_WRITE_REGISTER_VALUE,
>>>>>> +        .flags = 0,
>>>>>> +        .register_bit_width = 32,
>>>>>> +        .register_offset = ERST_ACTION_OFFSET,
>>>>>> +    };
>>>>>
>>>>> We can probably write a macro to simply generating these structs. I see
>>>>> .bar and .flags are the same in all structs. The .bit_width can be a param
>>>>> into the macro etc.
>>>> Agree, however the request was to NOT hide the use of local variables in
>>>> macros, so while .flags is always 0, .instruction, .register_bit_width and .register_offset
>>>> would be parameters, that leaves .table_data and .bar which just need the local
>>>> variables. Is the following acceptable (which hides the use of the local variables)?
>>>
>>> You can just use assignment:
>>>
>>>      BuildSerializationInstructionEntry entry = {
>>>          .table_data = table_instruction_data,
>>>          .bar = bar0,
>>>          .flags = 0,
>>>          .register_bit_width = 32,
>>>      };
>>>      BuildSerializationInstructionEntry rd_value_32_val = entry;
>>>      rd_value_32_val.action = INST_READ_REGISTER_VALUE;
>>>      rd_value_32_val.register_offset = ERST_ACTION_OFFSET;
>>>
>>> and so on.
>>> not sure it's worth it, it's just a couple of lines.
>>>
>>
>> OK, here is the equivalent using struct assignment, is this what you were after?
>>
>>      BuildSerializationInstructionEntry base = {
>>          .table_data = table_instruction_data,
>>          .bar = bar0,
>>          .instruction = INST_WRITE_REGISTER,
>>          .flags = 0,
>>          .register_bit_width = 32,
>>          .register_offset = ERST_VALUE_OFFSET,
>>      };
>>      BuildSerializationInstructionEntry rd_value_32_val = base;
>>      rd_value_32_val.instruction = INST_READ_REGISTER_VALUE;
>>      BuildSerializationInstructionEntry rd_value_32 = base;
>>      rd_value_32.instruction = INST_READ_REGISTER;
>>      BuildSerializationInstructionEntry rd_value_64 = base;
>>      rd_value_64.instruction = INST_READ_REGISTER;
>>      rd_value_64.register_bit_width = 64;
>>      BuildSerializationInstructionEntry wr_value_32_val = base;
>>      wr_value_32_val.instruction = INST_WRITE_REGISTER_VALUE;
>>      BuildSerializationInstructionEntry wr_value_32 = base;
>>      BuildSerializationInstructionEntry wr_value_64 = base;
>>      wr_value_64.register_bit_width = 64;
>>      BuildSerializationInstructionEntry wr_action = base;
>>      wr_action.instruction = INST_WRITE_REGISTER_VALUE;
>>      wr_action.register_offset = ERST_ACTION_OFFSET;
>>
> 
> That's what I described, yes. We should have some empty lines here I
> guess. I'm ok with the original one too, there's not too much
> duplication.

Are the blank lines referring to spacing out the setup of each of the 7 accesors?
If so, I could put a one line comment between each setup? Or is a blank line also
needed?

Is it OK to post v15 with the struct assignment approach? Or would you prefer the
explicit structs (which is what I think you mean by 'the original one')?

Thanks!
eric
> 
> 
>>
>>>
>>>
>>>> #define SERIALIZATIONINSTRUCTIONCTX(name, \
>>>>       inst, bit_width, offset) \
>>>>       BuildSerializationInstructionEntry name = { \
>>>>           .table_data = table_instruction_data, \
>>>>           .bar = bar0, \
>>>>           .instruction = inst, \
>>>>           .flags = 0, \
>>>>           .register_bit_width = bit_width, \
>>>>           .register_offset = offset, \
>>>>       }
>>>>       SERIALIZATIONINSTRUCTIONCTX(rd_value_32_val,
>>>>           INST_READ_REGISTER_VALUE, 32, ERST_VALUE_OFFSET);
>>>>       SERIALIZATIONINSTRUCTIONCTX(rd_value_32,
>>>>           INST_READ_REGISTER, 32, ERST_VALUE_OFFSET);
>>>>       SERIALIZATIONINSTRUCTIONCTX(rd_value_64,
>>>>           INST_READ_REGISTER, 64, ERST_VALUE_OFFSET);
>>>>       SERIALIZATIONINSTRUCTIONCTX(wr_value_32_val,
>>>>           INST_WRITE_REGISTER_VALUE, 32, ERST_VALUE_OFFSET);
>>>>       SERIALIZATIONINSTRUCTIONCTX(wr_value_32,
>>>>           INST_WRITE_REGISTER, 32, ERST_VALUE_OFFSET);
>>>>       SERIALIZATIONINSTRUCTIONCTX(wr_value_64,
>>>>           INST_WRITE_REGISTER, 64, ERST_VALUE_OFFSET);
>>>>       SERIALIZATIONINSTRUCTIONCTX(wr_action,
>>>>           INST_WRITE_REGISTER_VALUE, 32, ERST_ACTION_OFFSET);
>>>>
>>>> These are the 7 accessors needed.
>>>
>>> not at all sure this one is worth the macro mess.
>>
>> I'm hoping to produce a v15 with the style you want.
>> eric
>>
>>>
>>>>>
>>>>>> +    unsigned action;
>>>>>> +
>>>>>> +    trace_acpi_erst_pci_bar_0(bar0);
>>>>>> +
>>>>>> +    /* Serialization Instruction Entries */
>>>>>> +    action = ACTION_BEGIN_WRITE_OPERATION;
>>>>>> +    build_serialization_instruction(&wr_action, action, action);
>>>>>> +
>>>>>> +    action = ACTION_BEGIN_READ_OPERATION;
>>>>>> +    build_serialization_instruction(&wr_action, action, action);
>>>>>> +
>>>>>> +    action = ACTION_BEGIN_CLEAR_OPERATION;
>>>>>> +    build_serialization_instruction(&wr_action, action, action);
>>>>>> +
>>>>>> +    action = ACTION_END_OPERATION;
>>>>>> +    build_serialization_instruction(&wr_action, action, action);
>>>>>> +
>>>>>> +    action = ACTION_SET_RECORD_OFFSET;
>>>>>> +    build_serialization_instruction(&wr_value_32, action, 0);
>>>>>> +    build_serialization_instruction(&wr_action, action, action);
>>>>>> +
>>>>>> +    action = ACTION_EXECUTE_OPERATION;
>>>>>> +    build_serialization_instruction(&wr_value_32_val, action,
>>>>>> +        ERST_EXECUTE_OPERATION_MAGIC);
>>>>>> +    build_serialization_instruction(&wr_action, action, action);
>>>>>> +
>>>>>> +    action = ACTION_CHECK_BUSY_STATUS;
>>>>>> +    build_serialization_instruction(&wr_action, action, action);
>>>>>> +    build_serialization_instruction(&rd_value_32_val, action, 0x01);
>>>>>> +
>>>>>> +    action = ACTION_GET_COMMAND_STATUS;
>>>>>> +    build_serialization_instruction(&wr_action, action, action);
>>>>>> +    build_serialization_instruction(&rd_value_32, action, 0);
>>>>>> +
>>>>>> +    action = ACTION_GET_RECORD_IDENTIFIER;
>>>>>> +    build_serialization_instruction(&wr_action, action, action);
>>>>>> +    build_serialization_instruction(&rd_value_64, action, 0);
>>>>>> +
>>>>>> +    action = ACTION_SET_RECORD_IDENTIFIER;
>>>>>> +    build_serialization_instruction(&wr_value_64, action, 0);
>>>>>> +    build_serialization_instruction(&wr_action, action, action);
>>>>>> +
>>>>>> +    action = ACTION_GET_RECORD_COUNT;
>>>>>> +    build_serialization_instruction(&wr_action, action, action);
>>>>>> +    build_serialization_instruction(&rd_value_32, action, 0);
>>>>>> +
>>>>>> +    action = ACTION_BEGIN_DUMMY_WRITE_OPERATION;
>>>>>> +    build_serialization_instruction(&wr_action, action, action);
>>>>>> +
>>>>>> +    action = ACTION_GET_ERROR_LOG_ADDRESS_RANGE;
>>>>>> +    build_serialization_instruction(&wr_action, action, action);
>>>>>> +    build_serialization_instruction(&rd_value_64, action, 0);
>>>>>> +
>>>>>> +    action = ACTION_GET_ERROR_LOG_ADDRESS_LENGTH;
>>>>>> +    build_serialization_instruction(&wr_action, action, action);
>>>>>> +    build_serialization_instruction(&rd_value_64, action, 0);
>>>>>> +
>>>>>> +    action = ACTION_GET_ERROR_LOG_ADDRESS_RANGE_ATTRIBUTES;
>>>>>> +    build_serialization_instruction(&wr_action, action, action);
>>>>>> +    build_serialization_instruction(&rd_value_32, action, 0);
>>>>>> +
>>>>>> +    action = ACTION_GET_EXECUTE_OPERATION_TIMINGS;
>>>>>> +    build_serialization_instruction(&wr_action, action, action);
>>>>>> +    build_serialization_instruction(&rd_value_64, action, 0);
>>>>>> +
>>>>>> +    /* Serialization Header */
>>>>>> +    acpi_table_begin(&table, table_data);
>>>>>> +
>>>>>> +    /* Serialization Header Size */
>>>>>> +    build_append_int_noprefix(table_data, 48, 4);
>>>>>> +
>>>>>> +    /* Reserved */
>>>>>> +    build_append_int_noprefix(table_data,  0, 4);
>>>>>> +
>>>>>> +    /*
>>>>>> +     * Instruction Entry Count
>>>>>> +     * Each instruction entry is 32 bytes
>>>>>> +     */
>>>>>> +    g_assert((table_instruction_data->len) % 32 == 0);
>>>>>> +    build_append_int_noprefix(table_data,
>>>>>> +        (table_instruction_data->len / 32), 4);
>>>>>> +
>>>>>> +    /* Serialization Instruction Entries */
>>>>>> +    g_array_append_vals(table_data, table_instruction_data->data,
>>>>>> +        table_instruction_data->len);
>>>>>> +    g_array_free(table_instruction_data, TRUE);
>>>>>> +
>>>>>> +    acpi_table_end(linker, &table);
>>>>>> +}
>>>>>> +
>>>>>> +/*******************************************************************/
>>>>>> +/*******************************************************************/
>>>>>>     static uint8_t *get_nvram_ptr_by_index(ERSTDeviceState *s, unsigned index)
>>>>>>     {
>>>>>>         uint8_t *rc = NULL;
>>>>>> --
>>>>>> 1.8.3.1
>>>>>>
>>>>>>
>>>
> 

