Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 583A548B075
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Jan 2022 16:09:15 +0100 (CET)
Received: from localhost ([::1]:54138 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7Ilu-000312-FS
	for lists+qemu-devel@lfdr.de; Tue, 11 Jan 2022 10:09:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54018)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1n7ISj-0006Xg-9h
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 09:49:25 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:59708)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1n7ISe-0000p4-GC
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 09:49:24 -0500
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20BDDJ6k018289; 
 Tue, 11 Jan 2022 14:49:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=zLWKeodrT5wz9thZ5/JqrfsDG0dXWIK4/arZX3ZFZ/o=;
 b=N+0b0cjtA47VbtMp+zoNWCOUgfnZw5BrBX0FER6YHsFokbUItxR5c0kX3MDDbgAHnYKr
 KRULB2jQES/QNUsjwX0e1B7GeRioSSZFVlKTFi4Q4AXZrFtg9AbZrAZK45iUZRl1xLnr
 UeSZpOPD1EE0n6heAfy7S6/Pu6C+2wRP3XxkvMvFuIPd4CwOFfg/4+y+zoeYP4w6/vwZ
 J3M5AYaO8vNg8gGOlSz+MXcDcM8TJORl56gYvfb70eym/OuYXY5F8Cvys5hg4SbOklyP
 tY5GXpgvFhYDadPKjt+EzFQFLl37vx2lEnMa2BnK0SfPz8nr99WdyU7tC8hLkvGuNVe5 ig== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 3dgn74b5tx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 11 Jan 2022 14:49:14 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 20BEQS96102792;
 Tue, 11 Jan 2022 14:49:13 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2108.outbound.protection.outlook.com [104.47.55.108])
 by aserp3030.oracle.com with ESMTP id 3df0ne4rau-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 11 Jan 2022 14:49:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EsYVrbzb52Zffvkmd9U7ibPJkPsxoJXHn3/4Sgnyborx9djhdqwh4ET6FYvaJJJ/rnDhoX5mUixV+zC/affu/C3Q/Mdfn5LZyYR0pYCfw63fsXwD4spFbEeETgv4a6Jb+ov5jmVCWtQsVkvY3QHyUJV8T4DufI5I1zSFRHXJeTBSFtx2vfNESKLDVRH13inwwvYkZ5WfvV83XxoCj2ui945VfSu84Z3M5WWuPsNgE9cDVYMdQ8oaqdzwSpg6yjGqNf7a8w8lwHDtlui28FCBewqRuZ6T3lAVu0cWZEJ4I3L/0DnT0w7AoRhIDtqvRbeZpVFwExuIF88lZBwm7wUyCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zLWKeodrT5wz9thZ5/JqrfsDG0dXWIK4/arZX3ZFZ/o=;
 b=EYS9LXgD00pkzUL6l5BfDhnnQM8m2rJl3mJ7EePGSuOEcLUS1pDaQbSCtOKgCoc7oiBGd7Q2OmXtvAjRqxQnitkMBKOamBweYw1uKn+Hm0VgdUhsa6Z0BiUDdkr7uwCelJeSOQfhBqH002qUJOqZrS8BZkmSDDdtSOs5tJ/NHK+fr0xd9Oz4FFbax7dYMhuhRR8i7liCxYOcQNVw9974rj7t5AEd+u4JWIz8m6dhceiGGTpgUmRzjjuS7TJ2A+NQB6J08C1BwHrrKZ8JIWyIho1rB9P1Pg8pqc8g5EhJKtcsoUTvlcTyZnlrlLmH7KckwMVmCFB3j0kSHbqrwvgrPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zLWKeodrT5wz9thZ5/JqrfsDG0dXWIK4/arZX3ZFZ/o=;
 b=fS7XkCa5SsUZx4Na8rvUUU808vKp3G9V14U5It8MXTGmUGMJiQF1VH2fvvqFXbr3i1QmQ5h5RWawtDTSFceifQyPa3ceqFI0YwjmOlLsKm9xqqJ7pGonCAnupI+tuquPTehoSWdoRU7XeN3SS42af81L13DO07U+LvT62+Z32HQ=
Received: from SJ0PR10MB4542.namprd10.prod.outlook.com (2603:10b6:a03:2da::19)
 by SJ0PR10MB4430.namprd10.prod.outlook.com (2603:10b6:a03:2d5::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.9; Tue, 11 Jan
 2022 14:49:10 +0000
Received: from SJ0PR10MB4542.namprd10.prod.outlook.com
 ([fe80::5058:254:7d9:f189]) by SJ0PR10MB4542.namprd10.prod.outlook.com
 ([fe80::5058:254:7d9:f189%8]) with mapi id 15.20.4867.012; Tue, 11 Jan 2022
 14:49:10 +0000
Message-ID: <d4f6577e-c9a9-2b1c-afad-e6c3fb358298@oracle.com>
Date: Tue, 11 Jan 2022 08:49:07 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v9 05/10] ACPI ERST: support for ACPI ERST feature
Content-Language: en-US
To: Ani Sinha <ani@anisinha.ca>
References: <1638472142-14396-1-git-send-email-eric.devolder@oracle.com>
 <1638472142-14396-6-git-send-email-eric.devolder@oracle.com>
 <CAARzgwzPQ-B-BfP4zejd2a9O_CsgfJj-RyVx0V3-v2HphOKDTQ@mail.gmail.com>
 <7a998743-1991-487b-15ff-17ee8fe51349@oracle.com>
 <CAARzgwzGVyAoUu2hwQZnDqimSvudkwXS8DE2VDYGbWyKtcUMCQ@mail.gmail.com>
 <dc729131-816d-e547-8551-86bb9cc2c67a@oracle.com>
 <CAARzgwxbtvOc2r71Pc2LxUw4+oahZHM7_ugiObUpGgAYKuoCLg@mail.gmail.com>
