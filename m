Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 10B364C2817
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Feb 2022 10:32:02 +0100 (CET)
Received: from localhost ([::1]:52902 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNATh-0003iu-5Q
	for lists+qemu-devel@lfdr.de; Thu, 24 Feb 2022 04:32:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53126)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1nNAQ0-0000eN-4c
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 04:28:12 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:28332)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1nNAPw-0006UW-6R
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 04:28:11 -0500
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21O7iNjE006516; 
 Thu, 24 Feb 2022 09:28:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=jsTlLLrarlaqlLWAcqlQI23c193jfhlOPu15hpsTZdg=;
 b=uqj3ySKfKt+oygpYEvs7k/q1t2hNPoY8VKAYYPobYjBv1Ady93s/EaAIWZY9IL4hr5B2
 pQrczwB7xm3Xw8Cs7OlSsPXnauRgz4Lr5BFQLA7+GpdQLEBA32BYM89WXFQmO48tqtUg
 YnudPzovQUNU64bPVpJxeoYYcc+VeJXM1AKHo6W1qFxcjA42POxQvj08kU7HvTrOiVLU
 0RHgC7VszyXdWVFMWgVSHAwMGYc5t4IVMANmYswSC5fWXtQRYCXH/KCy6cSvErZscwBW
 Vqf3+H+PSQZvAgL2n5seXShNIyZWz13W14dHBztFg0DJ7bd5rvd/P9r/B1Ngv28PeQfk gA== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 3ecv6exngp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 24 Feb 2022 09:28:03 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 21O9GpZl084895;
 Thu, 24 Feb 2022 09:28:03 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2049.outbound.protection.outlook.com [104.47.66.49])
 by aserp3020.oracle.com with ESMTP id 3eb483bdew-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 24 Feb 2022 09:28:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G7NmLZTiMhmSr5qRusen5p+wMskE3Qi+cNRlytWvD1TmvGlSj8GwTVlgrSTtIvhviBWtsmEWzIrF00EP0TJkBVTW83C2wHIDVN22flTIyScIvY3joqfZchG2DxOgqP1ZwDNwEku3cI61DV1fJ/522B8Sdgxw358vlujYB2MnBpOvR+X+YZ9ppWsogyXJuAGz35WBMaKsorW7DbswQ5m1VN4Gv1ZeOG6v+g0DyR15nOfo90nJa/N3AwUPzf611/HcaPysMqxixOzuszwf7/o65Pb9olh+Abp3NTL+GuHJsXIn7f+kwAMvJdpfPlJPNH5O/e8MyC0JlVTG4e4PwwmwCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jsTlLLrarlaqlLWAcqlQI23c193jfhlOPu15hpsTZdg=;
 b=i9JfIJzgQ3UaH61Tw1zSnr9zYYjYFOu0yQqEKmIQ+8yzbS5zkytIF70jT1qMFu303LyYzoB9aeXNmvemN82bhd21crzfgehE7fzgw3lL4O0Iqt7+9o4Askjk9EVhSrgJWwoHCOs3k2vj9YnBLZmb5McJqSg+hbx8ohL8QuNP6MoUxNfA+C61uIpKjubExUvp3kTH5C13HLrHzXe+wrixgWWKY2mEaLoHHdLPvm8umP4m7x5jY15jBrpCToKnCMIXG3NGPOOnW/ZZu2oBfZYusQ9d5l9RCCw3jO61xPXWh4W1hhSYImEVaGNJtkJxz/elWmIWXhAdD3IWE/yp2lVUGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jsTlLLrarlaqlLWAcqlQI23c193jfhlOPu15hpsTZdg=;
 b=ywWMYwl6tjHahihfjoSn35ozo7LFslr66oWxYoV4VNtf8c3MO/IbXhXOzrXbIrzQhI750Aq40iCasIkdgbmT44xhX+OGTSlEHT4RXjkxOETe0xZeSedIgtQ6vztUv8cr76SIcXbNNDRqAuO8lJDIywNu923YakHxmySs5xhqbTs=
