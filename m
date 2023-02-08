Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 49AAA68F6FF
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Feb 2023 19:35:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPpH9-00020X-Lx; Wed, 08 Feb 2023 13:34:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1pPpH6-0001zv-3T
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 13:34:32 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1pPpH2-0003Fv-RA
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 13:34:31 -0500
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 318HxMkP032630; Wed, 8 Feb 2023 18:34:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2022-7-12;
 bh=MsGfhJ/kuawLmuQBzcfz+jhvyCxeiUNkUBSrUgNB+z4=;
 b=QuirVfCM16mmbN+d49NST8/1InUz2VnrMh+TvhrEJH5nlPNLEySD7vy0i5NNikka9Bfk
 33F7qEvsrocM9dVUstSnfvzS8qWJNWxMCuUAiqR1BFr6lf6oj8Mto/sjBPWgGiOXMKny
 ZON33HuIxy1N7fhGPp01NWrPq0Fb8N5K3UEph8K2tbwuuCVQ9EwRPCpXCkKeVBwfdCoH
 iWQJysb9LhIlDz+ZCofUWbOOLxrOT1n5cWonTLThRi6lNE9aJehqOkgiHr15yTzSsryf
 9v7lhiz7yoxMU7f8j7n7cPX76F5mOMpE8RH9PAd2kdhAAY+hJ5Iz15CwZp3uXiUpUxwC 4w== 
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3nhf8a8xb9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 08 Feb 2023 18:34:25 +0000
Received: from pps.filterd
 (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 318HsKEh021288; Wed, 8 Feb 2023 18:34:24 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2168.outbound.protection.outlook.com [104.47.57.168])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 3nhdt7jx20-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 08 Feb 2023 18:34:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Nvdr6/AaaCSi5NkwfVB7DmDgX7ufu5xPxUWJr1TdtRFErLSq69xJijeknYWU81giJcAi+/9sq/5phz+yhQ1DeAjTtAARfyVF+fLgX6VvGz9uuuqtoQ0dp+FEtvBmVu71M4qduQD/GJhyAVIddz5UONQexvxwu8aoZYl2AsET2tMa2kyJqI0Fe4aL+4KMPumOKo9nu1Rw0jrCntx0HZxH7Ny2wb0MJIL5NuEHEJiCXhkSfen9G4hBV8mRrJzkVQKivcdk72YYYLoebKpDImcZCSG+jISMydf7FQV06CW1Sk6ijS06OpxbEmhZAMIbCnPjusHYcabVN8GQmnSOvVKeQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MsGfhJ/kuawLmuQBzcfz+jhvyCxeiUNkUBSrUgNB+z4=;
 b=knV3N8kIpPCGkrIphRYjbuEBZO1kRNS8FmBDHlJvzifZn9VU/pF0jMFNGNAdKdbiL/IplMfPA24zgnMmwGzSMFYX+fxfPqb7A8kzKaLJ5uhlCUSbS+uBrLtcjuBI5N/eqZFMLLR3SAPiXBGc4Qxz/BnsFw5p8j6nqkFJb9CqrF6fs5KmNy8AMUPmQU2GnDzt3t86qIB6J8eSsWycDOQRUe4LO49UVbTD0DOLtp5F3/adCSLFc3Kdb5QhaYPZLds6f9mmV+1CoTavbogYX9QLp5+ANYkF0up3prxW/tGFCh1liL0bxw8Hj35GxEJBrhMcYqTr+qD6CfGvTPlbLltAqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MsGfhJ/kuawLmuQBzcfz+jhvyCxeiUNkUBSrUgNB+z4=;
 b=GExN4Z/yfFaijNOGsdGYbaU5GzccVnBREGYNg/qV4sAj/SnqjrWDGuz3+of+WtshezlXzoC0YIxmOcyO38+hOGsm0DLVtBG1dm5e+IwnG0kdGNSMIiMofPuD4U5X4+wZo2USbVotBESELwCflIObFW4MtDnw2GKEsC4KIU3UNVw=
