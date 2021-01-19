Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EEBF2FC31A
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 23:16:07 +0100 (CET)
Received: from localhost ([::1]:55674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1zIE-00067m-Jj
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 17:16:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50076)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dongli.zhang@oracle.com>)
 id 1l1zFs-0004kI-Q3
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 17:13:41 -0500
Received: from aserp2120.oracle.com ([141.146.126.78]:49238)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dongli.zhang@oracle.com>)
 id 1l1zFq-0005PZ-1j
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 17:13:39 -0500
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10JMAFRc148890;
 Tue, 19 Jan 2021 22:13:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=TQQ8jv9CX6eRa6How679//g4XzY0702LJ+3F0y6Ac4g=;
 b=gHsx3wCqIVRJRmBuVWBzo0oBLVRCqX/zJAJjtGKhcrNu6UihNwXL5gUxMPt6iowwQqVg
 Ad9bEYCIYGPOD8gtSvA/Jq4eDX/+AYpgMopfbwWxBBiiDFLZjq5hH0DaM2ZEp5vUvBr2
 kEuZDeliNK59hqGLRssaaoUbVvkYV3Avs1heovSw9Ja1M4Jttc+Q6UyRfmz5FbF1LQd0
 HyQd3jv71Cw5BLLqlCTuPEETttvd+TUYVeaMH5PKSglQ3+jgOXMCH9AYuHz085noKEK9
 GMR61c+n8PJ9OqfMKxisnNaaiMafOoXpE1x8pxDuxevnwMA3NC25r5yl1zIYjQsCyxTr tA== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by aserp2120.oracle.com with ESMTP id 363r3kuat6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 19 Jan 2021 22:13:34 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10JLk18E039499;
 Tue, 19 Jan 2021 22:11:33 GMT
Received: from nam04-bn3-obe.outbound.protection.outlook.com
 (mail-bn3nam04lp2055.outbound.protection.outlook.com [104.47.46.55])
 by aserp3020.oracle.com with ESMTP id 3661ercfr6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 19 Jan 2021 22:11:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DIzoHBuF0ir7a87ws1JUXJkhkzCH2SpxtAxrer3CaEtvLXG6XoDOMARib5BpupRiwpGTSP4WBz6SEoFjReqyN2JKUb8g5rEChGE3RTYkrQKsSuciN1Zn4QwnYpYn4+mAU+t/wi8SaAY7ZG66LuCPQTwEgKoE2zKs/fSZEcHtH5hd5LgeDWopivuirureeLhEBSItceKrsoQcrZxggkfyccOWhkN8d2/XUz93ky0+omPA/67C9FKHk5IOVP4FVx9PkA5YvBMHYcanXGShJl/MY9+nLNyUcSNPBLc3BJnrQ9b/GgtS6yRw/YmVhiLXGPYGebV20tR+rxhd4cZ3YNtjAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TQQ8jv9CX6eRa6How679//g4XzY0702LJ+3F0y6Ac4g=;
 b=mQnZqQqbVlZ9W5NBW4ruuhRhIKmOPZoRyCCAY0YU0So35exKybohqyeXguV8acoGy5oA4JXA4rrELBjB0T03HAzpifircYpWKfvwKy4JW4/mDyTCM4hTZUkIbf5dEI6FEfj1vvFRJnBgvZGqX3cAEj7dcPNujy1/kbSAuFF/rtGCfHD1/2FpV7cK5VVrcILvsqmFw8+32vLK+WWs8s64zgWPpbpNRfMFfylVoJbck+EDxwrDl/f+FQMvh7I96DK0E6/HTEfnIL2beTx5x+AXXE7XN3SlbpZBArpOchNcl2RtJ+Wld8IlhUjtYjwla3iDl9n+zamsE2GLaINiz/WRhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TQQ8jv9CX6eRa6How679//g4XzY0702LJ+3F0y6Ac4g=;
 b=fizaEVj2bUtpiAVKs9gH8XMg4fU/1i/zsG8+2UIi+AVuHo7S9vELEFRhAp7MfBWD3QudZ3263g+zDmcYEMsJxhXnrHlZNXLPgN42hQJcyNxKi+wBb6IfdqXk/wXKkZjFbl72BwpVuK03jd0qKKai1kb9avFZ9WfRYi4SWocf0yo=
