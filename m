Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C8B4F570B24
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jul 2022 22:07:25 +0200 (CEST)
Received: from localhost ([::1]:34956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oAzgi-00061M-H6
	for lists+qemu-devel@lfdr.de; Mon, 11 Jul 2022 16:07:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55252)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1oAzdM-0003Rq-UI
 for qemu-devel@nongnu.org; Mon, 11 Jul 2022 16:03:58 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:44900)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1oAzdH-0002sM-IA
 for qemu-devel@nongnu.org; Mon, 11 Jul 2022 16:03:54 -0400
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26BIYGmK008803;
 Mon, 11 Jul 2022 20:03:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : from : to : cc : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=IUqrc3K6+WWoWZ+PyaNrmzpUWtot8INfl4SfEIp5KOU=;
 b=erOWYtDwRGwSttZSF64f4T+RTh6CwQqduQFkhrRsx+UHty/VjeOcGmkCB9d6LBkMHmua
 JadjwuUybiWeYPoqZ/M8ofmFxBGkWYCT/BV/t6KOTE5R93djjIsoO8ykGf8rDBqKiYvz
 0enNLVNWDwBYUwztmPEw278TGPLVJpL1uld9ew1zYEUK9UJZIb6Oh+4zKYOsHhMlttQC
 YuzKJqmzFtilRUkARGuTKI1SpgOSMnwAi9huM/iBGnTwGhS1KEisX13zA7sSKO5AkD6W
 VjPKW3Lns6zMF8IitOWferq+8Y1WZcaG5PegCSz7W0Vsb/pSdcn44CIPxK2KY2iszFSg 1g== 
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3h71sgmf3c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 11 Jul 2022 20:03:40 +0000
Received: from pps.filterd
 (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 26BK0jCP028717; Mon, 11 Jul 2022 20:03:39 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2105.outbound.protection.outlook.com [104.47.58.105])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id
 3h70427cdh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 11 Jul 2022 20:03:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZboQHK0xBjEewY/dqB9CNIaomdQ1Ky4LoFDtGoj3EqLmQBY23AphQjExpizCNtJrgfPncRGPxIZckln6Sl4eyI5xA26acEYqyNSeCvTYNT+D43II2SQ42Q+YrzIMHoK6cct5qm+h6mxBjbQGdLiRsEIc9ZAJZjovFxV1vnKLN6cyJqPuamJPBKPLZfEsWYECX7bwawlNUYvvkBxMXJFiKQG9Bt4Wvdb/tkMFigveOyVCZe9OxHh+sxhuLUN9RP3spumJ8SpHlciNQh55tWCJUNcQzWeUC8ijkjmrR18Pqsqe1YcAXzYHiKDhauWO/RjkKaNR3owqvKAXWiMLUDehmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IUqrc3K6+WWoWZ+PyaNrmzpUWtot8INfl4SfEIp5KOU=;
 b=X9Mk1mF3STR2LWf9rc7jtEgEgZrOcF3LGCUnHkp3ySjXogzsKS1D+fgJ/85UfCmXedwjnCG4KtGbiNqD/9Vf9tiX/6rUYp6WYQe9PhvXJtmfnPgSylQkZob4CT14n42N3BfvdmE5wAdRAPYMneezUY7GbfkHek4QEUo5dh6nFKS2lfHWfDDmFzEXOCWiJSM9QktwACWC1z0QVhPQjWwC3AWDpUkZp9rzGa2XQ40LzEfvbr8Vd2mi6W+C9KfxTNLPJzwvKAbv1BVFjUrJEcZ27OCxBwx4UIeyfxR/7RIy/K31BW4qbj3QdCquPjQB3GmfsAhjz3HrrU/6fp3kZdyGCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IUqrc3K6+WWoWZ+PyaNrmzpUWtot8INfl4SfEIp5KOU=;
 b=MdV3D3ntHWz7qoMDPTCAmrLLVdxmvmWpHLuFdBiAV68XcBbdAvR5V5lmg+Yh9VmtRW+tShPHPsoOOID2wWqhiHhUSNdw+blkCKy9rXZl8TVhRbd5loqEsOhjVRiwL8j4JNUPdE8tXl7I68ePKQ/PeeYLrjzO6POBREOcZMah4rQ=
