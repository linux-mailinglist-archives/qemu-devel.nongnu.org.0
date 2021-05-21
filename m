Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 66B3338CFC4
	for <lists+qemu-devel@lfdr.de>; Fri, 21 May 2021 23:20:12 +0200 (CEST)
Received: from localhost ([::1]:47000 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lkCZ0-0001AJ-OE
	for lists+qemu-devel@lfdr.de; Fri, 21 May 2021 17:20:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36690)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1lkCXI-0008Qk-Fz
 for qemu-devel@nongnu.org; Fri, 21 May 2021 17:18:24 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:1066)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1lkCXF-0002Jp-Im
 for qemu-devel@nongnu.org; Fri, 21 May 2021 17:18:24 -0400
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14LLHQ0q009481; Fri, 21 May 2021 21:18:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=KOYN9XTQJJiZrt+Lucq6Il2Hcs+fKp4sLTUOO5hJ0gU=;
 b=FIR3o+vyFUfQcw99VNuu7YjJUvjrCBOqPmw4VTL/pUkgtgMrX+w4ztz7nA0DN5fBnDnm
 YtJbaj2ohwLSobrdi8ujNf1ixqsl0wsyg5Bte7qhl1eTSXHMywSdWdJfpmjI4vxRclmt
 CL0o4KRi2z5MTkJRgjNSQFFjnwKBSxHPPnMqrGQhGjPk8HKa8iB4nFXC/0Vja5ujuHUJ
 pnSrgJt7CFt99D06N87z/6mCvIdcf0v+5eA8FYZELdvU8OvAU8WR4z22qLCgvr2qogPR
 LpLkJ6rwSEtnqswEZL0uYcNjE4Vzo9hnKLYILRqdcvI7bA5zn6UCIn56M4z9dWI3OkZ/ bg== 
Received: from oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 38nuuwggt7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 21 May 2021 21:18:17 +0000
Received: from aserp3020.oracle.com (aserp3020.oracle.com [127.0.0.1])
 by pps.podrdrct (8.16.0.36/8.16.0.36) with SMTP id 14LLIBCY017587;
 Fri, 21 May 2021 21:18:16 GMT
Received: from nam02-sn1-obe.outbound.protection.outlook.com
 (mail-sn1anam02lp2042.outbound.protection.outlook.com [104.47.57.42])
 by aserp3020.oracle.com with ESMTP id 38nry3u9yq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 21 May 2021 21:18:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Sc/ghnH8PYqIb5MqWF5ctcBTTERBzLuqBpkksBARNImYxeiQlYIJSQSWBjQMWfzBkWoR1U8WmioFAfIbRMAs7R4APLzBIylF2hqhLNC0swzVgIxZTXrvJAlmywI59haZoStudb/jHSzWHFDREU3URh37VKhsAFkSkOfz8B/bnH+Fq4DWN6EL05vGM7aS3CVoCuCgRQOEWYyXZ2WGaMmdpar3P0Ukv23ACQ8p7CkCuptGg0Do+VC9Si8bAQOjsBytDjZEMbonlK1fGci3H6CLaO6SkVwW/oblaJFlKmJAW1LdrSHD9qNrEAyHj4Y2P5hCa8GzY4R8vDuWl8pwFjT1pA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KOYN9XTQJJiZrt+Lucq6Il2Hcs+fKp4sLTUOO5hJ0gU=;
 b=cd1gTwLzfB8/CwcXHRNpNba5UtjFE2TRpDckTDeBDVdwk4DKihJhca/Xp/ApkASandF9UpX8DwQ6WffnhbT17tNydLXIc7GyaaiFvDWwyidj/PJ+Wcbf2mMLKBMZRkUjc0+LbDaV/DSE+HsbbixYWaktrgCHDcU7j+ZuRPzl4k3Gr7s2vGiPS+nFqZCh5usGccxnywnLimlH/clbKANhC7CvlMtuUfjzpqayRVLCjUbOFCB6V0bzGkpfnhwa1/ljYo263l4DNuwFqOvSCKVRgxXd+e601ld0YMNbeBBHGb1uWWyN1gyyvvz9BeZOqLxu6tCOXVNAflfhnIMpjGFPQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KOYN9XTQJJiZrt+Lucq6Il2Hcs+fKp4sLTUOO5hJ0gU=;
 b=HYtpNBr8tuDSOEKhKYEX9nnhChdgQ1K2PWie9Oup6RJiOOi1uHl1mkeqRw0+h2IKbQhytXXBn3YW+e9XM26b7IGZvAph8qZvWOjAi8GtghvXrWt1VzKtmFKCBXv+Jfjt+lEcaux2SXDnw4h3zC0NAWtWDixZUfIJG6auwtAg49Q=
