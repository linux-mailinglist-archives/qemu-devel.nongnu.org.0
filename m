Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C271A4D513D
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Mar 2022 19:20:01 +0100 (CET)
Received: from localhost ([::1]:40546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSNOK-0004aw-EA
	for lists+qemu-devel@lfdr.de; Thu, 10 Mar 2022 13:20:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44052)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1nSNNH-0003ue-S5
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 13:18:55 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:42748)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1nSNNE-0004P3-Or
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 13:18:55 -0500
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22AIB6ae030141; 
 Thu, 10 Mar 2022 18:18:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : from : to : cc : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=6iNhjpTJCfTSeRRSuITep8y/y6l/cYa1QngpGl0jDqw=;
 b=HKmvPh6JSJ4NyUnIQxJpjlgHdy6chFSJUdZbNqsrsPeUZ5Zaw4dRcQkzvyDpJNUFVxFR
 iv7c+PKHAUZekG+Nsl+IuAWW9JMFzeh8jBjTkOdyyv68Hh/dMqXQF66S2g0eTncEFjhu
 PB4V2zsgTAiMUkrcpeFWoBQLdy4VqjId+fdxdN32lDsVvaJv5HMn0MAXHjaVqI8mxNAP
 ppB/qTLJ65i2uJ9+ub4f7gOtwq+12R6S3Sd1biDRBRc+d8GpljlNx0hPNehn8/Gke2mA
 boNckg9pMaYqd1z704iSdd5nXnBwpnDt+fSAYJRyBl8hn/RIoIwyb/A+CKoMPiU0axft Cg== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 3ekyrawhqc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 10 Mar 2022 18:18:44 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 22AIAOrk145070;
 Thu, 10 Mar 2022 18:18:43 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2106.outbound.protection.outlook.com [104.47.55.106])
 by userp3020.oracle.com with ESMTP id 3envvnebqu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 10 Mar 2022 18:18:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UCebCJeRU91svc1dhEC20iHfqOBi5+TPTl0fws49rXnCLmRcc4f417iT+luogORhhpjCBhiBKXnCzVRBQRS22wH4se0BPYAcUdlisFYPcB2Saar3xO0jgTb6q8zGiI+znrcDbi4tq8hNG4I8POjYEtulOymQ/LPoLtqlqQrA2iryUtLcBBNI9wuRdZsIYBV84/PPG+G/ycNkTEEhxFQkceLOJgdnDnFnsV3LJyfH4Fu2l4b3jAud7WCyVuP3AhwHdHvoZSz4krm2vvc+z8w1OljVHn443l13V3reus8SuSPNMCMXQYO6PryCz04nTgGTxpcQe6ozq/TodhIElrUxfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6iNhjpTJCfTSeRRSuITep8y/y6l/cYa1QngpGl0jDqw=;
 b=Rko320puP704fwbVZF9jda8Qhk6o4dzqiAFYw8ioV3RLkY1yg4eav8fCxV7WxJlNUn7IT8xHMmN0rxpktBRc9HIX098xKetAWTbagPnHyOxPweFQdGgyhb/q8CUNPBqaJrYLNeiL1XPdxfpZ7qbZnhqY6o9xzY0Qtle4P3PIWsTpuvA6UAlwGcqu1nZb8bCN71ZGcvimQAHJ1iuwbtPJuDe3WmoYd53evn0mCBCTQu3xDfeB3MUPNiok7C3Uq9xqfnrdOJPRLhLV3EO9RQQk+VOsV3o8jB6UlM099c7H7jRbEjOIAeyF5ZRzSi6EsPSOloggUjaLfvlouWEO99UsEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6iNhjpTJCfTSeRRSuITep8y/y6l/cYa1QngpGl0jDqw=;
 b=LHKq7i0l4KIOVIAny00oJldU75kSG1mUMLKdPFewUQHLqBuqqkai9cMLUVhZgjwevT+VW2x2fZWs1OZ+i6pHouEz4N3gxLjZwodyPWhmn/wnJJjJIOZeJ/iv/qkejEURAAY6RpsTAVgtDiwRO3AQGuskQn7Eku9IOJtFtDb9xHQ=
Received: from BYAPR10MB3240.namprd10.prod.outlook.com (2603:10b6:a03:155::17)
 by PH0PR10MB5531.namprd10.prod.outlook.com (2603:10b6:510:10d::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Thu, 10 Mar
 2022 18:18:40 +0000
Received: from BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::6005:8b9:1b00:b0da]) by BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::6005:8b9:1b00:b0da%6]) with mapi id 15.20.5038.026; Thu, 10 Mar 2022
 18:18:40 +0000
