Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FB294B52F6
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Feb 2022 15:18:00 +0100 (CET)
Received: from localhost ([::1]:55492 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJcAw-0005S8-If
	for lists+qemu-devel@lfdr.de; Mon, 14 Feb 2022 09:17:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59464)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1nJbFr-00082U-O4
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 08:19:01 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:8844)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1nJbFj-0003Ba-Me
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 08:18:59 -0500
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21EAOY5K021606; 
 Mon, 14 Feb 2022 13:18:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=8zpEfYwOiG+g7XxMosIzK/q9RmqP1MYy6Mz0aryTtUI=;
 b=kahr68iuQIRsH98AfLiVyQNBi9bhpdJ3rnpUiJD36XjkDjLqGCzKOnQ0aFlqpa01rELR
 67YYXb4v8ustQ2QnyaXfIYsxYYPx37LkWGpRAUzHiV/8qpXqqdZJLm3ee5NZxU7lxQYL
 uRYn5tefpka+gSe3zKkEIJIYQzL0KJ5IVHtbU6AUqdCw210fjdRyY/Y4AgUvKxP39ne4
 7Aj/81oFUEcIstSEWTlYZC2ooD4q0F5fCvNRsLF/sNPiMNU7H7nUa6lcfBLa0sZZQhHt
 u4Cizs4GSkXwhGN218VncRsjVyiW1rFGcsowELM0vqyLd0Z9NwqBB9Oi5U1nleI2v3YO 1A== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 3e63p24h4h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 14 Feb 2022 13:18:45 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 21EDAQZn075842;
 Mon, 14 Feb 2022 13:18:44 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2040.outbound.protection.outlook.com [104.47.66.40])
 by aserp3030.oracle.com with ESMTP id 3e62xd386j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 14 Feb 2022 13:18:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GD+pVZFnPtHUCs2uS2urRyxENsdd4Wc4Jp6lBAdgaFHOcy7+7zRhLdLdhNn8E503cNZeboM159inTiQp1T4OfOgCZQM1RQOGWqjB3iZT85xYN3w5mET932HMQ5KiTUuM/W5MF0KsrYd4hLl3wT4NaKvPeANRqq+nhsr6iR2jF09QWOFoLnJEWOuFC3VHpnoDOxU+1StQpes2LlLRbAs2lebWoJ0BUFl8f6xyAfztsi+zDqPURJwyEu/yljqfm0gdQrygBrfhV1oNLvA1Qiv/OyHWtzuoKeTZqZmx/uKGGh7bSkLIVwU72ctZm+tmig2Q+v2vPx+d9oKVR3TjaVhmzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8zpEfYwOiG+g7XxMosIzK/q9RmqP1MYy6Mz0aryTtUI=;
 b=FW6zb0xkdsnxUsjfSy0dH/A3VSOkKDXx9wmlYvaNwbQg9nLVacCtws9OGsXb39PNiOtVzQF82H9VF+ZkZvEG1lhsS7jlm/LOzprFVRKX2blTcxoCfz779HqR3TJVHTuXX83lx5/iZ9ZgcCZgL3RcGA8FGO73rU5Dqbu4AkijNFWqlhvxMC/p2GW07ytmKULyrAi+bUYXay10b/8wSITTgGYNmhIajGc9/N/w8qW2VyW75laGp5rK72I+zuyXd/44uaodBXTsIEtvZ8Qi2Na3aaGfp1ZiVtzsZVl62bgKzUrHlK/trTJi78hMDmytRmT94B7Eiz3WaS6o8Y4vjuSxiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8zpEfYwOiG+g7XxMosIzK/q9RmqP1MYy6Mz0aryTtUI=;
 b=nXm+MT3SCmCOXx6v8kHONPvhsIz+FXQwXhyRE883+2PPsqRCyVlVoosKOROfXNuYVLnGdc3OrdJqHbn1rG0yrSijfmT+YmoqX/MoEiuL09VOIxvlOEeh0N/uOa4zWXU41+6KtgEOScv72ZBxsVoRV9W6vFiwJk5sREnQ06OaNTE=
Received: from BLAPR10MB4835.namprd10.prod.outlook.com (2603:10b6:208:331::11)
 by SJ0PR10MB5717.namprd10.prod.outlook.com (2603:10b6:a03:3ec::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12; Mon, 14 Feb
 2022 13:18:41 +0000
Received: from BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::4910:964a:4156:242a]) by BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::4910:964a:4156:242a%5]) with mapi id 15.20.4975.019; Mon, 14 Feb 2022
 13:18:41 +0000
