Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F1F9734E237
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Mar 2021 09:31:15 +0200 (CEST)
Received: from localhost ([::1]:34324 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lR8qJ-0006G1-0u
	for lists+qemu-devel@lfdr.de; Tue, 30 Mar 2021 03:31:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34900)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dongli.zhang@oracle.com>)
 id 1lR8oa-0005a0-PK; Tue, 30 Mar 2021 03:29:28 -0400
Received: from userp2120.oracle.com ([156.151.31.85]:47624)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dongli.zhang@oracle.com>)
 id 1lR8oW-0005S6-AQ; Tue, 30 Mar 2021 03:29:28 -0400
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 12U7SniL026973;
 Tue, 30 Mar 2021 07:29:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=KWG+TBB1HxDi6rAJEQzVivby3LvQS1z8N0dm/lqmma4=;
 b=BXKaod6X7pWtYCfN5L+HDDdgRVMDNqYu9By+15vLGeownoK0zLYr51AQHqVM8CCXoz85
 QGTXizcG4FZxTTrg2mKkb96sufSo82oWL0AwqHx09emjGmma2vtBY1ZpErzs0lIQz7Qj
 49P0NVUMRPP8V3sXGCcYehSx1ZTuQM+yyx9SO3K2Rl2CH4/FM0XaiEWrsvuw+YIZ+7il
 iJ9EWorUJz+bNOuWIZv/NEuFHkUYl0Iz2VrQ9V3T6ER6cTjgBM25lLuosiAccqGEnUFf
 EneTIvx2dMXI8McsXY9XG+qIMtCwYbO77w7/wIvxfTIPC+JxSW6JwPvmh8/QaK+daq7e rg== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by userp2120.oracle.com with ESMTP id 37hwbne02b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 30 Mar 2021 07:29:03 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 12U7KnX5116455;
 Tue, 30 Mar 2021 07:29:02 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2104.outbound.protection.outlook.com [104.47.70.104])
 by aserp3020.oracle.com with ESMTP id 37jeky6q3x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 30 Mar 2021 07:29:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LuavwalGnTynJoBIlhXlplnMZjp4H/QmGDgkaypghw+xdR61GYhFBg6jDJQpaVAUepnneLae6rQXPKcM7ARpsaPITygJCGGiTOc1cMce6gmlmTrMgJfBUO7l0Fp8FECjho/yKRx4ORELUyJGTG04Yx/i3rI+JW2Spbg9vzkSTfHarjjR2mctM+N+sNMWOQqwW0ZKcXvnQx915GSm5PzFlhxIlov2KSfV+DQSpW+Vu3uSvZf7zzqbOd4ShGZTFZgUtuiBtfUn1Gu4R25wZ5eAlW+xajybdQuRukd0L+tt9gzy2V0nRkeUuLIZYpEJ160vhZLHJTXJXHcIzJDIlkdHJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KWG+TBB1HxDi6rAJEQzVivby3LvQS1z8N0dm/lqmma4=;
 b=R2cLE4toB2Us0h7AKdwOX64PEj5oj9cYgDEhcbs/+NCV2SIK0dBJzk1Cd0ne6h1vmkJBb8r9MThGU1wELWPIspJKpdIVV1rpnDxeyqtmN4UtOtJXM5fbvdwrw3ZRg7iTjrP0Y6R2RMxHAEHkvdcLqhfQb7Uhj8jgLTQ55Ld5pFZZhEMF/kZYhetUH8pB3zQVm85MFTrdKH6rSyvtLuT2WLTlHrca/iYDq1kc9X4HHWGHG19m/wWSzp4I/X8qwFCxWSMg+VGuM3LJLuH21cwDTJxUgVHFDuzbvjFf3x+UJafp4tZAWFllLhXMzLZ2Y0XR6GrfqKXaLFTYMblNY23OwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KWG+TBB1HxDi6rAJEQzVivby3LvQS1z8N0dm/lqmma4=;
 b=E0+T2HbTqOZZa+/53FnuTXh5dmXvzUSYkrw0dJQQHOP/BT9kdoYv3rIS8gmgCHka1G5W8KhBiSjgrwJnnDW15r6WpcJAYm7sVD1i2wFZz7g9vzwZFXLA4vNBTY8Aj8fUVI2FooqD+r/WwmTKZCeRlMpg/AY0Jf0emmzksV4twzo=
