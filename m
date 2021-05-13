Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F043837FEF2
	for <lists+qemu-devel@lfdr.de>; Thu, 13 May 2021 22:24:20 +0200 (CEST)
Received: from localhost ([::1]:57946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhHsa-000814-2C
	for lists+qemu-devel@lfdr.de; Thu, 13 May 2021 16:24:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58730)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1lhHpo-0003Fq-Qu
 for qemu-devel@nongnu.org; Thu, 13 May 2021 16:21:29 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:9826)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1lhHpl-0001GA-PZ
 for qemu-devel@nongnu.org; Thu, 13 May 2021 16:21:28 -0400
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14DKI1fF027498; Thu, 13 May 2021 20:21:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=8wsZqh+YUK/2Lcf8Jth/hQGLL3Bahuakvcf0Fj5kuUg=;
 b=T/n/azuMMdRQVJYzK6DY2CmDDYFgRoNjTOedRZ6sBEHhk6uRyIHHftEc+VRQBqKEhFax
 10WmjjF153YLY9FJx3DAcCpeb4n2JbHrju50lPAgVJzawQYPip1iM5JLJ/nAucy18xN6
 S4aBXRzaKHQGS1B1vQaPyAR1wph9s3iqBhnkJ3dsC/QNnVGku2sw7fhyVi+2IVkS0wCn
 +saMzDLdtSUBM+reKyH/8Jn/ReNMxxV1zR/1pNPCkm1ziST2axIHpvBRjmxF4FdMcW/F
 2KLSrvLU9p/etWA8g7rPtciHgf+Qm+NmjJI/RCicmPF1ozhsvTsD0LaMp5fLvdpRVJ4x 5w== 
Received: from oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 38gppfrdkk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 13 May 2021 20:21:23 +0000
Received: from userp3030.oracle.com (userp3030.oracle.com [127.0.0.1])
 by pps.podrdrct (8.16.0.36/8.16.0.36) with SMTP id 14DKIG3g081146;
 Thu, 13 May 2021 20:21:22 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2171.outbound.protection.outlook.com [104.47.56.171])
 by userp3030.oracle.com with ESMTP id 38gpq2d35g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 13 May 2021 20:21:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Jxk7tm0wzNNRDb+az6G6aWWd/u1ZEKJwxAZynIzW1E3BVCk0oWXhcjGFF+lJa56Ey53U2wAviQNlDW5VZhg7N2Tz2uEubzELeYERqwXCTiwFmQjYR95kh8Ef6OC8X0jX5j/ZteVf4W9l5VqsQRI1sYJP2IgLivu9aSKXooF7rvOIE7t5FWRjhZlUWnPx4IHQDtryZlG9a8Cjlh5aZJHa9P+b2i4Iovn53c50C9gYUGvQxi/71ElKwx9jLieOZCcWWWPJTJnskMXE1tPIea9p4Bf1do20+AgbgcUNEbp5Nn2ueuvuSTPZjpbRfIlg6na71oCY4TnItJfJkutB+fhvRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8wsZqh+YUK/2Lcf8Jth/hQGLL3Bahuakvcf0Fj5kuUg=;
 b=FNMmmq0XW8/17Rrv8sjeixc26m7Amn5G6kxBUmPou7ieo557gTZfxBXGcb1wwDJo+Nh6w4Zg00LFGbYn5JZKinOuEpMnmGOHGGlbVkkJhACjeZBqgDy5Fj/vyWz/nWF0PYHL5vXXCFQQhUTkQDVSnemOAAGtnZxpmHPEatDOqengeN5kR4Pufw34Bk7/FkNJMlCr5anY6oN1Cr4sLV2fto8zRiK6Ay9RufU0c2Lm2zKCjiKM7PFQdYeE02oNwZ+OkUydQrjlloSh/CPJV1FBm71Q/Agc38qY7+L0uBWs4hpHa5BdY/8kHUh2+wBPFTTaNZnJOhFXWvfoC75ZC3yISw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8wsZqh+YUK/2Lcf8Jth/hQGLL3Bahuakvcf0Fj5kuUg=;
 b=ky6v+HTbgf90j4QOyCdTzVLbzpFguiEjEn4wpdwv6tmMICySc+6wp1PCXzr7VwdRHfyb1NGc0niYbtud8UgmDvYheojtpzxofmD9AFE2A3DnTg+Vk662IdpF2S8Fd85bYFATlKUWxEs5gBlz2zfSmspsTK128Cu6y1n5KNMMWR8=
