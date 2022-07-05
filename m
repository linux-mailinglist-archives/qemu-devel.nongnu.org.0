Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B81A5676E4
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jul 2022 20:53:27 +0200 (CEST)
Received: from localhost ([::1]:48276 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8nfq-00045l-FM
	for lists+qemu-devel@lfdr.de; Tue, 05 Jul 2022 14:53:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38426)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1o8nHs-0004q8-Pl
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 14:28:40 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:20608)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1o8nHo-0002YG-UU
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 14:28:39 -0400
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 265HEW99003074;
 Tue, 5 Jul 2022 18:28:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=asIQJoAGaua2IFAdoJhuNrCQhhHMwjCA/4yU0ogpUp4=;
 b=Y/kuKWwp9g3iCnilcNUyW+DY3VdT+zzzBW0nNvofF/ugZvABkZFq9LS8Q2b2AHi+4nda
 1sW8mARcyvMVQAbbJ3HeK1cIAWDX3vhnQJwLfQcMqPkV7dZCpL7wLFk5Ip6XUQsXx6me
 bkqe6FLmPvmHXo0JCjwX9aWQ+uO24F9Al6e2T/fTJrext8gftTYJQ+Cb55qyVg74iFkm
 6v/zCX+TUuOOYzSb/vtEbzh7h2nMSER64+kXbsqnKgEw1Mxmj2KQ85MAlF4Kh3rHQiwU
 Bwoiy+k3+Vm2NqPu7kVgddSNo9lIqLnt5+uEHPq9rcvOVU+kL+qcwPDIeABqmQ5pqq7v Rw== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3h2eju706x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 05 Jul 2022 18:28:22 +0000
Received: from pps.filterd
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 265IPq8V014422; Tue, 5 Jul 2022 18:28:22 GMT
Received: from nam04-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam04lp2177.outbound.protection.outlook.com [104.47.73.177])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id
 3h2cf2keu4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 05 Jul 2022 18:28:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Cu2zjX7E/oeT9QoEcFimsIxMvylHbVLXN7ruPbUDrex8So5nijB5wAfAEKECjkL/4hTvJwXJoByNsZ6hubO1x3934v/sXGqE4ow/8V5Xr5MCIvDT0goX6/9VgDSTq4sa4xeY8eWH7BJgR57rPqibWMdXX47fJvm0cw2p/gZUrnGd8y4tKuINp5eiREKBjrfWAPxADQ663Drj5Y6IXyJLGinEY26oygFleczPjsZa5ameIrYVVmhikueZjKxspoxLz2yiqqLUb7EFuwTX2XkphClkfsVEukLZ1I4vpTu0hdT3gzFXaAyO8bZNhSB2YgONRBkEwWciQY2xlGSRomj8ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=asIQJoAGaua2IFAdoJhuNrCQhhHMwjCA/4yU0ogpUp4=;
 b=GVR6xkoHexXBxlJ59ADvtVEGHqez26lxHlKkAXmRK7k/ie8g4hupqsK2jgGV2JmK21jgQNJP8l5A+tY5QNaXN+Ma5AnIUZjeec+GuEHszPRKbPWEjEA9EtLnH6bRhTUcBZFOXvs73cIKEs+zki1PRs85sJtEKXOM72AEhsEvy44QzF+Qvd2HKGq933Udg8WgWDcHlg9OQ606O7Os68zw1dUjFd/BqCD2P+YyV0AzdMC/Yhe8slFfQVGOQHXn4xHXiCcjF0JRT42nooyGOfZtwT2aAW02PaCSzs2D10ibxly3RqRuB/jwBvzsEGZxkefLtKKs2EkJfNrWYPEzXfOU7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=asIQJoAGaua2IFAdoJhuNrCQhhHMwjCA/4yU0ogpUp4=;
 b=hmvMNqoMR9mPM8MQjsl9YfRD85ETcVBor76IVA4vQbeSVFQ0Sv97e/oTTeGWScgEA4ylnHD9HAIZ+1ZzKwqzK14GZq+TVQI5gxt9dnZN/NX/o1C+t/3otaODNmUkHI6LDOinBD3HhM+fqDjBoAw8hUB8sYoV9sbrYlIUMiK2cEo=
