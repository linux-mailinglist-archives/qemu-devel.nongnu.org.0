Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02195306395
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jan 2021 19:52:11 +0100 (CET)
Received: from localhost ([::1]:48284 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4pvG-0007KS-1o
	for lists+qemu-devel@lfdr.de; Wed, 27 Jan 2021 13:52:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45086)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mihai.carabas@oracle.com>)
 id 1l4pt8-0006sq-15
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 13:49:59 -0500
Received: from aserp2130.oracle.com ([141.146.126.79]:56476)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mihai.carabas@oracle.com>)
 id 1l4pt6-0000Jm-7V
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 13:49:57 -0500
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
 by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10RIZCGl077762;
 Wed, 27 Jan 2021 18:49:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=Eg4bpHVZmN0VSOoySMG3+g/NvNNZDYaOLaCE3MV57bk=;
 b=vMRoWoUc4LzgnwmSSPDEKG0+xcy3cZLdA+N7YJ7vCo2nzd2ssD7aQmLv0rNv6gAB3fRX
 pCIX4DpsOPBd0zFLDzrIU4bsLxcV6MwDoxaki3tBPt+THC4hNSndWkHAPXw5PkjWQSX1
 igl52Gul+X5RsZVkmqyChSMc082FPcA38FRYENWaamhV4WTdGzcnkTV0E6flY7Hj8oGY
 Io27JYRAOR0P/YyG90fEmM5PO8AuCvDTyl4Q7G2V4gJ1PJd3lz+hDjo7fie814z648Wg
 oHWnF4udj32rYvi1+jbnZFAKw3yZF0W/Z1B+rQ1yq+C4iEdCBk+McFaanMx5EA0THHFP 2g== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by aserp2130.oracle.com with ESMTP id 3689aarwb4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 27 Jan 2021 18:49:53 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10RIZkCB015994;
 Wed, 27 Jan 2021 18:49:52 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2109.outbound.protection.outlook.com [104.47.70.109])
 by userp3020.oracle.com with ESMTP id 368wjsxnem-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 27 Jan 2021 18:49:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XNweFQBhosps1uT0Vk2dL+H97Ob/aFiZy1Tdly+VaPDf7D+Wx4sDAVrhAg3QXlMQFeJlXuNUDOB4LMZSjHFHdJ5c4uKR0j+LC2w8vAV4qwFRk8Sz70jLLE8x7+p2eFvvZ8z36P+iaL+nsxrHAuSwZNjCoYPjlcoWYqa+TekZABsd+138sxjYosPOy6lXesSRgyfxN+hKaFCHcrdTtNoAl5O5tYtRnnXIxO8gsYs8a9fjskmcG8wsW+b+3NfP9NoA5ZlYzC6+VHzXr7MQGUPbyh/ufSPYQ3wxRX0k0jr1AZrnmyPwOt46NBlgFlQq5Suo/wRulafSk+OI11KUVSqtDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Eg4bpHVZmN0VSOoySMG3+g/NvNNZDYaOLaCE3MV57bk=;
 b=kHP0njYrh1+DGpnynHptdtxt629uusJTAkhqUskuQbsw3z4eUUo7tYbL4Qbgv1gvBr1Z6Xa8pDnfeBUdPSJGhEFKazBM7NOm0/21VZgRmQnsbnrkKc1+4SWm+eDfs5PQnU0C3ydDTF/1uU1PVUWnChQnOBk3zT7t7Me1lr3tiw3dzPiD00VwDVt7YNWc+HDf2jhqSq5Boso7pWLI8lOeHjvxFu+D1YQDAex4A6N7hW34YB49E0hoE2Vp3usY4yQDMQvtbIKjPG5CNc6Cy2He2oHWVR0AXQ6LNEMO3OuH89yvp8Hial6FhxpK4UuBjXTnU0y9EOtKIycqEUaPmmyRJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Eg4bpHVZmN0VSOoySMG3+g/NvNNZDYaOLaCE3MV57bk=;
 b=Mn4bR1+pNEfuc1sc1Kd/uy6cVgXaJzFximaoCzl4NqxjI5vB9VZ2oxDGV6q23oyY9+8gcUgW8q1PRDfs1s4pWX3LL9uyXDw8Q8Q+qn01YhRCUd+8cJcjdrl1KpV9pouzAaaskJG+1ygGpooM142sbqDr4uRryfTry17Co2wERQg=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=oracle.com;
