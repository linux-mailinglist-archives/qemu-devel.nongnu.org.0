Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 45551611947
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Oct 2022 19:28:46 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooT9b-0002nJ-VX; Fri, 28 Oct 2022 13:28:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <si-wei.liu@oracle.com>)
 id 1ooT9J-0002gR-Ok
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 13:28:10 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <si-wei.liu@oracle.com>)
 id 1ooT9F-00034k-R3
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 13:28:05 -0400
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29SHGt34011139;
 Fri, 28 Oct 2022 17:27:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=content-type :
 message-id : date : subject : to : cc : references : from : in-reply-to :
 mime-version; s=corp-2022-7-12;
 bh=Wt4wokOpLe01L4FRkfIRGFpunO4VUQGkck1wSZESVPY=;
 b=DDHz0eZpsY/miPIQaS2cYsE1WE7UEXjo+F0dSPmJoRO0JN2h4VJitAXHknnxFcop0a1A
 l1LlXjvBwrSuKzrQ+GdXKuxY8PbY+36dCEBcIHui2Q62J0AAWJwx3FbfMX2tNJ0i1Kwa
 CsM3+HS8GnF1zxGy/KvfVkmvw4A36bZAQwdYnURkJHeSSRaR4JDKqj5EfR4O2lZJ4Kv/
 3LJJCSv6lKhue1yS21RLaq8jrj5ezFsgAXJPmhFy6qD1rIVu22DUVA2h7xeb68/jHrCl
 ASX4JqKJELcx+frh45a7F92ML6FnGuq220ofEp1vHCjvXCt81uWdUuaMDLIJuskNazU2 BQ== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3kfahee0h8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 28 Oct 2022 17:27:57 +0000
Received: from pps.filterd
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 29SGSd6I006656; Fri, 28 Oct 2022 17:27:57 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2104.outbound.protection.outlook.com [104.47.70.104])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 3kfagj8unw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 28 Oct 2022 17:27:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Cm3Jsxb3rVVsUYPmKbEffrABcxRvhHIG+u1sIX1JIJ6yPuy6PYd4gpWgQX2CLaRYDn8lDP8kKr+vtTQ1sQ8rSqodwlxowCPjcElmgWh8XqIEXBS9Af4GXB7hywdv2n3RtdB5EZFByQtbxCiRGyKlT3pwFCcmAQXZxlEeEzAXsuVKcWsp2/AJQrVpoNEG28UOppkWOxqRLmiwypd3hoWC2XSoSnry1RbEbE4deTV0Wlcm+thqZvtbv+5QXl5sV6Vu3SE9kdW0E+yiMbgExuFpwK8GMT55admYLGyLb9xBO6eUcxgLvHfEBk0qMG4Kp/HRfFHZa7U/l+JGxXf/+UDp4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wt4wokOpLe01L4FRkfIRGFpunO4VUQGkck1wSZESVPY=;
 b=SbRuTc/7bfSwGyObSupvuGfbdtnKINxUcWeDsIPE0u51ZBBq8vMv39/h0OFMJ2BqjQjB8PxqKESJ9YHowP3VJtyqB+2k0S67AsBCVfUEI5Ro423Z1ZZNfKDBozohDsYqsG7dILRU+qa6Pc4cJgcpD4H2x85YVtgJdalqXXJF5MfLcA10fx04aOe1QK+UH6W6MoRrx8XQb/vTi8RzZduphSVcVOFWMDu+olXLDxhbLbgLrSFu1BfzijrA2Rnx1EnRk8p5VJb0QZeDld7GUEmRn2hrBinoBmccQH7i6DNTZfzPgzuT13HM5ROZwky+e6NPdpjJcUfS0Y/gECajuSaQEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wt4wokOpLe01L4FRkfIRGFpunO4VUQGkck1wSZESVPY=;
 b=E7FKpsYpgpRNjYBiYIV/On76dCDLmNieKCVVH5BdhYtTQyiy6zFiMVC3D9UkJaPffXjy8NbI8rbrByEhIDpJnQbhPhs0MFYq/8mq1IvKxNesryWhvdavPxvFo6QrSH5Pbv4LSjUHJfpt8pBWJ9ZTQkCxjs+gEQ3O898HC0XRoHc=
