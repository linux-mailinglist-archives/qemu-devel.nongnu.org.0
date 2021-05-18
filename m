Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D5CE538816D
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 22:31:18 +0200 (CEST)
Received: from localhost ([::1]:56426 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lj6N3-00072b-Sy
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 16:31:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43688)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1lj67Z-0007ve-5l
 for qemu-devel@nongnu.org; Tue, 18 May 2021 16:15:17 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:45720)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1lj67V-0008Bp-Ai
 for qemu-devel@nongnu.org; Tue, 18 May 2021 16:15:16 -0400
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14IKCw0N026553; Tue, 18 May 2021 20:14:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=lNksrb5Q4RIoaJuzkN3hVbaJTNpeMpdB8MB7YfQW75c=;
 b=c325oVapGrH6rptmHrYq4ytwsv3YNshEiYUv7GtuDe3EDnAeJJmwg7y3gHDBrdQDboyx
 WEDCzrXvNGWsC3fyaw6b+6szKZw9u/Tu8k5BDrJn+03laLGS+uFRS5nxOb+Q7fZdZaHs
 ywCood7PzC/TvdJFW4YUqDwqn5NBNwT5UnyrhKT8ook56E171n0THtGJ9V5opSmCTZ1M
 ztVC1gf4W73RnVTnlk1enRd/xWltBZmVJ+O5SVKXuK8YOgziz5zZwvvW1QJX18U52Jt3
 gJnhia3/8v/VGwtEgcvTIGOTKvRhv3/ZeZASJ0I7lcFq35dkMWtzRpaSKFXI0tdlS882 PQ== 
Received: from oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 38kh0h8tnm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 18 May 2021 20:14:09 +0000
Received: from userp3030.oracle.com (userp3030.oracle.com [127.0.0.1])
 by pps.podrdrct (8.16.0.36/8.16.0.36) with SMTP id 14IKE8Ne100366;
 Tue, 18 May 2021 20:14:08 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2104.outbound.protection.outlook.com [104.47.70.104])
 by userp3030.oracle.com with ESMTP id 38megjth21-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 18 May 2021 20:14:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k8A6Run83GYPMJ7LAlL+hVn5VDHfhQGyxa8BWIhS/VUzDi1nR5LYST4QPA30IFn+bOE9rGYMBXPbLWchGdZk5YN8lPKltbPp6u6o5+heSfNdOHrNZtZPXTVXJgOlhvWc9UIx3Xw4c2FAPdwzhqML50WQeCbJc9QwXM2Ml8YtcW0nF/s6JALWKHa2kBeypfuyVAlAfV0/4+FRAuIVj0vXtcsqFq1GmoSOoK5ekxdi+9eN/z2HpJxH16mY2eybllvfMuvw7SgVFhjRQfbedmIOvq/AVvZL7m8Qj1LiFVmGwsz74uZL/4JVHTf9JnPlKXkNpU2gskUcY4BlgTmrHSy8tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lNksrb5Q4RIoaJuzkN3hVbaJTNpeMpdB8MB7YfQW75c=;
 b=WC4WUiPut2363Xq1ol0nyVBW49x1Jo27LvSW7kDxczPfYpKMI9XcKX9iqrYzk2ZL7YarEd4kocCz6YNCvbPQAtwFFiMYP4iKdV4DXcn7gDnnUkAZY7rv723ZVwutsz01RmbNqWHzqDNZnDFT6evJur8BIQXFnjxOD6WKwjkoB5ABq0yZ2ELN6jIWTPJXNnCM2qI/a3UxvcCjNfhir3Quqqha+QxE7L5hraKtWnLC8UT4aLZG8rbra1Zf5KWBxc0Sx7BYAeNotiPr/ZAsxtfnqMQBuK+N/KPDG1Idq96b5PF94aHFHicGP/QnPJ1BWV7akojXcb5pgWTfUoQ6w6XSLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lNksrb5Q4RIoaJuzkN3hVbaJTNpeMpdB8MB7YfQW75c=;
 b=fLtQcgcKe79UQ7okkHvI5TLcL1Az24gLPviIA0NL/5ggQjcOAWfoG6UeWKBXtWWAqIegkEn8sBKYlUcBCg+YY0S1xbl6oF+JlGGwkRbuJgLbM7TV28DE5PiesjkBVb/t4n2ol5xmvv0q4/qqm4qpi/LKlQxP7IMhCeprG9ZMy/c=
