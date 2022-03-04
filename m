Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E1F154CD8D2
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 17:15:05 +0100 (CET)
Received: from localhost ([::1]:49736 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQAa9-0004sL-1H
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 11:15:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42108)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1nQAYg-0003cj-OT; Fri, 04 Mar 2022 11:13:34 -0500
Received: from mout.kundenserver.de ([212.227.126.130]:50203)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1nQAYe-0003V8-MG; Fri, 04 Mar 2022 11:13:34 -0500
Received: from [192.168.100.1] ([82.142.8.122]) by mrelayeu.kundenserver.de
 (mreue010 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MdNoW-1nzVJ42EQC-00ZPtd; Fri, 04 Mar 2022 17:13:22 +0100
Message-ID: <9d16a818-3003-078d-5c01-4294d2e9b02f@vivier.eu>
Date: Fri, 4 Mar 2022 17:13:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 3/4] Replace qemu_gettimeofday() with g_get_real_time()
Content-Language: fr
From: Laurent Vivier <laurent@vivier.eu>
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
References: <20220304152704.3466036-1-marcandre.lureau@redhat.com>
 <20220304152704.3466036-4-marcandre.lureau@redhat.com>
 <259d696c-9492-fb63-a2a4-1a66a8792520@vivier.eu>
In-Reply-To: <259d696c-9492-fb63-a2a4-1a66a8792520@vivier.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:5MyfoLkcLYJt7mIAhxfShb7CpVEFrkmcaiKdSxmBtCtnkDPibE3
 SxPOTH0XAEhXRLkss8t6XxU8li2Npg+sv7180teYrFNVdfuaqWzWn7ZNMEdA32AWpE2HSEM
 KpsVISk5VIonsWV4cafx0tjZP8xrY+3QHJcCQpldeP8D6PD4tiuf6fxf2dfUVuAyBQW7EFJ
 JGYqlX4v9hNiD2TY7PLbQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:JSD3m6C75eM=:6J0zjXK7f17pv/gl8rvMt5
 9wQPIoqlCmyS+R+l2wgoYZA9pxA5h56uKP84yKtmlqSap7SNtxlDXQQkV1j22haYRxMDOOTUQ
 AFQ8cjtaW9GX3oxx2H8jWrvL/UrfsoIMp+yzx8t3iHIfOSKZ5mWPXPqrms0cquFw5z5h+x1TB
 ybZ4I7mlA4iyJwlwFsxxD9gLMo9hp3xfJCfEvrW3tGhQY8OW4RqTh+Yc4ftWzbLTMuE8ShTg7
 Q9ewe+HKuS7S8ETe2s6iFGkDppLOjhWOUo5jKQbQVamrSH47dKjb31s3s7VZAN7ll0xnQDTES
 QqBUdDvUOnkv8sXjjGc2Hx1WG4nBFSUflQAWFJ9vdYHT2h6fLCpFRkDWRdEBKDo6D+ZNqzl3K
 R6MPwW9IKFxVWfa5QgEoMKvOt4mUSca9LBAWyAXruANqTjP93CYlf4F4W6vni/+yyvSvlrlYI
 gBqGsv1rMbiA9EO5aBbeqOje4M/xlMfTccP/RsoR/BdpDuLyHz4fly6dCMrbK+tCSD6IlaCNE
 f9ko2ys6H6+5rpHCaCJdPGQBnz2ydja8QJoLZBT6H55dOg7MEzBycnf3IkMrD5hnKsXrlcfOx
 xouHNu/K8WubV5gUwSLbjR4iUK2BYWp8GaTnArs1Pf79Ya+Qzyn2OKHc44D3iN4tWL3FrMxzE
 gCfofIQKJcg9mxinctN1RrfDW7LDBFIth27SqXFxVQzdH/hl6pbqkcT+MgGtz3358a8Y=
Received-SPF: none client-ip=212.227.126.130; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Marek Vasut <marex@denx.de>, Kevin Wolf <kwolf@redhat.com>,
 Thomas Huth <thuth@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 qemu-block@nongnu.org, David Hildenbrand <david@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Chris Wulff <crwulff@gmail.com>, Markus Armbruster <armbru@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, qemu-ppc@nongnu.org,
 Stefan Weil <sw@weilnetz.de>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 04/03/2022 à 17:08, Laurent Vivier a écrit :
> Le 04/03/2022 à 16:27, marcandre.lureau@redhat.com a écrit :
>> From: Marc-André Lureau <marcandre.lureau@redhat.com>
>>
>> GLib g_get_real_time() is an alternative to gettimeofday().
>>
>> For semihosting, a few bits are lost on POSIX host, but this shouldn't
>> be a big concern.
>>
>> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
>> ---
>>   blockdev.c                 |  8 ++++----
>>   hw/rtc/m41t80.c            |  6 +++---
>>   hw/virtio/virtio-balloon.c |  9 +--------
>>   qapi/qmp-event.c           | 12 +++++-------
>>   qemu-img.c                 |  8 ++++----
>>   qga/commands-posix.c       | 11 +----------
>>   target/m68k/m68k-semi.c    | 22 ++++++++++------------
>>   target/nios2/nios2-semi.c  | 24 +++++++++++-------------
>>   8 files changed, 39 insertions(+), 61 deletions(-)
>>
> ...
>> diff --git a/qga/commands-posix.c b/qga/commands-posix.c
>> index 75dbaab68ea9..3311a4ca0167 100644
>> --- a/qga/commands-posix.c
>> +++ b/qga/commands-posix.c
>> @@ -138,16 +138,7 @@ void qmp_guest_shutdown(bool has_mode, const char *mode, Error **errp)
>>   int64_t qmp_guest_get_time(Error **errp)
>>   {
>> -   int ret;
>> -   qemu_timeval tq;
>> -
>> -   ret = qemu_gettimeofday(&tq);
>> -   if (ret < 0) {
>> -       error_setg_errno(errp, errno, "Failed to get time");
>> -       return -1;
>> -   }
>> -
>> -   return tq.tv_sec * 1000000000LL + tq.tv_usec * 1000;
>> +    return g_get_real_time();
> 
> now you return microseconds, before it was nanoseconds.
> 
> qga/qapi-schema.json:
> 
> ##
> # @guest-get-time:
> #
> # Get the information about guest's System Time relative to
> # the Epoch of 1970-01-01 in UTC.
> #
> # Returns: Time in nanoseconds.
> #
> # Since: 1.5
> ##
> { 'command': 'guest-get-time',
>    'returns': 'int' }
> 
> Except this problem:
> 
> Reviewed-by: Laurent Vivier <laurent@vivier.eu>

Perhaps you can also remove the windows version from qga/commands-win32.c and move the function to 
qga/commands.c ?

Thanks,
Laurent


