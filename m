Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CF8642E21C
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Oct 2021 21:41:13 +0200 (CEST)
Received: from localhost ([::1]:49832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mb6bI-00025B-MK
	for lists+qemu-devel@lfdr.de; Thu, 14 Oct 2021 15:41:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48538)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1mb6V1-0003Ra-FQ
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 15:34:46 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:39582)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1mb6Uz-0005gG-Ex
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 15:34:43 -0400
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19EIlXnf017170; 
 Thu, 14 Oct 2021 19:34:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=EmJGI6u0x7C5LYf/m3GnSgAZqNae9jEa6SIh8LZd9MM=;
 b=PvoBSY1YCXTBFreQngWMF3BpTfIN+BJcTQxArt2FXICrTzPF1vzry1pRg+ssY41WJPG+
 LLjUPOPzGt/o+rBfqSjqeFvmG4I/HAB0C/GZL0/2km5vfYCxoeas9v51OPnPjdPTBAmZ
 fXJ5jC4E4Bm8bj9dyytrZtwsK5z6wdxk4EDC3P7rAP1ezgOqpRKfbdMZsRBHWrv2vy0T
 Bws9KF8Jv1Gwgp7LEgL9vkuIO6E5I2ADW/VmabxkcVtt3ijcjWo/TlUsnJEFPSm+HjDK
 7BV7FB5H2guvkPCnt6qBvddHHV7lDJGR1DGtcvAZkRfZmkASqr3UNa8WKzp6ShnOrh6J Fg== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 3bph1bv00v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 14 Oct 2021 19:34:35 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 19EJFFI9039482;
 Thu, 14 Oct 2021 19:34:34 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2171.outbound.protection.outlook.com [104.47.55.171])
 by userp3030.oracle.com with ESMTP id 3bkyvd9g9v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 14 Oct 2021 19:34:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lkzNbfE488StjV/B2pDPOBPdswncEwKolqiliPODU4TZSAqrB9Q8D20TsNvGCG9AUmuMPvlILdxwasGjquAShFaSHO/Q24PuuEa43nwGJXzcFCazP5zHyPqZR+zcIwk/GJK0JNEH8SIQplmHamDLmIsP4rexKeVFNqhe9io8IzCo1m4ICXPW0q8VttbPKcimrDLQtP7kM3dod+54Gkn4dDygFu5aKucgKOLmgch3cC0zZOZceK/HL67UJmXPkh+cijTs4rGQAhaIY8TCx2B1n1G2sJoSOzkn2jxGj2+9reGOKrjJXjxDoKOiZqYLmA2HP0jXL8nuzY1UnfyFRsXX/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EmJGI6u0x7C5LYf/m3GnSgAZqNae9jEa6SIh8LZd9MM=;
 b=j7LsFMIWHtfmRXFYZ/HEqVhp8BlpThaBxVVECyocfjAxCFzZrRiD+Yvl1NZlxc49f6+FPDk1Q/1FGed/gC5gAwNRMnDwobE0w7nujBJ88gWqV9+PCXwR4dZk9iRRAILkyMo2365mAu1goBB+XrEZKI8plFIPuHeIZ4J42FhhHo3W4qRv/Q9LGvtPpmcdXDFt5CLTbF1L8lBbke4hK6gbdp4teYho8BxC+XRxSMxKL2Ze3AeCn0GgYLAiR4oTavZ8cO1KcBhPP/mQOIFvKsHhMiXUqm5BrbA23IBPIOmjxLUPS1HLr/15mdtIHwk6zAytYHP/fMLIjw299eQdN5L8mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EmJGI6u0x7C5LYf/m3GnSgAZqNae9jEa6SIh8LZd9MM=;
 b=faMf9Fg81q0CgNt8GtvDVgfRNP0bnpxKTuIF605wZc6p3aOcD1Jf+aI/unLYvejsNctSuDNIZWM3aYkQGkZY5naMuBj/uwDDCMukemPIj/HiQ7Vk4YGJWIsE1LEr62KCN3Jaf73NvcV5p8wdBe1PXfy3zgL7pyUKaAo/ZZZj6OM=
Authentication-Results: anisinha.ca; dkim=none (message not signed)
 header.d=none;anisinha.ca; dmarc=none action=none header.from=oracle.com;
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by MWHPR10MB1632.namprd10.prod.outlook.com (2603:10b6:301:8::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.25; Thu, 14 Oct
 2021 19:34:32 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::90ef:e061:a4c2:acd6]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::90ef:e061:a4c2:acd6%9]) with mapi id 15.20.4608.017; Thu, 14 Oct 2021
 19:34:32 +0000
