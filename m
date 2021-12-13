Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FD7D473657
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Dec 2021 22:05:00 +0100 (CET)
Received: from localhost ([::1]:51330 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mwsVH-0007Wf-6p
	for lists+qemu-devel@lfdr.de; Mon, 13 Dec 2021 16:04:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38116)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1mwsTh-0006ks-EE
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 16:03:21 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:45620)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1mwsTY-00066l-PK
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 16:03:18 -0500
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BDIj8lX017905; 
 Mon, 13 Dec 2021 21:03:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=Jd185SU3AEF3TnaXRW2blWlmbIwvFD7ir8EUjdJmK8Q=;
 b=NnwoZnjocW5KqnAwcqMyMoaNbzgY7Nd/+c9Y/75tuBSQfpNr2TyfmHgioofORJQmGwid
 qOCjKo7NzsaP6NaCiuftTS4ZBw4fzcpfijgZ4H3u/mqmEtlK6NVLwxAJllzK7tooNxnJ
 8kk52KRU5it3UFgdwkIxHAm0SYH92zxqs6R7dNnGh0tnPAOFZpVhTvpLuRpzTLV0Q12A
 OtI0X9fUmQWxfs+x3AqlV1RUp3R0F4Bo6G11FieOzu0bkNi68rRk3x/hFEBdpjgYyEQ1
 XUYKtshuenjLqD/as7Zs81OCIbiPd2EqZSPMpQtSci7JQvbbpPobcEsFj7XCUdYe03bc pw== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 3cx5ak9nex-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 13 Dec 2021 21:03:06 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1BDKv2l1149216;
 Mon, 13 Dec 2021 21:03:05 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2176.outbound.protection.outlook.com [104.47.55.176])
 by userp3020.oracle.com with ESMTP id 3cvnenqhp4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 13 Dec 2021 21:03:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DUjVkmwUvDNyTfRioqUdqUiHqc7wMd1ZvsXV3lay9yPuY5/bgErvIAM+9za1MzDa/7z5XWV38tZ4a89KjF3C7C4APRc74GhMUsN3UDVCCe+llnifLpj11oHuLPozIxIRpO51daR2FFkSt3EEvUwI0cnjSHEKO2JseZ5IXW1Nl1nSw+UAxuy15TL1kSqfNumBTKZe4VNM28W+oWR5S9SeLA3Kv3upMhQXq6IWz5yeFz+usCqi3oi+reUFmKjzATmNa9zdzGC82+FDyIIzIB8rIiqufGdbI9pBOi31eWaZlTfv793XvmPqdrIZMgjF4mPGvmExK8v3ckeZqwGaohvHcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jd185SU3AEF3TnaXRW2blWlmbIwvFD7ir8EUjdJmK8Q=;
 b=i9vUjsl3PSzuPm1X6cFp7sz49vArKyEWOd2qke2qq4btO1CrxrCz+cXAhhWpoRgi9ffiYpfrUQQ0oBIiQbWiPsBSqPkwAcMCuH6gUaOg2nZd74Qv0dBS0tw1NoveMQB/A3euTCKa0dekoP88IvWup3Fj7y5F3D8dialVJcgpeny8kOVqBTBcdQK+HJzTgyTD3aHLNoFG5JThjgrQ95v0PHRhUsv8lpk4+h2mW8HoylXuk6zs40bTqTOx1GbGVibcGWBJENyoR3VTGz/eDi34V1aUhtt+8ZxQHJKxzCXdZTXc0wYunKsH4TC+lv51U/Q61m4G8cKX6IqFkCnWbpO1Mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jd185SU3AEF3TnaXRW2blWlmbIwvFD7ir8EUjdJmK8Q=;
 b=k29pbCS3tRfUI4gklNvGlGqTXpPdEZSihJGpZDdBvBjmqK9mD2S0V52SYaaLswSYlfkHmmBma7871aZiMndcqo1e7BroK35SVCSsmLT9iJEGzJQEfCA7m/QXXOHgNJAtOrcna8virmq7h94DuQIW0YStjCYBjColzOJXA48V/JQ=
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by MWHPR1001MB2175.namprd10.prod.outlook.com (2603:10b6:301:2d::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.17; Mon, 13 Dec
 2021 21:03:02 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::143c:ea64:7017:19f]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::143c:ea64:7017:19f%4]) with mapi id 15.20.4778.018; Mon, 13 Dec 2021
 21:03:02 +0000
Message-ID: <dc729131-816d-e547-8551-86bb9cc2c67a@oracle.com>
Date: Mon, 13 Dec 2021 15:02:57 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v9 05/10] ACPI ERST: support for ACPI ERST feature
Content-Language: en-US
To: Ani Sinha <ani@anisinha.ca>
References: <1638472142-14396-1-git-send-email-eric.devolder@oracle.com>
 <1638472142-14396-6-git-send-email-eric.devolder@oracle.com>
 <CAARzgwzPQ-B-BfP4zejd2a9O_CsgfJj-RyVx0V3-v2HphOKDTQ@mail.gmail.com>
 <7a998743-1991-487b-15ff-17ee8fe51349@oracle.com>
 <CAARzgwzGVyAoUu2hwQZnDqimSvudkwXS8DE2VDYGbWyKtcUMCQ@mail.gmail.com>