Received: from BLAPR10MB4835.namprd10.prod.outlook.com (2603:10b6:208:331::11)
 by DM5PR10MB1387.namprd10.prod.outlook.com (2603:10b6:3:13::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.25; Mon, 11 Jul
 2022 20:03:37 +0000
Received: from BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::b842:a301:806d:231e]) by BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::b842:a301:806d:231e%9]) with mapi id 15.20.5417.026; Mon, 11 Jul 2022
 20:03:37 +0000
Message-ID: <a731592c-4e42-ea23-6fe3-550b8a07af11@oracle.com>
Date: Mon, 11 Jul 2022 21:03:28 +0100
Subject: Re: [PATCH v6 09/10] i386/pc: relocate 4g start to 1T where applicable
Content-Language: en-US
From: Joao Martins <joao.m.martins@oracle.com>
To: Igor Mammedov <imammedo@redhat.com>
Cc: qemu-devel@nongnu.org, Eduardo Habkost <eduardo@habkost.net>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
References: <20220701161014.3850-1-joao.m.martins@oracle.com>
 <20220701161014.3850-10-joao.m.martins@oracle.com>
 <20220711145627.2c318ba6@redhat.com>
 <5179013f-a2b6-b5a4-a509-42657dbde25a@oracle.com>
 <65ea8b7f-37cb-55dc-3306-fd32880aa0fb@oracle.com>
