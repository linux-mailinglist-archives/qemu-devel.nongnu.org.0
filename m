Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2653836D22F
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Apr 2021 08:28:16 +0200 (CEST)
Received: from localhost ([::1]:51778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbdgF-00063i-7o
	for lists+qemu-devel@lfdr.de; Wed, 28 Apr 2021 02:28:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56180)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dongli.zhang@oracle.com>)
 id 1lbddm-0005bD-SS
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 02:25:42 -0400
Received: from aserp2120.oracle.com ([141.146.126.78]:56170)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dongli.zhang@oracle.com>)
 id 1lbddk-00081n-3i
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 02:25:42 -0400
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 13S6PcAp064926;
 Wed, 28 Apr 2021 06:25:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=1k3ziktAUJcrvr6UNdWjdMCF31g6TDjLBbA8C+GM8Gk=;
 b=dVia5rLZubKWiHKIOTz3jvHxiqVornQ78wSDLSt+fexYdHKOGvYPjEiWbnvocKnw4LcD
 xGJ1oJgOd57IrXka82mquiXxBG4Ts7QsD2WJU2wiU+DPZ1LzDJS/rfQbiyx+RG1mBg2J
 RISQTVqzm74iBO2mlD1kemkB3O4KvFW4ACONf6j8AuW1mRbxn784xlEf+ppM9sb9+Tun
 Bv4hdnXajXSVqDMNRA3Zeh11QGwRAdMja78GC9SfVtscb4bH4jnbogDscOTHCE1/mMw7
 BSUXO4PcEi2xQkNRxMl0wGOCkLWokiZnz6IvxSISq7PAUKKG84WymLDJmgAnD0qqXIhN Yg== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by aserp2120.oracle.com with ESMTP id 385ahbqnvf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 28 Apr 2021 06:25:37 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 13S6AVCE038987;
 Wed, 28 Apr 2021 06:25:37 GMT