From: Eric DeVolder <eric.devolder@oracle.com>
In-Reply-To: <CAARzgwxbtvOc2r71Pc2LxUw4+oahZHM7_ugiObUpGgAYKuoCLg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0178.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::33) To SJ0PR10MB4542.namprd10.prod.outlook.com
 (2603:10b6:a03:2da::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e2b50d59-aa7e-44cb-c936-08d9d51186b9
X-MS-TrafficTypeDiagnostic: SJ0PR10MB4430:EE_
X-Microsoft-Antispam-PRVS: <SJ0PR10MB4430A0292D6C446D0EA67CDF97519@SJ0PR10MB4430.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bJ6Sm9SriZ02eu5zBolptPVaLMuNRXPZm9RrUlImhlXHkzL4L9fDSb2Iz27KkKD/YVYv5EMXYYbX0yusowNEsgIhsXBq9HNtQzC+TXntBzaWaiv4SF/8jpOoD9US+s4Ft7vw3v2BWNgJ1CSXTqsp0c5sw28GeZ1sGrR+EMaC5djBWldQbgalExcC96JqwRMZwz5m/fbCJ0XSI24RpvtemEehSHKR3lyQNlEP/zzFf5JpjPiGE0d7rlFmUbkSv2AZVBoowjOX3Z0yjOStT3Hx/DNQBLDwog7y/cLxMu8CzQfUL8Olr+V9HeqfZnAuAm7l4E9/VOCpMNtDonqRksrSIU66FxfVrF0uCLq4BMfXzqjPLRuFO/YMzUCdcZulHrM2Mdhmydg1Nz9CkhOrNweq9m0BdGo6mYOFEQA5dg77kRn5kC0PBkHYvA3RoFNdyxD+8LvsQgopZC1fPKT2mYI+GQxrrHQ241KBiaYV26c49aqeZeUMMPnCjvnqx1DaMl35vz2R0kCzObXMLJBTqUrTly524r9A+w/s4DCOr8fKtTGcEsfjvxe4Kuf6NUBoDbU9aeJxxb6tcMj9kiL2R/Nj9aOc0yeZi9eiFmyexkEkaAEVYjuV0PxTjBZFFge7cZyJ+IffGnsLOFPNsUCphNCEIVHs7Zzu67aTRxM319sZN9fFeZIkD3iyLHdiTJnSNoUGOl/Uq+V66JscXZrRkNS6Fg1Oa3ZQXCe0j2FLphu+pBY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR10MB4542.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(6512007)(53546011)(6506007)(316002)(2616005)(6666004)(30864003)(66556008)(66476007)(86362001)(66946007)(83380400001)(6486002)(186003)(38100700002)(508600001)(6916009)(5660300002)(4326008)(31696002)(107886003)(8936002)(2906002)(8676002)(36756003)(31686004)(45980500001)(43740500002)(579004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dzRFRFNxMzFsUVAzNVpKaG9weFY5aW14eGJaRGYrRlRmY2hSdDhybzc5QS9l?=
 =?utf-8?B?eXR5ZHFvWUJSaDhaU292NnphTERFMG9UQUZlWHBBcFliQnd6TmZuVzBDZU1J?=
 =?utf-8?B?ZHBJUTJwYnhLeGF6bDQrLzNoc3F1bW5mRGloN1JLb0lQc0JuZHo0bnMreXM3?=
 =?utf-8?B?YWVTNzc5WUZyUVlDNG5VMEZVK3R5c1M3VjNNYUdWLzRnNnd1VzZsajQ0L3V2?=
 =?utf-8?B?WVhqNjJPcWIxTXdqSUlBdjZuNU5MUFdtOTJGVG5zMzcrME9tZ3R5bFRPK2Rp?=
 =?utf-8?B?TEhQU0tGUVBGb2xiaWl1Y1N0SzZlT0xva0RoSk1uUjI4MDlpTWF3VGxqRTRO?=
 =?utf-8?B?L014c2E4SkgxQVFpUHUxSVBBOWo1NjN2azJCQ24rN29kZmRrdmNBWFVVYzQ1?=
 =?utf-8?B?WG1SYmkwQ29XM2RDNXhka2dOWGFGQ1NqdHlYdm1NSTdLWGw0aTlSQW5wRHgz?=
 =?utf-8?B?YkZ5cUZjU2tzVERLOGdHR2o0bFpsNXlLM3d4bk1IUyt4YlZYWVdJNC8xVXhL?=
 =?utf-8?B?S2ZvVlZYTU1CVlBXWmwvekQ1ZDVXbW1zaklqbTRpQ1RiaFJKbkIxQXNGaG0y?=
 =?utf-8?B?TEtWZS9ONmptdDl5cktuUFdMUXorTlRtdDl4MHdGQ3hxL05tOXdINUNrWld6?=
 =?utf-8?B?UERIOVA3NS8yMDZXNFo3U2p6eWZxUnkxMFdCWmpVT0xwSDViRWN2amRsTEtj?=
 =?utf-8?B?Ti8zVmZ5eUYyUkxlRC8vRENCamNpbHc0SGFVRWg1NUhJdVd0dXlQVnVFZkxw?=
 =?utf-8?B?eHBWeHdnOW85Q2tjRi9TR3o3SjVuS1JGUmRDUWlxR1VDZFhoT2hWb0lpUlZu?=
 =?utf-8?B?SnMvQVAxTGdSM2RFSUZ1YkpVd2tHVW5wWE5aQlhlZnduVGJIMU5EaGMvcHBH?=
 =?utf-8?B?VjV6R0xpSzlrWWlld2Zrak1yMzYxcmw1RHlmaHcvN1BZUkxQb2xaQ3htNHRG?=
 =?utf-8?B?WGdSVEhHeFJkbDhZc3h0RDVIMEhBWTNLekQ0WGpsU2FoRTdKOEJQdjdTSXl4?=
 =?utf-8?B?RzEyS1dsQTg0R1VVQmdxWnY4akhMQTlTR0dqeHhNM2U0OU1pTFo3Y29NY0tX?=
 =?utf-8?B?OXZyVHhLUHVTY1BDNFVRdTRrMWlYTnFvOFp3VzZTdGZMc2dJZnlnczdVRm5U?=
 =?utf-8?B?Mm1yb1BvMmhmbjJxRFVOVDVhMlhxMTRpYU5RR2g4RjNlMDhEUk5QVWRsNWgr?=
 =?utf-8?B?Ui9yeUhyYXlzRWZjYUFUZGtZS1hIWURnMW9VNTdXWGlwTFNEN2I5alhZK1FJ?=
 =?utf-8?B?Q1BPWnBlZTI1djQ0Z1hKVnlKUUpIRnVvWEl2QmxRWVZRb0Z3QkkxOUhNbVRt?=
 =?utf-8?B?bnRsaERPdFdnaUtDY2E1Q255WUEwVEdWK29zeXpvM1VYa1JncW1HT3JybzYv?=
 =?utf-8?B?bTBRQ21KSWFGTmV6eTMxZjNOWllKdzR0Z2JFTTYxbjRHdzl2dVpnMU0wZ2Fl?=
 =?utf-8?B?TXZYTjhpdHlZQXRtaWowL3NJekl0SmZ1dVJ4S1NUZFFCNFpZTmUvV0pQbGFQ?=
 =?utf-8?B?MzNpLzR3TnRWRXVQMlB4M1IySHp4NEw0Wld5ajlqOTJsa0kzdEZSM3NjWkYx?=
 =?utf-8?B?NFhuMlBkclZWSGxYbmQ3amJrQXZVK2QwdStPWkFEQXNpRkZJV2UzcFZaeDN6?=
 =?utf-8?B?V3NEaitHNXN5cVR4ajZCeUNZOW0wM3YyN0lTSDE5QzNFMlNSbGlkMWRCZUxN?=
 =?utf-8?B?MEppbnFuZmQvZG9rQkl3WWxKRHgrc1JiOGJjMkIvQS9zd21SYlB2dmxOT2xn?=
 =?utf-8?B?R3Bpd3hvQTNWSU43VGVkNUpZVVRlaUVkME0yc01uZ2tMQnpzcHBzY1lxVkN2?=
 =?utf-8?B?alM5ampsQUZqVVpCRE1sZ1hRN2pKZWI1TjMvcWtBdWFoVTVZT2FoNWtrb1c1?=
 =?utf-8?B?dW5TbmtCNkk2dGVwT1FYWkpRVXVlMFBkL1VTQ1hVNkE1cXI1eHNVVThMUXpw?=
 =?utf-8?B?aXkySTVKRm9DdGpGSThhVURZVlFLeW1sd0ZDMlZ0RWtxUXA2aGNTSlEzWGZC?=
 =?utf-8?B?WVhLN29pMWE2cWJjejJ6Ri9XVDRkbSs5Ykw0UDJyQ1BXcldMcmpJb0FVaFN0?=
 =?utf-8?B?TlpJR0tIelFZc0tLTlVJTkhUdWxzeGhDMmdiWVhYY3BrRXkzaHZUV1Q2Mkti?=
 =?utf-8?B?UGpKSjc2QmtlZXdZWmNHZDJsQ0EzWndOMWdsU1dNL1grbU1tbmhFYWJzN0ds?=
 =?utf-8?B?bjh5ZmtLR25hSzQ2QXkyMTlMRVhHL1FyMEpDeGN2b0RDV0tVK1B1cUk4REZM?=
 =?utf-8?B?UkpTbnRsdUgyNWFVc0x1Qzh1L0dpWTcvYXBwRUJ3V2EzZ296Q1dIN1pQZkYw?=
 =?utf-8?Q?vP9CTz6V6Up8wcVrV8?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e2b50d59-aa7e-44cb-c936-08d9d51186b9
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB4542.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jan 2022 14:49:10.4812 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cTyc8uKqdBnsPkuj30VKZmHU9es4dq9UHXHIZRZp2OwTk+0b9vtnxZrT3VUAQwFNcsE6IqVKzHtea6u3EoSENsrHT/ujMJ/l7LSuEQHCWFw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4430
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10223
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 bulkscore=0 spamscore=0
 phishscore=0 adultscore=0 suspectscore=0 mlxscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2201110087
X-Proofpoint-ORIG-GUID: 5y41N_I1lYM0pTGsr9rdVGGXalpEnDvZ
X-Proofpoint-GUID: 5y41N_I1lYM0pTGsr9rdVGGXalpEnDvZ
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=eric.devolder@oracle.com; helo=mx0a-00069f02.pphosted.com
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
Cc: berrange@redhat.com, ehabkost@redhat.com, mst@redhat.com,
 konrad.wilk@oracle.com, qemu-devel@nongnu.org, pbonzini@redhat.com,
 imammedo@redhat.com, boris.ostrovsky@oracle.com, rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Ani,
I'll change this from the g_assert_not_reached() back to STATUS_FAILED.
Alas I realized I didn't do the last step in producing the new ACPI tables in the patchset, so even 
though I just put out v12, I'll need to do a followup v13 with the missing tables.
Thanks!
eric

On 1/11/22 02:35, Ani Sinha wrote:
> On Tue, Dec 14, 2021 at 2:33 AM Eric DeVolder <eric.devolder@oracle.com> wrote:
>>
>> Ani, an inline response below.
>> Thanks!
>> eric
>>
>> On 12/10/21 08:09, Ani Sinha wrote:
>>> On Thu, Dec 9, 2021 at 11:24 PM Eric DeVolder <eric.devolder@oracle.com> wrote:
>>>>
>>>> Ani, inline responses below. eric
>>>>
>>>> On 12/9/21 00:29, Ani Sinha wrote:
>>>>> On Fri, Dec 3, 2021 at 12:39 AM Eric DeVolder <eric.devolder@oracle.com> wrote:
>>>>>>
>>>>>> This implements a PCI device for ACPI ERST. This implements the
>>>>>> non-NVRAM "mode" of operation for ERST as it is supported by
>>>>>> Linux and Windows.
>>>>>
>>>>> Few more comments on this patch ...
>>>>>
>>>>>>
>>>>>> Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>
>>>>>> ---
>>>>>>     hw/acpi/Kconfig      |   6 +
>>>>>>     hw/acpi/erst.c       | 836 +++++++++++++++++++++++++++++++++++++++++++++++++++
>>>>>>     hw/acpi/meson.build  |   1 +
>>>>>>     hw/acpi/trace-events |  15 +
>>>>>>     4 files changed, 858 insertions(+)
>>>>>>     create mode 100644 hw/acpi/erst.c
>>>>>>
>>>>>> diff --git a/hw/acpi/Kconfig b/hw/acpi/Kconfig
>>>>>> index 622b0b5..19caebd 100644
>>>>>> --- a/hw/acpi/Kconfig
>>>>>> +++ b/hw/acpi/Kconfig
>>>>>> @@ -10,6 +10,7 @@ config ACPI_X86
>>>>>>         select ACPI_HMAT
>>>>>>         select ACPI_PIIX4
>>>>>>         select ACPI_PCIHP
>>>>>> +    select ACPI_ERST
>>>>>>
>>>>>>     config ACPI_X86_ICH
>>>>>>         bool
>>>>>> @@ -60,3 +61,8 @@ config ACPI_HW_REDUCED
>>>>>>         select ACPI
>>>>>>         select ACPI_MEMORY_HOTPLUG
>>>>>>         select ACPI_NVDIMM
>>>>>> +
>>>>>> +config ACPI_ERST
>>>>>> +    bool
>>>>>> +    default y
>>>>>> +    depends on ACPI && PCI
>>>>>> diff --git a/hw/acpi/erst.c b/hw/acpi/erst.c
>>>>>> new file mode 100644
>>>>>> index 0000000..4304f55
>>>>>> --- /dev/null
>>>>>> +++ b/hw/acpi/erst.c
>>>>>> @@ -0,0 +1,836 @@
>>>>>> +/*
>>>>>> + * ACPI Error Record Serialization Table, ERST, Implementation
>>>>>> + *
>>>>>> + * ACPI ERST introduced in ACPI 4.0, June 16, 2009.
>>>>>> + * ACPI Platform Error Interfaces : Error Serialization
>>>>>> + *
>>>>>> + * Copyright (c) 2021 Oracle and/or its affiliates.
>>>>>> + *
>>>>>> + * SPDX-License-Identifier: GPL-2.0-or-later
>>>>>> + */
>>>>>> +
>>>>>> +#include <sys/types.h>
>>>>>> +#include <sys/stat.h>
>>>>>> +#include <unistd.h>
>>>>>> +
>>>>>> +#include "qemu/osdep.h"
>>>>>> +#include "qapi/error.h"
>>>>>> +#include "hw/qdev-core.h"
>>>>>> +#include "exec/memory.h"
>>>>>> +#include "qom/object.h"
>>>>>> +#include "hw/pci/pci.h"
>>>>>> +#include "qom/object_interfaces.h"
>>>>>> +#include "qemu/error-report.h"
>>>>>> +#include "migration/vmstate.h"
>>>>>> +#include "hw/qdev-properties.h"
>>>>>> +#include "hw/acpi/acpi.h"
>>>>>> +#include "hw/acpi/acpi-defs.h"
>>>>>> +#include "hw/acpi/aml-build.h"
>>>>>> +#include "hw/acpi/bios-linker-loader.h"
>>>>>> +#include "exec/address-spaces.h"
>>>>>> +#include "sysemu/hostmem.h"
>>>>>> +#include "hw/acpi/erst.h"
>>>>>> +#include "trace.h"
>>>>>> +
>>>>>> +/* ACPI 4.0: Table 17-16 Serialization Actions */
>>>>>> +#define ACTION_BEGIN_WRITE_OPERATION         0x0
>>>>>> +#define ACTION_BEGIN_READ_OPERATION          0x1
>>>>>> +#define ACTION_BEGIN_CLEAR_OPERATION         0x2
>>>>>> +#define ACTION_END_OPERATION                 0x3
>>>>>> +#define ACTION_SET_RECORD_OFFSET             0x4
>>>>>> +#define ACTION_EXECUTE_OPERATION             0x5
>>>>>> +#define ACTION_CHECK_BUSY_STATUS             0x6
>>>>>> +#define ACTION_GET_COMMAND_STATUS            0x7
>>>>>> +#define ACTION_GET_RECORD_IDENTIFIER         0x8
>>>>>> +#define ACTION_SET_RECORD_IDENTIFIER         0x9
>>>>>> +#define ACTION_GET_RECORD_COUNT              0xA
>>>>>> +#define ACTION_BEGIN_DUMMY_WRITE_OPERATION   0xB
>>>>>> +#define ACTION_RESERVED                      0xC
>>>>>> +#define ACTION_GET_ERROR_LOG_ADDRESS_RANGE   0xD
>>>>>> +#define ACTION_GET_ERROR_LOG_ADDRESS_LENGTH  0xE
>>>>>> +#define ACTION_GET_ERROR_LOG_ADDRESS_RANGE_ATTRIBUTES 0xF
>>>>>> +#define ACTION_GET_EXECUTE_OPERATION_TIMINGS 0x10
>>>>>> +
>>>>>> +/* ACPI 4.0: Table 17-17 Command Status Definitions */
>>>>>> +#define STATUS_SUCCESS                0x00
>>>>>> +#define STATUS_NOT_ENOUGH_SPACE       0x01
>>>>>> +#define STATUS_HARDWARE_NOT_AVAILABLE 0x02
>>>>>> +#define STATUS_FAILED                 0x03
>>>>>> +#define STATUS_RECORD_STORE_EMPTY     0x04
>>>>>> +#define STATUS_RECORD_NOT_FOUND       0x05
>>>>>> +
>>>>>> +
>>>>>> +/* UEFI 2.1: Appendix N Common Platform Error Record */
>>>>>> +#define UEFI_CPER_RECORD_MIN_SIZE 128U
>>>>>> +#define UEFI_CPER_RECORD_LENGTH_OFFSET 20U
>>>>>> +#define UEFI_CPER_RECORD_ID_OFFSET 96U
>>>>>> +#define IS_UEFI_CPER_RECORD(ptr) \
>>>>>> +    (((ptr)[0] == 'C') && \
>>>>>> +     ((ptr)[1] == 'P') && \
>>>>>> +     ((ptr)[2] == 'E') && \
>>>>>> +     ((ptr)[3] == 'R'))
>>>>>> +
>>>>>> +/*
>>>>>> + * NOTE that when accessing CPER fields within a record, memcpy()
>>>>>> + * is utilized to avoid a possible misaligned access on the host.
>>>>>> + */
>>>>>> +
>>>>>> +/*
>>>>>> + * This implementation is an ACTION (cmd) and VALUE (data)
>>>>>> + * interface consisting of just two 64-bit registers.
>>>>>> + */
>>>>>> +#define ERST_REG_SIZE (16UL)
>>>>>> +#define ERST_ACTION_OFFSET (0UL) /* action (cmd) */
>>>>>> +#define ERST_VALUE_OFFSET  (8UL) /* argument/value (data) */
>>>>>> +
>>>>>> +/*
>>>>>> + * ERST_RECORD_SIZE is the buffer size for exchanging ERST
>>>>>> + * record contents. Thus, it defines the maximum record size.
>>>>>> + * As this is mapped through a PCI BAR, it must be a power of
>>>>>> + * two and larger than UEFI_CPER_RECORD_MIN_SIZE.
>>>>>> + * The backing storage is divided into fixed size "slots",
>>>>>> + * each ERST_RECORD_SIZE in length, and each "slot"
>>>>>> + * storing a single record. No attempt at optimizing storage
>>>>>> + * through compression, compaction, etc is attempted.
>>>>>> + * NOTE that slot 0 is reserved for the backing storage header.
>>>>>> + * Depending upon the size of the backing storage, additional
>>>>>> + * slots will be part of the slot 0 header in order to account
>>>>>> + * for a record_id for each available remaining slot.
>>>>>> + */
>>>>>> +/* 8KiB records, not too small, not too big */
>>>>>> +#define ERST_RECORD_SIZE (8192UL)
>>>>>> +
>>>>>> +#define ACPI_ERST_MEMDEV_PROP "memdev"
>>>>>> +#define ACPI_ERST_RECORD_SIZE_PROP "record_size"
>>>>>> +
>>>>>> +/*
>>>>>> + * From the ACPI ERST spec sections:
>>>>>> + * A record id of all 0s is used to indicate 'unspecified' record id.
>>>>>> + * A record id of all 1s is used to indicate empty or end.
>>>>>> + */
>>>>>> +#define ERST_UNSPECIFIED_RECORD_ID (0UL)
>>>>>> +#define ERST_EMPTY_END_RECORD_ID (~0UL)
>>>>>> +#define ERST_EXECUTE_OPERATION_MAGIC 0x9CUL
>>>>>> +#define ERST_IS_VALID_RECORD_ID(rid) \
>>>>>> +    ((rid != ERST_UNSPECIFIED_RECORD_ID) && \
>>>>>> +     (rid != ERST_EMPTY_END_RECORD_ID))
>>>>>> +#define ERST_STORE_MAGIC 0x524F545354535245UL /* ERSTSTOR */
>>>>>> +
>>>>>
>>>>> you might want to add a comment something like
>>>>> /* please see erst.rst documentation for the details on this header structure */
>>>> done!
>>>>
>>>>>
>>>>>> +typedef struct {
>>>>>> +    uint64_t magic;
>>>>>> +    uint32_t record_size;
>>>>>> +    uint32_t storage_offset; /* offset to record storage beyond header */
>>>>>> +    uint16_t version;
>>>>>> +    uint16_t reserved;
>>>>>> +    uint32_t record_count;
>>>>>> +    uint64_t map[]; /* contains record_ids, and position indicates index */
>>>>>> +} __attribute__((packed)) ERSTStorageHeader;
>>>>>> +
>>>>>> +/*
>>>>>> + * Object cast macro
>>>>>> + */
>>>>>> +#define ACPIERST(obj) \
>>>>>> +    OBJECT_CHECK(ERSTDeviceState, (obj), TYPE_ACPI_ERST)
>>>>>> +
>>>>>> +/*
>>>>>> + * Main ERST device state structure
>>>>>> + */
>>>>>> +typedef struct {
>>>>>> +    PCIDevice parent_obj;
>>>>>> +
>>>>>> +    /* Backend storage */
>>>>>> +    HostMemoryBackend *hostmem;
>>>>>> +    MemoryRegion *hostmem_mr;
>>>>>> +    uint32_t storage_size;
>>>>>> +    uint32_t default_record_size;
>>>>>> +
>>>>>> +    /* Programming registers */
>>>>>> +    MemoryRegion iomem_mr;
>>>>>> +
>>>>>> +    /* Exchange buffer */
>>>>>> +    MemoryRegion exchange_mr;
>>>>>> +
>>>>>> +    /* Interface state */
>>>>>> +    uint8_t operation;
>>>>>> +    uint8_t busy_status;
>>>>>> +    uint8_t command_status;
>>>>>> +    uint32_t record_offset;
>>>>>> +    uint64_t reg_action;
>>>>>> +    uint64_t reg_value;
>>>>>> +    uint64_t record_identifier;
>>>>>> +    ERSTStorageHeader *header;
>>>>>> +    unsigned first_record_index;
>>>>>> +    unsigned last_record_index;
>>>>>> +    unsigned next_record_index;
>>>>>> +
>>>>>> +} ERSTDeviceState;
>>>>>> +
>>>>>> +/*******************************************************************/
>>>>>> +/*******************************************************************/
>>>>>> +
>>>>>> +static uint8_t *get_nvram_ptr_by_index(ERSTDeviceState *s, unsigned index)
>>>>>> +{
>>>>>> +    uint8_t *rc = NULL;
>>>>>> +    off_t offset = (index * le32_to_cpu(s->header->record_size));
>>>>>> +
>>>>>> +    g_assert(offset < s->storage_size);
>>>>>> +
>>>>>> +    rc = memory_region_get_ram_ptr(s->hostmem_mr);
>>>>>> +    rc += offset;
>>>>>> +
>>>>>> +    return rc;
>>>>>> +}
>>>>>> +
>>>>>> +static void make_erst_storage_header(ERSTDeviceState *s)
>>>>>> +{
>>>>>> +    ERSTStorageHeader *header = s->header;
>>>>>> +    unsigned mapsz, headersz;
>>>>>> +
>>>>>> +    header->magic = cpu_to_le64(ERST_STORE_MAGIC);
>>>>>> +    header->record_size = cpu_to_le32(s->default_record_size);
>>>>>> +    header->version = cpu_to_le16(0x0100);
>>>>>> +    header->reserved = cpu_to_le16(0x0000);
>>>>>> +
>>>>>> +    /* Compute mapsize */
>>>>>> +    mapsz = s->storage_size / s->default_record_size;
>>>>>> +    mapsz *= sizeof(uint64_t);
>>>>>> +    /* Compute header+map size */
>>>>>> +    headersz = sizeof(ERSTStorageHeader) + mapsz;
>>>>>> +    /* Round up to nearest integer multiple of ERST_RECORD_SIZE */
>>>>>> +    headersz = QEMU_ALIGN_UP(headersz, s->default_record_size);
>>>>>> +    header->storage_offset = cpu_to_le32(headersz);
>>>>>> +
>>>>>> +    /*
>>>>>> +     * The HostMemoryBackend initializes contents to zero,
>>>>>> +     * so all record_ids stashed in the map are zero'd.
>>>>>> +     * As well the record_count is zero. Properly initialized.
>>>>>> +     */
>>>>>> +}
>>>>>> +
>>>>>> +static void check_erst_backend_storage(ERSTDeviceState *s, Error **errp)
>>>>>> +{
>>>>>> +    ERSTStorageHeader *header;
>>>>>> +    uint32_t record_size;
>>>>>> +
>>>>>> +    header = memory_region_get_ram_ptr(s->hostmem_mr);
>>>>>> +    s->header = header;
>>>>>> +
>>>>>> +    /* Ensure pointer to header is 64-bit aligned */
>>>>>> +    g_assert(QEMU_PTR_IS_ALIGNED(header, sizeof(uint64_t)));
>>>>>> +
>>>>>> +    /*
>>>>>> +     * Check if header is uninitialized; HostMemoryBackend inits to 0
>>>>>> +     */
>>>>>> +    if (le64_to_cpu(header->magic) == 0UL) {
>>>>>> +        make_erst_storage_header(s);
>>>>>> +    }
>>>>>> +
>>>>>> +    /* Validity check record_size */
>>>>>> +    record_size = le32_to_cpu(header->record_size);
>>>>>> +    if (!(
>>>>>> +        (record_size) && /* non zero */
>>>>>> +        (record_size >= UEFI_CPER_RECORD_MIN_SIZE) &&
>>>>>> +        (((record_size - 1) & record_size) == 0) && /* is power of 2 */
>>>>>> +        (record_size >= 4096) /* PAGE_SIZE */
>>>>>> +        )) {
>>>>>> +        error_setg(errp, "ERST record_size %u is invalid", record_size);
>>>>>> +    }
>>>>>> +
>>>>>> +    /* Validity check header */
>>>>>> +    if (!(
>>>>>> +        (le64_to_cpu(header->magic) == ERST_STORE_MAGIC) &&
>>>>>> +        ((le32_to_cpu(header->storage_offset) % record_size) == 0) &&
>>>>>> +        (le16_to_cpu(header->version) == 0x0100) &&
>>>>>> +        (le16_to_cpu(header->reserved) == 0)
>>>>>> +        )) {
>>>>>> +        error_setg(errp, "ERST backend storage header is invalid");
>>>>>> +    }
>>>>>> +
>>>>>> +    /* Check storage_size against record_size */
>>>>>> +    if (((s->storage_size % record_size) != 0) ||
>>>>>> +         (record_size > s->storage_size)) {
>>>>>> +        error_setg(errp, "ACPI ERST requires storage size be multiple of "
>>>>>> +            "record size (%uKiB)", record_size);
>>>>>> +    }
>>>>>> +
>>>>>> +    /* Compute offset of first and last record storage slot */
>>>>>> +    s->first_record_index = le32_to_cpu(header->storage_offset)
>>>>>> +        / record_size;
>>>>>> +    s->last_record_index = (s->storage_size / record_size);
>>>>>> +}
>>>>>> +
>>>>>> +static void update_map_entry(ERSTDeviceState *s, unsigned index,
>>>>>> +    uint64_t record_id)
>>>>>> +{
>>>>>> +    if (index < s->last_record_index) {
>>>>>> +        s->header->map[index] = cpu_to_le64(record_id);
>>>>>> +    }
>>>>>> +}
>>>>>> +
>>>>>> +static unsigned allocate_erst_record(ERSTDeviceState *s)
>>>>>> +{
>>>>>> +    unsigned rc = 0; /* 0 not a valid index */
>>>>>> +    unsigned index = s->first_record_index;
>>>>>> +
>>>>>> +    for (; index < s->last_record_index; ++index) {
>>>>>> +        if (le64_to_cpu(s->header->map[index]) == ERST_UNSPECIFIED_RECORD_ID) {
>>>>>> +            rc = index;
>>>>>> +            break;
>>>>>> +        }
>>>>>> +    }
>>>>>> +
>>>>>> +    return rc;
>>>>>> +}
>>>>>> +
>>>>>> +static unsigned lookup_erst_record(ERSTDeviceState *s,
>>>>>> +    uint64_t record_identifier)
>>>>>> +{
>>>>>> +    unsigned rc = 0; /* 0 not a valid index */
>>>>>> +
>>>>>> +    /* Find the record_identifier in the map */
>>>>>> +    if (record_identifier != ERST_UNSPECIFIED_RECORD_ID) {
>>>>>> +        /*
>>>>>> +         * Count number of valid records encountered, and
>>>>>> +         * short-circuit the loop if identifier not found
>>>>>> +         */
>>>>>> +        uint32_t record_count = le32_to_cpu(s->header->record_count);
>>>>>> +        unsigned count = 0;
>>>>>> +        unsigned index;
>>>>>> +        for (index = s->first_record_index; index < s->last_record_index &&
>>>>>> +                count < record_count; ++index) {
>>>>>> +            if (le64_to_cpu(s->header->map[index]) == record_identifier) {
>>>>>> +                rc = index;
>>>>>> +                break;
>>>>>> +            }
>>>>>> +            if (le64_to_cpu(s->header->map[index]) !=
>>>>>> +                ERST_UNSPECIFIED_RECORD_ID) {
>>>>>> +                ++count;
>>>>>> +            }
>>>>>> +        }
>>>>>> +    }
>>>>>> +
>>>>>> +    return rc;
>>>>>> +}
>>>>>> +
>>>>>> +/*
>>>>>> + * ACPI 4.0: 17.4.1.1 Serialization Actions, also see
>>>>>> + * ACPI 4.0: 17.4.2.2 Operations - Reading 6.c and 2.c
>>>>>> + */
>>>>>> +static unsigned get_next_record_identifier(ERSTDeviceState *s,
>>>>>> +    uint64_t *record_identifier, bool first)
>>>>>> +{
>>>>>> +    unsigned found = 0;
>>>>>> +    unsigned index;
>>>>>> +
>>>>>> +    /* For operations needing to return 'first' record identifer */
>>>>>> +    if (first) {
>>>>>> +        /* Reset initial index to beginning */
>>>>>> +        s->next_record_index = s->first_record_index;
>>>>>> +    }
>>>>>> +    index = s->next_record_index;
>>>>>> +
>>>>>> +    *record_identifier = ERST_EMPTY_END_RECORD_ID;
>>>>>> +
>>>>>> +    if (le32_to_cpu(s->header->record_count)) {
>>>>>> +        for (; index < s->last_record_index; ++index) {
>>>>>> +            if (le64_to_cpu(s->header->map[index]) !=
>>>>>> +                    ERST_UNSPECIFIED_RECORD_ID) {
>>>>>> +                    /* where to start next time */
>>>>>> +                    s->next_record_index = index + 1;
>>>>>> +                    *record_identifier = le64_to_cpu(s->header->map[index]);
>>>>>> +                    found = 1;
>>>>>> +                    break;
>>>>>> +            }
>>>>>> +        }
>>>>>> +    }
>>>>>> +    if (!found) {
>>>>>> +        /* at end (ie scan complete), reset */
>>>>>> +        s->next_record_index = s->first_record_index;
>>>>>> +    }
>>>>>> +
>>>>>> +    return STATUS_SUCCESS;
>>>>>> +}
>>>>>> +
>>>>>> +/* ACPI 4.0: 17.4.2.3 Operations - Clearing */
>>>>>> +static unsigned clear_erst_record(ERSTDeviceState *s)
>>>>>> +{
>>>>>> +    unsigned rc = STATUS_RECORD_NOT_FOUND;
>>>>>> +    unsigned index;
>>>>>> +
>>>>>> +    /* Check for valid record identifier */
>>>>>> +    if (!ERST_IS_VALID_RECORD_ID(s->record_identifier)) {
>>>>>> +        return STATUS_FAILED;
>>>>>> +    }
>>>>>> +
>>>>>> +    index = lookup_erst_record(s, s->record_identifier);
>>>>>> +    if (index) {
>>>>>> +        /* No need to wipe record, just invalidate its map entry */
>>>>>> +        uint32_t record_count;
>>>>>> +        update_map_entry(s, index, ERST_UNSPECIFIED_RECORD_ID);
>>>>>> +        record_count = le32_to_cpu(s->header->record_count);
>>>>>> +        record_count -= 1;
>>>>>> +        s->header->record_count = cpu_to_le32(record_count);
>>>>>> +        rc = STATUS_SUCCESS;
>>>>>> +    }
>>>>>> +
>>>>>> +    return rc;
>>>>>> +}
>>>>>> +
>>>>>> +/* ACPI 4.0: 17.4.2.2 Operations - Reading */
>>>>>> +static unsigned read_erst_record(ERSTDeviceState *s)
>>>>>> +{
>>>>>> +    unsigned rc = STATUS_RECORD_NOT_FOUND;
>>>>>> +    unsigned exchange_length;
>>>>>> +    unsigned index;
>>>>>> +
>>>>>> +    /* Check if backend storage is empty */
>>>>>> +    if (le32_to_cpu(s->header->record_count) == 0) {
>>>>>> +        return STATUS_RECORD_STORE_EMPTY;
>>>>>> +    }
>>>>>> +
>>>>>> +    exchange_length = memory_region_size(&s->exchange_mr);
>>>>>> +
>>>>>> +    /* Check for record identifier of all 0s */
>>>>>> +    if (s->record_identifier == ERST_UNSPECIFIED_RECORD_ID) {
>>>>>> +        /* Set to 'first' record in storage */
>>>>>> +        get_next_record_identifier(s, &s->record_identifier, true);
>>>>>> +        /* record_identifier is now a valid id, or all 1s */
>>>>>> +    }
>>>>>> +
>>>>>> +    /* Check for record identifier of all 1s */
>>>>>> +    if (s->record_identifier == ERST_EMPTY_END_RECORD_ID) {
>>>>>> +        return STATUS_FAILED;
>>>>>> +    }
>>>>>> +
>>>>>> +    /* Validate record_offset */
>>>>>> +    if (s->record_offset > (exchange_length - UEFI_CPER_RECORD_MIN_SIZE)) {
>>>>>> +        return STATUS_FAILED;
>>>>>> +    }
>>>>>> +
>>>>>> +    index = lookup_erst_record(s, s->record_identifier);
>>>>>> +    if (index) {
>>>>>> +        uint8_t *nvram;
>>>>>> +        uint8_t *exchange;
>>>>>> +        uint32_t record_length;
>>>>>> +
>>>>>> +        /* Obtain pointer to the exchange buffer */
>>>>>> +        exchange = memory_region_get_ram_ptr(&s->exchange_mr);
>>>>>> +        exchange += s->record_offset;
>>>>>> +        /* Obtain pointer to slot in storage */
>>>>>> +        nvram = get_nvram_ptr_by_index(s, index);
>>>>>> +        /* Validate CPER record_length */
>>>>>> +        memcpy((uint8_t *)&record_length,
>>>>>> +            &nvram[UEFI_CPER_RECORD_LENGTH_OFFSET],
>>>>>> +            sizeof(uint32_t));
>>>>>> +        record_length = le32_to_cpu(record_length);
>>>>>> +        if (record_length < UEFI_CPER_RECORD_MIN_SIZE) {
>>>>>> +            rc = STATUS_FAILED;
>>>>>> +        }
>>>>>> +        if ((s->record_offset + record_length) > exchange_length) {
>>>>>> +            rc = STATUS_FAILED;
>>>>>> +        }
>>>>>> +        /* If all is ok, copy the record to the exchange buffer */
>>>>>> +        if (rc != STATUS_FAILED) {
>>>>>> +            memcpy(exchange, nvram, record_length);
>>>>>> +            rc = STATUS_SUCCESS;
>>>>>> +        }
>>>>>> +    } else {
>>>>>
>>>>> I wonder if it is wise to return the next record id if the record is
>>>>> not found. Should we simply return STATUS_FAILED here as well?
>>>>
>>>> Actually, this is per the spec. ACPI Spec 4.0 17.4.2.2 (or ACPI Spec 6.3 18.5.2.2) "Reading", see
>>>> "The steps performed by the platform ...", section 2.c, calls for locating the 'first' identifier.
>>>
>>> yes you are correct on this one.
>>>
>>>>
>>>> I left a reference comment in the code.
>>>>
>>>>>
>>>>>> +        /* Set to 'first' record in storage */
>>>>>> +        get_next_record_identifier(s, &s->record_identifier, true);
>>>>>> +    }
>>>>>> +
>>>>>> +    return rc;
>>>>>> +}
>>>>>> +
>>>>>> +/* ACPI 4.0: 17.4.2.1 Operations - Writing */
>>>>>> +static unsigned write_erst_record(ERSTDeviceState *s)
>>>>>> +{
>>>>>> +    unsigned rc = STATUS_FAILED;
>>>>>> +    unsigned exchange_length;
>>>>>> +    unsigned index;
>>>>>> +    uint64_t record_identifier;
>>>>>> +    uint32_t record_length;
>>>>>> +    uint8_t *exchange;
>>>>>> +    uint8_t *nvram = NULL;
>>>>>> +    bool record_found = false;
>>>>>> +
>>>>>> +    exchange_length = memory_region_size(&s->exchange_mr);
>>>>>> +
>>>>>> +    /* Validate record_offset */
>>>>>> +    if (s->record_offset > (exchange_length - UEFI_CPER_RECORD_MIN_SIZE)) {
>>>>>> +        return STATUS_FAILED;
>>>>>> +    }
>>>>>> +
>>>>>> +    /* Obtain pointer to record in the exchange buffer */
>>>>>> +    exchange = memory_region_get_ram_ptr(&s->exchange_mr);
>>>>>> +    exchange += s->record_offset;
>>>>>> +
>>>>>> +    /* Validate CPER record_length */
>>>>>> +    memcpy((uint8_t *)&record_length, &exchange[UEFI_CPER_RECORD_LENGTH_OFFSET],
>>>>>> +        sizeof(uint32_t));
>>>>>> +    record_length = le32_to_cpu(record_length);
>>>>>> +    if (record_length < UEFI_CPER_RECORD_MIN_SIZE) {
>>>>>> +        return STATUS_FAILED;
>>>>>> +    }
>>>>>> +    if ((s->record_offset + record_length) > exchange_length) {
>>>>>> +        return STATUS_FAILED;
>>>>>> +    }
>>>>>> +
>>>>>> +    /* Extract record identifier */
>>>>>> +    memcpy((uint8_t *)&record_identifier, &exchange[UEFI_CPER_RECORD_ID_OFFSET],
>>>>>> +        sizeof(uint64_t));
>>>>>> +    record_identifier = le64_to_cpu(record_identifier);
>>>>>> +
>>>>>> +    /* Check for valid record identifier */
>>>>>> +    if (!ERST_IS_VALID_RECORD_ID(record_identifier)) {
>>>>>> +        return STATUS_FAILED;
>>>>>> +    }
>>>>>> +
>>>>>> +    index = lookup_erst_record(s, record_identifier);
>>>>>> +    if (index) {
>>>>>> +        /* Record found, overwrite existing record */
>>>>>> +        nvram = get_nvram_ptr_by_index(s, index);
>>>>>> +        record_found = true;
>>>>>> +    } else {
>>>>>> +        /* Record not found, not an overwrite, allocate for write */
>>>>>> +        index = allocate_erst_record(s);
>>>>>> +        if (index) {
>>>>>> +            nvram = get_nvram_ptr_by_index(s, index);
>>>>>> +        } else {
>>>>>> +            rc = STATUS_NOT_ENOUGH_SPACE;
>>>>>
>>>>> /* all slots are occupied */
>>>> done!
>>>>
>>>>>
>>>>>> +        }
>>>>>> +    }
>>>>>> +    if (nvram) {
>>>>>> +        /* Write the record into the slot */
>>>>>> +        memcpy(nvram, exchange, record_length);
>>>>>> +        memset(nvram + record_length, exchange_length - record_length, 0xFF);
>>>>>> +        /* If a new record, increment the record_count */
>>>>>> +        if (!record_found) {
>>>>>> +            uint32_t record_count;
>>>>>> +            record_count = le32_to_cpu(s->header->record_count);
>>>>>> +            record_count += 1; /* writing new record */
>>>>>> +            s->header->record_count = cpu_to_le32(record_count);
>>>>>> +        }
>>>>>> +        update_map_entry(s, index, record_identifier);
>>>>>> +        rc = STATUS_SUCCESS;
>>>>>> +    }
>>>>>> +
>>>>>> +    return rc;
>>>>>> +}
>>>>>> +
>>>>>> +/*******************************************************************/
>>>>>> +
>>>>>> +static uint64_t erst_rd_reg64(hwaddr addr,
>>>>>> +    uint64_t reg, unsigned size)
>>>>>> +{
>>>>>> +    uint64_t rdval;
>>>>>> +    uint64_t mask;
>>>>>> +    unsigned shift;
>>>>>> +
>>>>>> +    if (size == sizeof(uint64_t)) {
>>>>>> +        /* 64b access */
>>>>>> +        mask = 0xFFFFFFFFFFFFFFFFUL;
>>>>>> +        shift = 0;
>>>>>> +    } else {
>>>>>> +        /* 32b access */
>>>>>> +        mask = 0x00000000FFFFFFFFUL;
>>>>>> +        shift = ((addr & 0x4) == 0x4) ? 32 : 0;
>>>>>> +    }
>>>>>> +
>>>>>> +    rdval = reg;
>>>>>> +    rdval >>= shift;
>>>>>> +    rdval &= mask;
>>>>>> +
>>>>>> +    return rdval;
>>>>>> +}
>>>>>> +
>>>>>> +static uint64_t erst_wr_reg64(hwaddr addr,
>>>>>> +    uint64_t reg, uint64_t val, unsigned size)
>>>>>> +{
>>>>>> +    uint64_t wrval;
>>>>>> +    uint64_t mask;
>>>>>> +    unsigned shift;
>>>>>> +
>>>>>> +    if (size == sizeof(uint64_t)) {
>>>>>> +        /* 64b access */
>>>>>> +        mask = 0xFFFFFFFFFFFFFFFFUL;
>>>>>> +        shift = 0;
>>>>>> +    } else {
>>>>>> +        /* 32b access */
>>>>>> +        mask = 0x00000000FFFFFFFFUL;
>>>>>> +        shift = ((addr & 0x4) == 0x4) ? 32 : 0;
>>>>>> +    }
>>>>>> +
>>>>>> +    val &= mask;
>>>>>> +    val <<= shift;
>>>>>> +    mask <<= shift;
>>>>>> +    wrval = reg;
>>>>>> +    wrval &= ~mask;
>>>>>> +    wrval |= val;
>>>>>> +
>>>>>> +    return wrval;
>>>>>> +}
>>>>>> +
>>>>>> +static void erst_reg_write(void *opaque, hwaddr addr,
>>>>>> +    uint64_t val, unsigned size)
>>>>>> +{
>>>>>> +    ERSTDeviceState *s = (ERSTDeviceState *)opaque;
>>>>>> +
>>>>>> +    /*
>>>>>> +     * NOTE: All actions/operations/side effects happen on the WRITE,
>>>>>> +     * by this implementation's design. The READs simply return the
>>>>>> +     * reg_value contents.
>>>>>> +     */
>>>>>> +    trace_acpi_erst_reg_write(addr, val, size);
>>>>>> +
>>>>>> +    switch (addr) {
>>>>>> +    case ERST_VALUE_OFFSET + 0:
>>>>>> +    case ERST_VALUE_OFFSET + 4:
>>>>>> +        s->reg_value = erst_wr_reg64(addr, s->reg_value, val, size);
>>>>>> +        break;
>>>>>> +    case ERST_ACTION_OFFSET + 0:
>>>>>> +        /*
>>>>>> +         * NOTE: all valid values written to this register are of the
>>>>>> +         * ACTION_* variety. Thus there is no need to make this a 64-bit
>>>>>> +         * register, 32-bits is appropriate. As such ERST_ACTION_OFFSET+4
>>>>>> +         * is not needed.
>>>>>> +         */
>>>>>> +        switch (val) {
>>>>>> +        case ACTION_BEGIN_WRITE_OPERATION:
>>>>>> +        case ACTION_BEGIN_READ_OPERATION:
>>>>>> +        case ACTION_BEGIN_CLEAR_OPERATION:
>>>>>> +        case ACTION_BEGIN_DUMMY_WRITE_OPERATION:
>>>>>> +        case ACTION_END_OPERATION:
>>>>>> +            s->operation = val;
>>>>>> +            break;
>>>>>> +        case ACTION_SET_RECORD_OFFSET:
>>>>>> +            s->record_offset = s->reg_value;
>>>>>> +            break;
>>>>>> +        case ACTION_EXECUTE_OPERATION:
>>>>>> +            if ((uint8_t)s->reg_value == ERST_EXECUTE_OPERATION_MAGIC) {
>>>>>> +                s->busy_status = 1;
>>>>>> +                switch (s->operation) {
>>>>>> +                case ACTION_BEGIN_WRITE_OPERATION:
>>>>>> +                    s->command_status = write_erst_record(s);
>>>>>> +                    break;
>>>>>> +                case ACTION_BEGIN_READ_OPERATION:
>>>>>> +                    s->command_status = read_erst_record(s);
>>>>>> +                    break;
>>>>>> +                case ACTION_BEGIN_CLEAR_OPERATION:
>>>>>> +                    s->command_status = clear_erst_record(s);
>>>>>> +                    break;
>>>>>> +                case ACTION_BEGIN_DUMMY_WRITE_OPERATION:
>>>>>> +                    s->command_status = STATUS_SUCCESS;
>>>>>> +                    break;
>>>>>> +                case ACTION_END_OPERATION:
>>>>>> +                    s->command_status = STATUS_SUCCESS;
>>>>>> +                    break;
>>>>>> +                default:
>>>>>> +                    s->command_status = STATUS_FAILED;
>>>>>
>>>>> Should this be something like STATUS_NOT_SUPPORTED?
>>>> Throughout I've been exclusively using the status codes as defined in the spec:
>>>> Success, Not Enough Space, Hardware Not Available, Failed, Record Store Empty, Record Not Found.
>>>
>>> yes sadly the spec does not have an equivalent of EINVAL or ENOTSUPP.
>>>
>>>>
>>>> Failed seems to be an appropriate response.
>>>
>>> should we simply assert() on these cases for now (unless spec
>>> explicitly says otherwise) ?
>>
>> I've re-examined the spec and it does not address this situation, that I can tell
>>
>> However, an assert() seems like a drastic measure (as I understand it, the assert would kill the guest).
>>
>> In theory we should never encounter this situation, as we have essentially provided a closed system
>> with the ACPI table perfectly matching the capabilities of the hardware, and/or vice versa. I then
>> suppose it becomes a matter if something malicious is happening. In that case, it better to assert()
>> and kill the guest (essentiallyl a denial of service attack?), or just FAIL and make this
>> "uninteresting" to the attacker?
>>
>> It seems to me that FAIL provides a better response.
> 
> I have reconsidered this and I think instead of crashing the process,
> FAIL is indeed the better response.
> You can fix this if you are spinning up a new version or I can fix it
> once your patch has been pushed.
> 
>>
>>>
>>>>
>>>>>
>>>>>> +                    break;
>>>>>> +                }
>>>>>> +                s->busy_status = 0;
>>>>>> +            }
>>>>>> +            break;
>>>>>> +        case ACTION_CHECK_BUSY_STATUS:
>>>>>> +            s->reg_value = s->busy_status;
>>>>>> +            break;
>>>>>> +        case ACTION_GET_COMMAND_STATUS:
>>>>>> +            s->reg_value = s->command_status;
>>>>>> +            break;
>>>>>> +        case ACTION_GET_RECORD_IDENTIFIER:
>>>>>> +            s->command_status = get_next_record_identifier(s,
>>>>>> +                                    &s->reg_value, false);
>>>>>> +            break;
>>>>>> +        case ACTION_SET_RECORD_IDENTIFIER:
>>>>>> +            s->record_identifier = s->reg_value;
>>>>>> +            break;
>>>>>> +        case ACTION_GET_RECORD_COUNT:
>>>>>> +            s->reg_value = le32_to_cpu(s->header->record_count);
>>>>>> +            break;
>>>>>> +        case ACTION_GET_ERROR_LOG_ADDRESS_RANGE:
>>>>>> +            s->reg_value = (hwaddr)pci_get_bar_addr(PCI_DEVICE(s), 1);
>>>>>> +            break;
>>>>>> +        case ACTION_GET_ERROR_LOG_ADDRESS_LENGTH:
>>>>>> +            s->reg_value = le32_to_cpu(s->header->record_size);
>>>>>> +            break;
>>>>>> +        case ACTION_GET_ERROR_LOG_ADDRESS_RANGE_ATTRIBUTES:
>>>>>> +            s->reg_value = 0x0; /* intentional, not NVRAM mode */
>>>>>> +            break;
>>>>>> +        case ACTION_GET_EXECUTE_OPERATION_TIMINGS:
>>>>>> +            s->reg_value =
>>>>>> +                (100ULL << 32) | /* 100us max time */
>>>>>> +                (10ULL  <<  0) ; /*  10us min time */
>>>>>> +            break;
>>>>>> +        default:
>>>>>> +            /* Unknown action/command, NOP */
>>>>>
>>>>> maybe add some tracing here in case guests are going bad mmio writes?
>>>> At the top of this function is a trace that produces information on all writes.
>>>
>>> OK cool.
>>>
>>>>
>>>>>
>>>>>> +            break;
>>>>>> +        }
>>>>>> +        break;
>>>>>> +    default:
>>>>>> +        /* This should not happen, but if it does, NOP */
>>>>>> +        break;
>>>>>> +    }
>>>>>> +}
>>>>>> +
>>>>>> +static uint64_t erst_reg_read(void *opaque, hwaddr addr,
>>>>>> +                                unsigned size)
>>>>>> +{
>>>>>> +    ERSTDeviceState *s = (ERSTDeviceState *)opaque;
>>>>>> +    uint64_t val = 0;
>>>>>> +
>>>>>> +    switch (addr) {
>>>>>> +    case ERST_ACTION_OFFSET + 0:
>>>>>> +    case ERST_ACTION_OFFSET + 4:
>>>>>> +        val = erst_rd_reg64(addr, s->reg_action, size);
>>>>>> +        break;
>>>>>> +    case ERST_VALUE_OFFSET + 0:
>>>>>> +    case ERST_VALUE_OFFSET + 4:
>>>>>> +        val = erst_rd_reg64(addr, s->reg_value, size);
>>>>>> +        break;
>>>>>> +    default:
>>>>>> +        break;
>>>>>> +    }
>>>>>> +    trace_acpi_erst_reg_read(addr, val, size);
>>>>>> +    return val;
>>>>>> +}
>>>>>> +
>>>>>> +static const MemoryRegionOps erst_reg_ops = {
>>>>>> +    .read = erst_reg_read,
>>>>>> +    .write = erst_reg_write,
>>>>>> +    .endianness = DEVICE_NATIVE_ENDIAN,
>>>>>> +};
>>>>>> +
>>>>>> +/*******************************************************************/
>>>>>> +/*******************************************************************/
>>>>>> +static int erst_post_load(void *opaque, int version_id)
>>>>>> +{
>>>>>> +    ERSTDeviceState *s = opaque;
>>>>>> +
>>>>>> +    /* Recompute pointer to header */
>>>>>> +    s->header = (ERSTStorageHeader *)get_nvram_ptr_by_index(s, 0);
>>>>>> +    trace_acpi_erst_post_load(s->header, le32_to_cpu(s->header->record_size));
>>>>>> +
>>>>>> +    return 0;
>>>>>> +}
>>>>>> +
>>>>>> +static const VMStateDescription erst_vmstate  = {
>>>>>> +    .name = "acpi-erst",
>>>>>> +    .version_id = 1,
>>>>>> +    .minimum_version_id = 1,
>>>>>> +    .post_load = erst_post_load,
>>>>>> +    .fields = (VMStateField[]) {
>>>>>> +        VMSTATE_UINT8(operation, ERSTDeviceState),
>>>>>> +        VMSTATE_UINT8(busy_status, ERSTDeviceState),
>>>>>> +        VMSTATE_UINT8(command_status, ERSTDeviceState),
>>>>>> +        VMSTATE_UINT32(record_offset, ERSTDeviceState),
>>>>>> +        VMSTATE_UINT64(reg_action, ERSTDeviceState),
>>>>>> +        VMSTATE_UINT64(reg_value, ERSTDeviceState),
>>>>>> +        VMSTATE_UINT64(record_identifier, ERSTDeviceState),
>>>>>> +        VMSTATE_UINT32(next_record_index, ERSTDeviceState),
>>>>>> +        VMSTATE_END_OF_LIST()
>>>>>> +    }
>>>>>> +};
>>>>>> +
>>>>>> +static void erst_realizefn(PCIDevice *pci_dev, Error **errp)
>>>>>> +{
>>>>>> +    ERSTDeviceState *s = ACPIERST(pci_dev);
>>>>>> +
>>>>>> +    trace_acpi_erst_realizefn_in();
>>>>>> +
>>>>>> +    if (!s->hostmem) {
>>>>>> +        error_setg(errp, "'" ACPI_ERST_MEMDEV_PROP "' property is not set");
>>>>>> +        return;
>>>>>> +    } else if (host_memory_backend_is_mapped(s->hostmem)) {
>>>>>> +        error_setg(errp, "can't use already busy memdev: %s",
>>>>>> +                   object_get_canonical_path_component(OBJECT(s->hostmem)));
>>>>>> +        return;
>>>>>> +    }
>>>>>> +
>>>>>> +    s->hostmem_mr = host_memory_backend_get_memory(s->hostmem);
>>>>>> +
>>>>>> +    /* HostMemoryBackend size will be multiple of PAGE_SIZE */
>>>>>> +    s->storage_size = object_property_get_int(OBJECT(s->hostmem), "size", errp);
>>>>>> +
>>>>>> +    /* Initialize backend storage and record_count */
>>>>>> +    check_erst_backend_storage(s, errp);
>>>>>> +
>>>>>> +    /* BAR 0: Programming registers */
>>>>>> +    memory_region_init_io(&s->iomem_mr, OBJECT(pci_dev), &erst_reg_ops, s,
>>>>>> +                          TYPE_ACPI_ERST, ERST_REG_SIZE);
>>>>>> +    pci_register_bar(pci_dev, 0, PCI_BASE_ADDRESS_SPACE_MEMORY, &s->iomem_mr);
>>>>>> +
>>>>>> +    /* BAR 1: Exchange buffer memory */
>>>>>> +    memory_region_init_ram(&s->exchange_mr, OBJECT(pci_dev),
>>>>>> +                            "erst.exchange",
>>>>>> +                            le32_to_cpu(s->header->record_size), errp);
>>>>>> +    pci_register_bar(pci_dev, 1, PCI_BASE_ADDRESS_SPACE_MEMORY,
>>>>>> +                        &s->exchange_mr);
>>>>>> +
>>>>>> +    /* Include the backend storage in the migration stream */
>>>>>> +    vmstate_register_ram_global(s->hostmem_mr);
>>>>>> +
>>>>>> +    trace_acpi_erst_realizefn_out(s->storage_size);
>>>>>> +}
>>>>>> +
>>>>>> +static void erst_reset(DeviceState *dev)
>>>>>> +{
>>>>>> +    ERSTDeviceState *s = ACPIERST(dev);
>>>>>> +
>>>>>> +    trace_acpi_erst_reset_in(le32_to_cpu(s->header->record_count));
>>>>>> +    s->operation = 0;
>>>>>> +    s->busy_status = 0;
>>>>>> +    s->command_status = STATUS_SUCCESS;
>>>>>> +    s->record_identifier = ERST_UNSPECIFIED_RECORD_ID;
>>>>>> +    s->record_offset = 0;
>>>>>> +    s->next_record_index = s->first_record_index;
>>>>>> +    /* NOTE: first/last_record_index are computed only once */
>>>>>> +    trace_acpi_erst_reset_out(le32_to_cpu(s->header->record_count));
>>>>>> +}
>>>>>> +
>>>>>> +static Property erst_properties[] = {
>>>>>> +    DEFINE_PROP_LINK(ACPI_ERST_MEMDEV_PROP, ERSTDeviceState, hostmem,
>>>>>> +                     TYPE_MEMORY_BACKEND, HostMemoryBackend *),
>>>>>> +    DEFINE_PROP_UINT32(ACPI_ERST_RECORD_SIZE_PROP, ERSTDeviceState,
>>>>>> +                     default_record_size, ERST_RECORD_SIZE),
>>>>>> +    DEFINE_PROP_END_OF_LIST(),
>>>>>> +};
>>>>>> +
>>>>>> +static void erst_class_init(ObjectClass *klass, void *data)
>>>>>> +{
>>>>>> +    DeviceClass *dc = DEVICE_CLASS(klass);
>>>>>> +    PCIDeviceClass *k = PCI_DEVICE_CLASS(klass);
>>>>>> +
>>>>>> +    trace_acpi_erst_class_init_in();
>>>>>> +    k->realize = erst_realizefn;
>>>>>> +    k->vendor_id = PCI_VENDOR_ID_REDHAT;
>>>>>> +    k->device_id = PCI_DEVICE_ID_REDHAT_ACPI_ERST;
>>>>>> +    k->revision = 0x00;
>>>>>> +    k->class_id = PCI_CLASS_OTHERS;
>>>>>> +    dc->reset = erst_reset;
>>>>>> +    dc->vmsd = &erst_vmstate;
>>>>>> +    dc->user_creatable = true;
>>>>>> +    dc->hotpluggable = false;
>>>>>> +    device_class_set_props(dc, erst_properties);
>>>>>> +    dc->desc = "ACPI Error Record Serialization Table (ERST) device";
>>>>>> +    set_bit(DEVICE_CATEGORY_MISC, dc->categories);
>>>>>> +    trace_acpi_erst_class_init_out();
>>>>>> +}
>>>>>> +
>>>>>> +static const TypeInfo erst_type_info = {
>>>>>> +    .name          = TYPE_ACPI_ERST,
>>>>>> +    .parent        = TYPE_PCI_DEVICE,
>>>>>> +    .class_init    = erst_class_init,
>>>>>> +    .instance_size = sizeof(ERSTDeviceState),
>>>>>> +    .interfaces = (InterfaceInfo[]) {
>>>>>> +        { INTERFACE_CONVENTIONAL_PCI_DEVICE },
>>>>>> +        { }
>>>>>> +    }
>>>>>> +};
>>>>>> +
>>>>>> +static void erst_register_types(void)
>>>>>> +{
>>>>>> +    type_register_static(&erst_type_info);
>>>>>> +}
>>>>>> +
>>>>>> +type_init(erst_register_types)
>>>>>> diff --git a/hw/acpi/meson.build b/hw/acpi/meson.build
>>>>>> index adf6347..f5b2298 100644
>>>>>> --- a/hw/acpi/meson.build
>>>>>> +++ b/hw/acpi/meson.build
>>>>>> @@ -22,6 +22,7 @@ acpi_ss.add(when: 'CONFIG_ACPI_PCIHP', if_true: files('pcihp.c'))
>>>>>>     acpi_ss.add(when: 'CONFIG_ACPI_PCIHP', if_false: files('acpi-pci-hotplug-stub.c'))
>>>>>>     acpi_ss.add(when: 'CONFIG_ACPI_VIOT', if_true: files('viot.c'))
>>>>>>     acpi_ss.add(when: 'CONFIG_ACPI_X86_ICH', if_true: files('ich9.c', 'tco.c'))
>>>>>> +acpi_ss.add(when: 'CONFIG_ACPI_ERST', if_true: files('erst.c'))
>>>>>>     acpi_ss.add(when: 'CONFIG_IPMI', if_true: files('ipmi.c'), if_false: files('ipmi-stub.c'))
>>>>>>     acpi_ss.add(when: 'CONFIG_PC', if_false: files('acpi-x86-stub.c'))
>>>>>>     acpi_ss.add(when: 'CONFIG_TPM', if_true: files('tpm.c'))
>>>>>> diff --git a/hw/acpi/trace-events b/hw/acpi/trace-events
>>>>>> index 974d770..2250126 100644
>>>>>> --- a/hw/acpi/trace-events
>>>>>> +++ b/hw/acpi/trace-events
>>>>>> @@ -55,3 +55,18 @@ piix4_gpe_writeb(uint64_t addr, unsigned width, uint64_t val) "addr: 0x%" PRIx64
>>>>>>     # tco.c
>>>>>>     tco_timer_reload(int ticks, int msec) "ticks=%d (%d ms)"
>>>>>>     tco_timer_expired(int timeouts_no, bool strap, bool no_reboot) "timeouts_no=%d no_reboot=%d/%d"
>>>>>> +
>>>>>> +# erst.c
>>>>>> +acpi_erst_reg_write(uint64_t addr, uint64_t val, unsigned size) "addr: 0x%04" PRIx64 " <== 0x%016" PRIx64 " (size: %u)"
>>>>>> +acpi_erst_reg_read(uint64_t addr, uint64_t val, unsigned size) " addr: 0x%04" PRIx64 " ==> 0x%016" PRIx64 " (size: %u)"
>>>>>> +acpi_erst_mem_write(uint64_t addr, uint64_t val, unsigned size) "addr: 0x%06" PRIx64 " <== 0x%016" PRIx64 " (size: %u)"
>>>>>> +acpi_erst_mem_read(uint64_t addr, uint64_t val, unsigned size) " addr: 0x%06" PRIx64 " ==> 0x%016" PRIx64 " (size: %u)"
>>>>>> +acpi_erst_pci_bar_0(uint64_t addr) "BAR0: 0x%016" PRIx64
>>>>>> +acpi_erst_pci_bar_1(uint64_t addr) "BAR1: 0x%016" PRIx64
>>>>>> +acpi_erst_realizefn_in(void)
>>>>>> +acpi_erst_realizefn_out(unsigned size) "total nvram size %u bytes"
>>>>>> +acpi_erst_reset_in(unsigned record_count) "record_count %u"
>>>>>> +acpi_erst_reset_out(unsigned record_count) "record_count %u"
>>>>>> +acpi_erst_post_load(void *header, unsigned slot_size) "header: 0x%p slot_size %u"
>>>>>> +acpi_erst_class_init_in(void)
>>>>>> +acpi_erst_class_init_out(void)
>>>>>> --
>>>>>> 1.8.3.1
>>>>>>

