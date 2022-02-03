Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F69A4A8C06
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Feb 2022 19:56:25 +0100 (CET)
Received: from localhost ([::1]:58976 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFhHL-0003c4-Hr
	for lists+qemu-devel@lfdr.de; Thu, 03 Feb 2022 13:56:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43200)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.kanda@oracle.com>)
 id 1nFgz1-0008Va-W7
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 13:37:28 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:47694)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.kanda@oracle.com>)
 id 1nFgyz-0007Mm-9H
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 13:37:27 -0500
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 213HTH6w023216; 
 Thu, 3 Feb 2022 18:37:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=YkSDaeizKNtHNRkHwaatfuBUXDNRoJ0uiE3WF84dzHs=;
 b=bmJjuur738LKQExqZqwE/qAX9G+gexvsmXJZMALqaSqPoGt7WI1vnf/ZDvdtjf1nGQ6m
 ogcQQ0nSn08ZjZ3cWsE3KUS1YrouEstSDVJlhAXtRGUlEYExaAXcnW+/92dNlBfh63Hj
 cBQbFiJMC44oKSMYnyRmyzorAPxJSre2W7oER7xQhn52aKrk+m8u90mGcFvxcW2Hx391
 tOK5wD9imF7KmiMUR85PkcI22go85X2gvc2qr1PK6E/tNY8yRgH6IPEY1MgS6JSUuCzF
 gcGcP3WtIQiQ/rV4QDw86oXhQ0SugqYOK9HYs4mPoBo7KYLdXCRafEJFzddYpLbd1x48 jA== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 3e0hjr0k2q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 03 Feb 2022 18:37:20 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 213IVV8D071016;
 Thu, 3 Feb 2022 18:37:19 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2170.outbound.protection.outlook.com [104.47.58.170])
 by userp3030.oracle.com with ESMTP id 3dvtq5t7h2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 03 Feb 2022 18:37:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NLlVLYnbzXMFUvJDI5LzWOEV2fZ6kFXVXTOPKt3XmzsbQzc7MxdOee5xl+hTmWFaczoSL532tg0bE1wm5K5qiI7SOIgXIc/d/vDM116/JZqKqox5qwRWj1HTJEe4h0Mv9incgWtyCuq4hnvlTtEkYK6PwurOpyFP2y479agYMd+TyXlEIYxjEJ1OTjp9DVtwC2auvVlFYaqDhfkd8g2MvvEwOJOXy0KXlfYRcoTBRIh5us9XI7hMmTlJWVq7/PvkUweELMOmOn/N/vqQ7gWRfHIYh/S69yhsaGNh7N0SULeoQN8s7GVBTwrseqjnsqVKP7c47FZ5SKe5X/ztZOftww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YkSDaeizKNtHNRkHwaatfuBUXDNRoJ0uiE3WF84dzHs=;
 b=IqVjJL1PsAvYCNsYXgjyTe1ZkWVgcRYbs6xGaNx2M5PVs4M63zXKnJjCHYftg1uuGuHrgdqluKUpyt9IEJYCu8h60VR0TRlg00Lyxw4r9GUIriBU2Y1IPGj2gbcW9dgjmHW8oue621wfxXQokR4t6IvuPun7diEEyyb1YxkQjMYp0JsNrZjTAsMW4llQSI420oYMmV2u69mwov3QLbmrl9BvjZle2sDHTgdgDzhkWNrRPZ9pkKTOco+eLgcottwk7IYAR41c0gW5ULOOI1wGGKNSrdmLOiWRVIQtgaIMmD3awRYVFyMNxRxL6xPyVw4Z3eiviVn9mkWRZz2vXyVKNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YkSDaeizKNtHNRkHwaatfuBUXDNRoJ0uiE3WF84dzHs=;
 b=EnQHn1cFMUDnw/qNI/cjleHVo4RhgDxn8LOWCFhLjgOcR70Tr6gAkdi1Tp6ztumNPnui094wqfkbO9HhZSCMdOL0zijMhCymszgFeYZDdIdIMqZngx1FWMF+m81b7ZliLq4HmFarlWcSa0STPJCd2oYiTZU+T1Q2s8I/FYehsHY=