Received: from BYAPR10MB2663.namprd10.prod.outlook.com (2603:10b6:a02:a9::20)
 by BYAPR10MB2823.namprd10.prod.outlook.com (2603:10b6:a03:87::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.24; Tue, 30 Mar
 2021 07:28:59 +0000
Received: from BYAPR10MB2663.namprd10.prod.outlook.com
 ([fe80::44f7:1d8f:cc50:48ad]) by BYAPR10MB2663.namprd10.prod.outlook.com
 ([fe80::44f7:1d8f:cc50:48ad%6]) with mapi id 15.20.3977.033; Tue, 30 Mar 2021
 07:28:59 +0000
Subject: Re: [PATCH 0/6] Add debug interface to kick/call on purpose
To: Jason Wang <jasowang@redhat.com>, qemu-block@nongnu.org,
 qemu-devel@nongnu.org
References: <20210326054433.11762-1-dongli.zhang@oracle.com>
 <440216a8-821f-92dd-bc8b-fb2427bdc0e6@redhat.com>
 <d5549b12-d269-a04d-01d2-2dbd1ee7fca0@oracle.com>
 <ceb1f31a-e353-2542-a516-68b49735672c@redhat.com>
From: Dongli Zhang <dongli.zhang@oracle.com>
Message-ID: <9248ae00-9a7d-c960-a673-9b3a3ede0452@oracle.com>
Date: Tue, 30 Mar 2021 00:29:06 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <ceb1f31a-e353-2542-a516-68b49735672c@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [2601:646:c303:6700::a4a4]
X-ClientProxiedBy: BY5PR17CA0036.namprd17.prod.outlook.com
 (2603:10b6:a03:1b8::49) To BYAPR10MB2663.namprd10.prod.outlook.com
 (2603:10b6:a02:a9::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2601:646:c303:6700::a4a4] (2601:646:c303:6700::a4a4) by
 BY5PR17CA0036.namprd17.prod.outlook.com (2603:10b6:a03:1b8::49) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.29 via Frontend
 Transport; Tue, 30 Mar 2021 07:28:58 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 21965051-01ab-43c4-38ce-08d8f34d7c01
X-MS-TrafficTypeDiagnostic: BYAPR10MB2823:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR10MB28238D01FFB0516CE35C359EF07D9@BYAPR10MB2823.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yiSyzjBSI3oTFxbXuWb7UOu+0mdn3AYFTGcrcQ0WndS3Bdzsp5/xh3V8JX8csaa6yV1zcFV2cvcwFkt+8ipk+bvWadPjOeaXrPzhkd9sMdF8jYY9MuNhW0ll2sSXdINEC9zUrBm21aw8/1cWd593vLAecojTT2Aq/72llbmukwybSGtEbbwsyQBmyu789DHVsCHj1j5AtBk6+DUGa5e7WJF5maBF2G1drsFy3wOdglZ8ZJsfxET+roxh5nbDUqou+RLL7F4q+ut8NvajzwguHH0p3uKlwfgv/+O2G7mxb4jePXq01vj5XVYPz9TWgNK/IwfatrEkgqogqTU+1f+SGPAybY+POe6prVWRu4CGJy1l08WvlZdgu8X4hEYxtf8jmTKzTe51CkNnbzIR1XMtr+gigB64eKUZr9uhEmIIFbaw7xIb6ObRYixVnUkF3+UE5iz6fhkTKlPDG4Nqw7uglwDIZ+XESJhqpYTrvhc5sIncGPKYqp9rgM/uMaKlNlFTz2DAzCrSl30tfKdvLJ1dNtArbCxdKBLS0Eh12YnRbr+rKYIhZR59Bttl9KOMUOkl95o03p9V6XQIOuCVaocGOMLLTLccpH/fgkTYbbJ1NoaGFmaYWRT7z/9uDsNfffgMxvV3D7ENmiseDEGAJ5Z8jQelYEQ2BGQBBqDAbi7PumhPhod3BPm0x/yte18MP8ad1BZcSKj3k3gM/8TJXjNb75JkzLhP1OYu5THQIr9GnSJwkO2BPvRNhBZy/k0WK4RSaGueopYMsjbKgiE0U/W8CSfmHzUSdlcyU7XbzysBxIc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB2663.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(346002)(366004)(376002)(396003)(39860400002)(36756003)(2616005)(38100700001)(966005)(316002)(44832011)(6486002)(8936002)(8676002)(5660300002)(6666004)(66946007)(86362001)(4326008)(16526019)(31686004)(478600001)(186003)(2906002)(53546011)(30864003)(7416002)(107886003)(66556008)(66476007)(83380400001)(31696002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?b1N0SGs0S3RyNzhVRFZ5c0tGL1l5SXdxUWN4MEx0Y0hxak9EbWE0REJQZmpE?=
 =?utf-8?B?RVVKZCs4WjhVL011U2xzMzVrT3BjSGVaZG1UbDBVSXJrR3JXUGpIN0hRYzc5?=
 =?utf-8?B?V1daUFpVZEdrNG4xanh6UjNtTlRsVVJjbmhLNGMwNlVFMHRoYUNlMnJvT09T?=
 =?utf-8?B?L0xqbHptS3pMUDJHVzcxZUJuWU5ncWhGOCswZkxxZTNwaldaR1NuRUlzT1NY?=
 =?utf-8?B?cklicXJFemdEclA2NWtqVHZkdElyWGk3Y2JCZXpNb2N2TDY0Y1RPUkpvendE?=
 =?utf-8?B?dWdzMTRobHZ6NDg4UTZoaXBIS1p5bzgzaWFZS0YxMVNWK29aSjVpYVZmOWtG?=
 =?utf-8?B?aFNHajRUYjZTaCsvRDdQTjgxVXUyNHo0NlJiczRyQVdaQ2NkMHdYektVdnJU?=
 =?utf-8?B?OE4wUWczVWhVSmY2YUxkVWtWT0xSSEgvUmJIcE1pbkE3Nmp6UExHWWczbDRi?=
 =?utf-8?B?bVRiV0c2VzYxWHRmNmFscEFmYm1ZTUtwODYrbGt1dGFidHJ3Mll1aEYyYzhQ?=
 =?utf-8?B?b01IQ3lhQU9hQVZkUGdtYlVITENmRzMwWm9zQ09WR3JoZ1NyQkdtamtNOWhx?=
 =?utf-8?B?OHdYL2hKeEo0bVRhYkt5WG4vZUpHTTFuRTJkOVd0TWJWZnYvWHg5S0lDcjgw?=
 =?utf-8?B?SmRkVWp3Qi8yeC85SCtTRzEzWnpCQ1FHb2hzb2E5bG9VcDBIbDRaSDFOMDBm?=
 =?utf-8?B?emtuTU5wbTBEaW0vdGFPNUhoSG4vMDV0aThJeEZKNmVHdTlLSGx6QUt3OXE1?=
 =?utf-8?B?RVV3c0ozRWZBb1d3VVZ5dlhFdy9JUS83d3BlRHByMUw5V2d2V3BiREYwdmky?=
 =?utf-8?B?VitYNWlaenJkUno0QmU4dmw4MzJDbjFxeStOYVo4NVBjSjJQbVJKREp6cEFF?=
 =?utf-8?B?ODRDK2pWSk9QVURsN3FVZVZmUGxBRzdlMzlmNEdnVkU2Qm1vZkVLTkZYNXBv?=
 =?utf-8?B?ZitJY1hoOFRrNFhPRkdFWWVvRGJkeUVuYTF4QUg5R1ZheGgxTllQTzBONmZ3?=
 =?utf-8?B?cEp2ZTVMcWF3a05IclJmZTk2OUNKamJjcXgzR3VXTEoxd1cwdURwUjB3TUJW?=
 =?utf-8?B?dHpsWk5uTVFKaXkzUXlUUzBCY2xJK0cwOTlEQU5wZE1MeXhyNzZSN2xGdElB?=
 =?utf-8?B?aVRpb21ONExremVQM2xxLzdTSHFvOUtnMEtNbzJRVmJ2RkR2U0pyTHcrd1Za?=
 =?utf-8?B?RzlYVHhCQ2NjTi9WU0hzb1h5RXM4VjZZZVRWUFladXRCMHcyeHJpK0xIZzc4?=
 =?utf-8?B?M3Y0OE54ZUxsZDhjSG93ZDFsejFNTEU0M1hoZ0lyTU5tVXEzVURwWno2RE9q?=
 =?utf-8?B?VDBRTlBZeC9OdWp2dmJ4SHpySlZmY2ZEUmV4djlSK0pwRldzYnY2RWtyL1oy?=
 =?utf-8?B?NE9aaFJnVVdBY0xPaC9jS3l3Q3R6WU9iaDFBeEgvOU1VRUtnbEZRVHBrMmNx?=
 =?utf-8?B?d01paStRc1NFam1sbE5HMXJIREF5TkllYU84TENFajdKa0wvUWRPdEdOL0lh?=
 =?utf-8?B?VUx4MWlxZy92RGJFcHlhRW9DNnFxWG9ackttaFk0ZWJWeTFtUkgzKzcwSnpu?=
 =?utf-8?B?QTVxcUtqeHIvVEJUTGVMWFJ6YUxXRXVXZHlCZEp0UERJM0NHbmt2YjY2bkhz?=
 =?utf-8?B?UDIvTWtrTXNxOGhod3B2cEo4ZTFWcHluRndPaGp3YTFzNllSTFBEOUVzTFBs?=
 =?utf-8?B?ZlN5VkZKWTlaV0d3Q0hwQTU2WUNoWThGc3NzeUFkK2FYcmZPUnVJeWhIZWVL?=
 =?utf-8?B?Mm4zUUlJYmtaY29DTENTSmtWVzQzdzlPbUVVcFZ3WDY0MFdqRG13NFo3bmJX?=
 =?utf-8?B?bml6VzVQR3c2V2lJMmo0UT09?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 21965051-01ab-43c4-38ce-08d8f34d7c01
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB2663.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2021 07:28:59.2590 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: daBoPJKldqMfyx44mDn9kFnZ1ee5ko9P+m2aOjSunfQSMFqG84aTlDAY5llF2+TTW2aJS2fbMSEBzht6FQQoaA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR10MB2823
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9938
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 malwarescore=0 mlxscore=0
 phishscore=0 suspectscore=0 mlxlogscore=999 adultscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2103250000
 definitions=main-2103300048
X-Proofpoint-GUID: z7URHswxnTgQUvIU5sCSLlT2X4RntYzz
X-Proofpoint-ORIG-GUID: z7URHswxnTgQUvIU5sCSLlT2X4RntYzz
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9938
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 impostorscore=0
 clxscore=1015
 phishscore=0 mlxscore=0 malwarescore=0 mlxlogscore=999 suspectscore=0
 spamscore=0 bulkscore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2103250000
 definitions=main-2103300048
Received-SPF: pass client-ip=156.151.31.85;
 envelope-from=dongli.zhang@oracle.com; helo=userp2120.oracle.com
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
Cc: kwolf@redhat.com, fam@euphon.net, berrange@redhat.com, ehabkost@redhat.com,
 mst@redhat.com, joe.jin@oracle.com, armbru@redhat.com, dgilbert@redhat.com,
 stefanha@redhat.com, pbonzini@redhat.com, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 3/28/21 8:56 PM, Jason Wang wrote:
> 
> 在 2021/3/27 上午5:16, Dongli Zhang 写道:
>> Hi Jason,
>>
>> On 3/26/21 12:24 AM, Jason Wang wrote:
>>> 在 2021/3/26 下午1:44, Dongli Zhang 写道:
>>>> The virtio device/driver (e.g., vhost-scsi or vhost-net) may hang due to
>>>> the loss of doorbell kick, e.g.,
>>>>
>>>> https://urldefense.com/v3/__https://lists.gnu.org/archive/html/qemu-devel/2018-12/msg01711.html__;!!GqivPVa7Brio!KS3pAU2cKjz4wgI4QSlE-YsJPhPG71nkE5_tGhaOf7mi_xvNxbvKkfn03rk5BNDLSEU$
>>>>
>>>>
>>>> ... or due to the loss of IRQ, e.g., as fixed by linux kernel commit
>>>> fe200ae48ef5 ("genirq: Mark polled irqs and defer the real handler").
>>>>
>>>> This patch introduces a new debug interface 'DeviceEvent' to DeviceClass
>>>> to help narrow down if the issue is due to loss of irq/kick. So far the new
>>>> interface handles only two events: 'call' and 'kick'. Any device (e.g.,
>>>> virtio/vhost or VFIO) may implement the interface (e.g., via eventfd, MSI-X
>>>> or legacy IRQ).
>>>>
>>>> The 'call' is to inject irq on purpose by admin for a specific device (e.g.,
>>>> vhost-scsi) from QEMU/host to VM, while the 'kick' is to kick the doorbell
>>>> on purpose by admin at QEMU/host side for a specific device.
>>>>
>>>>
>>>> This device can be used as a workaround if call/kick is lost due to
>>>> virtualization software (e.g., kernel or QEMU) issue.
>>>>
>>>> We may also implement the interface for VFIO PCI, e.g., to write to
>>>> VFIOPCIDevice->msi_vectors[i].interrupt will be able to inject IRQ to VM
>>>> on purpose. This is considered future work once the virtio part is done.
>>>>
>>>>
>>>> Below is from live crash analysis. Initially, the queue=2 has count=15 for
>>>> 'kick' eventfd_ctx. Suppose there is data in vring avail while there is no
>>>> used available. We suspect this is because vhost-scsi was not notified by
>>>> VM. In order to narrow down and analyze the issue, we use live crash to
>>>> dump the current counter of eventfd for queue=2.
>>>>
>>>> crash> eventfd_ctx ffff8f67f6bbe700
>>>> struct eventfd_ctx {
>>>>     kref = {
>>>>       refcount = {
>>>>         refs = {
>>>>           counter = 4
>>>>         }
>>>>       }
>>>>     },
>>>>     wqh = {
>>>>       lock = {
>>>>         {
>>>>           rlock = {
>>>>             raw_lock = {
>>>>               val = {
>>>>                 counter = 0
>>>>               }
>>>>             }
>>>>           }
>>>>         }
>>>>       },
>>>>       head = {
>>>>         next = 0xffff8f841dc08e18,
>>>>         prev = 0xffff8f841dc08e18
>>>>       }
>>>>     },
>>>>     count = 15, ---> eventfd is 15 !!!
>>>>     flags = 526336
>>>> }
>>>>
>>>> Now we kick the doorbell for vhost-scsi queue=2 on purpose for diagnostic
>>>> with this interface.
>>>>
>>>> { "execute": "x-debug-device-event",
>>>>     "arguments": { "dev": "/machine/peripheral/vscsi0",
>>>>                    "event": "kick", "queue": 2 } }
>>>>
>>>> The counter is increased to 16. Suppose the hang issue is resolved, it
>>>> indicates something bad is in software that the 'kick' is lost.
>>> What do you mean by "software" here? And it looks to me you're testing whether
>>> event_notifier_set() is called by virtio_queue_notify() here. If so, I'm not
>>> sure how much value could we gain from a dedicated debug interface like this
>>> consider there're a lot of exisinting general purpose debugging method like
>>> tracing or gdb. I'd say the path from virtio_queue_notify() to
>>> event_notifier_set() is only a very small fraction of the process of virtqueue
>>> kick which is unlikey to be buggy. Consider usually the ioeventfd will be
>>> offloaded to KVM, it's more a chance that something is wrong in setuping
>>> ioeventfd instead of here. Irq is even more complicated.
>> Thank you very much!
>>
>> I am not testing whether event_notifier_set() is called by virtio_queue_notify().
>>
>> The 'software' indicates the data processing and event notification mechanism
>> involved with virtio/vhost PV driver frontend. E.g., while VM is waiting for an
>> extra IRQ, vhost side did not trigger IRQ, suppose vring_need_event()
>> erroneously returns false due to corrupted ring buffer status.
> 
> 
> So there could be several factors that may block the notification:
> 
> 1) eventfd bug (ioeventfd vs irqfd)
> 2) wrong virtqueue state (either driver or device)
> 3) missing barriers (either driver or device)
> 4) Qemu bug (irqchip and routing)
> ...

