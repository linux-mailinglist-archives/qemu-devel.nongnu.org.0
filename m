Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 96C1038C833
	for <lists+qemu-devel@lfdr.de>; Fri, 21 May 2021 15:34:30 +0200 (CEST)
Received: from localhost ([::1]:53220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lk5IL-0005Lt-CF
	for lists+qemu-devel@lfdr.de; Fri, 21 May 2021 09:34:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33122)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1lk5HN-0004GK-LF
 for qemu-devel@nongnu.org; Fri, 21 May 2021 09:33:29 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:54564)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1lk5HK-0005VM-LY
 for qemu-devel@nongnu.org; Fri, 21 May 2021 09:33:29 -0400
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14LDLsTu029242; Fri, 21 May 2021 13:33:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=ieX2nK1uaYZz8KwL93EmgrYhOr2k/iWQkec310zdY84=;
 b=C4Da9zN8jGvl5clYZEJI/8tufZYIAXJaSxsPXLOlaWzJCm16mq6IvY21IazZsNvFy2JS
 9qNjMhRNoG9ww6lVYPaQCRPNhCGPsWrHAMuhxkoNnn+9SyW96SIvXP0gJ34ZkPlupEwS
 LDtIp0yt7iZ6RbiRKNL26XEuJStpEflpEr/4vtpaSod8RxXJY3vDR04mFGgpG707wiqI
 uYiiqvM0xzdtw3i4L1cNwA64zSEmLfXQBaElPZmVVG1SmJGdj2OIs+ZpJMQhGSour9Td
 wno1I4YzfsSuI/RLIrTp9CCpEWFeILfZCTA80AK2lQibX7uX8bhHCneAT2WDDn8ag9gB Rw== 
Received: from oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 38n4utrwmp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 21 May 2021 13:33:20 +0000
Received: from userp3030.oracle.com (userp3030.oracle.com [127.0.0.1])
 by pps.podrdrct (8.16.0.36/8.16.0.36) with SMTP id 14LDXJBe116979;
 Fri, 21 May 2021 13:33:19 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2104.outbound.protection.outlook.com [104.47.58.104])
 by userp3030.oracle.com with ESMTP id 38megnj7tj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 21 May 2021 13:33:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I15POeUPqWmNPwRhmvlZl5PDqY6JHn5v8uJFMT//48G2LwU9a6KW/+8phl3w5NTeMfkYSC4IOKKZV/xPeoW3Dx8kS/hqyt1fChic3TOx3fjzM07x/sB/p+/KuvFd4AnFReEtvjfO3rsd6L2INbCvAzIiKdZ8E8iR0JFsagdzWBFLU0QdK4xDA/LqK3+NdpuLRtQtCmtTR8uxW/D6w2iTEWBh5Xcf9tlntVXZfrEliImzL4DkhOdoKy5RbpsT5oIwhuP8T5Vfi1w0Yc8E7b/CU46tRGOk2eIvzlSwswduhPug5Ys651WLdBg0T/Ut2Lp15dLQQCLYEF0W2Rv9cvZ9uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ieX2nK1uaYZz8KwL93EmgrYhOr2k/iWQkec310zdY84=;
 b=J88aRxZp+4hvnSpHiJOLyFNtuRH0tpqc5oZo/z/HgjzuSt1osN7xY335U2iWAPa3UqzxgkrpjDOCTG0NhifvEtB3ew++B6B6c7NgUsFRHy9BL1+F/3t+jRI1J27Hl4lKdYY/NLcosG3RnXOzuNGDFe8frudqF2nxW5/CFqG7yTJBJQH09n83jFFkmXhJK+zMdviAmDR5IHGLsTuNh+qFux+2lP9L+dl+P93ppKVUWe6K+68q71rCt5ip8yVX7c3IiUHClOTeAJh98LSdZAkV8GenNLfM6ItYMncMlrDtB/rKLkxWvdfDDdgFteqOeHUccfb30I3aUDWXTwPkgocOmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ieX2nK1uaYZz8KwL93EmgrYhOr2k/iWQkec310zdY84=;
 b=bOO8Ltc++s9V4yrmBUI8u5B0t9rc+WiF1tngYt4QyulSIjufeq0uqkqgWbmKU5h1U4OioBwQaGMCuCs0cbWUAt0hWT0lYPSKw1YfvMfTpmEqD+uMJswvEnvNfyYwIyuKDHVcrZBZmme24AFujqbXIzqqI/50VVB3s+cMznGkhVA=
