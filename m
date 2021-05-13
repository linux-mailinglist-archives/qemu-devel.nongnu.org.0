Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0026637FEEA
	for <lists+qemu-devel@lfdr.de>; Thu, 13 May 2021 22:23:11 +0200 (CEST)
Received: from localhost ([::1]:53958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhHrT-0005KR-1q
	for lists+qemu-devel@lfdr.de; Thu, 13 May 2021 16:23:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58620)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1lhHpJ-0002Yw-Rr
 for qemu-devel@nongnu.org; Thu, 13 May 2021 16:20:58 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:41136)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1lhHpH-0000vS-SY
 for qemu-devel@nongnu.org; Thu, 13 May 2021 16:20:57 -0400
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14DKIGmp027484; Thu, 13 May 2021 20:20:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=ODpnA+5kUd+ami2rjlTOjNE6h6RMmsulKQyqjoVC2jc=;
 b=QZ4+ZPKOXYhwul8eUbVBTrd5nfE7jR54w3keaYzvPtGcPvd+FiOf0fg53JY+76qeIVru
 SDQjmzkknzBWumTtOEZyJcQsolDVuPgdgu9mQGLhL4qp8R2VdQ4Mb9QLhphuEflpotEU
 5r4q4GzhEWkcE5QFdv+1+1Px8mNOK+QPGuWE0qYQgQGIXZDmNQZze48Kc7CSGF1o3sjB
 ChblLJqwruLI+RLfBHmkWzHSJvwjmUzN1L5KZdMrbHCu7IUKdKzKxPMJK6iHKmmCTr1F
 TQSWsvgLy1r7LgN0DYN05esL/vugv0Ic6tXrm7FfGQrUqBNak9b22b+BY7cm1en9QwAV gg== 
Received: from oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 38gpphrdnr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 13 May 2021 20:20:53 +0000
Received: from aserp3030.oracle.com (aserp3030.oracle.com [127.0.0.1])
 by pps.podrdrct (8.16.0.36/8.16.0.36) with SMTP id 14DKIlIK074961;
 Thu, 13 May 2021 20:20:52 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2175.outbound.protection.outlook.com [104.47.59.175])
 by aserp3030.oracle.com with ESMTP id 38gpppfape-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 13 May 2021 20:20:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XjBif4XhV1u2c1eYzsD4cACaRDCkkjsN0yMq6rG+E/w8Wn55/nDNS2WEHIWsUXfWuDCzNw/SDSHcUo/Xm6P2GM8KxLQ4TZmxmkwSzkgKZ82cloE+rB6jmCSr4o7ZN2TBAucXNOz4dWiEZtu9bFs9o3wcSfp77Y7GtjIssdMJ8i7wLC4IzwsWyysU+STmTjPSq8tpPCLej7vcBMNnFuzpxxROjA39SY6bNQXR09JhxjWQtbXrhOJ7WQPa0ZoGyX2qJyyKsTx/gqU9O5TsnPRt09Q2AhAI7w7q/sFerWyZOAlFbMgp+HL1Z7ZFc7cOK0MmjS3CsMW+Ke5mzecwiZJymw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ODpnA+5kUd+ami2rjlTOjNE6h6RMmsulKQyqjoVC2jc=;
 b=TSW6BEmkoDmnuoMe+xjefy5nKLOQe8rfZV05HqKAwqD8VPdh5ip6qufwrn90eDJRjlOAgT8Guc0IkOAM3hXUecOUhG2PeEeygotSzBOOG1OCUA4vs9k3efvtXwCurXUb3wmetvokb/bWgsqkzHng8WiHeY8k68BNzGxXy/gavwADX4yxrQVf1RnNF46owL5SSW/vgksym2u+o8PB5eVkW2Zff5hXQX/lGzblkBgfd+ezeqb1YWbH3ejc8DsLvMc6LmlTssTgekUGVMsX4zjLbcplrsWOrus+p+w4FS7y1lD+hfleR5WLbNIVeS/48ZbAzN8Ojgwp+QhqR3SqPauH4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ODpnA+5kUd+ami2rjlTOjNE6h6RMmsulKQyqjoVC2jc=;
 b=0BCEuefPKJHpXzh/zVq20iwCzxB/cfq0RHRl+7nf8n9Da1VnGcB4LtVPpxHl/vJLbS6430SNdRlL9ybDSbANR9bYks3kIgq3zIaZ6HMGEkRyju/5SFB8ReubXuzm/p0uu8sb0T9RU51g737FZLpX/ZjTh5sMl9Zy9OgSHAFh8LQ=
Authentication-Results: oracle.com; dkim=none (message not signed)
 header.d=none;oracle.com; dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB3240.namprd10.prod.outlook.com (2603:10b6:a03:155::17)
 by BYAPR10MB2888.namprd10.prod.outlook.com (2603:10b6:a03:88::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.25; Thu, 13 May
 2021 20:20:50 +0000
Received: from BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::6ce3:f0a3:c303:f851]) by BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::6ce3:f0a3:c303:f851%7]) with mapi id 15.20.4108.031; Thu, 13 May 2021
 20:20:50 +0000