Received: from SA2PR10MB4684.namprd10.prod.outlook.com (2603:10b6:806:119::14)
 by MN2PR10MB4349.namprd10.prod.outlook.com (2603:10b6:208:1d4::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.16; Wed, 8 Feb
 2023 18:34:21 +0000
Received: from SA2PR10MB4684.namprd10.prod.outlook.com
 ([fe80::ed27:2f6f:22b1:39c]) by SA2PR10MB4684.namprd10.prod.outlook.com
 ([fe80::ed27:2f6f:22b1:39c%9]) with mapi id 15.20.6086.017; Wed, 8 Feb 2023
 18:34:21 +0000
Message-ID: <25b316ac-18da-cd63-fd36-472db6ae9b51@oracle.com>
Date: Wed, 8 Feb 2023 13:34:18 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH V2] memory: RAM_NAMED_FILE flag
Content-Language: en-US
To: Peter Xu <peterx@redhat.com>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philippe.mathieu.daude@gmail.com>,
 David Hildenbrand <david@redhat.com>, Igor Mammedov <imammedo@redhat.com>
References: <1675796613-235716-1-git-send-email-steven.sistare@oracle.com>
 <Y+KzMDdc+F9zHMh2@x1n>
From: Steven Sistare <steven.sistare@oracle.com>
Organization: Oracle Corporation
In-Reply-To: <Y+KzMDdc+F9zHMh2@x1n>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA0PR12CA0026.namprd12.prod.outlook.com
 (2603:10b6:806:6f::31) To SA2PR10MB4684.namprd10.prod.outlook.com
 (2603:10b6:806:119::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PR10MB4684:EE_|MN2PR10MB4349:EE_
X-MS-Office365-Filtering-Correlation-Id: 235f9d7c-552b-4641-cf44-08db0a03189b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: umtpFJropIXkoYaD4KFm+ndRWu5QIEFr5Fh2y+rjoUd+o8qVYBQwZkZbgAuJl5zTE76ysCE/rsOPHQf0/1wzmCXZFAmB2w+4+WryGloz0TZsft5F8syDT7D8Ad4bJq65NNO831ps3F7+7a7sviIGjjYV9qrw6HzRmZ+TZ3LoBs8iLMMSIhcQq90iXLHR96BUiWdR2UYTz2/Fj0vd9mGalMoRUVSn5bCOR73OfGzgXCZAI6yCS4XrB2q4DdvNDPNTAZ6nAfZF7j2PkySBxHKtj5kB6P9H51nMXn1pjq0Gvtx/EknLarYXtJTBssvyOWcNJs29V1IP8YvqP41zAduIRKzn9skA70ynQ0p2fWXqqruSB6cfm9qR+9LlELFdrF9kqrq1QHMZ/nM+cg3ELVabMwkByl7dJPMxHcZ7KAD2/D1Yhz+hFpdulu31ZyuiwEtS+F4hBU6NmQ85PRWpcxBStG3kIaG4/uqT0Mnp9a6kpGslaqseMqUBUEwhZna7VSXGPeeHTnP24wLnqbUzntpjRA4dAAU3TF+OC06uWuUU2vqDwi/ptXsG1jgw49sv+GHUNnGVRhfnHG2ZR16sNnUOR6qzbAQtyrwwWh6YdoK87kC5uhXIy6jeBtQ2pdhtsFm/RUDnoPY/A4gCRRlKwzp4iUDj+nH9+q7Zdgv06Ry/gwUD3gddXiA+TqNIn949O0eSS9ZVmP3lwnBDsXDAWVDOtIOMTMwOynoDWL6QYaXoQko=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR10MB4684.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(396003)(39860400002)(376002)(136003)(366004)(346002)(451199018)(41300700001)(66556008)(26005)(38100700002)(53546011)(316002)(186003)(54906003)(6506007)(36756003)(36916002)(478600001)(31696002)(6486002)(6666004)(6512007)(2616005)(6916009)(8676002)(66476007)(86362001)(4326008)(8936002)(5660300002)(44832011)(31686004)(66946007)(83380400001)(2906002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UWhOQ0YvZFZPSldiTk50bzZLdTdlcEkxR0JuaStaRlhCc3NodnROYmxYM2Fo?=
 =?utf-8?B?N0FHaVpMRkRCbXgvYm4zcHBwZCtEUU5oY0NMN3I1M090M0NNTHNPM0QxYWR5?=
 =?utf-8?B?UFYwZXBRdEY2ekM3ZmxERVBuZ1FwbHdzaVhCVzhKRVcxd3pTZ0ZxYWhLSFlw?=
 =?utf-8?B?UmhsWlYzVVNJZFpEVzRJeTQ3QkFScXMydUFsUSsvWnBZdUVHRFhmNk1LT25l?=
 =?utf-8?B?eU9vWEJia1poTzM5T0JEVERIZUVPVmVnWXc4SjlPZU5VN09qdmFRZit6Z0xO?=
 =?utf-8?B?ZW5WTjhKMHU5T2VKaVRkR0NJSGloQmpxK3lUd0l1cXZwQUoxTHdNQzBLUXVX?=
 =?utf-8?B?dnVYK1l2UUZMcmRsQ1NkYWprZnpvd3pyQ3B1djNtY1ZTWm1pRUlkYWJ2b1hO?=
 =?utf-8?B?TFBBOHlhcVNIMVVLSVpNNHFQSjloRmtCWDhnTFE2T3grWFlXUnNETW56QTdZ?=
 =?utf-8?B?L2J0VTAzT3c4bm5zajhNMGJYaTV6Z2pubFpvWjkrdFliSTFlSHVYT29LdmRp?=
 =?utf-8?B?UlVyWFZ1WEY3S003MjJJc1F4V01pd0ZjRHBqbnFWVVNqaEQ2VEYxTDRPTlFq?=
 =?utf-8?B?ZTI0Vys2SkE0Z1B3UnZ6VUtzdjJQUDJNUjhBV00rd294UjV0eXAxL0x1ZTk2?=
 =?utf-8?B?N0kyQVdHU2ZjYVZpVHUrbWZaRlFWVDBsK215YXZXVHEvSkFPU3ByTDdoUDNI?=
 =?utf-8?B?K1RmOUpidTJuRU13Z1lpVXJkb3VEaFhQSEltTHdXeVdiMWtCN1ZPQUV6aXpr?=
 =?utf-8?B?eVdjNVFzYW5CSlllU3ZXZVdxRXh6cmtqdU1QNkhzUjJIaU1aNlVnTGZ5VFBl?=
 =?utf-8?B?THl1VHlIVDZQVGpOeW9NaHFIT2xOVWxNU0hxZUZHRTF6RlplaGM1b2YvY3M4?=
 =?utf-8?B?MUcrZU9nOUF6ODZQVWNla2pwVE9aNGhtZzhueXFsQmNyT0ZvcnVmaHh6Y3VF?=
 =?utf-8?B?b0lwNlBwSG5QcVprK3VUekZUd1Y0TUpCSWt2ZG1EMjZpQXNZRnVXSnFHQ2Rl?=
 =?utf-8?B?YytIeDRnbHVtSjh1anpFRjNOZisrNDhLcXorTHdhODB2OCtGUXQ0OU4vZWRB?=
 =?utf-8?B?alZ1ZE9JS2syQnR0RU5XYW9QN1lIUGJucDhrMm1sdndqT2JaL09OL09kZzhs?=
 =?utf-8?B?c1JtQS9VQW83QnYwSEE3M1AzNEgxQnp6aVlMWWUxVmxEL2dVNUJJaEdSd01C?=
 =?utf-8?B?bGZMT2RtZEFLekFLMmcybWhGbHYwWjN6OFJWOEFWS3VCdmhYc1RrS2pTUjJq?=
 =?utf-8?B?cEp4cjZSU1ZEQmtjUFRMeTBtL1lRMGIybXFYOVA0dkdtdkhSb3NBSEN0dXVm?=
 =?utf-8?B?YXUxUFZGTEFGS2F2bEtQbDJseWJGdnVKYWI4UHoveUtwUFM2SlRQYU9lekVi?=
 =?utf-8?B?Q2ZXNXZSMEZhaE9kQW9oakhVZ3FxeEJOR0xqVDZLcjVPUTFoaVBScG52M24z?=
 =?utf-8?B?c1RGQWRjamRseWZ6MmVSZWRwZlRSa0Fzcldpa1NVWTdVQmFPaWRaZFQ0dk1U?=
 =?utf-8?B?bytqY0FzOHVoQnNtZUJkTEtTZjFkUDI2anVtb284U0N6Z043b2RtQVZ3MTRJ?=
 =?utf-8?B?S0pPOEUvQndVRnJML21ETndTVXE2cS92SHhOaThuckxNMitSK1RnbFgra0Nh?=
 =?utf-8?B?MDkyMTVueTdncVVEdEdlY2tvN3h3WmQ2MWxGcjZmVzBhVmdHSlBUd0F1Mlk3?=
 =?utf-8?B?TWF2YkV0ajNHcy9meG95bkgyckRBU1FHcWtadmp1SXlEUlZDZmhMRXcySEgv?=
 =?utf-8?B?VDFNM3ZoVGhPRnlwUk40SUtvVDFJWFRyNm9qOVBlRy81elB4WmFrZWhGalU0?=
 =?utf-8?B?d3owUGxjbGFkMGJSaXZpeGk0NTkxV2tOQm14T09VRm1PVHNVRjJSYm54WStj?=
 =?utf-8?B?eTQ4U21XVzgvQ2VUNFd0RDlJaktkaXpWbE1iMzdDRENLQm9Vb0t5dGM0eFdn?=
 =?utf-8?B?cG9aRDF5L0s5VlNrNEtMUXBLUExpeDhNTklVTjRYczNNZU80ekVMRGtLcTA0?=
 =?utf-8?B?NE1abkVacGg3RGVMV1piOXVQYlVaQTRITjhpc243eG1sUFoxanB0Q3RhWXlt?=
 =?utf-8?B?VUFNY1FyUUltZnZzZmNTeHI2QVora1JGWVY5VCs1L05DWmdNa0kwNGwvTHgr?=
 =?utf-8?B?TWRXZzBjc3pRU2prakxYaVkwTGttem5aZ3hZUFZaL1owMU41bktGbEZ0Qnh1?=
 =?utf-8?B?c3c9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: u2eNj1rfPLcrNlE7gWeCgG8Ma1GppVEYw+qS719xYLv++o5W9raoDtOZ6LEmjfO6S1MEatcKjmMht+1GiFqlAgRDbYIzqliTZ3ApFgSnSyFMRvRCQ2bUIDUdVlVy9CPZ/LmkXdwgWjy+Jjb6JWUS5cnTcf7QfFnCEbO18n/5E2/03XdKgxss479sVkoga0KoXo6AKMLv4M3DGR4jl63JmrVIhFW9CVTzHUvJfQQ4yLGsCejTYUGozqtXVlVRwb9Jw/o/YMZ15tn/px9dRqvKvJpuVaiAEUCQuS4Rhss1fK5d+kNEeqmjEZOrcdzJ69ElVLVnzMBdpZo34vnxNO2HIZmYj1mqMd0Edg1U7hx/AHuAm+k4lXQNAHOVCy9PZdcUvX7UbD8ZpXyYG87Dklqu0SeGxZS36xWeJB5QMsc6UDCA8QqmypDqsA/O5PoRtP1g9TZOShScHTgQXedKmIJjp/L4wWkNG9PoI6+vnBa7NbJl9UYsoPz2eu2929PX+rikU9OwK+PWAisq/kUOaLm+RIjYgA7ZGrrk6pn69o772Hh6GG4efm7aJ6dHYcdy/mOZCIG5jaU6kpck+bzNA/HHwK4sa0RouY0vGEhoERdIJczj+MRIH9+AtGNxce4vpfLN7EzAHUdEdbSB/JdpPg0ZKkAAX7ggsyb0uhhNlOkQbSfiYvW9xgDlyZHT3QEVAJhp/zkh/hPEFhcFROIOCjyqtzUutq3Q9PlwMzqb5qYHOtFj553v8RYgg7CiRIcXFdCGGBt7rwOcZRh25LMK5tdSfSatxHS+h27wKSV6HsLgh2M=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 235f9d7c-552b-4641-cf44-08db0a03189b
X-MS-Exchange-CrossTenant-AuthSource: SA2PR10MB4684.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2023 18:34:21.8208 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bqfnGG6vR0xYqfB9Fz3JTSTdqCp2umiktpfVKn6oukAAkAOlos2QnfN4qObM/FQKq6o7IB9AB/iupWunwq4QmsjvvYFYEja0WP49oycXkl8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB4349
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-08_09,2023-02-08_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 bulkscore=0
 malwarescore=0 mlxscore=0 mlxlogscore=999 adultscore=0 spamscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302080161
X-Proofpoint-ORIG-GUID: wlhq4LiHXpbDUX7JQZIMm1ExkqVfpp55
X-Proofpoint-GUID: wlhq4LiHXpbDUX7JQZIMm1ExkqVfpp55
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=steven.sistare@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.146,
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

On 2/7/2023 3:23 PM, Peter Xu wrote:
> On Tue, Feb 07, 2023 at 11:03:33AM -0800, Steve Sistare wrote:
>> migrate_ignore_shared() is an optimization that avoids copying memory
>> that is visible and can be mapped on the target.  However, a
>> memory-backend-ram or a memory-backend-memfd block with the RAM_SHARED
>> flag set is not migrated when migrate_ignore_shared() is true.  This is
>> wrong, because the block has no named backing store, and its contents will
>> be lost.  To fix, ignore shared memory iff it is a named file.  Define a
>> new flag RAM_NAMED_FILE to distinguish this case.
> 
> There's also TYPE_MEMORY_BACKEND_EPC.  Reading the commit message it seems
> it can still be used in similar ways.  Pasting commit message from c6c0232:
> 
>     Because of its unique requirements, Linux manages EPC separately from
>     normal memory.  Similar to memfd, the device /dev/sgx_vepc can be
>     opened to obtain a file descriptor which can in turn be used to mmap()
>     EPC memory.
> 
> I'm not sure whether it means that should apply for RAM_NAMED_FILE too,
> neither do I think it's super important..  Still better to define it
> properly.

The RAM_NAMED_FILE flag will be false for TYPE_MEMORY_BACKEND_EPC, so 
ramblock_is_ignored will return false, and the contents will be copied
over the socket to the target, and the segment will be recreated there.

However, perhaps I do not understand your point.

> Another comment is, AFAIK this patch will modify senamtics of the old
> capability "x-ignore-shared".  But I'd say in a sensible way.  Maybe worth
> directly modify qapi/migration.json to reflect it (especially it's x-
> prefixed) to something like:
> 
> # @x-ignore-shared: If enabled, QEMU will not migrate named shared memory
> #                   (since 4.0) 

Good idea.  I propose:

# @x-ignore-shared: If enabled, QEMU will not migrate shared memory that is
#                   accessible on the target. (since 4.0)

- Steve