This is not only about whether notification is blocked.

It can also be used to help narrow down and understand if there is any
suspicious issue in blk-mq/scsi/netdev/napi code. The PV drivers are not only
drivers following virtio spec. It is closely related to many of other kernel
components.

Suppose IO was recovered after we inject an IRQ to vhost-scsi on purpose, we
will be able to analyze what may happen along the IO completion path starting
from when /where the IRQ is injected ... perhaps the root cause is not with
virtio but blk-mq/scsi (this is just an example).


In addition, this idea should help for vfio-pci. Suppose the developer for a
specific device driver suspects IO/networking hangs because of loss if IRQ, we
will be able to verify if that assumption is correct by injecting an IRQ on purpose.

Therefore, this is not only about virtio PV driver (frontend/backend), but also
used to help analyze the issue related to entire IO/networking/passthrough
virtualization stacks, especially in production env where the issue can only be
reproduced randomly.

> 
> Consider we want to debug virtio issue, only 2) or 3) is what we really cared>
> So for kick you did (assume vhost is on):
> 
> virtio_device_event_kick()
>     virtio_queue_notify()
>         event_notifier_set()
> 
> It looks to me you're actaully testing if ioeventfd is correctly set by Qemu.
> 
> For call you did:
> 
> virtio_device_event_call()
>     event_notifier_set()
> 
> A test of irqfd is correctly set by Qemu. So all of those are not virtio
> specific stuffs but you introduce virtio specific command to do debug non virtio
> functions.
> 
> In the case of what you mentioned for vring_need_event(), what we really want is
> to dump the virtqueue state from the guest. This might requries some work of
> extending virtio spec (e.g to dump device status like indices, event, wrap
> counters).

