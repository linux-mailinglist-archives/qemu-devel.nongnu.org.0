Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3A452D54F3
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Dec 2020 08:58:08 +0100 (CET)
Received: from localhost ([::1]:58650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knGpz-0006e7-Up
	for lists+qemu-devel@lfdr.de; Thu, 10 Dec 2020 02:58:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56494)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1knGnk-0005mh-Af
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 02:55:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45815)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1knGne-0003aA-Su
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 02:55:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607586934;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CeBMIAVmZ35m/43o3q33s+5aU/qTklRE8ojXTLa05/E=;
 b=UoNp1AUQKZD49bAkU5lpjXg/0JbhNKHoZLDe7cOEQFVTZMKFzT0o4n3daoi+5zzaal+NxW
 uERsJfh39AKcjF3PAbpNasV0zu+o2GPxj0fDRung2NqCjYTn2iKufnob2OT3IEP/2grYwV
 jdEmhs8vU+YOxTeS6JXh8oG1Ug1PCL0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-395-vHE536DDN7Gq2tW5abR_tw-1; Thu, 10 Dec 2020 02:55:32 -0500
X-MC-Unique: vHE536DDN7Gq2tW5abR_tw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8F409800D55
 for <qemu-devel@nongnu.org>; Thu, 10 Dec 2020 07:55:31 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-113-52.ams2.redhat.com
 [10.36.113.52])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8A75519746;
 Thu, 10 Dec 2020 07:55:27 +0000 (UTC)
Subject: Re: [Virtio-fs] [PATCH] virtiofsd: make the debug log timestamp on
 stderr more human-readable
To: Vivek Goyal <vgoyal@redhat.com>
References: <20201208055043.31548-1-lersek@redhat.com>
 <20201208165725.GB20722@redhat.com>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <9e1966ea-049e-1c3d-b81a-a6ce17f5f134@redhat.com>
Date: Thu, 10 Dec 2020 08:55:26 +0100
MIME-Version: 1.0
In-Reply-To: <20201208165725.GB20722@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lersek@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=lersek@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: virtio-fs@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/08/20 17:57, Vivek Goyal wrote:
> On Tue, Dec 08, 2020 at 06:50:43AM +0100, Laszlo Ersek wrote:
>> The current timestamp format doesn't help me visually notice small jumps
>> in time ("small" as defined on human scale, such as a few seconds or a few
>> ten seconds). Replace it with a local time format where such differences
>> stand out.
> 
> Switching to a human readable time stamp makes sense. That seems much
> more helpful for debugging, IMHO.

Thanks! (for the other review as well)
laszlo

