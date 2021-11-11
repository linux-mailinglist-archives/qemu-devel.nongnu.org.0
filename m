Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D1B044D4FF
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Nov 2021 11:29:04 +0100 (CET)
Received: from localhost ([::1]:42804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ml7KJ-0007iT-5f
	for lists+qemu-devel@lfdr.de; Thu, 11 Nov 2021 05:29:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonah.palmer@oracle.com>)
 id 1ml7Hn-00064s-Ul; Thu, 11 Nov 2021 05:26:27 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:46678)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonah.palmer@oracle.com>)
 id 1ml7Hl-0004D9-Li; Thu, 11 Nov 2021 05:26:27 -0500
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1AB98iS8024936; 
 Thu, 11 Nov 2021 10:26:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=content-type :
 message-id : date : subject : to : cc : references : from : in-reply-to :
 mime-version; s=corp-2021-07-09;
 bh=F3xOC8jj66RwaCDklwIAh47hENAAsXu7K7yiL8i9gkA=;
 b=Tp7Wg8I46JTt+QOJquoyyjNpj3wGOZlPXBwhyVJsGfwGGS1RkKFBTL/QmN/VtuKDymZ/
 eEhjEcYD3ClEDieKABTD/r5BDkdGu/iZ1KaqOBhooi3eEB2qyXw7VOlqfBvnUohH+g+M
 GavQcAd+a9g/exw9EveiMpFjgw832u67sMNqj558UWxv59mlSwE5TmaYLFuWMaQDeTuC
 QuGzFhRc5Ph6dLRcyRoIGyuKlE4wKvZis4i+S+n3RfVds7QR80dgMSNLj6Oi+3YsPzif
 ZUgZUpxFb0qhbS3nvn6nRcLDFjQ62S2babBTrInyAT4nzxlv38aXH/Iq74//01Z9uKvs Bg== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 3c87vxrwvn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 11 Nov 2021 10:26:04 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1ABAKPLh074198;
 Thu, 11 Nov 2021 10:26:03 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2177.outbound.protection.outlook.com [104.47.55.177])
 by aserp3020.oracle.com with ESMTP id 3c5hh6nd5j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 11 Nov 2021 10:26:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KnybHnLYxTtbkHn4Fqg6QLcFsnCSWUEPbBBn/94NpeReMfbWCvCMmMcIW/4lwJAFfzU38NdZpou0IAp+rfa7rp2ykSQzncZoO5RTbMX9zhnH8J+ET7SMpfNW0HyE4eCjil34Uo1KO4zyPOqb6HTNmLq8xyHD1refQsD5fyDw0ogKWNoZyfqsnqn1eeCnXACgu5xNOWDSVP6w+m/+aqjx1sulyy4nD5c1rIo5d6JlVfphPpF/Zs+c4UXDmXZR/fbn5CVt5bfhocd/0npW2pqXgwvezp3JjBT3NuKkxUCIZDhmZA8KebfVwQL1RD1vCuYzdAH/vroms7ArbYXKh06FOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F3xOC8jj66RwaCDklwIAh47hENAAsXu7K7yiL8i9gkA=;
 b=oGGLJAOeqgO00Wkzy2c8pVU9cNjYpRsgafX2JnQDtPg5XvXEzvd9X7xXg0qHGF/xCFQZ/PiRWYpvGFwR+jqs7b/DFFeG/IP8XHeYCfSoiTYMgLlWoWVEw3FAEV5jjVTPBEu+c8pposscxkZpn6SnScNxJAVUeofWckz1X4sCtMSdKKcVDlFE5KUVYgmMZBsATY4gNA6Y9QP6zBrQZ1QGhpDHHbHOZrPgzLf1Wcyy/sEWHR1AX8uhDZLmu8szmm86EAjbDFiOLnr8SvxMj0aYLvS/f+5pInez7MyqmeHH5Bh5rh4UurBqMeoj4NFAZWnd6LUVVzko1vFDIThqvpZ0Gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F3xOC8jj66RwaCDklwIAh47hENAAsXu7K7yiL8i9gkA=;
 b=hflV0znouERfLZRTG6oBu8Uuh6JyZkGoiDTL13twqpSHBmvkr5lXgK/UxeC4qWbyY7IoyDPvHh9aDvVo0w5uaxbfzWs86X7QCHiwMYj3WFVf3y6wCVJDHXs56YaLWOOrQIw8Gn3h2Cvsgos7FqeZU5MNsGkUzq7uAooIMjOmirU=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=oracle.com;