Authentication-Results: oracle.com; dkim=none (message not signed)
 header.d=none;oracle.com; dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB3240.namprd10.prod.outlook.com (2603:10b6:a03:155::17)
 by BY5PR10MB4242.namprd10.prod.outlook.com (2603:10b6:a03:20d::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.23; Fri, 21 May
 2021 13:33:17 +0000
Received: from BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::6ce3:f0a3:c303:f851]) by BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::6ce3:f0a3:c303:f851%7]) with mapi id 15.20.4150.026; Fri, 21 May 2021
 13:33:17 +0000
Subject: Re: [PATCH V3 11/22] vfio-pci: refactor for cpr
To: Alex Williamson <alex.williamson@redhat.com>
References: <1620390320-301716-1-git-send-email-steven.sistare@oracle.com>
 <1620390320-301716-12-git-send-email-steven.sistare@oracle.com>
 <20210519163852.016aa9dc.alex.williamson@redhat.com>
From: Steven Sistare <steven.sistare@oracle.com>
Organization: Oracle Corporation
Message-ID: <2e186496-942f-5c34-48bb-b6362996ce71@oracle.com>
Date: Fri, 21 May 2021 09:33:13 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
In-Reply-To: <20210519163852.016aa9dc.alex.williamson@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [24.62.106.7]
X-ClientProxiedBy: SN4PR0201CA0024.namprd02.prod.outlook.com
 (2603:10b6:803:2b::34) To BYAPR10MB3240.namprd10.prod.outlook.com
 (2603:10b6:a03:155::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.92] (24.62.106.7) by
 SN4PR0201CA0024.namprd02.prod.outlook.com (2603:10b6:803:2b::34) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.23 via Frontend
 Transport; Fri, 21 May 2021 13:33:14 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 489ead91-4869-4828-74ba-08d91c5cfd8f