Authentication-Results: oracle.com; dkim=none (message not signed)
 header.d=none;oracle.com; dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB3240.namprd10.prod.outlook.com (2603:10b6:a03:155::17)
 by BYAPR10MB3014.namprd10.prod.outlook.com (2603:10b6:a03:87::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.25; Thu, 13 May
 2021 20:21:19 +0000
Received: from BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::6ce3:f0a3:c303:f851]) by BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::6ce3:f0a3:c303:f851%7]) with mapi id 15.20.4108.031; Thu, 13 May 2021
 20:21:19 +0000
Subject: Re: [PATCH V3 00/22] Live Update
To: Stefan Hajnoczi <stefanha@redhat.com>
References: <1620390320-301716-1-git-send-email-steven.sistare@oracle.com>
 <YJwFkhlYISA9INwO@stefanha-x1.localdomain>
From: Steven Sistare <steven.sistare@oracle.com>
Organization: Oracle Corporation
Message-ID: <4d3dd5ff-5180-16df-ab48-11de610dd396@oracle.com>
Date: Thu, 13 May 2021 16:21:15 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
In-Reply-To: <YJwFkhlYISA9INwO@stefanha-x1.localdomain>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [24.62.106.7]
X-ClientProxiedBy: SA0PR11CA0056.namprd11.prod.outlook.com
 (2603:10b6:806:d0::31) To BYAPR10MB3240.namprd10.prod.outlook.com
 (2603:10b6:a03:155::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.92] (24.62.106.7) by
 SA0PR11CA0056.namprd11.prod.outlook.com (2603:10b6:806:d0::31) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4108.24 via Frontend Transport; Thu, 13 May 2021 20:21:17 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: eb29a69a-8f4f-4298-3fc9-08d9164cab3e