Message-ID: <a038eac1-376f-8ecf-234c-400b408762eb@oracle.com>
Date: Mon, 14 Feb 2022 13:18:32 +0000
Subject: Re: [PATCH RFCv2 3/4] i386/pc: warn if phys-bits is too low
Content-Language: en-US
To: David Edmondson <david.edmondson@oracle.com>
References: <20220207202422.31582-1-joao.m.martins@oracle.com>
 <20220207202422.31582-4-joao.m.martins@oracle.com>
 <cuno839pp1h.fsf@oracle.com>
From: Joao Martins <joao.m.martins@oracle.com>
In-Reply-To: <cuno839pp1h.fsf@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM0PR02CA0206.eurprd02.prod.outlook.com
 (2603:10a6:20b:28f::13) To BLAPR10MB4835.namprd10.prod.outlook.com
 (2603:10b6:208:331::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ecb5f78b-30f2-49c5-41fc-08d9efbc84c3
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5717:EE_
X-Microsoft-Antispam-PRVS: <SJ0PR10MB571753DFAC6D1DBABA2431B8BB339@SJ0PR10MB5717.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3826;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jaKZgSM5X4zhHnbsQ/mSc/yHMDuAkfAbuNfuZONuiuL9fni/rbAjb1Yn2YIz+gQ8S6mv4Cy5TyfrdWWikQMZc5laU3XAT3/Ea02KHbq0tlsGrmpTz6f7s//nNCpntbE3OG3I84ZZ4PwXZy36o6022AQ5z/n01AG30AVZLiKPiWTvrkoancHtAw2pQAtkH385MDqxofOk1y/hNzwMGcgZrNdcDpvVN9CenOX9xUTSUWQi7MA2vJ9zqK5jon0DlyFrdgLiBWwr2yXJc8HBzJEIKwjYGvks7TvenCqEzgypF16YyG0HExQdfaIr77MNWL+GQzVHYssXHHoYhYDlnHphdDzyVzImOTnEXZXl1ESyCzejlkylZD1tact9lN4LbzNmu/J7ZNVvPy3IrVHT9+6sFLDly/CaxpyZ8e3fEVpzPyU2RsdCLY7JgSn5raaQxS6/jZaRsnMXVKyPv0xAdL7aueUAThCkeNQcxDH4ZBp3IBmoBEO9R+bpO8BrIU10p/A/pPHLzmRyZ8tZSlFQxW8Ef3U+dXSMYW1yBI1CyC7YFWImc+lg7hWsXvYKfGgREuBoNwYyVGGZAcS8/apLG49sEH9LOZiaDeWhV0+bUSHvjHiicLNU5w5wefuP7Cc9adYOciD1PvoQ0FP0nA1N5SJdLi4Nd6GMb8i8TayxJUh4gR7lQRXxlIGgtx341UtdOIBr9zsKqKJsXMPJKm8breRTrQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BLAPR10MB4835.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(37006003)(6636002)(2906002)(31686004)(36756003)(66556008)(6512007)(508600001)(83380400001)(53546011)(86362001)(2616005)(54906003)(6506007)(66476007)(6862004)(66946007)(4326008)(8676002)(8936002)(38100700002)(316002)(31696002)(5660300002)(26005)(186003)(6486002)(6666004)(7416002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TTlZZHVaTmZxdzFHTkY2ZTRjeUJuYlR0ZkgzdXZKWmdNS0t1Y3pVMU9SQ01K?=
 =?utf-8?B?ZG9pUFhJOCt6NFF6cGhMSGRhVkNZeFN5eEVZTFN3WjVhb05FN2pLZEwzKzVa?=
 =?utf-8?B?VkNSLzloamgvb1o0V1hVRjJ4TVF5MU9JMkpyWGlFaXZnUWlqZG5GTHM3M1BD?=
 =?utf-8?B?dnRibW5zeS9pU28yZTZldWJuWGVoZklKUzhrb0RnRzBNVCsrTzArTTIza0ht?=
 =?utf-8?B?OEV4cDlyUnZwV3hBMkV6SkN1M3ZGejJZOWZxU3hIN0ZmT2dNMTArdE1Wd1hn?=
 =?utf-8?B?V0U1U05pMDhLVy9xQXR5eFNFUUkwcGRSQlNLK1h5Wk93MkVKRzd1SUdRT2NY?=
 =?utf-8?B?UzBqRXA5TE43cTZ3eEtNY1dETjc4bkpKZ3p1WjhqUmU4cTh4d3ZRdGw3NkZh?=
 =?utf-8?B?aktuU3JmQy9NazZVWkNFYjhCaGpvSFhVclBXRUpyYlZrT29GUmdJR25EUWYr?=
 =?utf-8?B?Vmg4U2ZGSGIwQng5V0t4YW9uSnNjaURwaGpVQjlaRFZYbDRvVXJKaitwRXp3?=
 =?utf-8?B?UTFlYWhEVW91Q2w5aTNaNW5JZ1NjOG9CZElacFhtUE5NNnVaeWFheVMrWjlN?=
 =?utf-8?B?TTh1bFF4eldWR1M3SFliSkJiSWs3NlRTdzFLVzI4WGNQa2U3RFNDamJWZWdw?=
 =?utf-8?B?WFpYWUN5V29DNXlwUU1KU2szS0pyNTJMc3Y0aUtkMVIxOVdLa1hpMlJTNCs4?=
 =?utf-8?B?K3VQMERuaEJicG1ZZHIxZ1BxVFRxMENORktvZ2lBbXFCWHY0QitRYmdPem5L?=
 =?utf-8?B?emJqKzA1VWY3bTB0cDRBblJPTmN4cDNKM0I0Q25Ocnp0NEYvd0laNzk3Z2Vt?=
 =?utf-8?B?a1JvUEZnd3J0TUhBODQ1TmxwamNMN1ZTL0lGZWlRdEVVUzA1RVdMbXIrdnJ5?=
 =?utf-8?B?azJLeTdvSURwQXFZOElodkJBelRkZHZ3Z0RGeDV2NFN0YmtiS0hNcExOS0xD?=
 =?utf-8?B?MHhUd0FIQlVEK2lzRDl0c0hVclhNOW1pNnZRdWRjR2dRa0F1dFlUM0Q0SzdJ?=
 =?utf-8?B?N1R4YWE4WHR6MjhiS0J0UjA4aTIrVEQxUGhSS25TWEt2eCtFaHFlQmlFM0NO?=
 =?utf-8?B?V0oya1NPa3Fkai94TzUyQ052ZVdaUUtGbVdkbjkvOUlCY2QvVUFvSUI0NExN?=
 =?utf-8?B?aGVkZ2ZVN2RjbzA4bEkwUmtyNmc2WStJVURLZXJTbmZvNDE4b0xPR0pUcTA3?=
 =?utf-8?B?TjRET0Z5ZU9kQTArMlM2RERHTGxQQk4vVmFmemtpbmVrREV4Q0xoOEhhK2N4?=
 =?utf-8?B?bVhENFR1c01LaHBjVTM3MDVCRzBkYmRVeEZFNFBhdWFBRkMvQWZCc3BTT1Rj?=
 =?utf-8?B?TmdrQ2JJcWNkakVxL21PRzZaa3hPVVBQQjlndWNTMmNGNDhwdDJ2YkFnd0hD?=
 =?utf-8?B?ZGM3WHNhQTU3TzRJdFk2UXd6YzdqR2FvSmkxamhTSzFuTFJ5RDl0VmlEaDFB?=
 =?utf-8?B?S29WeEs0UEd4RXprbmtHbW9Jb3hYN1lBbXZVUWVRZTVuWTFmQTFKdUtYNXBa?=
 =?utf-8?B?R3VkL2xTcWt5SUNOTVM1eS9oZEF3bUYyUzM2T1ZTTzJwNnJveXF6L3FENEVs?=
 =?utf-8?B?Zmdxb3NxdHRsZkx1VGdraE9NVHJtMTlSSUFxczE1Rm5RL0V3dGJ5OHB5Tk1a?=
 =?utf-8?B?WFUzWkk3SmFVUXZsQ1hDcVloRjNMZ2xxWlk4QnR2ZGZpOVNDWmMxTDdaNkRm?=
 =?utf-8?B?bmhzVXYwRVFMSkRRak91akpGRFllNjJNdEp0Vm54SElQZ09PWms5Y3d0OUQ1?=
 =?utf-8?B?eXNBVmsvS3RaM3d0clNyRWJnNUhXd2RZaFcwclRFUTBwL2ZKV3lZVTBsMStm?=
 =?utf-8?B?bk1DMjAyVlh5V05FVEwwZnR0Tm85UEpFOHpNNlBMQmlqcTU1RFNNOG84NWNT?=
 =?utf-8?B?a053Q1AvZ2k2WWFJbzJJS3dCWjhXbTM2UU5EeU5CMFpJWmZFM09mZXZ6ajd1?=
 =?utf-8?B?SGpQSkdvaDZCYXFBMDl0ZUpNY3MxWkQvN01DWUlkK0dkdUllbDQyb0lHK3FS?=
 =?utf-8?B?cGJ0UjBqcXVpNUtYOGEyNFZwbFhQZDNPdmlkcy9RR2tqck1SckNVSnRuRjhm?=
 =?utf-8?B?cnNZUlRoM3MvUFdJdG1VYkh1TS9FZVNKdytaUmVpbHFKeWdiYjQ0a3RsM082?=
 =?utf-8?B?S2xWbjhBVFphR3F1eGlIa3FFaEtxSlNTS2JNNkVrTlNuK3p1SlZYUmFUZFZB?=
 =?utf-8?B?MlZobFpLU2o2bmo0UlN2a2EvdE9uQ3BxL3cvdTZjbzROa2dNckNDTEhObVI4?=
 =?utf-8?B?WWdXVlVhMmQzSUgzVHZsamQ5aldBPT0=?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ecb5f78b-30f2-49c5-41fc-08d9efbc84c3
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB4835.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2022 13:18:41.3507 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gCJnlqNH5Uug2g2PQci8mdYT8SUgc/C8z3TMw3TXCKl0lh+tJMo2Nj9CAt1AmIQuwlqpaQUCDMjQiAwsfJ1hE27qBE99Jvrs9uqs3LbkBbg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB5717
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10257
 signatures=673431
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 phishscore=0 bulkscore=0
 malwarescore=0 adultscore=0 spamscore=0 mlxlogscore=999 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2202140081
X-Proofpoint-ORIG-GUID: m1Tw_F_akyDAjc80bz0dsdIicYpyKNht
X-Proofpoint-GUID: m1Tw_F_akyDAjc80bz0dsdIicYpyKNht
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
 Alex Williamson <alex.williamson@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Igor Mammedov <imammedo@redhat.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/14/22 13:15, David Edmondson wrote:
> On Monday, 2022-02-07 at 20:24:21 GMT, Joao Martins wrote:
> 
>> Default phys-bits on Qemu is TCG_PHYS_BITS (40) which is enough
>> to address 1Tb (0xff ffff ffff). On AMD platforms, if a
>> ram-above-4g relocation happens and the CPU wasn't configured
>> with a big enough phys-bits, warn the user. There isn't a
>> catastrophic failure exactly, the guest will still boot, but
>> most likely won't be able to use more than ~4G of RAM.
>>
>> Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
>> ---
>>  hw/i386/pc.c | 7 +++++++
>>  1 file changed, 7 insertions(+)
>>
>> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
>> index b060aedd38f3..f8712eb8427e 100644
>> --- a/hw/i386/pc.c
>> +++ b/hw/i386/pc.c
>> @@ -842,6 +842,7 @@ static void relocate_4g(MachineState *machine, PCMachineState *pcms)
>>      X86MachineState *x86ms = X86_MACHINE(pcms);
>>      ram_addr_t device_mem_size = 0;
>>      uint32_t eax, vendor[3];
>> +    hwaddr maxphysaddr;
>>
>>      host_cpuid(0x0, 0, &eax, &vendor[0], &vendor[2], &vendor[1]);
>>      if (!IS_AMD_VENDOR(vendor)) {
>> @@ -858,6 +859,12 @@ static void relocate_4g(MachineState *machine, PCMachineState *pcms)
>>          return;
>>      }
>>
>> +    maxphysaddr = ((hwaddr)1 << X86_CPU(first_cpu)->phys_bits) - 1;
>> +    if (maxphysaddr < AMD_ABOVE_1TB_START)
> 
> Braces around the block are required, I believe.
> 
Hmmm, my distration sorry about that -- checkpatch.pl wasn't so keen on warn me.

>> +        warn_report("Relocated RAM above 4G to start at %lu "
> 
> Should use PRIu64?
> 
Yeap, will do.

>> +                    "phys-bits too low (%u)",
>> +                    AMD_ABOVE_1TB_START, X86_CPU(first_cpu)->phys_bits);
>> +
>>      x86ms->above_4g_mem_start = AMD_ABOVE_1TB_START;
> 
> And a real nit - until above_4g_mem_start is modified, the number of
> phys_bits is fine, so I would have put the warning after the assignment.
> 
Good point. I'll reverse the order.

Thanks!
	Joao

