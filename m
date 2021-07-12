Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B2D7A3C6191
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Jul 2021 19:09:53 +0200 (CEST)
Received: from localhost ([::1]:35864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2zRI-0003a3-PN
	for lists+qemu-devel@lfdr.de; Mon, 12 Jul 2021 13:09:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48750)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1m2zPF-0000lD-4E
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 13:07:45 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:48798)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1m2zPD-0005xD-7n
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 13:07:44 -0400
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16CGv6PH003679; Mon, 12 Jul 2021 17:07:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=etQydHjTNgQND81l6i4Rg91M3bor19G4L6QRAnmDi2k=;
 b=QSaWLGPM7GhUW/bSU+Sqvq9CINXMamVIngoYBcXsFuemqqq3HmUx11574OmU0rFYDDWd
 2ndbTlinrazZQeRZ7cZA5+RM7vvY7NT0cn1aPh9UbxWhD1J9tW8GZccRZStJnobPBYRs
 kXIMpPr8KmylaX617JCC/YxLYUYWHTrEIlq0E6+CqBIsC9zbXMigxuTQND8kw5XkDNK5
 Uj8dFYSaFmcwovovvYbNOkkpu781ElMwlwY2okx9yNrfI0NmcW2HbZjvAtEph/CCiOzt
 wtqA+Kv+KcEN9+hZNvM1oLXuhUtm/AoHnslcF71Ylg8mEZ+chVo1bcV7/JudXTY4ZwzI OQ== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 39rqkb0d02-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 12 Jul 2021 17:07:40 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 16CGt8pX064715;
 Mon, 12 Jul 2021 17:07:38 GMT
Received: from nam02-dm3-obe.outbound.protection.outlook.com
 (mail-dm3nam07lp2048.outbound.protection.outlook.com [104.47.56.48])
 by userp3020.oracle.com with ESMTP id 39qnaum8bk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 12 Jul 2021 17:07:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g1NzDk569RRqDR8nJCP9vWTDjMfgb/4jKsw8mZH9frouL78TASQpOnt+mC8VX7GDdYnJkbQ7uVyuYwA+Bc4XWDkTbW7qfjKqXopFFdS9bLv3UwABPAfLgm8xUM2Pw1C6ZImqo9QlQyFuhQJMz6QW6GX0rKhY2LCOUlI3yP6+X5VubrRVI0+d7uWbmgWp2MAPHvlg6ySD3FJClw3BR7VIDZ1W8vI2Tp27XG503DuhEOhZd+BnmrfGO5OPDFeBznkMnV7x7MyvRJBNt09Z/HgnmNaWbuAkv7/B5xsFJ6adn+K6bU4dfXpI3lUxON/sczU9uJCEgrC+DHRMs2o/Rj8+bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=etQydHjTNgQND81l6i4Rg91M3bor19G4L6QRAnmDi2k=;
 b=QfS1S0ZFQEufw6nvWylXB/X16jrDQUSJkBkYjcTTIvw+c/4UvfYV3tnVRtIOd4pffFZXgOpQzhgmozvd0j12vDCDMFjcvA1dd/d9WpIfT9//ucn9AHIQXEK1LRKr+Tpj1BFy6AMHfeVzX4Ovp2sraV0VoV+ZRgfU/PSPsrBMBOsp3Ad2JNLhIVQJetAMb0wUipuUaAiyCoI5DZ8u7ExaM5s2pdA79RuGEN6XfSVVQbm9lnli8i49Zv0EZZE/mWse62lEXIgevu7Mzurue5MND11H8O2FznkE/n5lK9R4UouO31kteVra6Xls6rUo1Edbd6ODmoKWThzRJqiGxacerg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=etQydHjTNgQND81l6i4Rg91M3bor19G4L6QRAnmDi2k=;
 b=a8JbV2sS01ba9QDEMXAvqvBj7nPKvDXEPAi0El13lINVuuyrU8LZXQqjo/EnBR45l7qPwZuH8ZkCtaOLADE5U4AptBLY9294KWNwfrxwKcSoYc6QquhWV/NJ8RGzQr8BrcLITBp4ahJmjhc6rMARP31m8IbhIUwaGNH8V91T5vU=
