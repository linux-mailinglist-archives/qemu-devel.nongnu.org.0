Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E6A8333028
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 21:44:55 +0100 (CET)
Received: from localhost ([::1]:33572 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJjDq-0005eI-36
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 15:44:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42592)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lJisP-000641-Vy; Tue, 09 Mar 2021 15:22:46 -0500
Received: from mout.kundenserver.de ([212.227.17.10]:59345)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lJisN-0006iz-TB; Tue, 09 Mar 2021 15:22:45 -0500
Received: from [192.168.100.1] ([82.142.6.26]) by mrelayeu.kundenserver.de
 (mreue109 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1Mdvyi-1lr8kO3yqM-00b43t; Tue, 09 Mar 2021 21:22:27 +0100
Subject: Re: [PATCH] scsi: Silence gcc warning
To: Eric Blake <eblake@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@redhat.com>, qemu-devel@nongnu.org, Li Qiang <liq3ea@gmail.com>,
 Alexander Bulekov <alxndr@bu.edu>,
 "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>
References: <20210209152350.207958-1-eblake@redhat.com>
 <2ca3b005-9d9f-dde6-a7d4-b7e08a3e3066@redhat.com>
 <01bc8d3d-5399-dfad-0ca3-c9392fcb176c@redhat.com>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <5f699abb-1951-f180-b8c1-c44385854ae6@vivier.eu>
Date: Tue, 9 Mar 2021 21:22:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <01bc8d3d-5399-dfad-0ca3-c9392fcb176c@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:u1XKDIaNGAcaTQa+3PD+L89EO5DsvF56VXd86tU/7hO5MuXNfbT
 3fAzRJqedOTd2wLRcY0GX/hftWgPBocc9Jj5cvetALfZHlVbi0qbmCOhvPxLI4cRAgniTFa
 b5XFN5XNqvOi8qjIseeTcjrjMRdPUl3NhUi1p1Us830KvpjyE31OjHEwcFrRxlo5FDgMgdL
 945eHzXNltwEmPJ/U6n+Q==
X-UI-Out-Filterresults: notjunk:1;V03:K0:1yo0f08qYJc=:BIynjBwcL3iC/RiLFH0q/d
 FCyZabG910F4xiXq2vvhE3A+iE7Ico1vfyvO48o7UiKUmATj8EUdoC3k8zpAJs/aIHrpsk901
 LTUV7b6i+Kz0nxcuRJLHL6ohDVXeEuVFN0MWkHKsGnggqGkfjFpGnvKz5VR2AWblzblh6Kidm
 YzXMETxiEZs3l8cO4GkmAfypkBIgdnoShsUkdzf+TKQaXPdKtv0eI3Yrr8o9xrhfEoI8jdF8B
 o7WgxeG2aGStaK+ZClIgKB3ZBnxuxd/8Hppfd5DTCsLTifvt7xi5fY2e6fEtKabaZ8pdftDEH
 Ow6FqRHmvh32PJ6XrHCmSHjyU4jvn3jB8l2PJ23FGahafmIf2hUMPMBIyVbOh+SiVlT9Z/mGG
 9WjNGsg9mcI1WB6PwDR7suPKhLKJrJUO0qUP0C4sHVZNYELBrnRSev/BoFgx17Ys0UL5/aRI8
 3P6JHaIecQ==
Received-SPF: none client-ip=212.227.17.10; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 08/03/2021 à 20:54, Eric Blake a écrit :
> Adding qemu-trivial in cc.
> 
> On 2/9/21 9:44 AM, Philippe Mathieu-Daudé wrote:
>> On 2/9/21 4:23 PM, Eric Blake wrote:
>>> On Fedora 33, gcc 10.2.1 notes that scsi_cdb_length(buf) can set
>>> len==-1, which in turn overflows g_malloc():
>>>
>>> [5/5] Linking target qemu-system-x86_64
>>> In function ‘scsi_disk_new_request_dump’,
>>>     inlined from ‘scsi_new_request’ at ../hw/scsi/scsi-disk.c:2608:9:
>>> ../hw/scsi/scsi-disk.c:2582:19: warning: argument 1 value ‘18446744073709551612’ exceeds maximum object size 9223372036854775807 [-Walloc-size-larger-than=]
>>>  2582 |     line_buffer = g_malloc(len * 5 + 1);
>>>       |                   ^
>>>
>>> Silence it with a decent assertion, since we only convert a buffer to
>>> bytes when we have a valid cdb length.
>>>
>>> Signed-off-by: Eric Blake <eblake@redhat.com>
>>> ---
>>>  hw/scsi/scsi-disk.c | 1 +
>>>  1 file changed, 1 insertion(+)
>>>
>>> diff --git a/hw/scsi/scsi-disk.c b/hw/scsi/scsi-disk.c
>>> index ed52fcd49ff0..b3311a5657b7 100644
>>> --- a/hw/scsi/scsi-disk.c
>>> +++ b/hw/scsi/scsi-disk.c
>>> @@ -2579,6 +2579,7 @@ static void scsi_disk_new_request_dump(uint32_t lun, uint32_t tag, uint8_t *buf)
>>>      int len = scsi_cdb_length(buf);
>>>      char *line_buffer, *p;
>>>
>>> +    assert(len > 0 && len <= 16);
>>>      line_buffer = g_malloc(len * 5 + 1);
>>>
>>>      for (i = 0, p = line_buffer; i < len; i++) {
>>>
>>
>> Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>>
> 

Applied to my trivial-patches branch.

Thanks,
Laurent