Authentication-Results: oracle.com; dkim=none (message not signed)
 header.d=none;oracle.com; dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB3240.namprd10.prod.outlook.com (2603:10b6:a03:155::17)
 by SJ0PR10MB5472.namprd10.prod.outlook.com (2603:10b6:a03:303::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.26; Tue, 18 May
 2021 20:14:05 +0000
Received: from BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::6ce3:f0a3:c303:f851]) by BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::6ce3:f0a3:c303:f851%7]) with mapi id 15.20.4129.032; Tue, 18 May 2021
 20:14:05 +0000
Subject: Re: [PATCH V3 00/22] Live Update
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
References: <1620390320-301716-1-git-send-email-steven.sistare@oracle.com>
 <YJwFkhlYISA9INwO@stefanha-x1.localdomain>
 <4d3dd5ff-5180-16df-ab48-11de610dd396@oracle.com>
 <YJ5kokhzyA5tCom3@stefanha-x1.localdomain>
 <29356c3a-0b3f-2773-4f9f-18ff4ed4d5bb@oracle.com> <YKOPnkefxgRZ8PoQ@work-vm>
 <a1d3dfea-d15e-35a3-a216-3ce65600f2d6@oracle.com> <YKQULUn5F+x1wrYI@work-vm>
From: Steven Sistare <steven.sistare@oracle.com>
Organization: Oracle Corporation
Message-ID: <38dc91ab-b96b-1cc3-bf8b-84ff77b334fd@oracle.com>
Date: Tue, 18 May 2021 16:14:01 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
In-Reply-To: <YKQULUn5F+x1wrYI@work-vm>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [24.62.106.7]
X-ClientProxiedBy: SN6PR01CA0030.prod.exchangelabs.com (2603:10b6:805:b6::43)
 To BYAPR10MB3240.namprd10.prod.outlook.com
 (2603:10b6:a03:155::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.92] (24.62.106.7) by
 SN6PR01CA0030.prod.exchangelabs.com (2603:10b6:805:b6::43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4108.25 via Frontend Transport; Tue, 18 May 2021 20:14:03 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bb82b124-a89e-418e-d759-08d91a397c32
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5472:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SJ0PR10MB5472E691E0190EB69C171673F92C9@SJ0PR10MB5472.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3276;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BJzNtC1etbyBAEq3EL5zFoGi2IxSRLyFq01OMJzXLe3hU+sc9Fw9fnNyKywSCWq/iWDHdQ2DJu84Vdd3pk6VFUZX+XmA0uCI3bcUzvNhKIr+AOliGvZueDtYbGH8XNRoRxkiH1rKRv1L3dz3ByLN641/dweClyobWg8x2U1lS5HBotd3QjbPWd/Iq+zlmX0w+6cxH/CRQIQqMMxuegpX39mGYN9/coOeMSrhUMMCn9wvkxKPtThxQP6JpvGODKiVFLyZzNDphwBWEVvaVhmaKfFqrzD0tAGyvZmxRoBguVLkpa3RBrEL5w1rFqkyLMQlX0tc04hEpUr6hwiAjdw5wk9fRwYr8BM/wrxnCAQen7BaviwMCnrkuFeFlSQhPfoDwg5PePfkNGOenQMe0PYlyOuUatRVzSYC4nuGQhE/H7dj7CYXs5M9j/mmgjmEoEyTng9mMv7d8xlQ+V1ZANaIP/qJ9aSQ57s84PlNSVZuF+wLOKhqWGXrQespRSPQmKPnW6UZ1NVi7OTJBxhQh++sxjipkL8m3TVllg1n5CqelJXujHUTzqbcxiw9a3wgPd2Xaz/c9b2BmkHuCQaAAWnXyWaa+hyT7Sons4AmQQkm98Qn+1e+ITjOJ6A501+TwKYngVvSA8iSFcq2DlVGiaIyYQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3240.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39860400002)(136003)(366004)(376002)(396003)(346002)(956004)(36916002)(2616005)(44832011)(316002)(7416002)(54906003)(4326008)(31696002)(107886003)(15650500001)(86362001)(66946007)(5660300002)(8936002)(16576012)(6916009)(6486002)(8676002)(84040400003)(31686004)(186003)(66556008)(38100700002)(26005)(2906002)(66476007)(36756003)(16526019)(478600001)(53546011)(83380400001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?dnViTHJZbTYwaENuNmxGLzV4cE4yRm1vcndCSk1OdUtrYVQ5WmpyZWhYM3ZN?=
 =?utf-8?B?OGkxWUxjcEZqUTNuUGcyamt5bTlhWUViMU9TWFJLMm5zUTZMSksxWUxMZGJz?=
 =?utf-8?B?dUxiSVNTYWZ3c0l2Nm1jN0dWdmFZbUttSHNPU0VvMGlNdnZZQ0pRanF0M0w5?=
 =?utf-8?B?cE9iZVRKcVRZcE5zVzNkM090OE4wNlVJbURPd0huYWJlZ3Jpd2JwNWZBclRD?=
 =?utf-8?B?MVlsMDJKWHdibW52V3EzWWd1MGpFVnNqY0VLLy9mM3F4RzJqcmkvcjVkTnZK?=
 =?utf-8?B?c0xiQ1IxZUh6aW9JUXRDcC9kZk82NVVJNkRKZUVjL0VVUDRvNmdkTm9pODd3?=
 =?utf-8?B?TTlhUjZDK2FkemU4SlFUYzlTSjN2MTRXTzl6SCtWS291ZG1GUW5OQWY0MTNT?=
 =?utf-8?B?MXJVbVp4a1pFTXVKdVpxYU84WWJ4YlhPL1V6Rm5sVWI0Kzd5aDJoVTZMd1R6?=
 =?utf-8?B?MTN6Q3hUUldOWm1YenRTbGs2RmpQWXdFbFFoQUFqa09TYnRUWGJjNVFRTVpY?=
 =?utf-8?B?eDF0Z2gvQjNzbWRQL0NTQ05BVUlDcmh2aXdpZk5JWTZNTlhEVEpTRm1XY3BT?=
 =?utf-8?B?bEdhcFBLV09aeGt3K2dIbllaUXRNODBnUEZNbHN3MEp1TDRvWkpycnB1RmdI?=
 =?utf-8?B?QTg1d0pya25qUXNLenBVMU1Mc2JWWURDL0NqWUh4bUtBcFVjVVZROHlUOWh1?=
 =?utf-8?B?ZE5oM3ZxTllMZ3Nrb05DcTZaNkl2RkNpNjBtUHJqanZJSE9NN2wvK0g4NGJy?=
 =?utf-8?B?YUlBeDgvbkJ3WGxYOFFoS3lEbWI4WlRMWk9kTjZ2N3FBbzBCdENKRHNsTEVq?=
 =?utf-8?B?N3A3citKY1JOVjBpWjJlVTg1eVpLMXg4QmlFOW0vNUs0QkpPNTU2MDhMZktN?=
 =?utf-8?B?bVpRblQyOGczRDRxZEtDSlJ2cDhmRm5LUDhIbUNDcWJYbnJzU1FacDBITVZt?=
 =?utf-8?B?dE9JdVNyMGEwdi82NUM2VllPc1k1blZJSFNvazZHN00wQ1E4eVZiMFRjY3hp?=
 =?utf-8?B?eDVNeXYzYW5sY3UrbDNYTVF6eERzajNob1gyRmhBT2IwNWRiZDU3RUdPakVj?=
 =?utf-8?B?Tm4waXUwS2RRY2wvYjMzNnlxUmY5aGVmelhOU0pMRDZ3aVFPNm0xU3RsOE1h?=
 =?utf-8?B?Mko5c005SlcxRzUzY2ZnWVREMURSNGJKUlJPUFZRR1FJOWJFdmtwdjVkTW5C?=
 =?utf-8?B?SWcvU0hMOUlpMDFSbkhoOG1BWW5tTGY3dEZOVWQ4SHdlYmx0dFk4c0JGWmZ2?=
 =?utf-8?B?OHlxb2ltdEVmUXBJMUUyWkQ4NHptK2p4dXFYMmFxUDJrN1RrbThKZUdlYTRv?=
 =?utf-8?B?OXBFeXJBOXpxbzh3cXV3MUpScUxHRkd1QWYxVlU4RE5lSWJoOUwwQlViaTR6?=
 =?utf-8?B?L1FsNlF6ZndIVmNiWC9yNXNVTzJEYUlnTWo3S2dSOU9DVForcUhISEVLK0tx?=
 =?utf-8?B?bldhSDQwa01JVFE0ZlgzNmpNRFJiaHJCWUdqQ0xPL2NwMXpKbld4NVk5N3Ru?=
 =?utf-8?B?cndaSXJLWVFQc2EzWHFFR0I5MXpEdFNtOXhxOGFoem9vRW14WHpCdDhBUUdV?=
 =?utf-8?B?RzZPU3RLWDhTZEtDZURCYTUyQm8rTlNiSktWUGpQOGd3RTZBQjlva3k2aDg4?=
 =?utf-8?B?UmxaellKUk1ZdnYzUDMzRlNpVVA3T1o0OFJJTU5YTGlHSXBlOUpBK2tscHl4?=
 =?utf-8?B?Qms5NjAwN2V1bmw5UFZmZ1JQZHlNYzlMZmpIZEFSZldYSWl4VEp4VVcxWitB?=
 =?utf-8?Q?HWGUv7VGq+RH9iWcJju8+cdAvBJ6YBWRRn4jwy2?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb82b124-a89e-418e-d759-08d91a397c32
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3240.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2021 20:14:05.0509 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FpwQg5LYQ8WXhEvGnaOneeJqFeEc3qeBnxrTNcVlVxo9R2q8RBaE36QVPaCJUGZpg3QB7OZY2sbtwRnpfQEEPArr4dTuEpBKyPU12Zhga6Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB5472
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9988
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 phishscore=0
 adultscore=0 malwarescore=0 bulkscore=0 mlxscore=0 spamscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2105180141
X-Proofpoint-GUID: A7Wz0Ocq4dwPaXQWzj8tq2-U3Osh8n0X
X-Proofpoint-ORIG-GUID: A7Wz0Ocq4dwPaXQWzj8tq2-U3Osh8n0X
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=steven.sistare@oracle.com; helo=mx0b-00069f02.pphosted.com
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
 Markus Armbruster <armbru@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/18/2021 3:23 PM, Dr. David Alan Gilbert wrote:
> * Steven Sistare (steven.sistare@oracle.com) wrote:
>> On 5/18/2021 5:57 AM, Dr. David Alan Gilbert wrote:
>>> * Steven Sistare (steven.sistare@oracle.com) wrote:
>>>> On 5/14/2021 7:53 AM, Stefan Hajnoczi wrote:
>>>>> On Thu, May 13, 2021 at 04:21:15PM -0400, Steven Sistare wrote:
>>>>>> On 5/12/2021 12:42 PM, Stefan Hajnoczi wrote:
>>>>>>> On Fri, May 07, 2021 at 05:24:58AM -0700, Steve Sistare wrote:
>>>>>>>> Provide the cprsave and cprload commands for live update.  These save and
>>>>>>>> restore VM state, with minimal guest pause time, so that qemu may be updated
>>>>>>>> to a new version in between.
>>>>>>>>
>>>>>>>> cprsave stops the VM and saves vmstate to an ordinary file.  It supports two
>>>>>>>> modes: restart and reboot.  For restart, cprsave exec's the qemu binary (or
>>>>>>>> /usr/bin/qemu-exec if it exists) with the same argv.  qemu restarts in a
>>>>>>>> paused state and waits for the cprload command.
>>>>>>>
>>>>>>> I think cprsave/cprload could be generalized by using QMP to stash the
>>>>>>> file descriptors. The 'getfd' QMP command already exists and QEMU code
>>>>>>> already opens fds passed using this mechanism.
>>>>>>>
>>>>>>> I haven't checked but it may be possible to drop some patches by reusing
>>>>>>> QEMU's monitor file descriptor passing since the code already knows how
>>>>>>> to open from 'getfd' fds.
>>>>>>>
>>>>>>> The reason why using QMP is interesting is because it eliminates the
>>>>>>> need for execve(2). QEMU may be unable to execute a program due to
>>>>>>> chroot, seccomp, etc.
>>>>>>>
>>>>>>> QMP would enable cprsave/cprload to work both with and without
>>>>>>> execve(2).
>>>>>>>
>>>>>>> One tricky thing with this approach might be startup ordering: how to
>>>>>>> get fds via the QMP monitor in the new process before processing the
>>>>>>> entire command-line.
>>>>>>
>>>>>> Early on I experimented with a similar approach.  Old qemu passed descriptors to an
>>>>>> escrow process and exited; new qemu started and retrieved the descriptors from escrow.
>>>>>> vfio mostly worked after I hacked the kernel to suppress the original-pid owner check.
>>>>>> I suspect my recent vfio extensions would smooth the rough edges.
>>>>>
>>>>> I wonder about the reason for VFIO's pid limitation, maybe because it
>>>>> pins pages from the original process?
>>>>
>>>> The dma unmap code verifies that the requesting task is the same as the task that mapped
>>>> the pages.  We could add an ioctl that passes ownership to a new task.  We would also need
>>>> to fix locked memory accounting, which is associated with the mm of the original task.
>>>
>>>>> Is this VFIO pid limitation the main reason why you chose to make QEMU
>>>>> execve(2) the new binary?
>>>>
>>>> That is one.  Plus, re-attaching to named shared memory for pc.ram causes the vfio conflict
>>>> errors I mentioned in the previous email.  We would need to suppress redundant dma map calls,
>>>> but allow legitimate dma maps and unmaps in response to the ongoing address space changes and
>>>> diff callbacks caused by some drivers. It would be messy and fragile. In general, it felt like 
>>>> I was working against vfio rather than with it.
>>>
>>> OK the weirdness of vfio helps explain a bit about why you're doing it
>>> this way; can you help separate some difference between restart and
>>> reboot for me though:
>>>
>>> In 'reboot' mode; where the guest must do suspend in it's drivers, how
>>> much of these vfio requirements are needed?  I guess the memfd use
>>> for the anonymous areas isn't any use for reboot mode.
>>
>> Correct.  For reboot no special vfio support or fiddling is needed.
>>
>>> You mention cprsave calls VFIO_DMA_UNMAP_FLAG_VADDR - after that does
>>> vfio still care about the currently-anonymous areas?
>>
>> Yes, for restart mode.  The physical pages behind the anonymous memory remain pinned and 
>> are targets for ongoing DMA.  Post-exec qemu needs a way to find those same pages.
> 
> Is it possible with vfio to map it into multiple processes
> simultaneously or does it have to only be one at a time?
> Are you saying that you have no way to shut off DMA, and thus you can
> never know it's safe to terminate the source process?
> 
>>>> Another big reason is a requirement to preserve anonymous memory for legacy qemu updates (via
>>>> code injection which I briefly mentioned in KVM forum).  If we extend cpr to allow updates 
>>>> without exec, I still need the exec option.
>>>
>>> Can you explain what that code injection mechanism is for those of us
>>> who didn't see that?
>>
>> Sure.  Here is slide 12 from the talk.  It relies on mmap(MADV_DOEXEC) which was not
>> accepted upstream.
> 
> In this series, without MADV_DOEXEC, how do you guarantee the same HVA
> in source and destination - or is that not necessary?

