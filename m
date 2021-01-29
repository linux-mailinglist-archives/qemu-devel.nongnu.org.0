Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 644BB308B59
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 18:24:32 +0100 (CET)
Received: from localhost ([::1]:52080 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5XVX-0006s9-Av
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 12:24:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44286)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mihai.carabas@oracle.com>)
 id 1l5X8q-0000jr-RE
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 12:01:04 -0500
Received: from userp2130.oracle.com ([156.151.31.86]:52526)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mihai.carabas@oracle.com>)
 id 1l5X8m-0002gu-Aj
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 12:01:04 -0500
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10TH06g6024688;
 Fri, 29 Jan 2021 17:00:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=htem072+4rQRIoqGMywNmMPVT2ZiJoG5gtr+EGDPowk=;
 b=Zn8jislcRrTRyxmg5HYRwLF5O45c546HwEd+eIjz15jzfatnroUKLejbFFARgdC7rN9E
 I2cwfrBRo1gzyIqLzZBPzvoXVmMUyv9MWGKZ7oam7PXqyX+qrAXpP1SySNzxgYEqzRcy
 IQHsXGJ8601fZWgaH6AQ0F91ZEErg7thKuUd2clRxSbO8ruM3cpIzrkY4ftt0zJcMJG8
 gBH4xwiPQMA6Gtq1yu5uzbFiSUHNSo9QR2ngh+qE9IiPmDbcM/5FcxaX7N26B1drcwah
 VX62ejSK4SodxRLYc7d2cJtP4KT9Aro9uqw7fa17fW+d5uYMUHbpT2PoHPUR7Z3TmvG0 CA== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by userp2130.oracle.com with ESMTP id 368b7rabt4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 29 Jan 2021 17:00:54 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10TGxuHD025612;
 Fri, 29 Jan 2021 17:00:54 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2168.outbound.protection.outlook.com [104.47.57.168])
 by userp3020.oracle.com with ESMTP id 36ceugwrak-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 29 Jan 2021 17:00:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OEVo935vCD4aDcQXgJP0EVJctwD/yJhsXKYdx+21SC0WwV0wM71A6GTzc2rldFauSKjpfJx+hIUqRdLSvQMrNhSzGHxPhirJw68xfAxz32XWzkAMXLzg+3tm6YLK3LyNzXiL1CyKwystdBodoFl+L0O11Qq7u/F9PhXMZvCFCDXnttRlmaSeyNZYIDdhvOSeEWQA0ibZidYPrMTh8IPOffBNFw/5VYBQqEbB+shX9LA4BGFV54MB1a4wCvq+T6PoNDUqqH/d4aNzjO6MY58JY9rVcVVl/aIlF5ogBW1cXPAy1ayG9WoTMYTxqdvBZqsqkaxVjNnd0/nsvGrLugvmVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=htem072+4rQRIoqGMywNmMPVT2ZiJoG5gtr+EGDPowk=;
 b=AGHWTqZcdZzfWwhd74GeqyAAWq81YXGzRdCCkCVO8nOqQ4t8indFskDjayh7gEB8dRL91Krv/P3koZNKy3AJvmk3cGhhXudw57cojDUKJ4+BYC2HamVIJmLI7advGNGndzY+UWYC91Nweysnmnh/696/B/YpeT+VJRIgxLUynJM8bG4yY65y4jBPlKxZ2CLU2Tp0HgnCDVvKm/hptZ17v/OUOrM/ww95lGprZ3e5w+YLdEuEQsOXWOZRnNG1kapfSv+JX+bJj5WB1cndnYae2Ao99PWEvEy1REQm7/6RlGVsDIsR0cwncg8n/WpYybjerutQxEmhibBk8eQ3fBTL5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=htem072+4rQRIoqGMywNmMPVT2ZiJoG5gtr+EGDPowk=;
 b=AAwdz1N2gxpQi5F/3DIkHzgO1IRxtxrPo4vSQ8Zct/L6sPwk/fq/eB8gPn3qYVmjp/4CfwdlsAEAMYgAsS8mYOLMat9F71qJktLX74/5v8GVxdvRAOcUpBgJTlo1V3fLMhK/GNJL24QJ/MKJhBELfwQ3oej1My5g1DhruNb/EMs=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from MWHPR1001MB2285.namprd10.prod.outlook.com
 (2603:10b6:301:2e::32) by CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.19; Fri, 29 Jan
 2021 17:00:52 +0000