Received: from BYAPR10MB3240.namprd10.prod.outlook.com (2603:10b6:a03:155::17)
 by DS7PR10MB5341.namprd10.prod.outlook.com (2603:10b6:5:38d::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.15; Tue, 5 Jul
 2022 18:28:20 +0000
Received: from BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::dc4d:56f4:a55b:4e9]) by BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::dc4d:56f4:a55b:4e9%6]) with mapi id 15.20.5395.021; Tue, 5 Jul 2022
 18:28:20 +0000
Message-ID: <49727d69-5d41-51ea-b1a0-57dfeedf5fcb@oracle.com>
Date: Tue, 5 Jul 2022 14:28:14 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH V8 14/39] qapi: strList_from_string
Content-Language: en-US
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@gmail.com>
Cc: QEMU <qemu-devel@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>,
 Jason Zeng <jason.zeng@linux.intel.com>,
 Zheng Chuan <zhengchuan@huawei.com>,
 Mark Kanda <mark.kanda@oracle.com>, Guoyi Tu <tugy@chinatelecom.cn>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philippe.mathieu.daude@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>,
 David Hildenbrand <david@redhat.com>, John Snow <jsnow@redhat.com>
References: <1655304746-102776-1-git-send-email-steven.sistare@oracle.com>
 <1655304746-102776-15-git-send-email-steven.sistare@oracle.com>
 <CAJ+F1CL8Pi5PFX+4Uop88ONjXozSS1cArWUt6UrnmPkrUHB3ew@mail.gmail.com>