Authentication-Results: oracle.com; dkim=none (message not signed)
 header.d=none;oracle.com; dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB3240.namprd10.prod.outlook.com (2603:10b6:a03:155::17)
 by SJ0PR10MB4734.namprd10.prod.outlook.com (2603:10b6:a03:2d2::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.21; Mon, 12 Jul
 2021 17:07:36 +0000
Received: from BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::a00d:eb40:2bf6:8812]) by BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::a00d:eb40:2bf6:8812%7]) with mapi id 15.20.4308.026; Mon, 12 Jul 2021
 17:07:36 +0000
Subject: Re: [PATCH V5 06/25] oslib: qemu_clr_cloexec
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@gmail.com>
References: <1625678434-240960-1-git-send-email-steven.sistare@oracle.com>
 <1625678434-240960-7-git-send-email-steven.sistare@oracle.com>
 <CAJ+F1C+ZOUi4+P32WorCJsusQxFUo-7T4=pbhmj0n2WzBHqnsQ@mail.gmail.com>
From: Steven Sistare <steven.sistare@oracle.com>
Organization: Oracle Corporation
Message-ID: <31b06477-5e60-48a8-b6ca-bbb06281249b@oracle.com>
Date: Mon, 12 Jul 2021 13:07:32 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <CAJ+F1C+ZOUi4+P32WorCJsusQxFUo-7T4=pbhmj0n2WzBHqnsQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SN7PR04CA0076.namprd04.prod.outlook.com
 (2603:10b6:806:121::21) To BYAPR10MB3240.namprd10.prod.outlook.com
 (2603:10b6:a03:155::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.92] (24.62.106.7) by
 SN7PR04CA0076.namprd04.prod.outlook.com (2603:10b6:806:121::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.21 via Frontend
 Transport; Mon, 12 Jul 2021 17:07:34 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c0e6e45e-0958-42be-129f-08d945578be9
X-MS-TrafficTypeDiagnostic: SJ0PR10MB4734:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SJ0PR10MB473430E86EDF3BD29B5CEB24F9159@SJ0PR10MB4734.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MbCJWtJ3K6iQ8637Pbfcj6rDRua0cpIGxRQzVIwYipwOHitBGJJOR5p07S+uMhitjn76CoQbnrC4qWqvKRybwH5xdO7HnSM8ZpZNOvfD+uFZDvXCkxNdYjkMOaTHJhN93HqM639iXSWDK7jSoM+372T0vysDSMFLFu34kpXSLItq04fo006I12jdNRbVrW2xYFG9ao6BCK954Nx2O1YnDN+aNpBo60yQzvgFOGx0voFKn/H94T6pVKin34Y21H35Fv+l76ZUZBqQV/TgEeSAFG/RliIym3qQ7i2CFNyKHlC7XcdoPvw9vTIv1Z78QH/zTZFe9jlnZnpwq2vJMWK6Cqc4fnm8CWjm2rqt0c5mm/yKAbNMFBmJkPbrqZXEBuBvsj7QUfibpfybRaYU6BvRLB5x2vLym9NCIRqJKnvkNg2whjYPUmy+6VsFiuUfPTTjM2vS1j0z+Xj8SMpeH/SgqbnvMG8ekYaTpXMMnJb+1QIkPvvNqCNFgzskADufLLQIPg/0rQyOM6fsCz9mNtDwc6wusoxo9i541cxcNCC5RdaudL11eCgRxw/Mqm/rx8q35PGlUan+Fxybx7XcSlBHuc4p2jsvbMF9ZG1ccDARSOXq+4wHfLbXpqG76XQe12qGHhYb4fdLz8fr+xocpNnGffPM9YQXGza/FgamoSgNtTbk9zJZtUJCxtgCBHjyimSDGmFLN+byou3s7I2L78uWmwoh3SJenRNtPsskT9YXl0E=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3240.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39860400002)(376002)(396003)(136003)(366004)(346002)(38100700002)(6486002)(8936002)(36756003)(36916002)(44832011)(31696002)(8676002)(4326008)(186003)(6916009)(5660300002)(7416002)(31686004)(86362001)(956004)(2616005)(316002)(478600001)(54906003)(26005)(2906002)(16576012)(66556008)(66476007)(53546011)(66946007)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UHprcy9DMER2VDluQURrZm11ZFlXalVhcENHWVFHeTlVbjRQaHhpUElrNnFz?=
 =?utf-8?B?cUlvMGJNNFlXL01OeEc2a0E1d0xmN0Q3MVpLMEtBWlBPUXQvemc0L3d2SmJz?=
 =?utf-8?B?dFk5TkVsbUNkcXhJcFBBQWVwQ09RTFpDTm53OFVrdmlsSkFWY0pxc2k1bFdz?=
 =?utf-8?B?NE4wOVhqYWtGS2EvZDlpODZycWJieHg3T3VKK1R5V3FmY0tQbmRnMzQ1VTV6?=
 =?utf-8?B?ZThGN2JjTFBmeWdKSE5aVW85U21XMzZwL2NtbWxxMEovYmpxUUtVN0JWNjlZ?=
 =?utf-8?B?YVNGbmM0N0hzV1pPd3o5aHdVS0hrUXdKblNZM044SC9QNmRIaXF0ZzJGZU13?=
 =?utf-8?B?QXoweXVXdWFKZXJtVTZyWE5hQUJCcWhWOStMTVo1QytzZkdUOU1xZUVNWm5B?=
 =?utf-8?B?Z2l2bkhrTmh2ZFNsazV3SkVURU9NK2tuY1pmdXJlMGNzMzBKQXhQMnpETkxL?=
 =?utf-8?B?eWV4NTh2MFVWNENRQTBOZ1ZvWmJkaTFtUlVTemRkMllXcWdTYVUvUnNpa1JZ?=
 =?utf-8?B?VE1IQVl3M1BoLzA0eHo1a3FGWCtvWXZlRnpyaGV5MWFpOTZ1MDZjTkJBL28x?=
 =?utf-8?B?YUp2bnF0NXppR3NTdm5kZUx1TXU5YWxFVkZCekZad1hjQkpxc2FwNmxZamlu?=
 =?utf-8?B?bGlEVEVvekJhSWNJakpnR1ExUGhSSVN3OUtuS251aGRyb3ZSZUtEQ2FxUFd1?=
 =?utf-8?B?bjBhelJiOCs1bjlJeXRvcFdTeDJJVmVEb2M3K2pzSHpSdE1HVGU5RzZEUHA4?=
 =?utf-8?B?NUJlMVFzZ1p6TDZnYU5GbkJNeWFlaGJ4RXV5S25HVC83ZmZmMlJrdkdtRlJ5?=
 =?utf-8?B?UGNYZE40U0VRTld0SGp2V3g2c3ZhSjhiNlprUnVsME84Z3JoMnBPVmUyTXBw?=
 =?utf-8?B?TDJDUXJQeFdHbFIrMVRXRSswelhWc3Jod2xidFIvTWZSYzlyTnI5WWcwM2RF?=
 =?utf-8?B?VlJnaExWaDZRQWJ0d2k0RDdZQ1lwczV5b3lFNWIrcUowVjByUkZYOUk4dFBy?=
 =?utf-8?B?TzdkR1YxeUNSM3hrQlR0UDFjTE9sYWpPWkVvb2JjVnVvQjZjbk5GYTV5NWhS?=
 =?utf-8?B?c1FaZE1kTW9WOXg1WnJqdDVOdjQrUkdjVWlob3dDYWlvdFJ5U0JzVlRNUzNi?=
 =?utf-8?B?eWc1dU9IdlVUSDBNUk5nOHBucUVubzVhczFDU2JBNEVEOFRBRTFnTUVyZzFz?=
 =?utf-8?B?ckVSTndaTGV1dTR0aXZwUy9kVFhIMDhNRUxrbnRxL200Ty9hYTlkblVSZU9S?=
 =?utf-8?B?UGo1SkdCRFB5R0c3TXIyTVJQSXlOTkdoQjFhWlowcXYyUEwyMEdtak8yM3h0?=
 =?utf-8?B?MFNqZVN0WVpESEM4dGxnNWU0TmhXQ01BdWVNbU1BMnVOaFJTZ080dDRpQytD?=
 =?utf-8?B?TDZTMGlhelQxc0Y4clZPNEFYNUdmakNyNVdXZStHMzBidkdyRlNlOHdaNnlJ?=
 =?utf-8?B?bzJ3clhNd3p5ZTJlZ2U2N2N0eHY5aEU2SDVLTGI1aS91c0ZpL1hCZkNrM214?=
 =?utf-8?B?MDJoa3JHdjlJKzVGMmpaWmpZeWhvVUdCNE5oc2lxWWNxNUtsUlRsU3F0VXdv?=
 =?utf-8?B?a2NoWXJ2bkRveHNEanpkakl2U0RIeE5FWlp2ZHhVaE1id3p1V0xWNnBvZ3R4?=
 =?utf-8?B?LzhzRk9FNXg3WVBHUldxQXA4blpta2ZxMDVmSHpQT2VPWWpNODNBZEdtenNB?=
 =?utf-8?B?VXVlM0hpL1htWDBncmZpMUdNbGR5SzVtc0VuL2F6a0lOZXZ3ZW9kSkl5OWxz?=
 =?utf-8?Q?wwA/NI8s3SAcEjbEJfHWG1qVo9gqXCKkx+wxfoN?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c0e6e45e-0958-42be-129f-08d945578be9
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3240.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2021 17:07:36.2804 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r6Hwe0m1vAZAejGyebAxwhhg9JfdK9zXxl3HkmYokJl7+55K1AheO47QOqH0T9oU3JiEJ5eZoh9hbXZwAnbbACrHyBXalrlkucY+xJCN/kw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4734
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10043
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 bulkscore=0 malwarescore=0
 spamscore=0 suspectscore=0 adultscore=0 mlxlogscore=999 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2107120126
