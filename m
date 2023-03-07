Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DFF416AEEF9
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 19:19:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZbt7-0001db-Hj; Tue, 07 Mar 2023 13:18:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1pZbt5-0001d1-4X
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 13:18:11 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1pZbt2-0004FW-3I
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 13:18:10 -0500
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 327HwsM8002973; Tue, 7 Mar 2023 18:18:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2022-7-12;
 bh=HpeUMN0wJes566r/S/MUehBW3BtyJe2md4LSOeNPYQ0=;
 b=cBLUOntwL9QI+nvyvQcsteaqs7P+u1mbh9mD5e57zzqgT3PkMUEvdDASOEd0GrZSJ6tk
 8AchCAM9YNGJLFPlXVNXm2NBIXS5TQvu2OwsOFhuMXrYZrQLmTGnwzpA2lx293RefFHv
 S72M860Fa53l9ll+Rm1ES2kbOvvLxuxTrhkGs0rA7Agh44URWjuVyyDbhcJatn+kfU8A
 7J3v5wZlbiug4iZEALg3dhY4CM0gOXKQtOolapETiBN3Gcpr39uNP342zcYkaFRHwLRC
 yNsjCvQ5+7+o4Dr0e3Ftf9tnGIBnoQnXD9K/kjiGs/tXVH5ih6EQbJduW21JFLpy3Oea 5Q== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3p418xx9h2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 07 Mar 2023 18:18:05 +0000
Received: from pps.filterd
 (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 327HM0MA026854; Tue, 7 Mar 2023 18:18:04 GMT
Received: from nam02-bn1-obe.outbound.protection.outlook.com
 (mail-bn1nam02lp2041.outbound.protection.outlook.com [104.47.51.41])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 3p4u1fdbve-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 07 Mar 2023 18:18:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dmMBRE39kKu6fGYYQ7qc8zOWWLNzfwdXv1WJN8Ctp6f4/UASX6U4rKF0zagTmpnrTZ+hxcaknHC05/TAok/+rHR9RD7V1g8uX+Gs9FUUi0oVGRXRwh/hp8vxN2IVpml2bZSXzqz7yyhhBwFkxXCAwQoNpte4JpqPfkNF6BOTke8n4xpALPJrSDtadsuycpavrYlIgPLmgfC31XnHHTk9XMhTWOSv57FxIaSeOdRqmKZvFo1301nUk4bOkcci+aJwanKi3jFTC722LAaSrJhF3kJUzCLHeCkzQKqvprk/5ZKj6XCYSqeopd6XJzYyxynv+fCwZvhqKCYYuqpivWMiOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HpeUMN0wJes566r/S/MUehBW3BtyJe2md4LSOeNPYQ0=;
 b=dB8FqiugvI37PZ5eD8JssrgA9ouYp+CUftZvp+qgJYYA41YbUWrabkE+ZnhyrbAW0gr2aEdR/4bs8/yUynahH/1TQqKiZtricPh5YzLF+ARzB3swM1BPRCrh1ZpjsrykNUF+Jzu2o36hZZdMochFf5AWeXeqkBY3C0paNWuuyaW+lVEAWartZBm4XwajqafV89F4zATzPreFOypJZnGeigFqEGf3ynbBBvbTLApUkg5KxoRsi+OJlP47LfyO4NasMFzVtmC9oGKpvUvOWYhOx8RwGBcPmhGfkJq91I64c6LIBlSMK1moh9U1TYQcDKvhS1AAV9y+kab3sEGY6sYeFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HpeUMN0wJes566r/S/MUehBW3BtyJe2md4LSOeNPYQ0=;
 b=WXls7nxVk1Va1vpWR6HxRCqFYZPgEBEYK9oTGnfZUGFAM3aUo0j4MFZoY9/V0lGJa/3LZmQhD6aZspt0rYSEKZZ2BozyGtiriBUhnAufWsI6tIufk5NjuTfBmQ+Zn2jI0TwlGU0FB7YTn+yAilyZsHRV4WxRHj3QfgQMdgaork8=
Received: from BLAPR10MB4835.namprd10.prod.outlook.com (2603:10b6:208:331::11)
 by PH7PR10MB6108.namprd10.prod.outlook.com (2603:10b6:510:1f8::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.29; Tue, 7 Mar
 2023 18:17:57 +0000
Received: from BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::9b30:898b:e552:8823]) by BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::9b30:898b:e552:8823%6]) with mapi id 15.20.6156.029; Tue, 7 Mar 2023
 18:17:57 +0000