Received: from BLAPR10MB4835.namprd10.prod.outlook.com (2603:10b6:208:331::11)
 by BN6PR10MB1587.namprd10.prod.outlook.com (2603:10b6:404:47::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.21; Thu, 24 Feb
 2022 09:28:00 +0000
Received: from BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::750f:bf1d:1599:3406]) by BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::750f:bf1d:1599:3406%6]) with mapi id 15.20.5017.024; Thu, 24 Feb 2022
 09:28:00 +0000
Message-ID: <4f19ae0b-3b74-d099-0dfe-19ad9ff32d47@oracle.com>
Date: Thu, 24 Feb 2022 09:27:53 +0000
Subject: Re: [PATCH RFCv2 3/4] i386/pc: warn if phys-bits is too low
Content-Language: en-US
To: Igor Mammedov <imammedo@redhat.com>
References: <20220207202422.31582-1-joao.m.martins@oracle.com>
 <20220207202422.31582-4-joao.m.martins@oracle.com>
 <20220214160325.62b6436d@redhat.com>
 <f627c202-5281-affb-c439-ea394c3ab70a@oracle.com>
 <04efb316-e231-7abd-0eb6-5b0241afd5f2@oracle.com>
 <20220224100138.0ddab7b9@redhat.com>
From: Joao Martins <joao.m.martins@oracle.com>
In-Reply-To: <20220224100138.0ddab7b9@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM9P195CA0018.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:20b:21f::23) To BLAPR10MB4835.namprd10.prod.outlook.com
 (2603:10b6:208:331::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a1d3d56a-8400-427c-d732-08d9f777f2f6
X-MS-TrafficTypeDiagnostic: BN6PR10MB1587:EE_
X-Microsoft-Antispam-PRVS: <BN6PR10MB1587AF81CD7DB033061D88B2BB3D9@BN6PR10MB1587.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OiIywDZ0tqBeK0sSftWvw0NAQ5JTRaIXn+YLq2UtDLGpn6rCkXVFqcvuHf08/VNtcd8BxG+zG1Iit09Ber+phXZjsxXUkYSrYjkGLeBbkcIbJNoiiutHR86Qijbyx1XddL8kU6m0Jb2Hffo5mKr4blliB1SavzDAFDcLtO0X2NScGnHAuBROCGOBU9ybT3ISPQ4IgI+JiuKTdmr0+gADIRs2HdE5oYzTuwhT/dM6kRLnduiuQrVzbv/jkjFuUT0GvLf7aETYnPrgetWGyOUzkhfct2+9O5n1S6Emm32CFjoriJptjBbERVPUO1KCa51I15OXVSSuPB5bQ2czZfR8GfyZf+VW5oIh/lbec1ESZspgBr7j6199pCu/oQAM5+ujQDNHQymjWPUEPpOflKYdjyByzdqwTZtcmFxARGmN7nSwIGhdBuicRxpTFuzgMvDSEioNf7Fd+ZMah/uv9sgjLPgCZ5Q3Oolj2CI7GCEFPxPImaPP0hetDdC5QdEM9H0DvZ89fdE660wBZg5fWUSH1D6zJ18yRkkWcK5TMncmfBW6/MQXfguTp/9xI3ykuRIxyhTbFmYjWwnVLC1MPUZ/HkNUj20kZ/HiyS6PVO2CPFYXbx/WfGW1EjBvMrLWW9mBTCOfALOlLl6nsiJ9f4xeWjxyja+/UUFww1lXGflC9W+eD72GPno+OOi/4UyH2+zUEfyTphkUWv/fGZW3Ufyjgw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BLAPR10MB4835.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(31696002)(186003)(54906003)(6512007)(6506007)(26005)(316002)(83380400001)(6666004)(6916009)(86362001)(53546011)(508600001)(2616005)(31686004)(2906002)(66946007)(66476007)(66556008)(8936002)(5660300002)(36756003)(38100700002)(6486002)(8676002)(4326008)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K2dPdVkyMnNuWm91RVJWcWlxQXVYb01tUkQxNG1rdm1PRldJS2xCckZnZkpF?=
 =?utf-8?B?cXlETmdUMTBzV29jM1lMMWpsQVBkeEF3eEFOYlpxVWhma3l3YTk0VGVRTHFa?=
 =?utf-8?B?bFRiMTZONmV4bzdzclpPRHhBL2NxUVVvZExwR2VkMXhtNW1sMkdDNTRNTVhk?=
 =?utf-8?B?ZXA0dmFRNUtZckthWURleHJJMmVxSExNMlllS0tTeCtIUEo3WTNncmJYVVhM?=
 =?utf-8?B?U2xhcGVhQnhLM1BzMHNQNFduZEVhL0JieE1SVEh0MGlVWWZrRDMyeEhPYVdu?=
 =?utf-8?B?TGNaSkVnZDdvdzVld0pBVWxmSUs0cTdVVHVGZVdvKzdvQVQyVWtTdUpwcmh1?=
 =?utf-8?B?a1I1Y1FyZ0lCakYwVnhLWkVmU1VoeHB1eGtPMU1GclBGT1pVY0s1RXNlcXpr?=
 =?utf-8?B?RlpWaVpPM3pIM2hwSzNtTkFwUjNvOVRPQmZEdlFWR3dicGExQnVoS1pmaTNz?=
 =?utf-8?B?ZlhOTVhrajFGbGpVMWxvZWs4cHF2QTJpaHdpM3BSdkEyQi9Kb1JXMnY2aU5V?=
 =?utf-8?B?VGRLc1lxT2hlWFRhSjNvNE1tRG5BcVpuZVhPT3hEWWlTeUFCUld5cGRqUGpz?=
 =?utf-8?B?UU5LOU5BWis4cHYvM2JHWXM5MUlUU3F6Z2YrZkRHZFM0dEdxT3VYSHdTYk12?=
 =?utf-8?B?UElRNExINW5INGMrYjM3UWJJTEV4d1ozWklkSlRldTRkd0NGK3dNaHhjVEdE?=
 =?utf-8?B?WHRFQVBmVWZXMUFkajhXYjZ4MkhZZnNpNHRVdDRvS0U3TUI3THBkMmRURXVC?=
 =?utf-8?B?b20xMEJDOTFERUhSd0pYYjNCYjNvQXNtYVdGYzlYQzNzTGt6dDFSVUVHbW01?=
 =?utf-8?B?LzlpRzI3eTQ5YnM5UzBHS0JjRGtFZW41MDVvb1JQQ0JKK05hSXhGVDd6MVJZ?=
 =?utf-8?B?dWx0QlJpZnpYREhDd1BxVEVvblE0Z2tZN3g1NjE0M1dvQ3RlckxBei9McFNm?=
 =?utf-8?B?cVpDaGUzdG9xeVBjNUZ0TTZ2ZkhzRTZVYlg3ai9xVjRERnVDOXkvdzJ2cTMy?=
 =?utf-8?B?b0hlVFZjc09hdGdaOGdBSWQ4Q2tIWHRVbFFJbHhNejdLblZGejAwQU50WTNH?=
 =?utf-8?B?Nm1ZalBodEtyWi90V2FaY2pXM3UvWWh0ejhVNUJBVEJpZWllVHRPY0FSS1hp?=
 =?utf-8?B?RkNmZm9GdzhCeTR1c2tITFliaEZNL1RuOVNRVGNYbnF1ZDRRK3JPaU04WjZi?=
 =?utf-8?B?TmxhY1kyWGsvelFlMk0xckFYemxyNlY4WTRUMFJPYlNJOGMzNmtQdzFxM2tR?=
 =?utf-8?B?MGVrNVB1UTlWNEhIQWY4T0d6KzhEQWo0TTV6ODJzWkVMMU9pc0dvclJQam5P?=
 =?utf-8?B?MDk3elR0QmY0ZC9rK1F6dkxuS3Bhd3JPWDVIWlZKdXQ1VVN5SlgrWTI1RXc4?=
 =?utf-8?B?a0p5aUFYTEtlNkJzeWhxWGJva2RXY1VudkRUdlpqajkxODZKRFkzWDdGbHd5?=
 =?utf-8?B?QmQ3U0prSGl5MGlCbVJEbkVBd0RZQWdqTm9tbmRiWDg4WEc4M0VPU2JSNUxU?=
 =?utf-8?B?R0dxSDAwTkgvMEkrVnFDNU5JdFBiMkFqRityNm5ETzQvSUxLVG1WYWhsRUxi?=
 =?utf-8?B?dnpNQjBUbjlUUFNhUUt2V1NxaThUMHM3UVZrd1VTVVNmanBzM041Z3l2anlp?=
 =?utf-8?B?N0loVDZCZkRpbklKRkd6ZHJCNW5XYkR0a2hjNWh2OEIzMEJLaGo4WWlyN3l1?=
 =?utf-8?B?YzEwY0VpZ2NDTkkwcTkrOHhWNWlBcXphTUxmN3Rja3Z0dXVOWEVMaUpYYjl2?=
 =?utf-8?B?WEJrajUwYlZoaytqakNhZjJJdmM4OTlLSytMTUk0SEo3cXIvMWxiR0hpOGxK?=
 =?utf-8?B?RjU0K1Q5UldVZ1laVVhtQS91NzF0Y1d2T3NOSGlNZlcvTTBxU0FxTy9mYW53?=
 =?utf-8?B?SFVBL3J2RUhYVXJoOG8xY0xhQVc4WWJGVjkvK3M5L3hkMGcra0x4OUF2MVVs?=
 =?utf-8?B?cWI0MFBDeXZ6REVHSmt4VTFya2krL0V5SFJaOEMzdkc3S014TzJETi9oOXBu?=
 =?utf-8?B?bmd5K0RsRjlZUkVsNm1McVY2S3kwY2djUzFnSmVJZ2pqS3F4OXh3Z2s2cS9T?=
 =?utf-8?B?ZWtvRE9NQlhuQ0U0b0FnOWtPNzNpOHZocUVxRjhBTzBvVDBxc1pkSnRCUVVH?=
 =?utf-8?B?UGJ2SEZCSzQ4bmY5U2tPKzVDdGNKVEc0VDVPa1ZCMjJhTlM2QzhQTEJvTXov?=
 =?utf-8?B?MloxVUpKUjRZMmZselNyKzB4RUorMTVMMEwvRzVTRjVXTTJ5SXBoaDJGbFpG?=
 =?utf-8?B?Y1lBblpjakgzVllMN005WFJFQnl3PT0=?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a1d3d56a-8400-427c-d732-08d9f777f2f6
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB4835.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2022 09:28:00.1411 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4V+eOvECFvxUOz6YDh2IVji08MLAerFIn1o+3vYIarrKQNOUd5apPEUNOqBueNk2Cyx2QHmOZS/JV22rC/dS5jt5rpp/ty7jiUzYKpgOu2o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR10MB1587
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10267
 signatures=681306
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 malwarescore=0
 mlxlogscore=999 adultscore=0 bulkscore=0 phishscore=0 suspectscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202240055
X-Proofpoint-GUID: vmv9L-fGO1RtA4GLpGEDlluwzXGCLcrH
X-Proofpoint-ORIG-GUID: vmv9L-fGO1RtA4GLpGEDlluwzXGCLcrH
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=joao.m.martins@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Daniel Jordan <daniel.m.jordan@oracle.com>,
 David Edmondson <david.edmondson@oracle.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
 Ani Sinha <ani@anisinha.ca>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/24/22 09:01, Igor Mammedov wrote:
> On Wed, 23 Feb 2022 17:18:55 +0000
> Joao Martins <joao.m.martins@oracle.com> wrote:
> 
>> On 2/14/22 15:18, Joao Martins wrote:
>>> On 2/14/22 15:03, Igor Mammedov wrote:  
>>>> On Mon,  7 Feb 2022 20:24:21 +0000
>>>> Joao Martins <joao.m.martins@oracle.com> wrote:
>>>>  
>>>>> Default phys-bits on Qemu is TCG_PHYS_BITS (40) which is enough
>>>>> to address 1Tb (0xff ffff ffff). On AMD platforms, if a
>>>>> ram-above-4g relocation happens and the CPU wasn't configured
>>>>> with a big enough phys-bits, warn the user. There isn't a
>>>>> catastrophic failure exactly, the guest will still boot, but
>>>>> most likely won't be able to use more than ~4G of RAM.  
>>>>
>>>> how 'unable to use" would manifest?
>>>> It might be better to prevent QEMU startup with broken setup (CLI)
>>>> rather then letting guest run and trying to figure out what's
>>>> going wrong when users start to complain. 
>>>>  
>>> Sounds better to be conservative here.
>>>
>>> I will change from warn_report() to error_report()
>>> and exit.
>>>   
>>
>> I was running through x86_64 qtests prior to submission
>> and it seems that the inclusion of a pci_hole64_size in
>> the check added by this patch would break tests if we were
>> to error out. So far, I'm keeping it as a warning over
>> compatibility concerns, not limited these 5 test failures
>> below. Let me know otherwise if you disagree, or if you
>> prefer another way.
> 
> can you check what exactly breaks tests?
> 
The test prematuralely fails with the above check that.

And on a second look, the problem is obvious. Essentially, I
am not handling the 32-bit case correctly :(

I will revert back what I submitted in v3 to be an error_report()
and exit() and will restrict this 64-bit only (i.e. for memory above-4g)

qemu-system-x86_64: Address space above 4G at 100000000-100000000 phys-bits too low (32)
qemu-system-x86_64: Address space above 4G at 100000000-100000000 phys-bits too low (32)
qemu-system-x86_64: Address space above 4G at 100000000-100000000 phys-bits too low (32)
# child process (/x86/cpuid/parsing-plus-minus/subprocess [188634]) stderr:
"qemu-system-x86_64: warning: Ambiguous CPU model string. Don't mix both \"-mce\" and
\"mce=on\"\nqemu-system-x86_64: warning: Ambiguous CPU model string. Don't mix both
\"+cx8\" and \"cx8=off\"\nqemu-system-x86_64: warning: Compatibility of ambiguous CPU
model strings won't be kept on future QEMU versions\nqemu-system-x86_64: Address space
above 4G at 100000000-180000000 phys-bits too low (32)\nBroken pipe\n"
qemu-system-x86_64: Address space above 4G at 100000000-180000000 phys-bits too low (32)

>> Summary of Failures:
>>
>>  1/56 qemu:qtest+qtest-x86_64 / qtest-x86_64/qom-test               ERROR           0.07s
>>   killed by signal 6 SIGABRT
>>  4/56 qemu:qtest+qtest-x86_64 / qtest-x86_64/test-hmp               ERROR           0.07s
>>   killed by signal 6 SIGABRT
>>  7/56 qemu:qtest+qtest-x86_64 / qtest-x86_64/boot-serial-test       ERROR           0.07s
>>   killed by signal 6 SIGABRT
>> 44/56 qemu:qtest+qtest-x86_64 / qtest-x86_64/test-x86-cpuid-compat  ERROR           0.09s
>>   killed by signal 6 SIGABRT
>> 45/56 qemu:qtest+qtest-x86_64 / qtest-x86_64/numa-test              ERROR           0.17s
>>   killed by signal 6 SIGABRT
>>
> 