In-Reply-To: <65ea8b7f-37cb-55dc-3306-fd32880aa0fb@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0229.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a6::18) To BLAPR10MB4835.namprd10.prod.outlook.com
 (2603:10b6:208:331::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3602fa76-9a7c-4c9c-5464-08da63787100
X-MS-TrafficTypeDiagnostic: DM5PR10MB1387:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wEfevepH7Gz2H0Zri/ItJxNDoKSw78+oZ7RzoCR5twVNMkym5ZqozDFfAh781vKXaCImzU2dP/ukkY+45R4HsJ3qo+ZcrXyCd5iuObQrKSqsXFXpYTMR2qkXogLto27TrJlQmYM4GQ53FkQB4a1uByD9RV+C7IVEcvfGmvFekYBvo4jZOXbImusH6lPi7ryq3EaD74lqfRbhD7CHO8DFC792wwBY4d55dGpn1wl9F+eUgMzmngn4JBkB17Gemu2vREYYpfR+Wnqm4ttUjQ3WoukcNv+mI9rKORoYpfxMjR3suG1hEolprGAG7oSik+1Pd0/4myFdxYVxEjSrSdFlR8RRmKamibIt+I5QbmvjXcyz3Pw5UXXmh4kE7Hh+630NgwF4esO0GXTKCPEU0LUEhiBBmk/wQzuOCKP8/Z6lhdA4nHYrlHduNxGDp/NDJgKo9iijqKEqWGRrFAL+Y+UTHsQhXFQi/pg7eMULEkQQvzeCrLffk9QuH2rrwcV+SauW6qSnsetSGM4XjEn0vs7fDCQSeHJLY3Ug3me2qFIp+Rm8m5GbqjOP6pOaH2d/i8hrjTDV0Ix7iwoJHfCnplrfz/taYCObps5fBR9C2WzBUW5VEgtXMjNMUMz2cGCz9lqMkZK8JFxlI5zNsG67tyXoRdvbSpPT8hTgQDdw+UKJ5kh6YfnRxKmi7RFOzz91oOUjZJUcJs2STeotHL/ko2kxGuFupXovFOtd/H3VheSTKaArMl+eb4m7HdJJCDBF35FkAK+YCOeLs+lRwAnjWY+knFfMttaMxcDlTutMGlCx+8B7I4MBO6lJgx2XgQ5LhblU
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BLAPR10MB4835.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(376002)(136003)(346002)(396003)(366004)(39860400002)(41300700001)(31696002)(6666004)(6512007)(8936002)(8676002)(66476007)(26005)(83380400001)(66556008)(4326008)(53546011)(66946007)(6506007)(2616005)(86362001)(54906003)(36756003)(6486002)(31686004)(2906002)(6916009)(38100700002)(5660300002)(7416002)(316002)(478600001)(186003)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RUJyMTMycGgxczVVd2RhK3RXaWEzQUpHZVhnWnFVTGIvenBmNktYSGN6QTdK?=
 =?utf-8?B?UGttNU5XSE1vN3lyK1hUUDdtcGpFcFRoV3VGeGFLeDIvMTN1TEdWRWQ4T1dN?=
 =?utf-8?B?NXJiUllpa08yd3hDK04zTnpLdWMzRWlXNVUvQjRHSmJQMjhUYmRtSHBLdnVH?=
 =?utf-8?B?dVd2ZTgweU9CS0ZZTkVsYkExLy90cHg0dnUrV1k2eDIzUlRNaldobWZ2b3dK?=
 =?utf-8?B?UXU0WXZvenNEOFBUNjRoYVpXRkY5Z0VMaVlqV1kwbDhlTUZQRS85YUJoN0Zv?=
 =?utf-8?B?TnZNQzZoUFJVbzRveW43VVUrY0pGWUFjSkdnM1Z5bUJpZWViZnUrQnQ5VVlY?=
 =?utf-8?B?QUZidnhwaFpzbUVsL0EyNmxTRGd1MzJZYm5rU0tRMjFmUmIrUUN0bG9EQ3Bw?=
 =?utf-8?B?cXdEQjZRS0lvZDUyU3FEOVEzZmxyTTJDSFhqZlRsNUxMazFlL0hPc0FUY21l?=
 =?utf-8?B?azEyc0hBM3hSdnU1YzFhb3BmYVdxdFlMcDZqWUQzcEd3eUQxR0lnQ1EyUW1D?=
 =?utf-8?B?eUtpZ2QyOVhJTTdhVFJPbnJWOW9ZSml5TGY1RVdWUHBxK3Zra1pGRk1ucU5N?=
 =?utf-8?B?TjMvaEgrNUhRWHFiaGIzc0o1WVd2c0l5UkhCSlZkNGNCZElDVVlNQTE2WHh2?=
 =?utf-8?B?YjJNMzViUlc5SlJGeEJ0aXc2a0lXK050eDlvUVU0ZTZKSjh4VjJYQ2crcHJz?=
 =?utf-8?B?VXpQWkw1LzE3ZzFpS0tXb2JNZ3FkWjUxdEJkQklZY1BsMWVpODIvQzE5QmhS?=
 =?utf-8?B?Zk1aNUhaMFBSYnhMMjU5OFVBZ2FtaEFMNm9yK1hoOFBRZ1BQSXI3cVpRekND?=
 =?utf-8?B?K2hhV09pNlVheU9Dc3htMTJmcWtDcXNteXRHS2M3Wmo0aTVMczRsKzQzaEJj?=
 =?utf-8?B?WUxPeXRSZWJhRzhOVG9nNWxmRFFyV1R6STVaTWowaytOejQvRlBTc3ROVFY0?=
 =?utf-8?B?TzdJbmZwTjkrbXo2MUJxc0lTSFczZXlJNk81TnJ4UTREWURnUzVhSWVjbkpY?=
 =?utf-8?B?L0huQjk5eEZXNTYvTzJaemhrTS9aZTdodXFuN2YwR1FiaStkQXpIcTAyRGpK?=
 =?utf-8?B?VTNiS242MER5dXVWUUlaVFNUakdCQXFVQjlSRU01NGZpQjRFTFc5bWpwbmN0?=
 =?utf-8?B?c2RCNzBpSzJQQ1lrVXhwSWEwVC9lTG5RSENaa2pBRC9Ea3lGQmxOckN4MjJR?=
 =?utf-8?B?TGs1U0ZVODc2ekpBMEtLT0F1OVNtU1RsajBRTzBuSTBuNGJyelFYMFVLMVFJ?=
 =?utf-8?B?ajhGby9CS2xHQkxtV05wQ3BQclRSZGVSNVhFNHczVHhlblhMY0V3TkdEeWtC?=
 =?utf-8?B?dWtrSG8zUVhydEY1eC8zV3R6N0ZhOHVGYTcrRy9POElSYStjWDhNd3I1RnpZ?=
 =?utf-8?B?dVExcEMxZUtqUlhoT29wQVNyVzI4TmtwaVBjM25aUElHUXpDRzhYaHBVTjhJ?=
 =?utf-8?B?MEFlOEc0Qzh2L1EwRnU1UzhVMGw0ck5rYjBhRzJsWGR6S05JZ1ZsTG5KaVQ0?=
 =?utf-8?B?WU5iS1BqZnNDbk80VWVZUXFlQWZsMVpHY0hQWE5NU05ka0lCaFVOVTd1cWlU?=
 =?utf-8?B?NmQwZXR3RXhTcXNHTStNNnp1Q0dDSXQwU3RyOU5NdHhWRzVPSEpkWmdEaG9E?=
 =?utf-8?B?RDFzdmt6cTRrQ0dWRDdIZk9sYVpBSkN2c3E0emc1eHhlNTdPY1lld1I0bm9R?=
 =?utf-8?B?c1F3SjMxaGlkMDlqUktpWHUyVmYxRmhoR0d3QnhxeW9BYzJIMlN6ZXBQeTVZ?=
 =?utf-8?B?VXZMcDdKOWJLQXhsbEkyY0NPMlZveDNiRXV2U0JQUzFiUTRwd3l2eFZYVEQ4?=
 =?utf-8?B?bHJqbWM4ek1RUi92b0czWktrNkRQLzhRaUU0bEZENVpKSXUxb3MwUjdYMjlm?=
 =?utf-8?B?Zko0ZnRlc3hnUDVYcUVsMHl4MmNwMEpwUVRBTldrSm9ubjBKUG1NdGt4VmlM?=
 =?utf-8?B?ZU0ydjR1M0w0dU9KUXh1azdkTWJiK2dDY2ZiUGFNSTVPRkNNOVpUQVN4OThW?=
 =?utf-8?B?VndMQ3VEL1M0UUJtUS9YRTAzL3NOY0l5M3Z2dkcrazhVNkVKeXFCVGJaYkFY?=
 =?utf-8?B?SVJLdmNvR1RmOVJUdDJUL1dPTlJwQXZCbDZrUFpteW9ydUIrbldPbi9oVFFU?=
 =?utf-8?B?TDVlK0RmZkRvTk0wdFJvWE1KTDJIMy9lMVJsbDc1YkpheG9TK1E1bWppaDVj?=
 =?utf-8?B?VGc9PQ==?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3602fa76-9a7c-4c9c-5464-08da63787100
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB4835.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2022 20:03:37.1762 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nm4fFVvE3eQwzuGYxNdhkouprCidWA7gURIOGTkFEmPowVRJ2+hyUi+5D1mB9dP1ABqFUSGBuAIhfVeKIiRy2wQ/aA1U04an9ZYbn7hfBHY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR10MB1387
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.517, 18.0.883
 definitions=2022-07-11_25:2022-07-08,
 2022-07-11 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 phishscore=0
 mlxlogscore=899 suspectscore=0 adultscore=0 mlxscore=0 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2207110084
X-Proofpoint-GUID: A0zCH3NQPmxNjOA44ZgM0OpYYfMnCuGl
X-Proofpoint-ORIG-GUID: A0zCH3NQPmxNjOA44ZgM0OpYYfMnCuGl
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=joao.m.martins@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/11/22 16:31, Joao Martins wrote:
> On 7/11/22 15:52, Joao Martins wrote:
>> On 7/11/22 13:56, Igor Mammedov wrote:
>>> On Fri,  1 Jul 2022 17:10:13 +0100
>>> Joao Martins <joao.m.martins@oracle.com> wrote:
>>>
>>>> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
>>>> index a79fa1b6beeb..07025b510540 100644
>>>> --- a/hw/i386/pc.c
>>>> +++ b/hw/i386/pc.c
>>>> @@ -907,6 +907,87 @@ static uint64_t pc_get_cxl_range_end(PCMachineState *pcms)
>>>>      return start;
>>>>  }
>>>>  
>>>> +static hwaddr pc_max_used_gpa(PCMachineState *pcms,
>>>> +                                hwaddr above_4g_mem_start,
>>>> +                                uint64_t pci_hole64_size)
>>>> +{
>>>> +    X86MachineState *x86ms = X86_MACHINE(pcms);
>>>> +
>>>
>>>> +    if (!x86ms->above_4g_mem_size) {
>>>> +        /*
>>>> +         * 32-bit pci hole goes from
>>>> +         * end-of-low-ram (@below_4g_mem_size) to IOAPIC.
>>>> +          */
>>>> +        return IO_APIC_DEFAULT_ADDRESS - 1;
>>>> +    }
>>> this hunk still bothers me (nothing changed wrt v5 issues around it)
>>> issues recap: (
>>>  1. correctness of it
>>>  2. being limited to AMD only, while it seems pretty generic to me
>>>  3. should be a separate patch
>>> )
>>>
>> How about I instead delete this hunk, and only call pc_set_amd_above_4g_mem_start()
>> when there's @above_4g_mem_size ? Like in pc_memory_init() I would instead:
>>
>> if (IS_AMD_CPU(&cpu->env) && x86ms->above_4g_mem_size) {
>>     hwaddr start = x86ms->above_4g_mem_start;
>>
>>     if (pc_max_used_gpa(pcms, start, pci_hole64_size) >= AMD_HT_START) {
>>         pc_set_amd_above_4g_mem_start(pcms, pci_hole64_size);
>>     }
>>     ...
>> }
>>
>> Given that otherwise it is impossible to ever encounter the 1T boundary.
>>
> 
> And while at it I would also remove any unneeded arguments from pc_max_used_gpa(),
> which would turn the function into this:
> 
> +static hwaddr pc_max_used_gpa(uint64_t pci_hole64_size)
> +{
> +    return pc_pci_hole64_start() + pci_hole64_size;
> +}
> 
> I would nuke the added helper if it wasn't for having 2 call sites in this patch.
> 

Full patch diff further below -- after removing pc_max_used_gpa() and made further
cleanups given this code can be much simpler after using this approach.

>> If not ... what other alternative would address your concern?
>>

diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index e178bbc4129c..1ded3faeffe0 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -882,6 +882,62 @@ static uint64_t pc_get_cxl_range_end(PCMachineState *pcms)
     return start;
 }

