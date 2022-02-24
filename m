Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F32E4C368D
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Feb 2022 21:08:55 +0100 (CET)
Received: from localhost ([::1]:44324 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNKQ2-0008FU-7D
	for lists+qemu-devel@lfdr.de; Thu, 24 Feb 2022 15:08:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43232)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1nNKMX-00038i-Rk
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 15:05:18 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:38422)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1nNKMT-0000oA-N1
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 15:05:16 -0500
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21OJiTUb013957; 
 Thu, 24 Feb 2022 20:05:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=egF+IfruwprmSI2n0TyVsinFit0Mo59PaX5ykmcfPMA=;
 b=SmnMeZHCkPOb9D8GaD8SMuQjNOz2Rf2zo+ANaTnZddkJofFbd0Z/Y33xJTORIM5AKSJG
 yRnVNopKejZs0NjkGn54OuB+SP04BlcRsbdAW5vIWVBFd47IfHi5LjcEUI8YLPMhdDZK
 Z8c3bDIxlEi3l1UwXnyez+ywdp09QwVLfXZkA/cuHYVSfxTFBJpxpM8slacivCqoE9Pp
 oBu9P4uH8qx4H+bfIV9VoEYTzctjTY92Ccb5Rd0sp6E5ByqfwVTjF8bD9auoZ+00DFs5
 MyeVMKNYLcSahGpBJxbBQXzg7l63U9BWEu5OgojPkeDsVv8rhGww1UfirP4378LICss7 Hw== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 3ect3cr7ua-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 24 Feb 2022 20:05:02 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 21OJkZTC180217;
 Thu, 24 Feb 2022 20:05:01 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2103.outbound.protection.outlook.com [104.47.55.103])
 by aserp3020.oracle.com with ESMTP id 3eb4842axm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 24 Feb 2022 20:05:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YsNby3Wp5C8HDhDW7D8pFEeGrj3vxvUmO/90X4vZM8X/hKL4cqvr2L/ls4WMSKtRsvJ26t9y5Jqvn8l8h7kV11EvjbwmLMASKBOOE31nTGm5+JiQkfZxKK021+9v88rxbMC3n7T/rxSCRXnInAWnQDTJQASD6j54ATDm3/dLdiTnwwvEo8Whgxpa5Kw2u/z0PwXXg4ufMS/RCa2vm9ROwmEfXN6LdQHb/8rjvS9WYywaGNhgrx9SpJ8k2wggWmvowiJd8CjxEpa1GYShH/11cHBs7+DNR9HglVl3uqwlFg/49KiUKJ1hTxaw3Xe+9xYOmJOYUEyRZC9cDS3GEBRt/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=egF+IfruwprmSI2n0TyVsinFit0Mo59PaX5ykmcfPMA=;
 b=eAIDWECNTBocsFGCAKoUwE20icrgPgRrJio/qzDaUaWtY/FITa0MfMYrIzT17BmgQe2kntx9rZz1M6yk0gl9XNmOe4zk5kNpOmPNGH1w0AX+WEF5+jOUi3BUUgpTKxyHJEu1E7gArkvc8H4yCvNSACvyo3JbO/ssdq+bRl/zO1ldslvK1Sjqc3jAGRw+iaMRe5GCN7zD3u4Z2WDvMi8ki650s/4ZGGZyYKbZ5aV9VQc2hEh2THpmUMWZ9j/Y2lO+qwBk6NU3qLB2bUGdeg/zTr7hJRUq/7YBsvHfrP06qqXfBNbiaHhOh/beZgDOLGJAGTFUtWQu6OdcdBvvNBd79A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=egF+IfruwprmSI2n0TyVsinFit0Mo59PaX5ykmcfPMA=;
 b=OYfjdHDIOxhW35NFJof/1+EOkOhxxK+oD80atsLIAwydlJzE3Hbl883cqXh6RzYGvpc6JFjUk+jinm5WtdqMjf7c7ZUNS0OZ10p0xwZt5n95AZC0Z6GdBA4KhVZ5Nh+mtwUWWebl9CXQaSLEhBYk2pvY2FpQkBquCjzYyukEkq8=
