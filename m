Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC56B4CC254
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 17:11:05 +0100 (CET)
Received: from localhost ([::1]:60956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPo2i-0008SZ-T1
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 11:11:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57744)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1nPnoU-0007NB-WD
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 10:56:23 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:33000)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1nPnoT-0005m6-3U
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 10:56:22 -0500
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 223EpJdg013834; 
 Thu, 3 Mar 2022 15:55:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 from : subject : to : cc : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=hxyg3U2XjclJWiJfROR85+ux83iUZrA9PnIZPCwUSCQ=;
 b=F6DybMiPe+0h1kQohqmOskIUx7xNUekb6o7LdgXnqxjOLJzupaURUR7hlHuT4k3pQTxH
 GybnaL4xw++DjyZ3eGiQ3kBf1Iwl3CY8hPPQXo5OfoXzLStOgjuH/wOmIFosgx36Nw6o
 uayZHgwLRAsBiPJ6egkYnouZSpFq+HvFBVWlh5n4fpIRDNXM3xPcmCvjf03WhOKelUP5
 0cG3KERXj1qbpgB3aIiOMQyltdU4YBv5reae5mKPOjLeODGEMk7rwaBH3VxT3+ks2qFS
 zGNPloPlC0nIT4voQ3UuKGktJPfHOS4xaTY5rjozEAct2m2gk1DyzuGtif2uTvIk1oK9 2w== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 3eh1k498t0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 03 Mar 2022 15:55:11 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 223FpYEH127589;
 Thu, 3 Mar 2022 15:55:09 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2175.outbound.protection.outlook.com [104.47.59.175])
 by userp3020.oracle.com with ESMTP id 3efdnswr1t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 03 Mar 2022 15:55:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HCWwzlC6HXij4D4EJg23ahtu4vR+zMXDtGnh9nQAS3kuV/7NhCdgw0pAvzB8RHp6CZ8YMvaEltzfDL/EoNtvqWmOEkGHkyhdsOOKjJhCGXNnf6oJEObwa7ybscqalXoDEGfcRtGK91zft/1eFh89EkK1FDYJNTRbZevbRJMtLqII4U7Lc3Nz0JYyhq1YEQAy6X5X0fzxtYuI9EtwNbO3lkaGBQIsPP5IJo2AI7R2EyhrU3HMPk0S8vtN8lUUuaXe5wYRl7pmBizgaP4yCCGzhMBVoE9Lq57/8vKLOSIpcUJLGVkNeiuC2CuZvc25RiEfMPR5OyrzfAtwBmQQM1XjhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hxyg3U2XjclJWiJfROR85+ux83iUZrA9PnIZPCwUSCQ=;
 b=G25x0VFSW/7I8wJ2pF+FjLZglJrS5xWjNBpNlf23V6gZ/1hDE+c15ynSWs82X6tGEEIEc/3/CYSS0YgdnUTrgxlcbkCS2vMkFbuV8K8IeyPYBklsONw1q5SNN+d3/z53j+ecYgQqviB7OfX1ICcRcXHuseIBV1JQO5p0hfnnvRvdw6cMZsAWNfJk5vEzzMIgnk5VGITzbyaEUp2KM2cz+xf7dX3ZJH1Jzre9hFIOuKFMxQcQNmKWRxDZzK4CHCKVhuIblv6e5OEho5Mtu1WtidETorq81e4CM82EUQg7ifkS7rwealy9HD8TEyv+AyhByMPcvtCjxYWwbRYwuACTdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hxyg3U2XjclJWiJfROR85+ux83iUZrA9PnIZPCwUSCQ=;
 b=v8RDjQCkKfYajq+qjZDZUfk+tSR1unLhtd+n1rlSVfO6mXdW3u9ipLWEx2OyjeV33j1Tce0TbMS6k7xPwOv59lOIHDv9wCgJMSTav48iW8WGbw8ZH3kCjwaw++raP7efZ2VdDmE+GcgMEymm2xN3iXsLXZwtz2+9rgB35o0Rt/I=
