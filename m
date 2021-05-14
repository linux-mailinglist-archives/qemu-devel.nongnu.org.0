Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65C91380D96
	for <lists+qemu-devel@lfdr.de>; Fri, 14 May 2021 17:51:54 +0200 (CEST)
Received: from localhost ([::1]:56634 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lha6T-0006OL-E0
	for lists+qemu-devel@lfdr.de; Fri, 14 May 2021 11:51:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1lhZXH-0000TK-V6
 for qemu-devel@nongnu.org; Fri, 14 May 2021 11:15:34 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:62076)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1lhZXE-0007sS-TQ
 for qemu-devel@nongnu.org; Fri, 14 May 2021 11:15:31 -0400
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14EFCa1V010570; Fri, 14 May 2021 15:15:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : subject : to :
 cc : references : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=UNHmWprlpL1M5XWgiudrtTA+Err4BgzGkGCWI0+CS3M=;
 b=FKv8Ui7XtmQewk5H2HIAcgPxdi8CQtN26VYiyOL3nmQPLtnrnWuwt82iCy5E4qcaWJWU
 gPKb5Xurl/YJeriWdN3ZSr+BpkgXmrrjxHPQX8dsQy7Pn2lKP9+mV9EAUhcLM+dTvPYA
 BdVCPvLh1mi3Pr4/822XmxVKzhFJvzF9+2AH4qI6dsd1ZosMI3e+SV/7wBFLLVfL7YK0
 b7zKx2LoKI60mW5iDHeGyvy9DVxLkgb6aaJoaSkhL7svJfRNHwSUBqT6yiP83PQLrf26
 vsyY/sJvVDxJadzkUPyUBPVeIUG2CdJJHRhQQ5FR/vvMKkHPiGJmuXrR6Am/xgJfYTcN Ww== 
Received: from oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 38gpqsrqmv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 14 May 2021 15:15:25 +0000
Received: from aserp3030.oracle.com (aserp3030.oracle.com [127.0.0.1])
 by pps.podrdrct (8.16.0.36/8.16.0.36) with SMTP id 14EFFO9t015566;
 Fri, 14 May 2021 15:15:24 GMT
Received: from nam02-dm3-obe.outbound.protection.outlook.com
 (mail-dm3nam07lp2042.outbound.protection.outlook.com [104.47.56.42])
 by aserp3030.oracle.com with ESMTP id 38gppq6ven-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 14 May 2021 15:15:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DGHGXrbHBdAdoM/BlGDVDzpFf6wReDj1LtLuL+l/JC+c5NleEbCup07yMiEjhyoegTfvmi5tTW88fMN/sAqtfOXKtFCtetLwRrqMlN0AVjKh4ynPF+l3RMCy30KOw5teGwRw5/EPOzX2/pHodVBM1WjwISVkFS3OKovh1y+cAn/R/ppYOps9EENjwtbtxUngXkVnG163PT/CRMvoy1Ptattu98wbrM3BFICQS1BJ09MlMrMgfBbMcNuJW6jgTi7PpQmVnRgQfRPKodTUPsfCWNdvwZ5bwRtRNVk+i+zJQu5w4y6SIioMswgjntdqXITaR30A93EW2wuTPYWWM6bEhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UNHmWprlpL1M5XWgiudrtTA+Err4BgzGkGCWI0+CS3M=;
 b=dme4cXgmghEJhHjeygdMWTzl42LuEUC8CkxCvLMoBbpHW0hRoJGvRTOrdPEnrBo1Xw0ubQbzhU3N5UlXHbB7wSnxMASq5zFyi6arxOaHh1yAH20IhHmLDbyKY6+WXpgChBpN/6a/qW6qpOScQ+pAymxP1mv3fw1W3j/hQCLhituMS6B0AUuoFhtrvCLjp+ZjLkwvJN5X/21uOx6k/t+U0R+V3KdHzaQpqbKscZevAfDFXzvPpDPIEpHxuVM3pkAkftyaFab3y/IOo9eyQzRxIYNjEsCWK569YohZz8zP5oiCeXbYjsDnNUqd3jXbmbC5XOGlE3plbl1awP5Btd6MOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UNHmWprlpL1M5XWgiudrtTA+Err4BgzGkGCWI0+CS3M=;
 b=FruXkC5Su/ty++DC05irvAzohVmoS0B/l2BD5QQbSAj9sfPWOJMdmvxVkZHmINvCbXGVPW0qNz0VhyPTubGeJEACMZEeqERw+2O0Qb/n0bBWOW20U2oz82JFIjtgO4LZGTWzdoue0q3Ydshn4G55Huw/nGFD2irE05P2ziBnKlA=
