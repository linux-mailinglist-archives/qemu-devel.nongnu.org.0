Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AFBE46F291
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Dec 2021 18:56:15 +0100 (CET)
Received: from localhost ([::1]:55702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mvNeP-0004Dn-Vx
	for lists+qemu-devel@lfdr.de; Thu, 09 Dec 2021 12:56:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56922)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1mvNcX-0002qM-OJ
 for qemu-devel@nongnu.org; Thu, 09 Dec 2021 12:54:17 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:3210)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1mvNcT-0001f7-OQ
 for qemu-devel@nongnu.org; Thu, 09 Dec 2021 12:54:17 -0500
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1B9HnEq2012024; 
 Thu, 9 Dec 2021 17:54:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=Ny2P46sMttpN+KWYWizNBuHJcV58MuwH9t769SmKisg=;
 b=nkKsPbSvE2572ZlxzLbujDForCXhZZHCX5d8M+DK1ZYfsbL+LufKe6UvB62NY3wVE8LT
 4xBrmtcQnk5q/VxCax5UQCCjPzGwWzBz5u96EPVrlER0czfVGl0y2HOo/qAIBwjYcZ7W
 +Qbl8GZ3u1YSd7SFwjocRWVWt6ZaunQM/eRYQSgFirGYeAQ2EYJImabvKMeJumq/Mwh+
 pp6UcOI98y5poOGMnYvY++PqpjMgo/BKmCauoP2jlLuwJp81fIZDus50liJped+sHMUU
 +fjcdq47qt7v0UCOfvK2AYc/NBYHFG8P31spABQYlOwMQM3np7z9FUkab7HNbB1vKPRi 6w== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 3ctrj2v9dt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 09 Dec 2021 17:54:10 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1B9Hom94119725;
 Thu, 9 Dec 2021 17:54:09 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2106.outbound.protection.outlook.com [104.47.70.106])
 by userp3020.oracle.com with ESMTP id 3cr1ssv97t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 09 Dec 2021 17:54:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lwtG5HQWt3xTbTTS4a/R+64L+IEzmjnZ2fFcAO+JgiB61l5FAc6r9udwZulQJEMfKmuN5/72NXI1kAVd40LoXLxDQ844qxIl84c1MU7WV3nr99Vkh1kzi1Z7ttOFhsCNlPxNV6S3hABCntggHAtupYOfJ212SolLyPu8SkN/Ewet3RMUgmSypHrgdoY3Ef0C2v7CiYeUmFW/UMG+NxLvGTn6azWA4jFzcjw/KlK7PhR5VYOOgKGJ+evA7DgDozIlhxcEKed2tLHrn2GikH8k3Mz6wjAdOdwO56Xsf9dzh6Ojqdsl6+PbiVaFGLZCGCWeZXMIZ2mNdMu5KfvfJUrrqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ny2P46sMttpN+KWYWizNBuHJcV58MuwH9t769SmKisg=;
 b=ans/LHk2uhTs3/CCVZh/yCCvDDKyB1d3HonzY8cPdcIjtkvnVzfT8v8pw7hUB4dCzYmTf8A1I60/JMUrTUVQfO21fli1twHkganAEINqGmn7W3XP0nFKLIUZu6ob4MDrkiXgaSm6ca9DnG2eXULuQErLtRziSRZ+4TXgZRIgljS5k1DDEOUSuLYVopuwEBvxcgndIP3P6oE8L9miv2L47Ofyz/Aeszmys311BiMpDhNi8FWs6JBl82eMHwMD/PTV/EoIx2G+naPVwkqwYC/07szGgDQhub72uvkRs7iGNgBMi7QV2Kew5OUS12+CPxu+orZ0absTvQvNC0lT87lwiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ny2P46sMttpN+KWYWizNBuHJcV58MuwH9t769SmKisg=;
 b=mT27ha6Y2ghpW5lqGiMJkGLwEZbTcFBhe2VbfXtP9ygdIHWAg9nW9FMc19azKfJzqjDHtanV+wXYlA+OL+5XKJCUhVIR0yLe2V7WizPt1xG6AH3uvanWlLRV+c64w4jGpPxcO2EkVzqFi2Tg3KfbDwbO0Ly3a4m4jOFrejV2hOU=
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by MWHPR10MB1520.namprd10.prod.outlook.com (2603:10b6:300:26::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.13; Thu, 9 Dec
 2021 17:54:06 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::143c:ea64:7017:19f]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::143c:ea64:7017:19f%4]) with mapi id 15.20.4755.022; Thu, 9 Dec 2021
 17:54:06 +0000
Message-ID: <7a998743-1991-487b-15ff-17ee8fe51349@oracle.com>
Date: Thu, 9 Dec 2021 11:54:02 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v9 05/10] ACPI ERST: support for ACPI ERST feature
Content-Language: en-US
To: Ani Sinha <ani@anisinha.ca>
References: <1638472142-14396-1-git-send-email-eric.devolder@oracle.com>
 <1638472142-14396-6-git-send-email-eric.devolder@oracle.com>
 <CAARzgwzPQ-B-BfP4zejd2a9O_CsgfJj-RyVx0V3-v2HphOKDTQ@mail.gmail.com>
From: Eric DeVolder <eric.devolder@oracle.com>
In-Reply-To: <CAARzgwzPQ-B-BfP4zejd2a9O_CsgfJj-RyVx0V3-v2HphOKDTQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA9PR13CA0149.namprd13.prod.outlook.com
 (2603:10b6:806:27::34) To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
MIME-Version: 1.0
Received: from [IPV6:2606:b400:414:8061:221:28ff:fea5:27c8]
 (2606:b400:8024:1010::112a) by SA9PR13CA0149.namprd13.prod.outlook.com
 (2603:10b6:806:27::34) with Microsoft SMTP Server (version=TLS1_2, cipher=)
 via Frontend Transport; Thu, 9 Dec 2021 17:54:04 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a65087e1-a71a-443e-9817-08d9bb3ce4b5
