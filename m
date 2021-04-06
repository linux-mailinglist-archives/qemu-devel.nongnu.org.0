Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D84C7355F6D
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Apr 2021 01:29:29 +0200 (CEST)
Received: from localhost ([::1]:53724 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lTv8S-0004vO-FS
	for lists+qemu-devel@lfdr.de; Tue, 06 Apr 2021 19:29:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41580)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dongli.zhang@oracle.com>)
 id 1lTv7L-0004PQ-7J; Tue, 06 Apr 2021 19:28:19 -0400
Received: from userp2120.oracle.com ([156.151.31.85]:38190)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dongli.zhang@oracle.com>)
 id 1lTv7H-00016F-5N; Tue, 06 Apr 2021 19:28:18 -0400
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 136NP920047947;
 Tue, 6 Apr 2021 23:28:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : from : to :
 cc : references : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=YrfbeDXRUu92yUp10fkXmZ/LoLq93ICIvvTTLINpuH0=;
 b=vwI4WPyTNWtH8EfMx4VAHY9zK6+9AKt3jmgQKNlFudwqyRfOleaRRM7IrE4ue13cp55J
 QYZeysLJxMX0dy+JmM2vZ+5bFWGzFeakalHJFyRLg2TvkNagkkYOtwIM61flXj0TFVmn
 mP6ouycKSXPwy+jlLeX5BI4Avpkx4vlTHkXlV+fDGmA/ZJ2b7DBrKW5g3pF7kyjlbfSc
 XHXmLe7dF6UJ/cFNvZ5IcxVRNSsiTPiB2nL8abqvGBYZ3thK9/hJBF0XttS6+fAmIa7+
 oxJ1FHrBpZzkbUqawa+rAk1u1CNL74m9SgpUOBoYDhVzaFnWJ6/uQWwzANY1GlqlCyNr iw== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by userp2120.oracle.com with ESMTP id 37rvas0rwd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 06 Apr 2021 23:28:02 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 136NQ4gq168459;
 Tue, 6 Apr 2021 23:28:01 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2176.outbound.protection.outlook.com [104.47.59.176])
 by aserp3030.oracle.com with ESMTP id 37rvbe1jhg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 06 Apr 2021 23:28:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YmckKnzt2J/A8S9dTrLCPxotJ4LDh0TxcfXNn5sKcxz05TKiamL44b4+SluvbyMOHH0vzbrTIbV8tdlgEmCqgSfMV7Ukcr7bQPWUz/FEb2ekdKpC9FeidFfgtDWGVC6KCQczLwt1dUwoeoKtsSH2TJ8iXtdLYFUZox0IraGkitKmXHz4Ada3VuW5TtluMDeXCx8BxelbyMkcWKPheLybaMRzC5alAHLkeSPqMkd5ZkbQSYDZs/R0TF7Pu4BlaqFvse02C6W8bdD0uMW25jf5KOFKkR4YgwbegbHwJLHRCW0seVyNscH0E3eJ+PtNrqR8bZaEPyXYDHvoYA/+apEbSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YrfbeDXRUu92yUp10fkXmZ/LoLq93ICIvvTTLINpuH0=;
 b=bHwhyKJx2k4iFfxnCs6uN+YOwDSgjfExr29WAo2BdhI2ysRW9/G+l2/hbjC2lqFY/LADfbFA18UjsQQDox7MCvcDif7twz/jSD3IRzxcO5h4sfwH7m8qhF+0oTR3dkzwuvJ8lSBl+m0JtZgGd3vnL6/Bl3QhTlAWIvVk7ETWHxQYhG2D2gsKphkiCaWgm3K5h9Lod9d8WQN82jMp7oTYGCBhEzTT1RZkl9KqbBUcfejNa9DV5FkLFEosoFEGbueB4OBS0qfU+vglbaZlWwiU8pmeyjHtOvkxwlElwxQIb1ffDeUNifClFcCLZLE/aAXMXgcOdYKyStBHRiYQ1+WcSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YrfbeDXRUu92yUp10fkXmZ/LoLq93ICIvvTTLINpuH0=;
 b=HufT9aX9ZslDCqMoxFzViSciLoKDCJ0L4mdp5/tWPCW5NdVlWog2D+FqKsgikjsf9xgxYO8njwgTKGo3XSm1tLOPM++qI3fqiFG7/BsIfZtL+NAeUK0mBzHMiiyf1w4/pZ/Pt75Ltj390WLESRmeKYaznBwwd1Fc/SN8z8jyPqg=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB2663.namprd10.prod.outlook.com (2603:10b6:a02:a9::20)
 by BY5PR10MB4066.namprd10.prod.outlook.com (2603:10b6:a03:1fe::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.27; Tue, 6 Apr
 2021 23:27:58 +0000
Received: from BYAPR10MB2663.namprd10.prod.outlook.com
 ([fe80::44f7:1d8f:cc50:48ad]) by BYAPR10MB2663.namprd10.prod.outlook.com
 ([fe80::44f7:1d8f:cc50:48ad%6]) with mapi id 15.20.4020.016; Tue, 6 Apr 2021
 23:27:58 +0000
Subject: Re: [PATCH 0/6] Add debug interface to kick/call on purpose
From: Dongli Zhang <dongli.zhang@oracle.com>
To: Jason Wang <jasowang@redhat.com>, qemu-block@nongnu.org,
 qemu-devel@nongnu.org
References: <20210326054433.11762-1-dongli.zhang@oracle.com>
 <440216a8-821f-92dd-bc8b-fb2427bdc0e6@redhat.com>
 <d5549b12-d269-a04d-01d2-2dbd1ee7fca0@oracle.com>
 <ceb1f31a-e353-2542-a516-68b49735672c@redhat.com>
 <9248ae00-9a7d-c960-a673-9b3a3ede0452@oracle.com>
 <da0ae46e-da09-5894-21d4-732e5e20d070@redhat.com>
 <2e48f463-0a17-4ffd-c3a6-4a847e0e34c6@oracle.com>
 <5b21b2a2-e3bd-3812-61d7-bd3550cf680f@redhat.com>
 <f2a81508-e000-4a48-a023-290d40a77b8e@oracle.com>
Message-ID: <b96ca94e-01a6-f018-6d11-d3837c9501c1@oracle.com>
Date: Tue, 6 Apr 2021 16:27:55 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <f2a81508-e000-4a48-a023-290d40a77b8e@oracle.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [2601:646:c303:6700::d22a]
X-ClientProxiedBy: SN4PR0701CA0007.namprd07.prod.outlook.com
 (2603:10b6:803:28::17) To BYAPR10MB2663.namprd10.prod.outlook.com
 (2603:10b6:a02:a9::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2601:646:c303:6700::d22a] (2601:646:c303:6700::d22a) by
 SN4PR0701CA0007.namprd07.prod.outlook.com (2603:10b6:803:28::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.16 via Frontend
 Transport; Tue, 6 Apr 2021 23:27:57 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: eafc65b7-ec0e-47ca-2b5e-08d8f9539cf4
X-MS-TrafficTypeDiagnostic: BY5PR10MB4066:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BY5PR10MB4066559BE1DF2E9BA3978F37F0769@BY5PR10MB4066.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tJ6MK7ZxkpwNms1ExNffetwuqoZ93n/zoZCyoXfBBhwBKD/baLMosgVAZ4wwQS1o6ogzQEb6BUN0sYwI20LitVIPMpp2pTvadzplYsjBA5T4xREOo7ADyFEHjPA5SEvmNtVzw+waNa7OfE2WlExBNhrk/U8bfP9XOcAIR6tExgj/wy3S/+ZUuVdrQvMiPnUJwNFPA6BRHEJ4N3lWbslpKbVUGYZh2nfWpULZSPQUK2a8YcAlw9Z7yb4EEIKUEYxphoxxXkIoJGnKtFvNBxQwBo6z6S192SaCLE6LywLqHqdwKo0JDKksjteEDnjtDP/ZkyzIQVbqou5aoyx7t0wSdsJ8/dEXz36ZTiRr2vzfZGjZDXNWmUul2Gs/JdpsPldbX07ZL5DHDe31y5BxH6QmiPkBlhkFpiM0Cg2X/vHuwo9qIk14wsetI4LnTQdG3Ko8j5IbCyabNknanIgz+szERQbCivhLOH76FvgzZa23BM7RJ/tzPYgUx544wQl+kTE+JnN0qcj6WZ4sIKlebPDLktQxD+qFzbEMGh0ezHfGNntxgzs0jfjNZkTJKkQaolrx14UfldPIspt1JnZ41anJEKTsyxmdydiC6bRZxE0UQCwlNWya/qGGeLnWh8WafiTbW2Ir/l7X/Bn+I5viokjcJC39NLuZZ3g2JxywPb6UDCJeZakOj8BX2QiFEYtiz5wKwJWYWcQs0xMxu+XCPjgdWQ0a+hqC6zsdFrLEWouUWKvA6a/EQSOZqMxBXFmftovXcZpk1Mm21Bi9ygXL8o6JfxwmhpSrw5YA0CX7shy2JO8ZUsvxwoqWZPBmZtUV17Y3GGq0+gp/vPGsqjV6esGyDw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB2663.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(39860400002)(396003)(346002)(366004)(376002)(4326008)(6486002)(83380400001)(44832011)(316002)(31686004)(8936002)(2616005)(966005)(36756003)(8676002)(38100700001)(53546011)(2906002)(66476007)(66556008)(478600001)(16526019)(66946007)(31696002)(30864003)(5660300002)(7416002)(86362001)(186003)(21314003)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?VXZPaERjUWtLVDhhL1VHYzhUcHYwUzJySFRYRHRvZm96VUdWcXladW1UZWRN?=
 =?utf-8?B?SlZzSzVPRWhaSFBsYmlsdnVua2daZ2p5Qi84QmFkUGR3TDVjR0VDUmEwR3hZ?=
 =?utf-8?B?Umhad0dOTWlQcFZTZW1RMHVvVzc0bzdnM0pIWTJzelZLZnlCVGJUQTcwdjRh?=
 =?utf-8?B?YkdsWktzS2xSamtjdG9HYzRPd0NiVHRZUDdXTVhBUm5xc2xJY0x6dnRKME9O?=
 =?utf-8?B?WFI3a0VOeEFwQ1FFek5NWEhCbUNlZm5QQ0k1VW95MVgwMTQ1NU1jR3dQenVQ?=
 =?utf-8?B?emhWeGpjbHVkU29mV3dpZkJGTnJtNDl0WlhwUG50VC9ORTBiT25zd2JMeTFM?=
 =?utf-8?B?ZHQvZzc5cnpaVDh4T1hHaFhhSmh4TUwwUHZkbTlLL2pzYUpSQVVpL0FudUlE?=
 =?utf-8?B?blM4VVZlVEF6UitTTVJTYmx0SERvWXozazlOMWt5Z25tMnAwYnpsbENwS3JU?=
 =?utf-8?B?enFUQjJHNWk1dXZLS0EyVzd4YlBJWXgvOWtxeWR5MXNadkVQQUdnUDBMQ1Ft?=
 =?utf-8?B?ODdCVVBOY3l0SzdxdjlSU1pIemNPcVJZRk9mZWhPQitub0hrUllXSENaalJI?=
 =?utf-8?B?aysyTThSR0NVbmIwLy9KTjVpeC9VVlBUeU44VTVQVTdzSW5kcTFYc2M0WC9q?=
 =?utf-8?B?emxNR1M0bkxMakkydzFuZm96ZmdBbDZHV3BjUzEyQmd4VGtiWWQwN2cwWERK?=
 =?utf-8?B?ZkFyUVc2anNVZ2xoUi9LRllLSXFua1ZJYWswT3ZpTG9iQW00ZHpuUFpsQU9M?=
 =?utf-8?B?TDI0TmVZZjE4b1NweTRzN3ByR2NGT3NEQit2ODR4aDAxbjRXL2lGbi80NHZo?=
 =?utf-8?B?V3FHWnd1MldocTlEbTBXL004ODJiZXNLcElHOUFBTGNBRFowOWtaajlOM1dU?=
 =?utf-8?B?dXduSVdaRzR1UUFGbzhNYXdObDdVeThYRE51Mk9IUm05S1FNRzBBZjJuN3JN?=
 =?utf-8?B?bVNFdCsyWDdpNjVId3BEd1IwaEdlOG1zeitXUnNCeWNoNjRxMDNwLzFtZklq?=
 =?utf-8?B?dGh3MEhzQ0d4R3JFdCsrTUc0VFhYWWZlN25IY3c3WVhCR1VKOFZkVG84aDhU?=
 =?utf-8?B?a3pBNmJVbVFaVE5kTEJNUnBPaitSc3QrRGVWWXZiQmRBSThMTzQzbFV6Ymd5?=
 =?utf-8?B?LzJvQ25Zbkt4NmpIdC8yRElHOVhLRnM0L1c1MDdOMG5ieTZLbXlYS0J2SDUy?=
 =?utf-8?B?VXY5NkNSbEg3SXlScnZ6R3dnNnBvZWowK2lJZGJFc3FrWE1EOE9heThFaGl1?=
 =?utf-8?B?ZnhzZk5FaEpkL3pPTlpkQmZkYnNNb1ArOHRXaTROMGZrMitheGpJMDB1VjJU?=
 =?utf-8?B?TXFLT3oyVVJHNjZacVloU2QwZDRxUllMUXBldDRXMEd0amFrL2RtZ2RpZ2Jh?=
 =?utf-8?B?SUswc3o4dFNlQnNLMHBtMWFvRGpxY2dPZGxLcTAvbDV0TWJuQ3ZKVCtwVGhD?=
 =?utf-8?B?ZE1pODVlVmdoaUQ3amlhQ09hN3FHTFBGTjk0ZllBK3VtcFJLSXM3aFcwM1RN?=
 =?utf-8?B?ZWRhaXh0ZUJXOFNvUlcvdXI1dm9ZMFlXZzJoWkFuRFMwYng4ZVpBallCdXBV?=
 =?utf-8?B?TnQyYjJ0c05VMkI3N2lQaERvUkE4UkY5dzRJNnAwRFpMYlZZYW9NU2lBRnhs?=
 =?utf-8?B?bkZ2RjB4QmxtVktIZEtXbGFiMm1MN3NRa1A3R1F6OEM2dXNNa2pCVzY5RXhO?=
 =?utf-8?B?M2FDZ0F5dVl1a0RiUGxvQStNMHBtZ3NQdm54aFJSRHJ0M3A3Mml0ZC9vcVpU?=
 =?utf-8?B?RGJMY2dHVUJkWjdiaXpEejNIdGdnYVZEMEpjVS95OVp2WXE3UXBqWlp0d0d2?=
 =?utf-8?Q?lsxCEkuPF3aSKc4h46FTPmxMGgy6E5nPjBNPE=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eafc65b7-ec0e-47ca-2b5e-08d8f9539cf4
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB2663.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2021 23:27:58.7132 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qmD/NXajiuamgp42SNZIjlvNKVOxipZzysFw71xJR02BQwVpe6j4sjs5rGibn2kHl62apnv3CtJxNKGHPB7tYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4066
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9946
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 mlxlogscore=999
 malwarescore=0 mlxscore=0 phishscore=0 spamscore=0 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104060160
X-Proofpoint-GUID: t3Bp5rND9v5aGZiCnSqkVC4-EbUtWDqT
X-Proofpoint-ORIG-GUID: t3Bp5rND9v5aGZiCnSqkVC4-EbUtWDqT
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9946
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 lowpriorityscore=0 adultscore=0
 priorityscore=1501 malwarescore=0 mlxlogscore=999 clxscore=1015
 bulkscore=0 mlxscore=0 phishscore=0 spamscore=0 suspectscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104060160
Received-SPF: pass client-ip=156.151.31.85;
 envelope-from=dongli.zhang@oracle.com; helo=userp2120.oracle.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: kwolf@redhat.com, fam@euphon.net, berrange@redhat.com, ehabkost@redhat.com,
 mst@redhat.com, joe.jin@oracle.com, armbru@redhat.com, dgilbert@redhat.com,
 stefanha@redhat.com, pbonzini@redhat.com, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 4/6/21 1:43 AM, Dongli Zhang wrote:
> 
> 
> On 4/5/21 6:55 PM, Jason Wang wrote:
>>
>> 在 2021/4/6 上午4:00, Dongli Zhang 写道:
>>>
>>> On 4/1/21 8:47 PM, Jason Wang wrote:
>>>> 在 2021/3/30 下午3:29, Dongli Zhang 写道:
>>>>> On 3/28/21 8:56 PM, Jason Wang wrote:
>>>>>> 在 2021/3/27 上午5:16, Dongli Zhang 写道:
>>>>>>> Hi Jason,
>>>>>>>
>>>>>>> On 3/26/21 12:24 AM, Jason Wang wrote:
>>>>>>>> 在 2021/3/26 下午1:44, Dongli Zhang 写道:
>>>>>>>>> The virtio device/driver (e.g., vhost-scsi or vhost-net) may hang due to
>>>>>>>>> the loss of doorbell kick, e.g.,
>>>>>>>>>
>>>>>>>>> https://urldefense.com/v3/__https://lists.gnu.org/archive/html/qemu-devel/2018-12/msg01711.html__;!!GqivPVa7Brio!KS3pAU2cKjz4wgI4QSlE-YsJPhPG71nkE5_tGhaOf7mi_xvNxbvKkfn03rk5BNDLSEU$
>>>>>>>>>
>>>>>>>>>
>>>>>>>>>
>>>>>>>>>
>>>>>>>>> ... or due to the loss of IRQ, e.g., as fixed by linux kernel commit
>>>>>>>>> fe200ae48ef5 ("genirq: Mark polled irqs and defer the real handler").
>>>>>>>>>
>>>>>>>>> This patch introduces a new debug interface 'DeviceEvent' to DeviceClass
>>>>>>>>> to help narrow down if the issue is due to loss of irq/kick. So far the new
>>>>>>>>> interface handles only two events: 'call' and 'kick'. Any device (e.g.,
>>>>>>>>> virtio/vhost or VFIO) may implement the interface (e.g., via eventfd, MSI-X
>>>>>>>>> or legacy IRQ).
>>>>>>>>>
>>>>>>>>> The 'call' is to inject irq on purpose by admin for a specific device
>>>>>>>>> (e.g.,
>>>>>>>>> vhost-scsi) from QEMU/host to VM, while the 'kick' is to kick the doorbell
>>>>>>>>> on purpose by admin at QEMU/host side for a specific device.
>>>>>>>>>
>>>>>>>>>
>>>>>>>>> This device can be used as a workaround if call/kick is lost due to
>>>>>>>>> virtualization software (e.g., kernel or QEMU) issue.
>>>>>>>>>
>>>>>>>>> We may also implement the interface for VFIO PCI, e.g., to write to
>>>>>>>>> VFIOPCIDevice->msi_vectors[i].interrupt will be able to inject IRQ to VM
>>>>>>>>> on purpose. This is considered future work once the virtio part is done.
>>>>>>>>>
>>>>>>>>>
>>>>>>>>> Below is from live crash analysis. Initially, the queue=2 has count=15 for
>>>>>>>>> 'kick' eventfd_ctx. Suppose there is data in vring avail while there is no
>>>>>>>>> used available. We suspect this is because vhost-scsi was not notified by
>>>>>>>>> VM. In order to narrow down and analyze the issue, we use live crash to
>>>>>>>>> dump the current counter of eventfd for queue=2.
>>>>>>>>>
>>>>>>>>> crash> eventfd_ctx ffff8f67f6bbe700
>>>>>>>>> struct eventfd_ctx {
>>>>>>>>>       kref = {
>>>>>>>>>         refcount = {
>>>>>>>>>           refs = {
>>>>>>>>>             counter = 4
>>>>>>>>>           }
>>>>>>>>>         }
>>>>>>>>>       },
>>>>>>>>>       wqh = {
>>>>>>>>>         lock = {
>>>>>>>>>           {
>>>>>>>>>             rlock = {
>>>>>>>>>               raw_lock = {
>>>>>>>>>                 val = {
>>>>>>>>>                   counter = 0
>>>>>>>>>                 }
>>>>>>>>>               }
>>>>>>>>>             }
>>>>>>>>>           }
>>>>>>>>>         },
>>>>>>>>>         head = {
>>>>>>>>>           next = 0xffff8f841dc08e18,
>>>>>>>>>           prev = 0xffff8f841dc08e18
>>>>>>>>>         }
>>>>>>>>>       },
>>>>>>>>>       count = 15, ---> eventfd is 15 !!!
>>>>>>>>>       flags = 526336
>>>>>>>>> }
>>>>>>>>>
>>>>>>>>> Now we kick the doorbell for vhost-scsi queue=2 on purpose for diagnostic
>>>>>>>>> with this interface.
>>>>>>>>>
>>>>>>>>> { "execute": "x-debug-device-event",
>>>>>>>>>       "arguments": { "dev": "/machine/peripheral/vscsi0",
>>>>>>>>>                      "event": "kick", "queue": 2 } }
>>>>>>>>>
>>>>>>>>> The counter is increased to 16. Suppose the hang issue is resolved, it
>>>>>>>>> indicates something bad is in software that the 'kick' is lost.
>>>>>>>> What do you mean by "software" here? And it looks to me you're testing
>>>>>>>> whether
>>>>>>>> event_notifier_set() is called by virtio_queue_notify() here. If so, I'm not
>>>>>>>> sure how much value could we gain from a dedicated debug interface like this
>>>>>>>> consider there're a lot of exisinting general purpose debugging method like
>>>>>>>> tracing or gdb. I'd say the path from virtio_queue_notify() to
>>>>>>>> event_notifier_set() is only a very small fraction of the process of
>>>>>>>> virtqueue
>>>>>>>> kick which is unlikey to be buggy. Consider usually the ioeventfd will be
>>>>>>>> offloaded to KVM, it's more a chance that something is wrong in setuping
>>>>>>>> ioeventfd instead of here. Irq is even more complicated.
>>>>>>> Thank you very much!
>>>>>>>
>>>>>>> I am not testing whether event_notifier_set() is called by
>>>>>>> virtio_queue_notify().
>>>>>>>
>>>>>>> The 'software' indicates the data processing and event notification mechanism
>>>>>>> involved with virtio/vhost PV driver frontend. E.g., while VM is waiting
>>>>>>> for an
>>>>>>> extra IRQ, vhost side did not trigger IRQ, suppose vring_need_event()
>>>>>>> erroneously returns false due to corrupted ring buffer status.
>>>>>> So there could be several factors that may block the notification:
>>>>>>
>>>>>> 1) eventfd bug (ioeventfd vs irqfd)
>>>>>> 2) wrong virtqueue state (either driver or device)
>>>>>> 3) missing barriers (either driver or device)
>>>>>> 4) Qemu bug (irqchip and routing)
>>>>>> ...
>>>>> This is not only about whether notification is blocked.
>>>>>
>>>>> It can also be used to help narrow down and understand if there is any
>>>>> suspicious issue in blk-mq/scsi/netdev/napi code. The PV drivers are not only
>>>>> drivers following virtio spec. It is closely related to many of other kernel
>>>>> components.
>>>>>
>>>>> Suppose IO was recovered after we inject an IRQ to vhost-scsi on purpose, we
>>>>> will be able to analyze what may happen along the IO completion path starting
>>>>> from when /where the IRQ is injected ... perhaps the root cause is not with
>>>>> virtio but blk-mq/scsi (this is just an example).
>>>>>
>>>>>
>>>>> In addition, this idea should help for vfio-pci. Suppose the developer for a
>>>>> specific device driver suspects IO/networking hangs because of loss if IRQ, we
>>>>> will be able to verify if that assumption is correct by injecting an IRQ on
>>>>> purpose.
>>>>>
>>>>> Therefore, this is not only about virtio PV driver (frontend/backend), but also
>>>>> used to help analyze the issue related to entire IO/networking/passthrough
>>>>> virtualization stacks, especially in production env where the issue can only be
>>>>> reproduced randomly.
>>>>
>>>> So it looks to me you'd better having things like this in the EventNotifier
>>>> layer and introduce qmp commands to write/read that instead of starting with a
>>>> virtio specific commands. Or it might be even helpful to start from some
>>>> counters for event notifiers which could be accessed via monitor to help to for
>>>> debugging to start with which is much more safe in the environment of
>>>> production. Having artifical events are always dangerous.
>>>
>>> The EventNotifier is just fd used by different QEMU components. There is not a
>>> way to track each EventNotifier used by a QEMU process so that I do not think we
>>> are able to track at EventNotifier layer, unless we add extra code to track the
>>> init/uninit of each eventfd, or modify kernel.
>>>
>>> That's try I introduced "DeviceEvent event" to "struct DeviceClass" so that each
>>> device type will be able to customize its own way to track its eventfd list.
>>>
>>>
>>> Would you prefer "write to a specific eventfd for a specific QEMU device",
>>> instead of "kick/call for a specific device"?
>>
>>
>> It might be better. But note that eventfd is Linux specific, that's why we need
>> do it at higher level (EventNotifier level to make it work for e.g win).
>>
>> And it might be even better to start with reading the counters.
> 
> Is it possible to read from eventfd without modifying kernel?
> 
> QEMU has only event_notifier_test_and_clear(). According to kernel code, to read
> from eventfd will decreate ctx->count as line 190.
> 
> 185 void eventfd_ctx_do_read(struct eventfd_ctx *ctx, __u64 *cnt)
> 186 {
> 187         lockdep_assert_held(&ctx->wqh.lock);
> 188
> 189         *cnt = (ctx->flags & EFD_SEMAPHORE) ? 1 : ctx->count;
> 190         ctx->count -= *cnt;
> 191 }
> 
> Can I assume it is not appropriate to read from eventfd?
> 
>>
>>
>>>
>>>
>>>>
>>>>>> Consider we want to debug virtio issue, only 2) or 3) is what we really cared>
>>>>>> So for kick you did (assume vhost is on):
>>>>>>
>>>>>> virtio_device_event_kick()
>>>>>>       virtio_queue_notify()
>>>>>>           event_notifier_set()
>>>>>>
>>>>>> It looks to me you're actaully testing if ioeventfd is correctly set by Qemu.
>>>>>>
>>>>>> For call you did:
>>>>>>
>>>>>> virtio_device_event_call()
>>>>>>       event_notifier_set()
>>>>>>
>>>>>> A test of irqfd is correctly set by Qemu. So all of those are not virtio
>>>>>> specific stuffs but you introduce virtio specific command to do debug non
>>>>>> virtio
>>>>>> functions.
>>>>>>
>>>>>> In the case of what you mentioned for vring_need_event(), what we really
>>>>>> want is
>>>>>> to dump the virtqueue state from the guest. This might requries some work of
>>>>>> extending virtio spec (e.g to dump device status like indices, event, wrap
>>>>>> counters).
>>>>> Suppose the issue is only randomly reproducible in production env, we should
>>>>> always take 4) into consideration because we will not be able to know where is
>>>>> the root cause at the very beginning of bug analysis.
>>>>
>>>> So if it truns out to be an issue of irqchip, how will you do the debugging
>>>> then? I guess what's really helpful is a qmp command to dump irqchip
>>>> status/information.
>>> Thank you very much for suggestion. That will be a different problem and we may
>>> consider as future work.
>>>
>>> This patchset is about to do introduce change/events to help narrow down where
>>> may be the root case in order to facilitate diagnostic (especially for prod env
>>> issue and when it is not easy to reproduce).
>>>
>>>>
>>>>>>> This was initially proposed for vhost only and I was going to export
>>>>>>> ioeventfd/irqfd from vhost to admin via sysfs. Finally, I realized I would
>>>>>>> better implement this at QEMU.
>>>>>>>
>>>>>>> The QEMU inits the eventfd (ioeventfd and irqfd), and offloads them to
>>>>>>> KVM/vhost. The VM side sends requests to ring buffer and kicks the doorbell
>>>>>>> (via
>>>>>>> ioeventfd), while the backend vhost side sends responses back and calls
>>>>>>> the IRQ
>>>>>>> (via ioeventfd).
>>>>>>>
>>>>>>> Unfortunately, sometimes there is issue with virtio/vhost so that
>>>>>>> kick/call was
>>>>>>> missed/ignored, or even never triggered. The example mentioned in the
>>>>>>> patchset
>>>>>>> cover letter is with virtio-net (I assume vhost=on), where a kick to ioventfd
>>>>>>> was ignored, due to pci-bridge/hotplug issue.
>>>>>> So this is not a good example since it was a chipset bug. You need to use
>>>>>> other
>>>>>> tool to debug chipset code isn't it?
>>>>> As this issue is reproducible only randomly, we will not be able to realize it
>>>>> is a chipset bug at the very beginning.
>>>>>
>>>>> While the link is about vhost-net, it is applicable to vhost-scsi as well.
>>>>> Suppose DEBUG_UNASSIGNED is not enabled, the developer will need to investigate
>>>>> all of blk-mq, scsi, virtio-scsi (ioeventfd), vhost-scsi (target), pci-bridge
>>>>> and pci-hotplug, in order to identify the root case.
>>>>>
>>>>> The "call/kick" interface is used to narrow down and verify the analysis,
>>>>> especially when many kernel components are involved.
>>>>>
>>>>>>> The hotplug is with a very small window but the IO hangs permanently. I did
>>>>>>> test
>>>>>>> that kicking the doorbell again will help recover the IO, so that I would be
>>>>>>> able to conclude this was due to lost of kick.
>>>>>>>
>>>>>>> The loss of irq/doorbell is painful especially in production environment
>>>>>>> where
>>>>>>> we are not able to attach to QEMU via gdb. While the patchset is only for
>>>>>>> QEMU,
>>>>>>> Xen PV driver used to experience loss of IRQ issue as well, e.g., linux
>>>>>>> kernel
>>>>>>> commit 4704fe4f03a5 ("xen/events: mask events when changing their VCPU
>>>>>>> binding").
>>>>>> So looking at the git history we can see it has little possibility that the
>>>>>> missing is due to virtio/vhost itself. So the commit you mention here is not
>>>>>> good as well since it's not a netfront/netbackend bug.
>>>>> I mentioned the xen issue just to explain that the loss of event/irq issue may
>>>>> happen and is very painful. Another xen example is (equivalent to KVM VFIO):
>>>>>
>>>>> https://urldefense.com/v3/__https://xenbits.xen.org/gitweb/?p=xen.git;a=commit;h=56348df32bbc782e63b6e3fb978b80e015ae76e7__;!!GqivPVa7Brio!JY2OqmcXAmza_G2gR-dQwV2Oa0hGG_6trVkxSUMocoYi4A_VXwZbzVn_VA9yx10i7Hk$
>>>>>
>>>>
>>>>
>>>> Sorry, I can't figure out how is this related to VFIO or virtio. It should be
>>>> reproducible for devices without using eventfd?
>>>>
>>> Yes, although not involving eventfd, other drivers/virtualization may encounter
>>> the loss of irq/kick as well. There is no relation between xen and vfio/virtio.
>>>
>>> That's why a diagnostic interface is appreciated.
>>>
>>> In my opinion, the 'diagnostic' is not only to collect data,
>>
>>
>> Usually, collecting the data is the first step :)
>>
>>
>>>   but also to
>>> introduce event/change (e.g., inject IRQ) and then monitor/observe what will
>>> happen to the stalled VM.
>>
>>
>> It might be helpful yes, but it's also very dangerous.
>>
>>
>>>
>>>>> That's why I mentioned this idea helps for VFIO (not only VFIO, but actually
>>>>> blk-mq+nvme+pci+kvm+vfio, assuming it is for nvme passthrough) as well.
>>>>>
>>>>>> So for the case of event call, what you did is:
>>>>>>
>>>>>> satic void virtio_device_event_call(VirtQueue *vq, bool eventfd,
>>>>>>                                        Error **errp)
>>>>>> {
>>>>>> #ifdef DEBUG_VIRTIO_EVENT
>>>>>>       printf("The 'call' event is triggered for path=%s, queue=%d,
>>>>>> irqfd=%d.\n",
>>>>>>              object_get_canonical_path(OBJECT(vq->vdev)),
>>>>>>              vq->queue_index, eventfd);
>>>>>> #endif
>>>>>>
>>>>>>       if (eventfd) {
>>>>>>           virtio_set_isr(vq->vdev, 0x1);
>>>>>>           event_notifier_set(&vq->guest_notifier);
>>>>>>       } else {
>>>>>>           virtio_irq(vq);
>>>>>>       }
>>>>>> }
>>>>>>
>>>>>> This means, when eventfd is set, you bypasses the MSI mask which is very
>>>>>> dangerous to make it used in the case of production environment. And if you
>>>>>> check masking, it won't help a lot if the MSI is masked wrongly.
>>>>> You are right.
>>>>>
>>>>> Only the vhost-net is dangerous because it masks a vector by registering an
>>>>> alternative masked_notifier to KVM, while virtio-blk/vhost-scsi/virtio-scsi
>>>>> will
>>>>> un-register the guest notifier.
>>>>>
>>>>>>> This can help "narrow down" if the IO/networking hang is due to loss of
>>>>>>> IRQ/doorbell issue (or VM MSI-x is erroneously masked), especially in
>>>>>>> production
>>>>>>> env. This can also be used as a workaround so that VM owner will not need to
>>>>>>> reboot VM.
>>>>>> So having such extra workaround is pretty dangerous in production environemnt
>>>>>> where I think we need to be conservative which means we need to collect
>>>>>> information instead of generating artificial event.
>>>>>>
>>>>>> And it doesn't help if the wrokaround can be triggered through management API.
>>>>> I agree with this.
>>>>>
>>>>> This depends on the administrator. This workaround should only be used in very
>>>>> limited and special case.
>>>>>
>>>>>>> In addition, the VFIO will benefit from it. We will be able to test if to
>>>>>>> inject
>>>>>>> IRQ on purpose helps when the driver (e.g., PCI, NVMe, Ethernet) developers
>>>>>>> blame the hang is caused by loss of IRQ with KVM/VFIO.(It seems there is more
>>>>>>> chance to loose IRQ during CPU hotplug or changing IRQ affinity).
>>>>>>>
>>>>>>>> I think we could not gain much for introducing an dedicated mechanism for
>>>>>>>> such a
>>>>>>>> corner case.
>>>>>>> As replied by Dave for prior RFC, the QEMU already supports
>>>>>>> hmp_ioport_write to
>>>>>>> trigger an ioport write on purpose.
>>>>>> If that applies. I would rather have a hmp_mem_write then we can test both MSI
>>>>>> and doorbell. But again, they are very dangerous to be used in production
>>>>>> envronment.
>>>>> This is just not convenient for production env administrator. We will need to
>>>>> first obtain the virtio pci info (e.g., via "lspci -vv"), and then prepare for
>>>>> the command after calculating the address of doorbell.
>>>>>
>>>>> Something bad may happen if the developer did not calculate the address
>>>>> correctly.
>>>>
>>>> It won't be worse than hmp_ioport_write I think?
>>> I always believe it is worth adding hmp_mem_write().
>>>
>>> While it won't be worse than hmp_ioport_write(), in my opinion, it is not as
>>> easy/convenient as to write to eventfd.
>>>
>>>>
>>>>> It should be much more easier for developer to just ask administrator to "call"
>>>>> queue X for a specific virtio device.
>>>>
>>>> We can have the commands like "info virtio" which can show all the MSI/doorbell
>>>> information for user to use. Or limit its use for virtio and vfio device only to
>>>> avoid unexpected result.
>>> So far the method by this patchset is to introduce "DeviceEvent event" to
>>> "struct DeviceClass".
>>>
>>> Only virtio-pci-xxx and vfio (future work) will implement this interface.
>>>
>>>
>>>>
>>>>>>> The linux block layer also supports the below to kick the IO queue on
>>>>>>> purpose.
>>>>>>>
>>>>>>> echo "kick" > /sys/kernel/debug/block/sda/state
>>>>>> This might be fine for hardware device but not virtio. The device can
>>>>>> choose to
>>>>>> poll the virtqueue instead of depending of the doorbell to work. And for
>>>>>> networking subsystem, we don't have such stuffs, instead ethtool support to
>>>>>> dump
>>>>>> ring and vendor specific stuffs which could be used for dumping virtqueue
>>>>>> state
>>>>>> in this case.
>>>>> This is just another example to help explain the philosophy behind the
>>>>> "kick/call" idea: sometimes to trigger the event on purpose will help us narrow
>>>>> down and verify our analysis of a kernel bug, especially a bug that is only
>>>>> randomly reproducible in production environment.
>>>>>
>>>>>
>>>>> I understand it is possibly not proper to introduce such interface to QEMU.
>>>>> That's why I used to send out the RFC.
>>>>>
>>>>> https://urldefense.com/v3/__https://lists.nongnu.org/archive/html/qemu-devel/2021-01/msg03441.html__;!!GqivPVa7Brio!JY2OqmcXAmza_G2gR-dQwV2Oa0hGG_6trVkxSUMocoYi4A_VXwZbzVn_VA9yu-n97gA$
>>>>>
>>>>>
>>>>> In my opinion, this interface is pretty useful when the diagnostic invokes many
>>>>> kernel components, or when developers from different components are working on
>>>>> the same bug, no matter whether the root cause is at virtio or not.
>>>>
>>>> So for virtio, it's not hard to events without those interface. E.g for
>>>> networking you can generate some traffic and trace on where-ever you suspect
>>>> that could block the event (kick/call).
>>> Suppose the vhost-net backend is TUN. Once virtio-net RX path is stuck and its
>>> vring is full, the ring used by tun_net_xmit()-->ptr_ring_produce() will be full
>>> as well. I do not have a way to generate traffic for RX path in such situation.
>>
>>
>> Right, but as discussed, we need interface to dump virtqueue state, then it
>> would be very easy to start with.
>>
>>
>>>
>>>> I still prefer hmp_mem_write()/read() which looks more generic, in the same
>>>> time, we can add more debug informaiton likes:
>>>>
>>>> 1) satistics like eventfd counters
>>>> 2) device information, register layout, doorbell/MSI-X information
>>>> 3) irqchip infromation
>>> Would you mind help for below questions?
>>>
>>> 1. Regardless about kick/call or hmp_mem_write(), is it safe to add such
>>> interfaces? I think it is safe because:
>>>
>>> (1) This affects only specific VM (QEMU), not all/others.
>>>
>>> (2) It is dangerous only when sysadmin triggers the events on purpose. If this
>>> interface is dangerous, both "(qemu) mce 0 1 0xb200000000000000 0x0 0x0 0x0" (to
>>> inject uncorrected error) and "echo c > /proc/sysrq-trigger" (to crash kernel)
>>> will be dangerous as well.
>>>
>>> (3) While this is implemented for only vhost-scsi-pci and vhost-vhost-pci, I do
>>> not see issue for host kernel. It will be security bug if to read/write eventfd
>>> from userspace crashes kernel space.
>>>
>>> (4) We primarily use this interface when VM is running into issue (unless we use
>>> it as workaround).
>>
>>
>> Besides the above, I think it's only "safe" if we clearly define the semanic of
>> this command. E.g:
>>
>> 1) Does it work at EventNotifier (eventfd) level or virtio/vfio level?
> 
> I am still confused with the difference between EventNotifier level and
> virtio/vfio level.
> 
> There is not a global mechanism to track the EventNotifier used by each device.
> We will still need per-device-type interface to dump EventNotifier for each device.
> 
> Please see more below.
> 
>> 2) Can it bypass the masking?
> 
> This is a good question and please see below for the answer.
> 
>>
>>
>>>
>>>
>>> 2. Is it fine to add such interface to QEMU software upstream, or such interface
>>> is not good for software upstream so that the interface should be added only
>>> when QEMU is customized for specific products' usage?
>>
>>
>> We can listen to the comments from other experts on the list. But I think having
>> a generic trigger at EventNotifier level should be ok.
> 
> Would you mind share and confirm if this is what you are looking for?
> 
> To dump EventNotifier for each device.
> 
> (qemu) x-debug-device-event-notifier /machine/peripheral/vscsi0 dump
> 
> ... list all event-notifier related to this device ...
> 
> 
> Write to a specific EventNotifier. The id is from prior dump.
> 
> (qemu) x-debug-device-event-notifier /machine/peripheral/vscsi0 write <dump id>
> 
> ... print which event-notifier is written to ...
> 
> 
> This will answer your question that "Can it bypass the masking?".
> 
> For vhost-scsi, virtio-blk, virtio-scsi and virtio-net, to write to eventfd is
> not able to bypass masking because masking is to unregister the eventfd. To
> write to eventfd does not take effect.
> 
> However, it is possible to bypass masking for vhost-net because vhost-net
> registered a specific masked_notifier eventfd in order to mask irq. To write to
> original eventfd still takes effect.
> 
> We may leave the user to decide whether to write to 'masked_notifier' or
> original 'guest_notifier' for vhost-net.

My fault here. To write to masked_notifier will always be masked :(

If it is EventNotifier level, we will not care whether the EventNotifier is
masked or not. It just provides an interface to write to EventNotifier.

To dump the MSI-x table for both virtio and vfio will help confirm if the vector
is masked.

Thank you very much!

Dongli Zhang

> 
> Thank you very much!
> 
> Dongli Zhang
> 
> 
>>
>> Thanks
>>
>>
>>>
>>>
>>> We may discuss how, e.g., hmp_mem_write() vs. kick/call if it is fine to add
>>> such interfaces.
>>>
>>> Thank you very much!
>>>
>>> Dongli Zhang
>>>
>>
> 