X-MS-TrafficTypeDiagnostic: BY5PR10MB4242:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BY5PR10MB4242667526D974662FFDCAD2F9299@BY5PR10MB4242.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1303;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8Xsseo4Kovhb1z5GWlSY1VhI7+gtlO+8s7O18jm+uOv78kDfpmOM3njpGXYmyRYRMOV2Uzg8X/b9Y3jvvMI5jnrdu5bMCm3JkL7CChxKgR/mtwK0qL5Z2wuVeHKZwnSRr5vfU8fqGg1dFx57gHakruCpE/odu23ZH9MDkyqei03Sjw8ALK83ysm9ObOsnvBm1YiZMd3N8Eg5J6haz4h4Ow/FjLZfejxJvtsJVBrSGNrAv2Sx5ZCz8U9BzXC+Wz1bWzeFc2qtDsk1tvHOVS1STKCps8JZWmKPOYb43JxeGIn4t9vyM0IXuOKvktXtKd/FOLkGpA5vlQXLMK+5AqsAUJ1E29mjhNBvuilfTaMJvDYWB2j17BDWOcFxvTL0MkfyXgE9XhJ0cYJ2iw1+7KY9KTwbPFWr+XnC5K1JCGpOsnJEl+vcXvdIU1uFRfkVAHdkNSJ7tU1g49PZ2SFwP7U+HHQtdSRcsHmbQCVyZNdZtqySs4klLppakEBGKUOrcV3zv3wkeyAf1UmuBc+8cRlsQK2pQUvYQjxbU38ftXM9ABIomKl0RjRV1rSPQIRVsT+cKYKdIbmXep79gXi1UGutV3Wm2y1v8wFfcvM+VRSmXFqINBuKcMv/zsilHgHk8dvDztYnXOEqXbl1y2J6Z5ilSHBPHEUCcwFrr7sts6G+cV0Nt0MnID0Bo+zj5Z/g82Am
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3240.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(39860400002)(396003)(376002)(136003)(346002)(956004)(8676002)(36756003)(83380400001)(316002)(4326008)(5660300002)(2616005)(86362001)(8936002)(26005)(31696002)(107886003)(54906003)(186003)(478600001)(31686004)(6916009)(16576012)(38100700002)(2906002)(6486002)(66946007)(53546011)(16526019)(44832011)(36916002)(7416002)(66556008)(66476007)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?bVU1TEpRWHFvWGlpZzVtdkk3YUVwdWM2UEp6cDZwViswZkEzMEVGK09TK3hw?=
 =?utf-8?B?UGRmQTR1blhDZDlDN2xpVXc0M083czRkTk0rekswZFpZRkREYy9kWDVSMFY2?=
 =?utf-8?B?UitxNS8vV3BBK0hGNnlJVHNVUjAwOTdsbEJ0VkxiQUMzK3NxNUY1K0NoSFdz?=
 =?utf-8?B?Q3N4UzRGMkFDZVRUZU85Q2MzZ2xveXFvMG5hRW9ySUlGeFN3bk5XM1lJWENZ?=
 =?utf-8?B?VHVIOWphNUFTd0thN2tzdGc5MXNhSjRzK3FoekNKc2VCWXFmYjVNVVZKNnVK?=
 =?utf-8?B?OGtlNmZCWEo3ZXgzT29tckRvcFdudUdqOUdFaFVCZlFIamgxa2lhZGFUSTNy?=
 =?utf-8?B?OC9UWHRMVHpLOTE1WVFZOFVZK0l2U2owUzB2eXQ5WEJWcG5YVGtOREJzVE8w?=
 =?utf-8?B?VkY2UE5PUWdoZ1V1S1hwYm5JWjJlWk51WUFmY1Jsemc5c29zTzBWZUpNdzRU?=
 =?utf-8?B?cVErVXp5WkptaklYdmJHSkVhSUlOWjRyT2h1elRvdHZMbUlFMGdySE5uYkZ6?=
 =?utf-8?B?Z3dkSVZ1ekxqWnV3TzlqTDIvMjRQaVhiM0svOWRTTEsvOHBtZ3RlT045MWdQ?=
 =?utf-8?B?eWZ4UXlZOVFFbzhvRGZjenVLZG1oU3YwTWprUVhtZVdFdXJnc3VtMGROOUtl?=
 =?utf-8?B?MmJpV1pvdE9JWmZHSzk3OWVVWDVpa3I1c1VaejdXRjNvV0duaWdpbEx4UHdP?=
 =?utf-8?B?SEtiMUNqeUZ2UE1YZ3ZXODV1dUFHaVZlSExoYTlQWWZHRnZMWE1ia2tEeUZ1?=
 =?utf-8?B?bmNjSnN6aURFREoxYy9CSk9QRHhPMVNQYkdQeGlQbkVFM0Y3cDJqVGlsbU1w?=
 =?utf-8?B?eXNGTWNGZDFZVWwwbGY2aDB2M3FqZ2F2M3NKV0x2UUVCM2hpcklUQWNrb1d5?=
 =?utf-8?B?WFYrM1ZqVFM2ODAzYW1WN0NKZVVUWXZvNzR2dzFnRUhjM0Z1YklaTmwwdVcx?=
 =?utf-8?B?K09NYXZBODBDcEFOd1RNZCswV2gzek1yMXVWMVZWall4dWc2ZjJsWU1wcmVk?=
 =?utf-8?B?Y1ZpWWJLbitCMWx1cVNuZEM0YTJ4QlltM2tPdmcwUnFucm5XeFJkNEVIeGFj?=
 =?utf-8?B?dGxtWklWalp3eTRpbVNQNmovT2R4Zi8yWjVNdnl1Q0pzUXN5bE8zdThUSSts?=
 =?utf-8?B?OFZRVytQUXJkRWdNQTB6a2RwVTRueTZaRzRnNjUrVkdLdU4xM0hOQkREN3or?=
 =?utf-8?B?K293aTVxS1hTZERZZzFyRWNnTE93aE5vUHQwanVYTUhKNlQzRi80SHZ4QUd1?=
 =?utf-8?B?Smh4VlhOOTZpTFRqK0VneStuZnhLWkttbDhhRW1lV0J5Y2t4Rk41M21HY05I?=
 =?utf-8?B?aGpmMHI4Mk5Ya1dWemVYaVhDdTdkbTlWL0xpaDF5clpNNUVFNzVKd2ZKNjds?=
 =?utf-8?B?alZPY1A3VEx0YU9adUwzUEhFMWhUWkR3d1k3clVvQ0NmMjVFWjZyOXRkRXdZ?=
 =?utf-8?B?Mk1DeU5vbkRvQzVkRGNoRGxlSVErUFVqL2VuSllscjhKOUUzRERsVndPWHdU?=
 =?utf-8?B?SGg3aGRWQmhNN09Qa2NHdW5BYjYzQVBBeXQxZDFleWx2TURLSHQzM2loemkr?=
 =?utf-8?B?NXZ5ZlFUYm1DZVhrdDFRUDgyRTJzMTVLejdzRWUxWldMQU1aT2ZEWWZGK0Yx?=
 =?utf-8?B?RCt5cHJrenIxT2VrSkxlQlZYMzZzaGk4RUFMcEhhN2JwcFBKVFVkQTVIdk5t?=
 =?utf-8?B?cjJhRVBaeGFrZEluSUJvcWtzRVptMjVEV1l3VWtpSVZVc2l6aUt2QU1QREVW?=
 =?utf-8?Q?l7Et1AG1P5ukJIfIXvLYK0auY1y+8BGGK0FliFk?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 489ead91-4869-4828-74ba-08d91c5cfd8f
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3240.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2021 13:33:16.8960 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w1orby0oI4lWV8bxtwq2xxlJII94X5G9rZt4WwdaAmkKmZS/ZJtsuGYWG5hI8aXEK817cFa9UcEnsF+hg8EfsaGxOglm/OCCQYqoGhBDgm0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4242
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9990
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 phishscore=0
 adultscore=0 malwarescore=0 bulkscore=0 mlxscore=0 spamscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2105210078