X-MS-TrafficTypeDiagnostic: MWHPR10MB1520:EE_
X-Microsoft-Antispam-PRVS: <MWHPR10MB152060FFFF9AB1D633C4F92C97709@MWHPR10MB1520.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UNJwImdUVwyAh9LPzTv1+943AEGW+Wl5/gXd6lClab3EUK9OcviZKMDBt4x+O09EPB+8CmncnUA4Jaag+p386WrTI7o8TVDotDVeB+IozI2r38/asAQy3bwX3w9rxfLIdfJMrn81lh+PaZQQ/VjkzfFpRrEirxEtT2aWtAqPrHCKwSHVDzWFzf1QoS94+t1ccdkhUAcxo9Gv2aUvCoN6HCVFiXkvO6YVeh/4HkaTnCIpB3DZwZ1uzBLENbTv9YWElOtCvQ2Fu7oH+Us1nmqaAZ85kEoeUx1qJl3b8FXikaycPW7pJt7JM86rHW952u2lyIP/KSUUd7lOVGhzSagf0nEfNsFQu5e1A++VYsbN2dFwNH8QfFE2kY/SM+br1VhLCUq997/S9JDqUCoD8B6bqwQ7Q46Ac+WJKYjNrkYcmIw24PUfAKfUBKCIMSC0IGJ7W1XdCKx6kxxYLfgq0NwNVsb8Lb6LoEsIbt+z82cVMRwzkD6G5I82IRMkOldvs3eZYXsSql2EqRhe+HTj3h8thxZfv+Imd+7ZOTZ+Ay17WgIbZm9WCngn466Gew2qCH9goyFZeUswzIuup8foalrrYoJzd4maYDwMshJLv4npSMzFxdwBIJ7AOsuD/M2m0GD1L+vm0ILEJC2AJm9W7TGmwwRx+DBaIUermACaD2fZGOruD36K6fJi7GgGAFnzyBBT77vRWE3TQBtDWE+s1rasymDwa3DCHiDUNRciNbBbD80=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR10MB4531.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(6916009)(66946007)(31696002)(83380400001)(2906002)(30864003)(66556008)(5660300002)(4326008)(31686004)(36756003)(107886003)(86362001)(508600001)(316002)(6486002)(186003)(53546011)(8936002)(8676002)(2616005)(38100700002)(66476007)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S09zVEtBZWNSY0ZYa09CZGlYYm1IY1VzLzNYdG83b2gzaTNrOFUrcnVsZHFD?=
 =?utf-8?B?VTNJbFZnelkwblFFaDVMcWYveEgxUkNFclFyNGRWUld4VWoyTTc0d0lRVGM0?=
 =?utf-8?B?MFdSWlpIeFNnZGY3WkJMaVRRRHFsNDJINXdaUUlwUlo0MjNiUHZnOGhveDcv?=
 =?utf-8?B?NVRhS2IrNmZFN2JaZnlySFMrZmRwZXVkUXhuTE1WeGttZU02RXoxa3ZBbGxL?=
 =?utf-8?B?b2RYU01PY2E3UW5QRGZHRHBSM0w3OG1EQk85MGFtMFc4Q0xpeVE2YmdCY3dW?=
 =?utf-8?B?ZkhWdDh5cVpTYldDdmgrQWRjbG5rblplcWxrUnVIRjN6SURZT05pZGtzTHNF?=
 =?utf-8?B?RU8xWmtxbENzYkZrZVNQbE9QUWRKTXBqTHNFWE94WVpZMVh0bUM1UDJyZHFs?=
 =?utf-8?B?OTJtU3pOSXhiNzRkVnMyZllEQlArUWJQMzJSNXJvRVAzSVRMRDNhdXVITkpm?=
 =?utf-8?B?WTk3YWJveEs0Z29FK0N4Ry9sNC9IcVlsQy94TThhRmp1OW01dVZRMUR1R0Jv?=
 =?utf-8?B?b1VyaUk3Wm8vdGJNMlRjUERSQlNrNmtURTAyOGZJVSt0bjVEZElJS2p6R243?=
 =?utf-8?B?UUFNemkzeXFYcVhRREJjMVFQNFBHc0tRNXE5YTlVN2ljOS8reHpYUkExRUpz?=
 =?utf-8?B?cjZRRU0xOFBjanJzVVNSdWoxa0JHUzR3MnpBSDFiUVNCSmdwN3owSXVsa21z?=
 =?utf-8?B?dFVETU4rVW42NEdZY1RCNURMUjQ2OXNScFBCTTFaNDJEVFNIM1NPQXhSUnFQ?=
 =?utf-8?B?dURoNnBBbkg0TW92VllFUlJ4ODdIVU1OZGwwbnNGemdrbC9ESytlcVJaS2Rj?=
 =?utf-8?B?YkdQL1RlRmFIays0OW54SjhNaTNERExpNlZYSG8yWEZvQ3p1T1dLQk9KbzZU?=
 =?utf-8?B?NnN4d1dUTVNRbjhXR3dDKy9kMCtBU1FSWDgwUUwzNStQNlhqajJRaTQvYm9T?=
 =?utf-8?B?M0EvSDJWdlZaYXRhSnk4SnVBMTE2RmRGdkM0dFR3UU5MRVppeHhod1ZHSUk1?=
 =?utf-8?B?Y09QSWVjeHU5VmJvSTh5SFJ5Tlh1V3FXMGtucFExcUlJWE82aFRDeTV4azRB?=
 =?utf-8?B?ZU03MTFzSHgrQ0VQcGVQdVFyQW9JQStKQkxhWm00TkRJeW11NlpKenhPY2Iz?=
 =?utf-8?B?TTNzTHpKMFhGNEdISTVxa01HVE43SmZyNWtUWWt4bTlZOVIzUWtpbTZubGg3?=
 =?utf-8?B?dWZRWmZ3aE1EQUtFcVR1a0Q3VXBwYWh2a1NvNFcxdHRicjU1UnAxNmMxcVJ5?=
 =?utf-8?B?TlhNcEFzTkFSd0pDVEl1ZDFtNWlzZmNUU3pJdG9kWGpsZ2lCaEFtRHR0cEph?=
 =?utf-8?B?dW9vUEQxQmJGdDFoNlBURzBqMWcvWGF3d3g5VWxCRnRtYUdoY2l1WGp3K1Js?=
 =?utf-8?B?RUhpQmNGUFl1UWRYa0RmaXRROWdlb0lsMitsWVBRaGM1ZGlxanZhQ0tJWlNZ?=
 =?utf-8?B?dHJxRUdHWml6a0dwTXZxdWRIcVFMdkc2Skh1d3ZqYVlCazZBVkpwcHFKZDBB?=
 =?utf-8?B?SDBLaGRyaDJMazUyN0MwZzd1SXA3ZE81azd5ekNvN2pjQ1lxdjNDVmRXaWZW?=
 =?utf-8?B?T1hZMmlrNHg4NGlGclNjZklia2FBTjVhS21jcHQzZ3MxajNlZUt4dUlNUjcv?=
 =?utf-8?B?aUNYNms3eFkwYzFuM09PZHF6ckY5TnRjb1ZHb25aNThYVjAzTml0ejE4RHpU?=
 =?utf-8?B?Sm5BTGNVbHlpcXIyRWsvQmZCR0J1bnpzdlRCenc1YjNieEd4N1NGanNIRU5k?=
 =?utf-8?B?MDQyUGJVdUtVTGhiaDk0aUpRQS9zVHhaMXRGbTlBZUZsUHN3akhHNWdzSFN6?=
 =?utf-8?B?bGRNTm5TRGdxV3ZkRWRETGZXNGw2cVlZUUpiaDVRWkxZWE9iRThkdFVldGdl?=
 =?utf-8?B?clBSQ2F3ZnNnQUsxMThUT0hWVXI5REpadWNOaWhHdFZKd1UyUThaZU42dEtO?=
 =?utf-8?B?U24yTWlkUVdHRlhSVXpJRHpuQno0TUltOWN2WEdCVWJmTWJxaENOUTI1cnRR?=
 =?utf-8?B?ZEhuNEVlbjdBMFdwUXRKeUlQOFA2QVVJcCtOdFZTOE1TNWdLSjA4YmMxSXFJ?=
 =?utf-8?B?TTRzd1JZaGdGT1pIYVpYMkFqNnd1VDVVcUhHMUZSYzNFSERuQ1lzbEpFYnFv?=
 =?utf-8?B?dytHSmdkci81Qm9DQThHV1grZVhXS1pUL1krQ3pkc0FRd1Y1T3pscHREcndR?=
 =?utf-8?B?bUdSc1huTHRCN0xuTTdaTEVyMzVZRnUwTEpua2I4UkMvZit1SFBtK2xNM3l4?=
 =?utf-8?B?bXgvY1FOQWpFNGx1QlJYM0tUbFhBWVNPSlMzMXd0b09ZMlNHTE0xSk9Ebk1j?=
 =?utf-8?Q?DUzIRbSE9Zer2p3spe?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a65087e1-a71a-443e-9817-08d9bb3ce4b5
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2021 17:54:06.1204 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hkQl6Z/7ygQJAyQWAJSKvcpNkhJWle7gsNwWsrUncdKqazXaqafj95XVh7R59Ac69zbB18apRKdYA7iBYLhxZheyegUODPoVJd3xx6ThnPI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR10MB1520
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10193
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 mlxscore=0 spamscore=0
 phishscore=0 bulkscore=0 suspectscore=0 malwarescore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2112090093