Received: from nam02-bl2-obe.outbound.protection.outlook.com
 (mail-bl2nam02lp2055.outbound.protection.outlook.com [104.47.38.55])
 by userp3020.oracle.com with ESMTP id 384w3u6m4y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 28 Apr 2021 06:25:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oLVPUuASK9djO/fcsGegKxU2MPX1T8/n3ffYwgPyPNfWcR5XVsTEKpoSrHEIx3sZyoJrAEflHR0Bl4fq7YYzkZ3NcZTXUJF1dwLYhA8PRjjKxVER73XCoB/ZaR+rmM8QLwxiYdkny24dMAFzdrcfyyhLo64PUD3wAH0xW3Oa6YmsZ4U91j4xNfVH7nUenIQlcQyauj+so9Pe+GcTX0Th8LFMwuyEd3uDloD2TWJ6iI0pHbtbTv6FEqyO90oXbowB9yRenCMB3e4ywpb3wUbDGQTMvOgvR5Dq34fFpuBTpKQbL1rVMI2gSwqU0XJrkv4tfPUhgbV1MzoGPxPUvlhczQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1k3ziktAUJcrvr6UNdWjdMCF31g6TDjLBbA8C+GM8Gk=;
 b=CbSnS0TYq9EyQzZY/qlIx8qJQdi0sULDv9dm7rbc84BinmUpz4tNRbKKDxY37NIkfwEQm/ck3ag3dM94MVCpIAZ1MU8uz3LX51CMgXRiJM/fFsOSIfpxTc13wCqr1elplAIa7h38AigsnZmprZkHr+HBemoOw8phTgWsD6fXxELf0hb9iH1jj60k3iSrb7Ptkd34YUey5c0qkieUZi88atho6wqtxr3a7+wlArDpDY/7OVDjQuVzbi3La0BwMxnosEVy/5zSkauWFeg50UHN8hzE5GwUXeuDxHtph0JS4za6jQg1wYDxHMkUnaL0wwVZvsCkRasRAzk9g8g6uc6xHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1k3ziktAUJcrvr6UNdWjdMCF31g6TDjLBbA8C+GM8Gk=;
 b=BCpzwtO12iBFtStMT9vDK3xO94lJXo0DLcT5Pg3N5xTsYdy6jZemtc+rCWRUBBAfAb/awuH9ajQG+BPKxvHUaAxXscDIRv+iHJ+o0OJZ3D3UY1/9uz0yVx5LOw/dFLxr0KRBYDQ7dDfQDrg05+tCcHGACCymzZWkPh3uwv59iS0=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB2663.namprd10.prod.outlook.com (2603:10b6:a02:a9::20)
 by SJ0PR10MB4654.namprd10.prod.outlook.com (2603:10b6:a03:2d2::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.23; Wed, 28 Apr
 2021 06:25:34 +0000
Received: from BYAPR10MB2663.namprd10.prod.outlook.com
 ([fe80::44f7:1d8f:cc50:48ad]) by BYAPR10MB2663.namprd10.prod.outlook.com
 ([fe80::44f7:1d8f:cc50:48ad%6]) with mapi id 15.20.4065.027; Wed, 28 Apr 2021
 06:25:34 +0000
Subject: Re: [PATCH RFC 0/1] To add HMP interface to dump PCI MSI-X table/PBA
To: Jason Wang <jasowang@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
References: <20210423044713.3403-1-dongli.zhang@oracle.com>
 <25113515-5c1d-c557-d0cc-04bfacecb6ee@redhat.com>
 <8aad1273-5c17-a2d7-46cd-eb149c6c57b8@oracle.com> <YIfRAKDvfZyOWrEL@work-vm>
 <37e7aa41-5c87-3276-67f6-b5bd64dde7ea@redhat.com>
 <3e4cfcf2-c4b9-028a-4d06-22b1e9a23455@oracle.com>
 <279945e6-4bd0-2157-1973-6e44ce97b359@redhat.com>
From: Dongli Zhang <dongli.zhang@oracle.com>
Message-ID: <a4dd1e03-5cfd-ed22-2998-73879070ebc9@oracle.com>
Date: Tue, 27 Apr 2021 23:25:32 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <279945e6-4bd0-2157-1973-6e44ce97b359@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [2601:646:c303:6700::d22a]
X-ClientProxiedBy: BYAPR03CA0006.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::19) To BYAPR10MB2663.namprd10.prod.outlook.com
 (2603:10b6:a02:a9::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2601:646:c303:6700::d22a] (2601:646:c303:6700::d22a) by
 BYAPR03CA0006.namprd03.prod.outlook.com (2603:10b6:a02:a8::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4087.25 via Frontend Transport; Wed, 28 Apr 2021 06:25:34 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b0269cf5-b8bf-4d4b-41ea-08d90a0e6e28
X-MS-TrafficTypeDiagnostic: SJ0PR10MB4654:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SJ0PR10MB4654253A463751EBD3C86132F0409@SJ0PR10MB4654.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AwLYCkXcKkoien1jnrbbtUTbUx5uq8nk+B6wHjjZiAt+eYXww5QffC2Zf4VE1zyEVPOoaOIwShlS+KjQIZ0bR2vbPOIijcxwku7dFXX2eN60Pc53YsMIL7x87C/2uUGnKzhKxG/ysHVmlkgFi9kJQUlbiI4VY3igNIobwfkQ19qzkdZMlozIgX+LkcCC3xJENR8ym6ul+pD3he9JVqRYk5UCQ3gD/Gn0PLmvnPUzyOtV5bQDQ7FXZrlD823QFzgW7CjTfOJkWzMX5qlFn0CKReQRDCcn5tj4rY744TUr/v9kiG6jc4+C7wkum0DPrmTyxJaH8Swh4fnkL+WhKDeIA5sRdQZmQuxNl2kwXMVBQjjg6X2n2fO7MoiGR5EVCTWZpD7jMGd6MbTyaV0xfQzE+xcmoY2jcy0HjT5EhULJkSzEaLv5QiGav86Rw81yAdpCITPZm2YWBJjKQYVjdPa4eyievqrjAeR6JXSHzD0XVCp/qFO5QWVWIJz6aLr3pfhDaouMwJ2g4q4+HqfYtncttuhD1Qcz4hoaMWfsg2QBqfhdeKZwprgiUoNy+joWyVjIrw10jhu/QHn1WXIpXdsmqBmwP5WKewWUYuxz3sef61lIKXPokSvYg5cOGPOyUI7GJUiZMSPzDSWBAlTaBtZ1srDy1QlUySyQDA3tym9ssJ6VOBHNqouXDux8M4h9BqlX5EfS3u+7/4E5hM2R+FPxg9i8E42WljbR7rpdz0lY06ObiM2ARCTzccdnxJCRu5jKsfVXi22VaQN7C2dNz8gYxA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB2663.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(346002)(396003)(376002)(136003)(39860400002)(366004)(966005)(2616005)(478600001)(38100700002)(31686004)(16526019)(4326008)(53546011)(44832011)(36756003)(83380400001)(186003)(316002)(6486002)(66476007)(2906002)(86362001)(66556008)(110136005)(8936002)(31696002)(5660300002)(66946007)(8676002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?QzdPQ0FmSUVpR3BSazM3aU9DcHR6U2NBQ3dvbXdtUDliZXRCMnFUS0F2TCtq?=
 =?utf-8?B?blZ3c3R5TVRGNFR3RnRhbXdBNXJRQ0VPeXdUTFpyL0I1SkEwdGNBczBVTVJa?=
 =?utf-8?B?bVRHUE1TdUw5NGdNWjVSSXJ4eHdmdlp2T1RaNDZieFAxU1pvUkZCZzJYd3hi?=
 =?utf-8?B?K0p6dS9JODE4QklTRnpRUHYyd21EVFcrVUp5cUpCc3M1Y2Eybjl4V3hMZ3Jq?=
 =?utf-8?B?aTZjc3RleCsvREwyY2NkQjVFR0JPdkwrZXhDbWEwNnowcmdabVNNSWJsZmVM?=
 =?utf-8?B?bWNmTVhPeVBtSEU0ZkErT2xLN1JUWG1vMS9EMXBzZ1NPWWFxN0luWUV1SHRm?=
 =?utf-8?B?cWpDejVSajlHUTN2cU40OG4rWEZvRXlldWZDbWtVMXBIZkhKS0xpNlQwWE1l?=
 =?utf-8?B?SitTR1hlMDRaeFk2d1B5ZFA3OTFNbnZMbW5Od0xHdDRDeWRNR0IwYkVYVnNi?=
 =?utf-8?B?RU9la0pLcEIwOEdGa0UvRVQ3aW1wVHRVWEU0cmRLSlFDS2xxNEo5c0didzBP?=
 =?utf-8?B?ajY5dzFJNXJ2OGFCeGJINGpUZmZlZlRIeFpTNTA5UGxjQU9rYUpEQnNweFRN?=
 =?utf-8?B?OHFoTGFvUm80RjZWUkNxaDZkazd2cUpXeE52SGl1dkJjTUJYRTNBT0k0V044?=
 =?utf-8?B?SGJrZkp3MzlqdWlJK0JoM0xQeXBVOS9Tbk5rcmNaNnlvb25vRzBRNVhMZEZR?=
 =?utf-8?B?ME9veTdkdzV2VVhaandxTU00V2hhMHNYNFlMOHJ4WnQxdkZjSmwzeU9nRmtj?=
 =?utf-8?B?OGRWZWhkOHk5QW5UMU81U2s3VlN0TjZtQ0JJbTdHM1EvZ2crUG5rZGpsMXFB?=
 =?utf-8?B?THdUSkJnb2duaW9EVEg0citUbnQ2SlF0Ui9tNEUyYWRQYXNaSmdYTHA3azFX?=
 =?utf-8?B?ZmlLTmNtKy9DR29uODhyMmQ0N3d3U0pCOTV2NVYrS0g0YVBkcUVFelpCQ29E?=
 =?utf-8?B?aWVyRjZrNE5WVEt0WTNqWUI5Mi9zbzAzUmdGeFJKbU1VdHZiSkpXZ2ZrWTN5?=
 =?utf-8?B?WGh1WVI0bTA2djZ2dEFQbnpGUWxVQ1d0NmV6cUh3ME5RWHUxMk4vcnVHNGJ2?=
 =?utf-8?B?emxCVFdDbEJuenlrbGVHYXhjdG0wdUpuZEkxRHFneWtvNE44R1ZQUEJnMExT?=
 =?utf-8?B?U2hGMm1tc1dob3ZHRVFFZElPWXdmZDhwTW1ySVR4anZTdlB6SE54VFVTYUFh?=
 =?utf-8?B?Qyt2QWszUDJlWHBRcWJBbCtzYlFMd0xtTEpXQTU0ajhtbEJxbGlkc3dGSjV2?=
 =?utf-8?B?SjhVUVlFZkVUREhzVHFSYmhINlFqUEJublBpR0I5NWg1TmdJcFN1UzZtdi84?=
 =?utf-8?B?c3pjTVEvYktoVm9sWWE2enl2NlVXM2IxdC9ReWpKQ2tVODVjRnB2YVZ2b2tE?=
 =?utf-8?B?ZnRTQzYzSmR3d3BsWUsvNDlYMXkvN1ZmdzJPVXRRaC9FdmVMd053RlQ5cS9n?=
 =?utf-8?B?MWRnY1ozWTY4LzUwK2tQTU5BdkxUVHV1aHZsY1BITTBEaEg3ZElsZXZZdTZi?=
 =?utf-8?B?RWJGNVlTd3MzUm5ub1pFdnVlQ1l2bG5vRXp5RkM2d1RhNU9Eclo3TDRTNVpZ?=
 =?utf-8?B?TmsvM29jTmJiYnVoRUFGS3hYU2Y4OCtMZUFQUDNUSGN5OUtNbmhNSVM2WmZD?=
 =?utf-8?B?cVZmdHRqOVI2RGduSzdDT2gzNFJCcGhVZUpMMkwwY3QwMnVJZDJJUkdRRVVW?=
 =?utf-8?B?dXJ0dDY5NnpSemxZMnNaeHRrUVJvMXNKSDkrbE9jTWdKV3I1bGFSSGRmZFNu?=
 =?utf-8?B?WVVmMlloanVJSjduMVpEVjJkb3F1MldHN1Y0Y2FIT24yaUVEODljeFM3NUNo?=
 =?utf-8?Q?Ya0qxm9xmLkZtsRLYDNfCuplMmq/v3/HeamzM=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b0269cf5-b8bf-4d4b-41ea-08d90a0e6e28
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB2663.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2021 06:25:34.4987 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jmITsBBTwv0KeMlRhLXZxADxwXSiWJ4tvhT/jWjSteBTM6U2g3P3+KPlfaFEwhV6T1uQl9yOrsTvQsiTNTnS6A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4654
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9967
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 malwarescore=0 mlxscore=0
 mlxlogscore=999 bulkscore=0 phishscore=0 spamscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104060000
 definitions=main-2104280041
X-Proofpoint-GUID: 0eSWn1TjWg0t-_BjKWnnC8oGMNipd-Kj
X-Proofpoint-ORIG-GUID: 0eSWn1TjWg0t-_BjKWnnC8oGMNipd-Kj
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9967
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 bulkscore=0 mlxlogscore=999
 priorityscore=1501 clxscore=1015 adultscore=0 suspectscore=0 spamscore=0
 phishscore=0 malwarescore=0 lowpriorityscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104060000
 definitions=main-2104280042
Received-SPF: pass client-ip=141.146.126.78;
 envelope-from=dongli.zhang@oracle.com; helo=aserp2120.oracle.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_BL=0.001, RCVD_IN_MSPIKE_L3=0.001, SPF_HELO_PASS=-0.001,
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
 joe.jin@oracle.com, qemu-devel@nongnu.org, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 4/27/21 10:55 PM, Jason Wang wrote:
> 
> 在 2021/4/28 下午1:10, Dongli Zhang 写道:
>> Hi Jason,
>>
>> On 4/27/21 7:31 PM, Jason Wang wrote:
>>> 在 2021/4/27 下午4:53, Dr. David Alan Gilbert 写道:
>>>> * Dongli Zhang (dongli.zhang@oracle.com) wrote:
>>>>> On 4/22/21 11:01 PM, Jason Wang wrote:
>>>>>> 在 2021/4/23 下午12:47, Dongli Zhang 写道:
>>>>>>> This is inspired by the discussion with Jason on below patchset.
>>>>>>>
>>>>>>> https://urldefense.com/v3/__https://lists.gnu.org/archive/html/qemu-devel/2021-03/msg09020.html__;!!GqivPVa7Brio!KbGQZW5lq3JZ60k12NuWZ6Th1lT6AwmBTF0pBgoWUKKQ4-2UhdW57PtvXUN5XQnZ2NU$
>>>>>>>
>>>>>>>
>>>>>>>
>>>>>>> The new HMP command is introduced to dump the MSI-X table and PBA.
>>>>>>>
>>>>>>> Initially, I was going to add new option to "info pci". However, as the
>>>>>>> number of entries is not determined and the output of MSI-X table is much
>>>>>>> more similar to the output of hmp_info_tlb()/hmp_info_mem(), this patch
>>>>>>> adds interface for only HMP.
>>>>>>>
>>>>>>> The patch is tagged with RFC because I am looking for suggestions on:
>>>>>>>
>>>>>>> 1. Is it fine to add new "info msix <dev>" command?
>>>>>> I wonder the reason for not simply reusing "info pci"?
>>>>> The "info pci" will show PCI data for all devices and it does not accept any
>>>>> argument to print for a specific device.
>>>>>
>>>>> In addition, the "info pci" relies on qmp_query_pci(), where this patch
>>>>> will not
>>>>> implement the interface for QMP considering the number of MSI-X entries is not
>>>>> determined.
>>>>>
>>>>> Suppose we have 10 NVMe (emulated by QEMU with default number of queues), we
>>>>> will have about 600+ lines of output.
>>>>   From an HMP perspective I'm happy, so:
>>>>
>>>> Acked-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
>>>>
>>>> but since I don't know much about MSI I'd like to see Jason's reply.
>>>
>>> I think we'd better have more information, e.g the device can optionally report
>>> how the MSI-X vector is used.
>>>
>>> Virtio-pci could be the first user for this.
>> As discussed in another thread, you were talking about to print MSIMessage.
>>
>> However, I prefer to print the raw data as I think the user of this interface
>> should be able to understand it as MSI-X messages.
>>
>> For instance, below is the data printed by "info msix".
> 
> 
> Just to clarify, I meant e.g for virtio-pci device, we can let it to print the
> mapping between vq and msix vectors:
> 
> vq[0].msix_vector = 0
> vq[1].msix_vector = 1
> config.msix_vector = 2
> ...
> 
> But this could be added on top if you wish.
> 
> Does this make sense?

Yes, this makes since. For QEMU they are:

- vdev->vq[n].vector
- vdev->config_vector


I will introduce a callback and implement for virtio-pci to dump the vector mapping.

By default, "info msix <dev>" prints only msix table/PBA.

"info msix -d <dev>" will print device specific data.

Thank you very much!

Dongli Zhang

> 
> Thanks
> 
> 
>>
>> 0xfee01004 0x00000000 0x00000022 0x00000000
>> 0xfee02004 0x00000000 0x00000023 0x00000000
>> 0xfee01004 0x00000000 0x00000023 0x00000000
>> 0xfee01004 0x00000000 0x00000021 0x00000000
>> 0xfee02004 0x00000000 0x00000022 0x00000000
>> 0x00000000 0x00000000 0x00000000 0x00000001
>> 0x00000000 0x00000000 0x00000000 0x00000001
>>
>> The 1st column is Message Lower Address.
>>
>> The 2nd column is Message Upper Address.
>>
>> The 3rd column is Message Data.
>>
>> The 4th column is Vector Control.
>>
>> In my opinion, this is equivalent to MSIMessage.
>>
>> 26 struct MSIMessage {
>> 27     uint64_t address; --> column 1 and 2
>> 28     uint32_t data;    --> column 3
>> 29 };
>>
>>
>> We use the similar way to read from Linux OS, e,g., given the address of MSI-X
>> cap, here is how we read from OS side.
>>
>> # busybox devmem 0xc1001000 32
>> 0xFEE00000
>> # busybox devmem 0xc1001004 32
>> 0x00000000
>> # busybox devmem 0xc1001008 32
>> 0x00004049
>> # busybox devmem 0xc100100c 32
>> 0x00000000
>>
>> Thank you very much!
>>
>> Dongli Zhang
>>
>>>
>>>> Adding an optional option to 'info pci' to limit to one device would be easy
>>>> though; that bit is probably easier than adding a new command.
>>>
>>> One interesting point is that MSI could be extended for other bus, (e.g MMIO).
>>> So "info msi" should be better I guess.
>>>
>>>
>>>> Figuring out the QMP representation of your entries might be harder -
>>>> and if this is strictly for debug, probably not worth it?
>>>
>>> I think so.
>>>
>>> Thanks
>>>
>>>
>>>> Dave
>>>>
>>>>
>>>>> Dongli Zhang
>>>>>
>>>>>>> 2. Is there any issue with output format?
>>>>>> If it's not for QMP, I guess it's not a part of ABI so it should be fine.
>>>>>>
>>>>>>
>>>>>>> 3. Is it fine to add only for HMP, but not QMP?
>>>>>> I think so.
>>>>>>
>>>>>> Thanks
>>>>>>
>>>>>>
>>>>>>> Thank you very much!
>>>>>>>
>>>>>>> Dongli Zhang
>>>>>>>
>>>>>>>
>>>>>>>
> 