> 
> Thanks
> Vivek
> 
>>
>> Before:
>>
>>> [13316826770337] [ID: 00000004] unique: 62, opcode: RELEASEDIR (29), nodeid: 1, insize: 64, pid: 1
>>> [13316826778175] [ID: 00000004]    unique: 62, success, outsize: 16
>>> [13316826781156] [ID: 00000004] virtio_send_msg: elem 0: with 1 in desc of length 16
>>> [15138279317927] [ID: 00000001] virtio_loop: Got VU event
>>> [15138279504884] [ID: 00000001] fv_queue_set_started: qidx=1 started=0
>>> [15138279519034] [ID: 00000003] fv_queue_thread: kill event on queue 1 - quitting
>>> [15138280876463] [ID: 00000001] fv_remove_watch: TODO! fd=9
>>> [15138280897381] [ID: 00000001] virtio_loop: Waiting for VU event
>>> [15138280946834] [ID: 00000001] virtio_loop: Got VU event
>>> [15138281175421] [ID: 00000001] virtio_loop: Waiting for VU event
>>> [15138281182387] [ID: 00000001] virtio_loop: Got VU event
>>> [15138281189474] [ID: 00000001] virtio_loop: Waiting for VU event
>>> [15138309321936] [ID: 00000001] virtio_loop: Unexpected poll revents 11
>>> [15138309434150] [ID: 00000001] virtio_loop: Exit
>>
>> (Notice how you don't (easily) notice the gap in time after
>> "virtio_send_msg", and especially the amount of time passed is hard to
>> estimate.)
>>
>> After:
>>
>>> [2020-12-08 06:43:22.58+0100] [ID: 00000004] unique: 51, opcode: RELEASEDIR (29), nodeid: 1, insize: 64, pid: 1
>>> [2020-12-08 06:43:22.58+0100] [ID: 00000004]    unique: 51, success, outsize: 16
>>> [2020-12-08 06:43:22.58+0100] [ID: 00000004] virtio_send_msg: elem 0: with 1 in desc of length 16
>>> [2020-12-08 06:43:29.34+0100] [ID: 00000001] virtio_loop: Got VU event
>>> [2020-12-08 06:43:29.34+0100] [ID: 00000001] fv_queue_set_started: qidx=1 started=0
>>> [2020-12-08 06:43:29.34+0100] [ID: 00000003] fv_queue_thread: kill event on queue 1 - quitting
>>> [2020-12-08 06:43:29.34+0100] [ID: 00000001] fv_remove_watch: TODO! fd=9
>>> [2020-12-08 06:43:29.34+0100] [ID: 00000001] virtio_loop: Waiting for VU event
>>> [2020-12-08 06:43:29.34+0100] [ID: 00000001] virtio_loop: Got VU event
>>> [2020-12-08 06:43:29.34+0100] [ID: 00000001] virtio_loop: Waiting for VU event
>>> [2020-12-08 06:43:29.34+0100] [ID: 00000001] virtio_loop: Got VU event
>>> [2020-12-08 06:43:29.34+0100] [ID: 00000001] virtio_loop: Waiting for VU event
>>> [2020-12-08 06:43:29.37+0100] [ID: 00000001] virtio_loop: Unexpected poll revents 11
>>> [2020-12-08 06:43:29.37+0100] [ID: 00000001] virtio_loop: Exit
>>
>> Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
>> Cc: Stefan Hajnoczi <stefanha@redhat.com>
>> Signed-off-by: Laszlo Ersek <lersek@redhat.com>
>> ---
>>  tools/virtiofsd/passthrough_ll.c | 31 +++++++++++++++++++++++++++----
>>  1 file changed, 27 insertions(+), 4 deletions(-)
>>
>> diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrough_ll.c
>> index 48a109d3f682..06543b20dcbb 100644
>> --- a/tools/virtiofsd/passthrough_ll.c
>> +++ b/tools/virtiofsd/passthrough_ll.c
>> @@ -3311,18 +3311,38 @@ static void setup_nofile_rlimit(unsigned long rlimit_nofile)
>>  static void log_func(enum fuse_log_level level, const char *fmt, va_list ap)
>>  {
>>      g_autofree char *localfmt = NULL;
>> +    struct timespec ts;
>> +    struct tm tm;
>> +    char sec_fmt[sizeof "2020-12-07 18:17:54"];
>> +    char zone_fmt[sizeof "+0100"];
>>  
>>      if (current_log_level < level) {
>>          return;
>>      }
>>  
>>      if (current_log_level == FUSE_LOG_DEBUG) {
>> -        if (!use_syslog) {
>> -            localfmt = g_strdup_printf("[%" PRId64 "] [ID: %08ld] %s",
>> -                                       get_clock(), syscall(__NR_gettid), fmt);
>> -        } else {
>> +        if (use_syslog) {
>> +            /* no timestamp needed */
>>              localfmt = g_strdup_printf("[ID: %08ld] %s", syscall(__NR_gettid),
>>                                         fmt);
>> +        } else {
>> +            /* try formatting a broken-down timestamp */
>> +            if (clock_gettime(CLOCK_REALTIME, &ts) != -1 &&
>> +                localtime_r(&ts.tv_sec, &tm) != NULL &&
>> +                strftime(sec_fmt, sizeof sec_fmt, "%Y-%m-%d %H:%M:%S",
>> +                         &tm) != 0 &&
>> +                strftime(zone_fmt, sizeof zone_fmt, "%z", &tm) != 0) {
>> +                localfmt = g_strdup_printf("[%s.%02ld%s] [ID: %08ld] %s",
>> +                                           sec_fmt,
>> +                                           ts.tv_nsec / (10L * 1000 * 1000),
>> +                                           zone_fmt, syscall(__NR_gettid),
>> +                                           fmt);
>> +            } else {
>> +                /* fall back to a flat timestamp */
>> +                localfmt = g_strdup_printf("[%" PRId64 "] [ID: %08ld] %s",
>> +                                           get_clock(), syscall(__NR_gettid),
>> +                                           fmt);
>> +            }
>>          }
>>          fmt = localfmt;
>>      }
>> @@ -3452,6 +3472,9 @@ int main(int argc, char *argv[])
>>      struct lo_map_elem *reserve_elem;
>>      int ret = -1;
>>  
>> +    /* Initialize time conversion information for localtime_r(). */
>> +    tzset();
>> +
>>      /* Don't mask creation mode, kernel already did that */
>>      umask(0);
>>  
>> -- 
>> 2.19.1.3.g30247aa5d201
>>
>> _______________________________________________
>> Virtio-fs mailing list
>> Virtio-fs@redhat.com
>> https://www.redhat.com/mailman/listinfo/virtio-fs