X-Proofpoint-GUID: h0pRnFXPZqGiUGbOfwWcTRmLTSxC9Z71
X-Proofpoint-ORIG-GUID: h0pRnFXPZqGiUGbOfwWcTRmLTSxC9Z71
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

On 5/19/2021 6:38 PM, Alex Williamson wrote:
> On Fri,  7 May 2021 05:25:09 -0700
> Steve Sistare <steven.sistare@oracle.com> wrote:
> 
>> Export vfio_address_spaces and vfio_listener_skipped_section.
>> Add optional eventfd arg to vfio_add_kvm_msi_virq.
>> Refactor vector use into a helper vfio_vector_init.
>> All for use by cpr in a subsequent patch.  No functional change.
>>
>> Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
>> ---
>>  hw/vfio/common.c              |  4 ++--
>>  hw/vfio/pci.c                 | 36 +++++++++++++++++++++++++-----------
>>  include/hw/vfio/vfio-common.h |  3 +++
>>  3 files changed, 30 insertions(+), 13 deletions(-)
>>
>> diff --git a/hw/vfio/common.c b/hw/vfio/common.c
>> index ae5654f..9220e64 100644
>> --- a/hw/vfio/common.c
>> +++ b/hw/vfio/common.c
>> @@ -42,7 +42,7 @@
>>  
>>  VFIOGroupList vfio_group_list =
>>      QLIST_HEAD_INITIALIZER(vfio_group_list);
>> -static QLIST_HEAD(, VFIOAddressSpace) vfio_address_spaces =
>> +VFIOAddressSpaceList vfio_address_spaces =
>>      QLIST_HEAD_INITIALIZER(vfio_address_spaces);
>>  
>>  #ifdef CONFIG_KVM
>> @@ -534,7 +534,7 @@ static int vfio_host_win_del(VFIOContainer *container, hwaddr min_iova,
>>      return -1;
>>  }
>>  
>> -static bool vfio_listener_skipped_section(MemoryRegionSection *section)
>> +bool vfio_listener_skipped_section(MemoryRegionSection *section)
>>  {
>>      return (!memory_region_is_ram(section->mr) &&
>>              !memory_region_is_iommu(section->mr)) ||
>> diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
>> index 5c65aa0..7a4fb6c 100644
>> --- a/hw/vfio/pci.c
>> +++ b/hw/vfio/pci.c
>> @@ -411,7 +411,7 @@ static int vfio_enable_vectors(VFIOPCIDevice *vdev, bool msix)
>>  }
>>  
>>  static void vfio_add_kvm_msi_virq(VFIOPCIDevice *vdev, VFIOMSIVector *vector,
>> -                                  int vector_n, bool msix)
>> +                                  int vector_n, bool msix, int eventfd)
>>  {
>>      int virq;
>>  
>> @@ -419,7 +419,9 @@ static void vfio_add_kvm_msi_virq(VFIOPCIDevice *vdev, VFIOMSIVector *vector,
>>          return;
>>      }
>>  
>> -    if (event_notifier_init(&vector->kvm_interrupt, 0)) {
>> +    if (eventfd >= 0) {
>> +        event_notifier_init_fd(&vector->kvm_interrupt, eventfd);
>> +    } else if (event_notifier_init(&vector->kvm_interrupt, 0)) {
>>          return;
>>      }
> 
> This seems very obfuscated.  The "active" arg of event_notifier_init()
> just seems to preload the eventfd with a signal.  What does that have
> to do with an eventfd arg to this function?  What if the first branch
> returns failure?

Perhaps you mis-read the code?  The function called in the first branch is different than
the function called in the second branch.  And event_notifier_init_fd is void and never fails.

Eschew obfuscation.

Gesundheit.

>> @@ -455,6 +457,22 @@ static void vfio_update_kvm_msi_virq(VFIOMSIVector *vector, MSIMessage msg,
>>      kvm_irqchip_commit_routes(kvm_state);
>>  }
>>  
>> +static void vfio_vector_init(VFIOPCIDevice *vdev, int nr, int eventfd)
>> +{
>> +    VFIOMSIVector *vector = &vdev->msi_vectors[nr];
>> +    PCIDevice *pdev = &vdev->pdev;
>> +
>> +    vector->vdev = vdev;
>> +    vector->virq = -1;
>> +    if (eventfd >= 0) {
>> +        event_notifier_init_fd(&vector->interrupt, eventfd);
>> +    } else if (event_notifier_init(&vector->interrupt, 0)) {
>> +        error_report("vfio: Error: event_notifier_init failed");
>> +    }
> 
> Gak, here's that same pattern.
> 
>> +    vector->use = true;
>> +    msix_vector_use(pdev, nr);
>> +}
>> +
>>  static int vfio_msix_vector_do_use(PCIDevice *pdev, unsigned int nr,
>>                                     MSIMessage *msg, IOHandler *handler)
>>  {
>> @@ -466,14 +484,10 @@ static int vfio_msix_vector_do_use(PCIDevice *pdev, unsigned int nr,
>>  
>>      vector = &vdev->msi_vectors[nr];
>>  
>> +    vfio_vector_init(vdev, nr, -1);
>> +
>>      if (!vector->use) {
>> -        vector->vdev = vdev;
>> -        vector->virq = -1;
>> -        if (event_notifier_init(&vector->interrupt, 0)) {
>> -            error_report("vfio: Error: event_notifier_init failed");
>> -        }
>> -        vector->use = true;
>> -        msix_vector_use(pdev, nr);
>> +        vfio_vector_init(vdev, nr, -1);
>>      }
> 
> Huh?  That's not at all "no functional change".  Also the branch is
> entirely dead code now.

Good catch, thank you.  This is a rebase error.  The unconditional call to vfio_vector_init
should not be there.  With that fix, we have:

    if (!vector->use) {
        vfio_vector_init(vdev, nr, -1);
    }

and there is no functional change; the actions performed in vfio_vector_init are identical to 
those deleted here.

>>      qemu_set_fd_handler(event_notifier_get_fd(&vector->interrupt),
>> @@ -491,7 +505,7 @@ static int vfio_msix_vector_do_use(PCIDevice *pdev, unsigned int nr,
>>          }
>>      } else {
>>          if (msg) {
>> -            vfio_add_kvm_msi_virq(vdev, vector, nr, true);
>> +            vfio_add_kvm_msi_virq(vdev, vector, nr, true, -1);
>>          }
>>      }
>>  
>> @@ -641,7 +655,7 @@ retry:
>>           * Attempt to enable route through KVM irqchip,
>>           * default to userspace handling if unavailable.
>>           */
>> -        vfio_add_kvm_msi_virq(vdev, vector, i, false);
>> +        vfio_add_kvm_msi_virq(vdev, vector, i, false, -1);
>>      }
> 
> And then we're not really passing an eventfd anyway :-\  I'm so
> confused...

This patch just adds the eventfd arg.  The next few patches pass valid eventfd's from the
cpr code paths.

- Steve

>>      /* Set interrupt type prior to possible interrupts */
>> diff --git a/include/hw/vfio/vfio-common.h b/include/hw/vfio/vfio-common.h
>> index 6141162..00acb85 100644
>> --- a/include/hw/vfio/vfio-common.h
>> +++ b/include/hw/vfio/vfio-common.h
>> @@ -204,6 +204,8 @@ int vfio_get_device(VFIOGroup *group, const char *name,
>>  extern const MemoryRegionOps vfio_region_ops;
>>  typedef QLIST_HEAD(VFIOGroupList, VFIOGroup) VFIOGroupList;
>>  extern VFIOGroupList vfio_group_list;
>> +typedef QLIST_HEAD(, VFIOAddressSpace) VFIOAddressSpaceList;
>> +extern VFIOAddressSpaceList vfio_address_spaces;
>>  
>>  bool vfio_mig_active(void);
>>  int64_t vfio_mig_bytes_transferred(void);
>> @@ -222,6 +224,7 @@ struct vfio_info_cap_header *
>>  vfio_get_device_info_cap(struct vfio_device_info *info, uint16_t id);
>>  #endif
>>  extern const MemoryListener vfio_prereg_listener;
>> +bool vfio_listener_skipped_section(MemoryRegionSection *section);
>>  
>>  int vfio_spapr_create_window(VFIOContainer *container,
>>                               MemoryRegionSection *section,
> 