Message-ID: <03b1372e-1751-831a-d998-c2c23cb4d388@oracle.com>
Date: Thu, 14 Oct 2021 14:34:28 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v7 09/10] ACPI ERST: bios-tables-test.c steps 1 and 2
Content-Language: en-US
To: Ani Sinha <ani@anisinha.ca>
References: <1633626876-12115-1-git-send-email-eric.devolder@oracle.com>
 <1633626876-12115-10-git-send-email-eric.devolder@oracle.com>
 <alpine.DEB.2.22.394.2110080643140.820442@anisinha-lenovo>
From: Eric DeVolder <eric.devolder@oracle.com>
In-Reply-To: <alpine.DEB.2.22.394.2110080643140.820442@anisinha-lenovo>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN4PR0201CA0066.namprd02.prod.outlook.com
 (2603:10b6:803:20::28) To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
MIME-Version: 1.0
Received: from [IPV6:2606:b400:414:8061:221:28ff:fea5:27c8]
 (2606:b400:8024:1010::112a) by SN4PR0201CA0066.namprd02.prod.outlook.com
 (2603:10b6:803:20::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.16 via Frontend
 Transport; Thu, 14 Oct 2021 19:34:30 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e1728610-871d-4d8f-1b0a-08d98f49a56b
X-MS-TrafficTypeDiagnostic: MWHPR10MB1632:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MWHPR10MB16323192CE9D510DE5F2DA0197B89@MWHPR10MB1632.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: r6cEdvRNp9/arWsGXxr0qlE4ItJHAv4lg0BnR6Rn7Z6gzT+oIBic1mQMRnPvlcagcbPhVWOpMROfM4bPwJjP5XfK0BHYFbVwdsO635B6niXlymwHOc4GZdWM/BzULmXaFeGb9hmC8CwaBla9ofLBruxC1YCi9MCPFltk46b4WqEoItCLwYj+av9mFjB8KVnHWfTZkLjEGR6Ji/mvldRA/1ITdt2k5CUZJXZ4pgW3O+oPfFJOsi5Y6wGRxe/p26CfNBFsDKP62JWwHryFewyMxdvAeqf7psATJbbls16pPxBmyHHMYt49QD6m375DKYLUNb+LF3xi8DIFBHdmKeyTQfvlGtLlwhFydP8I1rPeewHgX57ieQskXLZk/fzSdV93tfHxbH4VBFKIMHrWTBz7gAaru08PiW3sAsP0hFRA/t9u7IB4WmHs0kfV6Niri6B0r7iCO0ajGnX0nazAEOHCuG+VGWfUPUkPTq8CoK09ZFm25qnlBnKUwHEbxtcxz8Qsho6kYUug0fhwA0kuhDiqkdGb8TW6dtc53PXWCvlAb3aIQ5exRUr0s5sXrkM/2ZZs6PG0RO+oomVSKm9KJeM/mtxgJ5gCEv1TQzNYKCN0WN5KhtfcDCLwQZ6FZR4wNf4o9IZtk1P+uTlzDDTQ4jf3YgEt1BKgwsl6F4tNnUBh/SpLce0rv2zOK16jqpuPuOWvdR6eqo+mqzpfEZtHU9zT6NQCcpZdRhlYJA8WjSJFzoI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR10MB4531.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(186003)(66946007)(107886003)(31696002)(53546011)(4326008)(316002)(66556008)(8676002)(83380400001)(66476007)(31686004)(36756003)(6486002)(508600001)(6916009)(8936002)(2616005)(5660300002)(2906002)(38100700002)(86362001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZWhIVDNHaW92MUFkZ0pzY0doWUtiQkhKQ0JQazFRL2l0RGFmV1kxbXBjVVps?=
 =?utf-8?B?OVJUbk4zanEydnlpL2NEQ1AwMGljVFVWcytFWGxVeWhmSUdPYk1hbk1hUk5a?=
 =?utf-8?B?dDh0azNoc2JackJXdHNlZEcrbkxseHQwdmI4Rjh4KzU1SWtiQ0ZTazZzSnBa?=
 =?utf-8?B?T0JVbnFGRGU2T2hDUGVHMWNTdGZhZDhubTlZeFVuakZZNUhBRkMvdXdPK1BY?=
 =?utf-8?B?MkJVOWZLM09DTUlmTjhGTFVVLzVrd01aZHF2eTZkdEg4Q1d4K0RyekQ3RE5T?=
 =?utf-8?B?aXJqdWJtV3QvdkNYYXJNNW0vb2xobXZUZGM0YVVWa2dnWm40eGNKenViU1Bs?=
 =?utf-8?B?MVBnL0c1SmdxVnFWRjVRUTRXOFJSdHQyNHg5OFpxVjkzVlF3bWd6aHRyTmd2?=
 =?utf-8?B?RHBqc2FjeDF5N1FVWTBMZmxSTmlmVUxIZFZIMG9CWlM4SkY0UWlLak4yL09P?=
 =?utf-8?B?Tzk1cmV5UndIVDFucllKcG9hVDlSaFpSYXQ1OFM3cUFEZ2NUSlNnUm81cVJv?=
 =?utf-8?B?a1V6d09ZQlUzT2R5SWlGNzBkQ0xoN25BeGlPQzF3d1ZQdUpsd2QvNVJSbkI2?=
 =?utf-8?B?VCtHY3NzNS9CV2VneVdJdUNiNDJFMHlOSDRXRkM2MHZ5MGx4d2hSeC92YWhO?=
 =?utf-8?B?OExacHhKUWVMdVl2Z01iRENYYk0vSFBxeVFmbm9iY2FlQmVDc3JQT09Hem9o?=
 =?utf-8?B?TU1UQ3R0SlJEK1ZVSVgzN2srUXR1ZGNtdDF6S0lHSUJ2OGt1TVJtb3o5NDE3?=
 =?utf-8?B?VGhDZUkrbXI1VTM5dVdjZ2hvQkVQZjZQQ1dTL0kwMXhqbHVzUHd3clJTRGVX?=
 =?utf-8?B?Vmx5WEovS0FIZFBNN1gwbkV2aHY0VGtmRTgrbUM0aU8wV0ZqamhSSVRoR3Jw?=
 =?utf-8?B?enZwNnh0WWVoYm0vVXJ4bkVRSkNwbERQV05vNGsrRU1FdHZqMTBIWDRZbldS?=
 =?utf-8?B?eGlmYlMvVjh1cWxNeXhKSjFiNmM4Z0E3VjlPNUtNc3VzUUVXZjdhVXgwdUY4?=
 =?utf-8?B?cXFUc2hlMnNJNXZKZzlvR3NOUS9qUjJMM1lKRDJ0a3duWmhMTUJGVlMvRlhX?=
 =?utf-8?B?R3ZaZHFlSTlMTVJ0Q25RWVZadExmWGxIZ3h3aHdHZ2lqNCtDOWZkVTNKNzBx?=
 =?utf-8?B?dmZmcndYck9aakt4ODVQN0xTR09rQy9NNlNBY0FNV0hHYmxuNmtnUVlBWTQ4?=
 =?utf-8?B?ZEhZdXRxS0JUTnBwcEdJdFlNMG1aSmRTbFJtZ0h1SUxOVzVzM3AxWjV6SG84?=
 =?utf-8?B?bURSdG1HWXR2a1dTaXYxZWJGUGxtZE5Ob0JXZnNLSThHY2VLZUlFK0JBbm91?=
 =?utf-8?B?VGZ4Nlh2b2hWeUNIQUI5MGswcUt1dG1BRjh4WHJtS1VOYzdWMUhpcEdjZStF?=
 =?utf-8?B?cEQ4ZjBGdHU0YjRwdVdZTFVwMEdRNWpHUUVhd0dXR0NIY2tUZGZmZ0NhWXNQ?=
 =?utf-8?B?a0xDM3cvdk1DZXJjb1pDNFcxTExYMVJ4eHR6aTNubERDalk4MHFWNXFmYjFT?=
 =?utf-8?B?b0VPMTlERTRIbEliMXVJT3B1RzNiNmViTXdSZ2Vob3IvOUg3RlpicnVpSlJ6?=
 =?utf-8?B?N294d2Z2dGM5ak16VzdFRHl2Rlp4K0o4MnNPbE43d1BiU1pXdzhYSlF3Z1dq?=
 =?utf-8?B?RGVGcFpmOXc4a1Q4YmhqdWcxeEoxSGhRODN2RE01eVMraFRaRHhKaktORW9M?=
 =?utf-8?B?eTlISHpvREoyVUZUNTFHRWFlcEluWS8ra2VXN2NFTXF2cWRwRHhXUm5ZVjJy?=
 =?utf-8?B?akxrbG40aFRTZjBSZTg2bUI1TjVRb1prWFJCc09HMDU1NklGMXNHdjI1NXdJ?=
 =?utf-8?B?dmlPUTlLMmpJcTVITnV2Zz09?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e1728610-871d-4d8f-1b0a-08d98f49a56b
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2021 19:34:32.2281 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AWa/kDKkpy18XfCS+soqcnnwIRFKv6lSN7Hi5PwQNTSBo6rzFGQbvwo7aqhDD83Eb8yZe7Fcn3nGRCNDiUU9P7KQl8lnLhCeRgzs2rx7UiE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR10MB1632
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10137
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 phishscore=0 bulkscore=0
 malwarescore=0 adultscore=0 mlxscore=0 spamscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2109230001
 definitions=main-2110140109
X-Proofpoint-ORIG-GUID: 3sgwYVNZAVq2akVaWPd82p8ZKXGfze5K
X-Proofpoint-GUID: 3sgwYVNZAVq2akVaWPd82p8ZKXGfze5K
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=eric.devolder@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_BL=0.001, RCVD_IN_MSPIKE_L3=0.001, SPF_HELO_NONE=0.001,
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
Cc: berrange@redhat.com, ehabkost@redhat.com, mst@redhat.com,
 konrad.wilk@oracle.com, qemu-devel@nongnu.org, pbonzini@redhat.com,
 imammedo@redhat.com, boris.ostrovsky@oracle.com, rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 10/7/21 20:17, Ani Sinha wrote:
> The ordering of the patches is wrong!
> 
> (a) First, you need this patch so that the test framework will ignore
> changes
> to the table blobs that you specify here to explicitly ignore.
> 
> (b) Then you need the patch that actually contains the test you wrote
> (patch
> 8). Now because you have previously ignored the changes to ACPI tables
> that the test would modify, the tests would continue to ignore them and
> hence it would not fail "make check".
> 
> (c) Lastly, you need patch 10 where you empty out the list of table blobs
> to
> ignore and update the blobs.

Thanks for explaining; it sounds like the steps outlined in bios-tables-test.c.
I moved this patch based on previous review, perhaps I misunderstand what was being requested.
At any rate, I've moved this to be the first patch, per bios-tables-test.c

> 
> Please also make sure you only update those table blobs that you
> explicitly ignored in step (a).

Done!


> 
> 
> On Thu, 7 Oct 2021, Eric DeVolder wrote:
> 
>> Following the guidelines in tests/qtest/bios-tables-test.c, this
>> change adds empty placeholder files per step 1 for the new ERST
>> table, and excludes resulting changed files in bios-tables-test-allowed-diff.h
>> per step 2.
>>
>> Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>
>> Acked-by: Igor Mammedov <imammedo@redhat.com>
>> ---
>>   tests/data/acpi/microvm/ERST.pcie           | 0
>>   tests/data/acpi/pc/DSDT.acpierst            | 0
>>   tests/data/acpi/pc/ERST                     | 0
>>   tests/data/acpi/q35/DSDT.acpierst           | 0
>>   tests/data/acpi/q35/ERST                    | 0
>>   tests/qtest/bios-tables-test-allowed-diff.h | 5 +++++
>>   6 files changed, 5 insertions(+)
>>   create mode 100644 tests/data/acpi/microvm/ERST.pcie
>>   create mode 100644 tests/data/acpi/pc/DSDT.acpierst
>>   create mode 100644 tests/data/acpi/pc/ERST
>>   create mode 100644 tests/data/acpi/q35/DSDT.acpierst
>>   create mode 100644 tests/data/acpi/q35/ERST
>>
>> diff --git a/tests/data/acpi/microvm/ERST.pcie b/tests/data/acpi/microvm/ERST.pcie
>> new file mode 100644
>> index 0000000..e69de29
>> diff --git a/tests/data/acpi/pc/DSDT.acpierst b/tests/data/acpi/pc/DSDT.acpierst
>> new file mode 100644
>> index 0000000..e69de29
>> diff --git a/tests/data/acpi/pc/ERST b/tests/data/acpi/pc/ERST
>> new file mode 100644
>> index 0000000..e69de29
>> diff --git a/tests/data/acpi/q35/DSDT.acpierst b/tests/data/acpi/q35/DSDT.acpierst
>> new file mode 100644
>> index 0000000..e69de29
>> diff --git a/tests/data/acpi/q35/ERST b/tests/data/acpi/q35/ERST
>> new file mode 100644
>> index 0000000..e69de29
>> diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
>> index dfb8523..c06241a 100644
>> --- a/tests/qtest/bios-tables-test-allowed-diff.h
>> +++ b/tests/qtest/bios-tables-test-allowed-diff.h
>> @@ -1 +1,6 @@
>>   /* List of comma-separated changed AML files to ignore */
>> +"tests/data/acpi/pc/DSDT.acpierst",
>> +"tests/data/acpi/pc/ERST",
>> +"tests/data/acpi/q35/DSDT.acpierst",
>> +"tests/data/acpi/q35/ERST",
>> +"tests/data/acpi/microvm/ERST.pcie",
>> --
>> 1.8.3.1
>>
>>