Received: from SA1PR10MB5841.namprd10.prod.outlook.com (2603:10b6:806:22b::16)
 by BYAPR10MB3351.namprd10.prod.outlook.com (2603:10b6:a03:14d::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.18; Thu, 3 Feb
 2022 18:37:16 +0000
Received: from SA1PR10MB5841.namprd10.prod.outlook.com
 ([fe80::58ef:3181:b9d4:b716]) by SA1PR10MB5841.namprd10.prod.outlook.com
 ([fe80::58ef:3181:b9d4:b716%5]) with mapi id 15.20.4951.012; Thu, 3 Feb 2022
 18:37:16 +0000
Message-ID: <29804f37-bb46-e4ef-45ca-a7448c749d66@oracle.com>
Date: Thu, 3 Feb 2022 12:37:14 -0600
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH v3 1/3] qmp: Support for querying stats
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20220131194312.1192626-1-mark.kanda@oracle.com>
 <20220131194312.1192626-2-mark.kanda@oracle.com>
 <YfkiyiK+jfrdbVcY@redhat.com>
 <b111f7a7-ab0c-8944-ec3a-9461eb0e4fb3@oracle.com>
 <YfwfVtWdEovpSSAs@redhat.com>
From: Mark Kanda <mark.kanda@oracle.com>
In-Reply-To: <YfwfVtWdEovpSSAs@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SN6PR16CA0063.namprd16.prod.outlook.com
 (2603:10b6:805:ca::40) To SA1PR10MB5841.namprd10.prod.outlook.com
 (2603:10b6:806:22b::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6cda63c8-9e0d-41ac-4103-08d9e7443405
X-MS-TrafficTypeDiagnostic: BYAPR10MB3351:EE_
X-Microsoft-Antispam-PRVS: <BYAPR10MB3351D452FE3ADE2300D9877DF9289@BYAPR10MB3351.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dJ0uj4JIkaWmsa6lhiuiPOyKzid11gcJBOoQL2HBm+MyN+gns/vigQZ9AnypxRR5BhMxBDK+xrppan14I926KGdn8dpKujaPpwgayvchTEzOBKvZ8nMlWTFKyko7nff3yTtQEagwXDJ7NsD6Ln/Iz6YvRiNF75qHjmcjfU8mSjC34awQ8BffAsibmpetEEqSU9ufQN8Vih5XRT1BPHodvYIJJw6lGZxD0tUXQ/L3hck9u6oZURi4ob9Er/nvrros5oNUuG9CSjJF3flIwft6aRuPGrr96ugPGggMjAIjoFeFo8gNuGWoN93R7otft8B4FGJ2hvUW/4snmIzErgbNv7B7j9xpR1+ioGv0bZy6G1r4/rJBzOSXsUQHCa6BO5xG0Zn+SZQJP1ooccApDHE77ak7YRaQr3ouWrdv25k4UDnFhKpp1aN8fa9wWIl0S2bbDs42vb0EXrLt+TgpkM5gPnk01d4vPju/iNxBT9w4LPKvVB88q9x2dnQ8wrVTvmzlexu1oNi5xG6syv4iqRswJUhOgr5wzI9eGwmRi9SgIZ7EvsaY/amN5/VAjw3v8fc7xcSKe/qv05uusPaKHZHdeBgN8dFwrk96yONnIUiKTGnkiDCaCCC/rN4jzm6eQlyvqMalBvY5PBVG4zS2ehLdVUQb0fqCcSs3hA7kG0yk6HbMh6tVYwpUecCNUnUbu4hRptqTwpM1mUxbRqsFXFqU21PrOxw/Cfoqs3PpsvSnrusLgNECN/d57YbgleFRApvq
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR10MB5841.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(66476007)(8936002)(66556008)(38100700002)(2906002)(6916009)(5660300002)(6512007)(66946007)(6506007)(31686004)(86362001)(316002)(186003)(36756003)(4326008)(44832011)(31696002)(8676002)(6486002)(26005)(508600001)(2616005)(53546011)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b05rVGYrQ0FseUx2RVllV1dpbzZPSHhjaTZ0Vld6WFExQXBlblVXaUhrZWx4?=
 =?utf-8?B?cWJiN3RBWVFGMVphMlJ1RUVJQVIzWnJYTFlhdklnSEl1OXFLR1RreTZVYmg5?=
 =?utf-8?B?eXNhbm1ROEJ1T2dsQkRBbTJyei9XRHJFcnEvc2VIZWtBelNheHZJM2NaN0Z4?=
 =?utf-8?B?TFdTOEVnSzlqQTZjTVc2OU10dnVlbFRyNEw3U0dzUDVCVmtQdjllNHdDWHhH?=
 =?utf-8?B?NDNDb1BFR1lPYjhGd3hNS21wYVkzN25pU3lHT096aGFMVGdFSTZ4anZMdmk3?=
 =?utf-8?B?WmZXaTJNdmNncDB1SVV5YldTL3dTcmVTUUI3ZFZSZ2pUNGJERVdkekk0WU1t?=
 =?utf-8?B?cEVQRmQ0YlUzVktqWE9KZG9lbVZ1U0pGQ0t6ZlNhdGJURE1OeGFhOXdZY1NP?=
 =?utf-8?B?cXMzdXNQVWJMMlR0ZWZMTkQ2Vmh0LzZobEw0YmhMS20xV01GSWxTNFVocSty?=
 =?utf-8?B?dXBpRmp6dFNQNCtsRjM1T0U2b0p4d0xUUEQ1YzJoMi85bTRpVWN5MnprY3pZ?=
 =?utf-8?B?ZHp4ckxZdXBJc3ZPM2FKc3hrNEQzeVE0RXJNWXMwaWtqNjZ4dVU4dGZqTy9i?=
 =?utf-8?B?ZFdRQUlTRlRIZHdNVUVHYTNkMkhQUzEwMmkrT3pOQy9tZ2pPTzdjVUVBVEdp?=
 =?utf-8?B?bGVWRG91Z1ZvM3BuQ1pnL3M1QjQrRTQrdVMwdkR0TDhCSSswSTY4a3ZVZFFU?=
 =?utf-8?B?d0Y5UG4zbXVBRTRKeHdDc2M3OWlCYmx4UDgwQzdtUXp5a0J0TnNtZ21ENHpC?=
 =?utf-8?B?cXk0Unp6VmI0M1Y4YU1xVlU2eEFFcllObmsrcCsxU3JJQ01UM2djZmVtMWEy?=
 =?utf-8?B?WEppeWU1K3RUTzl0OGs3UXF1dTIxaXIyZXAvSGdSZS9VV3RIWUllNmR2ckZ2?=
 =?utf-8?B?VStXKzR5TFh2bXJ6R3JONUpkZzJBNEV4enVEV0tPWUFML2Q4K3pIdUVZUnhy?=
 =?utf-8?B?Y2ZoQ0dSdUxzUE9CVUZEK1ovS2ZXMEtUc3ZoanZKM0w1aGk2Z0dBVEJTNVdm?=
 =?utf-8?B?cnZMTVVLSll1OWMyV0JsWHZaRy9oRmFENmdUYUxMNUNjdWR0ZStNdzlwVWFO?=
 =?utf-8?B?NDJFaUp6QXhmd20yTi9lV2NYQ3IrUThyNGhvTDd1Q1dtYmlFTzZoTHlkZHBD?=
 =?utf-8?B?bjBjVHBEVm5YMnZab3V6NklMRzhRVzNvU3pUUlIyODZzN3Q3RGVLNUtEOHhO?=
 =?utf-8?B?ZVpuQkdQZDhsZ2tzRzdvdjlFaVBxUE55VVVUWGk3N0lHOWQ0eWZqNFNMOWQ2?=
 =?utf-8?B?UjdYM0dISkppSFRPSGlNSTRXa3dvaEp1K3o4MGJjZkI1TitkanlKd0lNYUZk?=
 =?utf-8?B?T0NKSWpUTVE3bWVPOGIvSE1VdmpBOHplVWpTY1IyMG4wNEQxaHF3RHVDemJ4?=
 =?utf-8?B?NVpnY1NheWcvZExQUHZORldNekVyVUhGQU1iVjdhcTU4anErazlqZE5LOVJF?=
 =?utf-8?B?WnFnalMwVit4L0lTSEk5VjV6dU10MnpaTCtHcGVrNjIyUXdERjVkbEZTcFBt?=
 =?utf-8?B?Q1NraXd0VnRzcUlJZVltNzN6cnE4YWRPMWlBUzBRY2NrMEZqc3RONjBmbU95?=
 =?utf-8?B?QTZpMk5pVUYyTmdkSEtDZjJRWHNUeWJ0ZmlHR1ZmRkdOYUo4eGRnc1VXMysw?=
 =?utf-8?B?eE1oY2VTdTJBWVBSYTBtVE0rYkVKcXVnNFIxYUdaTVg2c3RsQnVhS2Fwc0p5?=
 =?utf-8?B?Sk9yRnVmVXpKeHBGNHMzMFZITVNiN09PL2U5S3EreDFHYXl5cmVOWXl4andz?=
 =?utf-8?B?V3hRbEZsOXlMN21TbjFTYW5OUzFDSnFPckRGVm1qYUNLdGl2MzBtNHZqN3E2?=
 =?utf-8?B?a1dYSUl6b1BYYlpWY3Rla29PZmhYRS94RTBDOVlzQzFKajNBSE1XZXZUN1Qw?=
 =?utf-8?B?NVFOTEdWN1E1OWVWdHpPeEtoK1VVU1FmaGNrQzBrdWZ3NjdJdEV4NExrMVB6?=
 =?utf-8?B?d0UweWpYK1MwUzl0aEJZbmNLYk9McDJlS3VCVFNDYXluWTg3WFdPVDNCWk14?=
 =?utf-8?B?TEd3NEoreWl2THpxRUJqRnJTNmJQZGlsdEdYVitSNk9vK1RxS21uU3VISDdL?=
 =?utf-8?B?ZjVXNWs3N3c1bVJHR05KWHVqZTVaZ2FtOVFVRW5MTlZ0UHd0TDVpRUl6NFVS?=
 =?utf-8?B?dzZBY2VlMjlWTy95SkRXcGxYcUxZY1phR0tseWREZUhlS3AvMWJTeXNqOCtY?=
 =?utf-8?Q?2/u1Thucs5cqeAf87YLeL8s=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6cda63c8-9e0d-41ac-4103-08d9e7443405
X-MS-Exchange-CrossTenant-AuthSource: SA1PR10MB5841.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2022 18:37:16.7281 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M3uHRRhD1fqaJh5+e4Mp9MDkcAThvDzYs2ohZ9pCoF8Zf+a4KJi/JeBgXhKb25eshGVSsxYiRaE7nZ0m86GgFQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR10MB3351
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10247
 signatures=673430
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 mlxlogscore=999
 adultscore=0 malwarescore=0 bulkscore=0 suspectscore=0 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202030112
X-Proofpoint-ORIG-GUID: auiXwXu_cduIdsa7IcY-uKhHx4CEaqQk
X-Proofpoint-GUID: auiXwXu_cduIdsa7IcY-uKhHx4CEaqQk
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=mark.kanda@oracle.com; helo=mx0a-00069f02.pphosted.com
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
Cc: pbonzini@redhat.com, qemu-devel@nongnu.org, armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 2/3/2022 12:30 PM, Daniel P. Berrangé wrote:
> On Thu, Feb 03, 2022 at 12:12:57PM -0600, Mark Kanda wrote:
>> Thanks Daniel,
>>
>> On 2/1/2022 6:08 AM, Daniel P. Berrangé wrote:
>>>> +#
>>>> +# Since: 7.0
>>>> +##
>>>> +{ 'enum' : 'StatType',
>>>> +  'data' : [ 'cumulative', 'instant', 'peak',
>>>> +             'linear-hist', 'log-hist', 'unknown' ] }
>>> IMHO 'unknown' shouldn't exist at all.
>>>
>> I added the 'unknown' member here (and in other enums) to handle situations
>> where QEMU is behind KVM in terms of enumerating the various stat types,
>> units, etc. I feel this will be a semi-common scenario (old QEMU on a new
>> kernel) and with 'unknown', QEMU can at least display the raw data.
>>
>> That said, I happy skip 'unknown' entries if you think that's better.
> Yep, I don't think we should be including 'unknown' stuff.
>
> An application could use this, and then we add support for the
> new type and the application will now break with new QEMU because
> it is presented in QMP in a different way.
>
> The same for the 'unknown' base and unit too for that matter.
>

Sounds good. I'll implement the other changes you suggested in v4.

Thanks/regards,
-Mark