Received: from BLAPR10MB4835.namprd10.prod.outlook.com (2603:10b6:208:331::11)
 by BY5PR10MB4131.namprd10.prod.outlook.com (2603:10b6:a03:206::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.21; Thu, 24 Feb
 2022 20:04:58 +0000
Received: from BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::750f:bf1d:1599:3406]) by BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::750f:bf1d:1599:3406%6]) with mapi id 15.20.5017.024; Thu, 24 Feb 2022
 20:04:58 +0000
Message-ID: <37df5f3a-283a-a016-311f-8281bbacda19@oracle.com>
Date: Thu, 24 Feb 2022 20:04:48 +0000
Subject: Re: [PATCH v3 4/6] i386/pc: relocate 4g start to 1T where applicable
Content-Language: en-US
To: "Michael S. Tsirkin" <mst@redhat.com>
References: <20220223184455.9057-1-joao.m.martins@oracle.com>
 <20220223184455.9057-5-joao.m.martins@oracle.com>
 <20220223161744-mutt-send-email-mst@kernel.org>
 <5fee0e05-e4d1-712b-9ad1-f009aba431ea@oracle.com>
 <c28ade30-fbea-4d3a-3b11-356c02abaabb@oracle.com>
 <20220224122146-mutt-send-email-mst@kernel.org>
 <7afb8caf-5c98-d6db-d3e5-6e08b2832d57@oracle.com>
 <20220224131607-mutt-send-email-mst@kernel.org>
 <f19dd8be-f923-fd7d-c54d-a54fd775dcc5@oracle.com>
 <20220224144800-mutt-send-email-mst@kernel.org>