X-Proofpoint-ORIG-GUID: bajg8ULgLh74zNs5woUX5iNlVnhQaRNu
X-Proofpoint-GUID: bajg8ULgLh74zNs5woUX5iNlVnhQaRNu
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=steven.sistare@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-1.479, RCVD_IN_DNSWL_LOW=-0.7,
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
Cc: Jason Zeng <jason.zeng@linux.intel.com>,
 Juan Quintela <quintela@redhat.com>, Eric Blake <eblake@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, QEMU <qemu-devel@nongnu.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/8/2021 9:58 AM, Marc-André Lureau wrote:
> Hi
> 
> On Wed, Jul 7, 2021 at 9:33 PM Steve Sistare <steven.sistare@oracle.com <mailto:steven.sistare@oracle.com>> wrote:
> 
>     Define qemu_clr_cloexec, analogous to qemu_set_cloexec.
> 
>     Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com <mailto:dgilbert@redhat.com>>
>     Signed-off-by: Steve Sistare <steven.sistare@oracle.com <mailto:steven.sistare@oracle.com>>
>     ---
>      include/qemu/osdep.h | 1 +
>      util/oslib-posix.c   | 9 +++++++++
>      util/oslib-win32.c   | 4 ++++
>      3 files changed, 14 insertions(+)
> 
>     diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
>     index c91a78b..3d6a6ca 100644
>     --- a/include/qemu/osdep.h
>     +++ b/include/qemu/osdep.h
>     @@ -637,6 +637,7 @@ static inline void qemu_timersub(const struct timeval *val1,
>      #endif
> 
>      void qemu_set_cloexec(int fd);
>     +void qemu_clr_cloexec(int fd);
> 
> 
> I wish we would have a single function to set or unset, tbh. (as _clr_ isn't as readable to me)

I would rather not replace the existing qemu_set_cloexec calls, but I will expand clr to clear.

>      /* Starting on QEMU 2.5, qemu_hw_version() returns "2.5+" by default
>       * instead of QEMU_VERSION, so setting hw_version on MachineClass
>     diff --git a/util/oslib-posix.c b/util/oslib-posix.c
>     index e8bdb02..97577f1 100644
>     --- a/util/oslib-posix.c
>     +++ b/util/oslib-posix.c
>     @@ -309,6 +309,15 @@ void qemu_set_cloexec(int fd)
>          assert(f != -1);
>      }
> 
>     +void qemu_clr_cloexec(int fd)
>     +{
>     +    int f;
>     +    f = fcntl(fd, F_GETFD);
>     +    assert(f != -1);
>     +    f = fcntl(fd, F_SETFD, f & ~FD_CLOEXEC);
>     +    assert(f != -1);
>     +}
> 
> 
> (asserting() may not be very judicious for calls that we intend to make during running time, but that's the way it is so far)

yep.

- Steve

>     +
>      /*
>       * Creates a pipe with FD_CLOEXEC set on both file descriptors
>       */
>     diff --git a/util/oslib-win32.c b/util/oslib-win32.c
>     index af559ef..46e94d9 100644
>     --- a/util/oslib-win32.c
>     +++ b/util/oslib-win32.c
>     @@ -265,6 +265,10 @@ void qemu_set_cloexec(int fd)
>      {
>      }
> 
>     +void qemu_clr_cloexec(int fd)
>     +{
>     +}
>     +
>      /* Offset between 1/1/1601 and 1/1/1970 in 100 nanosec units */
>      #define _W32_FT_OFFSET (116444736000000000ULL)
> 
>     -- 
>     1.8.3.1
> 
> 
> 
> 
> -- 
> Marc-André Lureau