X-Proofpoint-ORIG-GUID: JhMboxb9ZvfypolRqtVg5PcimyfqdN_w
X-Proofpoint-GUID: JhMboxb9ZvfypolRqtVg5PcimyfqdN_w
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=eric.devolder@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -55
X-Spam_score: -5.6
X-Spam_bar: -----
X-Spam_report: (-5.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-2.803, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

Ani, inline responses below. eric

On 12/9/21 00:29, Ani Sinha wrote:
> On Fri, Dec 3, 2021 at 12:39 AM Eric DeVolder <eric.devolder@oracle.com> wrote:
>>
>> This implements a PCI device for ACPI ERST. This implements the
>> non-NVRAM "mode" of operation for ERST as it is supported by
>> Linux and Windows.
> 
> Few more comments on this patch ...
> 
>>
>> Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>
>> ---
>>   hw/acpi/Kconfig      |   6 +
>>   hw/acpi/erst.c       | 836 +++++++++++++++++++++++++++++++++++++++++++++++++++
>>   hw/acpi/meson.build  |   1 +
>>   hw/acpi/trace-events |  15 +
>>   4 files changed, 858 insertions(+)
>>   create mode 100644 hw/acpi/erst.c
>>
>> diff --git a/hw/acpi/Kconfig b/hw/acpi/Kconfig
>> index 622b0b5..19caebd 100644
>> --- a/hw/acpi/Kconfig
>> +++ b/hw/acpi/Kconfig
>> @@ -10,6 +10,7 @@ config ACPI_X86
>>       select ACPI_HMAT
>>       select ACPI_PIIX4
>>       select ACPI_PCIHP
>> +    select ACPI_ERST
>>
>>   config ACPI_X86_ICH
>>       bool
>> @@ -60,3 +61,8 @@ config ACPI_HW_REDUCED
>>       select ACPI
>>       select ACPI_MEMORY_HOTPLUG
>>       select ACPI_NVDIMM
>> +
>> +config ACPI_ERST
>> +    bool
>> +    default y
>> +    depends on ACPI && PCI
>> diff --git a/hw/acpi/erst.c b/hw/acpi/erst.c
>> new file mode 100644
>> index 0000000..4304f55
>> --- /dev/null
>> +++ b/hw/acpi/erst.c
>> @@ -0,0 +1,836 @@
>> +/*
>> + * ACPI Error Record Serialization Table, ERST, Implementation
>> + *
>> + * ACPI ERST introduced in ACPI 4.0, June 16, 2009.
>> + * ACPI Platform Error Interfaces : Error Serialization
>> + *
>> + * Copyright (c) 2021 Oracle and/or its affiliates.
>> + *
>> + * SPDX-License-Identifier: GPL-2.0-or-later
>> + */
>> +
>> +#include <sys/types.h>
>> +#include <sys/stat.h>
>> +#include <unistd.h>
>> +
>> +#include "qemu/osdep.h"
>> +#include "qapi/error.h"
>> +#include "hw/qdev-core.h"
>> +#include "exec/memory.h"
>> +#include "qom/object.h"
>> +#include "hw/pci/pci.h"
>> +#include "qom/object_interfaces.h"
>> +#include "qemu/error-report.h"
>> +#include "migration/vmstate.h"
>> +#include "hw/qdev-properties.h"
>> +#include "hw/acpi/acpi.h"
>> +#include "hw/acpi/acpi-defs.h"
>> +#include "hw/acpi/aml-build.h"
>> +#include "hw/acpi/bios-linker-loader.h"
>> +#include "exec/address-spaces.h"
>> +#include "sysemu/hostmem.h"
>> +#include "hw/acpi/erst.h"
>> +#include "trace.h"
>> +
>> +/* ACPI 4.0: Table 17-16 Serialization Actions */
>> +#define ACTION_BEGIN_WRITE_OPERATION         0x0
>> +#define ACTION_BEGIN_READ_OPERATION          0x1
>> +#define ACTION_BEGIN_CLEAR_OPERATION         0x2
>> +#define ACTION_END_OPERATION                 0x3
>> +#define ACTION_SET_RECORD_OFFSET             0x4
>> +#define ACTION_EXECUTE_OPERATION             0x5
>> +#define ACTION_CHECK_BUSY_STATUS             0x6
>> +#define ACTION_GET_COMMAND_STATUS            0x7
>> +#define ACTION_GET_RECORD_IDENTIFIER         0x8
>> +#define ACTION_SET_RECORD_IDENTIFIER         0x9
>> +#define ACTION_GET_RECORD_COUNT              0xA
>> +#define ACTION_BEGIN_DUMMY_WRITE_OPERATION   0xB
>> +#define ACTION_RESERVED                      0xC
>> +#define ACTION_GET_ERROR_LOG_ADDRESS_RANGE   0xD
>> +#define ACTION_GET_ERROR_LOG_ADDRESS_LENGTH  0xE
>> +#define ACTION_GET_ERROR_LOG_ADDRESS_RANGE_ATTRIBUTES 0xF
>> +#define ACTION_GET_EXECUTE_OPERATION_TIMINGS 0x10
>> +
>> +/* ACPI 4.0: Table 17-17 Command Status Definitions */
>> +#define STATUS_SUCCESS                0x00
>> +#define STATUS_NOT_ENOUGH_SPACE       0x01
>> +#define STATUS_HARDWARE_NOT_AVAILABLE 0x02
>> +#define STATUS_FAILED                 0x03
>> +#define STATUS_RECORD_STORE_EMPTY     0x04
>> +#define STATUS_RECORD_NOT_FOUND       0x05
>> +
>> +
>> +/* UEFI 2.1: Appendix N Common Platform Error Record */
>> +#define UEFI_CPER_RECORD_MIN_SIZE 128U
>> +#define UEFI_CPER_RECORD_LENGTH_OFFSET 20U
>> +#define UEFI_CPER_RECORD_ID_OFFSET 96U
>> +#define IS_UEFI_CPER_RECORD(ptr) \
>> +    (((ptr)[0] == 'C') && \
>> +     ((ptr)[1] == 'P') && \
>> +     ((ptr)[2] == 'E') && \
>> +     ((ptr)[3] == 'R'))
>> +
>> +/*
>> + * NOTE that when accessing CPER fields within a record, memcpy()
>> + * is utilized to avoid a possible misaligned access on the host.
>> + */
>> +
>> +/*
>> + * This implementation is an ACTION (cmd) and VALUE (data)
>> + * interface consisting of just two 64-bit registers.
>> + */
>> +#define ERST_REG_SIZE (16UL)
>> +#define ERST_ACTION_OFFSET (0UL) /* action (cmd) */
>> +#define ERST_VALUE_OFFSET  (8UL) /* argument/value (data) */
>> +
>> +/*
>> + * ERST_RECORD_SIZE is the buffer size for exchanging ERST
>> + * record contents. Thus, it defines the maximum record size.
>> + * As this is mapped through a PCI BAR, it must be a power of
>> + * two and larger than UEFI_CPER_RECORD_MIN_SIZE.
>> + * The backing storage is divided into fixed size "slots",
>> + * each ERST_RECORD_SIZE in length, and each "slot"
>> + * storing a single record. No attempt at optimizing storage
>> + * through compression, compaction, etc is attempted.
>> + * NOTE that slot 0 is reserved for the backing storage header.
>> + * Depending upon the size of the backing storage, additional
>> + * slots will be part of the slot 0 header in order to account
>> + * for a record_id for each available remaining slot.
>> + */
>> +/* 8KiB records, not too small, not too big */
>> +#define ERST_RECORD_SIZE (8192UL)
>> +
>> +#define ACPI_ERST_MEMDEV_PROP "memdev"
>> +#define ACPI_ERST_RECORD_SIZE_PROP "record_size"
>> +
>> +/*
>> + * From the ACPI ERST spec sections:
>> + * A record id of all 0s is used to indicate 'unspecified' record id.
>> + * A record id of all 1s is used to indicate empty or end.
>> + */
>> +#define ERST_UNSPECIFIED_RECORD_ID (0UL)
>> +#define ERST_EMPTY_END_RECORD_ID (~0UL)
>> +#define ERST_EXECUTE_OPERATION_MAGIC 0x9CUL
>> +#define ERST_IS_VALID_RECORD_ID(rid) \
>> +    ((rid != ERST_UNSPECIFIED_RECORD_ID) && \
>> +     (rid != ERST_EMPTY_END_RECORD_ID))
>> +#define ERST_STORE_MAGIC 0x524F545354535245UL /* ERSTSTOR */
>> +
> 
> you might want to add a comment something like
> /* please see erst.rst documentation for the details on this header structure */
done!

> 
>> +typedef struct {
>> +    uint64_t magic;
>> +    uint32_t record_size;
>> +    uint32_t storage_offset; /* offset to record storage beyond header */
>> +    uint16_t version;
>> +    uint16_t reserved;
>> +    uint32_t record_count;
>> +    uint64_t map[]; /* contains record_ids, and position indicates index */
>> +} __attribute__((packed)) ERSTStorageHeader;
>> +
>> +/*
>> + * Object cast macro
>> + */
>> +#define ACPIERST(obj) \
>> +    OBJECT_CHECK(ERSTDeviceState, (obj), TYPE_ACPI_ERST)
>> +
>> +/*
>> + * Main ERST device state structure
>> + */
>> +typedef struct {
>> +    PCIDevice parent_obj;
>> +
>> +    /* Backend storage */
>> +    HostMemoryBackend *hostmem;
>> +    MemoryRegion *hostmem_mr;
>> +    uint32_t storage_size;
>> +    uint32_t default_record_size;
>> +
>> +    /* Programming registers */
>> +    MemoryRegion iomem_mr;
>> +
>> +    /* Exchange buffer */
>> +    MemoryRegion exchange_mr;
>> +
>> +    /* Interface state */
>> +    uint8_t operation;
>> +    uint8_t busy_status;
>> +    uint8_t command_status;
>> +    uint32_t record_offset;
>> +    uint64_t reg_action;
>> +    uint64_t reg_value;
>> +    uint64_t record_identifier;
>> +    ERSTStorageHeader *header;
>> +    unsigned first_record_index;
>> +    unsigned last_record_index;
>> +    unsigned next_record_index;
>> +
>> +} ERSTDeviceState;
>> +
>> +/*******************************************************************/
>> +/*******************************************************************/
>> +
>> +static uint8_t *get_nvram_ptr_by_index(ERSTDeviceState *s, unsigned index)
>> +{
>> +    uint8_t *rc = NULL;
>> +    off_t offset = (index * le32_to_cpu(s->header->record_size));
>> +
>> +    g_assert(offset < s->storage_size);
>> +
>> +    rc = memory_region_get_ram_ptr(s->hostmem_mr);
>> +    rc += offset;
>> +
>> +    return rc;
>> +}
>> +
>> +static void make_erst_storage_header(ERSTDeviceState *s)
>> +{
>> +    ERSTStorageHeader *header = s->header;
>> +    unsigned mapsz, headersz;
>> +
>> +    header->magic = cpu_to_le64(ERST_STORE_MAGIC);
>> +    header->record_size = cpu_to_le32(s->default_record_size);
>> +    header->version = cpu_to_le16(0x0100);
>> +    header->reserved = cpu_to_le16(0x0000);
>> +
>> +    /* Compute mapsize */
>> +    mapsz = s->storage_size / s->default_record_size;
>> +    mapsz *= sizeof(uint64_t);
>> +    /* Compute header+map size */
>> +    headersz = sizeof(ERSTStorageHeader) + mapsz;
>> +    /* Round up to nearest integer multiple of ERST_RECORD_SIZE */
>> +    headersz = QEMU_ALIGN_UP(headersz, s->default_record_size);
>> +    header->storage_offset = cpu_to_le32(headersz);
>> +
>> +    /*
>> +     * The HostMemoryBackend initializes contents to zero,
>> +     * so all record_ids stashed in the map are zero'd.
>> +     * As well the record_count is zero. Properly initialized.
>> +     */
>> +}
>> +
>> +static void check_erst_backend_storage(ERSTDeviceState *s, Error **errp)
>> +{
>> +    ERSTStorageHeader *header;
>> +    uint32_t record_size;
>> +
>> +    header = memory_region_get_ram_ptr(s->hostmem_mr);
>> +    s->header = header;
>> +
>> +    /* Ensure pointer to header is 64-bit aligned */
>> +    g_assert(QEMU_PTR_IS_ALIGNED(header, sizeof(uint64_t)));
>> +
>> +    /*
>> +     * Check if header is uninitialized; HostMemoryBackend inits to 0
>> +     */
>> +    if (le64_to_cpu(header->magic) == 0UL) {
>> +        make_erst_storage_header(s);
>> +    }
>> +
>> +    /* Validity check record_size */
>> +    record_size = le32_to_cpu(header->record_size);
>> +    if (!(
>> +        (record_size) && /* non zero */
>> +        (record_size >= UEFI_CPER_RECORD_MIN_SIZE) &&
>> +        (((record_size - 1) & record_size) == 0) && /* is power of 2 */
>> +        (record_size >= 4096) /* PAGE_SIZE */
>> +        )) {
>> +        error_setg(errp, "ERST record_size %u is invalid", record_size);
>> +    }
>> +
>> +    /* Validity check header */
>> +    if (!(
>> +        (le64_to_cpu(header->magic) == ERST_STORE_MAGIC) &&
>> +        ((le32_to_cpu(header->storage_offset) % record_size) == 0) &&
>> +        (le16_to_cpu(header->version) == 0x0100) &&
>> +        (le16_to_cpu(header->reserved) == 0)
>> +        )) {
>> +        error_setg(errp, "ERST backend storage header is invalid");
>> +    }
>> +
>> +    /* Check storage_size against record_size */
>> +    if (((s->storage_size % record_size) != 0) ||
>> +         (record_size > s->storage_size)) {
>> +        error_setg(errp, "ACPI ERST requires storage size be multiple of "
>> +            "record size (%uKiB)", record_size);
>> +    }
>> +
>> +    /* Compute offset of first and last record storage slot */
>> +    s->first_record_index = le32_to_cpu(header->storage_offset)
>> +        / record_size;
>> +    s->last_record_index = (s->storage_size / record_size);
>> +}
>> +
>> +static void update_map_entry(ERSTDeviceState *s, unsigned index,
>> +    uint64_t record_id)
>> +{
>> +    if (index < s->last_record_index) {
>> +        s->header->map[index] = cpu_to_le64(record_id);
>> +    }
>> +}
>> +
>> +static unsigned allocate_erst_record(ERSTDeviceState *s)
>> +{
>> +    unsigned rc = 0; /* 0 not a valid index */
>> +    unsigned index = s->first_record_index;
>> +
>> +    for (; index < s->last_record_index; ++index) {
>> +        if (le64_to_cpu(s->header->map[index]) == ERST_UNSPECIFIED_RECORD_ID) {
>> +            rc = index;
>> +            break;
>> +        }
>> +    }
>> +
>> +    return rc;
>> +}
>> +
>> +static unsigned lookup_erst_record(ERSTDeviceState *s,
>> +    uint64_t record_identifier)
>> +{
>> +    unsigned rc = 0; /* 0 not a valid index */
>> +
>> +    /* Find the record_identifier in the map */
>> +    if (record_identifier != ERST_UNSPECIFIED_RECORD_ID) {
>> +        /*
>> +         * Count number of valid records encountered, and
>> +         * short-circuit the loop if identifier not found
>> +         */
>> +        uint32_t record_count = le32_to_cpu(s->header->record_count);
>> +        unsigned count = 0;
>> +        unsigned index;
>> +        for (index = s->first_record_index; index < s->last_record_index &&
>> +                count < record_count; ++index) {
>> +            if (le64_to_cpu(s->header->map[index]) == record_identifier) {
>> +                rc = index;
>> +                break;
>> +            }
>> +            if (le64_to_cpu(s->header->map[index]) !=
>> +                ERST_UNSPECIFIED_RECORD_ID) {
>> +                ++count;
>> +            }
>> +        }
>> +    }
>> +
>> +    return rc;
>> +}
>> +
>> +/*
>> + * ACPI 4.0: 17.4.1.1 Serialization Actions, also see
>> + * ACPI 4.0: 17.4.2.2 Operations - Reading 6.c and 2.c
>> + */
>> +static unsigned get_next_record_identifier(ERSTDeviceState *s,
>> +    uint64_t *record_identifier, bool first)
>> +{
>> +    unsigned found = 0;
>> +    unsigned index;
>> +
>> +    /* For operations needing to return 'first' record identifer */
>> +    if (first) {
>> +        /* Reset initial index to beginning */
>> +        s->next_record_index = s->first_record_index;
>> +    }
>> +    index = s->next_record_index;
>> +
>> +    *record_identifier = ERST_EMPTY_END_RECORD_ID;
>> +
>> +    if (le32_to_cpu(s->header->record_count)) {
>> +        for (; index < s->last_record_index; ++index) {
>> +            if (le64_to_cpu(s->header->map[index]) !=
>> +                    ERST_UNSPECIFIED_RECORD_ID) {
>> +                    /* where to start next time */
>> +                    s->next_record_index = index + 1;
>> +                    *record_identifier = le64_to_cpu(s->header->map[index]);
>> +                    found = 1;
>> +                    break;
>> +            }
>> +        }
>> +    }
>> +    if (!found) {
>> +        /* at end (ie scan complete), reset */
>> +        s->next_record_index = s->first_record_index;
>> +    }
>> +
>> +    return STATUS_SUCCESS;
>> +}
>> +
>> +/* ACPI 4.0: 17.4.2.3 Operations - Clearing */
>> +static unsigned clear_erst_record(ERSTDeviceState *s)
>> +{
>> +    unsigned rc = STATUS_RECORD_NOT_FOUND;
>> +    unsigned index;
>> +
>> +    /* Check for valid record identifier */
>> +    if (!ERST_IS_VALID_RECORD_ID(s->record_identifier)) {
>> +        return STATUS_FAILED;
>> +    }
>> +
>> +    index = lookup_erst_record(s, s->record_identifier);
>> +    if (index) {
>> +        /* No need to wipe record, just invalidate its map entry */
>> +        uint32_t record_count;
>> +        update_map_entry(s, index, ERST_UNSPECIFIED_RECORD_ID);
>> +        record_count = le32_to_cpu(s->header->record_count);
>> +        record_count -= 1;
>> +        s->header->record_count = cpu_to_le32(record_count);
>> +        rc = STATUS_SUCCESS;
>> +    }
>> +
>> +    return rc;
>> +}
>> +
>> +/* ACPI 4.0: 17.4.2.2 Operations - Reading */
>> +static unsigned read_erst_record(ERSTDeviceState *s)
>> +{
>> +    unsigned rc = STATUS_RECORD_NOT_FOUND;
>> +    unsigned exchange_length;
>> +    unsigned index;
>> +
>> +    /* Check if backend storage is empty */
>> +    if (le32_to_cpu(s->header->record_count) == 0) {
>> +        return STATUS_RECORD_STORE_EMPTY;
>> +    }
>> +
>> +    exchange_length = memory_region_size(&s->exchange_mr);
>> +
>> +    /* Check for record identifier of all 0s */
>> +    if (s->record_identifier == ERST_UNSPECIFIED_RECORD_ID) {
>> +        /* Set to 'first' record in storage */
>> +        get_next_record_identifier(s, &s->record_identifier, true);
>> +        /* record_identifier is now a valid id, or all 1s */
>> +    }
>> +
>> +    /* Check for record identifier of all 1s */
>> +    if (s->record_identifier == ERST_EMPTY_END_RECORD_ID) {
>> +        return STATUS_FAILED;
>> +    }
>> +
>> +    /* Validate record_offset */
>> +    if (s->record_offset > (exchange_length - UEFI_CPER_RECORD_MIN_SIZE)) {
>> +        return STATUS_FAILED;
>> +    }
>> +
>> +    index = lookup_erst_record(s, s->record_identifier);
>> +    if (index) {
>> +        uint8_t *nvram;
>> +        uint8_t *exchange;
>> +        uint32_t record_length;
>> +
>> +        /* Obtain pointer to the exchange buffer */
>> +        exchange = memory_region_get_ram_ptr(&s->exchange_mr);
>> +        exchange += s->record_offset;
>> +        /* Obtain pointer to slot in storage */
>> +        nvram = get_nvram_ptr_by_index(s, index);
>> +        /* Validate CPER record_length */
>> +        memcpy((uint8_t *)&record_length,
>> +            &nvram[UEFI_CPER_RECORD_LENGTH_OFFSET],
>> +            sizeof(uint32_t));
>> +        record_length = le32_to_cpu(record_length);
>> +        if (record_length < UEFI_CPER_RECORD_MIN_SIZE) {
>> +            rc = STATUS_FAILED;
>> +        }
>> +        if ((s->record_offset + record_length) > exchange_length) {
>> +            rc = STATUS_FAILED;
>> +        }
>> +        /* If all is ok, copy the record to the exchange buffer */
>> +        if (rc != STATUS_FAILED) {
>> +            memcpy(exchange, nvram, record_length);
>> +            rc = STATUS_SUCCESS;
>> +        }
>> +    } else {
> 
> I wonder if it is wise to return the next record id if the record is
> not found. Should we simply return STATUS_FAILED here as well?

Actually, this is per the spec. ACPI Spec 4.0 17.4.2.2 (or ACPI Spec 6.3 18.5.2.2) "Reading", see 
"The steps performed by the platform ...", section 2.c, calls for locating the 'first' identifier.

I left a reference comment in the code.

> 
>> +        /* Set to 'first' record in storage */
>> +        get_next_record_identifier(s, &s->record_identifier, true);
>> +    }
>> +
>> +    return rc;
>> +}
>> +
>> +/* ACPI 4.0: 17.4.2.1 Operations - Writing */
>> +static unsigned write_erst_record(ERSTDeviceState *s)
>> +{
>> +    unsigned rc = STATUS_FAILED;
>> +    unsigned exchange_length;
>> +    unsigned index;
>> +    uint64_t record_identifier;
>> +    uint32_t record_length;
>> +    uint8_t *exchange;
>> +    uint8_t *nvram = NULL;
>> +    bool record_found = false;
>> +
>> +    exchange_length = memory_region_size(&s->exchange_mr);
>> +
>> +    /* Validate record_offset */
>> +    if (s->record_offset > (exchange_length - UEFI_CPER_RECORD_MIN_SIZE)) {
>> +        return STATUS_FAILED;
>> +    }
>> +
>> +    /* Obtain pointer to record in the exchange buffer */
>> +    exchange = memory_region_get_ram_ptr(&s->exchange_mr);
>> +    exchange += s->record_offset;
>> +
>> +    /* Validate CPER record_length */
>> +    memcpy((uint8_t *)&record_length, &exchange[UEFI_CPER_RECORD_LENGTH_OFFSET],
>> +        sizeof(uint32_t));
>> +    record_length = le32_to_cpu(record_length);
>> +    if (record_length < UEFI_CPER_RECORD_MIN_SIZE) {
>> +        return STATUS_FAILED;
>> +    }
>> +    if ((s->record_offset + record_length) > exchange_length) {
>> +        return STATUS_FAILED;
>> +    }
>> +
>> +    /* Extract record identifier */
>> +    memcpy((uint8_t *)&record_identifier, &exchange[UEFI_CPER_RECORD_ID_OFFSET],
>> +        sizeof(uint64_t));
>> +    record_identifier = le64_to_cpu(record_identifier);
>> +
>> +    /* Check for valid record identifier */
>> +    if (!ERST_IS_VALID_RECORD_ID(record_identifier)) {
>> +        return STATUS_FAILED;
>> +    }
>> +
>> +    index = lookup_erst_record(s, record_identifier);
>> +    if (index) {
>> +        /* Record found, overwrite existing record */
>> +        nvram = get_nvram_ptr_by_index(s, index);
>> +        record_found = true;
>> +    } else {
>> +        /* Record not found, not an overwrite, allocate for write */
>> +        index = allocate_erst_record(s);
>> +        if (index) {
>> +            nvram = get_nvram_ptr_by_index(s, index);
>> +        } else {
>> +            rc = STATUS_NOT_ENOUGH_SPACE;
> 
> /* all slots are occupied */
done!

> 
>> +        }
>> +    }
>> +    if (nvram) {
>> +        /* Write the record into the slot */
>> +        memcpy(nvram, exchange, record_length);
>> +        memset(nvram + record_length, exchange_length - record_length, 0xFF);
>> +        /* If a new record, increment the record_count */
>> +        if (!record_found) {
>> +            uint32_t record_count;
>> +            record_count = le32_to_cpu(s->header->record_count);
>> +            record_count += 1; /* writing new record */
>> +            s->header->record_count = cpu_to_le32(record_count);
>> +        }
>> +        update_map_entry(s, index, record_identifier);
>> +        rc = STATUS_SUCCESS;
>> +    }
>> +
>> +    return rc;
>> +}
>> +
>> +/*******************************************************************/
>> +
>> +static uint64_t erst_rd_reg64(hwaddr addr,
>> +    uint64_t reg, unsigned size)
>> +{
>> +    uint64_t rdval;
>> +    uint64_t mask;
>> +    unsigned shift;
>> +
>> +    if (size == sizeof(uint64_t)) {
>> +        /* 64b access */
>> +        mask = 0xFFFFFFFFFFFFFFFFUL;
>> +        shift = 0;
>> +    } else {
>> +        /* 32b access */
>> +        mask = 0x00000000FFFFFFFFUL;
>> +        shift = ((addr & 0x4) == 0x4) ? 32 : 0;
>> +    }
>> +
>> +    rdval = reg;
>> +    rdval >>= shift;
>> +    rdval &= mask;
>> +
>> +    return rdval;
>> +}
>> +
>> +static uint64_t erst_wr_reg64(hwaddr addr,
>> +    uint64_t reg, uint64_t val, unsigned size)
>> +{
>> +    uint64_t wrval;
>> +    uint64_t mask;
>> +    unsigned shift;
>> +
>> +    if (size == sizeof(uint64_t)) {
>> +        /* 64b access */
>> +        mask = 0xFFFFFFFFFFFFFFFFUL;
>> +        shift = 0;
>> +    } else {
>> +        /* 32b access */
>> +        mask = 0x00000000FFFFFFFFUL;
>> +        shift = ((addr & 0x4) == 0x4) ? 32 : 0;
>> +    }
>> +
>> +    val &= mask;
>> +    val <<= shift;
>> +    mask <<= shift;
>> +    wrval = reg;
>> +    wrval &= ~mask;
>> +    wrval |= val;
>> +
>> +    return wrval;
>> +}
>> +
>> +static void erst_reg_write(void *opaque, hwaddr addr,
>> +    uint64_t val, unsigned size)
>> +{
>> +    ERSTDeviceState *s = (ERSTDeviceState *)opaque;
>> +
>> +    /*
>> +     * NOTE: All actions/operations/side effects happen on the WRITE,
>> +     * by this implementation's design. The READs simply return the
>> +     * reg_value contents.
>> +     */
>> +    trace_acpi_erst_reg_write(addr, val, size);
>> +
>> +    switch (addr) {
>> +    case ERST_VALUE_OFFSET + 0:
>> +    case ERST_VALUE_OFFSET + 4:
>> +        s->reg_value = erst_wr_reg64(addr, s->reg_value, val, size);
>> +        break;
>> +    case ERST_ACTION_OFFSET + 0:
>> +        /*
>> +         * NOTE: all valid values written to this register are of the
>> +         * ACTION_* variety. Thus there is no need to make this a 64-bit
>> +         * register, 32-bits is appropriate. As such ERST_ACTION_OFFSET+4
>> +         * is not needed.
>> +         */
>> +        switch (val) {
>> +        case ACTION_BEGIN_WRITE_OPERATION:
>> +        case ACTION_BEGIN_READ_OPERATION:
>> +        case ACTION_BEGIN_CLEAR_OPERATION:
>> +        case ACTION_BEGIN_DUMMY_WRITE_OPERATION:
>> +        case ACTION_END_OPERATION:
>> +            s->operation = val;
>> +            break;
>> +        case ACTION_SET_RECORD_OFFSET:
>> +            s->record_offset = s->reg_value;
>> +            break;
>> +        case ACTION_EXECUTE_OPERATION:
>> +            if ((uint8_t)s->reg_value == ERST_EXECUTE_OPERATION_MAGIC) {
>> +                s->busy_status = 1;
>> +                switch (s->operation) {
>> +                case ACTION_BEGIN_WRITE_OPERATION:
>> +                    s->command_status = write_erst_record(s);
>> +                    break;
>> +                case ACTION_BEGIN_READ_OPERATION:
>> +                    s->command_status = read_erst_record(s);
>> +                    break;
>> +                case ACTION_BEGIN_CLEAR_OPERATION:
>> +                    s->command_status = clear_erst_record(s);
>> +                    break;
>> +                case ACTION_BEGIN_DUMMY_WRITE_OPERATION:
>> +                    s->command_status = STATUS_SUCCESS;
>> +                    break;
>> +                case ACTION_END_OPERATION:
>> +                    s->command_status = STATUS_SUCCESS;
>> +                    break;
>> +                default:
>> +                    s->command_status = STATUS_FAILED;
> 
> Should this be something like STATUS_NOT_SUPPORTED?
Throughout I've been exclusively using the status codes as defined in the spec:
Success, Not Enough Space, Hardware Not Available, Failed, Record Store Empty, Record Not Found.

Failed seems to be an appropriate response.

> 
>> +                    break;
>> +                }
>> +                s->busy_status = 0;
>> +            }
>> +            break;
>> +        case ACTION_CHECK_BUSY_STATUS:
>> +            s->reg_value = s->busy_status;
>> +            break;
>> +        case ACTION_GET_COMMAND_STATUS:
>> +            s->reg_value = s->command_status;
>> +            break;
>> +        case ACTION_GET_RECORD_IDENTIFIER:
>> +            s->command_status = get_next_record_identifier(s,
>> +                                    &s->reg_value, false);
>> +            break;
>> +        case ACTION_SET_RECORD_IDENTIFIER:
>> +            s->record_identifier = s->reg_value;
>> +            break;
>> +        case ACTION_GET_RECORD_COUNT:
>> +            s->reg_value = le32_to_cpu(s->header->record_count);
>> +            break;
>> +        case ACTION_GET_ERROR_LOG_ADDRESS_RANGE:
>> +            s->reg_value = (hwaddr)pci_get_bar_addr(PCI_DEVICE(s), 1);
>> +            break;
>> +        case ACTION_GET_ERROR_LOG_ADDRESS_LENGTH:
>> +            s->reg_value = le32_to_cpu(s->header->record_size);
>> +            break;
>> +        case ACTION_GET_ERROR_LOG_ADDRESS_RANGE_ATTRIBUTES:
>> +            s->reg_value = 0x0; /* intentional, not NVRAM mode */
>> +            break;
>> +        case ACTION_GET_EXECUTE_OPERATION_TIMINGS:
>> +            s->reg_value =
>> +                (100ULL << 32) | /* 100us max time */
>> +                (10ULL  <<  0) ; /*  10us min time */
>> +            break;
>> +        default:
>> +            /* Unknown action/command, NOP */
> 
> maybe add some tracing here in case guests are going bad mmio writes?
At the top of this function is a trace that produces information on all writes.

> 
>> +            break;
>> +        }
>> +        break;
>> +    default:
>> +        /* This should not happen, but if it does, NOP */
>> +        break;
>> +    }
>> +}
>> +
>> +static uint64_t erst_reg_read(void *opaque, hwaddr addr,
>> +                                unsigned size)
>> +{
>> +    ERSTDeviceState *s = (ERSTDeviceState *)opaque;
>> +    uint64_t val = 0;
>> +
>> +    switch (addr) {
>> +    case ERST_ACTION_OFFSET + 0:
>> +    case ERST_ACTION_OFFSET + 4:
>> +        val = erst_rd_reg64(addr, s->reg_action, size);
>> +        break;
>> +    case ERST_VALUE_OFFSET + 0:
>> +    case ERST_VALUE_OFFSET + 4:
>> +        val = erst_rd_reg64(addr, s->reg_value, size);
>> +        break;
>> +    default:
>> +        break;
>> +    }
>> +    trace_acpi_erst_reg_read(addr, val, size);
>> +    return val;
>> +}
>> +
>> +static const MemoryRegionOps erst_reg_ops = {
>> +    .read = erst_reg_read,
>> +    .write = erst_reg_write,
>> +    .endianness = DEVICE_NATIVE_ENDIAN,
>> +};
>> +
>> +/*******************************************************************/
>> +/*******************************************************************/
>> +static int erst_post_load(void *opaque, int version_id)
>> +{
>> +    ERSTDeviceState *s = opaque;
>> +
>> +    /* Recompute pointer to header */
>> +    s->header = (ERSTStorageHeader *)get_nvram_ptr_by_index(s, 0);
>> +    trace_acpi_erst_post_load(s->header, le32_to_cpu(s->header->record_size));
>> +
>> +    return 0;
>> +}
>> +
>> +static const VMStateDescription erst_vmstate  = {
>> +    .name = "acpi-erst",
>> +    .version_id = 1,
>> +    .minimum_version_id = 1,
>> +    .post_load = erst_post_load,
>> +    .fields = (VMStateField[]) {
>> +        VMSTATE_UINT8(operation, ERSTDeviceState),
>> +        VMSTATE_UINT8(busy_status, ERSTDeviceState),
>> +        VMSTATE_UINT8(command_status, ERSTDeviceState),
>> +        VMSTATE_UINT32(record_offset, ERSTDeviceState),
>> +        VMSTATE_UINT64(reg_action, ERSTDeviceState),
>> +        VMSTATE_UINT64(reg_value, ERSTDeviceState),
>> +        VMSTATE_UINT64(record_identifier, ERSTDeviceState),
>> +        VMSTATE_UINT32(next_record_index, ERSTDeviceState),
>> +        VMSTATE_END_OF_LIST()
>> +    }
>> +};
>> +
>> +static void erst_realizefn(PCIDevice *pci_dev, Error **errp)
>> +{
>> +    ERSTDeviceState *s = ACPIERST(pci_dev);
>> +
>> +    trace_acpi_erst_realizefn_in();
>> +
>> +    if (!s->hostmem) {
>> +        error_setg(errp, "'" ACPI_ERST_MEMDEV_PROP "' property is not set");
>> +        return;
>> +    } else if (host_memory_backend_is_mapped(s->hostmem)) {
>> +        error_setg(errp, "can't use already busy memdev: %s",
>> +                   object_get_canonical_path_component(OBJECT(s->hostmem)));
>> +        return;
>> +    }
>> +
>> +    s->hostmem_mr = host_memory_backend_get_memory(s->hostmem);
>> +
>> +    /* HostMemoryBackend size will be multiple of PAGE_SIZE */
>> +    s->storage_size = object_property_get_int(OBJECT(s->hostmem), "size", errp);
>> +
>> +    /* Initialize backend storage and record_count */
>> +    check_erst_backend_storage(s, errp);
>> +
>> +    /* BAR 0: Programming registers */
>> +    memory_region_init_io(&s->iomem_mr, OBJECT(pci_dev), &erst_reg_ops, s,
>> +                          TYPE_ACPI_ERST, ERST_REG_SIZE);
>> +    pci_register_bar(pci_dev, 0, PCI_BASE_ADDRESS_SPACE_MEMORY, &s->iomem_mr);
>> +
>> +    /* BAR 1: Exchange buffer memory */
>> +    memory_region_init_ram(&s->exchange_mr, OBJECT(pci_dev),
>> +                            "erst.exchange",
>> +                            le32_to_cpu(s->header->record_size), errp);
>> +    pci_register_bar(pci_dev, 1, PCI_BASE_ADDRESS_SPACE_MEMORY,
>> +                        &s->exchange_mr);
>> +
>> +    /* Include the backend storage in the migration stream */
>> +    vmstate_register_ram_global(s->hostmem_mr);
>> +
>> +    trace_acpi_erst_realizefn_out(s->storage_size);
>> +}
>> +
>> +static void erst_reset(DeviceState *dev)
>> +{
>> +    ERSTDeviceState *s = ACPIERST(dev);
>> +
>> +    trace_acpi_erst_reset_in(le32_to_cpu(s->header->record_count));
>> +    s->operation = 0;
>> +    s->busy_status = 0;
>> +    s->command_status = STATUS_SUCCESS;
>> +    s->record_identifier = ERST_UNSPECIFIED_RECORD_ID;
>> +    s->record_offset = 0;
>> +    s->next_record_index = s->first_record_index;
>> +    /* NOTE: first/last_record_index are computed only once */
>> +    trace_acpi_erst_reset_out(le32_to_cpu(s->header->record_count));
>> +}
>> +
>> +static Property erst_properties[] = {
>> +    DEFINE_PROP_LINK(ACPI_ERST_MEMDEV_PROP, ERSTDeviceState, hostmem,
>> +                     TYPE_MEMORY_BACKEND, HostMemoryBackend *),
>> +    DEFINE_PROP_UINT32(ACPI_ERST_RECORD_SIZE_PROP, ERSTDeviceState,
>> +                     default_record_size, ERST_RECORD_SIZE),
>> +    DEFINE_PROP_END_OF_LIST(),
>> +};
>> +
>> +static void erst_class_init(ObjectClass *klass, void *data)
>> +{
>> +    DeviceClass *dc = DEVICE_CLASS(klass);
>> +    PCIDeviceClass *k = PCI_DEVICE_CLASS(klass);
>> +
>> +    trace_acpi_erst_class_init_in();
>> +    k->realize = erst_realizefn;
>> +    k->vendor_id = PCI_VENDOR_ID_REDHAT;
>> +    k->device_id = PCI_DEVICE_ID_REDHAT_ACPI_ERST;
>> +    k->revision = 0x00;
>> +    k->class_id = PCI_CLASS_OTHERS;
>> +    dc->reset = erst_reset;
>> +    dc->vmsd = &erst_vmstate;
>> +    dc->user_creatable = true;
>> +    dc->hotpluggable = false;
>> +    device_class_set_props(dc, erst_properties);
>> +    dc->desc = "ACPI Error Record Serialization Table (ERST) device";
>> +    set_bit(DEVICE_CATEGORY_MISC, dc->categories);
>> +    trace_acpi_erst_class_init_out();
>> +}
>> +
>> +static const TypeInfo erst_type_info = {
>> +    .name          = TYPE_ACPI_ERST,
>> +    .parent        = TYPE_PCI_DEVICE,
>> +    .class_init    = erst_class_init,
>> +    .instance_size = sizeof(ERSTDeviceState),
>> +    .interfaces = (InterfaceInfo[]) {
>> +        { INTERFACE_CONVENTIONAL_PCI_DEVICE },
>> +        { }
>> +    }
>> +};
>> +
>> +static void erst_register_types(void)
>> +{
>> +    type_register_static(&erst_type_info);
>> +}
>> +
>> +type_init(erst_register_types)
>> diff --git a/hw/acpi/meson.build b/hw/acpi/meson.build
>> index adf6347..f5b2298 100644
>> --- a/hw/acpi/meson.build
>> +++ b/hw/acpi/meson.build
>> @@ -22,6 +22,7 @@ acpi_ss.add(when: 'CONFIG_ACPI_PCIHP', if_true: files('pcihp.c'))
>>   acpi_ss.add(when: 'CONFIG_ACPI_PCIHP', if_false: files('acpi-pci-hotplug-stub.c'))
>>   acpi_ss.add(when: 'CONFIG_ACPI_VIOT', if_true: files('viot.c'))
>>   acpi_ss.add(when: 'CONFIG_ACPI_X86_ICH', if_true: files('ich9.c', 'tco.c'))
>> +acpi_ss.add(when: 'CONFIG_ACPI_ERST', if_true: files('erst.c'))
>>   acpi_ss.add(when: 'CONFIG_IPMI', if_true: files('ipmi.c'), if_false: files('ipmi-stub.c'))
>>   acpi_ss.add(when: 'CONFIG_PC', if_false: files('acpi-x86-stub.c'))
>>   acpi_ss.add(when: 'CONFIG_TPM', if_true: files('tpm.c'))
>> diff --git a/hw/acpi/trace-events b/hw/acpi/trace-events
>> index 974d770..2250126 100644
>> --- a/hw/acpi/trace-events
>> +++ b/hw/acpi/trace-events
>> @@ -55,3 +55,18 @@ piix4_gpe_writeb(uint64_t addr, unsigned width, uint64_t val) "addr: 0x%" PRIx64
>>   # tco.c
>>   tco_timer_reload(int ticks, int msec) "ticks=%d (%d ms)"
>>   tco_timer_expired(int timeouts_no, bool strap, bool no_reboot) "timeouts_no=%d no_reboot=%d/%d"
>> +
>> +# erst.c
>> +acpi_erst_reg_write(uint64_t addr, uint64_t val, unsigned size) "addr: 0x%04" PRIx64 " <== 0x%016" PRIx64 " (size: %u)"
>> +acpi_erst_reg_read(uint64_t addr, uint64_t val, unsigned size) " addr: 0x%04" PRIx64 " ==> 0x%016" PRIx64 " (size: %u)"
>> +acpi_erst_mem_write(uint64_t addr, uint64_t val, unsigned size) "addr: 0x%06" PRIx64 " <== 0x%016" PRIx64 " (size: %u)"
>> +acpi_erst_mem_read(uint64_t addr, uint64_t val, unsigned size) " addr: 0x%06" PRIx64 " ==> 0x%016" PRIx64 " (size: %u)"
>> +acpi_erst_pci_bar_0(uint64_t addr) "BAR0: 0x%016" PRIx64
>> +acpi_erst_pci_bar_1(uint64_t addr) "BAR1: 0x%016" PRIx64
>> +acpi_erst_realizefn_in(void)
>> +acpi_erst_realizefn_out(unsigned size) "total nvram size %u bytes"
>> +acpi_erst_reset_in(unsigned record_count) "record_count %u"
>> +acpi_erst_reset_out(unsigned record_count) "record_count %u"
>> +acpi_erst_post_load(void *header, unsigned slot_size) "header: 0x%p slot_size %u"
>> +acpi_erst_class_init_in(void)
>> +acpi_erst_class_init_out(void)
>> --
>> 1.8.3.1
>>