Received: from MWHPR1001MB2285.namprd10.prod.outlook.com
 (2603:10b6:301:2e::32) by MWHPR1001MB2109.namprd10.prod.outlook.com
 (2603:10b6:301:2b::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.13; Wed, 27 Jan
 2021 18:49:50 +0000
Received: from MWHPR1001MB2285.namprd10.prod.outlook.com
 ([fe80::f48a:d4cb:d74c:48ba]) by MWHPR1001MB2285.namprd10.prod.outlook.com
 ([fe80::f48a:d4cb:d74c:48ba%6]) with mapi id 15.20.3742.015; Wed, 27 Jan 2021
 18:49:50 +0000
Subject: Re: [PATCH v6] Add support for pvpanic pci device
To: Peter Maydell <peter.maydell@linaro.org>
References: <1611759570-3645-1-git-send-email-mihai.carabas@oracle.com>
 <CAFEAcA9SBX-sT983TsiRu9TSBWrZDWe=LM5cAJNxmHxa5ud0pw@mail.gmail.com>
From: Mihai Carabas <mihai.carabas@oracle.com>
Message-ID: <fc9ec737-6dea-c4c4-5a29-7cc50e92351e@oracle.com>
Date: Wed, 27 Jan 2021 20:49:43 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <CAFEAcA9SBX-sT983TsiRu9TSBWrZDWe=LM5cAJNxmHxa5ud0pw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: ro
X-Originating-IP: [141.85.241.41]
X-ClientProxiedBy: LO2P265CA0400.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:f::28) To MWHPR1001MB2285.namprd10.prod.outlook.com
 (2603:10b6:301:2e::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [172.17.0.254] (141.85.241.41) by
 LO2P265CA0400.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:f::28) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3805.16 via Frontend Transport; Wed, 27 Jan 2021 18:49:48 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f14cdc72-4851-48a2-51e6-08d8c2f45364
X-MS-TrafficTypeDiagnostic: MWHPR1001MB2109:
X-Microsoft-Antispam-PRVS: <MWHPR1001MB2109FAAA1DCBA2B34B2792A688BB9@MWHPR1001MB2109.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LADfoim8NddHrO94BuFGnqb3tJuG/fkALuCjQePJy5YLtJNRwourB+RQ5lCUxyjPY/Vi7tXdiSzEfvLTotb11sfGjd3wH+B2NXTJIH9I08geALMTv0Fzkog3IYiE9SxZGbiHF9eIJykmThv3C2vlxcjmp3RPByism20U0daURELX8tzWzgjLzgZlL1sjNItwLIL6uD4tzGohqyvrynP9hjG4yGflIdZhop2o0oiJZyzWcZe0HMHTpEYEF0Z3i2M/Df3jTVhMEp5uJEpwdmTxwkiJYP0v+mgo0u0JTee4PuzdC4439/4o8Ms8O8ZfOygw/Fih3+MBvp4abxuF+8Bcqt2Tn6Qac//iyW7Oz48DgnEFCotvZW//P7ccojvD0zhzpvvpva14iYg9d+uzgbO9/I6AXbfZO/edNvgSv9B7edhtJAWvUrrjv6/VpLgT1FfH156e/P0e1VWx7+rIh1E5jNCSZeisBfBh1bXeByZlt2oTz3CbfOMxg7SFHZKCA146hoOOycLlB9be/NpDZklJrPuXLdR7AH8VfOVGoY2X/fx9+4BLetQkQXwaFn5guCVQ3b7VQS6IR7bD00JmPpnaD7aFEsKOVJyDveTbFk5XF+Y=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2285.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39860400002)(346002)(396003)(136003)(376002)(366004)(44832011)(16526019)(956004)(26005)(2906002)(186003)(6666004)(8676002)(36756003)(5660300002)(66476007)(8936002)(66946007)(6486002)(2616005)(66556008)(31696002)(86362001)(31686004)(4326008)(83380400001)(316002)(6916009)(16576012)(54906003)(478600001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?N2QzTmdyM0pNREk1ZVNpTWtVN3haTVRwUUx4ZTBYcHhWTm5FaE03MExNWjNU?=
 =?utf-8?B?TmxySWhwcGlXTEY5YWxCSlhyS3V4RWsvRlFUSGEzOEovZlZYeWl4ZE9zSW1F?=
 =?utf-8?B?VHNpWHA3TE9CdkxxYjMyV0ZadnJiWlBGL1J1c1lYYWZzQmRqcXJVZUkvREta?=
 =?utf-8?B?WkxoRmhFem1peWdpTlNPV1dFVlRMNU85akEwNW9URXlHZTdaWEhtRk1NRjVD?=
 =?utf-8?B?SlB1R04vUXFxS2ZETUcyaHZwRUNxaGU3dXdrREFuc29OdGJiUFAzdWVpbTR3?=
 =?utf-8?B?eUNtcHkvZWZmK3l1WnFzZG5RbHV0MnBhV3ZQYjJsUEVEU0hNcU42K2w5b0Q2?=
 =?utf-8?B?eThLazljNlk2MWhhRlB3c3NNWkJ0QzJvUzUxa1hwVmk3dWIydFNablJ2ZUpa?=
 =?utf-8?B?NzlvaHB4WGxRU1VMMGlrQWxTOCtyVWtkVHRpb284TGl4WFBxTHY1cDN0dytX?=
 =?utf-8?B?Zk05VXpoS1d5VW5McTZ0S0hsZnc3T0tuMTZ4N05BNlpGUUFpc2kwcGV1SFc3?=
 =?utf-8?B?dVh3aW1VbkRnSWQyd2o0TW5OU2tFaHgzWjFNeE5lVDJwakFjTWF0a3NjWGlO?=
 =?utf-8?B?NzFWTVIvN0pkYzdqWnhwOHcyRlZUdEtUNFR4WUhGN242MnNZOWc2UXQxUkps?=
 =?utf-8?B?NVJFcEduRGNGUy9SQUdSZDlsZVFyaEs4VkVBVnNtbUlxamFRL3NQaDQyOUJD?=
 =?utf-8?B?Y2NOb3J0bGRlMkh2cEYyRVZFbkk5TWM2eVB2bmxTcEF6cGVoZ3VQSXhrN3pt?=
 =?utf-8?B?WUhjYnMzUlUyUEs0MU1XcGFVYUw0Z3hpTjEybVhPU0d4Q1dRaFgwaHZDSHll?=
 =?utf-8?B?RGRpRk1wek9JRmE2VDN1bmJIUWg3VjlHRkVOem5KREJwb1l1aDR1NVFBVHZp?=
 =?utf-8?B?N1hHdEFrd3BGRXJXbVZGVHR1d2Ewd1RJK3JWenlyL1BtUVZINEx5eW1KMmJZ?=
 =?utf-8?B?bjBTM0NNWW1HNzBsSlZTNDdzei9sUmtOOFlscVN4Zk9COFNSZXRhUkFKVGM3?=
 =?utf-8?B?aWJPZGhMN04zRmFpZ2czYk1odTlZMVgzS1N5bXh4TEdEV2o3OEdZVStJWGsr?=
 =?utf-8?B?anRFUGFvZURicU9QVENBUnJIZ2FBbmZTTzBIc0FmOUZPZzBxK0hWbGF3ckNn?=
 =?utf-8?B?SnV4NHNqby9yR0szRlpGaHJHazlqbVlWVHRudXA2Y1dGMEhXVTI3Vis0U0tP?=
 =?utf-8?B?UWJ0QkpFVDFtWHkvc01aQ0x5citPcVhyNElTL2JZNFN0SkhpT29WMWJSbVFP?=
 =?utf-8?B?OTdVcFQ3azN6TzcyNWorUFZUTFd4MEM5WXovUUpCL3FyR2pFYVNLdkJsU2ZB?=
 =?utf-8?B?SlJJb1B0a1VZck9iWjNZdHVOYXNER2JLVHpZRy9sYUJ0d00vSTJqTkRZUGMy?=
 =?utf-8?B?T3Y3dzE5OXg5ampidDlCOUJvcnNsRnVXOFpwRStOcllsZU0xWERIOHpTVTRN?=
 =?utf-8?Q?akTnOOqE?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f14cdc72-4851-48a2-51e6-08d8c2f45364
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2285.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2021 18:49:50.1466 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6C3AVO5qxnnLjacbemqAZg4dlbuA2/67esjzPhFKJUrp78RiPMkDYyhad6YUhtMCIqPiACcAkeLBKykGXUjr0DuokyRP9HQMGbkIW9i9o0I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1001MB2109
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9877
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 suspectscore=0
 adultscore=0 mlxscore=0 malwarescore=0 spamscore=0 mlxlogscore=999
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101270092
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9877
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 adultscore=0
 lowpriorityscore=0 mlxlogscore=999 clxscore=1015 phishscore=0 bulkscore=0
 spamscore=0 priorityscore=1501 mlxscore=0 suspectscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101270092