X-MS-TrafficTypeDiagnostic: BYAPR10MB3014:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR10MB30147648F7A5074E3D6C8ECBF9519@BYAPR10MB3014.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZANP1I/nJgklWVewhuLB2jtaoV4kRjZaIBJy6Hbcwif4ugJiG37dVxbGeUzcRDlp0SnDfXJpVDO3hELa4KwX32XhSk57S0r/TlLajlXKAG7UNmo0xtyDV9O+We4Q+kYeCEwjrfF7qq94LHf64NmCv7FDXWYIvdsG3pAkzXXTLSxXSqcXO07Rzuvop6uqij9CaNGTkc98GJQXEgab+APcGKibztP8JVv+GuFCf/sO8qM5MacjNgGObiQLNNcbG1R1eXMQf3adV5ZeKlzp7zAkQuw5wAOpt6514NA03kGCufKvX0G5Lo6RbCtwCT8qct3nkorA6Eqq7mbRSQgFv3QykEp/qKG/EYwxZ0H3YmtiDfbkuf92GfWsOS9ppTDYRZMug8/3+uJJ1HK06dAfVLe2HiWyBVofOSbHvyco/Y00ngvoUDPmRdpemfYnkgcFPzpGGvi45MBUESVjG4+42eNs2cZ0kCxkA6exBTAqFZzSP4uCB8X3eHfuf9nwm8qtlepH4caTyBwvsmmb9yZPwhT21xqdXz41+x0GRbJxsDysGO3+UMjKag9UtPYJqVWAN2ydCauA+sRgtw+cEo/mqkAXovILBoLxhXilLL+PqaugXxTiSVYqWIa8R4GVTraUdNIPBUpTdg5VVJmOYxwttnzI2tOwzdrEDqIjPuZ4cEEblOPQAWpfXpCshCBj5bH6sewP
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3240.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(346002)(39860400002)(376002)(366004)(396003)(136003)(66556008)(4326008)(8676002)(66946007)(86362001)(6916009)(16576012)(6486002)(31696002)(36756003)(66476007)(54906003)(53546011)(478600001)(36916002)(2906002)(5660300002)(316002)(107886003)(26005)(31686004)(83380400001)(15650500001)(186003)(16526019)(8936002)(38100700002)(7416002)(44832011)(2616005)(956004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?Windows-1252?Q?hnQFIyvw9NTENXjBOpnhDYwj9EiAot85mLso/zpPHLKBCXHOAqAGHxOU?=
 =?Windows-1252?Q?3Zmvq+DwqEKn9a6SFOgMaxETxL2MTmO+3YOnkcapaMSfQS3bBlUY/aax?=
 =?Windows-1252?Q?7SYc2lJDebLqY1G42ePY5/dkVsnWX83AQqruka7SqubNaCPyQ1naqkel?=
 =?Windows-1252?Q?chJXZIIKs3m940Ya1aJ3M/rE2O5g900rW9NutQixw7fKgHbjopkXQX3k?=
 =?Windows-1252?Q?aRtnW12nxX+etG93gvwHsjF5Xt2bbyJkYIvLAV8F/ywGHKpvFj+MgKhZ?=
 =?Windows-1252?Q?Zl35QO3UpUkBtBT6mQFgWpTm86rf9Rv/xB9pTzFtZJnVRepY5YPpYpeu?=
 =?Windows-1252?Q?utDTJmGnrodtC0pHi2mTsaUj40XVFNU9sif+6ACYqbS5EmoYxirUOKXM?=
 =?Windows-1252?Q?4n/4/TRFiKBqC6E2xOKO4w9QFeq9OpoITO5Zbt3QK+rYsSCVSGOfZJ7A?=
 =?Windows-1252?Q?nRPao2m0KHyXLyYUylOTgw3dJlpg2heFECE4gm35O/sPQFJXA5gKR4+i?=
 =?Windows-1252?Q?sYXDPMV3B8g9l3PX8za01jX+RKfiLmVQuClU6mj+oaw0AjaRmDujsp7J?=
 =?Windows-1252?Q?BpC7A+IZ/9QII1oycX4Wf7EJE1MMy30TMeWsFWkVleKz7EGYV78oWSJa?=
 =?Windows-1252?Q?U198rhqKoyRm9KKiyVb5XASjIwG6c26xUq4NLfhDBxQzeVECqTvESqSH?=
 =?Windows-1252?Q?IwBWxTtqJyjoN6tzI8F2UsA8AUquK4yNM8QiLccg1UUWQc0nmBWVEvej?=
 =?Windows-1252?Q?27JIDgkRSK42srl2/Eh+JV4K9V6O8L3lp4gn84oZb8MtOCY/rIQcLR1v?=
 =?Windows-1252?Q?jxIBoWQFwyRD/icSHXInA/uTzr9K2ZOAXnletDWZuGyFgp+R3UbZorii?=
 =?Windows-1252?Q?3UPedlFQbeRPw6DTGVEJYbWqqyW6tF8/+RhVJh9Mn9Ul/UJ8rc4eLToq?=
 =?Windows-1252?Q?sZzk6jZIM5rOjwBcvcaRpE5lvR/+Di7g/RBipfWiyfNAQR4+GBkOhLX7?=
 =?Windows-1252?Q?cdmUjRjm9Cj1k11m9E2DcSiIAAEUEq5W5PD169Q0sJqhql/msa+YMMn4?=
 =?Windows-1252?Q?qto20N6HvQKhKEdb4Gf/hq8qcLoba7qewo661iSUr3swGTsexQ9IhqjL?=
 =?Windows-1252?Q?9P0Xf7ErbWg7No3qG0ckJVSIItZd+FrhZtgVV/bBrVhKTx13kN6ahov1?=
 =?Windows-1252?Q?f38f5zkjRjPcMq9+oG4nnKz//QqtvHZtlo/knVc561pOC0z7XgGBygAL?=
 =?Windows-1252?Q?jGqqoxSRfG/a0FXXeBB24FFazYKthiKiUDg/rRYvmqbJZ43YMVtNS8l2?=
 =?Windows-1252?Q?So1vJtRkQt1bHUqO63uT4QNeUaN2BPF7zQ9uFUtVDE5xgDCm9FCcSk1a?=
 =?Windows-1252?Q?J4IyMKyx4eNfsl6xyYzYDdDgWUd3yx839qWkppABW75BxEOuRz1ext4k?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb29a69a-8f4f-4298-3fc9-08d9164cab3e
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3240.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2021 20:21:19.7863 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 31JEyn7qkUog+5YRvf3SP3TSWdA7t3l/Agelqbg0rc+En5FcivXT78moZM+D02NPdS+66xQ5U60Gx6Vq1+YEdlqFpyZxzDuCjLtm77k9fQg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR10MB3014
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9983
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 suspectscore=0
 malwarescore=0 spamscore=0 mlxscore=0 adultscore=0 bulkscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2105130143
X-Proofpoint-GUID: Y3fck3eaeSa6oF8s0vlE3GVq2Ms3KPKP
X-Proofpoint-ORIG-GUID: Y3fck3eaeSa6oF8s0vlE3GVq2Ms3KPKP
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=steven.sistare@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001,
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
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/12/2021 12:42 PM, Stefan Hajnoczi wrote:
> On Fri, May 07, 2021 at 05:24:58AM -0700, Steve Sistare wrote:
>> Provide the cprsave and cprload commands for live update.  These save and
>> restore VM state, with minimal guest pause time, so that qemu may be updated
>> to a new version in between.
>>
>> cprsave stops the VM and saves vmstate to an ordinary file.  It supports two
>> modes: restart and reboot.  For restart, cprsave exec's the qemu binary (or
>> /usr/bin/qemu-exec if it exists) with the same argv.  qemu restarts in a
>> paused state and waits for the cprload command.
> 
> I think cprsave/cprload could be generalized by using QMP to stash the
> file descriptors. The 'getfd' QMP command already exists and QEMU code
> already opens fds passed using this mechanism.
> 
> I haven't checked but it may be possible to drop some patches by reusing
> QEMU's monitor file descriptor passing since the code already knows how
> to open from 'getfd' fds.
> 
> The reason why using QMP is interesting is because it eliminates the
> need for execve(2). QEMU may be unable to execute a program due to
> chroot, seccomp, etc.
> 
> QMP would enable cprsave/cprload to work both with and without
> execve(2).
> 
> One tricky thing with this approach might be startup ordering: how to
> get fds via the QMP monitor in the new process before processing the
> entire command-line.

Early on I experimented with a similar approach.  Old qemu passed descriptors to an
escrow process and exited; new qemu started and retrieved the descriptors from escrow.
vfio mostly worked after I hacked the kernel to suppress the original-pid owner check.
I suspect my recent vfio extensions would smooth the rough edges.

However, the main issue is that guest ram must be backed by named shared memory, and
we would need to add code to support shared memory for all the secondary memory objects.
That makes it less interesting for us at this time; we care about updating legacy qemu 
instances with anonymous guest memory.

Having said all that, this would be an interesting project, just not the one I want to 
push now.  In the future we could add a new cprsave mode to support it in a backward
compatible manner.

- Steve