Received: from MW4PR10MB6535.namprd10.prod.outlook.com (2603:10b6:303:225::12)
 by BL3PR10MB6068.namprd10.prod.outlook.com (2603:10b6:208:3b7::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.28; Fri, 28 Oct
 2022 17:27:54 +0000
Received: from MW4PR10MB6535.namprd10.prod.outlook.com
 ([fe80::9830:ae4d:f10c:c30a]) by MW4PR10MB6535.namprd10.prod.outlook.com
 ([fe80::9830:ae4d:f10c:c30a%5]) with mapi id 15.20.5723.032; Fri, 28 Oct 2022
 17:27:54 +0000
Content-Type: multipart/alternative;
 boundary="------------mwB6RZiDlQy0J94S5aNCkmha"
Message-ID: <d599973d-a974-b14a-d63c-caff2eba3fe6@oracle.com>
Date: Fri, 28 Oct 2022 10:27:48 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH] vhost-vdpa: fix assert
 !virtio_net_get_subqueue(nc)->async_tx.elem in virtio_net_reset
Content-Language: en-US
To: jasowang@redhat.com
Cc: qemu-devel@nongnu.org, Eugenio Perez Martin <eperezma@redhat.com>
References: <1664913563-3351-1-git-send-email-si-wei.liu@oracle.com>
 <CAJaqyWdtDH8FYzvPLqW8PHmwtUP-puHH=n7EB7xgHsy_uur4Dw@mail.gmail.com>