From: Steven Sistare <steven.sistare@oracle.com>
Organization: Oracle Corporation
In-Reply-To: <CAJ+F1CL8Pi5PFX+4Uop88ONjXozSS1cArWUt6UrnmPkrUHB3ew@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DM6PR06CA0054.namprd06.prod.outlook.com
 (2603:10b6:5:54::31) To BYAPR10MB3240.namprd10.prod.outlook.com
 (2603:10b6:a03:155::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 61f9efcb-1a4b-4dca-d21d-08da5eb422bb
X-MS-TrafficTypeDiagnostic: DS7PR10MB5341:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NwyQUNg1rPS7ad37zXC4u5ZQEH9T4lZZhlyYMECjMXzqRmMZvv2l7dYxSKPoTjQWDrbdOrwaETDvev8L3fXz9QvhH2DB52wyd6FhARmBSnkEbHFkIeVcULYcYlJxcSThC5dNmZ3DNkwJvrvzevkNSIEnlHZC0Iy3lHvi+j2/aE3OIeME/QMjL5RO5uqP6SwHV22RCIopzKXI6LjWaMqhMwuCoA6LGywDGD/eLm9r+QpamXcmUKm3XIxDMUGu1LGRea/JPKs6I3g7LqDaJvnFMNw2U4HuNZLsiyPcPUC2zOKTHN07VZD3+UME2AyqJEYzI1HNGjVOEjDSZ5i6ojdHmXJs+rkHp+5LBLwL+Bu6p7yt2nRsgBjDElS873uJjaChf272WT2L22xOWxOpbkdKjLZBWHQZoObMnPQW1RYWwUR2GrJV6aJr3CA03xf7TUO9P6U6vSIpVAz9Cocw0uZ6ZJcdrWve/A6BmAJkz159AlkUg30DpEF5qjOu4jeSO7WYDjrr0gWa9SNKAna74JWBgiz80oXq9gC4Nurv2TtBNhZSWWDF6kjwlcgpm6pTLKKorkSFMNY2A8e3WOy41EiPGLVBS/yQkCvZOClw2dcVZ7/bIPSWA0p2iY67k+1gQ9NO2T/LxhJk58aEY348KPvuKhW/S9yVTDiNTDmuy+KanAv2PeFYolzrvAvQbu0Fl3edrgkrBtdqLUJBpz9OvgrUA+EjPI5Uosy5f7b1iqc7ECbys30/3pQ2jA6VAObKH3/xx06eSKP0RbJ3onghNNexIMEVUJGfNAHkVnHYRUXRfqxeL7HvzzRjr7FPXnpBENYXqFMeWMNr2W1rGNtDygF/RCoRlmc0fz0n1rH0G8BU1vtLfgybMmIzCtGs0A6N/PaC
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3240.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(136003)(366004)(39860400002)(376002)(346002)(396003)(36916002)(8936002)(7416002)(5660300002)(54906003)(4326008)(8676002)(66476007)(66556008)(66946007)(41300700001)(86362001)(31696002)(6666004)(6916009)(316002)(186003)(6486002)(26005)(36756003)(6512007)(2616005)(6506007)(2906002)(53546011)(38100700002)(44832011)(31686004)(83380400001)(478600001)(43740500002)(45980500001)(309714004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c2Z4N1VlQlFmejhlQmdpT3lJWHQxOFhZck9WZDN5dHBGcTFTcWlKZ0E0ZW1k?=
 =?utf-8?B?WmlQVFlBSlN0RGcvWFIrSW54bVk0LzFBbmk2RmZrZHVUU3h6Z3g3R0ZiOE5K?=
 =?utf-8?B?ZkZweU1pcUxKbzY2Zm9vQnJUa2xoMFZrZWdWSWFrN3VndmxVVjBkcnBoQWpE?=
 =?utf-8?B?K080WXUrWU9oOTlhOXJyQ2tyNW1mTXBBQTJNWkRWQW5RWFpSNVpFbmozY0dv?=
 =?utf-8?B?SFNlWmZ3WVh0a0hwb21RSnlkTHpHRXU4em1iSGFVY0RqOUVkanN4cTUyUTN6?=
 =?utf-8?B?NnM0NTBubTNMQzFBQUxVaXlyb0JRNkZzVGdBMzcvWEhFcW5td3NWOTkrRkc0?=
 =?utf-8?B?K2pFYmdpYlpVWnFzRFR6Y1dnTU04enM2bzQ1OFoweHVNcmJoT1RQSW8wVW1O?=
 =?utf-8?B?M203cFFtVlNuU3VJNDBxaE1XMU5hdTRPS1BTN1VYS1ZOUG5BWTV0a1N4SnI0?=
 =?utf-8?B?OHhvTHF0eGk0ajZkNEVjQWYwd0gzaVNwdWNzQVlMK3hUbXowR2ZjdWhSYzVS?=
 =?utf-8?B?bnZSckl1SGc5TWZjTnJuVzhVa2RwNXFDaUtUeXUwM3VxT0xJaU9tVTVYckVU?=
 =?utf-8?B?V3R3WkloaXBTWDdMQmwxMzVvc2pnNitNa3oxWWY5WWQ5WWlhTnJhMk1lQmxv?=
 =?utf-8?B?bDhmL3pROVViVVBHMFc1eWQybUJzclFlSGliOXBOL2ZFQWZrdUx2Qkh6MjQ4?=
 =?utf-8?B?ME54YjJ6VzFCNlJVc2k3RVI1V29TSGtRaElFR3hKTjRoRit6Q0FPT1NabFJW?=
 =?utf-8?B?Vk9Gc1lEMHhnRll0UzNKbTdpLzF6MUJJZ3E5UWVqK3V2V0hzRC9PbjNzY3h3?=
 =?utf-8?B?RDVGVExUZnA5YlJoenJmZlhGdG5sTTUzY0ROVkN6Y3N4VzVyUUdLTHUwUzRE?=
 =?utf-8?B?cnd5d2FDajNpbVNRM005TUU0WXMxbllyWml4ZnlTOFROVHlXWUtuWkdDSFQ1?=
 =?utf-8?B?di9DT3BKS0NKa1NvNmNNNUQ4U09XSkQyTCtTUktIb2g1U1lqQW9jUWNqNmx6?=
 =?utf-8?B?dVliZnM0NDdRR3lQMzZlYjF6dWVrb1FyS3ZLN1ZDQ2ZhMmZ2dU9XNTZqL09t?=
 =?utf-8?B?YUl1eFdnZGl1ak5vMEU3OFU0UWVqTlpaMlpXZkNETWNOcDkyUWpCNDhINGUr?=
 =?utf-8?B?NGRrU0V6RmZaNWxyV1g2VVY4UHBMRlhzMnZ1aVpGc1hvQzdPWjlRYVpLM2tx?=
 =?utf-8?B?MnZGbngyaURKMXUxT09QK2tzajJsY3pKZ1ViMTdEVDF1OU4weWs4eHMyTWpD?=
 =?utf-8?B?dWRZY2lrUkNETFF1WEZmdVEwdlh6YzM0WjdkRStUYjNCT0VHajZVVGR2aHBB?=
 =?utf-8?B?YWY1djQ3WDBsYVE4b05ENG9jVkFGQ2x3K3Y1bC9yREJneVRyeU9KWlgvakxm?=
 =?utf-8?B?b3ltdG8xaGhTZE02OTFOQkQ0NkE2SkpMRk5SUXU4eDdUMkVnVHJ2YVlsaUVk?=
 =?utf-8?B?Z2sxTUpuMk54RU40bnI5MUxrMGFOZXY4bVlmNnIzL0JiZGFtY29HOTFCTW1o?=
 =?utf-8?B?ZWtYQ1dNUUUvL0tqNXRQL1hzLzhqSnd4ODQ5K2R2ZFJwS0p3NzQ0SU45TTZK?=
 =?utf-8?B?dGtlSml1MjF1T1NTWFgrWFhyL01mczdNV1FrNmd5RENCazU3Y29aU0kvZkpV?=
 =?utf-8?B?a2l1cStuVzJUL3RTaDlDUk04ODUxZXlGVHM3NENITXFGaFcrT3p2QnUrMVhE?=
 =?utf-8?B?VnE4V09DS0lMUkx4R1RmenM0NzBkSG83QXFiOGJyVDBXcThPWWI2cmVQbjRn?=
 =?utf-8?B?QVE5UjNtL2NtdUxYODN5V2I4NWdOaUhLVk5ZZ1NtMUF3RlFMYjFySWREQ3Vo?=
 =?utf-8?B?ZEZQR2VCVm5sbWNQMXpBVE0wdW1nZ0VzbW5uNno1cldVMThhSTg4SkQrSThN?=
 =?utf-8?B?S2c0anNySTh1T0xuTlB6SXJ5N0hzYzZGQXMrSHRsS3ZWdk9FMXY3NDN4K2Fu?=
 =?utf-8?B?THdWY1A4Zjk3YlFyakVpR0huMkNVdnBmcUJqWWVkdS95TXJkbjZtUjBJT09G?=
 =?utf-8?B?dW9vY0swQUFPSDd4TGhGTzJEQnhySUxvbjVrK0pOR1BsOEFIcG14VDdSeTk1?=
 =?utf-8?B?MHhWMURaUHZzd3FWR1ltVFhHRFg2a0ZLb3hHRmhYUnZZeFVmb1J6T2pNK3kv?=
 =?utf-8?B?dmh3UnlydVl4dXlJWkVSaFRZMmtweFNOYjZ5QStQd3diYXVjZzRZU2FBVHJy?=
 =?utf-8?B?S1E9PQ==?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 61f9efcb-1a4b-4dca-d21d-08da5eb422bb
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3240.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2022 18:28:19.8704 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dIRj1Niu5TIhYdFZ6pApwIX9iA6uYdFMvXhyGUm/FxRgw9R5y2z6LnuVNlnAdcCjtoeop5Q6zpNceON9CZYi0YhhXLiivcAcjzELKk0bNXc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB5341
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.517, 18.0.883
 definitions=2022-07-05_15:2022-06-28,
 2022-07-05 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 suspectscore=0 mlxscore=0
 mlxlogscore=999 adultscore=0 spamscore=0 phishscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2204290000
 definitions=main-2207050079
X-Proofpoint-GUID: aRQbtHr3fooB3BhpGUQIsufNE06W36Pd
X-Proofpoint-ORIG-GUID: aRQbtHr3fooB3BhpGUQIsufNE06W36Pd
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=steven.sistare@oracle.com; helo=mx0a-00069f02.pphosted.com
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

On 6/16/2022 12:04 PM, Marc-André Lureau wrote:
> Hi
> 
> On Wed, Jun 15, 2022 at 7:04 PM Steve Sistare <steven.sistare@oracle.com <mailto:steven.sistare@oracle.com>> wrote:
> 
>     Generalize strList_from_comma_list() to take any delimiter character, rename
>     as strList_from_string(), and move it to qapi/util.c.
> 
>     No functional change.
> 
>     Signed-off-by: Steve Sistare <steven.sistare@oracle.com <mailto:steven.sistare@oracle.com>>
>     ---
>      include/qapi/util.h |  9 +++++++++
>      monitor/hmp-cmds.c  | 29 ++---------------------------
>      qapi/qapi-util.c    | 23 +++++++++++++++++++++++
>      3 files changed, 34 insertions(+), 27 deletions(-)
> 
>     diff --git a/include/qapi/util.h b/include/qapi/util.h
>     index 81a2b13..7d88b09 100644
>     --- a/include/qapi/util.h
>     +++ b/include/qapi/util.h
>     @@ -22,6 +22,8 @@ typedef struct QEnumLookup {
>          const int size;
>      } QEnumLookup;
> 
>     +struct strList;
>     +
> 
> 
> suspicious, you can't include qapi/qapi-builtin-types.h here?

Nope.  qapi-builtin-types.h includes util.h because it needs QEnumLookup.
See the code generation in types.py:
          self._genh.preamble_add(mcgen('''
#include "qapi/util.h"

- Steve

>      const char *qapi_enum_lookup(const QEnumLookup *lookup, int val);
>      int qapi_enum_parse(const QEnumLookup *lookup, const char *buf,
>                          int def, Error **errp);
>     @@ -31,6 +33,13 @@ bool qapi_bool_parse(const char *name, const char *value, bool *obj,
>      int parse_qapi_name(const char *name, bool complete);
> 
>      /*
>     + * Produce a strList from the character delimited string @in.
>     + * All strings are g_strdup'd.
>     + * A NULL or empty input string returns NULL.
>     + */
>     +struct strList *strList_from_string(const char *in, char delim);
>     +
>     +/*
>       * For any GenericList @list, insert @element at the front.
>       *
>       * Note that this macro evaluates @element exactly once, so it is safe
>     diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
>     index bb12589..9f58b1f 100644
>     --- a/monitor/hmp-cmds.c
>     +++ b/monitor/hmp-cmds.c
>     @@ -43,6 +43,7 @@
>      #include "qapi/qapi-commands-run-state.h"
>      #include "qapi/qapi-commands-tpm.h"
>      #include "qapi/qapi-commands-ui.h"
>     +#include "qapi/util.h"
>      #include "qapi/qapi-visit-net.h"
>      #include "qapi/qapi-visit-migration.h"
>      #include "qapi/qmp/qdict.h"
>     @@ -70,32 +71,6 @@ bool hmp_handle_error(Monitor *mon, Error *err)
>          return false;
>      }
> 
>     -/*
>     - * Produce a strList from a comma separated list.
>     - * A NULL or empty input string return NULL.
>     - */
>     -static strList *strList_from_comma_list(const char *in)
>     -{
>     -    strList *res = NULL;
>     -    strList **tail = &res;
>     -
>     -    while (in && in[0]) {
>     -        char *comma = strchr(in, ',');
>     -        char *value;
>     -
>     -        if (comma) {
>     -            value = g_strndup(in, comma - in);
>     -            in = comma + 1; /* skip the , */
>     -        } else {
>     -            value = g_strdup(in);
>     -            in = NULL;
>     -        }
>     -        QAPI_LIST_APPEND(tail, value);
>     -    }
>     -
>     -    return res;
>     -}
>     -
>      void hmp_info_name(Monitor *mon, const QDict *qdict)
>      {
>          NameInfo *info;
>     @@ -1115,7 +1090,7 @@ void hmp_announce_self(Monitor *mon, const QDict *qdict)
>                                                  migrate_announce_params());
> 
>          qapi_free_strList(params->interfaces);
>     -    params->interfaces = strList_from_comma_list(interfaces_str);
>     +    params->interfaces = strList_from_string(interfaces_str, ',');
>          params->has_interfaces = params->interfaces != NULL;
>          params->id = g_strdup(id);
>          params->has_id = !!params->id;
>     diff --git a/qapi/qapi-util.c b/qapi/qapi-util.c
>     index 63596e1..b61c73c 100644
>     --- a/qapi/qapi-util.c
>     +++ b/qapi/qapi-util.c
>     @@ -15,6 +15,7 @@
>      #include "qapi/error.h"
>      #include "qemu/ctype.h"
>      #include "qapi/qmp/qerror.h"
>     +#include "qapi/qapi-builtin-types.h"
> 
>      CompatPolicy compat_policy;
> 
>     @@ -152,3 +153,25 @@ int parse_qapi_name(const char *str, bool complete)
>          }
>          return p - str;
>      }
>     +
>     +strList *strList_from_string(const char *in, char delim)
>     +{
>     +    strList *res = NULL;
>     +    strList **tail = &res;
>     +
>     +    while (in && in[0]) {
>     +        char *next = strchr(in, delim);
>     +        char *value;
>     +
>     +        if (next) {
>     +            value = g_strndup(in, next - in);
>     +            in = next + 1; /* skip the delim */
>     +        } else {
>     +            value = g_strdup(in);
>     +            in = NULL;
>     +        }
>     +        QAPI_LIST_APPEND(tail, value);
>     +    }
>     +
>     +    return res;
>     +}
>     -- 
>     1.8.3.1
> 
> 
> 
> 
> -- 
> Marc-André Lureau