Received: from PH0PR10MB4664.namprd10.prod.outlook.com (2603:10b6:510:41::11)
 by PH0PR10MB4709.namprd10.prod.outlook.com (2603:10b6:510:3d::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.13; Thu, 11 Nov
 2021 10:26:01 +0000
Received: from PH0PR10MB4664.namprd10.prod.outlook.com
 ([fe80::3446:f4ea:c037:4517]) by PH0PR10MB4664.namprd10.prod.outlook.com
 ([fe80::3446:f4ea:c037:4517%5]) with mapi id 15.20.4669.016; Thu, 11 Nov 2021
 10:26:01 +0000
Content-Type: multipart/alternative;
 boundary="------------WUW5IOyl24NZOuagTD0r7DX7"
Message-ID: <6a041804-c944-4cc9-d773-40961a869919@oracle.com>
Date: Thu, 11 Nov 2021 05:25:56 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v9 8/8] hmp: add virtio commands
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>
References: <1636539792-20967-1-git-send-email-jonah.palmer@oracle.com>
 <1636539792-20967-9-git-send-email-jonah.palmer@oracle.com>
 <87y25ww32p.fsf@dusky.pond.sub.org>
From: Jonah Palmer <jonah.palmer@oracle.com>
In-Reply-To: <87y25ww32p.fsf@dusky.pond.sub.org>
X-ClientProxiedBy: SN6PR04CA0075.namprd04.prod.outlook.com
 (2603:10b6:805:f2::16) To PH0PR10MB4664.namprd10.prod.outlook.com
 (2603:10b6:510:41::11)