Suppose the issue is only randomly reproducible in production env, we should
always take 4) into consideration because we will not be able to know where is
the root cause at the very beginning of bug analysis.

> 
> 
>> This was initially proposed for vhost only and I was going to export
>> ioeventfd/irqfd from vhost to admin via sysfs. Finally, I realized I would
>> better implement this at QEMU.
>>
>> The QEMU inits the eventfd (ioeventfd and irqfd), and offloads them to
>> KVM/vhost. The VM side sends requests to ring buffer and kicks the doorbell (via
>> ioeventfd), while the backend vhost side sends responses back and calls the IRQ
>> (via ioeventfd).
>>
>> Unfortunately, sometimes there is issue with virtio/vhost so that kick/call was
>> missed/ignored, or even never triggered. The example mentioned in the patchset
>> cover letter is with virtio-net (I assume vhost=on), where a kick to ioventfd
>> was ignored, due to pci-bridge/hotplug issue.
> 
> 
> So this is not a good example since it was a chipset bug. You need to use other
> tool to debug chipset code isn't it?

As this issue is reproducible only randomly, we will not be able to realize it
is a chipset bug at the very beginning.

While the link is about vhost-net, it is applicable to vhost-scsi as well.
Suppose DEBUG_UNASSIGNED is not enabled, the developer will need to investigate
all of blk-mq, scsi, virtio-scsi (ioeventfd), vhost-scsi (target), pci-bridge
and pci-hotplug, in order to identify the root case.

