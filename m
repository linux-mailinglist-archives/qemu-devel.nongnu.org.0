Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AB2B532F96
	for <lists+qemu-devel@lfdr.de>; Tue, 24 May 2022 19:25:42 +0200 (CEST)
Received: from localhost ([::1]:37434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntYHs-0004bp-Qj
	for lists+qemu-devel@lfdr.de; Tue, 24 May 2022 13:25:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40912)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.kanda@oracle.com>)
 id 1ntYFQ-0003EZ-9p
 for qemu-devel@nongnu.org; Tue, 24 May 2022 13:23:08 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:56628)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.kanda@oracle.com>)
 id 1ntYFM-0006Jg-IV
 for qemu-devel@nongnu.org; Tue, 24 May 2022 13:23:07 -0400
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24OFPOlR001543;
 Tue, 24 May 2022 17:22:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=BPAlTHJ8VevCZOmiMqo7/Ph2NdPItskzzpCrzUtWRUc=;
 b=AMstFtqnNlkZBnZ4LF1fE1kcxqyVcqS55qD11TvWZ2h48oPrj5DTR0eDDazGmRdvNaXO
 oqulNXZ3tkVRVjROBJAqfCSnkLW3aT+2MXfplt981kjzwJibPRWdX+NFgRe8pL4cuEqC
 1g19MijHjHHPqH95XFiW3LvUENm/ufhd8agIj8YXjY2eQNn9n0swZL91vC3qsP1Y0QfP
 TZSMsLkjfQabQvhsrYvE00dLPmJ53ZRZF+v6Nj30A+rK0B7sRtt6T2f3m/VUslgKl//3
 tbThggOiQ+FOFMXtRqbJBf7WHpUtCuAo6dy+YoQTjSfscoYr2b3ppGqlJcio2ucvaBsS Ig== 
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3g6pgbq14x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 24 May 2022 17:22:57 +0000
Received: from pps.filterd
 (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 24OH6O8Z037492; Tue, 24 May 2022 17:22:57 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2173.outbound.protection.outlook.com [104.47.59.173])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id
 3g6ph2uqh8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 24 May 2022 17:22:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DYghKAVXz0B8CtWzoty1SfybWHQfrhmiNwrtON1ICTCqqLTER+mQsc3LEOGXjK7VWmS+4h/20Ll95emtstXps5cyZjHNfsaqM0DK2j7sqoAF3TeZy7efHnbNuT0PVGTAZkyp0G8GKYw5dyYogPF/ANc3isyl1K7hiqukZNKkzbwrNpl0uumCH5S0pigc6Nfnnrep3xy5NV9erjpvg7T6aRHpzD30ESsCTnVgm0DgGLwCMCpB30c8jmph62d+4kjctTQe30iwnJo27pluKQxcJXYpYOz186hiXWk/OjiIp3O+eIiICulX0z7uT2TLndrfebLoxdEewbOkt0zqh3TElg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BPAlTHJ8VevCZOmiMqo7/Ph2NdPItskzzpCrzUtWRUc=;
 b=KISFyvUTVyMNI9G0BJgtoG6wb5aNQmqKipU3jjqypwSOq2NPeofGuR+Mmgy5sajBWyjVkphpCljHGkLjh8wF/79Q3qOkdtw/cuI2kmfQ6j7b84kijmprEDvqBDJk7sSpnCXVz5YhWc4L0omstOW3Y63z2n4kF2VtISyjqkZUdtECG6Qb0lMu50GiFvkowfUp3Hi9HOznWG9aYi/P3z3tbj8undB8mlqY3H79okDmjPkxVBhLRqtK5r4PQGcybnB2U2a9q9Xy0KhU0u+KU3DjptT340ELXo4+SxQlnV0zyzBCprUjKIhMhwLV38fioS0nPyRc58j0xykxjr/GzmhWTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BPAlTHJ8VevCZOmiMqo7/Ph2NdPItskzzpCrzUtWRUc=;
 b=GHldIC/Cw9DwLt5dDoKZttDYbnjVfwVMWLdgOoLD9DEFCp0VxGVQUFpaVddM46pFuVo9L+1djjkS849R03uBjzXaCDX2ORE1TeZY0VUqJq7PnmXNjHq5ztwHYrK2aV9C4LkTG4tkK7+giTgsCOb8PpaDOo/I5c+YtVaV6dXPyrg=