Received: from BYAPR10MB2663.namprd10.prod.outlook.com (2603:10b6:a02:a9::20)
 by BYAPR10MB3447.namprd10.prod.outlook.com (2603:10b6:a03:8b::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.10; Tue, 19 Jan
 2021 22:11:32 +0000
Received: from BYAPR10MB2663.namprd10.prod.outlook.com
 ([fe80::644d:92e4:7b5d:f8c1]) by BYAPR10MB2663.namprd10.prod.outlook.com
 ([fe80::644d:92e4:7b5d:f8c1%5]) with mapi id 15.20.3763.014; Tue, 19 Jan 2021
 22:11:31 +0000
Subject: Re: [PATCH RFC 0/2] Add debug interface to kick/call on purpose
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20210115002730.1279-1-dongli.zhang@oracle.com>
 <20210115102727.GC1692978@redhat.com> <20210118165934.GD9899@work-vm>
From: Dongli Zhang <dongli.zhang@oracle.com>
Message-ID: <676f0b1a-edb9-5076-ef99-bced56132cf5@oracle.com>
Date: Tue, 19 Jan 2021 14:11:28 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <20210118165934.GD9899@work-vm>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [2601:646:c303:6700::a4a4]
X-ClientProxiedBy: SA0PR11CA0106.namprd11.prod.outlook.com
 (2603:10b6:806:d1::21) To BYAPR10MB2663.namprd10.prod.outlook.com
 (2603:10b6:a02:a9::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2601:646:c303:6700::a4a4] (2601:646:c303:6700::a4a4) by
 SA0PR11CA0106.namprd11.prod.outlook.com (2603:10b6:806:d1::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3763.9 via Frontend Transport; Tue, 19 Jan 2021 22:11:30 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 048dca57-d444-4e10-1f98-08d8bcc72d41
X-MS-TrafficTypeDiagnostic: BYAPR10MB3447:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR10MB34473CB583D474EE90872EAAF0A30@BYAPR10MB3447.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2bUh7W2M0DL2XwEa0GXNefXPYOF88WI9+fBYhHZ0wXug7/M2QNtWYQ6qqRT/hdnPZcoxYTPLVaqMPlRFEhLUSrF2eRY0W/cee1EPGFRn8CVZrH80/uSSpPPygrhJmcEb5+vOSU/+PdDUYZNDFI7tG9JNmULCAjC4IxOP+aUbG4K67QBdNt1bcPDRa5MBV/Yxa2uPcG8Dvx1MBOzeo1CZNER+W9durimn7sj5WB6zxAErx8IlY25XquWFElOO9Iea+vyXcUOCHYRBjs0Fu3sTOnurOH52amxRXs86fP9XQHhLaRUY3CswjeFotPyLPfzMEC/jdmhoxipYiWaNtqFL8GvMDM8iE5ElEJDyLl0ePbIu7ElA1QIiSrBhwAUK33K5GU5vaA02Mv11mBxFqT/x3vN2ZAH3Oe/vvp1CQL6KVBatPIL7ywrodFy7cdTe28rET9p1YtGqEXJiXPzFJaGzWj7mJxLAZjCZ/Anlt0Pp8+FgzuWMOOSMc241z/jI4gIP4gQMQXXMsCF3N2rTxrw1RTOPHtZwT0wyjBD7WzLcDXeWIXhqcfSvWd3LxgLF2q5P
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB2663.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(376002)(136003)(346002)(366004)(39860400002)(396003)(107886003)(966005)(8936002)(83380400001)(110136005)(31686004)(66946007)(16526019)(44832011)(66476007)(186003)(66556008)(36756003)(8676002)(2616005)(31696002)(86362001)(53546011)(6486002)(2906002)(4326008)(478600001)(316002)(5660300002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?bHAwNlpvZVpJTEF6SmNpZkpGRWhFaVlPWFQ0S3Y1OEFnOWNNajlqU0ZBeWNj?=
 =?utf-8?B?VXhZcWNYQ050Tzg0cmNIYlZYamhxQkkzMTllTW1TMXF2QWxvTHcwa2M0Ymti?=
 =?utf-8?B?QTNHSDJFRXZJL2pvNG92ZTRkemRGOWNITmUrSmNHQzJSenBCUFdSWFpKdWFV?=
 =?utf-8?B?NmhNY2EvQStTOXZhNzgzaEp0OUNRNXRlK3E4OUp2NzhZamhtR01abjZXUlM3?=
 =?utf-8?B?dVpGcGtGM3YvWkcyaHZlTExkNjRqUERxdURUeHorL0lPRWwvNTVmQkVYQXlQ?=
 =?utf-8?B?MnA3Z2hXOTdPVk8xaEdCM0luVVp6MTh0TzhzU3owUGpiSnNFMHovS2lDdFBS?=
 =?utf-8?B?TGZMYVFJTjB0c0xpbDhNSGdHTHBYNjlnenFCZU9jd3NXcnh0Vnc3L1hveDhl?=
 =?utf-8?B?cktqZ01meGdNUWhzL01wOFFLWW1qcTdPY2d6Qk5VclBzSHdxbXVFSkk5eUgy?=
 =?utf-8?B?R3ZiM3cwNE5sMDRDWk1FWVVGOC9hcTZZcUMxRmVJcW91UmUxSXR3TVdaS1Zm?=
 =?utf-8?B?RW5BWlcxTVVjWTY2bHJabW0ybzhRdlZ4b3htcnJWNTBEM2FaYTArSjYycitS?=
 =?utf-8?B?N2dUdk1XcjdMUmVjalJPZ2p5V0ZVTVhyYlRlUldxTm1oaDVBRWd0c2I2emRw?=
 =?utf-8?B?b0JEQ3hGN1NFMC82czIvUUk5cWF5MTdtTjlsWjd1a0RRRmNjWUh0UVQxbVFn?=
 =?utf-8?B?a05GcDRkV3IwY1Z2S1NUQjYzZjBVdDZQSStVZTg1djhMN09DRm5ZRU1OMGYz?=
 =?utf-8?B?QTFTMytJVzNWOTBXN25NUzdkbkNDQ2pMUStRdlpxaCtUSElzSVFHcDZ6RmhT?=
 =?utf-8?B?S2NrV0xSSE5LY2ozM3NLZ2JxMXJxMDgyK1pXL244aWRsbmI2WWppVW40a3lG?=
 =?utf-8?B?cHBXSmtycUR3WWZJS3Q1WWd6ZVMzcHVmZDV3ZWllSlBYbC9sQjlFN3FXa2dK?=
 =?utf-8?B?SWk1RjBNcFg3Rk9QdjRGaGgwSGxxcXMxZElCUTN0ODMrTmRkeGJWaGlsazJh?=
 =?utf-8?B?emtKTGx3ZkF5Q2k0WnVKaHFwTDFnRGdwZGs1WEhSSmJYUy9qOHBEbE1mYldL?=
 =?utf-8?B?bTBqamoveTlJSTliVzlCWDNzMytQMklGQW13SEpsZjVWa1R3L1NiU1A0TUV6?=
 =?utf-8?B?VmxaWWtmcGJCZG5CcC8zRlJ3ZVZNQjFLMm51dGkxTzhUTGxaWXZTWkFYYS9i?=
 =?utf-8?B?UWNPVzJ4Wklac2Z1MG03VXpWZHVQandiQ1o2ME5TUk5obmZCejZ6aVRENWZJ?=
 =?utf-8?B?cElzOThxSVA1SlhSQ3lWTHgvbUk2eHlFU3FGS2p0TW5oMVZSTUEySllZZFlM?=
 =?utf-8?B?aUluNlVQWlRtaGZmZGRkY3cyM2F6ZTRUVG9JVUUveGNUUWtYSG5FUTJJQTNt?=
 =?utf-8?B?SEttZnV3czBGaXc9PQ==?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 048dca57-d444-4e10-1f98-08d8bcc72d41
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB2663.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2021 22:11:31.8520 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R1h70QlUhdGoPJvHg2RwqlPjELF50fIePxybN3JcQIQNwu8VjlE5bjcqfnBTE+/dqZ6iyl3wb/Zag5bmE5fSWA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR10MB3447
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9869
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 phishscore=0 mlxscore=0
 mlxlogscore=999 adultscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101190117
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9869
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 priorityscore=1501 mlxscore=0
 malwarescore=0 phishscore=0 suspectscore=0 impostorscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101190118
Received-SPF: pass client-ip=141.146.126.78;
 envelope-from=dongli.zhang@oracle.com; helo=aserp2120.oracle.com
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
Cc: ehabkost@redhat.com, mst@redhat.com, joe.jin@oracle.com, armbru@redhat.com,
 qemu-devel@nongnu.org, pbonzini@redhat.com, joao.m.martins@oracle.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 1/18/21 8:59 AM, Dr. David Alan Gilbert wrote:
> * Daniel P. BerrangÃ© (berrange@redhat.com) wrote:
>> On Thu, Jan 14, 2021 at 04:27:28PM -0800, Dongli Zhang wrote:
>>> The virtio device/driver (e.g., vhost-scsi and indeed any device including
>>> e1000e) may hang due to the lost of IRQ or the lost of doorbell register
>>> kick, e.g.,
>>>
>>> https://urldefense.com/v3/__https://lists.gnu.org/archive/html/qemu-devel/2018-12/msg01711.html__;!!GqivPVa7Brio!K_zaQzJhlvPjRZe9efEtyX8vB6fMlKQeNy_RGz7oPp9k76pC8zarG1nSs1SFSL2xI1g$ 
>>>
>>> The virtio-net was in trouble in above link because the 'kick' was not
>>> taking effect (missed).
>>>
>>> This RFC adds a new debug interface 'DeviceEvent' to DeviceClass to help
>>> narrow down if the issue is due to lost of irq/kick. So far the new
>>> interface handles only two events: 'call' and 'kick'. Any device (e.g.,
>>> e1000e or vhost-scsi) may implement (e.g., via eventfd, MSI-X or legacy
>>> IRQ).
>>>
>>> The 'call' is to inject irq on purpose by admin for a specific device (e.g.,
>>> vhost-scsi) from QEMU/host to VM, while the 'kick' is to kick the doorbell
>>> on purpose by admin at QEMU/host side for a specific device.
>>
>> I'm really not convinced that we want to give admins the direct ability to
>> poke at internals of devices in a running QEMU. It feels like there is way
>> too much potential for the admin to make a situation far worse by doing
>> the wrong thing here,
> 
> We already do have commands to write to an iport, and to inject MCEs for
> example; is this that much different?
> 
>> and people dealing with support tickets will have
>> no idea that the admin has been poking internals of the device and broken
>> it by doing something wrong.
> 
> You could add a one time log entry to say that this mischeivous command
> had been used.
> 
>> You pointed to bug that hit where this could conceivably be useful, but
>> that's a one time issue and should not a common occurrance that justifies
>> making an official public API to poke at devices forever more IMHO.
> 
> I think where it might be practically useful is if you were debugging a
> hung customers VM and need to find a way to get it to move again.
> THat's something I'm not familiar with on the virtio side;
> mst - is this useful from a virtio side?

BTW, the linux kernel blk-mq has similar idea/interface. To run the below will
be able to 'run' the block IO queue on purpose.

echo "kick" > /sys/kernel/debug/block/sda/state

It is helpful for diagnostic if we assume the IO stall is due to an unknown race
that a 'run' of queue is missing.

Dongli Zhang

> 
> Dave
> 
>> Regards,
>> Daniel
>> -- 