From: Joao Martins <joao.m.martins@oracle.com>
In-Reply-To: <20220224144800-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM0PR04CA0006.eurprd04.prod.outlook.com
 (2603:10a6:208:122::19) To BLAPR10MB4835.namprd10.prod.outlook.com
 (2603:10b6:208:331::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d5bb14ba-71a8-4359-8d79-08d9f7d0eedd
X-MS-TrafficTypeDiagnostic: BY5PR10MB4131:EE_
X-Microsoft-Antispam-PRVS: <BY5PR10MB4131D71CEAC0066D1C61C441BB3D9@BY5PR10MB4131.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JhjterXonaxJERL6nZKuV7qEcMBhS1nckt/wIFX9DR53RpKc2DER/bWA7/Deevf32aX0O844gmpyAF8fhtA/OzbTVWTWtxx+dLwUAGOK3tU7rZQtkGDMRJpPKyVQZeaWEKy8NuMlMo79duv8mS5UGZklwi2dMZYG82g4MY+QSeVkZLdAUO0LUs5o7sd3BkHx9DND1EZmYYLQej4nfIr+tstNw+vJkow0ZrQ7zP9mbYTYLg4cVmD9WCTDW6KT7iKzKKXQLNtc6MpSQmCXRzNAuNgTFFD2ugHQ5qD0MLfXeACeI2NiT4EriLOX+le9GHITfNd0wi06TIZgYne0xIhg4weMufzZek+oBbuL/8CGOAHaTliHJzMQl/IyVzBwi9c0rvcySTbPecuBLQxbXch8+in72ZffqjTBej6QDi5pqLLno1lsWzr5/hkJLBH4l3WEJzJafB4FaB+dbct7THaalqA+p5S4WHzRGMd7zHoyLyqDSSn9F45MgOdxCGmlXV5IdenQ859JCIYn1l/V+69j6S/yKa4s9IEU6n+SylddygRrbukkcktzcXRnaA8LQVHSQuTGpp9lrEg4/8P7kepxWn+PXpz/6RWmGq0+fpMdsXH0tiAdc/6cENlooid+ePL8N2LKlxmJO6R0GgI+AG7EsPVH+kMWKbyzWLl/eZ/udJl7o47IX1lghJFla45KS/i7XsC9QaDBzxdrTypINRK51g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BLAPR10MB4835.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(31696002)(86362001)(38100700002)(36756003)(6666004)(66946007)(316002)(66556008)(31686004)(8936002)(8676002)(4326008)(66476007)(6506007)(53546011)(83380400001)(54906003)(6486002)(2906002)(508600001)(7416002)(5660300002)(6916009)(6512007)(2616005)(26005)(186003)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T1ZrRmcrMkMxUlBQWDR5OTVTaW03Y1pxYlBvd2RsQWx2NUM5a2hNcER3Z0wx?=
 =?utf-8?B?R0tBb3NrNTlCSUUrVCtXUWJRVkZwYlRGVW04Vll5cUd2ZndZaHFVS1BKaDNp?=
 =?utf-8?B?RFhjMXNVRHBhZGo3Y1o5clg5M2h2OFlFcjNVT2svUmt5OWswRmd1ZjF0UHYz?=
 =?utf-8?B?MHUwcXpDR01QWVFPMWlSMURUZ0FENXF6NEc4eXFFdnBLZnE5Y29yK3c1V0Qy?=
 =?utf-8?B?ckkwTTZiakQwcDlCd2krcmhVY2RsWVlVTjc2RnVhRy80ekNUUHBQSElMVUhj?=
 =?utf-8?B?WXJFeWlXMjRaaWlJMzgwRGk1czFCVmpjWXpPUnh4aThNWnpXTXp5MGlDSndL?=
 =?utf-8?B?NzJubmZXK0pvRnZ5U2MyZnNFSVBHcDFjVGhBeUdOc2RWOU9iNG1Ya0huUmNN?=
 =?utf-8?B?R2xnL1d5OEdyWGdwZmoyaEM4SDNJeXFGcW42Q0VPY1IxeVMwU0VtcGUrVXpa?=
 =?utf-8?B?QnJZS1RrU21PeWkyWVZ0UU5ERGFVUUVOYmJZRUlPVkRuZmJCbUJ6RU1CQXVu?=
 =?utf-8?B?ZU81SDZ6Y2hUTmNXMWc3WXIyUlhSUS84WkF1RVRGYmhZL0FWWEdEbHBHNGE2?=
 =?utf-8?B?MTcvWW1pZFZIb0lGckQ3MEVSNnVJcGNkaUJvYkdTUGVSZ3ZSdys4czRoQXQ2?=
 =?utf-8?B?dXQrYndwYU1xRWhLblVKa3VMMndpaXcwaTJUbUlDQTFEdjN4eUEzTG5pdThH?=
 =?utf-8?B?ck1CUHlpakJzbnRjdmF5VDBrbEx4QmJjeTN2dFNLUk44Z21zQmJBWmphK1RG?=
 =?utf-8?B?U2VRVVR4T3NxbWNRSnNkV2paOUxOMXpRWTJGcjZSK3JKL0ZTK1JKc3lZOVR1?=
 =?utf-8?B?dHdHeEZaUDRYckVtQWJOYWpMUDdTV05RZFVoUWNIOE0rZ3RkV1NZbVhaK0JV?=
 =?utf-8?B?L0VvN0NaZVR2MDFYUzFrVUY0SFQxT3VkTUVIeW5acEZMS0xobE95cC9CejBq?=
 =?utf-8?B?Ty9tL1dnOVVCSEhNTFNnV2NucHpjaHpPMFFTMVVVRXpjazZyaUxtamdlMG5R?=
 =?utf-8?B?bk1TRlVYNWtrbEV6R2pFNGF0RnE3RFowcXI3S2VTRGtua1ZuYUI1eVNJbnNT?=
 =?utf-8?B?ZlhQR2tpalZTOWRJd0hKa29Pd3JYa1Z1K05aVGJzRzJKRWo0RGhmQ0tqd2ZX?=
 =?utf-8?B?WlBjQmVFeUUxN2wwY2Q5NlgwaWcxUkpjenRJZjBERDVVNWxhZVQ4WCtxS0tY?=
 =?utf-8?B?MnVvUjBOTmhjaStJUmxLZ1dNNDRzS3Z2T3g4SFFVZEpMN2JWN2hQdlpGSFVH?=
 =?utf-8?B?YS96eWtvcEpUbWtrZ0hEOWpaUmdYWHpGUS9ORDl5N0hvVW9aUkdMS1pUTmFW?=
 =?utf-8?B?YUxhS3dlVmxhTVZGSU1KU0VxYTdvUC9BdEhTM0R6a0RhY2U2M0JUZUNHektT?=
 =?utf-8?B?L1BGbXZHTkZaaEJSTzF4Tm0rNkZQT3BDSjQrcjY3eTE2bmFpcFI2UDZUZExn?=
 =?utf-8?B?S1AvTVZUNUhnRmZZYmdWY0p3L0hjNEZ2Z01uVHBaazZTMjVEcm1xSGNjcjJn?=
 =?utf-8?B?T3U2YVgzVFJyd3YyNWM5SzNoOElUcjdpVWJLRFJlQmIwdjZnMlNZUVN2cDIr?=
 =?utf-8?B?M0VnU0xHdUsweVMreEJnMUNVUTZBZE9LRzZISFJxMC9JKzRJYWl0VVlYbHBq?=
 =?utf-8?B?TE4zcWJpWXdkZWs2MTJFcWF3R1hDRm9uNlYzd0txcWJtOUs0WE1QMUU3akdP?=
 =?utf-8?B?Z0F6UHdtNXkzM0pPWW5DQktFZVJSblIwaGxubVNsQ0RjSnpiVnRxTkFDaFhj?=
 =?utf-8?B?MXZsUUVKdW1kV2lZTmFzbERZZmtVU0ZwejF6bzV3Wkh1SWI3anMvTmlWM3py?=
 =?utf-8?B?VEx0Z05kUGMyTG1USTZTMHNuNXl0MWlNdjNHcjBLUGVlQ2hMWWpTMW5iM0x0?=
 =?utf-8?B?YjBsR0pacHh5VkRpN3VZZ3d1ZDlxMzBKUGEwdEozNTdXSnVvZk1WakFVWmtu?=
 =?utf-8?B?NXBsWGZmQTYxR2ViSUFrL3ZUTzhHRE5DbmRhVjlhUHJjYStpWDJvK0dodkJJ?=
 =?utf-8?B?UGhjREJQeXFqQ3ZYTlo0SjJaLzBIUmlrbGUvZWJlUWRyVm9HTlZqMVZsNDNq?=
 =?utf-8?B?VXI5M1FKWWhTMlRLU3RDajdmOU5xdkZKZ0RWd1RYL2pXZG1MMGs0OHY5K1ZI?=
 =?utf-8?B?cXVpaXZ1Yyt2TTd4N01mOFlaMTJpSWtjR2hIZEN4d2dxVTlGTGNQdFNMRmxx?=
 =?utf-8?B?Zm4zVGorS0wwSktKRTkxdTN3WFlVOGRaWWQ5Nm45bFlMWUVuNXI4RGlhbmkv?=
 =?utf-8?Q?n4sEPOiH3+xcPsiVMHhu0xTivpCU8adrOrozVmVN90=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d5bb14ba-71a8-4359-8d79-08d9f7d0eedd
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB4835.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2022 20:04:58.4519 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: erCKv60MBawHbuSCxnclsZyI5yfFZbtGd/dbeakyaHyZij7YsBpXMbNC3ShcB2MB8cfaiO+dpkHSe4T4q+D9nOTE9LtkcFd2mHR0kZknkRA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4131
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10268
 signatures=684655
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 malwarescore=0
 mlxlogscore=999 adultscore=0 bulkscore=0 phishscore=0 suspectscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202240110
X-Proofpoint-ORIG-GUID: M5UQLVNw6FWvY_EBCQDlo1LaHUj7pWGa
X-Proofpoint-GUID: M5UQLVNw6FWvY_EBCQDlo1LaHUj7pWGa
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=joao.m.martins@oracle.com; helo=mx0a-00069f02.pphosted.com
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Daniel Jordan <daniel.m.jordan@oracle.com>,
 David Edmondson <david.edmondson@oracle.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Igor Mammedov <imammedo@redhat.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 2/24/22 19:54, Michael S. Tsirkin wrote:
> On Thu, Feb 24, 2022 at 07:44:26PM +0000, Joao Martins wrote:
>> On 2/24/22 18:30, Michael S. Tsirkin wrote:
>>> On Thu, Feb 24, 2022 at 05:54:58PM +0000, Joao Martins wrote:
>>>> On 2/24/22 17:23, Michael S. Tsirkin wrote:
>>>>> On Thu, Feb 24, 2022 at 04:07:22PM +0000, Joao Martins wrote:
>>>>>> On 2/23/22 23:35, Joao Martins wrote:
>>>>>>> On 2/23/22 21:22, Michael S. Tsirkin wrote:
>>>>>>>>> +static void x86_update_above_4g_mem_start(PCMachineState *pcms,
>>>>>>>>> +                                          uint64_t pci_hole64_size)
>>>>>>>>> +{
>>>>>>>>> +    X86MachineState *x86ms = X86_MACHINE(pcms);
>>>>>>>>> +    uint32_t eax, vendor[3];
>>>>>>>>> +
>>>>>>>>> +    host_cpuid(0x0, 0, &eax, &vendor[0], &vendor[2], &vendor[1]);
>>>>>>>>> +    if (!IS_AMD_VENDOR(vendor)) {
>>>>>>>>> +        return;
>>>>>>>>> +    }
>>>>>>>>
>>>>>>>> Wait a sec, should this actually be tying things to the host CPU ID?
>>>>>>>> It's really about what we present to the guest though,
>>>>>>>> isn't it?
>>>>>>>
>>>>>>> It was the easier catch all to use cpuid without going into
>>>>>>> Linux UAPI specifics. But it doesn't have to tie in there, it is only
>>>>>>> for systems with an IOMMU present.
>>>>>>>
>>>>>>>> Also, can't we tie this to whether the AMD IOMMU is present?
>>>>>>>>
>>>>>>> I think so, I can add that. Something like a amd_iommu_exists() helper
>>>>>>> in util/vfio-helpers.c which checks if there's any sysfs child entries
>>>>>>> that start with ivhd in /sys/class/iommu/. Given that this HT region is
>>>>>>> hardcoded in iommu reserved regions since >=4.11 (to latest) I don't think it's
>>>>>>> even worth checking the range exists in:
>>>>>>>
>>>>>>> 	/sys/kernel/iommu_groups/0/reserved_regions
>>>>>>>
>>>>>>> (Also that sysfs ABI is >= 4.11 only)
>>>>>>
>>>>>> Here's what I have staged in local tree, to address your comment.
>>>>>>
>>>>>> Naturally the first chunk is what's affected by this patch the rest is a
>>>>>> precedessor patch to introduce qemu_amd_iommu_is_present(). Seems to pass
>>>>>> all the tests and what not.
>>>>>>
>>>>>> I am not entirely sure this is the right place to put such a helper, open
>>>>>> to suggestions. wrt to the naming of the helper, I tried to follow the rest
>>>>>> of the file's style.
>>>>>>
>>>>>> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
>>>>>> index a9be5d33a291..2ea4430d5dcc 100644
>>>>>> --- a/hw/i386/pc.c
>>>>>> +++ b/hw/i386/pc.c
>>>>>> @@ -868,10 +868,8 @@ static void x86_update_above_4g_mem_start(PCMachineState *pcms,
>>>>>>                                            uint64_t pci_hole64_size)
>>>>>>  {
>>>>>>      X86MachineState *x86ms = X86_MACHINE(pcms);
>>>>>> -    uint32_t eax, vendor[3];
>>>>>>
>>>>>> -    host_cpuid(0x0, 0, &eax, &vendor[0], &vendor[2], &vendor[1]);
>>>>>> -    if (!IS_AMD_VENDOR(vendor)) {
>>>>>> +    if (!qemu_amd_iommu_is_present()) {
>>>>>>          return;
>>>>>>      }
>>>>>>
>>>>>> diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
>>>>>> index 7bcce3bceb0f..eb4ea071ecec 100644
>>>>>> --- a/include/qemu/osdep.h
>>>>>> +++ b/include/qemu/osdep.h
>>>>>> @@ -637,6 +637,15 @@ char *qemu_get_host_name(Error **errp);
>>>>>>   */
>>>>>>  size_t qemu_get_host_physmem(void);
>>>>>>
>>>>>> +/**
>>>>>> + * qemu_amd_iommu_is_present:
>>>>>> + *
>>>>>> + * Operating system agnostic way of querying if an AMD IOMMU
>>>>>> + * is present.
>>>>>> + *
>>>>>> + */
>>>>>> +bool qemu_amd_iommu_is_present(void);
>>>>>> +
>>>>>>  /*
>>>>>>   * Toggle write/execute on the pages marked MAP_JIT
>>>>>>   * for the current thread.
>>>>>> diff --git a/util/oslib-posix.c b/util/oslib-posix.c
>>>>>> index f2be7321c59f..54cef21217c4 100644
>>>>>> --- a/util/oslib-posix.c
>>>>>> +++ b/util/oslib-posix.c
>>>>>> @@ -982,3 +982,32 @@ size_t qemu_get_host_physmem(void)
>>>>>>  #endif
>>>>>>      return 0;
>>>>>>  }
>>>>>> +
>>>>>> +bool qemu_amd_iommu_is_present(void)
>>>>>> +{
>>>>>> +    bool found = false;
>>>>>> +#ifdef CONFIG_LINUX
>>>>>> +    struct dirent *entry;
>>>>>> +    char *path;
>>>>>> +    DIR *dir;
>>>>>> +
>>>>>> +    path = g_strdup_printf("/sys/class/iommu");
>>>>>> +    dir = opendir(path);
>>>>>> +    if (!dir) {
>>>>>> +        g_free(path);
>>>>>> +        return found;
>>>>>> +    }
>>>>>> +
>>>>>> +    do {
>>>>>> +            entry = readdir(dir);
>>>>>> +            if (entry && !strncmp(entry->d_name, "ivhd", 4)) {
>>>>>> +                found = true;
>>>>>> +                break;
>>>>>> +            }
>>>>>> +    } while (entry);
>>>>>> +
>>>>>> +    g_free(path);
>>>>>> +    closedir(dir);
>>>>>> +#endif
>>>>>> +    return found;
>>>>>> +}
>>>>>
>>>>> why are we checking whether an AMD IOMMU is present
>>>>> on the host? 
>>>>> Isn't what we care about whether it's
>>>>> present in the VM? What we are reserving after all
>>>>> is a range of GPAs, not actual host PA's ...
>>>>>
>>>> Right.
>>>>
>>>> But any DMA map done by VFIO/IOMMU using those GPA ranges will fail,
>>>> and so we need to not map that portion of address space entirely
>>>> and use some other portion of the GPA-space. This has to
>>>> do with host IOMMU which is where the DMA mapping of guest PA takes
>>>> place. So, if you do not have an host IOMMU, you can't
>>>> service guest DMA/PCIe services via VFIO through the host IOMMU, therefore you
>>>> don't need this problem.
>>>>
>>>> Whether one uses a guest IOMMU or not does not affect the result,
>>>> it would be more of a case of mimicking real hardware not fixing
>>>> the issue of this series.
>>>
>>>
>>> Hmm okay ... my first reaction was to say let's put it under VFIO then.
>>> And ideally move the logic reporting reserved ranges there too.
>>> However, I think vdpa has the same issue too.
>>> CC Jason for an opinion.
>>
>> It does have the same problem.
>>
>> This is not specific to VFIO, it's to anything that uses the iommu.
> 
> Right. Most VMs don't use the host IOMMU though ;) It's unfortunate
> that we don't have a global "enable-vfio" flag since vfio devices
> can be hot-plugged. I think this is not the first time we wanted
> something like this, right Alex?
> 
>> It's
>> just that VFIO doesn't let you shoot in the foot :)
>>
>> vDPA would need to validate iova ranges as well to prevent mapping on
>> reserved IOVAs similar to commit 9b77e5c7984 ("vfio/type1: check dma
>> map request is within a valid iova range"). Now you could argue that
>> it's an IOMMU core problem, maybe.
>>
>> But I this as a separate problem,
>> because regardless of said validation, your guest provisioning
>> is still going to fail for guests with >=1010G of max GPA and even if
>> it doesn't fail you shouldn't be letting it DMA map those in the first
>> place (e.g. you could see spurious INVALID_DEVICE_REQUEST fault events
>> from IOMMU if DMA is attempted over the first megabyte of that 1T hole).
> 
> I wonder what's the status on a system without an IOMMU.
> 
In theory you should be OK. Also it's worth keeping in mind that AMD machines
with >=1T have this 12G hole marked as Reserved, so even DMA at last when CPU
is the initiator should be fine on worst case scenario.

>>> Also, some concerns
>>> - I think this changes memory layout for working VMs not using VFIO.
>>>   Better preserve the old layout for old machine types?
>>>
>> Oh definitely, and I do that in this series. See the last commit, and
>> in the past it was also a machine-property exposed to userspace.
>> Otherwise I would be breaking (badly) compat/migration.
>>
>> I would like to emphasize that these memory layout changes are *exclusive* and
>> *only* for hosts on AMD with guests memory being bigger than ~950G-~1010G.
>> It's not every guest, but a fairly limited subset of big-memory guests that
>> are not the norm.
>>
>> Albeit the phys-bits property errors might gives us a bit more trouble, so
>> it might help being more conservative.
>>
>>> - You mention the phys bits issue very briefly, and it's pretty
>>>   concerning.  Do we maybe want to also disable the work around if phys
>>>   bits is too small? 
>>
>> We are doing that here (well, v4), as suggested by Igor. Note that in this series
>> it's a warning, but v4 I have it as an error and with the 32-bit issues that
>> I found through qtest.
>>
>> I share the same concern as you over making this an error because of compatibility.
>> Perhaps, we could go back to the previous version and turn back into a warning and
>> additionally even disabling the relocation all together. Or if desired even
>> depending on a machine-property to enable it.
> 
> I would be inclined to disable the relocation. And maybe block vfio? I'm
> not 100% sure about that last one, but this can be a vfio decision to
> make.
> 
I don't see this as a VFIO problem (VFIO is actually being a good citizen and doing the
right thing :)). From my perspective this fix is also useful to vDPA (which we also care),
and thus will also let us avoid DMA mapping in these GPA ranges.

The reason I mention VFIO in cover letter is that it's one visible UAPI change that
users will notice that suddenly their 1TB+ VMs break.

>>> Also, we'd need to test a bunch of old
>>>   guests to see what happens. Which guests were tested? 
>>>
>> Do you envision that old guests would run (or care) into this sort of 1TB config? Mainly
>> testing more modern guests on Linux (>= 4.14) over this last set of versions, and in the
>> past Windows 2012+. Let me be extra extra pedantic on this part for the next submission
>> (and report back if something odd happens).
> 
> Not 100% sure but let's at least document.
> 