The "call/kick" interface is used to narrow down and verify the analysis,
especially when many kernel components are involved.

> 
> 
>> The hotplug is with a very small window but the IO hangs permanently. I did test
>> that kicking the doorbell again will help recover the IO, so that I would be
>> able to conclude this was due to lost of kick.
>>
>> The loss of irq/doorbell is painful especially in production environment where
>> we are not able to attach to QEMU via gdb. While the patchset is only for QEMU,
>> Xen PV driver used to experience loss of IRQ issue as well, e.g., linux kernel
>> commit 4704fe4f03a5 ("xen/events: mask events when changing their VCPU binding").
> 
> 
> So looking at the git history we can see it has little possibility that the
> missing is due to virtio/vhost itself. So the commit you mention here is not
> good as well since it's not a netfront/netbackend bug.

I mentioned the xen issue just to explain that the loss of event/irq issue may
happen and is very painful. Another xen example is (equivalent to KVM VFIO):

https://xenbits.xen.org/gitweb/?p=xen.git;a=commit;h=56348df32bbc782e63b6e3fb978b80e015ae76e7

That's why I mentioned this idea helps for VFIO (not only VFIO, but actually
blk-mq+nvme+pci+kvm+vfio, assuming it is for nvme passthrough) as well.

> 
> So for the case of event call, what you did is:
> 
> satic void virtio_device_event_call(VirtQueue *vq, bool eventfd,
>                                      Error **errp)
> {
> #ifdef DEBUG_VIRTIO_EVENT
>     printf("The 'call' event is triggered for path=%s, queue=%d, irqfd=%d.\n",
>            object_get_canonical_path(OBJECT(vq->vdev)),
>            vq->queue_index, eventfd);
> #endif
> 
>     if (eventfd) {
>         virtio_set_isr(vq->vdev, 0x1);
>         event_notifier_set(&vq->guest_notifier);
>     } else {
>         virtio_irq(vq);
>     }
> }
> 
> This means, when eventfd is set, you bypasses the MSI mask which is very
> dangerous to make it used in the case of production environment. And if you
> check masking, it won't help a lot if the MSI is masked wrongly.

