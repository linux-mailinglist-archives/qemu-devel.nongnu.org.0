Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A1B03C63A3
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Jul 2021 21:23:19 +0200 (CEST)
Received: from localhost ([::1]:54234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m31WP-0006KF-9t
	for lists+qemu-devel@lfdr.de; Mon, 12 Jul 2021 15:23:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45446)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1m31TO-000490-P7
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 15:20:10 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:40872)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1m31TM-0003Ro-QN
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 15:20:10 -0400
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16CJJAOb004239; Mon, 12 Jul 2021 19:20:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=mhobqyASTPU/m00IlDt+ScATUchjteSRIvtAhBOmyt0=;
 b=Z1/7SvC2tuDsZFwdHXeME3XqU8PWFpIT2RK6avGgXEGNVtj4aLScl6YCTQFBk9UfFGJy
 02EXApoDAQv1/0FNKBjeej5hUmoFsV9cm4X1jd7+Y2GfKsAlwmRKRqJZq0eSFy5TJZCM
 jlCbHjXAlTii7yi5zZNaEleS5eOEstsc3n5vayR491cXC/1eHR2OuPdi1RuZvO1QV2mw
 XvgUP6eU6m5fOOQoDDzZkgG0xs16DGccghbKm2g3FuL8fNLwlL0etJfhX7mFgfU7wzMo
 Jrr55N8SweDOgMJHo/LfSNBRia09ZoqtrY4YzmO5T589C+e8nlJpnFHoAEm0IlFuRORm 5A== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 39rpxr8s7n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 12 Jul 2021 19:20:04 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 16CJErqS013275;
 Mon, 12 Jul 2021 19:20:03 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2173.outbound.protection.outlook.com [104.47.59.173])
 by userp3020.oracle.com with ESMTP id 39qnav005b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 12 Jul 2021 19:20:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MaoVh0cFpgqMhqLm2g8D4KasVAz5cDcUHaEBQybAI5JeqXGLlqK0v7gSeTAbNb5eNt4eRfFmGqLqa3hruaQvxig7eI4utwFo6+8F6vv8R+0HOAjWOwnncHiInrKMAjfBkP/JWIZEsB4I2wDogIqqm6BS2GqMeILoIThw8OMllclPyP6+GV9ST1hin2Dn3eckA/Vc3cgRCDSJEjiPwYRbtVbq8OKfnXYjLwJpPASBETtswuj+GGBMuulpHKsMD+Ggp8AtI0me1ybOQi/3Yw3lTLA4Sbw8mjKTgIl9E4wYW4JYfX7t9tITSTUYes885zt3mP/QXXBe0gcVmWkwBS6UWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mhobqyASTPU/m00IlDt+ScATUchjteSRIvtAhBOmyt0=;
 b=M98wJOUXzWHjVx+vMF8ShuLc5Zgnu1hqTKsBfmDjUVsNBurl2wjo8N563dm36+Z3PY6KB1Xkcg0PHLU/8rt2OsRLZuAW8SKxZsIpoAm5gO323aIhYldAWNAtU04z2mTQ95GUhhUGnGN1ZQYLb+3ZECSid8hCeoW35rH8gQWDu1x5/iXi1YK6jEVxHXhppgdwF8xMQ0KwSg6B0AMoM2Upc5QmMgtQbSmIvmr2EXe/Pk0I3WiHFFtPH2heUtRFxfGexwFL6fm4hl75JMcsmqIB88F2tfrqMbIeTr5oVmAIXQ5SrHpFQ6PT5fpFU2mekGPdhaH7IXeGxUqPKsTsQ44nkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mhobqyASTPU/m00IlDt+ScATUchjteSRIvtAhBOmyt0=;
 b=MkF3JmS9F0MjsBnOrc8NgY5YjtBIHLELm804riGXYKGqtXbSEgqiH/C7Sl5tkoLayqPJA+1V8PRPazQSo5rlRDg2L0ZW2TUmlE09xXS08jKWwMWCdn4y6wRk3TjA5RXAOzQsPbihRznh5dBFH4dRap9quZ+q0NmePUvBNzxjK2E=
Authentication-Results: oracle.com; dkim=none (message not signed)
 header.d=none;oracle.com; dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB3240.namprd10.prod.outlook.com (2603:10b6:a03:155::17)
 by BYAPR10MB3128.namprd10.prod.outlook.com (2603:10b6:a03:14e::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.22; Mon, 12 Jul
 2021 19:20:00 +0000
Received: from BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::a00d:eb40:2bf6:8812]) by BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::a00d:eb40:2bf6:8812%7]) with mapi id 15.20.4308.026; Mon, 12 Jul 2021
 19:20:00 +0000
