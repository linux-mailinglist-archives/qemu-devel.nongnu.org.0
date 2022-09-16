Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C2E85BAF86
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Sep 2022 16:42:34 +0200 (CEST)
Received: from localhost ([::1]:37620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oZCY5-0007gj-JY
	for lists+qemu-devel@lfdr.de; Fri, 16 Sep 2022 10:42:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33052)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.kanda@oracle.com>)
 id 1oZCMH-00041e-NC
 for qemu-devel@nongnu.org; Fri, 16 Sep 2022 10:30:21 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:41812)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.kanda@oracle.com>)
 id 1oZCMB-0001Jk-OL
 for qemu-devel@nongnu.org; Fri, 16 Sep 2022 10:30:20 -0400
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28GE3mKX010434;
 Fri, 16 Sep 2022 14:30:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2022-7-12;
 bh=luJ9R0+098Ek7IU33I7SpAW5PcRQSu4FSFXZEIRFaOk=;
 b=kHdydEzgc9GTrZDxy5pf+nkZzCUuu6VNUUnkkeSfZqv+j3L0pk6pjTDlkfusUPqGzvG/
 /TOR0RIVmE2VlgVr84adHEddC8SZl2qucSt67PSQpGdyTnLV/HKCrXsgp719uHF0RDrW
 L3p9HaWadJrI60VLeNcBg7s4MtwziNZJaqqO1HUY6Knd8MMGi/Ore/JkDfAX0HOsKBJq
 l52TcMfu630KrEy5JlaneN1jJWUtozi+2xirgL18D4+UgTDpmndKKxuWemuvlSLpkJz7
 gX1EfaylHcskNJw52HutzhMPjXH9W5sv3usvWzCFOVixXQMT4ceJNEDRFGZV53drttuj sg== 
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3jm8x8tmuk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 16 Sep 2022 14:30:05 +0000
Received: from pps.filterd
 (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 28GEQbTs024731; Fri, 16 Sep 2022 14:30:04 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2169.outbound.protection.outlook.com [104.47.59.169])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 3jm8xfcy6p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 16 Sep 2022 14:30:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WWZL7Q7KC+U9+PLJSq+67WaQPC+lHlyd5hubbiBBQHwGrArO9pHP0YVUMYIaABm2nVPFsftJSwbpXOjMY3MZcty1k2jKgpktzuCGwObcNElhZpflkUBzr5G2I6aZ0oqRbAb3e9NmPOLjtbpwfSQg/AFLNIGBUhZGmtWPU8YJ9KlhJiqqDAPbLPbSOt/9HCdLyG1e+PHTS/fgQ186YbCNiYwD29+CYReou4K5/lkIer2LAbzeR01G/umur30iyEcJGSZm0OYAOqi+qGqrz8JJbAh9lfe8cmNOVnZxx7zed2xztM/OAWyhuM84R/LYpXrPn/rFltsEIYuf77InFBCKsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=luJ9R0+098Ek7IU33I7SpAW5PcRQSu4FSFXZEIRFaOk=;
 b=LqKk29iRRded8pPVUwUUTDKnuGoj6wqOvK70d8UpC8UyksgxHu+bFKedRJf9/HyzDzrCKClxPN+OUZa6qzbgaATVMweoyYbQdM4jD4WUpas+7Q5I/U6zbIhrqCfmElZqaq2gm+0HoUpvHy7bV35Mo9HLd3kcjDfx5+8jMRXqv/Z4y9sQE5tQ2RsuX9x3y1/DkjUcJEhjz64mZwFPFGSZTuj4i1Kn8Xdbz4Jrv6YzDbi0QAZYGrmbZ7YShZuPqXynwq9erdouRLSyq42wkAOvtm3aiWPNiMp+/eFCHoJhqubA/YaWyqigLAc+hVfEGdrEDhjlTMX+NIgRJZNiJHBy2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=luJ9R0+098Ek7IU33I7SpAW5PcRQSu4FSFXZEIRFaOk=;
 b=G5Ivw7+R1EiX3GIlHC1x8BQgQYtckKjHqZQ9EBZCKvaO01LSl3lZIUSdES15iwT9hd4BlkXfH2j4RDqKusuROXBz2dxPaTi0CBlCUvKzXN+d19QMI5qPjMcf+ff5oHR5WlXXBj7N9OQVsR1+do8N5l+OPwK7HppGV829NnS6rko=