Received: from BYAPR10MB3240.namprd10.prod.outlook.com (2603:10b6:a03:155::17)
 by CY4PR1001MB2200.namprd10.prod.outlook.com (2603:10b6:910:3f::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.26; Thu, 3 Mar
 2022 15:55:06 +0000
Received: from BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::6005:8b9:1b00:b0da]) by BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::6005:8b9:1b00:b0da%6]) with mapi id 15.20.5038.016; Thu, 3 Mar 2022
 15:55:06 +0000
Message-ID: <7128e0a7-76c6-f63e-f03e-59c23a0d1622@oracle.com>
Date: Thu, 3 Mar 2022 10:55:02 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
From: Steven Sistare <steven.sistare@oracle.com>
Subject: Re: [PATCH V7 28/29] chardev: cpr for sockets
To: Guoyi Tu <tugy@chinatelecom.cn>, qemu-devel@nongnu.org
References: <1640199934-455149-1-git-send-email-steven.sistare@oracle.com>
 <1640199934-455149-29-git-send-email-steven.sistare@oracle.com>
 <be5242d68beca807ab6b2d08d71fff2e248d4217.camel@chinatelecom.cn>
Content-Language: en-US
Organization: Oracle Corporation
In-Reply-To: <be5242d68beca807ab6b2d08d71fff2e248d4217.camel@chinatelecom.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR05CA0118.namprd05.prod.outlook.com
 (2603:10b6:a03:334::33) To BYAPR10MB3240.namprd10.prod.outlook.com
 (2603:10b6:a03:155::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2611996f-b50d-4c36-0f6e-08d9fd2e2fe6
X-MS-TrafficTypeDiagnostic: CY4PR1001MB2200:EE_
X-Microsoft-Antispam-PRVS: <CY4PR1001MB2200D5C666E115A3E8F3927CF9049@CY4PR1001MB2200.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pjgnfvKVwLh67i7ESMSDEhBZlR+KD+yQG9rIRHWr5i4DbTSEM9zt/br8xkzSYhTNXZfQQN89/BQpvrK6jC+J/spyCESfoUQbeVPMJG/NmdJzG0X+vEeLOQKACwPozcCLFKuxn6PA5/IVpYy8YURD1au7eHr4+YOPmE/cVG7/KD+mCj4XiKlHK0w8guN06S3GK0b3kiHf74whVbqXdJJYnj+l3z6B8Ds70axnWtNDaJXTt//5gpZ6iXnHeGm59qzax6M7w4zZaGqdWvUVXZbMaC+0TysU0oUInmViBagN3GDixXXngwVMlnUCKKzVU3d+L+diNNI7rr+WOzIKVbftnp3TN10l78ROw6PJPukyD1Bu9A6Vf/1bEyLtZsgy+X3tTFs50nq7gf8rocMXDDptmM5l0MsCcWpYdynFBDLJdl+JUHF4GEPAbFriBaJWZUT6YY+c0In3xlU0LAxNSJi0u/LPJhntpgfaF2NkKxKa7j3o3omxnHCUQEnqCuOZ5l3GhTV2ShARDc2hp71hicSID+aCnc6IrbVaUw3KW9vGjFs6QJBoUoaRsxh8TZSDT+13AiEQlm317R+jJbXxh6bTPiND55VNlaqF1038BRakqN2nukZHiFgMiPtSS8GIT/uA9Ef2UIKAhaqjscIG8p2D1rJGEXqjZC9ls5gAuoab8gq3jFDvYRtQ0Q5XN4ZQvBwbi7k8WNkiJaF/ZLrzk2Rp8g8mNSHcPSHffQ6eNOekZXE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3240.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(36916002)(53546011)(54906003)(6666004)(6506007)(6512007)(31686004)(36756003)(2906002)(5660300002)(508600001)(6486002)(66476007)(83380400001)(38100700002)(107886003)(186003)(4326008)(66946007)(8676002)(26005)(66556008)(44832011)(316002)(8936002)(7416002)(86362001)(4001150100001)(31696002)(2616005)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZW94YU9NNTMvZVBnREtJZVhLZG9HS2sxRHNwa3VMZ3hCT2U2Qmk3aGhCQXJr?=
 =?utf-8?B?bGRzY0lpT1RMT3BNb2dwTnJYbklsNk1Fb015VEdWeDRPRUNkbHVsQTBRV3JC?=
 =?utf-8?B?VFJjYVdEMndMd0FEelRlc1JCWDJJOEhvVEVnQWttVDBsZ2JXbitWeWljejJl?=
 =?utf-8?B?M210c2VheXFjRDlxRTBEVlNiTmV6ZUxtN1VkeWFIR3hOWHQrYnZrRFRpVjVj?=
 =?utf-8?B?L2gzUlRGLzA5SVA1SFpPY3JuaXM4cjkrY2VscjdSazQ0RjFoTFVvUnBuZUNk?=
 =?utf-8?B?S2ZURDJsN3VVYnZrYzRoSjYrelNiQ2JrL2cwejh3Z0xhUGNIUzM1RTBSVldx?=
 =?utf-8?B?aUdpeHB5cU1mWGN2VWhhdFRpU2llTkt3MGtQRnNRQi9ib2R0R2lsaERDdi9v?=
 =?utf-8?B?bmYvc2xxQTBpZkxaZmNMTUpjZVhvWXFPWHYvV1luSGpyOVhDc25NNGR1akxh?=
 =?utf-8?B?UVNsTUY3SEFQdWpaOVR2RjlmOW1KTTQ5K29RWk1WcUhtNDlwOHN3TnNvbVdC?=
 =?utf-8?B?V2VrbVdOOHpBRVZraFhITXhXQk1vL2hVaWNqczFndDI5c0tPYUhjZjllQnV3?=
 =?utf-8?B?d3cxMjcvUXNQK2trZkdBZ1dYdFh1aktzMXhpQWNpa1YxVVVaUnBOc3lrNHJ0?=
 =?utf-8?B?Nnp2QlNVcUpnRlNDeDRCS2M2K2ViQzFGVDZVcHAvckozSjFQRmYyOUR2TEtm?=
 =?utf-8?B?K2JmUGlWUEFuamczVmVhZ0JkS0dmK3lDd3VmcTFQampkLzJ3aE1lWHB4NTBQ?=
 =?utf-8?B?YXoyZ0ZTcUdvTG5TNVhhMUlnMkxQOU94eU11cVh4cy9ISFg3T3BNSmdtdG01?=
 =?utf-8?B?dDhZeGQ0c0tNcE5tTURnUVlDUzhKTlJIOXNlUFNDN1VjMTIzNjFMZ1BXNjVG?=
 =?utf-8?B?dHBKY3lYbVVoSS9LTHBpbmh0aXE3VHhHK0F3OUxBc0ZaRGF3L0lVZFdTWU45?=
 =?utf-8?B?dkViME1BRGpjMyt5NDJ4T1dKWUFHcUp0SUR4TmRieU9PL2FCMHo3dTErVzBa?=
 =?utf-8?B?ZHVJSVdBcFJZY1Izdy9tQWZXQ3llaTZ3WVdKTDZoTlhNNjZjUk5aRmRNZFBz?=
 =?utf-8?B?SWFHWXFLOVo4UWlwaVY5TG5ZMXYyWG5Zb1lMU2VnU002ZzFHeEl6VTIybWNW?=
 =?utf-8?B?d25McHZkOTRoQlVPQTdPQW55WkVxdWt2ZHdHelJRR3VRMHJJNnJzcGM4bHJS?=
 =?utf-8?B?NkZYdUFUSS81OUhDSEZ1SzhYRTdWN2ZGS2dHZm9kWjdBRTRqTHFIUm8xbzNR?=
 =?utf-8?B?R3lJZ1VsT3huakIvT1ZqbWZEK2pxUnp0cTFkQ3VxZ2NQTlhrSXp2K0FXOTNS?=
 =?utf-8?B?TytOMTJ0a3dQQlNudEtuZEFRZkxLSmRldmdtb1U3ZktsQy9oOHhTZ2JFOUhK?=
 =?utf-8?B?aGFoZjBoR1cyNXF5OGlMVzNIQkJXbEltQzN3aGZZR0ExeUpFSWJPMmdQRDMy?=
 =?utf-8?B?ZXhnNkVOeGoxWjlHN2RjemQvcTNpeE04SGdlUEZBSElsajJDV2l5dXk0b1Vq?=
 =?utf-8?B?UkJuVzNWdnZISzRyOXFPNHUrNHNjOHVHNjZxaGVJT0h1Qy9LOWMrM2pJMU9P?=
 =?utf-8?B?WldVZmdJTVlxQzgwQ1NoZTJCbmQ5NndySkxBUDY3SlRadlNLRmM5S2J5ZUFN?=
 =?utf-8?B?RmtpckdmamR6VEhOek1rQVFydW9EU01RQ0NrYld6THROQkhuZm0yalFsVzNw?=
 =?utf-8?B?bUI1eUU3TUxHdUN6MEhhYlhFZTl6NjlHc094d2RYUUYwU1l6SkxSRmxPNWFi?=
 =?utf-8?B?OGZCd0RxTmhxMXFjam8rNXpuN3ZicFVEMzN1UW9LbjNrRVdVVkFxZVJMcVEv?=
 =?utf-8?B?QjZWOFRLT09RYjNyZU5DaWF6TmMzb1R1dWk3WDhob1Nxb2Zkdk1nYTBtcnpV?=
 =?utf-8?B?SlpRSURCMVZXTEQ3Y2p3ZHZJWjFwajFwUGJrbk5QOUlQRGU0eG5WMzYyRVhv?=
 =?utf-8?B?bFRjRm8xcG9Vb3czaGx2ZEF5ZUQrOXZkYUt4eTAxNGoxODBmVzhVdnFFSW9F?=
 =?utf-8?B?YmhDbkc1YW0vREZ6Yy93WU92SFJUNFkwMEJqSHFIbngyZjRjRFFJS3NJNWRZ?=
 =?utf-8?B?QVorUEZvYVhoSkhycS9iYWQrTHlGSUZCcXlzZGwvR1RaRzF2MmtWU0FUWGt0?=
 =?utf-8?B?OTZJemJuOWJ6eGFrUnMvZ1RwUVBCV0dBSmNVNVRVU0g1dzMxZnpiTTYvV2dz?=
 =?utf-8?B?NCt4QUZhL3A1cUJJTUFxcDNaN1BDbHpPUTZBUjZPSy9WVHFZQSs0K1JmZm95?=
 =?utf-8?B?YkdqNG1XcXRrazJ0KzJXMERDOE53PT0=?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2611996f-b50d-4c36-0f6e-08d9fd2e2fe6
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3240.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2022 15:55:06.4346 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GfJuDhRQzfLa5H39skMhbzVIHFwL6iFH+9lXDjCvbxm80Rfwu+C8ViLZVaA2zUeeUznx6BsXqk9Pj0XsVGhujYNjYHzzX2v0B6aFkN5bc88=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1001MB2200
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10275
 signatures=686983
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 bulkscore=0
 adultscore=0 phishscore=0 spamscore=0 suspectscore=0 malwarescore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2203030076
X-Proofpoint-ORIG-GUID: CorFiXHWmA2ORDt_Sxkc6vnStz5qeXTh
X-Proofpoint-GUID: CorFiXHWmA2ORDt_Sxkc6vnStz5qeXTh
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=steven.sistare@oracle.com; helo=mx0a-00069f02.pphosted.com
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
Cc: "Daniel P. Berrange" <berrange@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Zeng <jason.zeng@linux.intel.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Zheng Chuan <zhengchuan@huawei.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/18/2022 4:03 AM, Guoyi Tu wrote:
> On Wed, 2021-12-22 at 11:05 -0800, Steve Sistare wrote:
>> Save accepted socket fds before cpr-save, and look for them after
>> cpr-load.
>> in the environment after cpr-load.  Reject cpr-exec if a socket
>> enables
>> the TLS or websocket option.  Allow a monitor socket by closing it on
>> exec.
>>
>> Signed-off-by: Mark Kanda <mark.kanda@oracle.com>
>> Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
>> ---
>>  chardev/char-socket.c | 35 +++++++++++++++++++++++++++++++++++
>>  monitor/hmp.c         |  3 +++
>>  monitor/qmp.c         |  3 +++
>>  3 files changed, 41 insertions(+)
>>
>> diff --git a/chardev/char-socket.c b/chardev/char-socket.c
>> index d619088..c111e17 100644
>> --- a/chardev/char-socket.c
>> +++ b/chardev/char-socket.c
>> @@ -26,6 +26,7 @@
>>  #include "chardev/char.h"
>>  #include "io/channel-socket.h"
>>  #include "io/channel-websock.h"
>> +#include "migration/cpr.h"
>>  #include "qemu/error-report.h"
>>  #include "qemu/module.h"
>>  #include "qemu/option.h"
>> @@ -358,6 +359,10 @@ static void tcp_chr_free_connection(Chardev
>> *chr)
>>      SocketChardev *s = SOCKET_CHARDEV(chr);
>>      int i;
>>  
>> +    if (!chr->reopen_on_cpr) {
>> +        cpr_delete_fd(chr->label, 0);
>> +    }
>> +
>>      if (s->read_msgfds_num) {
>>          for (i = 0; i < s->read_msgfds_num; i++) {
>>              close(s->read_msgfds[i]);
>> @@ -920,6 +925,10 @@ static void tcp_chr_accept(QIONetListener
>> *listener,
>>                                 QIO_CHANNEL(cioc));
>>      }
>>      tcp_chr_new_client(chr, cioc);
>> +
>> +    if (s->sioc && !chr->reopen_on_cpr) {
> 
> Is it necessary check if the device has QEMU_CHAR_FEATURE_CPR feature
> here? In my opinion, fd should not be saved if device don't support
> cpr.

OK.  I'll add a new boolean member to CharDev that controls whether or not
to use cpr fd's:

    qemu_char_open()
        chr->cpr_enabled = (!chr->reopen_on_cpr && 
                            qemu_chr_has_feature(chr, QEMU_CHAR_FEATURE_CPR));

    tcp_chr_accept()
        if (s->sioc && chr->cpr_enabled) {
            cpr_save_fd(chr->label, 0, s->sioc->fd);
        }

... and test it at other places as well.

- Steve

>> +        cpr_save_fd(chr->label, 0, s->sioc->fd);
>> +    }
>>  }
>>  
>>  
>> @@ -1175,6 +1184,26 @@ static gboolean
>> socket_reconnect_timeout(gpointer opaque)
>>      return false;
>>  }
>>  
>> +static int load_char_socket_fd(Chardev *chr, Error **errp)
>> +{
>> +    SocketChardev *sockchar = SOCKET_CHARDEV(chr);
>> +    QIOChannelSocket *sioc;
>> +    const char *label = chr->label;
>> +    int fd = cpr_find_fd(label, 0);
>> +
>> +    if (fd != -1) {
>> +        sockchar = SOCKET_CHARDEV(chr);
>> +        sioc = qio_channel_socket_new_fd(fd, errp);
>> +        if (sioc) {
>> +            tcp_chr_accept(sockchar->listener, sioc, chr);
>> +            object_unref(OBJECT(sioc));
>> +        } else {
>> +            error_setg(errp, "could not restore socket for %s",
>> label);
>> +            return -1;
>> +        }
>> +    }
>> +    return 0;
>> +}
>>  
>>  static int qmp_chardev_open_socket_server(Chardev *chr,
>>                                            bool is_telnet,
>> @@ -1385,6 +1414,10 @@ static void qmp_chardev_open_socket(Chardev
>> *chr,
>>      }
>>      s->registered_yank = true;
>>  
>> +    if (!s->tls_creds && !s->is_websock) {
>> +        qemu_chr_set_feature(chr, QEMU_CHAR_FEATURE_CPR);
>> +    }
>> +
>>      /* be isn't opened until we get a connection */
>>      *be_opened = false;
>>  
>> @@ -1400,6 +1433,8 @@ static void qmp_chardev_open_socket(Chardev
>> *chr,
>>              return;
>>          }
>>      }
>> +
>> +    load_char_socket_fd(chr, errp);
>>  }
>>  
>>  static void qemu_chr_parse_socket(QemuOpts *opts, ChardevBackend
>> *backend,