Message-ID: <4dcc0c37-77a0-44ea-1f0f-c87f964c2f75@oracle.com>
Date: Tue, 7 Mar 2023 18:17:51 +0000
Subject: Re: [PATCH v2] vfio/migration: Rename entry points
Content-Language: en-US
To: Alex Williamson <alex.williamson@redhat.com>
Cc: clg@redhat.com, yishaih@nvidia.com, jgg@nvidia.com, avihaih@nvidia.com,
 qemu-devel@nongnu.org
References: <167820819129.603802.2574672058630378188.stgit@omen>
 <167820912978.606734.12740287349119694623.stgit@omen>
From: Joao Martins <joao.m.martins@oracle.com>
In-Reply-To: <167820912978.606734.12740287349119694623.stgit@omen>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0195.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a4::20) To BLAPR10MB4835.namprd10.prod.outlook.com
 (2603:10b6:208:331::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BLAPR10MB4835:EE_|PH7PR10MB6108:EE_
X-MS-Office365-Filtering-Correlation-Id: 9bdb812f-6c8f-4de8-9af2-08db1f3846ec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jP9SRiTc4vc+2REDI7tPkY3sB7QnCzcNjlMwx/2MTe40+drqK4y6hL6H7hf5WnayXMgWPIHlwL6FmoXfTFP08TnzjxPi98ZhMQLbJ7z2TQdRnxIpzHpJwKRjH2pRD3xXo++oket3Dnxwn7zK10VTFBbClnbDkjowKaKoe1hE16krSPFG/aMAckVIuK0abKLJGi+O3Uf59vqk1UIypokI/ED+a8eUnY7nuPzT91FyUnrVhaTqZwyW2eL0Bai0SXj5rXkkbR3gHT/61hSp+xiZtNHPWqomjdNcwCG3moylqmU2310MiA9I00tj3eXsC8pqdHFAZ93nFnPIfgaXsskC1JQAHVDrnhbRbBhhulufAGSzcj/mxppia5sTfm5GdFlNp4yIZy0I4QJfJ+1yJpbEY0YQ7zUK0vbGreqWNYRbo2pTumWQQHucE3LuD9P7CAHLPInOjcull+kn7boSXntGswvSj5atCiz58agmNztDAA0ZFmrFa610n7kiBTY7D71bsNAhSlEoV162KREjzfVXvR25mEWuUGi6Cw6UxuySTq5t07kpeLKY02zuQKoT20sufyMe4LPbweTyVQdhLabZaQGhO588b9RnC/vDPJzMpV6mJYKYR5rQ+uvqJcnZRIvoaPIpXDaTLuoJh/WDiYzsh6FtAlUSr+AzZkPnX6n85pKVBI0pg1ainCOwK4i3buEQKR17fKGMBu2MjdIjUFhEXA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BLAPR10MB4835.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(346002)(136003)(396003)(376002)(39860400002)(366004)(451199018)(66946007)(66476007)(6916009)(8676002)(66556008)(41300700001)(4326008)(38100700002)(316002)(8936002)(31686004)(5660300002)(478600001)(2906002)(6486002)(36756003)(31696002)(6666004)(6506007)(53546011)(6512007)(83380400001)(186003)(26005)(2616005)(86362001)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YUVvRlk4TjhNaVBKRVJjbWI3TEU2SXc2SEcxblBHQlZOSFI2VWl3MWgrczR0?=
 =?utf-8?B?eURwaVdKVFZNdG1yTmZLWGRuK2NzcFoxOGhjeUpnQVAzbFVnSERNZlcxMVMw?=
 =?utf-8?B?SlluTnZocHNXdnR2bDEwaG9tRjMxTGxsUndqUU9MMW83a3BXdmxLY1JoTmlL?=
 =?utf-8?B?UjFpZjZGNUkzNHJxemZFTy9JcWd4REYzVk5LYzFLYTNPN2xlSEdRMGFITDY4?=
 =?utf-8?B?dHlnWU00QkFxdmNiK0Y4MmQzQUNqMTlnb2pNMU1VT1NPM0xnUDI4UDM4RlJa?=
 =?utf-8?B?NXhGRTQrUmFYM3pBcCtkYm02NnI2N3lib0FnbWRLOE5yWWV6NnhxditzQ0JQ?=
 =?utf-8?B?elJWb2RvUTFvSkpmSjBzMS9zK3VHcGNMYU9wZnBYelQ4RkZ6clpZejRtLytX?=
 =?utf-8?B?ZlFDcmtzMm1rRDFTOGFiemxyaUxZdkJSN05YZUVvYmpacWRpRlYrVXNlVzls?=
 =?utf-8?B?M2pmcTNzaklTMExIZ0RXV0tqNzduQzBWMUsvNXB6SG5PbXVQdndOZFIwRDk2?=
 =?utf-8?B?ekU4aExCcmtoNGFjN2pXT0hxMSttZy9DR1YwTXU4VEl0R0V4NGMzNmluTUxJ?=
 =?utf-8?B?RkFsYUYzRGlmK2ljcGxHcG1RNnoyUmh6ZXZFU1BZbnU1TkJERUhBOVFJbENY?=
 =?utf-8?B?QnlBclN5OWFlbzVqVTZZT202WVRYUXZmM3ZaaHludFVrKzRldFI5ckxCcXFY?=
 =?utf-8?B?Qy9lS3dWeEp3Q2lHeDBUYVpGRkxxd3NsME5VNm5saGF2ZlFyRCs2VFpMMlNq?=
 =?utf-8?B?am1FUm16aHZPUy9xbDRPMWxJakl6UzdxbzdqMENxQ1lhSUNFRHJWbjZrenU1?=
 =?utf-8?B?ZUVyeE1tV3MzT2pibkRYZTZCcEFLZFNIUm9KbVpkVFdxSFFWcllGTVRZaTF5?=
 =?utf-8?B?VDkvdnNmbENSUjBpNjVKNzZsUjdxK3dtSnc5bk5vUGw4ajdXNUFDUlFrbVJm?=
 =?utf-8?B?bklyRjFLbzFPYVlHYjZhN0g4UnRiZmhsTkZIaFFkRXNLejU4VmJqa0MvekNv?=
 =?utf-8?B?cFNLSW14dDVOaG43Ylhab3dvZ2h4VjRpVXIySm9wR0NKVjZlSGJ2aE1sM09U?=
 =?utf-8?B?NG8vdmcyR2RJT3krQVo0Q3NXUHdKOXJXQmk2QXZSRW12dmhQWXk3MGQ2K3lj?=
 =?utf-8?B?czVXMjc2QlU1RzdyUzZhTFN2QmViYVBjdkI4Tko0MHJqdGltalNlYWVkVDJI?=
 =?utf-8?B?bnBJLzlVdzFWZlQzUk9pUDEweGRNK09sKzhRZ0R6MXBrQnJEMWY0NWVXbGxK?=
 =?utf-8?B?M09taXRhcEhsVEhRUUNsOFVkREwxVkRjbExldjlGendlQ2FoUEEzQ2lodWxw?=
 =?utf-8?B?M1hsTEdwQXVrMWJzZ2M3bTBndVB2UStMaDlJM2ZqYkU2Zk9KbytKTCt3bnMw?=
 =?utf-8?B?emtZUmhvTFd1RlNzOG04Tml1eU1DYjlYdjhLQWtOc0J1TmwwYjhGOVI5cHdk?=
 =?utf-8?B?dmJYRklxWW8vR1JOdGY5dXdNU2U4a2NVNkNFTkcrS256TVpXQitnS0RlaEJK?=
 =?utf-8?B?bENNNnRDNHhOc0xLM0x5WnBvbUMrMzFoL0cvZWRBKzZ4MXFWdENnbGFnb0Zi?=
 =?utf-8?B?WVR4NnliemZVWnltMGRKdFZVSDNFSnQ5Rkx1M093OGJYSWs1OWV2QVlSb3B1?=
 =?utf-8?B?cTRQZ29zVmV0OFFGZTBNdGR0SE04dGk3a0NvaS90QS9vMDhEbEsrQkxpOU8z?=
 =?utf-8?B?U2RJVGxoQlgxYmc0YVdDM1FYZWdkNVVZeHdoUFh3Q0ZpQVRnTm5qTWw4WVdX?=
 =?utf-8?B?K0pBZlg4NmY4NHJrRzI0cnRJdDR5SHkxbjB3RldwUGdrV0duQWhmaUE3YmM2?=
 =?utf-8?B?cm9HQU12bnZEM2JIOFBKK1dDeEhXRVFuT2tEczFmeXprbUxCZTFPOEgranF1?=
 =?utf-8?B?UGV6SlpnN2RqdE1RdHBqZW1jT1o1aVNGZ1lXZzdQb3BPS3RKc0tLNy9QYm9W?=
 =?utf-8?B?YnRDRVhHQTdWakgydzFQZU9WRzBtVnFvYW84amhleStqdmRMMjZhemNTeHEv?=
 =?utf-8?B?dDhiZFlGN1d3Ty84VkppU2s1TTQ4VHJWNk16WE1oZ09FTS8wYW9mb1RrTEhy?=
 =?utf-8?B?a0kzb1MrUVVkeDB3TXRJeEt6UUFzTktlT2ZZazZaTlF0elZLTDNKMUx5ekYx?=
 =?utf-8?B?NjE5U1djODJndE1mRUt2dHRaOTVXYmZDSWIrZE9idEVWU3dyeDg5SDNka05C?=
 =?utf-8?B?N1E9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: H7YdHa0TbwSTEWa5tQ/G1gZjYm7vsZiYz4GV6+9CeW9JfZoIEHMjXWu/9nc1cFvwzTh114QuMoG0QAWKMjxfkZ/v9WzzTh3YdNGBO4I0p/liZfzK+4EkLy/uAyuvwQlsk82lbD4PGfye5H0zU5trrMWc+rr1tIWYSnZPdNg3W0KCceqfB2V+EGrxpD0gq+06qUQYtkLN/ZmkLM1/2gKQFpyfH6ERWgfO8IidLzgLTIgrxQ7GULBZ1ZfHK4mo69p4rI6YC+yH+FBYHCFp0fPr436sEqTXl4FamqSTkFzi4YKHgRJ3DHfcXIY6igszPIKhR3DkazkOMEsigyDqmlLpqS+V3CRQf/uIsuMjUzwS9qE9uaXPtWhIZQ5Vae2csPoS7YO9EAhagn+DgE5xHUMz0xNOuZBKfTqChvzjkdqSx1R5hTNdLZq75uWzdCLRdHz5tLaSugrVAjXThmeT/7O8Yn+H+Tt/zvjTyYUNjS8rEnp+rmqwslNzeMFLgak7kvjtD85yD74nJYlBr0SdPc76wgklqHGejzFQ9zm3cP7DzZkA76F3wNmYrtW1EzN3J07HnStLiLG/vT3y2QR237C5s92wzGDQeMD7hPOpNHWVvJvSMi0F/oIf+/JofZK3FdXfkFbFGm2X03U94BudK+li+9ix3TC0RbIMnBWbjmTFC4j1uj3dzMyZlRqxHxzN+/UY5fyOBP9k59f5nc6ubnXEXP4L3Y1p6U4hCljlEo7X7biyIFRusgdecOO8ayED+MgN4csQYkDyjKzEFoANBvPmZp6NVQYuY3ulv7B8dO7ILo+8XmXe1pOMyVUXsi73ndI4
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9bdb812f-6c8f-4de8-9af2-08db1f3846ec
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB4835.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2023 18:17:57.4566 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cdfFOHZ+F1e3gaa8uNEuk/QoGi7bqRismxSip0Bu2+5Ng3jWmUF23iMlTxNGHuM+pZedsBN0GoBvMxAqvHCGdkoPA/fXYu8USDCBXNUtdJg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB6108
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-07_14,2023-03-07_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 phishscore=0 bulkscore=0
 adultscore=0 suspectscore=0 spamscore=0 mlxlogscore=999 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2303070162
X-Proofpoint-GUID: KswUvPIg6DrYY--vaFsZ95ePaXytpYLT
X-Proofpoint-ORIG-GUID: KswUvPIg6DrYY--vaFsZ95ePaXytpYLT
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=joao.m.martins@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 07/03/2023 17:13, Alex Williamson wrote:
> Pick names that align with the section drivers should use them from,
> avoiding the confusion of calling a _finalize() function from _exit()
> and generalizing the actual _finalize() to handle removing the viommu
> blocker.
> 
> Signed-off-by: Alex Williamson <alex.williamson@redhat.com>

Reviewed-by: Joao Martins <joao.m.martins@oracle.com>

> ---
> 
> v2: ...but there's already a vfio_migration_exit(), it should really
>     just be inlined, but for minimally invasive change, just rename to
>     vfio_migration_free().
> 
>  hw/vfio/common.c              |    2 +-
>  hw/vfio/migration.c           |    8 ++++----
>  hw/vfio/pci.c                 |    6 +++---
>  include/hw/vfio/vfio-common.h |    6 +++---
>  4 files changed, 11 insertions(+), 11 deletions(-)
> 
> diff --git a/hw/vfio/common.c b/hw/vfio/common.c
> index 2b9bcf70aa36..dddd7a8e40f8 100644
> --- a/hw/vfio/common.c
> +++ b/hw/vfio/common.c
> @@ -447,7 +447,7 @@ int vfio_block_giommu_migration(Error **errp)
>      return ret;
>  }
>  
> -void vfio_unblock_giommu_migration(void)
> +void vfio_migration_finalize(void)
>  {
>      if (!giommu_migration_blocker ||
>          vfio_viommu_preset()) {
> diff --git a/hw/vfio/migration.c b/hw/vfio/migration.c
> index 5d1e66f69194..1a1a8659c859 100644
> --- a/hw/vfio/migration.c
> +++ b/hw/vfio/migration.c
> @@ -521,7 +521,7 @@ static void vfio_migration_state_notifier(Notifier *notifier, void *data)
>      }
>  }
>  
> -static void vfio_migration_exit(VFIODevice *vbasedev)
> +static void vfio_migration_free(VFIODevice *vbasedev)
>  {
>      g_free(vbasedev->migration);
>      vbasedev->migration = NULL;
> @@ -631,7 +631,7 @@ int64_t vfio_mig_bytes_transferred(void)
>      return bytes_transferred;
>  }
>  
> -int vfio_migration_probe(VFIODevice *vbasedev, Error **errp)
> +int vfio_migration_realize(VFIODevice *vbasedev, Error **errp)
>  {
>      int ret = -ENOTSUP;
>  
> @@ -669,7 +669,7 @@ add_blocker:
>      return ret;
>  }
>  
> -void vfio_migration_finalize(VFIODevice *vbasedev)
> +void vfio_migration_exit(VFIODevice *vbasedev)
>  {
>      if (vbasedev->migration) {
>          VFIOMigration *migration = vbasedev->migration;
> @@ -677,7 +677,7 @@ void vfio_migration_finalize(VFIODevice *vbasedev)
>          remove_migration_state_change_notifier(&migration->migration_state);
>          qemu_del_vm_change_state_handler(migration->vm_state);
>          unregister_savevm(VMSTATE_IF(vbasedev->dev), "vfio", vbasedev);
> -        vfio_migration_exit(vbasedev);
> +        vfio_migration_free(vbasedev);
>          vfio_unblock_multiple_devices_migration();
>      }
>  
> diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
> index 30a271eab38c..ec9a854361ac 100644
> --- a/hw/vfio/pci.c
> +++ b/hw/vfio/pci.c
> @@ -3145,7 +3145,7 @@ static void vfio_realize(PCIDevice *pdev, Error **errp)
>      }
>  
>      if (!pdev->failover_pair_id) {
> -        ret = vfio_migration_probe(vbasedev, errp);
> +        ret = vfio_migration_realize(vbasedev, errp);
>          if (ret) {
>              error_report("%s: Migration disabled", vbasedev->name);
>          }
> @@ -3185,7 +3185,7 @@ static void vfio_instance_finalize(Object *obj)
>       */
>      vfio_put_device(vdev);
>      vfio_put_group(group);
> -    vfio_unblock_giommu_migration();
> +    vfio_migration_finalize();
>  }
>  
>  static void vfio_exitfn(PCIDevice *pdev)
> @@ -3204,7 +3204,7 @@ static void vfio_exitfn(PCIDevice *pdev)
>      }
>      vfio_teardown_msi(vdev);
>      vfio_bars_exit(vdev);
> -    vfio_migration_finalize(&vdev->vbasedev);
> +    vfio_migration_exit(&vdev->vbasedev);
>  }
>  
>  static void vfio_pci_reset(DeviceState *dev)
> diff --git a/include/hw/vfio/vfio-common.h b/include/hw/vfio/vfio-common.h
> index 009bec34c4bc..eed244f25f34 100644
> --- a/include/hw/vfio/vfio-common.h
> +++ b/include/hw/vfio/vfio-common.h
> @@ -223,7 +223,6 @@ bool vfio_mig_active(void);
>  int vfio_block_multiple_devices_migration(Error **errp);
>  void vfio_unblock_multiple_devices_migration(void);
>  int vfio_block_giommu_migration(Error **errp);
> -void vfio_unblock_giommu_migration(void);
>  int64_t vfio_mig_bytes_transferred(void);
>  
>  #ifdef CONFIG_LINUX
> @@ -247,7 +246,8 @@ int vfio_spapr_create_window(VFIOContainer *container,
>  int vfio_spapr_remove_window(VFIOContainer *container,
>                               hwaddr offset_within_address_space);
>  
> -int vfio_migration_probe(VFIODevice *vbasedev, Error **errp);
> -void vfio_migration_finalize(VFIODevice *vbasedev);
> +int vfio_migration_realize(VFIODevice *vbasedev, Error **errp);
> +void vfio_migration_exit(VFIODevice *vbasedev);
> +void vfio_migration_finalize(void);
>  
>  #endif /* HW_VFIO_VFIO_COMMON_H */
> 
> 