Received: from MWHPR1001MB2285.namprd10.prod.outlook.com
 ([fe80::f48a:d4cb:d74c:48ba]) by MWHPR1001MB2285.namprd10.prod.outlook.com
 ([fe80::f48a:d4cb:d74c:48ba%6]) with mapi id 15.20.3742.015; Fri, 29 Jan 2021
 17:00:52 +0000
Subject: Re: [PULL 21/46] tests/qtest: add a test case for pvpanic-pci
To: Peter Maydell <peter.maydell@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
References: <20210129110012.8660-1-peter.maydell@linaro.org>
 <20210129110012.8660-22-peter.maydell@linaro.org>
 <CAFEAcA-J+4pJ=dR+-o=3Oyat6t2_UT6u0+q+vbmMdnrfx0WJSQ@mail.gmail.com>
From: Mihai Carabas <mihai.carabas@oracle.com>
Message-ID: <1a05289d-2495-e31f-d425-1752b4b2c5e7@oracle.com>
Date: Fri, 29 Jan 2021 19:00:11 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <CAFEAcA-J+4pJ=dR+-o=3Oyat6t2_UT6u0+q+vbmMdnrfx0WJSQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: ro
X-Originating-IP: [141.85.241.41]
X-ClientProxiedBy: LO4P123CA0210.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a5::17) To MWHPR1001MB2285.namprd10.prod.outlook.com
 (2603:10b6:301:2e::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [172.17.0.254] (141.85.241.41) by
 LO4P123CA0210.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:1a5::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3805.16 via Frontend Transport; Fri, 29 Jan 2021 17:00:50 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b230d630-b15e-4576-231a-08d8c4776f23
X-MS-TrafficTypeDiagnostic: CO1PR10MB4531:
X-Microsoft-Antispam-PRVS: <CO1PR10MB453117C5DB2DC7E26D93B2AD88B99@CO1PR10MB4531.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hJ2qUfRoJ1L4P09NCz9tDIL0gHRhdcCJxrpv+LKGNTP85qqMxoeaoN7+KyIXoux+bTlwfjbVmDAJN/1kg8afLT5oheALcqEVOJmWqAK7YSbSXcXxuNbK/+wYNiSsnCkX3UCF0dtOzAzw2dNt3U8phYk/JLaUe5uKOWpiTFvKUN/DSFEDiRWMCAKAOey9FEgk6IsvVo+C89D039Lum1NEncefLU1ku403pvCiqjL5gK7whO8D2AkXUuDOMdvx3ExUFjlnTm3oU/f2zTqbCZ8YA9vZmkMOUIJdZDo+I6As+JFkVSB/M8IByQQhQcB1qTI8MImNWkZ/wbvG29wBpr9pJupgqAINCHsE2xYvtn72jBGWOsGRvhdXP9Zo5bpoGpgP467RKsRJgilIwf1WjqQCqUVBRU+nlUbS3b3DsRj7JdKOFP7BNiqoMXmGkP57mHXjfG/9wtbdfC5MMHLejJEtr1vyPP4jRXCqwN6aLTyEBymQsXHtbZwn1pYpsRgDwBC7teAbZrtVwx2IaXoEs13JdD4MTrAeDB24/DDJcN+E3loiM2VQWx2yD1yoxLKMDsdBWmULFePuQpbJvmpLB5QDYUEBRbLRQyvXjc02a5p12TOGJv/moP2E0Npnqt2NrMGLMK38ftpfPEjNNBhVEHBCiBbpJEs9Uw15SOSb5h07vPRXjkGOCLDD1lwB66jTfxZ+
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2285.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39860400002)(346002)(396003)(136003)(376002)(366004)(36756003)(2906002)(44832011)(31696002)(26005)(31686004)(16526019)(186003)(478600001)(8936002)(2616005)(956004)(86362001)(6666004)(5660300002)(66556008)(110136005)(966005)(6486002)(16576012)(8676002)(66476007)(316002)(66946007)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?cHE2aFNaYVlDdzNWSXhyRDJzbkg2b3RYOG5rYkZtRXdMU1Erd1VwTGlpZ3Zx?=
 =?utf-8?B?eDJhM2lHZ3hpRHJuc05pQUFkUmJOSlhKN2EvdTdyVDdYTXV2V3A5ODFuMXdy?=
 =?utf-8?B?bGF6MmZWeDNienZIQlplYk1Oa0cvL1hzNDJ0S2l6N1NoMmsrcmVLS0l2T3B6?=
 =?utf-8?B?azF6alR4UzVzajJXTHdNMHBKOEtGeVFxOElNZUttWkNzUEJkOXVZL0tFTGdQ?=
 =?utf-8?B?QjNFMzdKOHhlWXlTT1Q1dG9WRjRmUXBWZkpiRm9WNi9uYXMzQjJBSVZJRVky?=
 =?utf-8?B?aTNTOVpLcEhER1dKWmhqZzVJWWF2K1VMVU1oRER4UmFLbEw3a1pVaWR1OTVK?=
 =?utf-8?B?NWo5cm8zKys5a3AwUmppTW1tTkZBYzZPaFF1N21OZmt5MWU5SUROZmRXeDhj?=
 =?utf-8?B?QlRKcElVc09XZnJHcEJVeTViekZPM3BwemJqZ2RWZzdhV2lhaUNHMmtWVEti?=
 =?utf-8?B?c0hLREVXVFpLbk5rUGRjVTl4THAzWElKZW5PMTlMQ3hORVVYcXMwaWE2Q3Rz?=
 =?utf-8?B?ZDFIYXlPbzJTRVdoQVlodlFDbWM2TGVTLytZWnlhMzRkWnpMQkZDL0t6NUZ5?=
 =?utf-8?B?c2pLNlBGSHFOTDZlNVFGeXU4NGwxbmN1MHFRT0ttd2hZNFBiQ2VHNHFRTjFW?=
 =?utf-8?B?eEZEeFkyYUlOQmJ0dU4ydEsyOWt0TnBTa2FBOElwVExYZVk0VEJrbGx6RlBq?=
 =?utf-8?B?a2pwbFBOdE1LS2FTVEVtZjRoaW84d2hMMVUyMWpicGFwSjM2UFRRVFJWaDlj?=
 =?utf-8?B?eTNZZjZocUtsdFBlaXhZNGpxd2xUdlI4dnhaUFVPUzJudG5rdVVGSmx2WUNn?=
 =?utf-8?B?bURvcExRYzJIL2Vrbld4U2V6TXRJR205V2tJUXhTOUNsUmlJLytacldaRW5S?=
 =?utf-8?B?eFcrZEl1eUZ1a3VOWWlGY0FUK01acnBVMXorL2t1RS9XUURjdzlBUXo0NDMy?=
 =?utf-8?B?QW5xai9YQzRRRWl1UVQraENqQWhlZTFqOUxTdjM0bzdxNzRJaU40eVNYaTVi?=
 =?utf-8?B?Sk81eCtQTUZJQlNMRUxqemFqQldZSml2UlRUMGV2alZaSW5rODU1MWhZUGVv?=
 =?utf-8?B?REFxSlQzOE9NWWVQTTFnZmtvanA0WW1QSFBmcTBrMUZaR1hFSHUzb0ovUmNV?=
 =?utf-8?B?SGRNVTB0ZkJ5NklXdWZ5VmtIdm8rWjhqdVdlNExYNlo0ZjNrdkgzcWFObGs0?=
 =?utf-8?B?eEpXTHNxcUh2SDcxWUwycVRFd0o4M0F4dmNNM2ZDWFRQUGEyQzd2VnNaS1Zl?=
 =?utf-8?B?cDBTYkIzclM4cktnVG9ncUxKSkFPZDFvbUgyZVVxK2ovWTVhRlk3WWE2U2Mx?=
 =?utf-8?B?dko3RlR3VCtwVHJZaGErMFR4WHB6RVVHeDJYcTBTdXlMblFNMHA1UDVYZzhx?=
 =?utf-8?B?WkNlMlhlR2pncGROUFlJUGtwUEllVnVFZlRFdnAyYmNmTDJTQy9EOFBoNmZo?=
 =?utf-8?Q?P07C6KgS?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b230d630-b15e-4576-231a-08d8c4776f23
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2285.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2021 17:00:52.0999 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J3B4ukcHQyhdyRdd0nUJi+ELNfb6v6BBqs7MhTfRr5vYIl6znNazxu119AB/jVy7vENOmUnYN7qJ9PneD7oouvJgVU0njQ3RDOdILUiPy7g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4531
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9879
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 malwarescore=0
 bulkscore=0 suspectscore=0 mlxscore=0 spamscore=0 phishscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101290083
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9879
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 spamscore=0 phishscore=0
 adultscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 mlxscore=0 clxscore=1015 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101290083