You are right.

Only the vhost-net is dangerous because it masks a vector by registering an
alternative masked_notifier to KVM, while virtio-blk/vhost-scsi/virtio-scsi will
un-register the guest notifier.

> 
> 
>> This can help "narrow down" if the IO/networking hang is due to loss of
>> IRQ/doorbell issue (or VM MSI-x is erroneously masked), especially in production
>> env. This can also be used as a workaround so that VM owner will not need to
>> reboot VM.
> 
> 
> So having such extra workaround is pretty dangerous in production environemnt
> where I think we need to be conservative which means we need to collect
> information instead of generating artificial event.
> 
> And it doesn't help if the wrokaround can be triggered through management API.

I agree with this.

This depends on the administrator. This workaround should only be used in very
limited and special case.

> 
> 
>>
>> In addition, the VFIO will benefit from it. We will be able to test if to inject
>> IRQ on purpose helps when the driver (e.g., PCI, NVMe, Ethernet) developers
>> blame the hang is caused by loss of IRQ with KVM/VFIO.(It seems there is more
>> chance to loose IRQ during CPU hotplug or changing IRQ affinity).
>>
>>> I think we could not gain much for introducing an dedicated mechanism for such a
>>> corner case.
>> As replied by Dave for prior RFC, the QEMU already supports hmp_ioport_write to
>> trigger an ioport write on purpose.
> 
> 
> If that applies. I would rather have a hmp_mem_write then we can test both MSI
> and doorbell. But again, they are very dangerous to be used in production
> envronment.

