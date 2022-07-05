Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB3E856769C
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jul 2022 20:37:41 +0200 (CEST)
Received: from localhost ([::1]:53340 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8nQa-0004jh-B4
	for lists+qemu-devel@lfdr.de; Tue, 05 Jul 2022 14:37:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37672)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1o8nE6-0007RX-EI
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 14:24:46 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:56692)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1o8nE4-0001tr-Nr
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 14:24:46 -0400
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 265HESah002722;
 Tue, 5 Jul 2022 18:24:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 from : subject : to : cc : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=124fXIk9IwRq/sz+zdbIDDMoVgzsBKxqwzLKJnkeKVA=;
 b=vJaeKt10Ud59Jjc1ukfgZtUC96/S9hF3QCrm5XxRWLDOLsq2nqpZvW1n+HTR4TGca510
 xmYuRbLFMyJZWB4vce6YHfCSE9rzs/fGP2jjR8pRdeV7LMtgRXJq9XfU3WdSaQAQT521
 P013+hetGYtOuldaDUnhx0TWEuT7bcp4eKLrZjBDiHPZpSlx5vlfUYm4JWjLigli9Kxv
 BZWKpO1cymEXsbfOAxSs8zhzYiIQC1lBtAbrQYacOd84wao3ICo6E/WGocaIwW7S6J8Z
 GakV/yhLXuKl4DuvSOVAa0DP73ZzmeWhRRsKl2by3f1mV043gZtVGqYHbuF/vrwVzmOU DQ== 
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3h2dmsxwu0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 05 Jul 2022 18:24:30 +0000
Received: from pps.filterd
 (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 265IBGna004759; Tue, 5 Jul 2022 18:24:30 GMT
Received: from nam04-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam04lp2040.outbound.protection.outlook.com [104.47.74.40])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id
 3h2cf2kp1e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 05 Jul 2022 18:24:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wi2gHpJTqLAXfOOUOu0N3nCmy+TQmbr6QhHqlsM/hOcKSZMI/WsRN1XM5lOpLYQchN3Ru09xVOwwWjmaP6d1Ffa+IJSwvF/z34kelKK/nNiq60zLo/uKVUsdO5Gun7fLdEPQplUzQSKyG0AOc0Wb2DNKBW29rVRcdFBHAoFICsY3sZAMeqDludEGB78c/keUUUGKuhHVDc1Pvem850wehQ/3PhwgM4BncV8rcy/SuG00ieMwHvjyZ4yiH7wKIgxJXXsI5DQAmEJphcekNESt9A8QpRdCV905dXjsobtA0l3jzWL2jRNoKGzJLZL3r6jhaJS2/I4sAubJfkEneUAptw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=124fXIk9IwRq/sz+zdbIDDMoVgzsBKxqwzLKJnkeKVA=;
 b=Uqt1rmO5H4PpeIl9F18jNSUxe/SJYcVdGbkfamzvK3g8YfSP+ZERaLXrCF1b5ngyrbweVmee/wqhhpc0Bj9/Oo6bwKR5j7Xm3WqHTyxuLtOlxYuqM6SIijClCE2uW7rcy1RKLC0knQifBbReG70lh+A4n9IYOd6hbSngVwxmd0mg7VMGR5IzXuauM6DuSEdq7blbnKIAv87o0BD/BN94GRAKTX0KLBDdp9Jp1mMedZzLvFB0aPohXhS2Ns+t4nYm19tjdYm2e0g2vvcdP/uEhQmkuqDCfKcA/FAfVayvQLOqsy7MdSp43C/3/ahS7wo8+6QkmYIRg25TIc0+S89hMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=124fXIk9IwRq/sz+zdbIDDMoVgzsBKxqwzLKJnkeKVA=;
 b=IjYSiA9f+UgrnTMGhj8ZV2nb40Cl1LIP6zgn6B8LKZq76g6acYVfY57yPpnjeOr8safAuO9wQIRZ+hjGYGKvd/R/ZkhR8qk/M0wmvlCGz2z5vcuwH6qYjUcDeRil5mRsVc6do09k28hIZ305oq0KQqtNIFmVVajFC6ZkE1+Q5mU=
