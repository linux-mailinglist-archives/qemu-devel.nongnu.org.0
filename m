Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 432E949CFA6
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Jan 2022 17:27:04 +0100 (CET)
Received: from localhost ([::1]:56686 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCl8R-0003WL-C7
	for lists+qemu-devel@lfdr.de; Wed, 26 Jan 2022 11:27:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55880)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1nCl5W-0000yg-3n
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 11:24:02 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:36354)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1nCl5T-0002Ab-IP
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 11:24:01 -0500
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20QFon5c028823; 
 Wed, 26 Jan 2022 16:23:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=6Va9m3Wj+75UpgrP0MoBqUwfTHDSRfxx98IMw3SoZiY=;
 b=KKFYFKsxI8cM4zcx6oNyHdraYRph5BK3O9Ob6BDDbYO5Kv/E301cblzUINsMUicWhJeP
 UoOUwbOJ6SwyGNL3GlBTSrNwHRV4aeVIUyeyI54mQ65QlI66qrLLF3nbeiLT7B1ZG2k9
 Gh/QgTDQfCNCkZ7BzVVSXksOvTtJy1C2rMBccO8MSt80qLT2ckVQsHqY3pFA4nVYCMot
 CSUW8Ybphl7Ldeldn3c+MP99K4ZY0HZ2M3iTi/6jFjvw7J1SKQPx0L66No5aUMLd9Y+B
 PuHvcs0467Wg57ndwZM4lULZI9oEltW5FZOPSHcVBdtvwI9cwLUx9xl/zEK3K3J3E5g4 RA== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 3dsxaaehmm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 26 Jan 2022 16:23:55 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 20QGB3S6148885;
 Wed, 26 Jan 2022 16:23:54 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2168.outbound.protection.outlook.com [104.47.57.168])
 by userp3030.oracle.com with ESMTP id 3dr721gg7r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 26 Jan 2022 16:23:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lt+GlAzCpoYvGm6vOBJY0t07Fn3iUHmmiqSP0DyeoiVAR2m01C+M4r/gKKKWArArINKfLcyPWdf3aa+Hpw8XMQrfS1B+NLkaFdzDHHY70L0nENqNtvZIHmnTXX4QjmuASiwrsxh6PuNta22mY2vdDKBjhkL0JGZdN22R7x1hXYZUt2zVuSbK4S6Of5RPNbjwS4B2OLbkjepZ9FZT9Bq/0paMlW50VXbu5nZBW2VeA3MAuQxvEpCdreGvwmW+aUeG9quOrvd5yA96l1jDlMVUPtTzyeKWW8PfSuszzDqU+V0PyhMZGADoO303uq82NVc2liM/l9aTlwGy7JIJd/9IEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6Va9m3Wj+75UpgrP0MoBqUwfTHDSRfxx98IMw3SoZiY=;
 b=dNXGIAfgjYJImXZ1sVXa7+WLsbYkNmk7blAmhQ4sckDBe01v74sAhWjQV+wGVBBqQQkUD1wfpTvyPaBGH8SpcW3qB0sorRDI3qNqTdUAPoRP218BWwFjbUJzIY3g/9Wmrc0ZtL8JE4QxkC6fzqDOHHkAaq7MfoHzmgJLFcsQhsg1MmiUCVnS468DRW+5h8+ystxgr/+gXT5xOT9KremhEgBYwBrtHfhndfkh3g/QYNlY5UoSVTYWyoHHikC8dOh606dg0FVEX+H/PK6bvd29TMiWqAaaYlKOCQfB9BL9scBcuTXxb14ovQPbrDDXGlxi3djFvYPZ7P6dt0DZW31lqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6Va9m3Wj+75UpgrP0MoBqUwfTHDSRfxx98IMw3SoZiY=;
 b=jhEIfuxAQ4ghpY0GDkiSITNzz182xyXtVeIlAHcAR9O7nxeWwqwXnt9W+T2RlVoNiRbrjAYpEDjcAuyStpWYAev/ctMmgK1328OgbdY5R8/V7ow953J66T+O1a/0oM4cHdhApbiPpF3mX9iD+GUH2osZLkMrPRr9O4V2SwffM7E=
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by BLAPR10MB5297.namprd10.prod.outlook.com (2603:10b6:208:326::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.15; Wed, 26 Jan
 2022 16:23:51 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::ac06:be4:5723:771c]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::ac06:be4:5723:771c%4]) with mapi id 15.20.4930.017; Wed, 26 Jan 2022
 16:23:51 +0000