Message-ID: <88be3aa0-0d7f-08c5-8278-07a3c5b701c8@oracle.com>
Date: Thu, 10 Mar 2022 13:18:35 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH V7 10/29] machine: memfd-alloc option
Content-Language: en-US
From: Steven Sistare <steven.sistare@oracle.com>
To: Igor Mammedov <imammedo@redhat.com>
References: <1640199934-455149-1-git-send-email-steven.sistare@oracle.com>
 <1640199934-455149-11-git-send-email-steven.sistare@oracle.com>
 <20220303121534-mutt-send-email-mst@kernel.org>
 <20220304114124.6fe97646@redhat.com>
 <c42748ca-3e06-d57e-dcfb-a2a97006d2fc@oracle.com>
 <20220307184045-mutt-send-email-mst@kernel.org>
 <20220308082048.1783adbc@redhat.com>
 <3e0803ef-392a-b863-3474-3f76dcd27ae1@oracle.com>
 <20220310170025.33b9f6f0@redhat.com>
 <d62b16fc-f01a-586d-9fcf-d44abc100cb2@oracle.com>
Organization: Oracle Corporation
In-Reply-To: <d62b16fc-f01a-586d-9fcf-d44abc100cb2@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR07CA0099.namprd07.prod.outlook.com
 (2603:10b6:a03:12b::40) To BYAPR10MB3240.namprd10.prod.outlook.com
 (2603:10b6:a03:155::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7dd466dc-29ae-4547-986c-08da02c266eb
X-MS-TrafficTypeDiagnostic: PH0PR10MB5531:EE_
X-Microsoft-Antispam-PRVS: <PH0PR10MB5531242F6CA225F22057DF34F90B9@PH0PR10MB5531.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0o+Qlm1YUqh6RqT+7+155ChKrrAMA/YBb+5qB90cFqupqzF6EeIjiUTGaXhlyoSMkDeinfdukhh7bfkuCeob5CcFA556ZGCK4uOWet1vV1ojHpW52NyIdbJeXaEgRiwXc48OJiLbXjzatwh9l51vxRrt1iVR1RW8whFaftTtnzSNeHcqITitJwWkm9UNnCokOUt9CPc6Db3TCs1qsaYtr8qZt/ye+siIhQny0V8WpPQOzpBtLL4OGjKEMp2wI2hDitl3Hws9GLvtW4QawmJv5PkUnnNm/g7Wn6FZvuVCdMMqlfAr8395DVTCWEQPYuLR8QKuP4hgek9EVxqKSKIs8S2uNO3fVs0ZF1JHRVAbBR66AumpzDhSLBsZ8wM9i1qwCclQ/aEq4GWCq5q71QD4AAIasWrhVnKjTmgK3QdUmfFzQhyvA3JmQ8cwN8BjtOWg1eZJp130IECTO99ytqJfaiLIQz2/MgdOvPotamldl5gAtPgtHeH4R+lecVc6XblTBEWqkB0WEgGQTycigfNHVVwm28F34A27KQC+pMuOGpKi6SIJbBVytXQO4Z9KHLS95aTwUcQn7LB9vYDGXPrQ7DWctjlO/g8CFaD59x39Y5PzDwWmRvp+p/SPj2F1A4pXv3hP1avvqoLGaciaGvX2vnMC6ayiNcf946BXXEydgI7FyQ7wMGq+wcNqe5Uv2yLG8gb0dGnlJxCO2VGmdGbIkL8ne+EY6HUETFe39RdONnaxHNNd8dyEzlh9t7vBjv/j
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3240.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(2906002)(38100700002)(31696002)(6486002)(5660300002)(8936002)(508600001)(36756003)(31686004)(316002)(6916009)(54906003)(6506007)(83380400001)(86362001)(66476007)(66946007)(66556008)(186003)(6666004)(26005)(44832011)(30864003)(6512007)(53546011)(36916002)(7416002)(2616005)(8676002)(4326008)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NGRKY1NWV3JKQ082bTBjWU5BOEZXYkVkOUtuVEFzVmZWcG81eHI5Z2xYVWFX?=
 =?utf-8?B?a2UrNVZFS1BqQnNld3l6MjRERFlFQVFXQnVIaE43cUFaUmxtUWNBa3hZSXZ5?=
 =?utf-8?B?QWc1T2QxWlF4emZtS0NpZ2VoVzZDMGYxd21KOFczOXNadUY3bGZXSmg1RnRx?=
 =?utf-8?B?UTd2QVBsNTM4V211OTJYSEZROENCbVNjL0RIRnZ3K0haVC82WVVBMStuK2hx?=
 =?utf-8?B?b1RNYVdobkNIV055NGlvYTh5Mi9nVkpDU3lqeEs4bnZlWTJHbGtCUHZEN3d2?=
 =?utf-8?B?V1grYW5leVVyVWRVL0hmRjNzRE8rSndIMXQ5eFF6Y25ZaThoSlJzWUJ3UDBn?=
 =?utf-8?B?WE9oNkhiRUhvVjF4V3ZsVHhkM29oTEdaUjhFak95Q2dFS3BMZHdTR0NPRXNC?=
 =?utf-8?B?RVcxMFpvQmFjUUFmN05pRVpTQi90Nlc3YWp2MWxhVXhaQjBGR2thL1BSNThW?=
 =?utf-8?B?U0dlVnRkajN0eURlOUdhWWNPTnduYmlXbXJ1QmRCZ1RtZXZLSVlwV2pySVVX?=
 =?utf-8?B?TEVwMy9Tb05jOXZoNG9GbDJPbm5HZTNsbm5Qb09YUWMzTkFhL1FGd1RJd2tt?=
 =?utf-8?B?d1R4TW5yOFE2MlViVUQyU0t6OTVxN1NHeW10bmJXMkI0M2k1QWVHWUtUcWwy?=
 =?utf-8?B?eW53d2h5QVFuNk9zaWdtYnVlbVBnYTlHQWZqQlpNOGUzSlB0Q2RxakFZRmdk?=
 =?utf-8?B?N21kaVd3WXFBUG55dnVBQ1RCUnNkUjJVQ05vR0hKWmtDcGRYdUZYY3B5YmtX?=
 =?utf-8?B?OEtkOXh2NzA2Qm5tYVFTUEtsdVRqMkNWNXIxclQwaEk2Sm1ycTNZQ3hQdTJm?=
 =?utf-8?B?eHpXZXRoeWJzZUZPOEpBelp2RktnQkpWZVVpTVJnUXYrOVU1cFhFQkJpNUNG?=
 =?utf-8?B?Z0RjNDlUR0h1K1BnaENRanNSdGU4T3RkaldON2RFZm5aTVhrSTZlT0dWeFFN?=
 =?utf-8?B?NDdCZGlNSzZzd3ZsR21ocHBXUE5BSHMrZ1gvdUtTNVpxc3hQSTRnUytpUnJJ?=
 =?utf-8?B?VGR5NEk5ZDFEKzk5ZUs4eVM2UFoxbUxmcC8xQzhEelBjeGJPTG42UFMyNHlu?=
 =?utf-8?B?cHk0VGIxUjFOWFBjZ3lJRGJMU1ZkK0hsKzdDTWZqU3RjbTAxd1Y4SWF2UXlS?=
 =?utf-8?B?dkVnQmxDOTdod2NXR2hlQ0Q0RnQxQ0FqOWNLNk5jdjNOcEpmMXFjTmV6a05D?=
 =?utf-8?B?K2xEQW5FdGRmUlFpaDNaKzl0azluQUlFcE9ROHpIK0E1djQzQUVvbE5ZTFNh?=
 =?utf-8?B?ZUVZVFdjM25ncy9xTVR2cXk4Q2JpMHlVU3RLeU1YajNoZ2JQR1NtS2srN1k5?=
 =?utf-8?B?NmNTN0R5V1JuR2hWVHpFRkRkVWVkM3A4YUFuaUVPaWtpTXZHM0tSbjBhbmY2?=
 =?utf-8?B?QzJyRmdVWUtTWU9YWUhlTnc2ZTIyZEhIZVVlQVc0c1R0akhBQThDNTI4aGkx?=
 =?utf-8?B?MmhNZitZKzBiNG9zVkREcU03SmVETVUyWXBncHpvMk8rcDVrL24rc1VpT2pF?=
 =?utf-8?B?Z2djd00rQXhhV1VJOTZsTGZGWmRobEZZbFNFKzBUbzM5aUp6M2dSZHRacDdx?=
 =?utf-8?B?RTg1NTJ2dE9SM0Fmc3MydWhaVlB5TU9jYjBNQ2tsZnRjK2RtOThUTGNiRUNS?=
 =?utf-8?B?TEprdllONUpIamE2ZmV3bXhCTkNFY2cwZURmWnAyQkxndmR3VTh5NkVIMEdN?=
 =?utf-8?B?cmNvWHNtcEE1ZFBtVVJqSlErSXFRSXU0dGkwbExsVE9FUk41TmlYVnVEcURr?=
 =?utf-8?B?bTNEb3Boa0pZL09FcnVVa1JDb3R2TEZRRWRHaVdUUy9seEZKYUVIYTdZU0ly?=
 =?utf-8?B?K2pLQXJ3MGdudTBONUFEZTRVdkpZaytrN0tRdzUvc0xnK0w0NCtDbEZXUStY?=
 =?utf-8?B?L3RDdDU3bm9RTDFBMXAveEVHemtELzVkanRTUWdyajF4MEtkU1RFWmVvMEJu?=
 =?utf-8?B?V0xCUWo3K3gwcSt5TGRUU3luS2V4V3IrS2kvQm1WQ2Z1OTRkTXgwb21BNzBk?=
 =?utf-8?B?TkE0TWJHYUc4S3JBYVBaclRybE5FNG5tOTRjbGFYMWd0VlBhajV3clJaamhs?=
 =?utf-8?B?b2QrWjROUXRKMnhMQ1JkRXYvcWVkUUlWRi82UElFdVZqd040NFBFaGs5YTlm?=
 =?utf-8?B?RS9jcFhxd0tLOXk0OEFvczdLMTJQbTNZbHRzeGh1dHpZYWdvMnR4T1VyUll3?=
 =?utf-8?B?K0JoNDRsbEV1ZjBPcXFOUlFFNExJSXRUcTNnQlVyZmhWTFVOcXdhaDI5YkpW?=
 =?utf-8?B?MzhPbTJ0cTVwWFo1cWxuRG5sdHNRPT0=?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7dd466dc-29ae-4547-986c-08da02c266eb
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3240.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2022 18:18:40.2629 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ltGh2PAOABJ+7Xw4urmXtoToe1WujeV1FvAEaIaUyVHtruX/r0lYa+6ZB3oAYt7sOEfw9Bfmm9RhI5vM591x7MyVEfsaAvy9ewSjOLXv3Xw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB5531
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10282
 signatures=692556
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 mlxlogscore=999 bulkscore=0
 phishscore=0 malwarescore=0 suspectscore=0 mlxscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2203100096
X-Proofpoint-GUID: a6LkXPEp7YSZcTfL4ZpL8DU1d-szC2yt
X-Proofpoint-ORIG-GUID: a6LkXPEp7YSZcTfL4ZpL8DU1d-szC2yt
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=steven.sistare@oracle.com; helo=mx0a-00069f02.pphosted.com
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
Cc: Jason Zeng <jason.zeng@linux.intel.com>,
 Juan Quintela <quintela@redhat.com>, Eric Blake <eblake@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, David Hildenbrand <david@redhat.com>,
 qemu-devel@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Zheng Chuan <zhengchuan@huawei.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/10/2022 12:28 PM, Steven Sistare wrote:
> On 3/10/2022 11:00 AM, Igor Mammedov wrote:
>> On Thu, 10 Mar 2022 10:36:08 -0500
>> Steven Sistare <steven.sistare@oracle.com> wrote:
>>
>>> On 3/8/2022 2:20 AM, Igor Mammedov wrote:
>>>> On Tue, 8 Mar 2022 01:50:11 -0500
>>>> "Michael S. Tsirkin" <mst@redhat.com> wrote:
>>>>   
>>>>> On Mon, Mar 07, 2022 at 09:41:44AM -0500, Steven Sistare wrote:  
>>>>>> On 3/4/2022 5:41 AM, Igor Mammedov wrote:    
>>>>>>> On Thu, 3 Mar 2022 12:21:15 -0500
>>>>>>> "Michael S. Tsirkin" <mst@redhat.com> wrote:
>>>>>>>     
>>>>>>>> On Wed, Dec 22, 2021 at 11:05:15AM -0800, Steve Sistare wrote:    
>>>>>>>>> Allocate anonymous memory using memfd_create if the memfd-alloc machine
>>>>>>>>> option is set.
>>>>>>>>>
>>>>>>>>> Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
>>>>>>>>> ---
>>>>>>>>>  hw/core/machine.c   | 19 +++++++++++++++++++
>>>>>>>>>  include/hw/boards.h |  1 +
>>>>>>>>>  qemu-options.hx     |  6 ++++++
>>>>>>>>>  softmmu/physmem.c   | 47 ++++++++++++++++++++++++++++++++++++++---------
>>>>>>>>>  softmmu/vl.c        |  1 +
>>>>>>>>>  trace-events        |  1 +
>>>>>>>>>  util/qemu-config.c  |  4 ++++
>>>>>>>>>  7 files changed, 70 insertions(+), 9 deletions(-)
>>>>>>>>>
>>>>>>>>> diff --git a/hw/core/machine.c b/hw/core/machine.c
>>>>>>>>> index 53a99ab..7739d88 100644
>>>>>>>>> --- a/hw/core/machine.c
>>>>>>>>> +++ b/hw/core/machine.c
>>>>>>>>> @@ -392,6 +392,20 @@ static void machine_set_mem_merge(Object *obj, bool value, Error **errp)
>>>>>>>>>      ms->mem_merge = value;
>>>>>>>>>  }
>>>>>>>>>  
>>>>>>>>> +static bool machine_get_memfd_alloc(Object *obj, Error **errp)
>>>>>>>>> +{
>>>>>>>>> +    MachineState *ms = MACHINE(obj);
>>>>>>>>> +
>>>>>>>>> +    return ms->memfd_alloc;
>>>>>>>>> +}
>>>>>>>>> +
>>>>>>>>> +static void machine_set_memfd_alloc(Object *obj, bool value, Error **errp)
>>>>>>>>> +{
>>>>>>>>> +    MachineState *ms = MACHINE(obj);
>>>>>>>>> +
>>>>>>>>> +    ms->memfd_alloc = value;
>>>>>>>>> +}
>>>>>>>>> +
>>>>>>>>>  static bool machine_get_usb(Object *obj, Error **errp)
>>>>>>>>>  {
>>>>>>>>>      MachineState *ms = MACHINE(obj);
>>>>>>>>> @@ -829,6 +843,11 @@ static void machine_class_init(ObjectClass *oc, void *data)
>>>>>>>>>      object_class_property_set_description(oc, "mem-merge",
>>>>>>>>>          "Enable/disable memory merge support");
>>>>>>>>>  
>>>>>>>>> +    object_class_property_add_bool(oc, "memfd-alloc",
>>>>>>>>> +        machine_get_memfd_alloc, machine_set_memfd_alloc);
>>>>>>>>> +    object_class_property_set_description(oc, "memfd-alloc",
>>>>>>>>> +        "Enable/disable allocating anonymous memory using memfd_create");
>>>>>>>>> +
>>>>>>>>>      object_class_property_add_bool(oc, "usb",
>>>>>>>>>          machine_get_usb, machine_set_usb);
>>>>>>>>>      object_class_property_set_description(oc, "usb",
>>>>>>>>> diff --git a/include/hw/boards.h b/include/hw/boards.h
>>>>>>>>> index 9c1c190..a57d7a0 100644
>>>>>>>>> --- a/include/hw/boards.h
>>>>>>>>> +++ b/include/hw/boards.h
>>>>>>>>> @@ -327,6 +327,7 @@ struct MachineState {
>>>>>>>>>      char *dt_compatible;
>>>>>>>>>      bool dump_guest_core;
>>>>>>>>>      bool mem_merge;
>>>>>>>>> +    bool memfd_alloc;
>>>>>>>>>      bool usb;
>>>>>>>>>      bool usb_disabled;
>>>>>>>>>      char *firmware;
>>>>>>>>> diff --git a/qemu-options.hx b/qemu-options.hx
>>>>>>>>> index 7d47510..33c8173 100644
>>>>>>>>> --- a/qemu-options.hx
>>>>>>>>> +++ b/qemu-options.hx
>>>>>>>>> @@ -30,6 +30,7 @@ DEF("machine", HAS_ARG, QEMU_OPTION_machine, \
>>>>>>>>>      "                vmport=on|off|auto controls emulation of vmport (default: auto)\n"
>>>>>>>>>      "                dump-guest-core=on|off include guest memory in a core dump (default=on)\n"
>>>>>>>>>      "                mem-merge=on|off controls memory merge support (default: on)\n"
>>>>>>>>> +    "                memfd-alloc=on|off controls allocating anonymous guest RAM using memfd_create (default: off)\n"      
>>>>>>>>
>>>>>>>> Question: are there any disadvantages associated with using
>>>>>>>> memfd_create? I guess we are using up an fd, but that seems minor.  Any
>>>>>>>> reason not to set to on by default? maybe with a fallback option to
>>>>>>>> disable that?    
>>>>>>
>>>>>> Old Linux host kernels, circa 4.1, do not support huge pages for shared memory.
>>>>>> Also, the tunable to enable huge pages for share memory is different than for
>>>>>> anon memory, so there could be performance loss if it is not set correctly.
>>>>>>     /sys/kernel/mm/transparent_hugepage/enabled
>>>>>>     vs
>>>>>>     /sys/kernel/mm/transparent_hugepage/shmem_enabled    
>>>>>
>>>>> I guess we can test this when launching the VM, and select
>>>>> a good default.
>>>>>  
>>>>>> It might make sense to use memfd_create by default for the secondary segments.    
>>>>>
>>>>> Well there's also KSM now you mention it.  
>>>>
>>>> then another quest, is there downside to always using memfd_create
>>>> without any knobs being involved?  
>>>
>>> Lower performance if small pages are used (but Michael suggests qemu could 
>>> automatically check the tunable and use anon memory instead)
>>>
>>> KSM (same page merging) is not supported for shared memory, so ram_block_add ->
>>> memory_try_enable_merging will not enable it.
>>>
>>> In both cases, I expect the degradation would be negligible if memfd_create is
>>> only automatically applied to the secondary segments, which are typically small.
>>> But, someone's secondary segment could be larger, and it is time consuming to
>>> prove innocence when someone claims your change caused their performance regression.
>>
>> Adding David as memory subsystem maintainer, maybe he will a better
>> idea instead of introducing global knob that would also magically alter 
>> backends' behavior despite of its their configured settings.
> 
> OK, in ram_block_add I can set the RAM_SHARED flag based on the memory-backend object's
> shared flag.  I already set the latter in create_default_memdev when memfd-alloc is
> specified.  With that change, we do not override configured settings.  Users can no longer
> use memory-backend-ram for CPR, and must change all memory-backend-ram to memory-backend-memfd
> in the command-line arguments.  That is fine.
> 
> With that change, are you OK with this patch?

Sorry, I mis-read my own code in ram_block_add.  The existing code is correct and does 
not alter any backend's behavior.   It only sets the shared flag when the ram is *not* 
being allocated for a backend:

                if (!object_dynamic_cast(parent, TYPE_MEMORY_BACKEND)) {
                    new_block->flags |= RAM_SHARED;
                }

- Steve

>>>>>>>> I am concerned that it's actually a kind of memory backend, this flag
>>>>>>>> seems to instead be closer to the deprecated mem-prealloc. E.g.
>>>>>>>> it does not work with a mem path, does it?    
>>>>>>
>>>>>> One can still define a memory backend with mempath to create the main ram segment,
>>>>>> though it must be some form of shared to work with live update.  Indeed, I would 
>>>>>> expect most users to specify an explicit memory backend for it.  The secondary
>>>>>> segments would still use memfd_create.
>>>>>>     
>>>>>>> (mem path and mem-prealloc are transparently aliased to used memory backend
>>>>>>> if I recall it right.)
>>>>>>>
>>>>>>> Steve,
>>>>>>>
>>>>>>> For allocating guest RAM, we switched exclusively to using memory-backends
>>>>>>> including initial guest RAM (-m size option) and we have hostmem-memfd
>>>>>>> that uses memfd_create() and I'd rather avoid adding random knobs to machine
>>>>>>> for tweaking how RAM should be allocated, we have memory backends for this,
>>>>>>> so this patch begs the question: why hostmem-memfd is not sufficient?
>>>>>>> (patch description is rather lacking on rationale behind the patch)    
>>>>>>
>>>>>> There is currently no way to specify memory backends for the secondary memory
>>>>>> segments (vram, roms, etc), and IMO it would be onerous to specify a backend for
>>>>>> each of them.  On x86_64, these include pc.bios, vga.vram, pc.rom, vga.rom,
>>>>>> /rom@etc/acpi/tables, /rom@etc/table-loader, /rom@etc/acpi/rsdp.
>>
>> MemoryRegion is not the only place where state is stored.
>> If we only talk about fwcfg entries state, it can also reference
>> plain malloced memory allocated elsewhere or make a deep copy internally.
>> Similarly devices also may store state outside of RamBlock framework.
>>
>> How are you dealing with that?
>>
>>>>>>
>>>>>> - Steve
>>>>>>     
>>>>>>>>>      "                aes-key-wrap=on|off controls support for AES key wrapping (default=on)\n"
>>>>>>>>>      "                dea-key-wrap=on|off controls support for DEA key wrapping (default=on)\n"
>>>>>>>>>      "                suppress-vmdesc=on|off disables self-describing migration (default=off)\n"
>>>>>>>>> @@ -76,6 +77,11 @@ SRST
>>>>>>>>>          supported by the host, de-duplicates identical memory pages
>>>>>>>>>          among VMs instances (enabled by default).
>>>>>>>>>  
>>>>>>>>> +    ``memfd-alloc=on|off``
>>>>>>>>> +        Enables or disables allocation of anonymous guest RAM using
>>>>>>>>> +        memfd_create.  Any associated memory-backend objects are created with
>>>>>>>>> +        share=on.  The memfd-alloc default is off.
>>>>>>>>> +
>>>>>>>>>      ``aes-key-wrap=on|off``
>>>>>>>>>          Enables or disables AES key wrapping support on s390-ccw hosts.
>>>>>>>>>          This feature controls whether AES wrapping keys will be created
>>>>>>>>> diff --git a/softmmu/physmem.c b/softmmu/physmem.c
>>>>>>>>> index 3524c04..95e2b49 100644
>>>>>>>>> --- a/softmmu/physmem.c
>>>>>>>>> +++ b/softmmu/physmem.c
>>>>>>>>> @@ -41,6 +41,7 @@
>>>>>>>>>  #include "qemu/config-file.h"
>>>>>>>>>  #include "qemu/error-report.h"
>>>>>>>>>  #include "qemu/qemu-print.h"
>>>>>>>>> +#include "qemu/memfd.h"
>>>>>>>>>  #include "exec/memory.h"
>>>>>>>>>  #include "exec/ioport.h"
>>>>>>>>>  #include "sysemu/dma.h"
>>>>>>>>> @@ -1964,35 +1965,63 @@ static void ram_block_add(RAMBlock *new_block, Error **errp)
>>>>>>>>>      const bool shared = qemu_ram_is_shared(new_block);
>>>>>>>>>      RAMBlock *block;
>>>>>>>>>      RAMBlock *last_block = NULL;
>>>>>>>>> +    struct MemoryRegion *mr = new_block->mr;
>>>>>>>>>      ram_addr_t old_ram_size, new_ram_size;
>>>>>>>>>      Error *err = NULL;
>>>>>>>>> +    const char *name;
>>>>>>>>> +    void *addr = 0;
>>>>>>>>> +    size_t maxlen;
>>>>>>>>> +    MachineState *ms = MACHINE(qdev_get_machine());
>>>>>>>>>  
>>>>>>>>>      old_ram_size = last_ram_page();
>>>>>>>>>  
>>>>>>>>>      qemu_mutex_lock_ramlist();
>>>>>>>>> -    new_block->offset = find_ram_offset(new_block->max_length);
>>>>>>>>> +    maxlen = new_block->max_length;
>>>>>>>>> +    new_block->offset = find_ram_offset(maxlen);
>>>>>>>>>  
>>>>>>>>>      if (!new_block->host) {
>>>>>>>>>          if (xen_enabled()) {
>>>>>>>>> -            xen_ram_alloc(new_block->offset, new_block->max_length,
>>>>>>>>> -                          new_block->mr, &err);
>>>>>>>>> +            xen_ram_alloc(new_block->offset, maxlen, new_block->mr, &err);
>>>>>>>>>              if (err) {
>>>>>>>>>                  error_propagate(errp, err);
>>>>>>>>>                  qemu_mutex_unlock_ramlist();
>>>>>>>>>                  return;
>>>>>>>>>              }
>>>>>>>>>          } else {
>>>>>>>>> -            new_block->host = qemu_anon_ram_alloc(new_block->max_length,
>>>>>>>>> -                                                  &new_block->mr->align,
>>>>>>>>> -                                                  shared, noreserve);
>>>>>>>>> -            if (!new_block->host) {
>>>>>>>>> +            name = memory_region_name(mr);
>>>>>>>>> +            if (ms->memfd_alloc) {
>>>>>>>>> +                Object *parent = &mr->parent_obj;
>>>>>>>>> +                int mfd = -1;          /* placeholder until next patch */
>>>>>>>>> +                mr->align = QEMU_VMALLOC_ALIGN;
>>>>>>>>> +                if (mfd < 0) {
>>>>>>>>> +                    mfd = qemu_memfd_create(name, maxlen + mr->align,
>>>>>>>>> +                                            0, 0, 0, &err);
>>>>>>>>> +                    if (mfd < 0) {
>>>>>>>>> +                        return;
>>>>>>>>> +                    }
>>>>>>>>> +                }
>>>>>>>>> +                qemu_set_cloexec(mfd);
>>>>>>>>> +                /* The memory backend already set its desired flags. */
>>>>>>>>> +                if (!object_dynamic_cast(parent, TYPE_MEMORY_BACKEND)) {
>>>>>>>>> +                    new_block->flags |= RAM_SHARED;
>>>>>>>>> +                }
>>>>>>>>> +                addr = file_ram_alloc(new_block, maxlen, mfd,
>>>>>>>>> +                                      false, false, 0, errp);
>>>>>>>>> +                trace_anon_memfd_alloc(name, maxlen, addr, mfd);
>>>>>>>>> +            } else {
>>>>>>>>> +                addr = qemu_anon_ram_alloc(maxlen, &mr->align,
>>>>>>>>> +                                           shared, noreserve);
>>>>>>>>> +            }
>>>>>>>>> +
>>>>>>>>> +            if (!addr) {
>>>>>>>>>                  error_setg_errno(errp, errno,
>>>>>>>>>                                   "cannot set up guest memory '%s'",
>>>>>>>>> -                                 memory_region_name(new_block->mr));
>>>>>>>>> +                                 name);
>>>>>>>>>                  qemu_mutex_unlock_ramlist();
>>>>>>>>>                  return;
>>>>>>>>>              }
>>>>>>>>> -            memory_try_enable_merging(new_block->host, new_block->max_length);
>>>>>>>>> +            memory_try_enable_merging(addr, maxlen);
>>>>>>>>> +            new_block->host = addr;
>>>>>>>>>          }
>>>>>>>>>      }
>>>>>>>>>  
>>>>>>>>> diff --git a/softmmu/vl.c b/softmmu/vl.c
>>>>>>>>> index 620a1f1..ab3648a 100644
>>>>>>>>> --- a/softmmu/vl.c
>>>>>>>>> +++ b/softmmu/vl.c
>>>>>>>>> @@ -2440,6 +2440,7 @@ static void create_default_memdev(MachineState *ms, const char *path)
>>>>>>>>>          object_property_set_str(obj, "mem-path", path, &error_fatal);
>>>>>>>>>      }
>>>>>>>>>      object_property_set_int(obj, "size", ms->ram_size, &error_fatal);
>>>>>>>>> +    object_property_set_bool(obj, "share", ms->memfd_alloc, &error_fatal);
>>>>>>>>>      object_property_add_child(object_get_objects_root(), mc->default_ram_id,
>>>>>>>>>                                obj);
>>>>>>>>>      /* Ensure backend's memory region name is equal to mc->default_ram_id */
>>>>>>>>> diff --git a/trace-events b/trace-events
>>>>>>>>> index a637a61..770a9ac 100644
>>>>>>>>> --- a/trace-events
>>>>>>>>> +++ b/trace-events
>>>>>>>>> @@ -45,6 +45,7 @@ ram_block_discard_range(const char *rbname, void *hva, size_t length, bool need_
>>>>>>>>>  # accel/tcg/cputlb.c
>>>>>>>>>  memory_notdirty_write_access(uint64_t vaddr, uint64_t ram_addr, unsigned size) "0x%" PRIx64 " ram_addr 0x%" PRIx64 " size %u"
>>>>>>>>>  memory_notdirty_set_dirty(uint64_t vaddr) "0x%" PRIx64
>>>>>>>>> +anon_memfd_alloc(const char *name, size_t size, void *ptr, int fd) "%s size %zu ptr %p fd %d"
>>>>>>>>>  
>>>>>>>>>  # gdbstub.c
>>>>>>>>>  gdbstub_op_start(const char *device) "Starting gdbstub using device %s"
>>>>>>>>> diff --git a/util/qemu-config.c b/util/qemu-config.c
>>>>>>>>> index 436ab63..3606e5c 100644
>>>>>>>>> --- a/util/qemu-config.c
>>>>>>>>> +++ b/util/qemu-config.c
>>>>>>>>> @@ -207,6 +207,10 @@ static QemuOptsList machine_opts = {
>>>>>>>>>              .type = QEMU_OPT_BOOL,
>>>>>>>>>              .help = "enable/disable memory merge support",
>>>>>>>>>          },{
>>>>>>>>> +            .name = "memfd-alloc",
>>>>>>>>> +            .type = QEMU_OPT_BOOL,
>>>>>>>>> +            .help = "enable/disable memfd_create for anonymous memory",
>>>>>>>>> +        },{
>>>>>>>>>              .name = "usb",
>>>>>>>>>              .type = QEMU_OPT_BOOL,
>>>>>>>>>              .help = "Set on/off to enable/disable usb",
>>>>>>>>> -- 
>>>>>>>>> 1.8.3.1      
>>>>>>>>
>>>>>>>>    
>>>>>>>     
>>>>>  
>>>>   
>>>
>>