Received: from SA1PR10MB5841.namprd10.prod.outlook.com (2603:10b6:806:22b::16)
 by DS7PR10MB5165.namprd10.prod.outlook.com (2603:10b6:5:297::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.13; Tue, 24 May
 2022 17:22:55 +0000
Received: from SA1PR10MB5841.namprd10.prod.outlook.com
 ([fe80::6828:e7e9:132b:9366]) by SA1PR10MB5841.namprd10.prod.outlook.com
 ([fe80::6828:e7e9:132b:9366%7]) with mapi id 15.20.5250.015; Tue, 24 May 2022
 17:22:55 +0000
Message-ID: <16cb586f-a8ce-0ae0-1a8f-48bbe69e2699@oracle.com>
Date: Tue, 24 May 2022 12:22:52 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH 4/8] hmp: add basic "info stats" implementation
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Cc: armbru@redhat.com
References: <20220523150509.349412-1-pbonzini@redhat.com>
 <20220523150722.349700-1-pbonzini@redhat.com>
 <20220523150722.349700-4-pbonzini@redhat.com>
From: Mark Kanda <mark.kanda@oracle.com>
In-Reply-To: <20220523150722.349700-4-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN7PR04CA0177.namprd04.prod.outlook.com
 (2603:10b6:806:125::32) To SA1PR10MB5841.namprd10.prod.outlook.com
 (2603:10b6:806:22b::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: df03f593-165b-48e9-9e2b-08da3daa098f
X-MS-TrafficTypeDiagnostic: DS7PR10MB5165:EE_
X-Microsoft-Antispam-PRVS: <DS7PR10MB51655577608FE5CFBA10E79AF9D79@DS7PR10MB5165.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Qx8ONDUm0Zj7XYuJGGU++Qac8PKx64fAmbnmC94uftS6sigoh1xMQq0zUqmeeOL+TUOW5StxBhZI4BRqYOYG9Ji8H+EpSQ/rh4HBvYNXDAPOFUNI/Pb4rHFHms7WOEZpBB2OTA6hCdSkwYdqM6RS3MQS01nq6gXvy9951vSZ0dnEwqETWmSKciykShehNKtFcO6JrLKDkIufiKrj8rsK05e9xPksdiEp2pZusurY1HD8GPaQaWQhZgFK0Y61N3ix4gBluctUfvVbFJfmQiQ8CrGLD4gTMTH1LWA5nauac8KOQ3/mObPzikmchpTujA2yO+G9YzTfqvmlP0TZp4EJEMYggi2gFgL3MBp8XG2A0M3a6oAxwjYYV90BhrydTwfQDz6+owD75fvup0R6Xu5ED8Ctqw5B5L6M+1E3um6gFOB+9ZKYnXQOZqVpK0NT/s65NbeMoofIiHH3N2qJ5OKhIjj2nlT79dJOhI4kRM3DzHjYvFEf6PGKTIjC/DMlhxDHG6PIyQ6yratSzOhVpZ+DQm7yOF9/QSf1QUT7TYdaBBmS9qZOMb8XglGxckuYSLgrkrvB9N4Sg8RS9SGprjKxGA8M4PIgPqnJnS//I/l/yyXP7Kn7R33cdGKH1veHhKwQcjOQZzx0bDozMqreZda389tl2Wluu1pt2L1nRy+vfCBjblWtdRC0L7GVSHfSOjaJQp750dzfI2GYs4mobzSu/NmOywjVrHlVevDbDriiFDo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR10MB5841.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(5660300002)(508600001)(6666004)(6486002)(2906002)(8936002)(36756003)(186003)(31686004)(26005)(6506007)(31696002)(86362001)(316002)(53546011)(44832011)(6512007)(2616005)(66946007)(8676002)(66556008)(4326008)(66476007)(38100700002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dGV3S1MwQldwcTg3Y0dGYW0xanpEbWpwZjlYcGw3K0F0N0p4Y2hkS0VuYjRn?=
 =?utf-8?B?OUFHSHJrRTRnK0M2VEQyUmd0TWtWYzhzcllKUkYyUEpPR3A2aW5EUHhVbEJS?=
 =?utf-8?B?cUhxZS9wYll6dlRwdW5FNGQ4YXBBcDAzak1LZFlsdndBR1ZzWGNrUkRtSlBC?=
 =?utf-8?B?alRVc24wdmRUMDhkUWk3MnNVRkdRcG5iMEY0MjI0eG9hbzE0OUlxUVJoOHNH?=
 =?utf-8?B?S1dKSUYyb3laZlpBWU1scjREVkVUNXF0eFZIY3d3ZlRNazJNaHRKOGZHWmZu?=
 =?utf-8?B?ejdlbTVoT05sbzIxcS8yUThxclFuZ1Vobkc2dk9hWDl6cXl2OWU5OU9wMmIy?=
 =?utf-8?B?RmZDREh4TDZZMWo3MXBFWWFjaVpaaEFuWXpqb052dVFqZ2NHSk8vRlZ5alhq?=
 =?utf-8?B?NHVRZlp5ZG1qOEttWndiWXpYQU5HWUdaVVNqMVh5N09kcGw4eVVqUFl1UGp4?=
 =?utf-8?B?NkEvaHhmNUp3ZUpVcnI4R1g4di9mdzJWcXJLWGVHOWowL2ZucTdQMDgwYkVZ?=
 =?utf-8?B?WXo0RHlqNzEycjJkMkRBeHpEYTFsY29RZm9lVjdWdG95NVR6VS9VUFF0V0pa?=
 =?utf-8?B?M1N2RlJLTVJiMStqTW9scWpPcTBlb1dGT1I5dkNEc0V3dHlWQkRnWGZaOVhY?=
 =?utf-8?B?OStpZ1dVVmkzMndteTF5NnFVeWkyM2ZyMFBRYzkrT080NzJFV3kxbXJ3cUcr?=
 =?utf-8?B?Y3VDNkFnd3c2akQxYWZXOWhPaXFuUGVVRGttcFRMdVZIWXl2QWtrYWhPSFA5?=
 =?utf-8?B?eVg3MlRDMGk3Zzh0eUVrZDJ1UC9YN205d2ZOMVlrQkRKWG5oeW1IelBsM2px?=
 =?utf-8?B?RkFmNUFBTDJXd2ZVUUdYZ3RDWGRlL1d6TGlOY0FKenNnZ3hHeUk4dDdEMitv?=
 =?utf-8?B?SFdhN3JHdWpHZ05GSWt2NC9qQURVVGNCREdtMzdSK0dSMThQbW9IQzYwOWZj?=
 =?utf-8?B?LzRNUGlIcWZOMzU4REdWQkZxSmFVdFpyeWMwK0hLbEh4ZENSeDVvTW5CRmEv?=
 =?utf-8?B?M0pnbm5jcUMyakFoa2UzRVpRVFQ0OGt3aG1PTlA5YTlWQ2kvU3VwQTYxbThP?=
 =?utf-8?B?ZktZbFRpb3VTbU1PRHVWQTVqM2VPS2U1bWhYTUNLZy85Mldtako4Y3ZmUTky?=
 =?utf-8?B?V3lWSUxHRHRGbFpZZUFTb0FlWkZHRWRrZlZtajJleUZHeEpjaUVoMWZWZ1l1?=
 =?utf-8?B?RjlrQXV5TTM4LzEyVUowV1U2VWRrQmRzMFBpUld4MXd0UnNrWi8rQkd6Qjl0?=
 =?utf-8?B?STFtcGRLdHhTdE5JOEdNRjdrZzdvTnJsV2FEZmxRblgwenlNYWhlOVNmdEZQ?=
 =?utf-8?B?Q0gvekxKblV2aHlwWTNoejFxZDZqVGhiaWR6TFdRZHVQVlNJQTRScGhrNXZX?=
 =?utf-8?B?UzUwY2FIdlZKRWI4dkFueFhPQUk4UkdtVEtnU0dBc0lEM1pWcHR3VzhZV242?=
 =?utf-8?B?S1c4VzZpaW0zcm1iNFV5THVzc0RoeElxWFgrYlR3YmF1RGdGU0hHMXM0d0gr?=
 =?utf-8?B?V3hSeUdvTFBvV0diRU4rTC9tNHR2Q09qRlA3Sko4akQxNWlzcTltQ1lJT1I1?=
 =?utf-8?B?UldoZlpSQ1ZEV3ZVMkN6WStOeU1yb0RkTDk3R0NUUVhJcWN4MzBWT0NSZVcv?=
 =?utf-8?B?KzhpOGxvSjhMMGtZTVAvRjF3VzRLa3BTTEZOZ2R1RzFJVzVJL0t2TWR6YllU?=
 =?utf-8?B?Nm5aOStLQmlYemZEaXdCUUZxQ3pjSU5XcU1sNGNSaDRMM1MvaGJtVHJQMUgy?=
 =?utf-8?B?R3poYk9sZW1zMHNXZ2pWRVIvVzdLZlJyTis2YXJMU1V6eTdKWjhuNHdQTFZw?=
 =?utf-8?B?SllCNTh3OHVCdTJ4dHRjR0pmNVJmZXE1SDd4M003L3FBbmlTa0tsUVhIWktC?=
 =?utf-8?B?NC8vcittYVM2UDNaaFF6R0ZNcEVaR1duaHRNRWZMd0htNG5hc2Y5WGErT1JB?=
 =?utf-8?B?UHNZOXZSRVBQaUJabjdOWlI4QWhlTTNhVSt3Q0E4QmdEcEtqTU9oNEx5Wmpz?=
 =?utf-8?B?S1ZjN2FnK3E1elBJV1B3L3R6YkhKL1EvKzFkREExWnpURHlDNnNHdVpvZjRK?=
 =?utf-8?B?NGg5dkwweW5GcHpOSmJ0VS9qc1NJdGtxRTk5Y0ZQbWJqZDBBQ1pJWFVKMmtB?=
 =?utf-8?B?T3hYRjlPY2hZQm1mbnZNdTFlTTdzM1ltS3ZVUzBhcnRYZ2lnMzloNXl4RUp4?=
 =?utf-8?B?WHRNaEFBS1d0UHQzdHRiaHJQaUhOT0l5NXozVzUwU09UZHhGNkZFUUYza3Z3?=
 =?utf-8?B?TWNZUlhodFhIVlVCSmJYcDluSXQvS0k2cS93NkpPMlIrQ1dHTVVxWEdmT2Nw?=
 =?utf-8?B?RTdMR3V4QkhuN255NGN6RmlpSVkvK0tTaWVRbEVUazIzeGRhTlp2dz09?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: df03f593-165b-48e9-9e2b-08da3daa098f
X-MS-Exchange-CrossTenant-AuthSource: SA1PR10MB5841.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2022 17:22:55.1736 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TNWRxMI4GvgtqgsIrJH9nIt7pNqHNY3tg1ZJ/wfx7m7XeSUZPTvGOqOQIdNnnOB2mnbuzmulxbGegUgePFBs/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB5165
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.486, 18.0.874
 definitions=2022-05-24_06:2022-05-23,
 2022-05-24 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 spamscore=0 mlxscore=0
 phishscore=0 mlxlogscore=999 adultscore=0 malwarescore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2205240087
X-Proofpoint-ORIG-GUID: TRqElK9qmpiuPevfIFI17h0O6G8xqE6P
X-Proofpoint-GUID: TRqElK9qmpiuPevfIFI17h0O6G8xqE6P
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=mark.kanda@oracle.com; helo=mx0b-00069f02.pphosted.com
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

On 5/23/2022 10:07 AM, Paolo Bonzini wrote:
> From: Mark Kanda <mark.kanda@oracle.com>
>
> Add an HMP command to retrieve statistics collected at run-time.
> The command will retrieve and print either all VM-level statistics,
> or all vCPU-level statistics for the currently selected CPU.
>
As I'm credited as the 'poster' (thank you Paolo), I assume this should be added:

Signed-off-by: Mark Kanda <mark.kanda@oracle.com>

Thanks/regards,
-Mark

> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>   hmp-commands-info.hx  |  13 +++
>   include/monitor/hmp.h |   1 +
>   monitor/hmp-cmds.c    | 187 ++++++++++++++++++++++++++++++++++++++++++
>   3 files changed, 201 insertions(+)
>
> diff --git a/hmp-commands-info.hx b/hmp-commands-info.hx
> index adfa085a9b..221feab8c0 100644
> --- a/hmp-commands-info.hx
> +++ b/hmp-commands-info.hx
> @@ -894,3 +894,16 @@ SRST
>     ``info via``
>       Show guest mos6522 VIA devices.
>   ERST
> +
> +    {
> +        .name       = "stats",
> +        .args_type  = "target:s",
> +        .params     = "target",
> +        .help       = "show statistics; target is either vm or vcpu",
> +        .cmd        = hmp_info_stats,
> +    },
> +
> +SRST
> +  ``stats``
> +    Show runtime-collected statistics
> +ERST
> diff --git a/include/monitor/hmp.h b/include/monitor/hmp.h
> index 96d014826a..2e89a97bd6 100644
> --- a/include/monitor/hmp.h
> +++ b/include/monitor/hmp.h
> @@ -133,5 +133,6 @@ void hmp_info_dirty_rate(Monitor *mon, const QDict *qdict);
>   void hmp_calc_dirty_rate(Monitor *mon, const QDict *qdict);
>   void hmp_human_readable_text_helper(Monitor *mon,
>                                       HumanReadableText *(*qmp_handler)(Error **));
> +void hmp_info_stats(Monitor *mon, const QDict *qdict);
>   
>   #endif
> diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
> index 622c783c32..c0cb440902 100644
> --- a/monitor/hmp-cmds.c
> +++ b/monitor/hmp-cmds.c
> @@ -40,6 +40,7 @@
>   #include "qapi/qapi-commands-pci.h"
>   #include "qapi/qapi-commands-rocker.h"
>   #include "qapi/qapi-commands-run-state.h"
> +#include "qapi/qapi-commands-stats.h"
>   #include "qapi/qapi-commands-tpm.h"
>   #include "qapi/qapi-commands-ui.h"
>   #include "qapi/qapi-visit-net.h"
> @@ -52,6 +53,7 @@
>   #include "ui/console.h"
>   #include "qemu/cutils.h"
>   #include "qemu/error-report.h"
> +#include "hw/core/cpu.h"
>   #include "hw/intc/intc.h"
>   #include "migration/snapshot.h"
>   #include "migration/misc.h"
> @@ -2239,3 +2241,188 @@ void hmp_info_memory_size_summary(Monitor *mon, const QDict *qdict)
>       }
>       hmp_handle_error(mon, err);
>   }
> +
> +static void print_stats_schema_value(Monitor *mon, StatsSchemaValue *value)
> +{
> +    const char *prefix = "";
> +    monitor_printf(mon, "    %s (%s", value->name, StatsType_str(value->type));
> +
> +    if (value->has_unit && value->unit == STATS_UNIT_SECONDS &&
> +        (value->exponent == 0 || value->base == 10) &&
> +        value->exponent >= -9 && value->exponent <= 0 &&
> +        value->exponent % 3 == 0) {
> +
> +        static const char *si_prefix[] = { "", "milli", "micro", "nano" };
> +        prefix = si_prefix[value->exponent / -3];
> +
> +    } else if (value->has_unit && value->unit == STATS_UNIT_BYTES &&
> +               (value->exponent == 0 || value->base == 2) &&
> +               value->exponent >= 0 && value->exponent <= 40 &&
> +               value->exponent % 10 == 0) {
> +
> +        static const char *si_prefix[] = {
> +            "", "kilo", "mega", "giga", "tera" };
> +        prefix = si_prefix[value->exponent / 10];
> +
> +    } else if (value->exponent) {
> +        /* Print the base and exponent as "x <base>^<exp>" */
> +        monitor_printf(mon, ", * %d^%d", value->base,
> +                       value->exponent);
> +    }
> +
> +    if (value->has_unit) {
> +        monitor_printf(mon, " %s%s", prefix, StatsUnit_str(value->unit));
> +    }
> +
> +    /* Print bucket size for linear histograms */
> +    if (value->type == STATS_TYPE_LINEAR_HISTOGRAM && value->has_bucket_size) {
> +        monitor_printf(mon, ", bucket size=%d", value->bucket_size);
> +    }
> +    monitor_printf(mon, ")");
> +}
> +
> +static StatsSchemaValueList *find_schema_value_list(
> +    StatsSchemaList *list, StatsProvider provider,
> +    StatsTarget target)
> +{
> +    StatsSchemaList *node;
> +
> +    for (node = list; node; node = node->next) {
> +        if (node->value->provider == provider &&
> +            node->value->target == target) {
> +            return node->value->stats;
> +        }
> +    }
> +    return NULL;
> +}
> +
> +static void print_stats_results(Monitor *mon, StatsTarget target,
> +                                StatsResult *result,
> +                                StatsSchemaList *schema)
> +{
> +    /* Find provider schema */
> +    StatsSchemaValueList *schema_value_list =
> +        find_schema_value_list(schema, result->provider, target);
> +    StatsList *stats_list;
> +
> +    if (!schema_value_list) {
> +        monitor_printf(mon, "failed to find schema list for %s\n",
> +                       StatsProvider_str(result->provider));
> +        return;
> +    }
> +
> +    monitor_printf(mon, "provider: %s\n",
> +                   StatsProvider_str(result->provider));
> +
> +    for (stats_list = result->stats; stats_list;
> +             stats_list = stats_list->next,
> +             schema_value_list = schema_value_list->next) {
> +
> +        Stats *stats = stats_list->value;
> +        StatsValue *stats_value = stats->value;
> +        StatsSchemaValue *schema_value = schema_value_list->value;
> +
> +        /* Find schema entry */
> +        while (!g_str_equal(stats->name, schema_value->name)) {
> +            if (!schema_value_list->next) {
> +                monitor_printf(mon, "failed to find schema entry for %s\n",
> +                               stats->name);
> +                return;
> +            }
> +            schema_value_list = schema_value_list->next;
> +            schema_value = schema_value_list->value;
> +        }
> +
> +        print_stats_schema_value(mon, schema_value);
> +
> +        if (stats_value->type == QTYPE_QNUM) {
> +            monitor_printf(mon, ": %" PRId64 "\n", stats_value->u.scalar);
> +        } else if (stats_value->type == QTYPE_QLIST) {
> +            uint64List *list;
> +            int i;
> +
> +            monitor_printf(mon, ": ");
> +            for (list = stats_value->u.list, i = 1;
> +                 list;
> +                 list = list->next, i++) {
> +                monitor_printf(mon, "[%d]=%" PRId64 " ", i, list->value);
> +            }
> +            monitor_printf(mon, "\n");
> +        }
> +    }
> +}
> +
> +/* Create the StatsFilter that is needed for an "info stats" invocation.  */
> +static StatsFilter *stats_filter(StatsTarget target, int cpu_index)
> +{
> +    StatsFilter *filter = g_malloc0(sizeof(*filter));
> +
> +    filter->target = target;
> +    switch (target) {
> +    case STATS_TARGET_VM:
> +        break;
> +    case STATS_TARGET_VCPU:
> +    {
> +        strList *vcpu_list = NULL;
> +        CPUState *cpu = qemu_get_cpu(cpu_index);
> +        char *canonical_path = object_get_canonical_path(OBJECT(cpu));
> +
> +        QAPI_LIST_PREPEND(vcpu_list, canonical_path);
> +        filter->u.vcpu.has_vcpus = true;
> +        filter->u.vcpu.vcpus = vcpu_list;
> +        break;
> +    }
> +    default:
> +        break;
> +    }
> +    return filter;
> +}
> +
> +void hmp_info_stats(Monitor *mon, const QDict *qdict)
> +{
> +    const char *target_str = qdict_get_str(qdict, "target");
> +    StatsTarget target;
> +    Error *err = NULL;
> +    g_autoptr(StatsSchemaList) schema = NULL;
> +    g_autoptr(StatsResultList) stats = NULL;
> +    g_autoptr(StatsFilter) filter = NULL;
> +    StatsResultList *entry;
> +
> +    target = qapi_enum_parse(&StatsTarget_lookup, target_str, -1, &err);
> +    if (err) {
> +        monitor_printf(mon, "invalid stats target %s\n", target_str);
> +        goto exit_no_print;
> +    }
> +
> +    schema = qmp_query_stats_schemas(&err);
> +    if (err) {
> +        goto exit;
> +    }
> +
> +    switch (target) {
> +    case STATS_TARGET_VM:
> +        filter = stats_filter(target, -1);
> +        break;
> +    case STATS_TARGET_VCPU: {}
> +        int cpu_index = monitor_get_cpu_index(mon);
> +        filter = stats_filter(target, cpu_index);
> +        break;
> +    default:
> +        abort();
> +    }
> +
> +    stats = qmp_query_stats(filter, &err);
> +    if (err) {
> +        goto exit;
> +    }
> +    for (entry = stats; entry; entry = entry->next) {
> +        print_stats_results(mon, target, entry->value, schema);
> +    }
> +
> +exit:
> +    if (err) {
> +        monitor_printf(mon, "%s\n", error_get_pretty(err));
> +    }
> +exit_no_print:
> +    error_free(err);
> +}