Message-ID: <9cd25688-269a-5e67-13a8-bf75518ec3c5@oracle.com>
Date: Wed, 26 Jan 2022 10:23:48 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v13 06/10] ACPI ERST: build the ACPI ERST table
Content-Language: en-US
To: Ani Sinha <ani@anisinha.ca>
References: <1643044621-15892-1-git-send-email-eric.devolder@oracle.com>
 <1643044621-15892-7-git-send-email-eric.devolder@oracle.com>
 <alpine.DEB.2.22.394.2201251600060.1134355@anisinha-lenovo>
 <4c680569-bca2-c85b-b0e0-0cfbb5c158fc@oracle.com>
 <alpine.DEB.2.22.394.2201261229380.1134355@anisinha-lenovo>
From: Eric DeVolder <eric.devolder@oracle.com>
In-Reply-To: <alpine.DEB.2.22.394.2201261229380.1134355@anisinha-lenovo>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN7PR18CA0008.namprd18.prod.outlook.com
 (2603:10b6:806:f3::32) To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7f5637be-8d44-45d0-abe0-08d9e0e83d37
X-MS-TrafficTypeDiagnostic: BLAPR10MB5297:EE_
X-Microsoft-Antispam-PRVS: <BLAPR10MB5297B0A0EA71A3336DC35C9697209@BLAPR10MB5297.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cOVxQzpXTkgHglkWVL8gv2p5f9JdeqvF5cs9dCWdhWfUwcFk/CtKlXiYkjFnRZb0nBQ84xJwb+it20JqgT9ERAxGo4NyFqyQxR0YiCW48SIRqJw2+7ijBYRS/qgsB5Tjco4ZAz4TnjkancsJqsfTyF6l9geB+v2X4zhWwzk6s1CAjqRWzQDKzg09I6SE6X8xGKoZVDzbKSVI9rBL7J1Rw2fnCbvc6iTNahPgeTXLsGaDvx41SAFlQ8uxlEF06tTQtPIx7f/VuBsnFZOeCvbv9f8JCfo8mmJpgyMOne73RWiynjTJvsDCraKGKq9epB6SVRWwG+CKEUqbIMHI/a0xSS/z/r7Ab+zHn9xfuUogFQSff7eSdLK5AfJZ9mb5R288w718PzMJxjDFEishjGwHYu/UXYS3pGB37KPUpFw5xk1/1AOhp1/DUzd6PxoU8iO471awZB5+nQgewl+4qfqDOWUAQHL9CmYmgbU5uTqPJeXnaCqgBc/fQ/9REu0CRYBh8dkSCAmy7/tIW7OiF/rc6LX1tP8lK1SDBuak/WaBCyxzc5XQIdNvxdTD/SI0uq+Xe+DBT9048Wuw5DPQbcpLpendq5fDc460Nf1wGeJTnpju1+NnXvFxtJ4hLfKwqfO44Sn3H5GZaJbZ9JmOisyXjUBF3bWe/AL8V8eqeHelNhmoxPMFhhKUKAiX5AiBD+F/IFhXH5NY7Gy/nB3qLY1lqyoyFtqp0qE8MmcDh1EvqFU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR10MB4531.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(5660300002)(4326008)(6916009)(508600001)(6666004)(6512007)(53546011)(316002)(6506007)(2906002)(83380400001)(8676002)(66556008)(107886003)(186003)(2616005)(8936002)(66946007)(66476007)(6486002)(36756003)(31686004)(86362001)(38100700002)(31696002)(45980500001)(43740500002)(20210929001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dS9QNjhablgvUU5rbm5QKzIrVmNzQng5MWJqTW9HeHgveVNTT0NjemVyMTlk?=
 =?utf-8?B?ejVCODQxZHNhZ0JxZk4wejB0d29FT0tYdkwrWUhmWDk1bklxaEVwQkx2QXVB?=
 =?utf-8?B?bEVrQ3YwSFlRRXVYM3JSZTlBYUdoZTVVU1pBWWR3K3pJeklCTXVwYTl4eHdE?=
 =?utf-8?B?RDlIdmFsY0FkOEFsbm1HKzdBclRpOWZOTm1HY2Roc1I1UlpHM2pBdCtmdEJF?=
 =?utf-8?B?R1pLUjlzY0QybGFYMkIwRklSTTVaOFpYWFN6RXNJSTc2emJBRVhHbUYzVW9w?=
 =?utf-8?B?cS9rU29MR2toa1J4cGRwZnAwcjhKQUpPT1VNeGFuRS9ZampPR25Cc3RTYmZT?=
 =?utf-8?B?TDlOUjdXdkNKUkJxUjMzVml3dVRLVnRXa1hGcU16WUVtNzVHV2c2Z1c0WGpO?=
 =?utf-8?B?NG1lL3FUVjVHM3JhSFRDYldNU1dhRzdlSXA0V2lVY094S2ZNcVdTSndIRHRT?=
 =?utf-8?B?dktWMUxDQjgwdGErMTN2MHUwTnpzVko4SE95c3pXcmh1UGRrc3NKUFBWRC9u?=
 =?utf-8?B?a2ZpUEZEMENvNGh1V3VlcnZPSTJXam4xRDZqdUdwSU9rM3hIdllxT1pSYlND?=
 =?utf-8?B?Z0hzQUFndDEwdFBGUWRsTTI5ZnFCMS8xeDIzYUF5czdXUTZvTVVhWFhlcGl0?=
 =?utf-8?B?UU9NVG54MkI5UDR0ck1JWG1KMzN5R2tBRE1Ja2phZGwrODN6QkRKdy9XWmtR?=
 =?utf-8?B?YjZLaEN6ZCtUNUM1VnFXN1k3L2h6TW1pSmNYbE1QMGlsTjQxQ2l2ODY3bzVT?=
 =?utf-8?B?SCs3VURRbEN5SzVPeVlJazJKR0RLYlhWazhtMTYxUE12Wk5wMG5YR3ZyRnB1?=
 =?utf-8?B?SGZ3eFlhYVdXdUQzajNlcldsWHptWmlrZ1JPRXJoZldKc2N0WVVmUTRObTBl?=
 =?utf-8?B?Snc5SEhHYktkQXdRTlpLTlpWQXdhT3BjN29td2JlUEc0OVZUSElIMTVaMHBY?=
 =?utf-8?B?c1ExQll5d0NDdWt3QVJsbXhVeGxLTFdxRDlBV2lKVm1PY2NOalVrZ0lOTWd6?=
 =?utf-8?B?akliY252cksva21uaThoZWVoRkpGNnN0c3RpVC80WWprSjVFZjV2bDlTWUs2?=
 =?utf-8?B?dVdKdnpSZWp2VTdnNlhrMVN6R1hidzkzanZwYTFmOWZJcnRuNE8rNm1zdGs5?=
 =?utf-8?B?N1dKbk9wanVXUFQ0YVVzQ3J2SDUvNHhDdlFoL21HblQzdFRNeTlQSnpCbEZR?=
 =?utf-8?B?NEwwSFJtMlk3Ni85OWVXN0V5ZmNPNVlyL25pc0c2QlBRWjNueEkwTkJMS0R0?=
 =?utf-8?B?WkdKTENxNHNJM2RjMWhWUTdLTjNTRS9RMnNYTnhNT21WOUVZbUROMWZ1c3FM?=
 =?utf-8?B?V2tMV0NuZDFBV0lDdmdxU1ZBZjBXcVNlb1pNcXpWYnNqZjM1bG1EY0Q2czZM?=
 =?utf-8?B?TFMxU0dJMjhBTEN1S0lqWE1TWVJJbmE5c29keDVRbDlrcVJUYkRIZFJvam9V?=
 =?utf-8?B?MWZqT1ZkMlFTSzJVQlQxVlBQUmJKdE5ONTZMMVRCQzlhZzhPeFhBaUkrQ1NQ?=
 =?utf-8?B?aEw5NGFCT0N0aHpkM2c0d0M5Yk5QVDlFVkhMdmZHYjhjbnIvVElBajN5YnhM?=
 =?utf-8?B?MXdFQnpHQnpGMGIzWlp4TngwSEhERk1GeFFqK1MrbHZJOG9OaE1VTHAvNm5T?=
 =?utf-8?B?TDRPRG8rd3JZb2VSM2NNeHFnei9ZZzRURUVtUDh2OHhDc0EzOGhmcEdGaHBO?=
 =?utf-8?B?YmZxUVh3U1RaOGVNODVnQnpKMVZ3c09tVXhwTk45NlppSC9hN2lFWjVIMzdl?=
 =?utf-8?B?TmhLZFFmNjE5L2lkb0t3OUVETWNvejRJZVNaelVQVzlEcHhtTzNwVzB0dnRN?=
 =?utf-8?B?cTBhZFluSlZDM2dxb3M2dHdCN1BvZUJRakovc3lrelozVkV2QnVBb0N4Y2lN?=
 =?utf-8?B?WWpMMkpxMmdZTUNQdVRhRlZSU0tBQUpNb0tkN0lTOUZ0S0ZoNXFYenRrZm9k?=
 =?utf-8?B?cEF0R01hTE1IenJmbDVxamxCc1lWN2ZVWmZpN2ZmYXBMOHBoaHoyK2hSeGRR?=
 =?utf-8?B?T1UzSGIxeTF1UDJzSHNUc1dDeUFLUlYzM3FZQXVzSEl1K2xaODVDVkhYdG9Q?=
 =?utf-8?B?Nm54QVBzN2ZFRHhzMHlMR0NnVHhvSzlMTkFNQmszdzFnZ0FGWDNiUGplckxu?=
 =?utf-8?B?UFprcU5PZ3JGVnFMWUtVVCtWTERJdi9yNFNYS2trbmdpQ3NkWkZuUUVpWWll?=
 =?utf-8?B?eStFdDhBK1I1MmZyNXEzWWhvckJ5MDJpd29RVUVmaHZsTWhPSDdRY3VJd0JM?=
 =?utf-8?B?ekNacDcvTWtTRkg3WStSR0hKNFNldGk2Y0RhU1p5NzFrMDNFMlNJaUczeU40?=
 =?utf-8?Q?jg1CTlz6DKvnrlvJco?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f5637be-8d44-45d0-abe0-08d9e0e83d37
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2022 16:23:51.6697 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mupBUFEi/QagIzn6+IkVKM1WBnyOKI3O0VnHpCEdJeU+DgAjrArg3j9TmGFgNye4KOka/Q6OchncKb08MQg4BqzKVYbkIif3bp6WR61ODCc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB5297
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10239
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 mlxlogscore=999
 adultscore=0 spamscore=0 bulkscore=0 mlxscore=0 phishscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2201260102
X-Proofpoint-GUID: KCEJf-VQSjXFCvNsD50L7EWeQ8jwYo0l
X-Proofpoint-ORIG-GUID: KCEJf-VQSjXFCvNsD50L7EWeQ8jwYo0l
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=eric.devolder@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, UPPERCASE_50_75=0.008 autolearn=ham autolearn_force=no
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

Ani, Michael,
An inline response at the bottom.
Thanks!
eric

On 1/26/22 01:05, Ani Sinha wrote:
> 
> 
> On Tue, 25 Jan 2022, Eric DeVolder wrote:
> 
>> Ani,
>> Thanks for the feedback! Inline responses below.
>> eric
>>
>> On 1/25/22 04:53, Ani Sinha wrote:
>>>
>>>
>>>> +
>>>> +    action = ACTION_BEGIN_CLEAR_OPERATION;
>>>> +    BUILD_WRITE_REGISTER_VALUE(32, ERST_ACTION_OFFSET, action);
>>>> +
>>>> +    action = ACTION_END_OPERATION;
>>>> +    BUILD_WRITE_REGISTER_VALUE(32, ERST_ACTION_OFFSET, action);
>>>> +
>>>> +    action = ACTION_SET_RECORD_OFFSET;
>>>> +    BUILD_WRITE_REGISTER(32, ERST_VALUE_OFFSET, 0);
>>>> +    BUILD_WRITE_REGISTER_VALUE(32, ERST_ACTION_OFFSET, action);
>>>> +
>>>> +    action = ACTION_EXECUTE_OPERATION;
>>>> +    BUILD_WRITE_REGISTER_VALUE(32, ERST_VALUE_OFFSET,
>>>> +        ERST_EXECUTE_OPERATION_MAGIC);
>>>
>>> except here, on all cases we have
>>> BUILD_WRITE_REGISTER_VALUE(32, ERST_ACTION_OFFSET, action);
>>>
>>> We should treat the above as special case and simplify the rest of the
>>> calls (eliminate repeated common arguments).
>>
>> OK, I created BUILD_WRITE_ACTION() to replace this occurrence. I've provided
>> what this section of code looks like with this and the other below change at
>> the end.
>>
>> I have seen the comment from Michael and you about using inline functions, I
>> will respond to that in the other message.
>>
>>>
>>>> +    BUILD_WRITE_REGISTER_VALUE(32, ERST_ACTION_OFFSET, action);
>>>> +
>>>> +    action = ACTION_CHECK_BUSY_STATUS;
>>>> +    BUILD_WRITE_REGISTER_VALUE(32, ERST_ACTION_OFFSET, action);
>>>> +    BUILD_READ_REGISTER_VALUE(32, ERST_VALUE_OFFSET, 0x01);
>>>> +
>>>> +    action = ACTION_GET_COMMAND_STATUS;
>>>> +    BUILD_WRITE_REGISTER_VALUE(32, ERST_ACTION_OFFSET, action);
>>>> +    BUILD_READ_REGISTER(32, ERST_VALUE_OFFSET);
>>>> +
>>>> +    action = ACTION_GET_RECORD_IDENTIFIER;
>>>> +    BUILD_WRITE_REGISTER_VALUE(32, ERST_ACTION_OFFSET, action);
>>>> +    BUILD_READ_REGISTER(64, ERST_VALUE_OFFSET);
>>>> +
>>>> +    action = ACTION_SET_RECORD_IDENTIFIER;
>>>> +    BUILD_WRITE_REGISTER(64, ERST_VALUE_OFFSET, 0);
>>>> +    BUILD_WRITE_REGISTER_VALUE(32, ERST_ACTION_OFFSET, action);
>>>
>>> This one seems reverted. Should this be
>>> BUILD_WRITE_REGISTER_VALUE(32, ERST_ACTION_OFFSET, action);
>>> BUILD_WRITE_REGISTER(64, ERST_VALUE_OFFSET, 0);
>>>
>>> like others?
>>
>> This is a SET operation, so the data is provided in VALUE register, then
>> the ACTION is written to perform the command, ie record the value.
>>
> 
> Ok I see. makes sense.
> 
>>>
>>>> +
>>>> +    action = ACTION_GET_RECORD_COUNT;
>>>> +    BUILD_WRITE_REGISTER_VALUE(32, ERST_ACTION_OFFSET, action);
>>>> +    BUILD_READ_REGISTER(32, ERST_VALUE_OFFSET);
>>>> +
>>>> +    action = ACTION_BEGIN_DUMMY_WRITE_OPERATION;
>>>> +    BUILD_WRITE_REGISTER_VALUE(32, ERST_ACTION_OFFSET, action);
>>>> +
>>>> +    action = ACTION_GET_ERROR_LOG_ADDRESS_RANGE;
>>>> +    BUILD_WRITE_REGISTER_VALUE(32, ERST_ACTION_OFFSET, action);
>>>> +    BUILD_READ_REGISTER(64, ERST_VALUE_OFFSET);
>>>> +
>>>> +    action = ACTION_GET_ERROR_LOG_ADDRESS_LENGTH;
>>>> +    BUILD_WRITE_REGISTER_VALUE(32, ERST_ACTION_OFFSET, action);
>>>> +    BUILD_READ_REGISTER(64, ERST_VALUE_OFFSET);
>>>> +
>>>> +    action = ACTION_GET_ERROR_LOG_ADDRESS_RANGE_ATTRIBUTES;
>>>> +    BUILD_WRITE_REGISTER_VALUE(32, ERST_ACTION_OFFSET, action);
>>>> +    BUILD_READ_REGISTER(32, ERST_VALUE_OFFSET);
>>>> +
>>>> +    action = ACTION_GET_EXECUTE_OPERATION_TIMINGS;
>>>> +    BUILD_WRITE_REGISTER_VALUE(32, ERST_ACTION_OFFSET, action);
>>>> +    BUILD_READ_REGISTER(64, ERST_VALUE_OFFSET);
>>>> +
>>>
>>> BUILD_READ_REGISTER() is always called with ERST_VALUE_OFFSET as second
>>> argument. WE should eliminate this repeated passing of same argument.
>>
>> The BUILD_READ_REGISTER is always against the VALUE register, as you point
>> out,
>> so I've s/BUILD_READ_REGISTER/BUILD_READ_VALUE/ and embedded the offset in the
>> macro now. You can see this below.
>>
> 
>> And here is what the main snippet looks like with the above changes (a diff
>> is quite messy):
>>
>>      /*
>>       * Macros for use with construction of the action instructions
>>       */
>> #define BUILD_READ_VALUE(width_in_bits) \
>>      build_serialization_instruction_entry(table_instruction_data, \
>>          action, INST_READ_REGISTER, 0, width_in_bits, \
>>          bar0 + ERST_VALUE_OFFSET, 0)
>>
>> #define BUILD_READ_VALUE_VALUE(width_in_bits, value) \
>>      build_serialization_instruction_entry(table_instruction_data, \
>>          action, INST_READ_REGISTER_VALUE, 0, width_in_bits, \
>>          bar0 + ERST_VALUE_OFFSET, value)
>>
>> #define BUILD_WRITE_REGISTER(width_in_bits, reg, value) \
>>      build_serialization_instruction_entry(table_instruction_data, \
>>          action, INST_WRITE_REGISTER, 0, width_in_bits, \
>>          bar0 + reg, value)
>>
>> #define BUILD_WRITE_REGISTER_VALUE(width_in_bits, reg, value) \
>>      build_serialization_instruction_entry(table_instruction_data, \
>>          action, INST_WRITE_REGISTER_VALUE, 0, width_in_bits, \
>>          bar0 + reg, value)
>>
>> #define BUILD_WRITE_ACTION() \
>>      BUILD_WRITE_REGISTER_VALUE(32, ERST_ACTION_OFFSET, action)
>>
>>      /* Serialization Instruction Entries */
>>      action = ACTION_BEGIN_WRITE_OPERATION;
>>      BUILD_WRITE_ACTION();
>>
>>      action = ACTION_BEGIN_READ_OPERATION;
>>      BUILD_WRITE_ACTION();
>>
>>      action = ACTION_BEGIN_CLEAR_OPERATION;
>>      BUILD_WRITE_ACTION();
>>
>>      action = ACTION_END_OPERATION;
>>      BUILD_WRITE_ACTION();
>>
>>      action = ACTION_SET_RECORD_OFFSET;
>>      BUILD_WRITE_REGISTER(32, ERST_VALUE_OFFSET, 0);
>>      BUILD_WRITE_ACTION();
>>
>>      action = ACTION_EXECUTE_OPERATION;
>>      BUILD_WRITE_REGISTER_VALUE(32, ERST_VALUE_OFFSET,
>>          ERST_EXECUTE_OPERATION_MAGIC);
>>      BUILD_WRITE_ACTION();
>>
>>      action = ACTION_CHECK_BUSY_STATUS;
>>      BUILD_WRITE_ACTION();
>>      BUILD_READ_VALUE_VALUE(32, 0x01);
>>
>>      action = ACTION_GET_COMMAND_STATUS;
>>      BUILD_WRITE_ACTION();
>>      BUILD_READ_VALUE(32);
>>
>>      action = ACTION_GET_RECORD_IDENTIFIER;
>>      BUILD_WRITE_ACTION();
>>      BUILD_READ_VALUE(64);
>>
>>      action = ACTION_SET_RECORD_IDENTIFIER;
>>      BUILD_WRITE_REGISTER(64, ERST_VALUE_OFFSET, 0);
>>      BUILD_WRITE_ACTION();
>>
>>      action = ACTION_GET_RECORD_COUNT;
>>      BUILD_WRITE_ACTION();
>>      BUILD_READ_VALUE(32);
>>
>>      action = ACTION_BEGIN_DUMMY_WRITE_OPERATION;
>>      BUILD_WRITE_ACTION();
>>      BUILD_WRITE_REGISTER_VALUE(32, ERST_ACTION_OFFSET, action);
>>
>>      action = ACTION_GET_ERROR_LOG_ADDRESS_RANGE;
>>      BUILD_WRITE_ACTION();
>>      BUILD_READ_VALUE(64);
>>
>>      action = ACTION_GET_ERROR_LOG_ADDRESS_LENGTH;
>>      BUILD_WRITE_ACTION();
>>      BUILD_READ_VALUE(64);
>>
>>      action = ACTION_GET_ERROR_LOG_ADDRESS_RANGE_ATTRIBUTES;
>>      BUILD_WRITE_ACTION();
>>      BUILD_READ_VALUE(32);
>>
>>      action = ACTION_GET_EXECUTE_OPERATION_TIMINGS;
>>      BUILD_WRITE_ACTION();
>>      BUILD_READ_VALUE(64);
>>
>>      /* Serialization Header */
> 
> Yes this looks a lot cleaner. Now as Michael suggested, we can convert
> them to inline functions and pass a struct with the common params. Maybe
> we can use a macro also to make things even more cleaner. Like calling
> the inline function from the macro with the common struct. I am trying to
> avoid repeated copy-paste code.
> 

OK, I've converted the above to utilize a context structure that Michael
outlined, and a function call, rather than macro (as above), to generate
the table content.

Without using macros, I think this code is about as simplified as can be.

As this has significant changes, I'll post as v14. Note that the code
grew by about 35 lines, not too bad.

eric