From: Eric DeVolder <eric.devolder@oracle.com>
In-Reply-To: <CAARzgwzGVyAoUu2hwQZnDqimSvudkwXS8DE2VDYGbWyKtcUMCQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN7P220CA0004.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:806:123::9) To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e7f2e55e-da6a-4b20-4993-08d9be7bf2fb
X-MS-TrafficTypeDiagnostic: MWHPR1001MB2175:EE_
X-Microsoft-Antispam-PRVS: <MWHPR1001MB2175836C3C4C473A420C6D7897749@MWHPR1001MB2175.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tJbLI3OjxxldqURCwpuc+GoHMmbWlhFnh7Do8ZWCrJlGgUNhlU7WZ6Il7vX6Ohm2e3rLMdR9WbrU4rMe6cUTM98/lvn33cg89+U96CCas6qnjj3KIWfN7tP+VFYdA2z5J8dHzqQmNqCbTof1Y5tRDygqMpe0Jk7IYBD1+8R38D/WiJTsLzF/ZryAUo24yfI7g2PFkb9uArV9PY7iTCzgaSTvM1mQGB9vwY7SbeVkOGFsgQzweJx/eO7CAy3irwgi7FAmMszT+heg4A8GelZK7XtyI7SyHWQoliGd2FqNFbct93DSIOGS4p0ngl8lCLmoIB3JTMRYJfpbJKIl3vqEbJAxdCXE6yOf/XR1z6q7hGVoqnYk4vRUBfeScAAKZdEF3IGv+D39nqecKnkMnPB3Vh7It910/1/5K85j9xHE6yzjfH/L5BMQk7ydN/TvBz6VuVds63dsdOr+9L/WyOvORJ/eVT3RCf0Nfn2vs73swPcs9ne6ISNIbcdPb6w9fHJHrXX/PMvhmU8GZrYvYHQWm7iR1S30HM1to2gNnrr0/UTkXFSVbkbo/khlx+WELJtxDa+ZdEjng3viXJPlv5MnycUCes0MUz7NaLMFc2c+HHRZhECUOxruEr7mPjuGt5a2S7YULh9O9/FkjmBMGmcEbV38Me/cvTQkaUCiHF51s8yXj0JD/SAEEc9QPENv4e7Y9kNAYnPukgXUtC+rI3Uhi/AHUE+axKCpu5lGL4uIEBg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR10MB4531.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(6506007)(53546011)(31686004)(38100700002)(2616005)(186003)(316002)(8936002)(6486002)(30864003)(83380400001)(107886003)(8676002)(6916009)(6512007)(508600001)(5660300002)(4326008)(86362001)(66556008)(66476007)(36756003)(66946007)(6666004)(2906002)(31696002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NU11eEoxZjY3RU41YjZDRDNUcEc1MFQySHRNbkFCakloYS9iN1cyTGhXZDZo?=
 =?utf-8?B?dFkvRHNpMUVZZGp6NnF3bVhkYzFsTWlteTBvbW01UWhpc0dVVTBjRkxkbVVS?=
 =?utf-8?B?YXdnVVdtZTBvZ0xMYXA4bEJ0Z3N5SmJTME5HYSt4RzZUV2kycUU2SEc0d1Rm?=
 =?utf-8?B?TjhTQ25QaDM4eHl0NGlFektnY2NES1ptUFQra1R6a0pDc3FoR2ZvQWhpSUlH?=
 =?utf-8?B?K1JtWk5XRExiNk5heTlidllpQjgvTkVrUGR6ZnhqT0cvWmhOei8xVXYreFBN?=
 =?utf-8?B?ZVFHaXQrSWRpdFdvM3hXMjlDTTN1OHQ0eEoxdDdFbHdRU01nZ3ArZmlseVJa?=
 =?utf-8?B?eEJ4MFhRcU9FZjk5K0ZSM1RNV0gvYzZwTVJrckxpVFMxVWRxa28ra1c4c1I1?=
 =?utf-8?B?VkxsOHh6OEt4MEdrMmpJeFV5aEZNcFJERUlCTjR3WUtJSXk3ei9KYVU5cHhV?=
 =?utf-8?B?QWpHQ3g1cHZqbTE1dWVKNzg1SjV1TTAwUGFwdERwem5TUkZGUHNDallPZmpJ?=
 =?utf-8?B?dzBYMnRJL1YvUHJhQkJPcnRKem5mZE43UlpVSTlTZnBRNmdja1VwNmhvL3lh?=
 =?utf-8?B?OGxtS3c5V1Q3Z1VKeE1SdjRjNmhSOUdHK0NQcWxaN252ZVYyTE5CMXJyOWlG?=
 =?utf-8?B?K1N6SWJBTXNUOXdVTTBZZjJ6Ly9Na1RibG02WDlIYUNaQ2pwQnF4NTdtbThJ?=
 =?utf-8?B?RUVBbUEzYm5tU3plWFcyN0YwcEs4aytSazMzR1Z3R0ZURTZvOHdvRVdhQy8v?=
 =?utf-8?B?M2NMejlxaUpXYURCRkxyblc1RUROZk9kWEp5ZGxHQzZCaGZwbGFFZmpWdDQ2?=
 =?utf-8?B?MW1WMVRaWFVhRTZjNUFTY29Yd1pjcHV2clcvOFo2Y090amJRME9Wc1E2WXIw?=
 =?utf-8?B?Rmt6eGZjUFNUL3dEbTd5SmN3ZysvT0ZjdDNRaHc3SXRzV3g0N2hheUFJTlB6?=
 =?utf-8?B?ZlhFbXZ5RG1CZWN1a0wwejJva05YR1VFK3BMSStrYUZMLzlaOVFncTNkVzZr?=
 =?utf-8?B?T3dnMTllRmFnVW5FUHBybU42bnlNNUl4dkVIcWRZMWVMenNZSlNJMHZxS0ho?=
 =?utf-8?B?eHNScFNmZFlabFprVDdzYzZ3SGlMNzBBMVMwMFVmU2ZWN3RwM0hYdk1HU3hj?=
 =?utf-8?B?T0VGUXNUVW1Qb3RrcEtwYlFuZmUza1RsbXFvcHZrbnVibkRXUXQwRG96MnJ3?=
 =?utf-8?B?S05iRkxYRGR4Qi9JbWJtdGxMZU1DZzNsT1draEk4cVNMT1hMdXErQ0hlbDNR?=
 =?utf-8?B?c2NNSEh1ZFh4cE9WOUV1N3FNVVoxVEQzc1hraGxKeFp3VU5aTjRXdi80UHJy?=
 =?utf-8?B?L1hJY2dUZnE2MW1yeklSamFPOGhZWVg2N3JlM0lCUWxSWnpKcEJOekwza3Ra?=
 =?utf-8?B?SkF2YUpvN3MwMHFFdFJRVjY4TjZZelBJOGxpT2NNNmZNcWdJL2hIQUgyOCtt?=
 =?utf-8?B?TjU0aG13TmhtY3AvZWZLd2dmSU9obWQ3L2J1WXJrejFYS29sYmtDZ0dDTHl3?=
 =?utf-8?B?SSs1Wllpbi9VcEk0dEhKbFJvcE9RaDY1RFpjUTN2NWNBbEZpazFuaE1GRmxt?=
 =?utf-8?B?S2FOSnhOMjlYR3ZldzNnZ3Zwc2VQMGl3aGMvbEtOakFkbmp0NTMvc2NkRTFk?=
 =?utf-8?B?REw1WVR3dGpyS0JRRFJtYnhhMjg1cDFtRkZVUGVnbVVyaW16cFBMeHlacXV0?=
 =?utf-8?B?ZzJWWnV3cHY1UVFzN0ZReGdFQ2xCUFBlM0YwUzFKZGREZmR4UGJtblNyQnlI?=
 =?utf-8?B?OHhZNW5RZGFnV3VZWHB0bkxDNkFRQkNZWE1FZkFUcFFwaGpXbEpocVExZTc0?=
 =?utf-8?B?WVV3SnpCeDlVOHdKMERscDNhTWNqbm9JU3pqZDhzQzd5Uk80LzJNZDdEN3ln?=
 =?utf-8?B?N1FXQlp5bkwxSWpJYjY0RGlRSHFMamxMVWNpMzYwdUJuWUlHSHRESmdtY2NJ?=
 =?utf-8?B?VjlLUkpFV0hNeWpWUGFyY3VMM1RDVHBRNHhxUk52RFNDQS8zbGUvZGM0TUE1?=
 =?utf-8?B?Uzh5WGU1ZWNlREZzdGVZNzFqMm5hTTNkeFR2SWhpbW5pWkw0dFoyTDh6aWlD?=
 =?utf-8?B?aVBmVHhMeEZGSHdYendpanBmaVVTeHFkeGU5bnBFM3JLWW43aWE5NmJ2WlR5?=
 =?utf-8?B?aGhDcVV4K0RoU1ZSMFp2ejUveXlXcnEwN08rZ2UrbDYyQW1pQ2hkVDlLTXVk?=
 =?utf-8?B?b1YvQUJIWHNEN00yUTNBT2lLQUdYcWUrWnF2WlRSaXBsTzRRSVh5MHNyK1ls?=
 =?utf-8?B?Z2xtZUpreWY1ZVprU0hWWHlWTi9ETHA2VEE1V1E3R3lwYUJmcGRINExlTVpu?=
 =?utf-8?Q?Ya4XKcnoWYqF2bGozh?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e7f2e55e-da6a-4b20-4993-08d9be7bf2fb
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2021 21:03:01.8788 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tQd4NAJy99wk4OCVU2JdOQeTRe73hruf7x5cxk3AvY918rTKYsbwx+gbfaSZpKY0mwLfsWOeOrRtO7YbyUkyWigqIjNLfT5kmlm44SN49h4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1001MB2175
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10197
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 adultscore=0
 malwarescore=0 bulkscore=0 spamscore=0 mlxlogscore=999 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112130124
X-Proofpoint-GUID: lYJPEyrWE5ui6PXL7hPlcLD0F4oC4vur
X-Proofpoint-ORIG-GUID: lYJPEyrWE5ui6PXL7hPlcLD0F4oC4vur
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=eric.devolder@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-4.093,
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
Cc: berrange@redhat.com, ehabkost@redhat.com, mst@redhat.com,
 konrad.wilk@oracle.com, qemu-devel@nongnu.org, pbonzini@redhat.com,
 imammedo@redhat.com, boris.ostrovsky@oracle.com, rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Ani, an inline response below.
Thanks!
eric

On 12/10/21 08:09, Ani Sinha wrote:
> On Thu, Dec 9, 2021 at 11:24 PM Eric DeVolder <eric.devolder@oracle.com> wrote:
>>
>> Ani, inline responses below. eric
>>
>> On 12/9/21 00:29, Ani Sinha wrote:
>>> On Fri, Dec 3, 2021 at 12:39 AM Eric DeVolder <eric.devolder@oracle.com> wrote:
>>>>
>>>> This implements a PCI device for ACPI ERST. This implements the
>>>> non-NVRAM "mode" of operation for ERST as it is supported by
>>>> Linux and Windows.
>>>
>>> Few more comments on this patch ...
>>>
>>>>
>>>> Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>
>>>> ---
>>>>    hw/acpi/Kconfig      |   6 +
>>>>    hw/acpi/erst.c       | 836 +++++++++++++++++++++++++++++++++++++++++++++++++++
>>>>    hw/acpi/meson.build  |   1 +
>>>>    hw/acpi/trace-events |  15 +
>>>>    4 files changed, 858 insertions(+)
>>>>    create mode 100644 hw/acpi/erst.c
>>>>
>>>> diff --git a/hw/acpi/Kconfig b/hw/acpi/Kconfig
>>>> index 622b0b5..19caebd 100644
>>>> --- a/hw/acpi/Kconfig
>>>> +++ b/hw/acpi/Kconfig
>>>> @@ -10,6 +10,7 @@ config ACPI_X86
>>>>        select ACPI_HMAT
>>>>        select ACPI_PIIX4
>>>>        select ACPI_PCIHP
>>>> +    select ACPI_ERST
>>>>
>>>>    config ACPI_X86_ICH
>>>>        bool
>>>> @@ -60,3 +61,8 @@ config ACPI_HW_REDUCED
>>>>        select ACPI
>>>>        select ACPI_MEMORY_HOTPLUG
>>>>        select ACPI_NVDIMM
>>>> +
>>>> +config ACPI_ERST
>>>> +    bool
>>>> +    default y
>>>> +    depends on ACPI && PCI
>>>> diff --git a/hw/acpi/erst.c b/hw/acpi/erst.c
>>>> new file mode 100644
>>>> index 0000000..4304f55
>>>> --- /dev/null
>>>> +++ b/hw/acpi/erst.c
>>>> @@ -0,0 +1,836 @@
>>>> +/*
>>>> + * ACPI Error Record Serialization Table, ERST, Implementation
>>>> + *
>>>> + * ACPI ERST introduced in ACPI 4.0, June 16, 2009.
>>>> + * ACPI Platform Error Interfaces : Error Serialization
>>>> + *
>>>> + * Copyright (c) 2021 Oracle and/or its affiliates.
>>>> + *
>>>> + * SPDX-License-Identifier: GPL-2.0-or-later
>>>> + */
>>>> +
>>>> +#include <sys/types.h>
>>>> +#include <sys/stat.h>
>>>> +#include <unistd.h>
>>>> +
>>>> +#include "qemu/osdep.h"
>>>> +#include "qapi/error.h"
>>>> +#include "hw/qdev-core.h"
>>>> +#include "exec/memory.h"
>>>> +#include "qom/object.h"
>>>> +#include "hw/pci/pci.h"
>>>> +#include "qom/object_interfaces.h"
>>>> +#include "qemu/error-report.h"
>>>> +#include "migration/vmstate.h"
>>>> +#include "hw/qdev-properties.h"
>>>> +#include "hw/acpi/acpi.h"
>>>> +#include "hw/acpi/acpi-defs.h"
>>>> +#include "hw/acpi/aml-build.h"
>>>> +#include "hw/acpi/bios-linker-loader.h"
>>>> +#include "exec/address-spaces.h"
>>>> +#include "sysemu/hostmem.h"
>>>> +#include "hw/acpi/erst.h"
>>>> +#include "trace.h"
>>>> +
>>>> +/* ACPI 4.0: Table 17-16 Serialization Actions */
>>>> +#define ACTION_BEGIN_WRITE_OPERATION         0x0
>>>> +#define ACTION_BEGIN_READ_OPERATION          0x1
>>>> +#define ACTION_BEGIN_CLEAR_OPERATION         0x2
>>>> +#define ACTION_END_OPERATION                 0x3
>>>> +#define ACTION_SET_RECORD_OFFSET             0x4
>>>> +#define ACTION_EXECUTE_OPERATION             0x5
>>>> +#define ACTION_CHECK_BUSY_STATUS             0x6
>>>> +#define ACTION_GET_COMMAND_STATUS            0x7
>>>> +#define ACTION_GET_RECORD_IDENTIFIER         0x8
>>>> +#define ACTION_SET_RECORD_IDENTIFIER         0x9
>>>> +#define ACTION_GET_RECORD_COUNT              0xA
>>>> +#define ACTION_BEGIN_DUMMY_WRITE_OPERATION   0xB
>>>> +#define ACTION_RESERVED                      0xC
>>>> +#define ACTION_GET_ERROR_LOG_ADDRESS_RANGE   0xD
>>>> +#define ACTION_GET_ERROR_LOG_ADDRESS_LENGTH  0xE
>>>> +#define ACTION_GET_ERROR_LOG_ADDRESS_RANGE_ATTRIBUTES 0xF
>>>> +#define ACTION_GET_EXECUTE_OPERATION_TIMINGS 0x10
>>>> +
>>>> +/* ACPI 4.0: Table 17-17 Command Status Definitions */
>>>> +#define STATUS_SUCCESS                0x00
>>>> +#define STATUS_NOT_ENOUGH_SPACE       0x01
>>>> +#define STATUS_HARDWARE_NOT_AVAILABLE 0x02
>>>> +#define STATUS_FAILED                 0x03
>>>> +#define STATUS_RECORD_STORE_EMPTY     0x04
>>>> +#define STATUS_RECORD_NOT_FOUND       0x05
>>>> +
>>>> +
>>>> +/* UEFI 2.1: Appendix N Common Platform Error Record */
>>>> +#define UEFI_CPER_RECORD_MIN_SIZE 128U
>>>> +#define UEFI_CPER_RECORD_LENGTH_OFFSET 20U
>>>> +#define UEFI_CPER_RECORD_ID_OFFSET 96U
>>>> +#define IS_UEFI_CPER_RECORD(ptr) \
>>>> +    (((ptr)[0] == 'C') && \
>>>> +     ((ptr)[1] == 'P') && \
>>>> +     ((ptr)[2] == 'E') && \
>>>> +     ((ptr)[3] == 'R'))
>>>> +
>>>> +/*
>>>> + * NOTE that when accessing CPER fields within a record, memcpy()
>>>> + * is utilized to avoid a possible misaligned access on the host.
>>>> + */
>>>> +
>>>> +/*
>>>> + * This implementation is an ACTION (cmd) and VALUE (data)
>>>> + * interface consisting of just two 64-bit registers.
>>>> + */
>>>> +#define ERST_REG_SIZE (16UL)
>>>> +#define ERST_ACTION_OFFSET (0UL) /* action (cmd) */
>>>> +#define ERST_VALUE_OFFSET  (8UL) /* argument/value (data) */
>>>> +
>>>> +/*
>>>> + * ERST_RECORD_SIZE is the buffer size for exchanging ERST
>>>> + * record contents. Thus, it defines the maximum record size.
>>>> + * As this is mapped through a PCI BAR, it must be a power of
>>>> + * two and larger than UEFI_CPER_RECORD_MIN_SIZE.
>>>> + * The backing storage is divided into fixed size "slots",
>>>> + * each ERST_RECORD_SIZE in length, and each "slot"
>>>> + * storing a single record. No attempt at optimizing storage
>>>> + * through compression, compaction, etc is attempted.
>>>> + * NOTE that slot 0 is reserved for the backing storage header.
>>>> + * Depending upon the size of the backing storage, additional
>>>> + * slots will be part of the slot 0 header in order to account
>>>> + * for a record_id for each available remaining slot.
>>>> + */
>>>> +/* 8KiB records, not too small, not too big */
>>>> +#define ERST_RECORD_SIZE (8192UL)
>>>> +
>>>> +#define ACPI_ERST_MEMDEV_PROP "memdev"
>>>> +#define ACPI_ERST_RECORD_SIZE_PROP "record_size"
>>>> +
>>>> +/*
>>>> + * From the ACPI ERST spec sections:
>>>> + * A record id of all 0s is used to indicate 'unspecified' record id.
>>>> + * A record id of all 1s is used to indicate empty or end.
>>>> + */
>>>> +#define ERST_UNSPECIFIED_RECORD_ID (0UL)
>>>> +#define ERST_EMPTY_END_RECORD_ID (~0UL)
>>>> +#define ERST_EXECUTE_OPERATION_MAGIC 0x9CUL
>>>> +#define ERST_IS_VALID_RECORD_ID(rid) \
>>>> +    ((rid != ERST_UNSPECIFIED_RECORD_ID) && \
>>>> +     (rid != ERST_EMPTY_END_RECORD_ID))
>>>> +#define ERST_STORE_MAGIC 0x524F545354535245UL /* ERSTSTOR */
>>>> +
>>>
>>> you might want to add a comment something like
>>> /* please see erst.rst documentation for the details on this header structure */
>> done!
>>
>>>
>>>> +typedef struct {
>>>> +    uint64_t magic;
>>>> +    uint32_t record_size;
>>>> +    uint32_t storage_offset; /* offset to record storage beyond header */
>>>> +    uint16_t version;
>>>> +    uint16_t reserved;
>>>> +    uint32_t record_count;
>>>> +    uint64_t map[]; /* contains record_ids, and position indicates index */
>>>> +} __attribute__((packed)) ERSTStorageHeader;
>>>> +
>>>> +/*
>>>> + * Object cast macro
>>>> + */
>>>> +#define ACPIERST(obj) \
>>>> +    OBJECT_CHECK(ERSTDeviceState, (obj), TYPE_ACPI_ERST)
>>>> +
>>>> +/*
>>>> + * Main ERST device state structure
>>>> + */
>>>> +typedef struct {
>>>> +    PCIDevice parent_obj;
>>>> +
>>>> +    /* Backend storage */
>>>> +    HostMemoryBackend *hostmem;
>>>> +    MemoryRegion *hostmem_mr;
>>>> +    uint32_t storage_size;
>>>> +    uint32_t default_record_size;
>>>> +
>>>> +    /* Programming registers */
>>>> +    MemoryRegion iomem_mr;
>>>> +
>>>> +    /* Exchange buffer */
>>>> +    MemoryRegion exchange_mr;
>>>> +
>>>> +    /* Interface state */
>>>> +    uint8_t operation;
>>>> +    uint8_t busy_status;
>>>> +    uint8_t command_status;
>>>> +    uint32_t record_offset;
>>>> +    uint64_t reg_action;
>>>> +    uint64_t reg_value;
>>>> +    uint64_t record_identifier;
>>>> +    ERSTStorageHeader *header;
>>>> +    unsigned first_record_index;
>>>> +    unsigned last_record_index;
>>>> +    unsigned next_record_index;
>>>> +
>>>> +} ERSTDeviceState;
>>>> +
>>>> +/*******************************************************************/
>>>> +/*******************************************************************/
>>>> +
>>>> +static uint8_t *get_nvram_ptr_by_index(ERSTDeviceState *s, unsigned index)
>>>> +{
>>>> +    uint8_t *rc = NULL;
>>>> +    off_t offset = (index * le32_to_cpu(s->header->record_size));
>>>> +
>>>> +    g_assert(offset < s->storage_size);
>>>> +
>>>> +    rc = memory_region_get_ram_ptr(s->hostmem_mr);
>>>> +    rc += offset;
>>>> +
>>>> +    return rc;
>>>> +}
>>>> +
>>>> +static void make_erst_storage_header(ERSTDeviceState *s)
>>>> +{
>>>> +    ERSTStorageHeader *header = s->header;
>>>> +    unsigned mapsz, headersz;
>>>> +
>>>> +    header->magic = cpu_to_le64(ERST_STORE_MAGIC);
>>>> +    header->record_size = cpu_to_le32(s->default_record_size);
>>>> +    header->version = cpu_to_le16(0x0100);
>>>> +    header->reserved = cpu_to_le16(0x0000);
>>>> +
>>>> +    /* Compute mapsize */
>>>> +    mapsz = s->storage_size / s->default_record_size;
>>>> +    mapsz *= sizeof(uint64_t);
>>>> +    /* Compute header+map size */
>>>> +    headersz = sizeof(ERSTStorageHeader) + mapsz;
>>>> +    /* Round up to nearest integer multiple of ERST_RECORD_SIZE */
>>>> +    headersz = QEMU_ALIGN_UP(headersz, s->default_record_size);
>>>> +    header->storage_offset = cpu_to_le32(headersz);
>>>> +
>>>> +    /*
>>>> +     * The HostMemoryBackend initializes contents to zero,
>>>> +     * so all record_ids stashed in the map are zero'd.
>>>> +     * As well the record_count is zero. Properly initialized.
>>>> +     */
>>>> +}
>>>> +
>>>> +static void check_erst_backend_storage(ERSTDeviceState *s, Error **errp)
>>>> +{
>>>> +    ERSTStorageHeader *header;
>>>> +    uint32_t record_size;
>>>> +
>>>> +    header = memory_region_get_ram_ptr(s->hostmem_mr);
>>>> +    s->header = header;
>>>> +
>>>> +    /* Ensure pointer to header is 64-bit aligned */
>>>> +    g_assert(QEMU_PTR_IS_ALIGNED(header, sizeof(uint64_t)));
>>>> +
>>>> +    /*
>>>> +     * Check if header is uninitialized; HostMemoryBackend inits to 0
>>>> +     */
>>>> +    if (le64_to_cpu(header->magic) == 0UL) {
>>>> +        make_erst_storage_header(s);
>>>> +    }
>>>> +
>>>> +    /* Validity check record_size */
>>>> +    record_size = le32_to_cpu(header->record_size);
>>>> +    if (!(
>>>> +        (record_size) && /* non zero */
>>>> +        (record_size >= UEFI_CPER_RECORD_MIN_SIZE) &&
>>>> +        (((record_size - 1) & record_size) == 0) && /* is power of 2 */
>>>> +        (record_size >= 4096) /* PAGE_SIZE */
>>>> +        )) {
>>>> +        error_setg(errp, "ERST record_size %u is invalid", record_size);
>>>> +    }
>>>> +
>>>> +    /* Validity check header */
>>>> +    if (!(
>>>> +        (le64_to_cpu(header->magic) == ERST_STORE_MAGIC) &&
>>>> +        ((le32_to_cpu(header->storage_offset) % record_size) == 0) &&
>>>> +        (le16_to_cpu(header->version) == 0x0100) &&
>>>> +        (le16_to_cpu(header->reserved) == 0)
>>>> +        )) {
>>>> +        error_setg(errp, "ERST backend storage header is invalid");
>>>> +    }
>>>> +
>>>> +    /* Check storage_size against record_size */
>>>> +    if (((s->storage_size % record_size) != 0) ||
>>>> +         (record_size > s->storage_size)) {
>>>> +        error_setg(errp, "ACPI ERST requires storage size be multiple of "
>>>> +            "record size (%uKiB)", record_size);
>>>> +    }
>>>> +
>>>> +    /* Compute offset of first and last record storage slot */
>>>> +    s->first_record_index = le32_to_cpu(header->storage_offset)
>>>> +        / record_size;
>>>> +    s->last_record_index = (s->storage_size / record_size);
>>>> +}
>>>> +
>>>> +static void update_map_entry(ERSTDeviceState *s, unsigned index,
>>>> +    uint64_t record_id)
>>>> +{
>>>> +    if (index < s->last_record_index) {
>>>> +        s->header->map[index] = cpu_to_le64(record_id);
>>>> +    }
>>>> +}
>>>> +
>>>> +static unsigned allocate_erst_record(ERSTDeviceState *s)
>>>> +{
>>>> +    unsigned rc = 0; /* 0 not a valid index */
>>>> +    unsigned index = s->first_record_index;
>>>> +
>>>> +    for (; index < s->last_record_index; ++index) {
>>>> +        if (le64_to_cpu(s->header->map[index]) == ERST_UNSPECIFIED_RECORD_ID) {
>>>> +            rc = index;
>>>> +            break;
>>>> +        }
>>>> +    }
>>>> +
>>>> +    return rc;
>>>> +}
>>>> +
>>>> +static unsigned lookup_erst_record(ERSTDeviceState *s,
>>>> +    uint64_t record_identifier)
>>>> +{
>>>> +    unsigned rc = 0; /* 0 not a valid index */
>>>> +
>>>> +    /* Find the record_identifier in the map */
>>>> +    if (record_identifier != ERST_UNSPECIFIED_RECORD_ID) {
>>>> +        /*
>>>> +         * Count number of valid records encountered, and
>>>> +         * short-circuit the loop if identifier not found
>>>> +         */
>>>> +        uint32_t record_count = le32_to_cpu(s->header->record_count);
>>>> +        unsigned count = 0;
>>>> +        unsigned index;
>>>> +        for (index = s->first_record_index; index < s->last_record_index &&
>>>> +                count < record_count; ++index) {
>>>> +            if (le64_to_cpu(s->header->map[index]) == record_identifier) {
>>>> +                rc = index;
>>>> +                break;
>>>> +            }
>>>> +            if (le64_to_cpu(s->header->map[index]) !=
>>>> +                ERST_UNSPECIFIED_RECORD_ID) {
>>>> +                ++count;
>>>> +            }
>>>> +        }
>>>> +    }
>>>> +
>>>> +    return rc;
>>>> +}
>>>> +
>>>> +/*
>>>> + * ACPI 4.0: 17.4.1.1 Serialization Actions, also see
>>>> + * ACPI 4.0: 17.4.2.2 Operations - Reading 6.c and 2.c
>>>> + */
>>>> +static unsigned get_next_record_identifier(ERSTDeviceState *s,
>>>> +    uint64_t *record_identifier, bool first)
>>>> +{
>>>> +    unsigned found = 0;
>>>> +    unsigned index;
>>>> +
>>>> +    /* For operations needing to return 'first' record identifer */
>>>> +    if (first) {
>>>> +        /* Reset initial index to beginning */
>>>> +        s->next_record_index = s->first_record_index;
>>>> +    }
>>>> +    index = s->next_record_index;
>>>> +
>>>> +    *record_identifier = ERST_EMPTY_END_RECORD_ID;
>>>> +
>>>> +    if (le32_to_cpu(s->header->record_count)) {
>>>> +        for (; index < s->last_record_index; ++index) {
>>>> +            if (le64_to_cpu(s->header->map[index]) !=
>>>> +                    ERST_UNSPECIFIED_RECORD_ID) {
>>>> +                    /* where to start next time */
>>>> +                    s->next_record_index = index + 1;
>>>> +                    *record_identifier = le64_to_cpu(s->header->map[index]);
>>>> +                    found = 1;
>>>> +                    break;
>>>> +            }
>>>> +        }
>>>> +    }
>>>> +    if (!found) {
>>>> +        /* at end (ie scan complete), reset */
>>>> +        s->next_record_index = s->first_record_index;
>>>> +    }
>>>> +
>>>> +    return STATUS_SUCCESS;
>>>> +}
>>>> +
>>>> +/* ACPI 4.0: 17.4.2.3 Operations - Clearing */
>>>> +static unsigned clear_erst_record(ERSTDeviceState *s)
>>>> +{
>>>> +    unsigned rc = STATUS_RECORD_NOT_FOUND;
>>>> +    unsigned index;
>>>> +
>>>> +    /* Check for valid record identifier */
>>>> +    if (!ERST_IS_VALID_RECORD_ID(s->record_identifier)) {
>>>> +        return STATUS_FAILED;
>>>> +    }
>>>> +
>>>> +    index = lookup_erst_record(s, s->record_identifier);
>>>> +    if (index) {
>>>> +        /* No need to wipe record, just invalidate its map entry */
>>>> +        uint32_t record_count;
>>>> +        update_map_entry(s, index, ERST_UNSPECIFIED_RECORD_ID);
>>>> +        record_count = le32_to_cpu(s->header->record_count);
>>>> +        record_count -= 1;
>>>> +        s->header->record_count = cpu_to_le32(record_count);
>>>> +        rc = STATUS_SUCCESS;
>>>> +    }
>>>> +
>>>> +    return rc;
>>>> +}
>>>> +
>>>> +/* ACPI 4.0: 17.4.2.2 Operations - Reading */
>>>> +static unsigned read_erst_record(ERSTDeviceState *s)
>>>> +{
>>>> +    unsigned rc = STATUS_RECORD_NOT_FOUND;
>>>> +    unsigned exchange_length;
>>>> +    unsigned index;
>>>> +
>>>> +    /* Check if backend storage is empty */
>>>> +    if (le32_to_cpu(s->header->record_count) == 0) {
>>>> +        return STATUS_RECORD_STORE_EMPTY;
>>>> +    }
>>>> +
>>>> +    exchange_length = memory_region_size(&s->exchange_mr);
>>>> +
>>>> +    /* Check for record identifier of all 0s */
>>>> +    if (s->record_identifier == ERST_UNSPECIFIED_RECORD_ID) {
>>>> +        /* Set to 'first' record in storage */
>>>> +        get_next_record_identifier(s, &s->record_identifier, true);
>>>> +        /* record_identifier is now a valid id, or all 1s */
>>>> +    }
>>>> +
>>>> +    /* Check for record identifier of all 1s */
>>>> +    if (s->record_identifier == ERST_EMPTY_END_RECORD_ID) {
>>>> +        return STATUS_FAILED;
>>>> +    }
>>>> +
>>>> +    /* Validate record_offset */
>>>> +    if (s->record_offset > (exchange_length - UEFI_CPER_RECORD_MIN_SIZE)) {
>>>> +        return STATUS_FAILED;
>>>> +    }
>>>> +
>>>> +    index = lookup_erst_record(s, s->record_identifier);
>>>> +    if (index) {
>>>> +        uint8_t *nvram;
>>>> +        uint8_t *exchange;
>>>> +        uint32_t record_length;
>>>> +
>>>> +        /* Obtain pointer to the exchange buffer */
>>>> +        exchange = memory_region_get_ram_ptr(&s->exchange_mr);
>>>> +        exchange += s->record_offset;
>>>> +        /* Obtain pointer to slot in storage */
>>>> +        nvram = get_nvram_ptr_by_index(s, index);
>>>> +        /* Validate CPER record_length */
>>>> +        memcpy((uint8_t *)&record_length,
>>>> +            &nvram[UEFI_CPER_RECORD_LENGTH_OFFSET],
>>>> +            sizeof(uint32_t));
>>>> +        record_length = le32_to_cpu(record_length);
>>>> +        if (record_length < UEFI_CPER_RECORD_MIN_SIZE) {
>>>> +            rc = STATUS_FAILED;
>>>> +        }
>>>> +        if ((s->record_offset + record_length) > exchange_length) {
>>>> +            rc = STATUS_FAILED;
>>>> +        }
>>>> +        /* If all is ok, copy the record to the exchange buffer */
>>>> +        if (rc != STATUS_FAILED) {
>>>> +            memcpy(exchange, nvram, record_length);
>>>> +            rc = STATUS_SUCCESS;
>>>> +        }
>>>> +    } else {
>>>
>>> I wonder if it is wise to return the next record id if the record is
>>> not found. Should we simply return STATUS_FAILED here as well?
>>
>> Actually, this is per the spec. ACPI Spec 4.0 17.4.2.2 (or ACPI Spec 6.3 18.5.2.2) "Reading", see
>> "The steps performed by the platform ...", section 2.c, calls for locating the 'first' identifier.
> 
> yes you are correct on this one.
> 
>>
>> I left a reference comment in the code.
>>
>>>
>>>> +        /* Set to 'first' record in storage */
>>>> +        get_next_record_identifier(s, &s->record_identifier, true);
>>>> +    }
>>>> +
>>>> +    return rc;
>>>> +}
>>>> +
>>>> +/* ACPI 4.0: 17.4.2.1 Operations - Writing */
>>>> +static unsigned write_erst_record(ERSTDeviceState *s)
>>>> +{
>>>> +    unsigned rc = STATUS_FAILED;
>>>> +    unsigned exchange_length;
>>>> +    unsigned index;
>>>> +    uint64_t record_identifier;
>>>> +    uint32_t record_length;
>>>> +    uint8_t *exchange;
>>>> +    uint8_t *nvram = NULL;
>>>> +    bool record_found = false;
>>>> +
>>>> +    exchange_length = memory_region_size(&s->exchange_mr);
>>>> +
>>>> +    /* Validate record_offset */
>>>> +    if (s->record_offset > (exchange_length - UEFI_CPER_RECORD_MIN_SIZE)) {
>>>> +        return STATUS_FAILED;
>>>> +    }
>>>> +
>>>> +    /* Obtain pointer to record in the exchange buffer */
>>>> +    exchange = memory_region_get_ram_ptr(&s->exchange_mr);
>>>> +    exchange += s->record_offset;
>>>> +
>>>> +    /* Validate CPER record_length */
>>>> +    memcpy((uint8_t *)&record_length, &exchange[UEFI_CPER_RECORD_LENGTH_OFFSET],
>>>> +        sizeof(uint32_t));
>>>> +    record_length = le32_to_cpu(record_length);
>>>> +    if (record_length < UEFI_CPER_RECORD_MIN_SIZE) {
>>>> +        return STATUS_FAILED;
>>>> +    }
>>>> +    if ((s->record_offset + record_length) > exchange_length) {
>>>> +        return STATUS_FAILED;
>>>> +    }
>>>> +
>>>> +    /* Extract record identifier */
>>>> +    memcpy((uint8_t *)&record_identifier, &exchange[UEFI_CPER_RECORD_ID_OFFSET],
>>>> +        sizeof(uint64_t));
>>>> +    record_identifier = le64_to_cpu(record_identifier);
>>>> +
>>>> +    /* Check for valid record identifier */
>>>> +    if (!ERST_IS_VALID_RECORD_ID(record_identifier)) {
>>>> +        return STATUS_FAILED;
>>>> +    }
>>>> +
>>>> +    index = lookup_erst_record(s, record_identifier);
>>>> +    if (index) {
>>>> +        /* Record found, overwrite existing record */
>>>> +        nvram = get_nvram_ptr_by_index(s, index);
>>>> +        record_found = true;
>>>> +    } else {
>>>> +        /* Record not found, not an overwrite, allocate for write */
>>>> +        index = allocate_erst_record(s);
>>>> +        if (index) {
>>>> +            nvram = get_nvram_ptr_by_index(s, index);
>>>> +        } else {
>>>> +            rc = STATUS_NOT_ENOUGH_SPACE;
>>>
>>> /* all slots are occupied */
>> done!
>>
>>>
>>>> +        }
>>>> +    }
>>>> +    if (nvram) {
>>>> +        /* Write the record into the slot */
>>>> +        memcpy(nvram, exchange, record_length);
>>>> +        memset(nvram + record_length, exchange_length - record_length, 0xFF);
>>>> +        /* If a new record, increment the record_count */
>>>> +        if (!record_found) {
>>>> +            uint32_t record_count;
>>>> +            record_count = le32_to_cpu(s->header->record_count);
>>>> +            record_count += 1; /* writing new record */
>>>> +            s->header->record_count = cpu_to_le32(record_count);
>>>> +        }
>>>> +        update_map_entry(s, index, record_identifier);
>>>> +        rc = STATUS_SUCCESS;
>>>> +    }
>>>> +
>>>> +    return rc;
>>>> +}
>>>> +
>>>> +/*******************************************************************/
>>>> +
>>>> +static uint64_t erst_rd_reg64(hwaddr addr,
>>>> +    uint64_t reg, unsigned size)
>>>> +{
>>>> +    uint64_t rdval;
>>>> +    uint64_t mask;
>>>> +    unsigned shift;
>>>> +
>>>> +    if (size == sizeof(uint64_t)) {
>>>> +        /* 64b access */
>>>> +        mask = 0xFFFFFFFFFFFFFFFFUL;
>>>> +        shift = 0;
>>>> +    } else {
>>>> +        /* 32b access */
>>>> +        mask = 0x00000000FFFFFFFFUL;
>>>> +        shift = ((addr & 0x4) == 0x4) ? 32 : 0;
>>>> +    }
>>>> +
>>>> +    rdval = reg;
>>>> +    rdval >>= shift;
>>>> +    rdval &= mask;
>>>> +
>>>> +    return rdval;
>>>> +}
>>>> +
>>>> +static uint64_t erst_wr_reg64(hwaddr addr,
>>>> +    uint64_t reg, uint64_t val, unsigned size)
>>>> +{
>>>> +    uint64_t wrval;
>>>> +    uint64_t mask;
>>>> +    unsigned shift;
>>>> +
>>>> +    if (size == sizeof(uint64_t)) {
>>>> +        /* 64b access */
>>>> +        mask = 0xFFFFFFFFFFFFFFFFUL;
>>>> +        shift = 0;
>>>> +    } else {
>>>> +        /* 32b access */
>>>> +        mask = 0x00000000FFFFFFFFUL;
>>>> +        shift = ((addr & 0x4) == 0x4) ? 32 : 0;
>>>> +    }
>>>> +
>>>> +    val &= mask;
>>>> +    val <<= shift;
>>>> +    mask <<= shift;
>>>> +    wrval = reg;
>>>> +    wrval &= ~mask;
>>>> +    wrval |= val;
>>>> +
>>>> +    return wrval;
>>>> +}
>>>> +
>>>> +static void erst_reg_write(void *opaque, hwaddr addr,
>>>> +    uint64_t val, unsigned size)
>>>> +{
>>>> +    ERSTDeviceState *s = (ERSTDeviceState *)opaque;
>>>> +
>>>> +    /*
>>>> +     * NOTE: All actions/operations/side effects happen on the WRITE,
>>>> +     * by this implementation's design. The READs simply return the
>>>> +     * reg_value contents.
>>>> +     */
>>>> +    trace_acpi_erst_reg_write(addr, val, size);
>>>> +
>>>> +    switch (addr) {
>>>> +    case ERST_VALUE_OFFSET + 0:
>>>> +    case ERST_VALUE_OFFSET + 4:
>>>> +        s->reg_value = erst_wr_reg64(addr, s->reg_value, val, size);
>>>> +        break;
>>>> +    case ERST_ACTION_OFFSET + 0:
>>>> +        /*
>>>> +         * NOTE: all valid values written to this register are of the
>>>> +         * ACTION_* variety. Thus there is no need to make this a 64-bit
>>>> +         * register, 32-bits is appropriate. As such ERST_ACTION_OFFSET+4
>>>> +         * is not needed.
>>>> +         */
>>>> +        switch (val) {
>>>> +        case ACTION_BEGIN_WRITE_OPERATION:
>>>> +        case ACTION_BEGIN_READ_OPERATION:
>>>> +        case ACTION_BEGIN_CLEAR_OPERATION:
>>>> +        case ACTION_BEGIN_DUMMY_WRITE_OPERATION:
>>>> +        case ACTION_END_OPERATION:
>>>> +            s->operation = val;
>>>> +            break;
>>>> +        case ACTION_SET_RECORD_OFFSET:
>>>> +            s->record_offset = s->reg_value;
>>>> +            break;
>>>> +        case ACTION_EXECUTE_OPERATION:
>>>> +            if ((uint8_t)s->reg_value == ERST_EXECUTE_OPERATION_MAGIC) {
>>>> +                s->busy_status = 1;
>>>> +                switch (s->operation) {
>>>> +                case ACTION_BEGIN_WRITE_OPERATION:
>>>> +                    s->command_status = write_erst_record(s);
>>>> +                    break;
>>>> +                case ACTION_BEGIN_READ_OPERATION:
>>>> +                    s->command_status = read_erst_record(s);
>>>> +                    break;
>>>> +                case ACTION_BEGIN_CLEAR_OPERATION:
>>>> +                    s->command_status = clear_erst_record(s);
>>>> +                    break;
>>>> +                case ACTION_BEGIN_DUMMY_WRITE_OPERATION:
>>>> +                    s->command_status = STATUS_SUCCESS;
>>>> +                    break;
>>>> +                case ACTION_END_OPERATION:
>>>> +                    s->command_status = STATUS_SUCCESS;
>>>> +                    break;
>>>> +                default:
>>>> +                    s->command_status = STATUS_FAILED;
>>>
>>> Should this be something like STATUS_NOT_SUPPORTED?
>> Throughout I've been exclusively using the status codes as defined in the spec:
>> Success, Not Enough Space, Hardware Not Available, Failed, Record Store Empty, Record Not Found.
> 
> yes sadly the spec does not have an equivalent of EINVAL or ENOTSUPP.
> 
>>
>> Failed seems to be an appropriate response.
> 
> should we simply assert() on these cases for now (unless spec
> explicitly says otherwise) ?

I've re-examined the spec and it does not address this situation, that I can tell

However, an assert() seems like a drastic measure (as I understand it, the assert would kill the guest).

In theory we should never encounter this situation, as we have essentially provided a closed system 
with the ACPI table perfectly matching the capabilities of the hardware, and/or vice versa. I then 
suppose it becomes a matter if something malicious is happening. In that case, it better to assert() 
and kill the guest (essentiallyl a denial of service attack?), or just FAIL and make this 
"uninteresting" to the attacker?

It seems to me that FAIL provides a better response.

> 
>>
>>>
>>>> +                    break;
>>>> +                }
>>>> +                s->busy_status = 0;
>>>> +            }
>>>> +            break;
>>>> +        case ACTION_CHECK_BUSY_STATUS:
>>>> +            s->reg_value = s->busy_status;
>>>> +            break;
>>>> +        case ACTION_GET_COMMAND_STATUS:
>>>> +            s->reg_value = s->command_status;
>>>> +            break;
>>>> +        case ACTION_GET_RECORD_IDENTIFIER:
>>>> +            s->command_status = get_next_record_identifier(s,
>>>> +                                    &s->reg_value, false);
>>>> +            break;
>>>> +        case ACTION_SET_RECORD_IDENTIFIER:
>>>> +            s->record_identifier = s->reg_value;
>>>> +            break;
>>>> +        case ACTION_GET_RECORD_COUNT:
>>>> +            s->reg_value = le32_to_cpu(s->header->record_count);
>>>> +            break;
>>>> +        case ACTION_GET_ERROR_LOG_ADDRESS_RANGE:
>>>> +            s->reg_value = (hwaddr)pci_get_bar_addr(PCI_DEVICE(s), 1);
>>>> +            break;
>>>> +        case ACTION_GET_ERROR_LOG_ADDRESS_LENGTH:
>>>> +            s->reg_value = le32_to_cpu(s->header->record_size);
>>>> +            break;
>>>> +        case ACTION_GET_ERROR_LOG_ADDRESS_RANGE_ATTRIBUTES:
>>>> +            s->reg_value = 0x0; /* intentional, not NVRAM mode */
>>>> +            break;
>>>> +        case ACTION_GET_EXECUTE_OPERATION_TIMINGS:
>>>> +            s->reg_value =
>>>> +                (100ULL << 32) | /* 100us max time */
>>>> +                (10ULL  <<  0) ; /*  10us min time */
>>>> +            break;
>>>> +        default:
>>>> +            /* Unknown action/command, NOP */
>>>
>>> maybe add some tracing here in case guests are going bad mmio writes?
>> At the top of this function is a trace that produces information on all writes.
> 
> OK cool.
> 
>>
>>>
>>>> +            break;
>>>> +        }
>>>> +        break;
>>>> +    default:
>>>> +        /* This should not happen, but if it does, NOP */
>>>> +        break;
>>>> +    }
>>>> +}
>>>> +
>>>> +static uint64_t erst_reg_read(void *opaque, hwaddr addr,
>>>> +                                unsigned size)
>>>> +{
>>>> +    ERSTDeviceState *s = (ERSTDeviceState *)opaque;
>>>> +    uint64_t val = 0;
>>>> +
>>>> +    switch (addr) {
>>>> +    case ERST_ACTION_OFFSET + 0:
>>>> +    case ERST_ACTION_OFFSET + 4:
>>>> +        val = erst_rd_reg64(addr, s->reg_action, size);
>>>> +        break;
>>>> +    case ERST_VALUE_OFFSET + 0:
>>>> +    case ERST_VALUE_OFFSET + 4:
>>>> +        val = erst_rd_reg64(addr, s->reg_value, size);
>>>> +        break;
>>>> +    default:
>>>> +        break;
>>>> +    }
>>>> +    trace_acpi_erst_reg_read(addr, val, size);
>>>> +    return val;
>>>> +}
>>>> +
>>>> +static const MemoryRegionOps erst_reg_ops = {
>>>> +    .read = erst_reg_read,
>>>> +    .write = erst_reg_write,
>>>> +    .endianness = DEVICE_NATIVE_ENDIAN,
>>>> +};
>>>> +
>>>> +/*******************************************************************/
>>>> +/*******************************************************************/
>>>> +static int erst_post_load(void *opaque, int version_id)
>>>> +{
>>>> +    ERSTDeviceState *s = opaque;
>>>> +
>>>> +    /* Recompute pointer to header */
>>>> +    s->header = (ERSTStorageHeader *)get_nvram_ptr_by_index(s, 0);
>>>> +    trace_acpi_erst_post_load(s->header, le32_to_cpu(s->header->record_size));
>>>> +
>>>> +    return 0;
>>>> +}
>>>> +
>>>> +static const VMStateDescription erst_vmstate  = {
>>>> +    .name = "acpi-erst",
>>>> +    .version_id = 1,
>>>> +    .minimum_version_id = 1,
>>>> +    .post_load = erst_post_load,
>>>> +    .fields = (VMStateField[]) {
>>>> +        VMSTATE_UINT8(operation, ERSTDeviceState),
>>>> +        VMSTATE_UINT8(busy_status, ERSTDeviceState),
>>>> +        VMSTATE_UINT8(command_status, ERSTDeviceState),
>>>> +        VMSTATE_UINT32(record_offset, ERSTDeviceState),
>>>> +        VMSTATE_UINT64(reg_action, ERSTDeviceState),
>>>> +        VMSTATE_UINT64(reg_value, ERSTDeviceState),
>>>> +        VMSTATE_UINT64(record_identifier, ERSTDeviceState),
>>>> +        VMSTATE_UINT32(next_record_index, ERSTDeviceState),
>>>> +        VMSTATE_END_OF_LIST()
>>>> +    }
>>>> +};
>>>> +
>>>> +static void erst_realizefn(PCIDevice *pci_dev, Error **errp)
>>>> +{
>>>> +    ERSTDeviceState *s = ACPIERST(pci_dev);
>>>> +
>>>> +    trace_acpi_erst_realizefn_in();
>>>> +
>>>> +    if (!s->hostmem) {
>>>> +        error_setg(errp, "'" ACPI_ERST_MEMDEV_PROP "' property is not set");
>>>> +        return;
>>>> +    } else if (host_memory_backend_is_mapped(s->hostmem)) {
>>>> +        error_setg(errp, "can't use already busy memdev: %s",
>>>> +                   object_get_canonical_path_component(OBJECT(s->hostmem)));
>>>> +        return;
>>>> +    }
>>>> +
>>>> +    s->hostmem_mr = host_memory_backend_get_memory(s->hostmem);
>>>> +
>>>> +    /* HostMemoryBackend size will be multiple of PAGE_SIZE */
>>>> +    s->storage_size = object_property_get_int(OBJECT(s->hostmem), "size", errp);
>>>> +
>>>> +    /* Initialize backend storage and record_count */
>>>> +    check_erst_backend_storage(s, errp);
>>>> +
>>>> +    /* BAR 0: Programming registers */
>>>> +    memory_region_init_io(&s->iomem_mr, OBJECT(pci_dev), &erst_reg_ops, s,
>>>> +                          TYPE_ACPI_ERST, ERST_REG_SIZE);
>>>> +    pci_register_bar(pci_dev, 0, PCI_BASE_ADDRESS_SPACE_MEMORY, &s->iomem_mr);
>>>> +
>>>> +    /* BAR 1: Exchange buffer memory */
>>>> +    memory_region_init_ram(&s->exchange_mr, OBJECT(pci_dev),
>>>> +                            "erst.exchange",
>>>> +                            le32_to_cpu(s->header->record_size), errp);
>>>> +    pci_register_bar(pci_dev, 1, PCI_BASE_ADDRESS_SPACE_MEMORY,
>>>> +                        &s->exchange_mr);
>>>> +
>>>> +    /* Include the backend storage in the migration stream */
>>>> +    vmstate_register_ram_global(s->hostmem_mr);
>>>> +
>>>> +    trace_acpi_erst_realizefn_out(s->storage_size);
>>>> +}
>>>> +
>>>> +static void erst_reset(DeviceState *dev)
>>>> +{
>>>> +    ERSTDeviceState *s = ACPIERST(dev);
>>>> +
>>>> +    trace_acpi_erst_reset_in(le32_to_cpu(s->header->record_count));
>>>> +    s->operation = 0;
>>>> +    s->busy_status = 0;
>>>> +    s->command_status = STATUS_SUCCESS;
>>>> +    s->record_identifier = ERST_UNSPECIFIED_RECORD_ID;
>>>> +    s->record_offset = 0;
>>>> +    s->next_record_index = s->first_record_index;
>>>> +    /* NOTE: first/last_record_index are computed only once */
>>>> +    trace_acpi_erst_reset_out(le32_to_cpu(s->header->record_count));
>>>> +}
>>>> +
>>>> +static Property erst_properties[] = {
>>>> +    DEFINE_PROP_LINK(ACPI_ERST_MEMDEV_PROP, ERSTDeviceState, hostmem,
>>>> +                     TYPE_MEMORY_BACKEND, HostMemoryBackend *),
>>>> +    DEFINE_PROP_UINT32(ACPI_ERST_RECORD_SIZE_PROP, ERSTDeviceState,
>>>> +                     default_record_size, ERST_RECORD_SIZE),
>>>> +    DEFINE_PROP_END_OF_LIST(),
>>>> +};
>>>> +
>>>> +static void erst_class_init(ObjectClass *klass, void *data)
>>>> +{
>>>> +    DeviceClass *dc = DEVICE_CLASS(klass);
>>>> +    PCIDeviceClass *k = PCI_DEVICE_CLASS(klass);
>>>> +
>>>> +    trace_acpi_erst_class_init_in();
>>>> +    k->realize = erst_realizefn;
>>>> +    k->vendor_id = PCI_VENDOR_ID_REDHAT;
>>>> +    k->device_id = PCI_DEVICE_ID_REDHAT_ACPI_ERST;
>>>> +    k->revision = 0x00;
>>>> +    k->class_id = PCI_CLASS_OTHERS;
>>>> +    dc->reset = erst_reset;
>>>> +    dc->vmsd = &erst_vmstate;
>>>> +    dc->user_creatable = true;
>>>> +    dc->hotpluggable = false;
>>>> +    device_class_set_props(dc, erst_properties);
>>>> +    dc->desc = "ACPI Error Record Serialization Table (ERST) device";
>>>> +    set_bit(DEVICE_CATEGORY_MISC, dc->categories);
>>>> +    trace_acpi_erst_class_init_out();
>>>> +}
>>>> +
>>>> +static const TypeInfo erst_type_info = {
>>>> +    .name          = TYPE_ACPI_ERST,
>>>> +    .parent        = TYPE_PCI_DEVICE,
>>>> +    .class_init    = erst_class_init,
>>>> +    .instance_size = sizeof(ERSTDeviceState),
>>>> +    .interfaces = (InterfaceInfo[]) {
>>>> +        { INTERFACE_CONVENTIONAL_PCI_DEVICE },
>>>> +        { }
>>>> +    }
>>>> +};
>>>> +
>>>> +static void erst_register_types(void)
>>>> +{
>>>> +    type_register_static(&erst_type_info);
>>>> +}
>>>> +
>>>> +type_init(erst_register_types)
>>>> diff --git a/hw/acpi/meson.build b/hw/acpi/meson.build
>>>> index adf6347..f5b2298 100644
>>>> --- a/hw/acpi/meson.build
>>>> +++ b/hw/acpi/meson.build
>>>> @@ -22,6 +22,7 @@ acpi_ss.add(when: 'CONFIG_ACPI_PCIHP', if_true: files('pcihp.c'))
>>>>    acpi_ss.add(when: 'CONFIG_ACPI_PCIHP', if_false: files('acpi-pci-hotplug-stub.c'))
>>>>    acpi_ss.add(when: 'CONFIG_ACPI_VIOT', if_true: files('viot.c'))
>>>>    acpi_ss.add(when: 'CONFIG_ACPI_X86_ICH', if_true: files('ich9.c', 'tco.c'))
>>>> +acpi_ss.add(when: 'CONFIG_ACPI_ERST', if_true: files('erst.c'))
>>>>    acpi_ss.add(when: 'CONFIG_IPMI', if_true: files('ipmi.c'), if_false: files('ipmi-stub.c'))
>>>>    acpi_ss.add(when: 'CONFIG_PC', if_false: files('acpi-x86-stub.c'))
>>>>    acpi_ss.add(when: 'CONFIG_TPM', if_true: files('tpm.c'))
>>>> diff --git a/hw/acpi/trace-events b/hw/acpi/trace-events
>>>> index 974d770..2250126 100644
>>>> --- a/hw/acpi/trace-events
>>>> +++ b/hw/acpi/trace-events
>>>> @@ -55,3 +55,18 @@ piix4_gpe_writeb(uint64_t addr, unsigned width, uint64_t val) "addr: 0x%" PRIx64
>>>>    # tco.c
>>>>    tco_timer_reload(int ticks, int msec) "ticks=%d (%d ms)"
>>>>    tco_timer_expired(int timeouts_no, bool strap, bool no_reboot) "timeouts_no=%d no_reboot=%d/%d"
>>>> +
>>>> +# erst.c
>>>> +acpi_erst_reg_write(uint64_t addr, uint64_t val, unsigned size) "addr: 0x%04" PRIx64 " <== 0x%016" PRIx64 " (size: %u)"
>>>> +acpi_erst_reg_read(uint64_t addr, uint64_t val, unsigned size) " addr: 0x%04" PRIx64 " ==> 0x%016" PRIx64 " (size: %u)"
>>>> +acpi_erst_mem_write(uint64_t addr, uint64_t val, unsigned size) "addr: 0x%06" PRIx64 " <== 0x%016" PRIx64 " (size: %u)"
>>>> +acpi_erst_mem_read(uint64_t addr, uint64_t val, unsigned size) " addr: 0x%06" PRIx64 " ==> 0x%016" PRIx64 " (size: %u)"
>>>> +acpi_erst_pci_bar_0(uint64_t addr) "BAR0: 0x%016" PRIx64
>>>> +acpi_erst_pci_bar_1(uint64_t addr) "BAR1: 0x%016" PRIx64
>>>> +acpi_erst_realizefn_in(void)
>>>> +acpi_erst_realizefn_out(unsigned size) "total nvram size %u bytes"
>>>> +acpi_erst_reset_in(unsigned record_count) "record_count %u"
>>>> +acpi_erst_reset_out(unsigned record_count) "record_count %u"
>>>> +acpi_erst_post_load(void *header, unsigned slot_size) "header: 0x%p slot_size %u"
>>>> +acpi_erst_class_init_in(void)
>>>> +acpi_erst_class_init_out(void)
>>>> --
>>>> 1.8.3.1
>>>>