Received: from BYAPR10MB3240.namprd10.prod.outlook.com (2603:10b6:a03:155::17)
 by BYAPR10MB3558.namprd10.prod.outlook.com (2603:10b6:a03:122::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.19; Tue, 5 Jul
 2022 18:24:26 +0000
Received: from BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::dc4d:56f4:a55b:4e9]) by BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::dc4d:56f4:a55b:4e9%6]) with mapi id 15.20.5395.021; Tue, 5 Jul 2022
 18:24:26 +0000
Message-ID: <e12f0851-3df4-f4ce-8a8d-86c07003e9bf@oracle.com>
Date: Tue, 5 Jul 2022 14:24:20 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
From: Steven Sistare <steven.sistare@oracle.com>
Subject: Re: [PATCH V8 02/39] migration: qemu file wrappers
To: Guoyi Tu <tugy@chinatelecom.cn>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>,
 Jason Zeng <jason.zeng@linux.intel.com>,
 Zheng Chuan <zhengchuan@huawei.com>, Mark Kanda <mark.kanda@oracle.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philippe.mathieu.daude@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>,
 David Hildenbrand <david@redhat.com>, John Snow <jsnow@redhat.com>
References: <1655304746-102776-1-git-send-email-steven.sistare@oracle.com>
 <1655304746-102776-3-git-send-email-steven.sistare@oracle.com>
 <dc6e5024-aa12-ac97-b85c-024688913edb@chinatelecom.cn>