Authentication-Results: oracle.com; dkim=none (message not signed)
 header.d=none;oracle.com; dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB3240.namprd10.prod.outlook.com (2603:10b6:a03:155::17)
 by BYAPR10MB2582.namprd10.prod.outlook.com (2603:10b6:a02:ae::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.26; Fri, 21 May
 2021 21:18:13 +0000
Received: from BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::6ce3:f0a3:c303:f851]) by BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::6ce3:f0a3:c303:f851%7]) with mapi id 15.20.4150.026; Fri, 21 May 2021
 21:18:13 +0000
Subject: Re: [PATCH V3 11/22] vfio-pci: refactor for cpr
To: Alex Williamson <alex.williamson@redhat.com>
References: <1620390320-301716-1-git-send-email-steven.sistare@oracle.com>
 <1620390320-301716-12-git-send-email-steven.sistare@oracle.com>
 <20210519163852.016aa9dc.alex.williamson@redhat.com>
 <2e186496-942f-5c34-48bb-b6362996ce71@oracle.com>
 <20210521150729.0bb54382.alex.williamson@redhat.com>
From: Steven Sistare <steven.sistare@oracle.com>
Organization: Oracle Corporation
Message-ID: <aeb26a90-78eb-3f28-c639-d1cc7edd3974@oracle.com>
Date: Fri, 21 May 2021 17:18:08 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
In-Reply-To: <20210521150729.0bb54382.alex.williamson@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [24.62.106.7]
X-ClientProxiedBy: SJ0PR03CA0169.namprd03.prod.outlook.com
 (2603:10b6:a03:338::24) To BYAPR10MB3240.namprd10.prod.outlook.com
 (2603:10b6:a03:155::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.92] (24.62.106.7) by
 SJ0PR03CA0169.namprd03.prod.outlook.com (2603:10b6:a03:338::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.26 via Frontend
 Transport; Fri, 21 May 2021 21:18:11 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 35515f2a-c5a5-4800-edfb-08d91c9df0f4
X-MS-TrafficTypeDiagnostic: BYAPR10MB2582:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR10MB2582AF382D5176A8187EFA95F9299@BYAPR10MB2582.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xCm3a+6cvWzKOeyYBYa34lLgRRvYcY0aSwtwS7phsKyVLeKYp9pEIFHozq8rMQlwkJlwuZzh5imjRJHjXupKsKTYW9hG0DbZDD3GJDp4OIKwITWyz+rXBpDKhf2MSs5nrkEL/8PuGaaVCA5M9TaAKnU2l4IvKKwzexA5v1v39mvTyGmWrJR0ZId2p5AA8n12G5X2GHWdQFScOWvelzLsziRnd6FE5yKycIs1C2baKhfYs8QYK4Z0DTFHlOfCVIY9rkGqnnA2Jfvl+uDgcBheHsqk91nq/cC+uPhY12wGwbNGd3tTJwnmJ3kWZh/3mAcq4W1v0qN0iknBRhnF53tjYIEY26G+m8YMxgkalY3MLGqKYnlVYy9geioKxl2tI/e0vZ2Rtz4IWPcxjO1HtE9JyXByNIDZuFhzLoBruC9BdZIFZcP2Do15nh17xuO8vHNlHy8epbln+SyTpJG0w5OLlpKAq3ndoW9F3/wihUBLujznfwpvrDjFojrGwBh/uT+KzOO6tRdn9a2AUOBbHZfTK+/l6mqi4jQx5bqTtNF7bbwoBcyIYsKR0wfnjtI68Pe4VDKozlC9VshnfaYBPZkrJ3eiGhOdPPtRqG5E8W7zyafwhIxFXXbSAiXuQ+iEnRwYzswuBjneqpr2gAA/QlhvNaMQzfgA6nREDmi7D5HgkmR1olcaSugRB/Xc7rj3AWAR
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3240.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(136003)(376002)(39860400002)(396003)(346002)(2906002)(478600001)(38100700002)(36756003)(6666004)(83380400001)(53546011)(6916009)(4326008)(26005)(107886003)(7416002)(8936002)(31686004)(6486002)(31696002)(16526019)(16576012)(316002)(54906003)(66476007)(36916002)(66946007)(44832011)(66556008)(5660300002)(86362001)(186003)(956004)(2616005)(8676002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?RGZVbGFxSWdmOGkzc2tzVWRXZVM2b3VnMEN1S3IzUS8wTUYvWEQxT1JVWmt2?=
 =?utf-8?B?bERiSHFiL2hsdkJzU2ZIZlRMdFFyRnFTUkhVM2IyY3I5eThpSHRVSzlpUitC?=
 =?utf-8?B?VHh2MkxsSlU0VmhKdFdFRHlLOG5TdDN2dE14a1hqY0d2ZXlOZ0k4cDVuL3lD?=
 =?utf-8?B?azdGK0xNRXZTcTJjcmYwbEN4am9MYkhPaUhWc0NGNTFNY2RxTUhwcEwyMFN3?=
 =?utf-8?B?OU04K3RvUGYzd0l0UTZrbUtYL3IvR2hDRndQMmJXM1lQazRzeGRDZHpZUUhZ?=
 =?utf-8?B?TG9tOTd4ekZYay9wcXdVV3UwK0gwaEpBWDlkOTFDbkxoYVNVNjR3ZEkzYTY0?=
 =?utf-8?B?Ky94MlBsK1hXR1JUdkZDTlZLWFJxcmY5OGxBc0JNQ1hxYkwvcm1EMEJPTEtP?=
 =?utf-8?B?MEFkTkhZM0pMUnNuNGdRMTlxeHFHem11L2ZuWE9DLzRvemFidzM5TmQ2TTVJ?=
 =?utf-8?B?Q0VEemdxWEh5YUo2R3NJSUt1OFJ3ZEJFTUs0Z2JaZW9STmJlMDdHK3ViNGdZ?=
 =?utf-8?B?T083RU8xd2M5SkNuN05XLzRndGVjdURXNjZqUTl5b3ZoM3ZhaE5tZmhPYnNI?=
 =?utf-8?B?M1ZuQmlrRkE4RjQ4UUJvTlQ2Mk8rN3dHVWpXTWtZNWN4aUdGMzV5MjF6Vm9T?=
 =?utf-8?B?RFU1Zk54RElRRzVQamRDUHQvSnNHeW5xNFRrT01TQlpzZGpwTmNEWGsxS0Ro?=
 =?utf-8?B?ZnF5MCs4dUpWNXY0Z0N4aGpyYUlCQ2h4cDZLZDNaNVg5SG92NTh3SG4wc1Vr?=
 =?utf-8?B?V0tMbGxlQzFrbTdRcmFZS0ZwVGZHeWY1bDh1MXRobHpQaUtQcW5kaEE4YkZO?=
 =?utf-8?B?cVRYdFZrR2xIcW9VV1ZWWEJPR0JkbERQZTB0Nm5iTWxuU0dQRjZWay9FYjBD?=
 =?utf-8?B?M1BHZHMrMXBkMHpNOHVYOUwxLzZUemxWNGlZUm5TSGdIdkYxZmVtWXBtdWg4?=
 =?utf-8?B?K2RDY3o3MDd0RTEyVXM5M2trdVJURmdJcXhnS0dQWS9zbnExMVUrWGNyYlZk?=
 =?utf-8?B?VWFBL0tCdTFyaVVNNnRmSWxoVmJ1ZklXWEZ0eDlOODBhS2JKaFNKS1c0UkNt?=
 =?utf-8?B?UFVhN29pL0dyYUl2THZEeUt2b3FOaUdITElmT0k2ekkvUXRiMW0ybkxsN3RS?=
 =?utf-8?B?WHhDdUlxRGU2ZUNJUnJ0anU2c0lsSXl5MTJVTTQzeEVyYit5UU5hQmoydUE5?=
 =?utf-8?B?Y3ZkeVl4V3o2c1haWHJraWV3Ym5QL0NhdkhMTFhJN1NyQjJ1VitHRFJRUmpE?=
 =?utf-8?B?UjdMUlowbjlicmM3UWZaQXBCNDFxWFBveVlIbVhNdHdTTzlHUEdUR3oxT010?=
 =?utf-8?B?bVFrU0FFTVlTMHV6SkhDYW9LT0paOXVORXZnd1BaU0hKRVNWTmRQWmN2cmdm?=
 =?utf-8?B?TzVteXFuRnJCRmNCOHV5YjVpdU5TdmVRQWJyZ0gwOHRaT2pSMUdtN0g4dDFL?=
 =?utf-8?B?bmMxci9ScjlsQ1J4cjVBMTVRV1JzVmdLTk9zSmcrVUNvVVlsRHdtVm1TWmVM?=
 =?utf-8?B?VUQ1RVZYaCtESnJGOERKYWFrNFdSOFNyaTBoMWJpWVdmV09EM0UwOVcrWk43?=
 =?utf-8?B?NlpLaXNNUjJKOVlIRWNKZFBMbTRZMXpCZTNCUy9xNjZZdEdqU0o2c2MwM3RR?=
 =?utf-8?B?Q1RCamJzeUdrVURYby9SSlU2RC9DNFI1NG1jUFp0WGFGaXVIVlpUTUlFOVhK?=
 =?utf-8?B?V2hnUFQwaUR6Mkh2QmZBL0xUUW9nVHNraVZOc0Z5bEIvNDdtZVpxcm5iWWEy?=
 =?utf-8?Q?LbMbFmHJenbtc2tlwvPT6xTLsFkUFktbusI6Wna?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 35515f2a-c5a5-4800-edfb-08d91c9df0f4
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3240.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2021 21:18:12.9521 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GSj08hrN2bSFwKjwndf+ovyE6fTSeIVyfcWq8UQUsRu/m9dn1c7uyDxT8UasGdk6I2OPiQPgFY2RlWYvxPcEEbx/dX2Ii05z9i1e9ZWVxus=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR10MB2582
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9991
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 suspectscore=0
 malwarescore=0 mlxlogscore=999 adultscore=0 mlxscore=0 spamscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2105210116
X-Proofpoint-ORIG-GUID: oa1XUmTbP4TRaqBCkFyVQjquaKe-bcx8
X-Proofpoint-GUID: oa1XUmTbP4TRaqBCkFyVQjquaKe-bcx8
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=steven.sistare@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7,
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
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/21/2021 5:07 PM, Alex Williamson wrote:
> On Fri, 21 May 2021 09:33:13 -0400
> Steven Sistare <steven.sistare@oracle.com> wrote:
> 
>> On 5/19/2021 6:38 PM, Alex Williamson wrote:
>>> On Fri,  7 May 2021 05:25:09 -0700
>>> Steve Sistare <steven.sistare@oracle.com> wrote:
>>>   
>>>> Export vfio_address_spaces and vfio_listener_skipped_section.
>>>> Add optional eventfd arg to vfio_add_kvm_msi_virq.
>>>> Refactor vector use into a helper vfio_vector_init.
>>>> All for use by cpr in a subsequent patch.  No functional change.
>>>>
>>>> Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
>>>> ---
>>>>  hw/vfio/common.c              |  4 ++--
>>>>  hw/vfio/pci.c                 | 36 +++++++++++++++++++++++++-----------
>>>>  include/hw/vfio/vfio-common.h |  3 +++
>>>>  3 files changed, 30 insertions(+), 13 deletions(-)
>>>>
>>>> diff --git a/hw/vfio/common.c b/hw/vfio/common.c
>>>> index ae5654f..9220e64 100644
>>>> --- a/hw/vfio/common.c
>>>> +++ b/hw/vfio/common.c
>>>> @@ -42,7 +42,7 @@
>>>>  
>>>>  VFIOGroupList vfio_group_list =
>>>>      QLIST_HEAD_INITIALIZER(vfio_group_list);
>>>> -static QLIST_HEAD(, VFIOAddressSpace) vfio_address_spaces =
>>>> +VFIOAddressSpaceList vfio_address_spaces =
>>>>      QLIST_HEAD_INITIALIZER(vfio_address_spaces);
>>>>  
>>>>  #ifdef CONFIG_KVM
>>>> @@ -534,7 +534,7 @@ static int vfio_host_win_del(VFIOContainer *container, hwaddr min_iova,
>>>>      return -1;
>>>>  }
>>>>  
>>>> -static bool vfio_listener_skipped_section(MemoryRegionSection *section)
>>>> +bool vfio_listener_skipped_section(MemoryRegionSection *section)
>>>>  {
>>>>      return (!memory_region_is_ram(section->mr) &&
>>>>              !memory_region_is_iommu(section->mr)) ||
>>>> diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
>>>> index 5c65aa0..7a4fb6c 100644
>>>> --- a/hw/vfio/pci.c
>>>> +++ b/hw/vfio/pci.c
>>>> @@ -411,7 +411,7 @@ static int vfio_enable_vectors(VFIOPCIDevice *vdev, bool msix)
>>>>  }
>>>>  
>>>>  static void vfio_add_kvm_msi_virq(VFIOPCIDevice *vdev, VFIOMSIVector *vector,
>>>> -                                  int vector_n, bool msix)
>>>> +                                  int vector_n, bool msix, int eventfd)
>>>>  {
>>>>      int virq;
>>>>  
>>>> @@ -419,7 +419,9 @@ static void vfio_add_kvm_msi_virq(VFIOPCIDevice *vdev, VFIOMSIVector *vector,
>>>>          return;
>>>>      }
>>>>  
>>>> -    if (event_notifier_init(&vector->kvm_interrupt, 0)) {
>>>> +    if (eventfd >= 0) {
>>>> +        event_notifier_init_fd(&vector->kvm_interrupt, eventfd);
>>>> +    } else if (event_notifier_init(&vector->kvm_interrupt, 0)) {
>>>>          return;
>>>>      }  
>>>
>>> This seems very obfuscated.  The "active" arg of event_notifier_init()
>>> just seems to preload the eventfd with a signal.  What does that have
>>> to do with an eventfd arg to this function?  What if the first branch
>>> returns failure?  
>>
>> Perhaps you mis-read the code?  The function called in the first branch is different than
>> the function called in the second branch.  And event_notifier_init_fd is void and never fails.
>>
>> Eschew obfuscation.
>>
>> Gesundheit.
> 
> D'oh!  I looked at that so many times trying to figure out what I was
> missing and still didn't spot the "_fd" on the first function.  The
> fact that @active is an int used as a bool in the non-fd version didn't
> help.  Maybe we need our own wrapper just to spread the code out a
> bit...
> 
> /* Create new or reuse existing eventfd */
> static int vfio_event_notifier_init(EventNotifier *e, int fd)
> {
>     if (fd < 0) {
>         return event_notifier_init(e, 0);
>     }
> 
>     event_notifier_init_fd(e, fd);
>     return 0;
> }

Will do, for both here and below - Steve

> Or I should just user bigger fonts, but that's somehow more apparent to
> me and can be reused below.
> 
>>>> @@ -455,6 +457,22 @@ static void vfio_update_kvm_msi_virq(VFIOMSIVector *vector, MSIMessage msg,
>>>>      kvm_irqchip_commit_routes(kvm_state);
>>>>  }
>>>>  
>>>> +static void vfio_vector_init(VFIOPCIDevice *vdev, int nr, int eventfd)
>>>> +{
>>>> +    VFIOMSIVector *vector = &vdev->msi_vectors[nr];
>>>> +    PCIDevice *pdev = &vdev->pdev;
>>>> +
>>>> +    vector->vdev = vdev;
>>>> +    vector->virq = -1;
>>>> +    if (eventfd >= 0) {
>>>> +        event_notifier_init_fd(&vector->interrupt, eventfd);
>>>> +    } else if (event_notifier_init(&vector->interrupt, 0)) {
>>>> +        error_report("vfio: Error: event_notifier_init failed");
>>>> +    }  
>>>
>>> Gak, here's that same pattern.
>>>   
>>>> +    vector->use = true;
>>>> +    msix_vector_use(pdev, nr);
>>>> +}
>>>> +
>>>>  static int vfio_msix_vector_do_use(PCIDevice *pdev, unsigned int nr,
>>>>                                     MSIMessage *msg, IOHandler *handler)
>>>>  {
>>>> @@ -466,14 +484,10 @@ static int vfio_msix_vector_do_use(PCIDevice *pdev, unsigned int nr,
>>>>  
>>>>      vector = &vdev->msi_vectors[nr];
>>>>  
>>>> +    vfio_vector_init(vdev, nr, -1);
>>>> +
>>>>      if (!vector->use) {
>>>> -        vector->vdev = vdev;
>>>> -        vector->virq = -1;
>>>> -        if (event_notifier_init(&vector->interrupt, 0)) {
>>>> -            error_report("vfio: Error: event_notifier_init failed");
>>>> -        }
>>>> -        vector->use = true;
>>>> -        msix_vector_use(pdev, nr);
>>>> +        vfio_vector_init(vdev, nr, -1);
>>>>      }  
>>>
>>> Huh?  That's not at all "no functional change".  Also the branch is
>>> entirely dead code now.  
>>
>> Good catch, thank you.  This is a rebase error.  The unconditional call to vfio_vector_init
>> should not be there.  With that fix, we have:
>>
>>     if (!vector->use) {
>>         vfio_vector_init(vdev, nr, -1);
>>     }
>>
>> and there is no functional change; the actions performed in vfio_vector_init are identical to 
>> those deleted here.
> 
> Yup.
> 
>>>>      qemu_set_fd_handler(event_notifier_get_fd(&vector->interrupt),
>>>> @@ -491,7 +505,7 @@ static int vfio_msix_vector_do_use(PCIDevice *pdev, unsigned int nr,
>>>>          }
>>>>      } else {
>>>>          if (msg) {
>>>> -            vfio_add_kvm_msi_virq(vdev, vector, nr, true);
>>>> +            vfio_add_kvm_msi_virq(vdev, vector, nr, true, -1);
>>>>          }
>>>>      }
>>>>  
>>>> @@ -641,7 +655,7 @@ retry:
>>>>           * Attempt to enable route through KVM irqchip,
>>>>           * default to userspace handling if unavailable.
>>>>           */
>>>> -        vfio_add_kvm_msi_virq(vdev, vector, i, false);
>>>> +        vfio_add_kvm_msi_virq(vdev, vector, i, false, -1);
>>>>      }  
>>>
>>> And then we're not really passing an eventfd anyway :-\  I'm so
>>> confused...  
>>
>> This patch just adds the eventfd arg.  The next few patches pass valid eventfd's from the
>> cpr code paths.
> 
> Yeah, I couldn't put the pieces together though after repeatedly
> misreading eventfd being used as a bool in event_notifier_init(), even
> though -1 here should have clued me in too.  Thanks,
> 
> Alex
> 