MIME-Version: 1.0
Received: from [10.39.203.104] (209.17.40.41) by
 SN6PR04CA0075.namprd04.prod.outlook.com (2603:10b6:805:f2::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4669.11 via Frontend Transport; Thu, 11 Nov 2021 10:25:57 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 07ae91d5-d150-40af-ea37-08d9a4fda821
X-MS-TrafficTypeDiagnostic: PH0PR10MB4709:
X-Microsoft-Antispam-PRVS: <PH0PR10MB4709FF6D0F05F81AFA4C7137E8949@PH0PR10MB4709.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Q3QqMk5cN7E3fEphXo/7KSgskUsrVAi6RPXBKoQLna7RgIWHM3h4x7yiBRsZCd0xsOIOoKXiK/eqVlj3kr247MstPkOYrsehv28QHmxxnmiF5h4XIhe9Ha4qba/PI0P1mSaUiWRp4A7Ws93kQ19oAmcduXa50Bp+kjWWB4A6iIP2EWAt15bXbBV34EmK/5PCWQ/G/dlTGKENWGOJFnE8wppxGlGP0xQp2DDE34v3/UaCZpSRLdRc0HYgBk+2NnNkHp9MRCc3munVqcoMny68C8Gd/72WTsF/5fu699gF89aDyE5OBC83PMc+jxz0QII08DfALMrIqKGTwpyiDBWgVTRH9n03MhcriJiphoV1DzcG4NIbqefkQnarwXeKfER98bjXSmiAp8sajiNUt0W7RcJvpVcoF26KnqCO4QB7DYsC6M2FmeGF47Ju5yPet1RmWwZJaSWmMe3VDPBfW2J8uRnOqYsLsTdQ5e06hvpXv6hKFj/Uxx067U656Goj+E8jqDyMX4K3kOAJu1odoHQuphXKirVOFs0l2aqJQPzAXEPDIZ8H2/+tpvwZ4NxR7fWXBYa7I36a9QCsPCD95O2VJnhEku2XZF1hRoF4sXVTeZh0Bohrbw64tBIPa7hBjhlCwr6krcc+bNUZejuPbjFdPFoggIBE/4Qz231vUlcZuiD6PQjYC+FJObkL3W33LAxq+wAhaWG3e+Ahzfa/gnpwG2YAVSECO5pfjRJ+NO3Zdbg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR10MB4664.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(33964004)(31686004)(86362001)(186003)(6486002)(31696002)(2906002)(956004)(2616005)(38100700002)(6916009)(4326008)(8936002)(26005)(66476007)(66556008)(44832011)(8676002)(316002)(16576012)(83380400001)(5660300002)(53546011)(7416002)(66946007)(36756003)(508600001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TThHKzYzZHlVOWdodFNyMWtCdFhlaE1PaEduV0NxYWJOK2dybnhWS0drY20y?=
 =?utf-8?B?cWJUTExmZTBmU21UTGxPY3VWM0VVTm0zLzdQcENHOUJTK0JuNFVSVlE1U2VB?=
 =?utf-8?B?OFc0U3J1Zm1QN2VldDZMdVBGZ0NBQVN4c2VjaUFmT0dXSm8yUjRadXhubDRz?=
 =?utf-8?B?cll6STUvOGNUMFJyaVRLMEV2U05UTzExV1d0ZmNwLzFjaGJMTDdYY3VZTFZH?=
 =?utf-8?B?eGF0VlNkTkFnTUpjN3habUhhd2lLVzA4cEhNV1VycXFkUlJ5L3hWdDh5ZnRP?=
 =?utf-8?B?RVJRSHlwMUhnTm1nakNSM0ZiQnFsanljdCt6Zm9BOWZRcE1SUEpKUkwwQjhS?=
 =?utf-8?B?bVJGRGowc01aYmVWbnlJVksyWjRpbzBVTko1T1FQbGVXWjYyeTRLaXltZFNp?=
 =?utf-8?B?aUkyRlRNTTgwYW1JY0tocG85YVFQNC9mbXM0R2djaExoS1pjOEtOemZ2YytT?=
 =?utf-8?B?RVltNVZabEJSWkduNVlTNG84U1pST1hnVlJtM0JrSncvUUdBRHZmZzMyTVRO?=
 =?utf-8?B?NG1HWDFHb3VUbkNMUjMrcEt2T0RqbVh4Q3ZqSzVrdkZTNGp6T1BMNXcvZ1ZT?=
 =?utf-8?B?T013ekNBWXBkVUQ5UmUzOFRlS1d6YU5ucG82WG44NzZUTnlGa2pEcThsT3pM?=
 =?utf-8?B?TWM5QjhkZWsrb0d3MEY2Wmo0RXlrcHB4NTlVQlNkbmswZTB6SFFWeXFkTk5a?=
 =?utf-8?B?RkRja3htd0Fxa0dnUkpxVUxVZzJ6WUFDQUJkZTJ4ZmYwdDB4YStocHdLNldz?=
 =?utf-8?B?Z1dnS1U4MjlNSTF1eS93RWNsS1pFSWl4UjFLS2xZV3N0UEdOV2xTaXFBdFFO?=
 =?utf-8?B?RkNScTFFYzEzblRNYm5kYVNJYTNqa3lweElqWmNVUmljRlNudS80YnAxOXdh?=
 =?utf-8?B?eGpXWGlIREw0a1k2bjQ4SVBDQzBRZ1AzUWxGalNOUHVEZ0VCRXZQcG00YWpr?=
 =?utf-8?B?TXdMLzFaVS9IQmtNTzNka2pEdXJFenRtL0FmYy9UbzFZajBieENPNXV0TnRp?=
 =?utf-8?B?dkdwTGtNdXV5Q3k1UTZIZVlsL05iVWZ0SEc0TUdudnVuYkJhM241M0FSbTg5?=
 =?utf-8?B?U1draG82dmxsRDNlMnptQ3VRUFhjSDlqVmRoMnZEY01MOWs3VkY5c2RxVWNR?=
 =?utf-8?B?K2g2bTdhL1ZhM1Q1bThoOHFMeE11anZQcXI3ZUE0ODNINktzbVkyN2pKRDBq?=
 =?utf-8?B?Y0Q3WXJ0NTNGdThYRndwTXBOQ1pBUXN2em9OV2NhamN6Y3hRRFJ1SmxoVHY2?=
 =?utf-8?B?dktrR2JDdVdSL1krMllNNzRUeDIvN0FJSS8rS0JhckhFekpBTisrWTZWN2Ry?=
 =?utf-8?B?WjY1bFhrcFNXbG10MkhUNUlveTZuRlZMSGFhVlh4MktlcEZKZ290RzJiRjFn?=
 =?utf-8?B?M1ZKeFZYa3F2anYvTE1kVWgyYXZjU29KcytUK3IxMi82WnBkWFNRd3AwYU9t?=
 =?utf-8?B?aE5Jb1ZSYno3SjlJbFlYbk85TUpDL3NoVnpFVmVlVW95SGhOYThZZVVhK2pi?=
 =?utf-8?B?UTJVNFZHbVA2VDRzR0VBYldvdVJQMWVENjVldlRpNEJSeU1CTDBmOVJBWDdq?=
 =?utf-8?B?VXhoaWRRd2orQnBmZUE3SEIyWXBjVGN5Rmk5bFRaaHhCZVl3NlVUSGsvWXkv?=
 =?utf-8?B?NnRGT2o2VGczUS8zVndPejRjOW1KV0kzd3FuUTJIKzYzMU1kdGN3aGVxZ2o1?=
 =?utf-8?B?b2pHZ3IyVWoxWnVyZ2lNMlIrWndtWmYxR1duczFTNnNNMHpyOTdTMmxxYUxH?=
 =?utf-8?B?d2NJWXFsNGdIOU5tUjByWWY1dTZXSHIvY3dlM1BGRjV3YXdBdzc1R3puMGhQ?=
 =?utf-8?B?Z2ZxbTJuQis4NVZYSGtLTmJLa0M2ZXNTbWR5OEJKVjF2bnFoWkZ1blBjcE9X?=
 =?utf-8?B?UkkwTFVlT1NsaHFGY09pT1Z4ektxSitBa1JkdjF6a1lqWHFiaVBuOXBBQUlQ?=
 =?utf-8?B?QzN3UG5tVlJjTlFsYkRHbS81WGlobldRcXJpOGhkZTR4UFIzUk5ranlRZkZs?=
 =?utf-8?B?cEtGVENuMWQrRmIxbmw5dk5lbnhKK3Jjb2x3eiswSVZEbUZCK24ySVo1Vi9w?=
 =?utf-8?B?Z1RXQjhvSlBqQ0ZoVDRYaHZaSnpPOWwza1NGZDVoVndCUWJJU2VKNlVINUw4?=
 =?utf-8?B?SEo5Q1ZobzFad1pSaUI4QjZKKzhBS3l4d0xYK3g4R1lTSEQxTTB6TllZRTZj?=
 =?utf-8?Q?lmv45tX6LWaa0RNEflcovnQ=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 07ae91d5-d150-40af-ea37-08d9a4fda821
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB4664.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2021 10:26:00.8681 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oupfuzynLBYQc21ljqbDY8twzb3KRVqVnRBH3kFyQCFLFA7fNEuPcIZHHLWeKsiqQWKKgMuxoGsEsHMfDWVFFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4709
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10164
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 bulkscore=0 mlxscore=0
 malwarescore=0 spamscore=0 adultscore=0 suspectscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2111110062
X-Proofpoint-ORIG-GUID: 8K-2k_dRJGQuabYBMneJYfOFUgswznyp
X-Proofpoint-GUID: 8K-2k_dRJGQuabYBMneJYfOFUgswznyp
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=jonah.palmer@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -67
X-Spam_score: -6.8
X-Spam_bar: ------
X-Spam_report: (-6.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-3.999, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: mst@redhat.com, qemu_oss@crudebyte.com, qemu-devel@nongnu.org,
 kraxel@redhat.com, si-wei.liu@oracle.com, joao.m.martins@oracle.com,
 eblake@redhat.com, qemu-block@nongnu.org, david@redhat.com,
 arei.gonglei@huawei.com, marcandre.lureau@redhat.com, lvivier@redhat.com,
 thuth@redhat.com, michael.roth@amd.com, groug@kaod.org, dgilbert@redhat.com,
 eric.auger@redhat.com, stefanha@redhat.com, boris.ostrovsky@oracle.com,
 kwolf@redhat.com, mathieu.poirier@linaro.org, raphael.norwitz@nutanix.com,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--------------WUW5IOyl24NZOuagTD0r7DX7
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 11/10/21 08:30, Markus Armbruster wrote:
> Jonah Palmer<jonah.palmer@oracle.com>  writes:
>
>> From: Laurent Vivier<lvivier@redhat.com>
>>
>> This patch implements the HMP versions of the virtio QMP commands.
>>
>> Signed-off-by: Jonah Palmer<jonah.palmer@oracle.com>
>> ---
>>   hmp-commands-info.hx  | 218 ++++++++++++++++++++++++++++++
>>   include/monitor/hmp.h |   5 +
>>   monitor/hmp-cmds.c    | 358 ++++++++++++++++++++++++++++++++++++++++++++++++++
>>   3 files changed, 581 insertions(+)
>>
>> diff --git a/hmp-commands-info.hx b/hmp-commands-info.hx
>> index 407a1da..6bf7359 100644
>> --- a/hmp-commands-info.hx
>> +++ b/hmp-commands-info.hx
>> @@ -877,3 +877,221 @@ SRST
>>     ``info sgx``
>>       Show intel SGX information.
>>   ERST
>> +
>> +    {
>> +        .name      = "virtio",
>> +        .args_type = "",
>> +        .params    = "",
>> +        .help      = "List all available virtio devices",
>> +        .cmd       = hmp_virtio_query,
>> +        .flags     = "p",
>> +    },
>> +
>> +SRST
>> +  ``info virtio``
>> +    List all available virtio devices
>> +
>> +    Example:
>> +
>> +    List all available virtio devices in the machine::
>> +
>> +    (qemu) info virtio
>> +    /machine/peripheral/vsock0/virtio-backend [vhost-vsock]
> I get
>
>      docs/../hmp-commands-info.hx:899:Inconsistent literal block quoting.
>
> This is from Sphinx.  I can't see what's wrong.

I'll (hopefully) get this cleared up in the next series. Will run Sphinx
myself to double check.


Jonah

>> +    /machine/peripheral/crypto0/virtio-backend [virtio-crypto]
>> +    /machine/peripheral-anon/device[2]/virtio-backend [virtio-scsi]
>> +    /machine/peripheral-anon/device[1]/virtio-backend [virtio-net]
>> +    /machine/peripheral-anon/device[0]/virtio-backend [virtio-serial]
>> +
>> +ERST
> [...]
>
--------------WUW5IOyl24NZOuagTD0r7DX7
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 11/10/21 08:30, Markus Armbruster
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:87y25ww32p.fsf@dusky.pond.sub.org">
      <pre class="moz-quote-pre" wrap="">Jonah Palmer <a class="moz-txt-link-rfc2396E" href="mailto:jonah.palmer@oracle.com">&lt;jonah.palmer@oracle.com&gt;</a> writes:

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">From: Laurent Vivier <a class="moz-txt-link-rfc2396E" href="mailto:lvivier@redhat.com">&lt;lvivier@redhat.com&gt;</a>

This patch implements the HMP versions of the virtio QMP commands.

Signed-off-by: Jonah Palmer <a class="moz-txt-link-rfc2396E" href="mailto:jonah.palmer@oracle.com">&lt;jonah.palmer@oracle.com&gt;</a>
---
 hmp-commands-info.hx  | 218 ++++++++++++++++++++++++++++++
 include/monitor/hmp.h |   5 +
 monitor/hmp-cmds.c    | 358 ++++++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 581 insertions(+)

diff --git a/hmp-commands-info.hx b/hmp-commands-info.hx
index 407a1da..6bf7359 100644
--- a/hmp-commands-info.hx
+++ b/hmp-commands-info.hx
@@ -877,3 +877,221 @@ SRST
   ``info sgx``
     Show intel SGX information.
 ERST
+
+    {
+        .name      = &quot;virtio&quot;,
+        .args_type = &quot;&quot;,
+        .params    = &quot;&quot;,
+        .help      = &quot;List all available virtio devices&quot;,
+        .cmd       = hmp_virtio_query,
+        .flags     = &quot;p&quot;,
+    },
+
+SRST
+  ``info virtio``
+    List all available virtio devices
+
+    Example:
+
+    List all available virtio devices in the machine::
+
+    (qemu) info virtio
+    /machine/peripheral/vsock0/virtio-backend [vhost-vsock]
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
I get

    docs/../hmp-commands-info.hx:899:Inconsistent literal block quoting.

This is from Sphinx.  I can't see what's wrong.
</pre>
    </blockquote>
    <pre>I'll (hopefully) get this cleared up in the next series. Will run Sphinx
myself to double check.


Jonah
</pre>
    <blockquote type="cite" cite="mid:87y25ww32p.fsf@dusky.pond.sub.org">
      <pre class="moz-quote-pre" wrap="">
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">+    /machine/peripheral/crypto0/virtio-backend [virtio-crypto]
+    /machine/peripheral-anon/device[2]/virtio-backend [virtio-scsi]
+    /machine/peripheral-anon/device[1]/virtio-backend [virtio-net]
+    /machine/peripheral-anon/device[0]/virtio-backend [virtio-serial]
+
+ERST
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
[...]

</pre>
    </blockquote>
  </body>
</html>
--------------WUW5IOyl24NZOuagTD0r7DX7--