Subject: Re: [PATCH V5 12/25] cpr: QMP interfaces for restart
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@gmail.com>
References: <1625678434-240960-1-git-send-email-steven.sistare@oracle.com>
 <1625678434-240960-13-git-send-email-steven.sistare@oracle.com>
 <CAJ+F1CJCPKL9uKSMTsa5eZrvgBCgo2cHQQ=OUNLGRP+dMXCoqA@mail.gmail.com>
From: Steven Sistare <steven.sistare@oracle.com>
Organization: Oracle Corporation
Message-ID: <ce85a7ae-7db3-658e-71aa-ed2b800bb5fe@oracle.com>
Date: Mon, 12 Jul 2021 15:19:56 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <CAJ+F1CJCPKL9uKSMTsa5eZrvgBCgo2cHQQ=OUNLGRP+dMXCoqA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0035.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::10) To BYAPR10MB3240.namprd10.prod.outlook.com
 (2603:10b6:a03:155::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.92] (24.62.106.7) by
 SJ0PR03CA0035.namprd03.prod.outlook.com (2603:10b6:a03:33e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.20 via Frontend
 Transport; Mon, 12 Jul 2021 19:19:58 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4c30f25d-0808-492a-d584-08d9456a0b2b
X-MS-TrafficTypeDiagnostic: BYAPR10MB3128:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR10MB31285F7432A3D5CD6AFF4871F9159@BYAPR10MB3128.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: usqPP/k34uiQvw6Sxv5YdiFCFYxgECTwhk/QVfFo5OQ7mzCvROP7AKwd8SkEsem8E0tT5kE54vEkd7gX/e1EbhZrO0egt2MlzQjfLDg/dE7ZEr6xbKxvELx435+pmHvwEDE6xzKv6C+IyaNIZLIqL2rhxHMyyD9JwDVgOx6Ul7IEu3fXwOk/C40aXQq7wXoWBJv0DhLnkrosUPLSDfe6TQmGAxsUfInwzhuoUoR1WKnzewoY+b/4ePELigvDgA2LTcILfVb21dP8rqr0tgZWccM3uYL2tco51ila7rY0oglTsve+gK5qBeeC3ecCnKwMOD+LnPzzoKi6Sh8H6TmkVAuMBIMZxbhGbwcFf1g8VPQgO91CiVKZO+sonUgA+XTRepX4EY4zNLQL+0Gxe5M45atyhza9cDaJZXorZLrnxM6RTF1YxSy9YpBktGG+jg505I9iaE4n/Ahx4yniJeodmJijoFU/4zglLTAvxqMGJNYoALKNgP9Qgh8RFAffUfKHQzLspO4Rkd0XnUOuxe9iJEAUNFIjFN5X/Ty5X52/jemecyMzIpyHmHcznRHbIqAHbgr51qw4ztzbHc+rSvH0xuDr+eEuyp3soUORZctH2e59kffhNf6dVmFDH5FSaK1qe3nmQ7Z6c585bUoxUnvvqhZcdJjGxEx11+bZ9v+DHSpD5X9JsMTPNMrF8s+ED3k8ZkqBIYrZ1F0B4SgZ7fm6GplNzEM162WCcWBfgRf9rwA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3240.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(376002)(39860400002)(396003)(346002)(366004)(478600001)(2906002)(66476007)(5660300002)(66556008)(36916002)(26005)(8936002)(6486002)(8676002)(53546011)(66946007)(83380400001)(7416002)(44832011)(6916009)(31696002)(4326008)(36756003)(186003)(86362001)(38100700002)(54906003)(316002)(31686004)(16576012)(2616005)(956004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WFE4WXdDK1JXZUhtNXJETWgyK0QxR3ROYlorYTVGQzI4RHRxUTJCNUtsZEZv?=
 =?utf-8?B?RzVMdjJNNjNCaWg2c2VDSGtlSiszcGNYNTBvbXVCZ280eSs4Q2EvZERmVits?=
 =?utf-8?B?d1V1TkxDRm5XamtUdjl3aHp6eUduOXh1eGlZa2FZNUYrd1dXaVFvcncvOGNy?=
 =?utf-8?B?SUJveTRMODhzVmFKY3VwSldPWEJNS0hWSkxYNE9ySmFJM3RRRFRWUFhwbldN?=
 =?utf-8?B?RzVTaEZGdmRrM29NU3cxVTYvTlBDdGRDVk9wdGcveXRHRUJEVSsxZ1h2VGtk?=
 =?utf-8?B?cUsrd1o5NzFaTndpamtHOWVmZlJSTWNTaEJSMGMwNUpwMjd5SUwxQkpTVXNT?=
 =?utf-8?B?aVF4cFMwb2M0T0tybWdyc1BpOVN2M21JQVp1aG85TXEzN3dGMCt4cUJNN3hE?=
 =?utf-8?B?aHYvVk44NWZsSC9OYVIrZjVERlV5QUorOVV6dDZZR3dqMmRBNllyTUh5NlpO?=
 =?utf-8?B?a3VmWkNjN29XNFlGclRLVzhRY3FMRG5MUXg1S0hwMnprRVQ1L1BYYnZtVTcy?=
 =?utf-8?B?QzRheHFZT3h1VEQxRTlBRXE2RlFKcnBTZytxWlpRMzJyc2w2bXlZSkZkL3dC?=
 =?utf-8?B?YVBkMDFlNlplN0hFaURzUS9yQnkwTWM5M1JzVkVuQkVOdVVybndVWlIvUHJv?=
 =?utf-8?B?UHRqQnM5VzNDZ2l5M0M0N0o2cHZpSTMwa0ZIOUYwdFdaeUZDcndaQW9GSXd6?=
 =?utf-8?B?UVFNNVdpaTZMeTl4ZVNyLzJoZGttRnd3bGloRHZVczN4Q0NMOEQ4NUltZHBK?=
 =?utf-8?B?UFhPMEFZMm9haWNTWDMvajJtZ3J2TkVuaTJZNC9XKzB0NllOcDhnR3R5TXZO?=
 =?utf-8?B?YWZMWnYzeVNxSE5ueHJsTVVtQ05oeE8yejhiZUdPNzZPQVJxaHhpTXM1Umdo?=
 =?utf-8?B?Y0JqY0FXbHU2MStNbzFEOUJLR1VJNU1NREhSbSs4Wi9nakczQnp5Qis1c0pU?=
 =?utf-8?B?OG16dVRzbmxtZUpONDZoWEJCTDRmaVdVYTF4T0FZK0EzYjVLbjZCejFWeFJj?=
 =?utf-8?B?a2NLRnRLdkUwclQwQjRoOG15R0kzOS9YN0w4djl1UzJYT1dIdVRhcHRRcXI5?=
 =?utf-8?B?aDMvR1BHekt5WHY4SWxydXBhQmJOR1d4UHhtUEcrNmlDa3NBMWlsTCtRS09F?=
 =?utf-8?B?WXFvTkU1bUZqdlg4cDZPVjBKeUliMjF6YVpqeWxVNGZMckVmN3dyYzJRbWxj?=
 =?utf-8?B?b0MwUitnU3RxZWd6NnhUSUgxK1pCKy9WQzVwcitYVE00RGd3a1hyd09hcS9E?=
 =?utf-8?B?SmcrRmZnWjl5MVhYWG5JUExGY2w0Zk12Z1FCUVNiSE1QNzJ4ZzJKRDNHeEF3?=
 =?utf-8?B?eWR0U3ZaYndWbTRMNkxJclFFcVM0Zmt3T1d0bEplOHBuRDRMbXA1d0hETmNh?=
 =?utf-8?B?V0c1eFllaDlQRGh2VGVvN2JZYklaQmxvSkxjM3VNckxJZFV1anhDSDRtV3dv?=
 =?utf-8?B?a2piRVliVGIzbWVha25KMExJNUJEV2hMU2d5V0NtMkxuZFVLTkd0OWhENXpm?=
 =?utf-8?B?ZWFTR0VRaG1zSXE1ZjJWUW1XY2VTSmhFUy9EUW1jcXBWZ0RmNVhqY1BwcGFU?=
 =?utf-8?B?c0lMOTQ1R3Y2TDdKKzA1bzNkUEpEMHlxbEsyU2d6L0gyS05VajUxUkdWQzBj?=
 =?utf-8?B?WktIemRZMUNtclFUVGVWSDZNWm4wNHlzcExJZU1xYTlsNC9HVWt3Nk44NjlL?=
 =?utf-8?B?cERBVExGblEwSVl1OFUza0hjdUJ2UVlKSW9kdUtWR0Y5QjVITDFiU1J2MkNW?=
 =?utf-8?Q?YJj6K5HAa5//lhnjytVJfi26Ai+1t5Fck6Re3mj?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c30f25d-0808-492a-d584-08d9456a0b2b
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3240.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2021 19:20:00.7377 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xcFoc1LOO4PAMzPzWwN+ZrihRfp62U5Oyr1tut1bSZAWgmidngvtC63kISN2UrX1BoinpoZEebxOiNttpSApQbOstomiwe24a1EOHqG38cQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR10MB3128
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10043
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 bulkscore=0 malwarescore=0
 spamscore=0 suspectscore=0 adultscore=0 mlxlogscore=999 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2107120137
X-Proofpoint-GUID: eWRvGuv7b-ZIMu90YrhchL9sR2MqWmJg
X-Proofpoint-ORIG-GUID: eWRvGuv7b-ZIMu90YrhchL9sR2MqWmJg
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

On 7/8/2021 11:49 AM, Marc-André Lureau wrote:
> Hi
> 
> On Wed, Jul 7, 2021 at 9:33 PM Steve Sistare <steven.sistare@oracle.com <mailto:steven.sistare@oracle.com>> wrote:
> 
>     cprexec calls cprexec().  Syntax:
>       { 'command': 'cprexec', 'data': { 'argv': [ 'str' ] } }
> 
>     Add the restart mode:
>       { 'enum': 'CprMode', 'data': [ 'reboot', 'restart' ] }
> 
>     Signed-off-by: Steve Sistare <steven.sistare@oracle.com <mailto:steven.sistare@oracle.com>>
>     ---
>      monitor/qmp-cmds.c |  5 +++++
>      qapi/cpr.json      | 16 +++++++++++++++-
>      2 files changed, 20 insertions(+), 1 deletion(-)
> 
>     diff --git a/monitor/qmp-cmds.c b/monitor/qmp-cmds.c
>     index 1128604..7326f7d 100644
>     --- a/monitor/qmp-cmds.c
>     +++ b/monitor/qmp-cmds.c
>     @@ -179,6 +179,11 @@ void qmp_cprsave(const char *file, CprMode mode, Error **errp)
>          cprsave(file, mode, errp);
>      }
> 
>     +void qmp_cprexec(strList *args, Error **errp)
>     +{
>     +    cprexec(args, errp);
>     +}
>     +
>      void qmp_cprload(const char *file, Error **errp)
>      {
>          cprload(file, errp);
>     diff --git a/qapi/cpr.json b/qapi/cpr.json
>     index b6fdc89..2467e48 100644
>     --- a/qapi/cpr.json
>     +++ b/qapi/cpr.json
>     @@ -16,10 +16,12 @@
>      #
>      # @reboot: checkpoint can be cprload'ed after a host kexec reboot.
>      #
>     +# @restart: checkpoint can be cprload'ed after restarting qemu.
>     +#
>      # Since: 6.1
>      ##
>      { 'enum': 'CprMode',
>     -  'data': [ 'reboot' ] }
>     +  'data': [ 'reboot', 'restart' ] }
> 
> 
>      ##
>     @@ -61,6 +63,18 @@
>                  'mode': 'CprMode' } }
> 
>      ##
>     +# @cprexec:
>     +#
>     +# Restart qemu.
>     +#
>     +# @argv: arguments to exec
> 
> 
> Why is it not then called cpr-restart ? 

I'll change the description.  exec is the key aspect to convey.

< Why does it take the whole argv? 

It takes the whole argv because the caller may provide a prefix command to
modify the process context before executing qemu.  We do that.

> Could argv be made optional?

If argv is omitted, I could exec the qemu binary with no args, but I don't think that 
would be useful.  It may even be confusing, if the caller has a bug and passes no args;
qemu would start and do nothing, rather than fail with an "exec failed" message.

- Steve

>     +#
>     +# Since: 6.1
>     +##
>     +{ 'command': 'cprexec',
>     +  'data': { 'argv': [ 'str' ] } }
>     +
>     +##
>      # @cprload:
>      #
>      # Start virtual machine from checkpoint file that was created earlier using
>     -- 
>     1.8.3.1
> 
> 
> 
> 
> -- 
> Marc-André Lureau

