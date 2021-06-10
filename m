Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DEE713A3530
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 22:56:15 +0200 (CEST)
Received: from localhost ([::1]:58238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrRip-0001j0-0l
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 16:56:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35268)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <si-wei.liu@oracle.com>)
 id 1lrRhN-0000M9-13
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 16:54:46 -0400
Received: from aserp2120.oracle.com ([141.146.126.78]:51576)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <si-wei.liu@oracle.com>)
 id 1lrRhF-0008JD-AL
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 16:54:44 -0400
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 15AKAYbX089927;
 Thu, 10 Jun 2021 20:54:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=S98DuOUCGJjwVAmGRIw8Lawg9g/Um3m8+Gwmv1n748E=;
 b=PdH7iqBiQHRRaw4iT9vKH2YhMJqa5/Eq1lE30srmM4qlM9uUyeBhLRvIJn//guRHuGBW
 uWNNfA4OA0cZoAlzwcOEVLNH+e0HDdGsK6vTauC7WZgx9XJV4XbykxxATPLLw7yQ9P2T
 RgJYmdcIFx5X0vYBXgFK5e9EDtEc6OWi3SETyS5LZBk1K8vOHR41AHlJmonqjh0NBWn7
 6Ra4DsLx5pNIQr43p/xOvAHILP/YYqjJZA8VjrBia9T13GJi77eu1pXcnPpekqi3tt2x
 BpvqBVBylYHnNtHVOE12lmPkxtN7chfDRwXFyMMLPuaEv52OZbnIvwHlhdR8UCsiXHCE Yw== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by aserp2120.oracle.com with ESMTP id 39017nn2j3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 10 Jun 2021 20:54:34 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 15AKAiCm108847;
 Thu, 10 Jun 2021 20:54:34 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2168.outbound.protection.outlook.com [104.47.55.168])
 by aserp3020.oracle.com with ESMTP id 3922x0fvd1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 10 Jun 2021 20:54:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ir9O1kzykQwtAj8rk929qEtVGxcMNQm3HZgC87/6CATcOoAtqgY7+TmYvD/Themrl8RIbQ5e1inlIGqmNeEM2H/Dy3N+RoYhwsAxTe0dGTBOP1OthAZ8HhLPIlEksYHjeTozhiudrtvsPGvGITb5Y+HOel/SCXTB0Pn/fOdgHIOSQkoVb+yGAT5lVoEalwLMfFNHRmYdXAQB7YQzneAhv4o3+60cFkUJKawWqc1OTWxn2xH/5fTvYrXQt5ukLGBhbfRw1RF/wgYbwKzqJu94KPpot+7XK++tyi1PQ9VYLA1SCqcvig7g2CjE3hilGXmNlMur0W+OAtCz5DYk0PBgmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S98DuOUCGJjwVAmGRIw8Lawg9g/Um3m8+Gwmv1n748E=;
 b=SExfp6mcPctnGkfazuA6C6IeDrhJS9QuS86neRk78hUgzdAg/ejUz8+LesY7BU0ZxTqzaROVG4K0MTOK4c0ELpmFeJ7gLX8nYfnC0dFhXT+aGcPoHIrbbYzbJce/Ia0VPwhFQdzBf4MTMz7HhYzSyXIk1foFIM6Uk6nQFmzK35WTCdE4VVoDstSZtF9MaWPwBg1CSTg73L4IwR1VfKI203W13dLOYdtb+l4PKuzvQDa0i3Fc5wUF6HkqAIFJefjr3mJT+zZtUKuy9+gje6L7uKT1C6TqV/9R3nlFMTinyJdwcMVnaTWSqK6Ti0702Qj5K6FqzzzrptUe49hiaLfgxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S98DuOUCGJjwVAmGRIw8Lawg9g/Um3m8+Gwmv1n748E=;
 b=Ghswi7qzzdxgVoHXFPbScNLQ02ssZpvZFQazP/ByQ6MUd36asMlcP/GWgOIAdVyJNrkXYK48zvfubeI9rkb7YS1kZqUUSf+3b1f5tqXZKizcV4W/cLeSvtRp9wHUwY6pgCb+XMaM1Y+C/PLJoc+0wX+d67qM0S61UrW2jrSG9Hc=
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB3287.namprd10.prod.outlook.com (2603:10b6:a03:15c::11)
 by BYAPR10MB2837.namprd10.prod.outlook.com (2603:10b6:a03:81::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.21; Thu, 10 Jun
 2021 20:54:32 +0000
Received: from BYAPR10MB3287.namprd10.prod.outlook.com
 ([fe80::572:1b89:6a87:b18a]) by BYAPR10MB3287.namprd10.prod.outlook.com
 ([fe80::572:1b89:6a87:b18a%5]) with mapi id 15.20.4219.021; Thu, 10 Jun 2021
 20:54:32 +0000
Subject: Re: [PATCH V2 1/2] vhost-vdpa: skip ram device from the IOTLB mapping
To: Jason Wang <jasowang@redhat.com>, mst@redhat.com, qemu-devel@nongnu.org
References: <20210602084106.43186-1-jasowang@redhat.com>
 <20210602084106.43186-2-jasowang@redhat.com>
From: Si-Wei Liu <si-wei.liu@oracle.com>
Organization: Oracle Corporation
Message-ID: <2ebd6de6-c08a-44d9-6df4-e84c95e9b6fe@oracle.com>
Date: Thu, 10 Jun 2021 13:54:29 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
In-Reply-To: <20210602084106.43186-2-jasowang@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [73.231.200.235]
X-ClientProxiedBy: BYAPR08CA0059.namprd08.prod.outlook.com
 (2603:10b6:a03:117::36) To BYAPR10MB3287.namprd10.prod.outlook.com
 (2603:10b6:a03:15c::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.16] (73.231.200.235) by
 BYAPR08CA0059.namprd08.prod.outlook.com (2603:10b6:a03:117::36) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.21 via Frontend
 Transport; Thu, 10 Jun 2021 20:54:31 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 42f59027-b88c-49dc-cfeb-08d92c51f239
X-MS-TrafficTypeDiagnostic: BYAPR10MB2837:
X-Microsoft-Antispam-PRVS: <BYAPR10MB28374CEDC310F5AEF2FA16ECB1359@BYAPR10MB2837.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZLiXfjhhrAN6CwGEClRXciCAw/xqYOraZRo9oYcEkUxDyLphhjc/b7mElVyipnsZGTiXQ/gsl0K75irlzOlaZNAi2nKGtYfeAJuLCvtDGDtuUv8/mVHdhpRJrfWrJTd1FSY1UyWoPqhMCb4VpGEXDl/TDryZAPcHkLu6kFzU2n+1w1yX8U0iL+GkQPaYG17y1D+4Rq586I3qakEBsNoBnOee41QPkU2C1jj/GVvWVA5kgrf3KMcGqdHM+Aipor+9IE7mdnC/sG0vZHdFl4pHzRLSBbcPZv9wy48AOi6uQLp5QPd5928ZfkMz6eIqAOmF6RFdW2U257LfXujo88FR4/wGItVGt8BrQs8Ey4gkFykmI7Fl7LG4wHAmNSZbZO5puUbWb8IFMdZ9jbQ/KQ9A3+EzZngnYCxn5yUtlrjqd/UgvuvlndOnFTxRVBN7zu3Ww1L7jQEKBsxgjQW8Z/MdlIxtRp5X6FkcAqbx2IJ5vS21fyp/cN7meiuMCl/9xH7Lb9GfAqQJQZn/m97iEzfcaw8B5yquqaXfBEVUTJ9vj68uw9o4IqQ0Nzalgzz7TcEKAJosQ8XisQMMgLIr7P7RL1UQHVqo7Z9A8YcfV5i0oaaSu+rXveKyYbEWTVkmz+k1Ohr/NaQxRI7XosvBnpMrw8klgGIdWycY9bkq7BVj9C8u+A4QpDOimdmBdrLrisSU
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3287.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(396003)(376002)(346002)(366004)(39860400002)(136003)(36916002)(66946007)(83380400001)(36756003)(8936002)(16526019)(186003)(8676002)(26005)(38100700002)(16576012)(316002)(6486002)(66556008)(66476007)(5660300002)(956004)(53546011)(31686004)(478600001)(2906002)(4326008)(31696002)(2616005)(86362001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ckFTckd1a081V0N5bWd2ZDlSTHBXNzZRQWk0dWhGRi8waHA0TzFsMURSR0Rs?=
 =?utf-8?B?OWpRM0tQZkhic3lDNXF3bkx4MmVwMFNiQU9zZFk3QWJ4VjhJQkhENEVjMm9M?=
 =?utf-8?B?N2FBVDFsQkZtZ3VLbi8zeW1mdEwxNmJCMGNVTTJZalJWLzRRYzE1K2hnUUtZ?=
 =?utf-8?B?UUxzS1loTTRydjhsRHQ4TmpDUENhb1F1c2dFelNCNTIzN0lIZEtrakNQam5U?=
 =?utf-8?B?d3libngxL29lU0NySFIxaWNxUHhUd0Y4R1JSKzJFcXB5Vithb1RyMUlqTXhp?=
 =?utf-8?B?UnRWQ2tkRkF6SjVsNzM0ckFhWU1kTU9xTmdLakdva2xWRjB0eVhOMWs5aUVs?=
 =?utf-8?B?QUpURmVDeEl1MjhBL3ZMUGtqYUJWeHVrL0tNdTBYS1NNaW9xdDNiYVhubTlk?=
 =?utf-8?B?Tjk1Tk1FeG9oZTNRWk9LbnJVWG1POGd1QXpjejBDVkw5emJQNXo2THdERmF3?=
 =?utf-8?B?LzRqUGZ6bHRMdHdNckY1SWdVRmNTQ1hBc2FlaklMSEdTT0lheENZdlJVT1lC?=
 =?utf-8?B?TWdQalpZQ3dzK1h6OC9zMkdjK3pJVG1COXBuSXZjaDZvb01CV1FsNlVqbUY3?=
 =?utf-8?B?dVRuVnBCNzN3azVkTHZ0cDVQNEpxOEs5MDMzQnduYVZmWnBVMHhGb3o3bDMv?=
 =?utf-8?B?WGlRQ0NTdE9DUENVb2NXR1NMNUF5TnBBUGxYWk9yZmFTQy9neEZGc1o2Sit5?=
 =?utf-8?B?WWdrNXNnTy9LOWZZMWtQeG5MZC8rNG9GZ1VJYit5SGRYYUo1SHBDOGxRYXFU?=
 =?utf-8?B?OXB1b1BqZjg1OCs4UzU1R3RpeGhUa1ZMSTNaU0tKNXpYY2NkTGlERkZ1Wmgr?=
 =?utf-8?B?R1MrM2JIbFNENGhGaHdSNmd4SWJtajFNb2hEOGV6aGdtUlUySHVkSDJFK3BQ?=
 =?utf-8?B?R1RsV3NsYmRIeWJUeGpXL0pCSTlVTEdVZjVES2dWMGo0T09pRXZTakRGMjNi?=
 =?utf-8?B?c2w3Z09vVzdiTURBVHlKOGhqVnlNS3Rna1B0Z1RwV1c4ZWRlaXdJNXplZFJm?=
 =?utf-8?B?SUxGY01zMytpQ2JSNGNHQ1JYQkROcExWK1M2YkgyZFQ5TEdKb0hGdyttM3c5?=
 =?utf-8?B?OHVac0I4UjN4c2NlRHUvN1BxY0NDWC9Oby9Mc3U1WFJ3UDQwdHhRaWRMVnBY?=
 =?utf-8?B?dGJBWWUyeU54dzhaOXkzRWZkTUxrUDU5ekhJWVRmVzhaUnpXYloyZkw3U3A0?=
 =?utf-8?B?ZkViVk9QbUtPVGlTR0x6QlNpSUZVbGF5ZGdpZE9hV0hEeG1FQW1LOVdUajRJ?=
 =?utf-8?B?T0tIYjdzdDArVk16THBvNXVhY0VMYlRsYldjbXQ0UGtyYk5xaWxsOWU5MVQr?=
 =?utf-8?B?SXdFT3JDVDFLWStwcDBjMUNZdkhabWVlbXVrazJnTC85Z3I0L1JlYTRBb1JD?=
 =?utf-8?B?R2pZNGxzUVhuNGU5Yk9WU2JidWdidGZVTDBGczlqRUJ6bDdPUlREdmk1UnZJ?=
 =?utf-8?B?VWVhcE5qTmlLWDZCQkd5Qy9Ba3Fyb3k1YkQrMUxldGFabTdZSm1abC85QnQ4?=
 =?utf-8?B?akFldHYvWjZ5UjlneFRYeC85QXowaGd5cDlSWmlVTDdESmllVjhKaFpRVjBk?=
 =?utf-8?B?NmJ2RTZ3SC9MYyt4dUJRM3lKNkRkVS9ad1YyTDd2cE5NWnhsWjc4ZFFaR0l6?=
 =?utf-8?B?bEE5TW55UmpSdWtZMjlZR1V0R24vQ2pVZTlqZHQ3WWNheWJpWEtzekpYbGZJ?=
 =?utf-8?B?T0djOXdFbS81Tk9CSUxpSGdWMldMRWdIb2poUmNYeUxZRVRVVlNUWkljQ3JO?=
 =?utf-8?Q?vNQrc7HBWzN5CybzLt4npJIt64t/bgw4HXnWYRm?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 42f59027-b88c-49dc-cfeb-08d92c51f239
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2021 20:54:32.1221 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kspw4YVP7fNdtsoeTobpeCX4TBfn0nE/LLIyJKTiKUuUzmLmSfzTWWlYNSPBZmlZLc4pgZWVtjLbRjGNxxVFJg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR10MB2837
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10011
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 suspectscore=0
 malwarescore=0 mlxscore=0 spamscore=0 phishscore=0 bulkscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106100130
X-Proofpoint-GUID: nUrKsNsl0vXJkl2GASqxrwOJbbJZSSB5
X-Proofpoint-ORIG-GUID: nUrKsNsl0vXJkl2GASqxrwOJbbJZSSB5
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10011
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 bulkscore=0 spamscore=0
 mlxlogscore=999 phishscore=0 impostorscore=0 suspectscore=0 clxscore=1015
 mlxscore=0 malwarescore=0 priorityscore=1501 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2106100130
Received-SPF: pass client-ip=141.146.126.78;
 envelope-from=si-wei.liu@oracle.com; helo=aserp2120.oracle.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: elic@nvidia.com, lingshan.zhu@intel.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 6/2/2021 1:41 AM, Jason Wang wrote:
> vDPA is not tie to any specific hardware, for safety and simplicity,
> vhost-vDPA doesn't allow MMIO area to be mapped via IOTLB. Only the
> doorbell could be mapped via mmap(). So this patch exclude skip the
> ram device from the IOTLB mapping.
>
> Signed-off-by: Jason Wang <jasowang@redhat.com>
Reviewed-by: Si-Wei Liu <si-wei.liu@oracle.com>
> ---
>   hw/virtio/vhost-vdpa.c | 12 ++----------
>   1 file changed, 2 insertions(+), 10 deletions(-)
>
> diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> index 01d2101d09..dd4321bac2 100644
> --- a/hw/virtio/vhost-vdpa.c
> +++ b/hw/virtio/vhost-vdpa.c
> @@ -27,6 +27,8 @@ static bool vhost_vdpa_listener_skipped_section(MemoryRegionSection *section)
>   {
>       return (!memory_region_is_ram(section->mr) &&
>               !memory_region_is_iommu(section->mr)) ||
> +           /* vhost-vDPA doesn't allow MMIO to be mapped  */
> +            memory_region_is_ram_device(section->mr) ||
>              /*
>               * Sizing an enabled 64-bit BAR can cause spurious mappings to
>               * addresses in the upper part of the 64-bit address space.  These
> @@ -171,22 +173,12 @@ static void vhost_vdpa_listener_region_add(MemoryListener *listener,
>                                vaddr, section->readonly);
>       if (ret) {
>           error_report("vhost vdpa map fail!");
> -        if (memory_region_is_ram_device(section->mr)) {
> -            /* Allow unexpected mappings not to be fatal for RAM devices */
> -            error_report("map ram fail!");
> -          return ;
> -        }
>           goto fail;
>       }
>   
>       return;
>   
>   fail:
> -    if (memory_region_is_ram_device(section->mr)) {
> -        error_report("failed to vdpa_dma_map. pci p2p may not work");
> -        return;
> -
> -    }
>       /*
>        * On the initfn path, store the first error in the container so we
>        * can gracefully fail.  Runtime, there's not much we can do other