Not necessary.  We can safely change the HVS using the new vfio ioctls.

>> -----------------------------------------------------------------------------
>> Legacy Live Update
>>
>>  * Update legacy qemu process to latest version
>>    - Inject code into legacy qemu process to perform cprsave: vmsave.so
>>      . Access qemu data structures and globals
>>        - eg ram_list, savevm_state, chardevs, vhost_devices
>>        - dlopen does not resolve them, must get addresses via symbol lookup.
>>      . Delete some vmstate handlers, register new ones (eg vfio)
>>      . Call MADV_DOEXEC on guest memory. Find devices, preserve fd
>>  * Hot patch a monitor function to dlopen vmsave.so, call entry point
>>    - write patch to /proc/pid/mem
>>    - Call the monitor function via monitor socket
>>  * Send cprload to update qemu
>>  * vmsave.so has binary dependency on qemu data structures and variables
>>    - Build vmsave-ver.so per legacy version
>>    - Indexed by qemu's gcc build-id
>>
>> -----------------------------------------------------------------------------
> 
> That's hairy!
> At that point isn't it easier to recompile a patched qemu against the
> original sources and ptrace something in to mmap the new qemu
That could work, but safely capturing all the threads and forcing them to jump to the
mmap'd qemu is hard.

- Steve

>>>>>> However, the main issue is that guest ram must be backed by named shared memory, and
>>>>>> we would need to add code to support shared memory for all the secondary memory objects.
>>>>>> That makes it less interesting for us at this time; we care about updating legacy qemu 
>>>>>> instances with anonymous guest memory.
>>>>>
>>>>> Thanks for explaining this more in the other sub-thread. The secondary
>>>>> memory objects you mentioned are relatively small so I don't think
>>>>> saving them in the traditional way is a problem.
>>>>>
>>>>> Two approaches for zero-copy memory migration fit into QEMU's existing
>>>>> migration infrastructure:
>>>>>
>>>>> - Marking RAM blocks that are backed by named memory (tmpfs, hugetlbfs,
>>>>>   etc) so they are not saved into the savevm file. The existing --object
>>>>>   memory-backend-file syntax can be used.
>>>>>
>>>>> - Extending the live migration protocol to detect when file descriptor
>>>>>   passing is available (i.e. UNIX domain socket migration) and using
>>>>>   that for memory-backend-* objects that have fds.
>>>>>
>>>>> Either of these approaches would handle RAM with existing savevm/migrate
>>>>> commands.
>>>>
>>>> Yes, but the vfio issues would still need to be solved, and we would need new
>>>> command line options to back existing and future secondary memory objects with 
>>>> named shared memory.
>>>>
>>>>> The remaining issue is how to migrate VFIO and other file descriptors
>>>>> that cannot be reopened by the new process. As mentioned, QEMU already
>>>>> has file descriptor passing support in the QMP monitor and support for
>>>>> opening passed file descriptors (see qemu_open_internal(),
>>>>> monitor_fd_param(), and socket_get_fd()).
>>>>>
>>>>> The advantage of integrating live update functionality into the existing
>>>>> savevm/migrate commands is that it will work in more use cases with
>>>>> less code duplication/maintenance/bitrot prevention than the
>>>>> special-case cprsave command in this patch series.
>>>>>
>>>>> Maybe there is a fundamental technical reason why live update needs to
>>>>> be different from QEMU's existing migration commands but I haven't
>>>>> figured it out yet.
>>>>
>>>> vfio and anonymous memory.
>>>>
>>>> Regarding code duplication, I did consider whether to extend the migration
>>>> syntax and implementation versus creating something new.  Those functions
>>>> handle stuff like bdrv snapshot, aio, and migration which are n/a for the cpr
>>>> use case, and the cpr functions handle state that is n/a for the migration case.
>>>> I judged that handling both in the same functions would be less readable and
>>>> maintainable.  After feedback during the V1 review, I simplified the cprsave
>>>> code by by calling qemu_save_device_state, as Xen does, thus eliminating any
>>>> interaction with the migration code.
>>>>
>>>> Regarding bit rot, I still need to add a cpr test to the test suite, when the 
>>>> review is more complete and folks agree on the final form of the functionality.
>>>>
>>>> I do like the idea of supporting update without exec, but as a future project, 
>>>> and not at the expense of dropping update with exec.
>>>>
>>>> - Steve
>>>>
>>