From: Si-Wei Liu <si-wei.liu@oracle.com>
Organization: Oracle Corporation
In-Reply-To: <CAJaqyWdtDH8FYzvPLqW8PHmwtUP-puHH=n7EB7xgHsy_uur4Dw@mail.gmail.com>
X-ClientProxiedBy: DS7PR06CA0048.namprd06.prod.outlook.com
 (2603:10b6:8:54::24) To MW4PR10MB6535.namprd10.prod.outlook.com
 (2603:10b6:303:225::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR10MB6535:EE_|BL3PR10MB6068:EE_
X-MS-Office365-Filtering-Correlation-Id: a75134ef-1dec-490f-55c9-08dab909bf25
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YcgJ9UiE8ntG45XW9PEhoODkfjl0UtztcHdjxliPUaz+n195YOYaZIaGNt1Adi+397Ks/7RtFysUCsUFAKMw4UUjx7ITsfr5FwqHBBRfy/RD1w33lAa9gT1p2EtxKsXYUJ/P0YtFr98sLX8C6q3J9qMSt87Fq6iyzunt1n5IEjsjXP715S9MuoG3/bu5b9gF43Dq5TG5qr2bebvHt2VOg0plXoF1zjVszn7ZdpW5uEpaykMfoG8YCiSojxZC0KHifMebdtCV5d7ZhpMM+xlIkTL7Y8sTfidVrsbMRJF+jozpUHT0367NynYfinO1IOuHu/EmPKbV3yJsurFj4WpWySOmRMKvAMEKMtoNaHeturT1Z0m1XFpHDBYmOUFggBW/eiwImOw1Fz9L8MF156UmzxUc8dwpt6KhVtMsMunifR0YAYsVzOFhIQv1guo2ADXMlaJBJQsheGLdRZVGOBHfG6EMsZP6Elgw9F10CgR2gHg3sxUwnXIAs1kVZy+TfllDMu0ZMJtKjvVcFHwkiXGWAw1Ir/5C4m8FUh4nWNG6EEeb/SSwMzA+guv7/+yEeo2bMG+xCNiRXq6ku41lkbXLqRK0HWz/TI2Nd/BUl9o76AS6zGWggYIlg1gUxaRGJibsJQ2I8mkeh6PrFrPGKvm/1OubB1hukY2v5chXtCaGkQGb5eEYakaQSuuvVOntYUiU1wDHayx7NTWiTRZGWhVl4FPLOwkDbgN3d9n/qwl50E1vDVRmIw1MegTtQFzWtizVY3zjaQBWR7sfqto/dDdKNDYz0wtzQVix20ElbkUkErs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR10MB6535.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(346002)(366004)(396003)(39860400002)(376002)(136003)(451199015)(5660300002)(86362001)(31696002)(66476007)(6666004)(66574015)(36756003)(8676002)(186003)(83380400001)(4326008)(2616005)(66946007)(33964004)(2906002)(66556008)(31686004)(6506007)(6512007)(53546011)(26005)(316002)(41300700001)(36916002)(6486002)(8936002)(38100700002)(6916009)(478600001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QjVSN3RESGtyYnVvaFZ2elZ2K0lJdmVzd05rT2xDMXdub3lRTWw4M2prRlBJ?=
 =?utf-8?B?T1NuR2s4TDFtUjRteEpCeW5tNHJMZkhYVUVWWm1xNGh4NzdqZjVoRTM2TjhJ?=
 =?utf-8?B?aUl2U2ZOVTVJMk9iRjVDZlFqR0lVcTZMVXc4Z2g0Z3hDcndVa1hzM0xSWnls?=
 =?utf-8?B?c1BBWFF5LzV0clc4a290Mno3dFlzZmJwQTkvejNvNVoxRXFheEV4WmU0SXly?=
 =?utf-8?B?R1NEQmhJaXBSVzRDNWJlc1RrY3A0a0ZoSm5pTytldTYzblljaStsbi9HcTdm?=
 =?utf-8?B?WVljVWs1QVVYTXhnSHl4T2NTK1dsaTZLWWRVeDkxTGdZRU52cmZlbWQ0alUx?=
 =?utf-8?B?bXJac2JjcURsMTFnOWNDNEFPZU9MbHZ5N0hEMy9Qby9BbXpPQUd0VzdScjlv?=
 =?utf-8?B?RExUNHRIYy9BL0Z5Z0xkbHJyak90VGxpNXp1R3A0RkRjTEFrQWRsM0FoNVd4?=
 =?utf-8?B?aXd4VXpNampQU0UyQlVTWkorQVR4ZVZRN0haVkNkaTZaaGRYd1J5NnNYK3hu?=
 =?utf-8?B?U3RWRE8xS1I3cnQzc0FaYTJtbmlRYURkRGc4U1lBaG5WT0YwTDlTYlJlRVQ5?=
 =?utf-8?B?dEpubWdsTnJpTTdTV2xQalE0V2VtbE1rYVJxZTZIYnFpMEVNaGs3SUs2NWZm?=
 =?utf-8?B?bGgrS1hYTzhaS0IxUy9sZ1o3UWdGOFdNaWx2eEFHSkhveHJJMFF6Z0ZjRGNv?=
 =?utf-8?B?TjhlUVo5NEw2TFl2di9Ka0RqRVI0Y1JweE0vUXV2K2dTalkrNE56Zm9KT3BS?=
 =?utf-8?B?MVA2cWltWEhoWkVyVWQvMFRyZS9sWmxNcVFRVEdRTTJJdWtNd3VhRzUzUHVo?=
 =?utf-8?B?c3V2WTJhSDdtTFVEZ1JsRXFNNk56QUNpZlp5aEUwTEdYKzZRbWthWnlHTzQ2?=
 =?utf-8?B?KzZmZDRGc2VxN0xQbjFYVC9nZW93TW9weS9aby9jQ0libjVSK1dOSXlSaUdk?=
 =?utf-8?B?V1J5VVJlVTNsYmJ6UUlXaWhEMUtwMm4vNmNtRUJ0blpheXVLbEZYdGROck5u?=
 =?utf-8?B?N0pCTFkyY3gyOWRDTUNIU0JJQnRRaTB3MFgrWkR5dHk5cVFYY0k0OFllSXpv?=
 =?utf-8?B?RkRHTThXVU5PNUdiR2ZnR2FzdGlvWGxvdlE3bHFnYmluUU02ZmpqTWswNjY5?=
 =?utf-8?B?WWVWTHNZanVxOUVWd2ZHWU5VN2Z6RFkzSmlaY0FTS0pTc0RNeEx5bUtNNjBX?=
 =?utf-8?B?QW5sQkphVXlWUUpKcTJCT01xcFlRaTZxOG94ZWFHeTRGRmh0Q09ZbkFUYlhJ?=
 =?utf-8?B?RVhBNUQ4bEEwV2JyTks1Y2VVRW43NzFlSUw2ZVV5K3pPNkdkb255bWxpK0Vw?=
 =?utf-8?B?Vkh0QXRtak1UQy9jbFp5SjVxY2VLbzBoSk5KeTRzSFozMnQ0MzA0TjhZQlhm?=
 =?utf-8?B?bE1xeG5kWkEvYkNmMW9PU2tnYzhxN1hSUEhQYVd3cEpPb1YvMkVaZm5MbE4z?=
 =?utf-8?B?Q282blZ0MXlRNFd3VmdITFAyd0VIQytiZWY2MkFhVjJKYjhIY3JEV0NxTTJB?=
 =?utf-8?B?Snh5aTJRek9qN3JXeHdscUdlZEEwaktXL2twSW5GYkVzYUd2ZHU0MDdEK2tX?=
 =?utf-8?B?NWdrTE5KOGptMXhPS0JjVGhicVNXSU1BbXVpOTJFejc1WUQ2eHNlbWdiOTZI?=
 =?utf-8?B?WlE0ak9oTzBzMVJYRUFLVzQxN05yMUJ4SWRVU05Ody9wbisyaG4rTmpvMFNJ?=
 =?utf-8?B?Y3YxSUFWTFdIeGd6cUR1QmZ0UkcrYUpFcTl2RjBjR3RIUU41UldtVGRBMjBQ?=
 =?utf-8?B?YXF6c2g3MWMyTm83U2p0NU9KTFpYR2NwVnp2MVREYnRublZYSkdhekp1dW5Q?=
 =?utf-8?B?ZGlZQWpKY3R0bHZuR0lDYnFCM0x4OXQ3N0NDTVRJN3Q5NVhxVGoyRW84UFhn?=
 =?utf-8?B?RUQwVGthSHF0dGh5ZGE5eFhiOWIrZUUyenY1dWE4OVA1ZGpXNnFNV2JiSzNE?=
 =?utf-8?B?R0crbkdRckFCVjh4WWliV2JlS1dsQmtJRUZrb0lqTHU0K0JSZHg3MHEzdjFR?=
 =?utf-8?B?aVFIblRBYjhoNjFZdFF0TDJNL1FXaE9DbU5QbkU2WGdjQXJSUTlUWGdJRHhW?=
 =?utf-8?B?K1IvQWx6WlBIRWtzdlNUQjA5aE5xSGJRSVNEU2l4V2o5MjdhRmtMdzU0Z2lz?=
 =?utf-8?Q?k3Df2SBwU3RiIrN7DGuOvWk/i?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a75134ef-1dec-490f-55c9-08dab909bf25
X-MS-Exchange-CrossTenant-AuthSource: MW4PR10MB6535.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2022 17:27:54.1585 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U8ADeWugKCfYcPyznXv/g+lRmEUoPVCM8gkro2RHtdKg/Na56auwroTeQPQ4TJGCXpwUboJgOd3aiBCPbuWLog==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR10MB6068
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-28_07,2022-10-27_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 spamscore=0
 suspectscore=0 phishscore=0 adultscore=0 mlxscore=0 mlxlogscore=999
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2210280109
X-Proofpoint-GUID: NIWqfg4JWXV3MqLklsQDC_249VgXQ3KP
X-Proofpoint-ORIG-GUID: NIWqfg4JWXV3MqLklsQDC_249VgXQ3KP
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=si-wei.liu@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

--------------mwB6RZiDlQy0J94S5aNCkmha
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Jason,

This one is a one-line simple bug fix but seems to be missed from the 
pull request. If there's a v2 for the PULL, would appreciate if you can 
piggyback. Thanks in advance!

Regards,
-Siwei

On 10/7/2022 8:42 AM, Eugenio Perez Martin wrote:
> On Tue, Oct 4, 2022 at 11:05 PM Si-Wei Liu<si-wei.liu@oracle.com>  wrote:
>> The citing commit has incorrect code in vhost_vdpa_receive() that returns
>> zero instead of full packet size to the caller. This renders pending packets
>> unable to be freed so then get clogged in the tx queue forever. When device
>> is being reset later on, below assertion failure ensues:
>>
>> 0  0x00007f86d53bb387 in raise () from /lib64/libc.so.6
>> 1  0x00007f86d53bca78 in abort () from /lib64/libc.so.6
>> 2  0x00007f86d53b41a6 in __assert_fail_base () from /lib64/libc.so.6
>> 3  0x00007f86d53b4252 in __assert_fail () from /lib64/libc.so.6
>> 4  0x000055b8f6ff6fcc in virtio_net_reset (vdev=<optimized out>) at /usr/src/debug/qemu/hw/net/virtio-net.c:563
>> 5  0x000055b8f7012fcf in virtio_reset (opaque=0x55b8faf881f0) at /usr/src/debug/qemu/hw/virtio/virtio.c:1993
>> 6  0x000055b8f71f0086 in virtio_bus_reset (bus=bus@entry=0x55b8faf88178) at /usr/src/debug/qemu/hw/virtio/virtio-bus.c:102
>> 7  0x000055b8f71f1620 in virtio_pci_reset (qdev=<optimized out>) at /usr/src/debug/qemu/hw/virtio/virtio-pci.c:1845
>> 8  0x000055b8f6fafc6c in memory_region_write_accessor (mr=<optimized out>, addr=<optimized out>, value=<optimized out>,
>>     size=<optimized out>, shift=<optimized out>, mask=<optimized out>, attrs=...) at /usr/src/debug/qemu/memory.c:483
>> 9  0x000055b8f6fadce9 in access_with_adjusted_size (addr=addr@entry=20, value=value@entry=0x7f867e7fb7e8, size=size@entry=1,
>>     access_size_min=<optimized out>, access_size_max=<optimized out>, access_fn=0x55b8f6fafc20 <memory_region_write_accessor>,
>>     mr=0x55b8faf80a50, attrs=...) at /usr/src/debug/qemu/memory.c:544
>> 10 0x000055b8f6fb1d0b in memory_region_dispatch_write (mr=mr@entry=0x55b8faf80a50, addr=addr@entry=20, data=0, op=<optimized out>,
>>     attrs=attrs@entry=...) at /usr/src/debug/qemu/memory.c:1470
>> 11 0x000055b8f6f62ada in flatview_write_continue (fv=fv@entry=0x7f86ac04cd20, addr=addr@entry=549755813908, attrs=...,
>>     attrs@entry=..., buf=buf@entry=0x7f86d0223028 <Address 0x7f86d0223028 out of bounds>, len=len@entry=1, addr1=20, l=1,
>>     mr=0x55b8faf80a50) at /usr/src/debug/qemu/exec.c:3266
>> 12 0x000055b8f6f62c8f in flatview_write (fv=0x7f86ac04cd20, addr=549755813908, attrs=...,
>>     buf=0x7f86d0223028 <Address 0x7f86d0223028 out of bounds>, len=1) at /usr/src/debug/qemu/exec.c:3306
>> 13 0x000055b8f6f674cb in address_space_write (as=<optimized out>, addr=<optimized out>, attrs=..., buf=<optimized out>,
>>     len=<optimized out>) at /usr/src/debug/qemu/exec.c:3396
>> 14 0x000055b8f6f67575 in address_space_rw (as=<optimized out>, addr=<optimized out>, attrs=..., attrs@entry=...,
>>     buf=buf@entry=0x7f86d0223028 <Address 0x7f86d0223028 out of bounds>, len=<optimized out>, is_write=<optimized out>)
>>     at /usr/src/debug/qemu/exec.c:3406
>> 15 0x000055b8f6fc1cc8 in kvm_cpu_exec (cpu=cpu@entry=0x55b8f9aa0e10) at /usr/src/debug/qemu/accel/kvm/kvm-all.c:2410
>> 16 0x000055b8f6fa5f5e in qemu_kvm_cpu_thread_fn (arg=0x55b8f9aa0e10) at /usr/src/debug/qemu/cpus.c:1318
>> 17 0x000055b8f7336e16 in qemu_thread_start (args=0x55b8f9ac8480) at /usr/src/debug/qemu/util/qemu-thread-posix.c:519
>> 18 0x00007f86d575aea5 in start_thread () from /lib64/libpthread.so.0
>> 19 0x00007f86d5483b2d in clone () from /lib64/libc.so.6
>>
>> Make vhost_vdpa_receive() return the size passed in as is, so that the
>> caller qemu_deliver_packet_iov() would eventually propagate it back to
>> virtio_net_flush_tx() to release pending packets from the async_tx queue.
>> Which corresponds to the drop path where qemu_sendv_packet_async() returns
>> non-zero in virtio_net_flush_tx().
>>
> Acked-by: Eugenio Pérez<eperezma@redhat.com>
>
>
>> Fixes: 846a1e85da64 ("vdpa: Add dummy receive callback")
>> Cc: Eugenio Perez Martin<eperezma@redhat.com>
>> Signed-off-by: Si-Wei Liu<si-wei.liu@oracle.com>
>> ---
>>   net/vhost-vdpa.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
>> index 4bc3fd0..182b3a1 100644
>> --- a/net/vhost-vdpa.c
>> +++ b/net/vhost-vdpa.c
>> @@ -211,7 +211,7 @@ static bool vhost_vdpa_check_peer_type(NetClientState *nc, ObjectClass *oc,
>>   static ssize_t vhost_vdpa_receive(NetClientState *nc, const uint8_t *buf,
>>                                     size_t size)
>>   {
>> -    return 0;
>> +    return size;
>>   }
>>
>>   static NetClientInfo net_vhost_vdpa_info = {
>> --
>> 1.8.3.1
>>

--------------mwB6RZiDlQy0J94S5aNCkmha
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    Hi Jason,<br>
    <br>
    This one is a one-line simple bug fix but seems to be missed from
    the pull request. If there's a v2 for the PULL, would appreciate if
    you can piggyback. Thanks in advance!<br>
    <br>
    Regards,<br>
    -Siwei<br>
    <br>
    <div class="moz-cite-prefix">On 10/7/2022 8:42 AM, Eugenio Perez
      Martin wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:CAJaqyWdtDH8FYzvPLqW8PHmwtUP-puHH=n7EB7xgHsy_uur4Dw@mail.gmail.com">
      <pre class="moz-quote-pre" wrap="">On Tue, Oct 4, 2022 at 11:05 PM Si-Wei Liu <a class="moz-txt-link-rfc2396E" href="mailto:si-wei.liu@oracle.com">&lt;si-wei.liu@oracle.com&gt;</a> wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
The citing commit has incorrect code in vhost_vdpa_receive() that returns
zero instead of full packet size to the caller. This renders pending packets
unable to be freed so then get clogged in the tx queue forever. When device
is being reset later on, below assertion failure ensues:

0  0x00007f86d53bb387 in raise () from /lib64/libc.so.6
1  0x00007f86d53bca78 in abort () from /lib64/libc.so.6
2  0x00007f86d53b41a6 in __assert_fail_base () from /lib64/libc.so.6
3  0x00007f86d53b4252 in __assert_fail () from /lib64/libc.so.6
4  0x000055b8f6ff6fcc in virtio_net_reset (vdev=&lt;optimized out&gt;) at /usr/src/debug/qemu/hw/net/virtio-net.c:563
5  0x000055b8f7012fcf in virtio_reset (opaque=0x55b8faf881f0) at /usr/src/debug/qemu/hw/virtio/virtio.c:1993
6  0x000055b8f71f0086 in virtio_bus_reset (bus=bus@entry=0x55b8faf88178) at /usr/src/debug/qemu/hw/virtio/virtio-bus.c:102
7  0x000055b8f71f1620 in virtio_pci_reset (qdev=&lt;optimized out&gt;) at /usr/src/debug/qemu/hw/virtio/virtio-pci.c:1845
8  0x000055b8f6fafc6c in memory_region_write_accessor (mr=&lt;optimized out&gt;, addr=&lt;optimized out&gt;, value=&lt;optimized out&gt;,
   size=&lt;optimized out&gt;, shift=&lt;optimized out&gt;, mask=&lt;optimized out&gt;, attrs=...) at /usr/src/debug/qemu/memory.c:483
9  0x000055b8f6fadce9 in access_with_adjusted_size (addr=addr@entry=20, value=value@entry=0x7f867e7fb7e8, size=size@entry=1,
   access_size_min=&lt;optimized out&gt;, access_size_max=&lt;optimized out&gt;, access_fn=0x55b8f6fafc20 &lt;memory_region_write_accessor&gt;,
   mr=0x55b8faf80a50, attrs=...) at /usr/src/debug/qemu/memory.c:544
10 0x000055b8f6fb1d0b in memory_region_dispatch_write (mr=mr@entry=0x55b8faf80a50, addr=addr@entry=20, data=0, op=&lt;optimized out&gt;,
   attrs=attrs@entry=...) at /usr/src/debug/qemu/memory.c:1470
11 0x000055b8f6f62ada in flatview_write_continue (fv=fv@entry=0x7f86ac04cd20, addr=addr@entry=549755813908, attrs=...,
   attrs@entry=..., buf=buf@entry=0x7f86d0223028 &lt;Address 0x7f86d0223028 out of bounds&gt;, len=len@entry=1, addr1=20, l=1,
   mr=0x55b8faf80a50) at /usr/src/debug/qemu/exec.c:3266
12 0x000055b8f6f62c8f in flatview_write (fv=0x7f86ac04cd20, addr=549755813908, attrs=...,
   buf=0x7f86d0223028 &lt;Address 0x7f86d0223028 out of bounds&gt;, len=1) at /usr/src/debug/qemu/exec.c:3306
13 0x000055b8f6f674cb in address_space_write (as=&lt;optimized out&gt;, addr=&lt;optimized out&gt;, attrs=..., buf=&lt;optimized out&gt;,
   len=&lt;optimized out&gt;) at /usr/src/debug/qemu/exec.c:3396
14 0x000055b8f6f67575 in address_space_rw (as=&lt;optimized out&gt;, addr=&lt;optimized out&gt;, attrs=..., attrs@entry=...,
   buf=buf@entry=0x7f86d0223028 &lt;Address 0x7f86d0223028 out of bounds&gt;, len=&lt;optimized out&gt;, is_write=&lt;optimized out&gt;)
   at /usr/src/debug/qemu/exec.c:3406
15 0x000055b8f6fc1cc8 in kvm_cpu_exec (cpu=cpu@entry=0x55b8f9aa0e10) at /usr/src/debug/qemu/accel/kvm/kvm-all.c:2410
16 0x000055b8f6fa5f5e in qemu_kvm_cpu_thread_fn (arg=0x55b8f9aa0e10) at /usr/src/debug/qemu/cpus.c:1318
17 0x000055b8f7336e16 in qemu_thread_start (args=0x55b8f9ac8480) at /usr/src/debug/qemu/util/qemu-thread-posix.c:519
18 0x00007f86d575aea5 in start_thread () from /lib64/libpthread.so.0
19 0x00007f86d5483b2d in clone () from /lib64/libc.so.6

Make vhost_vdpa_receive() return the size passed in as is, so that the
caller qemu_deliver_packet_iov() would eventually propagate it back to
virtio_net_flush_tx() to release pending packets from the async_tx queue.
Which corresponds to the drop path where qemu_sendv_packet_async() returns
non-zero in virtio_net_flush_tx().

</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Acked-by: Eugenio Pérez <a class="moz-txt-link-rfc2396E" href="mailto:eperezma@redhat.com">&lt;eperezma@redhat.com&gt;</a>


</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">Fixes: 846a1e85da64 (&quot;vdpa: Add dummy receive callback&quot;)
Cc: Eugenio Perez Martin <a class="moz-txt-link-rfc2396E" href="mailto:eperezma@redhat.com">&lt;eperezma@redhat.com&gt;</a>
Signed-off-by: Si-Wei Liu <a class="moz-txt-link-rfc2396E" href="mailto:si-wei.liu@oracle.com">&lt;si-wei.liu@oracle.com&gt;</a>
---
 net/vhost-vdpa.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
index 4bc3fd0..182b3a1 100644
--- a/net/vhost-vdpa.c
+++ b/net/vhost-vdpa.c
@@ -211,7 +211,7 @@ static bool vhost_vdpa_check_peer_type(NetClientState *nc, ObjectClass *oc,
 static ssize_t vhost_vdpa_receive(NetClientState *nc, const uint8_t *buf,
                                   size_t size)
 {
-    return 0;
+    return size;
 }

 static NetClientInfo net_vhost_vdpa_info = {
--
1.8.3.1

</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------mwB6RZiDlQy0J94S5aNCkmha--

