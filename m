Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EDF7492974
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Jan 2022 16:13:06 +0100 (CET)
Received: from localhost ([::1]:57150 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9qAS-0004jm-RD
	for lists+qemu-devel@lfdr.de; Tue, 18 Jan 2022 10:13:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48888)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.kanda@oracle.com>)
 id 1n9p1P-00030h-KT
 for qemu-devel@nongnu.org; Tue, 18 Jan 2022 08:59:44 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:23476)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.kanda@oracle.com>)
 id 1n9p16-0001My-OC
 for qemu-devel@nongnu.org; Tue, 18 Jan 2022 08:59:34 -0500
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20IDXevs029428; 
 Tue, 18 Jan 2022 13:59:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=clPqRIhz2mRxVsnQioxh0lKaby0w0oKPKN2GK1DRvlA=;
 b=hmXXWKgYW7Aj2eq7f1ShUDTOHIZXvIGVSS8erTjYCqtYUsmhNGtaNayQf6JfMMGDGNiC
 1/4tdbSkNvmKED4eNnjuaeA56MVLD2cgNsxq7EmzSaPLIAAhq4QwLFtrw6mnzDV6VX6+
 PsDM4h+oO9l8GmpF6UCKxC40RojMAUPunHV4pvEXXbx6oyZsaE5kRmd7Qj1Jihtb682H
 aTSTbqCj5mplLizFehjUo0S6SDLPt7h454YhctArEGFXVIAd/AuZ9HUj+O59k123SWBR
 t77/wx45TovmS2EcOyKj+bdnxPvuDL9LGyTWo1W5o3eMEF8srvLrdlzt24G56WGjkNhr MA== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 3dnc5f1w9g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 18 Jan 2022 13:59:15 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 20IDoqdB141905;
 Tue, 18 Jan 2022 13:59:14 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2041.outbound.protection.outlook.com [104.47.66.41])
 by aserp3030.oracle.com with ESMTP id 3dkmac0hay-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 18 Jan 2022 13:59:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GxeMHG/FdkK8/9ApF8mTYMuYQkwKmYA0nBb0H3d0bVe2xywQ43ICyYnrkZfZMdqc9/IA/9onEuoU0/aj5W1kYvYJKLESfMtFaAfZwjMrWonxSaoUL5Hl/DtM4H4gZ29g4v38FgE85u/9AYguUjTHK9hFnoQHAuazcRynAR165rJY4Eb3maCKwzNG0VDN3rZuqno2mS/HIybAJSq1R54n862qcM7/EPIHFQO0ZdgsIe2E+sG4J4p39O2nNP8RYJNByF216DdYLX/rp6TzlDYLkFL74htc+MPfNTDDs2glx/rMrYcwYCh37NPUdh3TQKfL2FVHpwHEnPGWDXecA1+GYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=clPqRIhz2mRxVsnQioxh0lKaby0w0oKPKN2GK1DRvlA=;
 b=Gii7FC9IAEUJsZIwcDDnrdqzcWeVfOHtKYBdSELA1xeo4oJLxxGf6DA5Ihh74Bs7g0fMVOV6TPN2UR0xsbZzWaqfMEsBCk7UrDJFU8OHh7+jGf2zivplXiOkXeHOYm+wXEbIW1Ix6kH/sUErByn4OGS+YxrmLPISeK2prlrD668cElPSddKzbxQ/BcBluFRDQP6xg5v3SIhGC1aXk0R5sYPmLL6m9gaM1dGHlN6i9Q+PwNyC8C6ipRSMqAvxUvr+kp32QlDBrcAy1A96Ldow2vom420Tku5M7HSO7/r9aA8a2I/8MDK6uarIaAmQpR1QGudmOm5/lUxQsVuZbQZ+9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=clPqRIhz2mRxVsnQioxh0lKaby0w0oKPKN2GK1DRvlA=;
 b=KQbJingRJOTpzKhO1Vfvmy2CQIt+U39YFcX2Snwb3j3dnGk3cloOeITPqfkuzSKCyMG2WNcUjves8lbo6LG6xapgd/myM82DbxRdoyDX0iMxoBCIiyNd5pBVaXwecL5RB0KU4el2Tv0yBGkeRHCNTxydG0cLdM7VzXVqJxO3o8Q=