+/*
+ * AMD systems with an IOMMU have an additional hole close to the
+ * 1Tb, which are special GPAs that cannot be DMA mapped. Depending
+ * on kernel version, VFIO may or may not let you DMA map those ranges.
+ * Starting Linux v5.4 we validate it, and can't create guests on AMD machines
+ * with certain memory sizes. It's also wrong to use those IOVA ranges
+ * in detriment of leading to IOMMU INVALID_DEVICE_REQUEST or worse.
+ * The ranges reserved for Hyper-Transport are:
+ *
+ * FD_0000_0000h - FF_FFFF_FFFFh
+ *
+ * The ranges represent the following:
+ *
+ * Base Address   Top Address  Use
+ *
+ * FD_0000_0000h FD_F7FF_FFFFh Reserved interrupt address space
+ * FD_F800_0000h FD_F8FF_FFFFh Interrupt/EOI IntCtl
+ * FD_F900_0000h FD_F90F_FFFFh Legacy PIC IACK
+ * FD_F910_0000h FD_F91F_FFFFh System Management
+ * FD_F920_0000h FD_FAFF_FFFFh Reserved Page Tables
+ * FD_FB00_0000h FD_FBFF_FFFFh Address Translation
+ * FD_FC00_0000h FD_FDFF_FFFFh I/O Space
+ * FD_FE00_0000h FD_FFFF_FFFFh Configuration
+ * FE_0000_0000h FE_1FFF_FFFFh Extended Configuration/Device Messages
+ * FE_2000_0000h FF_FFFF_FFFFh Reserved
+ *
+ * See AMD IOMMU spec, section 2.1.2 "IOMMU Logical Topology",
+ * Table 3: Special Address Controls (GPA) for more information.
+ */
+#define AMD_HT_START         0xfd00000000UL
+#define AMD_HT_END           0xffffffffffUL
+#define AMD_ABOVE_1TB_START  (AMD_HT_END + 1)
+#define AMD_HT_SIZE          (AMD_ABOVE_1TB_START - AMD_HT_START)
+
+static void pc_set_amd_above_4g_mem_start(PCMachineState *pcms,
+                                          hwaddr maxusedaddr)
+{
+    X86MachineState *x86ms = X86_MACHINE(pcms);
+    hwaddr maxphysaddr;
+
+    /*
+     * Relocating ram-above-4G requires more than TCG_PHYS_ADDR_BITS (40).
+     * So make sure phys-bits is required to be appropriately sized in order
+     * to proceed with the above-4g-region relocation and thus boot.
+     */
+    maxphysaddr = ((hwaddr)1 << X86_CPU(first_cpu)->phys_bits) - 1;
+    if (maxphysaddr < maxusedaddr) {
+        error_report("Address space limit 0x%"PRIx64" < 0x%"PRIx64
+                     " phys-bits too low (%u) cannot avoid AMD HT range",
+                     maxphysaddr, maxusedaddr, X86_CPU(first_cpu)->phys_bits);
+        exit(EXIT_FAILURE);
+    }
+
+    x86ms->above_4g_mem_start = AMD_ABOVE_1TB_START;
+}
+
 void pc_memory_init(PCMachineState *pcms,
                     MemoryRegion *system_memory,
                     MemoryRegion *rom_memory,
@@ -897,6 +953,7 @@ void pc_memory_init(PCMachineState *pcms,
     PCMachineClass *pcmc = PC_MACHINE_GET_CLASS(pcms);
     X86MachineState *x86ms = X86_MACHINE(pcms);
     hwaddr cxl_base, cxl_resv_end = 0;
+    X86CPU *cpu = X86_CPU(first_cpu);

     assert(machine->ram_size == x86ms->below_4g_mem_size +
                                 x86ms->above_4g_mem_size);
@@ -904,6 +961,29 @@ void pc_memory_init(PCMachineState *pcms,
     linux_boot = (machine->kernel_filename != NULL);

     /*
+     * The HyperTransport range close to the 1T boundary is unique to AMD
+     * hosts with IOMMUs enabled. Restrict the ram-above-4g relocation
+     * to above 1T to AMD vCPUs only.
+     */
+    if (IS_AMD_CPU(&cpu->env) && x86ms->above_4g_mem_size) {
+        hwaddr maxusedaddr = pc_pci_hole64_start() + pci_hole64_size;
+
+        /* Bail out if max possible address does not cross HT range */
+        if (maxusedaddr >= AMD_HT_START) {
+            pc_set_amd_above_4g_mem_start(pcms, maxusedaddr);
+        }
+
+        /*
+         * Advertise the HT region if address space covers the reserved
+         * region or if we relocate.
+         */
+        if (x86ms->above_4g_mem_start == AMD_ABOVE_1TB_START ||
+            cpu->phys_bits >= 40) {
+            e820_add_entry(AMD_HT_START, AMD_HT_SIZE, E820_RESERVED);
+        }
+    }
+
+    /*
      * Split single memory region and use aliases to address portions of it,
      * done for backwards compatibility with older qemus.
      */