Received-SPF: pass client-ip=156.151.31.86;
 envelope-from=mihai.carabas@oracle.com; helo=userp2130.oracle.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

La 29.01.2021 17:57, Peter Maydell a scris:
> On Fri, 29 Jan 2021 at 11:00, Peter Maydell <peter.maydell@linaro.org> wrote:
>> From: Mihai Carabas <mihai.carabas@oracle.com>
>>
>> Add a test case for pvpanic-pci device. The scenario is the same as pvpanic
>> ISA device, but is using the PCI bus.
>>
>> Signed-off-by: Mihai Carabas <mihai.carabas@oracle.com>
>> Acked-by: Thomas Huth <thuth@redhat.com>
>> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
>> Signed-off-by: Mihai Carabas <mihai.carabas@oracle.com>
>> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> This turns out to trigger the oss-fuzz build's leak-sanitizer:
> https://urldefense.com/v3/__https://gitlab.com/qemu-project/qemu/-/jobs/995177788__;!!GqivPVa7Brio!IGLAgdVRl_78c_PuUhuLJVDG1KFnc1gv3Pf1yTTcSiizygGvYHmq3YQ3YxwmMAwSMQ$
>
>> +static void test_panic_nopause(void)
>> +{
>> +    uint8_t val;
>> +    QDict *response, *data;
>> +    QTestState *qts;
>> +    QPCIBus *pcibus;
>> +    QPCIDevice *dev;
>> +    QPCIBar bar;
>> +
>> +    qts = qtest_init("-device pvpanic-pci,addr=04.0 -action panic=none");
>> +    pcibus = qpci_new_pc(qts, NULL);
>> +    dev = qpci_device_find(pcibus, QPCI_DEVFN(0x4, 0x0));
>> +    qpci_device_enable(dev);
>> +    bar = qpci_iomap(dev, 0, NULL);
>> +
>> +    qpci_memread(dev, bar, 0, &val, sizeof(val));
>> +    g_assert_cmpuint(val, ==, 3);
>> +
>> +    val = 1;
>> +    qpci_memwrite(dev, bar, 0, &val, sizeof(val));
>> +
>> +    response = qtest_qmp_eventwait_ref(qts, "GUEST_PANICKED");
>> +    g_assert(qdict_haskey(response, "data"));
>> +    data = qdict_get_qdict(response, "data");
>> +    g_assert(qdict_haskey(data, "action"));
>> +    g_assert_cmpstr(qdict_get_str(data, "action"), ==, "run");
>> +    qobject_unref(response);
>> +
> I'm going to squash in the trivial fix, which is to add
>      g_free(dev);
>      qpci_free_pc(pcibus);
>
> here and similarly in the test_panic() function.

Thank you! Sorry for missing that trivial leak:(.

Thanks,
Mihai

>
>> +    qtest_quit(qts);
>> + }
> thanks
> -- PMM