This is just not convenient for production env administrator. We will need to
first obtain the virtio pci info (e.g., via "lspci -vv"), and then prepare for
the command after calculating the address of doorbell.

Something bad may happen if the developer did not calculate the address correctly.

It should be much more easier for developer to just ask administrator to "call"
queue X for a specific virtio device.

> 
> 
>>
>> The linux block layer also supports the below to kick the IO queue on purpose.
>>
>> echo "kick" > /sys/kernel/debug/block/sda/state
> 
> 
> This might be fine for hardware device but not virtio. The device can choose to
> poll the virtqueue instead of depending of the doorbell to work. And for
> networking subsystem, we don't have such stuffs, instead ethtool support to dump
> ring and vendor specific stuffs which could be used for dumping virtqueue state
> in this case.

This is just another example to help explain the philosophy behind the
"kick/call" idea: sometimes to trigger the event on purpose will help us narrow
down and verify our analysis of a kernel bug, especially a bug that is only
randomly reproducible in production environment.


I understand it is possibly not proper to introduce such interface to QEMU.
That's why I used to send out the RFC.

https://lists.nongnu.org/archive/html/qemu-devel/2021-01/msg03441.html

In my opinion, this interface is pretty useful when the diagnostic invokes many
kernel components, or when developers from different components are working on
the same bug, no matter whether the root cause is at virtio or not.


Thank you very much!

Dongli Zhang