Authentication-Results: oracle.com; dkim=none (message not signed)
 header.d=none;oracle.com; dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB3240.namprd10.prod.outlook.com (2603:10b6:a03:155::17)
 by SJ0PR10MB4461.namprd10.prod.outlook.com (2603:10b6:a03:2d8::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.26; Fri, 14 May
 2021 15:15:21 +0000
Received: from BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::6ce3:f0a3:c303:f851]) by BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::6ce3:f0a3:c303:f851%7]) with mapi id 15.20.4129.028; Fri, 14 May 2021
 15:15:21 +0000
From: Steven Sistare <steven.sistare@oracle.com>
Subject: Re: [PATCH V3 00/22] Live Update
To: Stefan Hajnoczi <stefanha@redhat.com>
References: <1620390320-301716-1-git-send-email-steven.sistare@oracle.com>
 <YJwFkhlYISA9INwO@stefanha-x1.localdomain>
 <4d3dd5ff-5180-16df-ab48-11de610dd396@oracle.com>
 <YJ5kokhzyA5tCom3@stefanha-x1.localdomain>
Organization: Oracle Corporation
Message-ID: <29356c3a-0b3f-2773-4f9f-18ff4ed4d5bb@oracle.com>
Date: Fri, 14 May 2021 11:15:18 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
In-Reply-To: <YJ5kokhzyA5tCom3@stefanha-x1.localdomain>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [24.62.106.7]
X-ClientProxiedBy: SN6PR05CA0036.namprd05.prod.outlook.com
 (2603:10b6:805:de::49) To BYAPR10MB3240.namprd10.prod.outlook.com
 (2603:10b6:a03:155::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.92] (24.62.106.7) by
 SN6PR05CA0036.namprd05.prod.outlook.com (2603:10b6:805:de::49) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4150.11 via Frontend Transport; Fri, 14 May 2021 15:15:19 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6992c298-f36e-4fce-924c-08d916eb175b