Subject: Re: [PATCH V3 06/22] vl: add helper to request re-exec
To: Stefan Hajnoczi <stefanha@redhat.com>
References: <1620390320-301716-1-git-send-email-steven.sistare@oracle.com>
 <1620390320-301716-7-git-send-email-steven.sistare@oracle.com>
 <YJwCD4flWBGOkSGW@stefanha-x1.localdomain>
From: Steven Sistare <steven.sistare@oracle.com>
Organization: Oracle Corporation
Message-ID: <2ae5fe17-cb16-abba-fee7-ffa1b79ebeb1@oracle.com>
Date: Thu, 13 May 2021 16:20:45 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
In-Reply-To: <YJwCD4flWBGOkSGW@stefanha-x1.localdomain>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [24.62.106.7]
X-ClientProxiedBy: SN7PR04CA0093.namprd04.prod.outlook.com
 (2603:10b6:806:122::8) To BYAPR10MB3240.namprd10.prod.outlook.com
 (2603:10b6:a03:155::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.92] (24.62.106.7) by
 SN7PR04CA0093.namprd04.prod.outlook.com (2603:10b6:806:122::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4108.25 via Frontend Transport; Thu, 13 May 2021 20:20:47 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f74814f4-67d6-4284-1a5b-08d9164c9947
X-MS-TrafficTypeDiagnostic: BYAPR10MB2888:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR10MB28883B372D0BB71A34B662D7F9519@BYAPR10MB2888.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2887;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: I36zXke859NQKCC0Z6gC6VXm5F8LD1P7zafDEwTpe6WSGA4xPags1qsBYAzBgdaemRYbCCXBccNQE5/W+zVyQ22bpF9pJ82p8qaGlEeuEAXdmAgtLjPBRTKbfHOPGet8kQ0pheTd0d/MfB6qAkdUAuG/9B3mMICSSB+3tO49HLf+HW5TiN4HK8pIMi5Mso8F+Mc2RtUEbMBUJowVx7SnYZ4eH71OwbyEcqiRaQ9WUt6R+WEtxH5JjA0onVevERwxoZN5NI06PCm1p3ZEDvtn1dtJzKxxkC7x2DpjCoR2rDmEifT8OQdsvy53vbyhxV2K2+UP62DDS9huoSMh9A3OZbFKUp4RhhhHuQ5JLWJ7H9KFFUZb7e/dTpwZ0nquvSxH2c9uTipFoisfS706kqal3ar+NZ69rBx23PoI+Lrk7HHxldhJ/EKvorHPrCyOJLk9424RvdZmVWUP6anpPvuMUZbmiqPUOOt8MAa7G2LcW2Xsa6OyHPJd+iv6VqzYBHQIx9Rvni3AIOOfXMYbRxaRvU6x0xgKi5sCkOMk1BZTi9qSTcapVtIAMcwE36PRP2u9aMzO8VilNtZs914+Rb5KxnPPPA3sH6wH7vavDPyxea35gcrFUEzfnaNt3mK5YKQWBiZwwv56kxav6mtiZVeH8j/sRmAKnBwmsia3DcYqfKCAAG8iL+to64XmfnE9KK7f
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3240.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(396003)(376002)(346002)(136003)(39860400002)(366004)(36756003)(31696002)(36916002)(38100700002)(4744005)(26005)(6916009)(6486002)(478600001)(107886003)(86362001)(8936002)(4326008)(31686004)(8676002)(83380400001)(2906002)(16526019)(186003)(54906003)(7416002)(66476007)(66556008)(53546011)(66946007)(5660300002)(44832011)(2616005)(956004)(16576012)(316002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?Windows-1252?Q?EWjOod0hlsyTZpiEZ9xSsZISjkpqqUSQFwB7KfSm9rGTeYYa2SYLJewI?=
 =?Windows-1252?Q?y/PBifDEh2noMjaJ+m2uFdos8j+eOXV4rG27ELtSriPyJUDoPgQzLUGq?=
 =?Windows-1252?Q?bFup/D7bcyemKUVqa4Ljkk+GSFoe28bh628OwfeVafH+SaPXbEWZXvbI?=
 =?Windows-1252?Q?IdRqvi5ytdY3SKvJpnWLUbT2kbW4R35/halQK2M/nAhHFyo7WISgje2Q?=
 =?Windows-1252?Q?QlGQQ01VH57qaLdcPcCgsFpg/np6flBjd0CYX/j16FmWg/YAF4dzyCQj?=
 =?Windows-1252?Q?w15vYYy4tU0s6AieUWteEzc4+66QETfWBCAvXSpycKNtrtq4KydKetXm?=
 =?Windows-1252?Q?1VlckOcNRSrB3T/9T988k/1j5d34e+Qn2V9FjpV/l8TmfYvJH9hTUbps?=
 =?Windows-1252?Q?IBQyRLnDry4sJjlPqP9ECNAjJbkRLE0k3UhcYxA/foty1fPTJw6rqg5V?=
 =?Windows-1252?Q?erOr8+lP8OZGWIipyYiNDRK2fbRxXQX1JuzDV71NORmryNzG2c91QhkE?=
 =?Windows-1252?Q?b1ZYWQNunsT07x/uYt6x/AAho4Dze6CB4FJcshUWpvuIH6jQxga1ORjb?=
 =?Windows-1252?Q?jAyt3TFC4k1qScyC0LH81vjuJCG19rkPFQrKexE7xBHcHjqhwZDyv4un?=
 =?Windows-1252?Q?0pAfizKBR9klf+Ss8YmrCQ2YDWgqNw69RTpsq8qbLzZOdvEFnDukYZuJ?=
 =?Windows-1252?Q?mIUddGVswYfoyTcgZBxAJGj3gTnfHMtjrz7yzkBrYtHSs9ngU/BrlPPa?=
 =?Windows-1252?Q?CkRdX+YIa1ynowo0E+JnB5JWRpzr4iSiqwQbzaYRL9BUYwAETnXurHwQ?=
 =?Windows-1252?Q?Et0K8K/xMxk/ux3V8MQ1cVHMKi66RUJDVt0cCbERErAzFWt/T3H5gtJQ?=
 =?Windows-1252?Q?Ni8cOY+T/9u4vDfuGlIROrD1duMjCHGJE+GXNXyYp4bpv3zKlVrZOpbQ?=
 =?Windows-1252?Q?kRU8hOiiczWjNcMVfvA9f+vSToFafQS/gje1/xUU13nlCT4o68Tn4u1d?=
 =?Windows-1252?Q?tEhEzb8tq1ZUKat263jvW4Ozm4npMti85vo7d+cD4DkjTEj6YH2bH/cu?=
 =?Windows-1252?Q?AMXiuZivOlJvXxsWrchcvGHMiJ5XEUZ8b/f2JvFKoYycTvcfhJIvAPt8?=
 =?Windows-1252?Q?YNGFFuUjVRS5sKBXHIFZ+ytYMJ4Y1U5TeDr0A9JPji2D8WDpyIeD0Uu5?=
 =?Windows-1252?Q?8DDoej4mWg2eJX7nCHe2BMjg/ZGqXaK1x0y510CHtuKD5g5cxFTR/+hL?=
 =?Windows-1252?Q?yswKERXFFGyTg5Ei73y+lnsNa5jAMuCFNRa5Bq4aax7Tj4hUAlDbc2+T?=
 =?Windows-1252?Q?IlV3UoWUlgdF+EMPmaHL8542TKRc1zg5971UtIrvghZpudXA7WXUcgn5?=
 =?Windows-1252?Q?nLgjMlmzeg3y/EOPV0kkiiToA7XfF2GgEqrPZ5oUN7/gOZ8wcKEWzvGy?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f74814f4-67d6-4284-1a5b-08d9164c9947
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3240.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2021 20:20:49.9632 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T4VlN+dGSEOJSGKXy48oXgGFbDunj11pKPOGu5ZWZwKALDHEud2dNu2bqqMhjNI4GxRP7tlKyvpIvY+gSQjcYwyKbCj3eLrgiYOrC9bt8eI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR10MB2888
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9983
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 spamscore=0
 phishscore=0 suspectscore=0 malwarescore=0 bulkscore=0 adultscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2105130143
X-Proofpoint-ORIG-GUID: lpDedaExIZ3O_WtpnIzUr3dKSbVw9iYm
X-Proofpoint-GUID: lpDedaExIZ3O_WtpnIzUr3dKSbVw9iYm
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=steven.sistare@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: "Daniel P. Berrange" <berrange@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Zeng <jason.zeng@linux.intel.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/12/2021 12:27 PM, Stefan Hajnoczi wrote:
> On Fri, May 07, 2021 at 05:25:04AM -0700, Steve Sistare wrote:
>> @@ -660,6 +673,16 @@ void qemu_system_debug_request(void)
>>      qemu_notify_event();
>>  }
>>  
>> +static void qemu_exec(void)
>> +{
>> +    const char *helper = "/usr/bin/qemu-exec";
> 
> The network up script is get_relocated_path(CONFIG_SYSCONFDIR
> "/qemu-ifup"). For consistency maybe this should use the same path
> rather than /usr/bin/.

CONFIG_QEMU_HELPERDIR=/usr/libexec looks like a good choice.
And maybe rename qemu-exec to qemu-exec-helper, analogous to qemu-bridge-helper.

- Steve