Received: from SA1PR10MB5841.namprd10.prod.outlook.com (2603:10b6:806:22b::16)
 by SA1PR10MB5685.namprd10.prod.outlook.com (2603:10b6:806:23d::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.22; Fri, 16 Sep
 2022 14:30:02 +0000
Received: from SA1PR10MB5841.namprd10.prod.outlook.com
 ([fe80::1d16:6604:de4a:50d3]) by SA1PR10MB5841.namprd10.prod.outlook.com
 ([fe80::1d16:6604:de4a:50d3%6]) with mapi id 15.20.5612.022; Fri, 16 Sep 2022
 14:30:02 +0000
Message-ID: <5b0b4d2d-058b-833e-a1ab-f77d0f8dad4a@oracle.com>
Date: Fri, 16 Sep 2022 09:29:59 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 22/27] qapi stats: Elide redundant has_FOO in generated C
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
Cc: michael.roth@amd.com, jsnow@redhat.com, eblake@redhat.com,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20220915204317.3766007-1-armbru@redhat.com>
 <20220915204317.3766007-23-armbru@redhat.com>
From: Mark Kanda <mark.kanda@oracle.com>
In-Reply-To: <20220915204317.3766007-23-armbru@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SN7P220CA0013.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:806:123::18) To SA1PR10MB5841.namprd10.prod.outlook.com
 (2603:10b6:806:22b::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR10MB5841:EE_|SA1PR10MB5685:EE_
X-MS-Office365-Filtering-Correlation-Id: 9523532c-b05f-4c48-6123-08da97eff0f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6umS4mIoAAjooQMM3/N0lkBSw2ZHe0ebGxvb54Ypij1zdEMBy1PL1ZrLAMjuNbkPIsLkruG+hoyDJxUub8SmRn3jIbhKXh2vofS5VS1pU8CDcMdrUIAYvm4nU2JjsE/fObbeGwvI3PdoUQGDjVS4azJTWmUTvDX4FKONQBdfibVsFr71ehtxznuk3l5nr5dk+6v7wlsB/BXzVLefThfbUE4+x87UvFErWlkBgNf+RbsoFIXARsrxirGSEhU90Mh3Lfv1CKM56KJKQYLzvCxn4pxIngZ4g7jlItyqh339R37apFTnXi9y5M1ygBR+sTUDu+eIQM+DbhI+P3NQ43tUfd7luv7Tfa2CVB5uHs/kWM2y3Zv10raF1PaDlCTYw483B5RehYYLXRq0Ser9f8DVAMO/IHeWhH3z7gj0stcU/pS8mDOjYdTshxpEu5VtlGCJVD55vaU3IP5V6UhynYiH2JVApivVl1mC6VnlPbT+2vMBGEHWy9R4OuvUVsg5/v1XzPJSiBsakO/bf2I/OJOPoa4/VICdnHRTi0AH/tTXFqAZy9soxUFvcnyWh7+2vkcyJUg3Pl3w1JO2WMARVnhgeeQMbwtzVzPySaA8L/JY8N2K0H2dzAofz5J7k3Mfsvu1OXSb+2IbNIqeAwUFjIiWd2uTRl7s3s5xrm93MuyA8qSc6HVwpkKecbzKcAeLyoSnwqUwOdZ+zJwc/HhVmeju220EW81F7cW+E8IXVzxhBk5jDVJZS6tsS5jAn5B6xGcPfNM+wn/Ee5+kNH4VuRYRiQlGEFs5REZvFqcUnW+waDc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR10MB5841.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(346002)(396003)(136003)(376002)(366004)(39860400002)(451199015)(31696002)(36756003)(316002)(6506007)(66556008)(41300700001)(5660300002)(8936002)(38100700002)(6666004)(2906002)(44832011)(66946007)(2616005)(8676002)(186003)(83380400001)(53546011)(6512007)(6486002)(4326008)(31686004)(26005)(478600001)(86362001)(66476007)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RlptUThzVVd2TWYrblQ4WHMrd0xXMTg4TEJJN3RIKy9mUjZaUUl1V09oekZQ?=
 =?utf-8?B?U0ZKQlc4UW1SaG9zMEFLS0g3WmpneGVBd2tCZlBvVUNGTnQvRkFpZ0pvREg2?=
 =?utf-8?B?cW05SmxmbCtCRms3a3MzWFN3MVNuOUx6dnZqelgyRmhlVmYzWFhlK3JXdVNx?=
 =?utf-8?B?OGROQkdGYndHT20xdUtHc0RCRTA1ck95SytHNlFKaWVkOTgxNXhNa1BGT2Iw?=
 =?utf-8?B?OWt3S0g3eFU1SmhVRzBHMFFMNDA5TndhajRub1h6ZGplT0YrZWRwR1R2WkVv?=
 =?utf-8?B?dHhpQThSZ1BDV2xJMmJQT1FLTHA3czRzTC9ZTFZ0MGNoK0VZcTBidXhFYWNn?=
 =?utf-8?B?Y0ZpTmZZZFpwZ2p0U0Q2YXlMd1pLMVJtUlJsYmt1Z0VOSHE4MjNsU2sxRC8w?=
 =?utf-8?B?ZEg1M0J5WG9YNElncERJN1lZWG4wbEFwd3dSck1pcHk2SjJ2U0hDN3BpMksx?=
 =?utf-8?B?WDRWWS9kdVlpTENRNHAwTmJBQ01jQnJ4RmNUWEtrYUFQaEd1bVdiZzYzMTNV?=
 =?utf-8?B?UDFaU1g3ZzRYOEw3T3pVQVh5NTZlVG9PYVZvNjIxOVdmSkVGYnNPdUQ5S3lu?=
 =?utf-8?B?SW91RmpoRXZFMDZDSGRncDZtME1SbDNUL1A5d0hLKzFnWDh1UUxqYldOTDRj?=
 =?utf-8?B?RXBGWHlKNlY3V0pjVVF6NW5qTTZXWFFqT0dhZjRFMUw3VHhXeTZVTTdTR00x?=
 =?utf-8?B?QUt4bmxyWEpHRDc1bUYvRzlpbjIwYzViOW1VUDVZelMyZ2NkVlZUamtwbVhw?=
 =?utf-8?B?emdCOUdhVDhoeEloWUg4QkJzZXkxNzVFbTl2VTRKQlVTWERPK291dW1zUmR0?=
 =?utf-8?B?UWVNZTZtUER3U2ZLRmh5bUVOMXBoaU5IUDRhaC9nQUhzOFZlaVpEZTl0Yk9r?=
 =?utf-8?B?RDZUa0Q3RFB6cy9ORlFPWU4zbUl1dEFTcWMxamNvcml0SWRmR1Z5T0djTEFN?=
 =?utf-8?B?RWpsWTNNNDk2SlFFVGVYZElUZ2trZDNTUlRIakJLeWVwb1Z6RXYvcHFPUHJt?=
 =?utf-8?B?T25pYzJ5T0d2OU1uNytrZU04YzJQWDNTcWY0MjAzWGlKeFJRK2lBd2dpUCtZ?=
 =?utf-8?B?OHdyUUhlLy9KengrYkpLNnY4NGtNd1YzeUZtY2tTR0kxRUNnbWx5QzR0eEFu?=
 =?utf-8?B?TlFlZC9UNzlRblE2MHBtMWdpOXFrNkYxTkQvUW5kdTMrV0c2SzJELzdZeUMy?=
 =?utf-8?B?ZmVnYXpmVWVuMHVobjVGQmhHa0JSc0VtTFpEbXY2bVA0RUZMUi9aNzNxM3hy?=
 =?utf-8?B?YUdGT2w5TzZWMmIyOXBiQ2JFQVE3STJMSStERjcyeitwaTQ5UHlMdW1TeVBY?=
 =?utf-8?B?djdqWVNFM2FLWDYwYW8vcEViczhQK0NBRDVlSks1RFlPS2Mvb3lUQi9YcGt1?=
 =?utf-8?B?cHVaRWt5Rkg3eDE4NFJLc0RweFNJZzBOZ3ZQRnZLOWJRemN6elYwdCs3Yk9z?=
 =?utf-8?B?ZnZpWmhhTjVuZWNuL2s5TEs2amd4TkZoZHo2SmlMQXhJY1p5QUtCbXJmTjNy?=
 =?utf-8?B?cDg3bHgvamhsaStUWTFaOFFQV3dZSGdocldadS9jTFJPNmZxMExGU2kzY2ZW?=
 =?utf-8?B?d1AvZ0NxMi9QdVloenVEUGZhNkhSakIvQ1pkeTgwYzR0bWZqTWYvL0tYbjZL?=
 =?utf-8?B?LzFOYUREbStTTG41Qm1oaC9DUjJ3c1pHelBNYVVXV3kvaUgxQ1p0SUxRWlVt?=
 =?utf-8?B?blJ5OTA3NjRzQzJhZWNtVzA3Wk9PU2ZnQXk5VEZUekZFSDhVOWFDenFYVm5y?=
 =?utf-8?B?TVZONEI0dis2YlJlL0svUnBFdFJmazdYd0g2Z0JzRlhVSnJ6QVNBbTNOcVg2?=
 =?utf-8?B?WmFHc2JxTjJPSDJJS1NnSVNCRWZhY0JqZWFMbHFwSHNTbnhQT0VYbWxYOVdZ?=
 =?utf-8?B?QzBST20vZkM4Vm5kQncxcWJhaEN6OXpQaHBvV0cxTHh5bXVqZGt2RWpSOTZN?=
 =?utf-8?B?Y1FPLzgyMDV2RTMwS3JzLytxVHV0d0tMR2g4VlZnQ0p4bTAzRWdMQnVuZ0VL?=
 =?utf-8?B?cjdXYUtnbjNlOXBRcGd5QTJJM21VM0ZjWnNZcE1Ed1plSFdIeFB5Ti9POG1W?=
 =?utf-8?B?RCt3OS8vQ01kNFNTNEJCeGVLMFdGVTQwcG9JR1RLMEhlaDloQ29NcFBQNXdG?=
 =?utf-8?Q?p1ubBa2Rd4SAthvOf04Pzwz+o?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9523532c-b05f-4c48-6123-08da97eff0f9
X-MS-Exchange-CrossTenant-AuthSource: SA1PR10MB5841.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2022 14:30:02.3449 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fED8pVoKW4BApWXTbeW7ueO/0Kpa8bzg9U8JJUazxC72oai8KKKu7RJpjxolKilEtRPjSVxmckes5wkeDaKwmA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB5685
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-16_08,2022-09-16_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 mlxscore=0 malwarescore=0
 mlxlogscore=999 suspectscore=0 spamscore=0 phishscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2209130000
 definitions=main-2209160107
X-Proofpoint-GUID: C_XHtLl0PjrSEJN2NXvut_UvOav9tGte
X-Proofpoint-ORIG-GUID: C_XHtLl0PjrSEJN2NXvut_UvOav9tGte
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=mark.kanda@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.816,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/15/2022 3:43 PM, Markus Armbruster wrote:
> The has_FOO for pointer-valued FOO are redundant, except for arrays.
> They are also a nuisance to work with.  Recent commit "qapi: Start to
> elide redundant has_FOO in generated C" provided the means to elide
> them step by step.  This is the step for qapi/stats.json.
>
> Said commit explains the transformation in more detail.  The invariant
> violations mentioned there do not occur here.
>
> Cc: Mark Kanda <mark.kanda@oracle.com>
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Signed-off-by: Markus Armbruster <armbru@redhat.com>

Reviewed-by:  Mark Kanda <mark.kanda@oracle.com>

Thanks/regards,
-Mark

> ---
>   monitor/qmp-cmds.c     | 5 +----
>   scripts/qapi/schema.py | 1 -
>   2 files changed, 1 insertion(+), 5 deletions(-)
>
> diff --git a/monitor/qmp-cmds.c b/monitor/qmp-cmds.c
> index 672fc5d1cc..21a21d6171 100644
> --- a/monitor/qmp-cmds.c
> +++ b/monitor/qmp-cmds.c
> @@ -560,10 +560,7 @@ void add_stats_entry(StatsResultList **stats_results, StatsProvider provider,
>       StatsResult *entry = g_new0(StatsResult, 1);
>   
>       entry->provider = provider;
> -    if (qom_path) {
> -        entry->has_qom_path = true;
> -        entry->qom_path = g_strdup(qom_path);
> -    }
> +    entry->qom_path = g_strdup(qom_path);
>       entry->stats = stats_list;
>   
>       QAPI_LIST_PREPEND(*stats_results, entry);
> diff --git a/scripts/qapi/schema.py b/scripts/qapi/schema.py
> index 3001b715d0..6f35e57fe2 100644
> --- a/scripts/qapi/schema.py
> +++ b/scripts/qapi/schema.py
> @@ -759,7 +759,6 @@ def need_has(self):
>           assert self.type
>           # Temporary hack to support dropping the has_FOO in reviewable chunks
>           opt_out = [
> -            'qapi/stats.json',
>               'qapi/tpm.json',
>               'qapi/transaction.json',
>               'qapi/ui.json',