X-MS-TrafficTypeDiagnostic: SJ0PR10MB4461:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SJ0PR10MB4461C0E168981814C591118CF9509@SJ0PR10MB4461.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XTH6jyYn+YeoXU7gTvjrvSIq4etc0aSg1SaEk6XhivK1WgWTwT8AQhSmK38mVY4vIYn7gQb4rQXUek8le0Lo+pxJEYovGontn3RpzwxmmepWCoKeQ0d2/kiC0mk1yWGsYsYqMsmHj0nfJIxCFeZhNOlk9HEvXg95mWDFl7jdjr0NizJkP0Vw0ClVJIUdLzv8X/g78A8x/frgr5+DGL9rWKtHs0i6YtP9xvLA5sHi7pFZNy9g8Wm//3BIOgbzc/TOrPt3nqRfbJHzk8L2QOYK0idrveeCJmHY39vFlSD6KhPfTYWsLjZFwL+izdglNFF2RJUtJmb3llSQRSv8JZmOIEjkArj0dCOSgW5xYb/dAIQhKhqUzYW8G+Cel/r/37XXS9jzPplriANcHLWaDMoFRZhUEJfe6hkCqpNjhDbNmS4vaZLe/Tx4BTKOvhu39d96iKEMnMN/kfWAG8fkxbvJNEwKUdRmRQUKpRiFuOR8tu8VQTkMXzqchEl9dV+rwn8w4E8yxDwRMhxp+ESrjcHSt81e1qZny2a2Nz9j+eKJBArIQYSUy13jasumNOPhhJGX9/1JuX7Dr6j4XjRqMF4nrvvA0qKpfnsRX3SkWplcPn/qPD7Kt7X7oq2zf/b+xuNWMnUFXHjUM2aviO7mfDlxRL5uAcOtAvn4qu/fSaUVWXMXET77bn5rm6VIydFNpe/M
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3240.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(396003)(39860400002)(346002)(136003)(376002)(31696002)(44832011)(6916009)(6486002)(36756003)(7416002)(5660300002)(83380400001)(186003)(54906003)(4326008)(8936002)(86362001)(316002)(31686004)(66556008)(66946007)(2616005)(956004)(38100700002)(107886003)(16526019)(478600001)(66476007)(15650500001)(8676002)(36916002)(26005)(53546011)(2906002)(16576012)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?Windows-1252?Q?tnFwORB0WH08uAmlI7B6IztFWI5RsBqJzWVZ35Va/StnNojFMgZVSMZG?=
 =?Windows-1252?Q?of6EI+F3bPYNB3bJ2o6KKsJKfGILQtgR32bYkp/D+Fvt12IwQeuBRh30?=
 =?Windows-1252?Q?Hyewshrxksan2FnF4lDL7ZrqdbL8jo3wqfXHTi0oDcIah4nE0KiMfcIm?=
 =?Windows-1252?Q?rzwprQXcNAaG1cGWdUOX/jUUzNV6+AwHTaEOkTOzyn2K+QDzUtf/e/Oy?=
 =?Windows-1252?Q?mxtVDwRKnnVN0nx+yXKkBL3nh1OpSbVw571lEe3C1r52nhfB3YqA6kam?=
 =?Windows-1252?Q?Z+BN060SpkXd6QofB09FqUkvB9+PqRFSod0VlkLiE0qeLb6vsQNKIZ66?=
 =?Windows-1252?Q?HsHSfcnBLfHz8u1zrWqGCm4KfFUz8Jp4drsxqPOA9kR5nWddH1ht+3BV?=
 =?Windows-1252?Q?0i2yMQASCZyIjcRPKB93GCBEkYqabyxpyk3vCta32YwmgUeOGRWtL9Z7?=
 =?Windows-1252?Q?7wG93DJRzDSu2CY/iywhqgxDRSyDYC27FvUeZKiD0EJLoHvOSTUEhKzk?=
 =?Windows-1252?Q?hNT43Ys5SbsgvdrO9vRhswcD/nUlnVbFxCqUPCrYwKaKCKesiVhKNoF/?=
 =?Windows-1252?Q?Hy1PpX3oH7a1ZgqfQFOy/Weg7mBwGCQehiwM61tNPQxXTZZfatW9xOVo?=
 =?Windows-1252?Q?G4dOAkGgpm5MD5nDxWISERZpthBDGbRxLDSvlU1JvKm2jaqec12p/IyK?=
 =?Windows-1252?Q?pvNUWkBsAreeniVLwMIi9vq4FzzZrkVOMw06fz+KSLQFm9/kYp5ONQ2e?=
 =?Windows-1252?Q?TPjhQBcL39YGi5/z0k1rs5tnWpb619PExmM3Py7liSZ46p7g/lJCkVPt?=
 =?Windows-1252?Q?iJq8cuXJwFcq2PM/Ru0YQyV8FZKlFb8bPmkHT9DieanuWAxmq/vzp1uT?=
 =?Windows-1252?Q?95D6U9UlUoYe+6ZPbeC4ovDD6m85ZN/uFXqvw+8VKp7xrr8f/Foddkq5?=
 =?Windows-1252?Q?S+Pn7sufBwFDYO3+36Gx3QAo131HXMxzfdexRywh2613XdeK0D8Kujij?=
 =?Windows-1252?Q?4MUi60yamyP12mg+eL8Ywwh3qLnYOEuUgGhcAWx0CSF16NUibHnQgche?=
 =?Windows-1252?Q?R2xolxsZj6Jy92yE2DJCl4zLfM+6oZGyTXKacSWp5H9QBHn4Q7nxFHhs?=
 =?Windows-1252?Q?vIJnOny8CLmCZoKWJXtBnPqJTmdtY211Fci26J3v1GRGUh5GuE9ZCwu7?=
 =?Windows-1252?Q?ogIUkrUjwrlnBAvZtv5AG8ajeVPynL+3M2eCwcjKfwSYLUJryVdG9znk?=
 =?Windows-1252?Q?01NtaagBC3GPWD7xOFe2nwuiCpALt+trOvWifzrZqSBQHaahZlZUFrnr?=
 =?Windows-1252?Q?UQuV729s3cAYJAp69fLfoQs98JTryhE4mJTYi6py0/6c880EfoHGM0QV?=
 =?Windows-1252?Q?iff7M/Ne4dZuuG2jPscaqOc/+0ARluvHy/Fc9s0dBQBAcpl1dDmLCLnG?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6992c298-f36e-4fce-924c-08d916eb175b
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3240.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2021 15:15:21.6567 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cqOErF1HmungspyGnAhw+ph39EY7ddlvObh1BofHGrEBSe98ZHtvAzPHDfy0D1SbyJsQqBYAq82nvF1GZlkG6CWAH4CnDXXvnikTu1q1HXQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4461
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9984
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 spamscore=0
 phishscore=0 suspectscore=0 malwarescore=0 bulkscore=0 adultscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2105140122
X-Proofpoint-GUID: 7g32nQlsqd_clG1vK5Z-aWK_ampJBR6l
X-Proofpoint-ORIG-GUID: 7g32nQlsqd_clG1vK5Z-aWK_ampJBR6l
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=steven.sistare@oracle.com; helo=mx0a-00069f02.pphosted.com
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