Received-SPF: pass client-ip=141.146.126.79;
 envelope-from=mihai.carabas@oracle.com; helo=aserp2130.oracle.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Yan Vugenfirer <yvugenfi@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

La 27.01.2021 19:47, Peter Maydell a scris:
> On Wed, 27 Jan 2021 at 15:46, Mihai Carabas <mihai.carabas@oracle.com> wrote:
>> This patchset adds support for pvpanic pci device.
>>
>> v3:
>> - patch 1: made pvpanic isa device available only for PC, compile pvpanic-test
>>    only when isa device is present
>> - patch 2: fixed device id to 0x0011, used OBJECT_DECLARE_TYPE,
>>    PVPANIC_PCI_DEVICE, added VMSTATE_PCI_DEVICE, removed INTERFACE_PCIE_DEVICE
>> - patch 3: fixed documentation
>> - patch 4: add a qtest for pvpanic-pci
>>
>> v4:
>> - added Rb/Ack on patches
>> - modify test case to include -action parameter that was recently added and also
>>    to be on par with the pvpanic ISA device testing
>>
>> v5:
>> - added subsystem_vendor_id and subsystem_id needed for MS WHQL tests
>>
>> v6:
>> - removed subsystem_vendor_id and subsystem_id as they are filed out by default
>>    if empty
>> - do not compile pvpanic-pci-test for ppc64 as we our tests do not support that
>>    platform
> Why doesn't the test work on PPC ?

I have to re-write the test suite in order to use a PCI bus specific to 
pp64 platform. If we want to have test cases for ppc64, I can do this 
with additional logic.

Thank you,
Mihai