Received: from SA1PR10MB5841.namprd10.prod.outlook.com (2603:10b6:806:22b::16)
 by CY4PR10MB1271.namprd10.prod.outlook.com (2603:10b6:910:4::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.10; Tue, 18 Jan
 2022 13:59:12 +0000
Received: from SA1PR10MB5841.namprd10.prod.outlook.com
 ([fe80::2511:c3af:9db2:6ba0]) by SA1PR10MB5841.namprd10.prod.outlook.com
 ([fe80::2511:c3af:9db2:6ba0%7]) with mapi id 15.20.4888.013; Tue, 18 Jan 2022
 13:59:12 +0000
Message-ID: <347bc34f-178a-a260-9498-6be627b7537e@oracle.com>
Date: Tue, 18 Jan 2022 07:59:10 -0600
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 1/3] qmp: Support for querying stats
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20211119195153.11815-1-mark.kanda@oracle.com>
 <20211119195153.11815-2-mark.kanda@oracle.com> <Ya+rLex1djU/1Wc1@redhat.com>
 <ee0d6990-06f3-9a1b-f7d5-7c379f0e9773@redhat.com>
 <5b2f4acf-29fb-34fd-eee0-341eec163da7@oracle.com>
 <a39efdf3-82f3-9042-8b53-86394d7aa90d@redhat.com>
 <Yea3+t4qtk4iB9jr@redhat.com>