On 5/14/2021 7:53 AM, Stefan Hajnoczi wrote:
> On Thu, May 13, 2021 at 04:21:15PM -0400, Steven Sistare wrote:
>> On 5/12/2021 12:42 PM, Stefan Hajnoczi wrote:
>>> On Fri, May 07, 2021 at 05:24:58AM -0700, Steve Sistare wrote:
>>>> Provide the cprsave and cprload commands for live update.  These save and
>>>> restore VM state, with minimal guest pause time, so that qemu may be updated
>>>> to a new version in between.
>>>>
>>>> cprsave stops the VM and saves vmstate to an ordinary file.  It supports two
>>>> modes: restart and reboot.  For restart, cprsave exec's the qemu binary (or
>>>> /usr/bin/qemu-exec if it exists) with the same argv.  qemu restarts in a
>>>> paused state and waits for the cprload command.
>>>
>>> I think cprsave/cprload could be generalized by using QMP to stash the
>>> file descriptors. The 'getfd' QMP command already exists and QEMU code
>>> already opens fds passed using this mechanism.
>>>
>>> I haven't checked but it may be possible to drop some patches by reusing
>>> QEMU's monitor file descriptor passing since the code already knows how
>>> to open from 'getfd' fds.
>>>
>>> The reason why using QMP is interesting is because it eliminates the
>>> need for execve(2). QEMU may be unable to execute a program due to
>>> chroot, seccomp, etc.
>>>
>>> QMP would enable cprsave/cprload to work both with and without
>>> execve(2).
>>>
>>> One tricky thing with this approach might be startup ordering: how to
>>> get fds via the QMP monitor in the new process before processing the
>>> entire command-line.
>>
>> Early on I experimented with a similar approach.  Old qemu passed descriptors to an
>> escrow process and exited; new qemu started and retrieved the descriptors from escrow.
>> vfio mostly worked after I hacked the kernel to suppress the original-pid owner check.
>> I suspect my recent vfio extensions would smooth the rough edges.
> 
> I wonder about the reason for VFIO's pid limitation, maybe because it
> pins pages from the original process?

The dma unmap code verifies that the requesting task is the same as the task that mapped
the pages.  We could add an ioctl that passes ownership to a new task.  We would also need
to fix locked memory accounting, which is associated with the mm of the original task.

> Is this VFIO pid limitation the main reason why you chose to make QEMU
> execve(2) the new binary?

That is one.  Plus, re-attaching to named shared memory for pc.ram causes the vfio conflict
errors I mentioned in the previous email.  We would need to suppress redundant dma map calls,
but allow legitimate dma maps and unmaps in response to the ongoing address space changes and
diff callbacks caused by some drivers. It would be messy and fragile. In general, it felt like 
I was working against vfio rather than with it.

Another big reason is a requirement to preserve anonymous memory for legacy qemu updates (via
code injection which I briefly mentioned in KVM forum).  If we extend cpr to allow updates 
without exec, I still need the exec option.

>> However, the main issue is that guest ram must be backed by named shared memory, and
>> we would need to add code to support shared memory for all the secondary memory objects.
>> That makes it less interesting for us at this time; we care about updating legacy qemu 
>> instances with anonymous guest memory.
> 
> Thanks for explaining this more in the other sub-thread. The secondary
> memory objects you mentioned are relatively small so I don't think
> saving them in the traditional way is a problem.
> 
> Two approaches for zero-copy memory migration fit into QEMU's existing
> migration infrastructure:
> 
> - Marking RAM blocks that are backed by named memory (tmpfs, hugetlbfs,
>   etc) so they are not saved into the savevm file. The existing --object
>   memory-backend-file syntax can be used.
> 
> - Extending the live migration protocol to detect when file descriptor
>   passing is available (i.e. UNIX domain socket migration) and using
>   that for memory-backend-* objects that have fds.
> 
> Either of these approaches would handle RAM with existing savevm/migrate
> commands.

Yes, but the vfio issues would still need to be solved, and we would need new
command line options to back existing and future secondary memory objects with 
named shared memory.

> The remaining issue is how to migrate VFIO and other file descriptors
> that cannot be reopened by the new process. As mentioned, QEMU already
> has file descriptor passing support in the QMP monitor and support for
> opening passed file descriptors (see qemu_open_internal(),
> monitor_fd_param(), and socket_get_fd()).
> 
> The advantage of integrating live update functionality into the existing
> savevm/migrate commands is that it will work in more use cases with
> less code duplication/maintenance/bitrot prevention than the
> special-case cprsave command in this patch series.
> 
> Maybe there is a fundamental technical reason why live update needs to
> be different from QEMU's existing migration commands but I haven't
> figured it out yet.

vfio and anonymous memory.

Regarding code duplication, I did consider whether to extend the migration
syntax and implementation versus creating something new.  Those functions
handle stuff like bdrv snapshot, aio, and migration which are n/a for the cpr
use case, and the cpr functions handle state that is n/a for the migration case.
I judged that handling both in the same functions would be less readable and
maintainable.  After feedback during the V1 review, I simplified the cprsave
code by by calling qemu_save_device_state, as Xen does, thus eliminating any
interaction with the migration code.

Regarding bit rot, I still need to add a cpr test to the test suite, when the 
review is more complete and folks agree on the final form of the functionality.

I do like the idea of supporting update without exec, but as a future project, 
and not at the expense of dropping update with exec.

- Steve