Content-Language: en-US
Organization: Oracle Corporation
In-Reply-To: <dc6e5024-aa12-ac97-b85c-024688913edb@chinatelecom.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SN7PR04CA0022.namprd04.prod.outlook.com
 (2603:10b6:806:f2::27) To BYAPR10MB3240.namprd10.prod.outlook.com
 (2603:10b6:a03:155::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: febed54e-8f27-45fe-5a47-08da5eb3976f
X-MS-TrafficTypeDiagnostic: BYAPR10MB3558:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 96cN4MuDIIMzcanYlbrp1g2gFAdH6G5x15rjlZ35DBU55zXaYHFbpsL8S0WS6+7LOi5N186epjTJ6R9nKVManmrU6AegWBbSCj2imIFTC8mZVBsKy7PXXRjXyar6a69GyDpEH5RGUuj5+odrVXrjHRPworPo9O23/2n5Qip07/903acZUQfhJj5IKOtDKgDyE56O1fXjo7FpQBYgkUpC/2gUWbC6gvx4spDGwkkKE86hWu+0L4C5T9DDGUhImwksRwOaJqzuKl+XbXJ3f4RNZ+lCye/yB5kyOq6UYmq+T2BkoT+QxZJNlD+rn0CLHBsNNladittzFSxhKaQIg6X9Qk01Bne5YD8/xZHdQq2KPNdHli86q0UFYV48rvao+FLOhXBEweuNDYlJFEMx6GxkK7I+AZ/w5uyVIozuDbLcx6/GiREbTzBbtzXRR0QRNFPNfwoXsz/gQrAwjzRrItoLce3Css2wB2d7aNdhXxTr+S+x+x0j0ifkGuRjOZEojwmWDVNaQBSlF1/1gWOJplHzvSzPOoHRwErikaWydmAwgnWT6j4SV52Ss14xU1GJqCpkmxWxlWte4JvWSAsJxEY1DP3VmWKRh4s/JO0uUXXrdAPwcMO0hXuvNmmRgR86hsuHHrWpbJHeDw6Li6qW0nXe2WLtnSpDw73sIwFCYKLrSDFVxJmfWGxd7Zuv+N1qGiij7S6GQwhCPD8uRpoPHFwHuda9Dmrrx7mj0iVJ7UcSw9JmdxXhVfHoeK2M7Q/uZY76sT8el8wLgb0HCyT4V6h1QHfhPLTkZTsVa7uclq3FiHPUh20rzygKkHqHw0eC3qfPEEBNb3cva24GogOAJAztNQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3240.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(346002)(376002)(396003)(136003)(39860400002)(366004)(7416002)(44832011)(478600001)(5660300002)(8936002)(6486002)(53546011)(6506007)(31696002)(86362001)(26005)(6512007)(41300700001)(2906002)(6666004)(36916002)(38100700002)(2616005)(186003)(83380400001)(66946007)(66556008)(66476007)(54906003)(31686004)(36756003)(316002)(4326008)(8676002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M1VrY2RUcjVhS25FY3lLMU9yaUtoamFXME1wbWdZZDQ5NlpiZUVmVzVxSyt5?=
 =?utf-8?B?U1FkOGt3R1FPaGM5NHdsMW9kNzQ1WFpLeFg0OFpidzNuMjB5Q1VaSUpmUHgz?=
 =?utf-8?B?Z0JHQWVsRjNKOVd3UUFrVGFCMmR0ZWhyQnVqdnJKQk0wOUVHdTFGTVNsbnlm?=
 =?utf-8?B?Vkdxd3ZDOC9DQnRIcElIUXF2emxGRTFXV3JpSEhCSWdXN1lZRCtncUdTWDli?=
 =?utf-8?B?Q0dLVXIwZm0rT1U0OU9zaklWQi9qR0FEcm9NQ0doZytFVjJEQTBUOWdMTTd6?=
 =?utf-8?B?UDJYb0xlYmtPejFkUkMvaUhzSi82ZXg1MitkUk9CcEU1NVptWmZBeVM2Q3ox?=
 =?utf-8?B?OHNEYVRQK3pNdG5CaGh6VmR3RGpwTzNRUEkrUWorQUg2MDlsb01kcUZabHFs?=
 =?utf-8?B?Rm1sTzBNQ2NPUGVvNVl1eW55dFFwSWRTUXhSSU5LTHEyUHpGY2ZUd0drNXFS?=
 =?utf-8?B?REZDV210NmNhZms2ZUEzK2VSWC9GT2MwcXYydDlzWnY3ampzU0RuZVlJZ0pv?=
 =?utf-8?B?WVp1MmNiRVBEZEJuVUVvL2RQVjJXcEFMZ3k3OXdyMjIrdzN5aiszaGJmbjFm?=
 =?utf-8?B?S2xGTDdpbndUWkZ2d3pkZ0UvdThvOE9rcTlCaUNSN1YwWWUwSkFPNm0zVjFl?=
 =?utf-8?B?a1hxTGdyMmFTUHN2MmRPMXdBcUhiVDUvbEdkQmZEQ0hlTnJYVVZRc016ak9z?=
 =?utf-8?B?YmNxUHRwZlZYbmxEbnp1Vlo3cHRQZkxQSU8zQ3lqWjNpQUlFYnBPUElvaWhY?=
 =?utf-8?B?Ti9vcXFMc3kwOWtpcnZvSVNTTEpVYnVINVhsZ0tzaTJDTkdLRnZJcGhIRjBP?=
 =?utf-8?B?SnU1T3lyb3ZESWdzbHdicVFjd3R6Q3RydUp2a3NLS2tHQVlGeFg2UUIrOFdn?=
 =?utf-8?B?RFFlQnRudDA4Qnl2dmZWVllVa0dpL1c0K2c2aWQ0NFduSHNYVGNjOU9JUU5m?=
 =?utf-8?B?UkRoNk1FYk0wdnVrRE5ySUJ2dzVicjFXaHZ4SHQ4c0FpN1cycWdpbWF1UzZu?=
 =?utf-8?B?cDUzMmdSejNpRzIvQ2w2bkNUeVV2OC9CZEZFbGppQmwxd3dLekI2bnErVUhn?=
 =?utf-8?B?SFQ4OW8zbGN2eGF0OTdIT0phSERyNmdGOXFTcEs4STVXdW1iM3A2NVQ3M2xS?=
 =?utf-8?B?WDNPSGNpMWZWN2MrdUt6MU9aMG44ZlI5L056SmZhdXI5eEFaMkVRUDgvMnVO?=
 =?utf-8?B?RmJJb2JMZW1kb0I0RzdDWUp0YmZXUHpWMTJ2Q3d1MHBHRnhlS0ViamVMLzh2?=
 =?utf-8?B?Z0tHSW9xcGlGUlNJUThwT1dBd0NHWVpwMUQ1UFFxUjVUTEhrMEUzY3RNZjUw?=
 =?utf-8?B?YUExc0lIZ1ZrUGd6SmlWc3ZzODM0Sm0yeDM4NEh6WTV3Um84bXZxMjhveSto?=
 =?utf-8?B?clVadnB3WEVpQnRQalo3UGpSWExSMzNhWFRqQi9yTTRCSStPcUp0ejJxa2Jm?=
 =?utf-8?B?cE5ORmFlSlJrRU94MXg0U3FwSXo4amJRMGM4bjJlRzZPZzBMNXdpZ2JwZ2JW?=
 =?utf-8?B?alF5cmVDaU1NMzYya3VrRzhqd3NaVEN2ZjVRZkExVitMZXZqRWViZjdwWmp6?=
 =?utf-8?B?aGtMS2RtdFgxc0IreE9YUG5yVEtaK1h2RkFwSlJZQWR2TjhBdmlqNlpKTWxE?=
 =?utf-8?B?WHJoQnExYVFCSzJGZUlYOWs0cktSYWtQNWpxVXlMR1I1dVYydG5UcCs1QnM5?=
 =?utf-8?B?enYrU0hFUzNKdWFTVkdBQ2VRbFhINHE5a0dLcGdWOTBGbHFQOTk2TEdOczNI?=
 =?utf-8?B?emNTR0lXUWhzMWpQNGthSllZYWJEclpwSUVWOVIxRUVIYTZzMjZnNUV5cGR0?=
 =?utf-8?B?a00wbnNmQzVmSFVVZE5JMkpOVThuV2ZCcEdYWDl4dzljUHJsTmJmRmZjNTZz?=
 =?utf-8?B?ZW1GKzVwY05wWkNvOGhRVktqMStRRlhyRWw4SDI4dU1qNGF3TnVOcTRHdWFB?=
 =?utf-8?B?eGhtdTRPSmdqc09abzZUYTNhcU4veVFDRW1EUGxMazRIVUVPc1puR0dhUW5E?=
 =?utf-8?B?RzJSRVhCVWQ5R0QzbmhpYm1veDR2d1dIV3RZWGM4S1kvSDY4ZDlKSExld1NU?=
 =?utf-8?B?NmlPTnR1dVkrVUttOEdWU0hGYVhyWDVFeGhGbnJYSjZJK1ljMk13czZRbGJF?=
 =?utf-8?B?QnlTVzQzSmtxekh0UVQ2cGFLNzNiWmRkbWRmN05HajBXNUM5UkV1WVBLYW5Q?=
 =?utf-8?B?TlE9PQ==?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: febed54e-8f27-45fe-5a47-08da5eb3976f
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3240.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2022 18:24:26.1816 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oRQC31ft/KZbjTT12XrMIEBWrBC4XRAka52kBqkr2afxeIpnAd5f3t13rYoYXlM3N2TYlzS3G2PyfWdJlM9duWwBOuuVe6RPZwk3755+wyE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR10MB3558
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.517, 18.0.883
 definitions=2022-07-05_15:2022-06-28,
 2022-07-05 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 spamscore=0 adultscore=0
 mlxlogscore=999 bulkscore=0 malwarescore=0 mlxscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2204290000
 definitions=main-2207050079
X-Proofpoint-GUID: i22MQKoOseB9L5XvggIMB4veLpGd68MW
X-Proofpoint-ORIG-GUID: i22MQKoOseB9L5XvggIMB4veLpGd68MW
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=steven.sistare@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 6/15/2022 10:18 PM, Guoyi Tu wrote:
> On 2022/6/15 22:51, Steve Sistare wrote:
>> Add qemu_file_open and qemu_fd_open to create QEMUFile objects for unix
>> files and file descriptors.
>>
> the function names should be updated.
> 
> -- 
> Guoyi

Yes indeed, thanks - Steve

>> Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
>> ---
>>   migration/qemu-file-channel.c | 36 ++++++++++++++++++++++++++++++++++++
>>   migration/qemu-file-channel.h |  6 ++++++
>>   2 files changed, 42 insertions(+)
>>
>> diff --git a/migration/qemu-file-channel.c b/migration/qemu-file-channel.c
>> index bb5a575..cc5aebc 100644
>> --- a/migration/qemu-file-channel.c
>> +++ b/migration/qemu-file-channel.c
>> @@ -27,8 +27,10 @@
>>   #include "qemu-file.h"
>>   #include "io/channel-socket.h"
>>   #include "io/channel-tls.h"
>> +#include "io/channel-file.h"
>>   #include "qemu/iov.h"
>>   #include "qemu/yank.h"
>> +#include "qapi/error.h"
>>   #include "yank_functions.h"
>>     @@ -192,3 +194,37 @@ QEMUFile *qemu_fopen_channel_output(QIOChannel *ioc)
>>       object_ref(OBJECT(ioc));
>>       return qemu_fopen_ops(ioc, &channel_output_ops, true);
>>   }
>> +
>> +QEMUFile *qemu_fopen_file(const char *path, int flags, int mode,
>> +                          const char *name, Error **errp)
>> +{
>> +    g_autoptr(QIOChannelFile) fioc = NULL;
>> +    QIOChannel *ioc;
>> +    QEMUFile *f;
>> +
>> +    if (flags & O_RDWR) {
>> +        error_setg(errp, "qemu_fopen_file %s: O_RDWR not supported", path);
>> +        return NULL;
>> +    }
>> +
>> +    fioc = qio_channel_file_new_path(path, flags, mode, errp);
>> +    if (!fioc) {
>> +        return NULL;
>> +    }
>> +
>> +    ioc = QIO_CHANNEL(fioc);
>> +    qio_channel_set_name(ioc, name);
>> +    f = (flags & O_WRONLY) ? qemu_fopen_channel_output(ioc) :
>> +                             qemu_fopen_channel_input(ioc);
>> +    return f;
>> +}
>> +
>> +QEMUFile *qemu_fopen_fd(int fd, bool writable, const char *name)
>> +{
>> +    g_autoptr(QIOChannelFile) fioc = qio_channel_file_new_fd(fd);
>> +    QIOChannel *ioc = QIO_CHANNEL(fioc);
>> +    QEMUFile *f = writable ? qemu_fopen_channel_output(ioc) :
>> +                             qemu_fopen_channel_input(ioc);
>> +    qio_channel_set_name(ioc, name);
>> +    return f;
>> +}
>> diff --git a/migration/qemu-file-channel.h b/migration/qemu-file-channel.h
>> index 0028a09..75fd0ad 100644
>> --- a/migration/qemu-file-channel.h
>> +++ b/migration/qemu-file-channel.h
>> @@ -29,4 +29,10 @@
>>     QEMUFile *qemu_fopen_channel_input(QIOChannel *ioc);
>>   QEMUFile *qemu_fopen_channel_output(QIOChannel *ioc);
>> +
>> +QEMUFile *qemu_fopen_file(const char *path, int flags, int mode,
>> +                         const char *name, Error **errp);
>> +
>> +QEMUFile *qemu_fopen_fd(int fd, bool writable, const char *name);
>> +
>>   #endif