From: Mark Kanda <mark.kanda@oracle.com>
In-Reply-To: <Yea3+t4qtk4iB9jr@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SA9PR11CA0020.namprd11.prod.outlook.com
 (2603:10b6:806:6e::25) To SA1PR10MB5841.namprd10.prod.outlook.com
 (2603:10b6:806:22b::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ca8a267f-4805-4521-9ca4-08d9da8ab4d8
X-MS-TrafficTypeDiagnostic: CY4PR10MB1271:EE_
X-Microsoft-Antispam-PRVS: <CY4PR10MB1271E90AE7981E6BFE8FF25FF9589@CY4PR10MB1271.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DqG2WvQKCbV6er1Oc+CRK5q+RG7OwACdBA56gW/ItAkUu8/xU5ijH+Dk2DagusLW1Xh3S1zpuPiS1ava2sh2fB37R8Tt/fbGVepAu255U1e9bd6RluWOn+NK7iW670y7LZ4Fw0zguu0u4Y+FlWIFuq++BkW2Yub4Gz8oVa51B31wLD8WvbvYm3E8btO6DySBU4WH24xUamZwU2Mvn0+6N/8a3c8/2IwB5bnNHIqXHpj2IBmUfRazm+Nd6S7x8w1X1RkC5AEsFpNTZIvaAU3mbutXV8idarqyE/Wgtv0ZNW9sqjucRmEzemNKoKtGPhKYSbo8SWupdO1u/cMK1oXhraw74aS+z5xo5vBhm8E6eLp1MYweMtPsasNDjGCS2UoqcUXggth4KCd03Js5rJ2TvnhEXw8mc2vfRG3E5qpfvILxyn7oGbQ+DKxdIvneOhxaalfiyFaYDQuz5Q5YfmKiykUOXxtx1Xmtg7RkVZQVWjN6YfdDZ9aW4N8NZKMzo59ogdvQvURrGuzuIGM7Gw8pXYsrAWoyY27/iXudgR87+Jb/Vey19n0nhT2n1KIeIR0kQby7ay9NC/pnyNGmwtL1OI+/tQhucHoygaL0AiBhHW2BJBiKcD6TqZluhbkOry1FynJ4lGAAe9pZXRq69/2hmTighVLDon9axlRtl3AR6wUU6uZYpbs8/d2Os4niaH02kCgfS4hcw8eiXlDkjEdPJ/NQ3EzryPyyGxf/tZJSaJw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR10MB5841.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(31696002)(5660300002)(44832011)(8676002)(6486002)(38100700002)(26005)(2906002)(66476007)(53546011)(83380400001)(6512007)(66556008)(4326008)(6506007)(8936002)(66946007)(508600001)(2616005)(110136005)(86362001)(31686004)(36756003)(316002)(186003)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UjA3WmFWR3p0QmxGMjMwaHpQY1B1VXhTN2Vyc3dHN3U4QWZUV2REellvR0Q0?=
 =?utf-8?B?b1VJS2gzdnB1aHA0WjJsOGVwZVVRUW5iUWREWmtHbVhaTTAwWE9qajlLbGlG?=
 =?utf-8?B?cUtYQ0NHV0RWNDdkZE0zODk5VUQyNXFzbW8rRWcydmpJbFVnZ2lLTWp4cmhH?=
 =?utf-8?B?TXJrUHd2WkYzckFNMkpCQ1k2NGFjQ3N0aUdoSm10cnZ4NmhFWUQrMjZSMi9Z?=
 =?utf-8?B?SzdEZnZ5K3MyRmxFN1lCTWcwNTUxSUFCWHdWSCt5QlZxaTV3UWJuVHVvSjk4?=
 =?utf-8?B?YWgwTnZobFVXK0t6eHdKVm16eUdXVXhMMG93UmRjVFAxVHVDTVhCRmFoVFlk?=
 =?utf-8?B?dC9vUGVobmJmdHlKbGw4OFlKZFhQZ2RJSU1JTE5ocXdFTjYzVzRuQ1FqZ1A2?=
 =?utf-8?B?bloza3lsb3RQUFV4SlEzUmFrSWF0VzY1NW5KdUEwbXdYbitRVXBQVkt4ZzNm?=
 =?utf-8?B?UnM4RHhOMGs2MVJmOCtuMWhrbHlUa3hJTjdYWTRIRER6Y2I5dXk0TmJoTUdP?=
 =?utf-8?B?YzhIanVybVRZS0FhMStxQTJqb1VWSGh3b1pMMUFMdkFTa2FNazBUUGllcmdC?=
 =?utf-8?B?OThBMkQrQi9ObzZsQ3FteDZta1JtVzlLT0NCYTdpcnJGazZrMkFXL0ZJRlBG?=
 =?utf-8?B?aDlpZXJoQTFDZEcyK01OWnk3bmFyTlJtSFlwVkdaaHpQV0VkWkVmUW1SV1RU?=
 =?utf-8?B?eitRK1NaaENLWjV5blV6eDI3NDBkZW9vN2hrOGtkcGhYb1l6TGV6RzhLbThm?=
 =?utf-8?B?VXNQbDhlVi9KU2QxTnhCb3RTWkIxSzI2bWpaZ2JZYktOa3ZYeG5xMXpHZVpJ?=
 =?utf-8?B?UlNQS3Ixdmp2SllSRUZkY2V6eUxDQkxHNEVPN3BndWxTdmNhNHRsMFlNNGs5?=
 =?utf-8?B?Mk1CcmpDQUhvaEdiOHcrZzAvZENQcllwMXNCWTZ5dlVBMHFBWTdVc1dQc2ov?=
 =?utf-8?B?dnV3VmhyNXU3MW9FekhYYStZZllDL0poN0xpK0pURU5FYUFQVlRSVGR3M1Yz?=
 =?utf-8?B?cElTV0FHbXZSZlExZGhpMWZJZHptb3N2ZnVCaGZtRGlCS0lnR0E1eExmOVY1?=
 =?utf-8?B?ejlMZWFzelhlblcreFYyMFplZXFIdnIxRWdUcUEvUDl4TjIraG9RZXFaRk91?=
 =?utf-8?B?a1hTRUJiWnVUc0dWLzhqUFRMOTIzZUVFR056M3MxZE51Uy9vaEFvZjZhVUI1?=
 =?utf-8?B?UUhiZ2o0alhIYVJ4TjRIRWVMQkIwbEJuWmUxRDB4WVVKbVBTSjVsWkpyZXZ5?=
 =?utf-8?B?cjFyZkNFSUg4OUdxcWJ6SUtGNUZGVTQ0NlU1NEZ5Z0VpMmY1TktNOVRPWFNR?=
 =?utf-8?B?MzNqY1Fyd3VTOFdpelMyaXJWTzIrQS80SVluSFYvNEpWdXA2VmxEKzNOYjFX?=
 =?utf-8?B?SGVsakZyYkpwUXBxeHlaM1pMUHcwTUEyMWRuUXhDeUNCTEZER1FJNjR0NzAy?=
 =?utf-8?B?SkxkMWl3YzhTYXJuL0FIdDlxdnNWN1ZxSEREa0cwMDVKYmxxMWp6d0dmYUh0?=
 =?utf-8?B?Z21ZYzR3a3hySTBsOUVQR0FkWVI2M1d6U2gwbGk5RG1XMUtXVmN0QkRtM3VY?=
 =?utf-8?B?ZDRXZEZBOGVHOGFnZG9Bc2w2YlZZNXdpZTBkaHlkR2pMdGtKZzNQZzdmdWxj?=
 =?utf-8?B?cURkVVRSS0kyNm5jY3lFTlVpUzV0WHFRUTY5bkRiZzlaaW41SFJqb1UvS1Ev?=
 =?utf-8?B?Zmc5ZHhXZE1SVjl5UGJYMGpNOHE0VUErNjNyTGN1SXNxUlBZU0R1UXRlNzZV?=
 =?utf-8?B?TzMxSVluZ1pBRkdtbDVKMWg1Tjk3RXBnL2llNkN0cnN6U1JhdzBnZ2pQcGw3?=
 =?utf-8?B?Y2Z3YW8xNURsOXFuU1RZWVMySEF0RkdqOTJ0OXpXdFM2TEJJVEhmRkRoUVZZ?=
 =?utf-8?B?Ym13QjROVWRTWVAzdnU1MGhIb3hBRGF3eDNtd1VnSzhUNTQzVlNCREQ2K3hI?=
 =?utf-8?B?clpZVCsrcUh3dVhRZHRVc2V4enBqREJUdlBDakJyUVFReE1VR1drWm9mVFZF?=
 =?utf-8?B?VnhwYWR0Yyt2Qkl1WmMrb3JaRHJkTEpBMlVpRk1LWHY3b2NGOFl6K1o3dUow?=
 =?utf-8?B?bm8vdzFLU2o3eWNFZ1F2K29NaUtnWVBrKzBqVXpoMS9SRGllNFQwa2ZNR0hu?=
 =?utf-8?B?UzNNZi9ZT1VyWWxOTGsxV0RWWGJsb3lnNWlUQ294Q2YvZEh3WStNTE1HWmZF?=
 =?utf-8?Q?shpK0WuZ+Dyw3rC+n/hC0Fw=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ca8a267f-4805-4521-9ca4-08d9da8ab4d8
X-MS-Exchange-CrossTenant-AuthSource: SA1PR10MB5841.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2022 13:59:12.5947 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y84cPegl2MPKZPzDr3uMKO+ukNEp0NoOyTO02O7MeWULBhjiWMgR7aNXor2xsYIGvggJMgZm1PMzFgFU7sz3oQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR10MB1271
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10230
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 mlxscore=0 suspectscore=0
 phishscore=0 malwarescore=0 mlxlogscore=999 spamscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2201180085
X-Proofpoint-GUID: Z3TtdLd4Tz3idhI993tkF3cxhEEghyzC
X-Proofpoint-ORIG-GUID: Z3TtdLd4Tz3idhI993tkF3cxhEEghyzC
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=mark.kanda@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: qemu-devel@nongnu.org, armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/18/2022 6:52 AM, Daniel P. Berrangé wrote:
> On Tue, Jan 18, 2022 at 01:26:32PM +0100, Paolo Bonzini wrote:
>> On 1/17/22 16:17, Mark Kanda wrote:
>>>> I agree except that I think this and StatsResults should be unions,
>>>> even if it means running multiple query-stats commands.
>>> IIUC, making StatsResults a union implies the filter is a required
>>> argument (currently it is optional - omitting it dumps all VM and VCPU
>>> stats). Just to confirm - we want the filter to be required?
>> Yeah, I think at least the "kind" (vcpu, vm, perhaps in the future block or
>> net) should be mandatory.  If the caller doesn't know of a "kind", chances
>> are it won't be able to understand what object the stats refer to, for
>> example the vcpu "id" here:
>>
>> { 'union': 'StatsResults',
>>     'base': { 'target': 'StatsTarget', stats: ['StatsResultsEntry'] },
>>     'discriminator': 'target',
>>     'data': { 'vcpu': ['id': 'int'] }
>> }
>>
>> (which is another different between Daniel's proposal and mine; his just
>> placed all vcpus into an array with no explicit id, if I understand
>> correctly).
> An explicit ID isn't strictly required, since the caller can assume
> the results are ordered on CPU ID, so even if they gave a request
> for a sparse subset of CPUs, the results can be interpreted.  None
> the less having a vCPU id included is more friendly, so worth
> having.
>
>
> Regards,
> Daniel
OK. Thank you Daniel and Paolo. I'll implement these changes for v3.

Best regards,
-Mark