> 
> Thanks
> 
> 
>>
>> Dongli Zhang
>>
>>> Thanks
>>>
>>>
>>>> crash> eventfd_ctx ffff8f67f6bbe700
>>>> struct eventfd_ctx {
>>>>     kref = {
>>>>       refcount = {
>>>>         refs = {
>>>>           counter = 4
>>>>         }
>>>>       }
>>>>     },
>>>>     wqh = {
>>>>       lock = {
>>>>         {
>>>>           rlock = {
>>>>             raw_lock = {
>>>>               val = {
>>>>                 counter = 0
>>>>               }
>>>>             }
>>>>           }
>>>>         }
>>>>       },
>>>>       head = {
>>>>         next = 0xffff8f841dc08e18,
>>>>         prev = 0xffff8f841dc08e18
>>>>       }
>>>>     },
>>>>     count = 16, ---> eventfd incremented to 16 !!!
>>>>     flags = 526336
>>>> }
>>>>
>>>>
>>>> Original RFC link:
>>>>
>>>> https://urldefense.com/v3/__https://lists.nongnu.org/archive/html/qemu-devel/2021-01/msg03441.html__;!!GqivPVa7Brio!KS3pAU2cKjz4wgI4QSlE-YsJPhPG71nkE5_tGhaOf7mi_xvNxbvKkfn03rk5UvUJ86I$
>>>>
>>>>
>>>> Changed since RFC:
>>>>     - add support for more virtio/vhost pci devices
>>>>     - add log (toggled by DEBUG_VIRTIO_EVENT) to virtio.c to say that this
>>>>       mischeivous command had been used
>>>>     - fix grammer error (s/lost/loss/)
>>>>     - change version to 6.1
>>>>     - fix incorrect example in qapi/qdev.json
>>>>     - manage event types with enum/array, instead of hard coding
>>>>
>>>>
>>>> Dongli Zhang (6):
>>>>      qdev: introduce qapi/hmp command for kick/call event
>>>>      virtio: introduce helper function for kick/call device event
>>>>      virtio-blk-pci: implement device event interface for kick/call
>>>>      virtio-scsi-pci: implement device event interface for kick/call
>>>>      vhost-scsi-pci: implement device event interface for kick/call
>>>>      virtio-net-pci: implement device event interface for kick/call
>>>>
>>>>    hmp-commands.hx                 | 14 ++++++++
>>>>    hw/block/virtio-blk.c           |  9 +++++
>>>>    hw/net/virtio-net.c             |  9 +++++
>>>>    hw/scsi/vhost-scsi.c            |  6 ++++
>>>>    hw/scsi/virtio-scsi.c           |  9 +++++
>>>>    hw/virtio/vhost-scsi-pci.c      | 10 ++++++
>>>>    hw/virtio/virtio-blk-pci.c      | 10 ++++++
>>>>    hw/virtio/virtio-net-pci.c      | 10 ++++++
>>>>    hw/virtio/virtio-scsi-pci.c     | 10 ++++++
>>>>    hw/virtio/virtio.c              | 64 ++++++++++++++++++++++++++++++++++++
>>>>    include/hw/qdev-core.h          |  9 +++++
>>>>    include/hw/virtio/vhost-scsi.h  |  3 ++
>>>>    include/hw/virtio/virtio-blk.h  |  2 ++
>>>>    include/hw/virtio/virtio-net.h  |  3 ++
>>>>    include/hw/virtio/virtio-scsi.h |  3 ++
>>>>    include/hw/virtio/virtio.h      |  3 ++
>>>>    include/monitor/hmp.h           |  1 +
>>>>    qapi/qdev.json                  | 30 +++++++++++++++++
>>>>    softmmu/qdev-monitor.c          | 56 +++++++++++++++++++++++++++++++
>>>>    19 files changed, 261 insertions(+)
>>>>
>>>>
>>>> I did tests with below cases.
>>>>
>>>> - virtio-blk-pci (ioeventfd on/off, iothread, live migration)
>>>> - virtio-scsi-pci (ioeventfd on/off)
>>>> - vhost-scsi-pci
>>>> - virtio-net-pci (ioeventfd on/off, vhost)
>>>>
>>>> Thank you very much!
>>>>
>>>> Dongli Zhang
>>>>
>>>>
> 

