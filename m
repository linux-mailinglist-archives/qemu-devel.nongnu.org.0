Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8321DF35AF
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Nov 2019 18:27:38 +0100 (CET)
Received: from localhost ([::1]:46404 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iSlZJ-0004lA-GE
	for lists+qemu-devel@lfdr.de; Thu, 07 Nov 2019 12:27:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51807)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alex.bennee@linaro.org>) id 1iSlYG-0004AU-Tm
 for qemu-devel@nongnu.org; Thu, 07 Nov 2019 12:26:34 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1iSlYF-0006Rz-BC
 for qemu-devel@nongnu.org; Thu, 07 Nov 2019 12:26:32 -0500
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:39023)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1iSlYF-0006RC-3b
 for qemu-devel@nongnu.org; Thu, 07 Nov 2019 12:26:31 -0500
Received: by mail-wm1-x343.google.com with SMTP id t26so3342629wmi.4
 for <qemu-devel@nongnu.org>; Thu, 07 Nov 2019 09:26:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version:content-transfer-encoding;
 bh=1cXkH0kwF1ySP+nPdjEKWjExmhPlMRUgxJ0MGtjBGRw=;
 b=kV1H3BZxjbzw8nKR3LWzGpFg1zREQ7D4FhjFDsnr8mwUQ2HSgI4JPV/hC7sOVa1bLr
 VklUSyGWnFpXseU2oTzIE/w2Gfxkn2uKwbyS3o3HlNtChIzbP3LqOn07F7Y1Wm3NhXp9
 KLrli7byfcEVopeP+k1iMn8ogRaHpf9hKjjOcByAYTq70lV33hAtQw55UvfoPxQidsGE
 i0P72WdX8ii/doHVR8K4Si+YhlXSCtaObO/rJl2WGT+xNWxwYN+x5iKwzd1JYveTbKsU
 r/obi1NBcgii9Y7YqXq12Mygy+31D0XJyDGE8tqhsj6vm70A8Wje+urh2a6WZyfmx8pB
 hidg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version:content-transfer-encoding;
 bh=1cXkH0kwF1ySP+nPdjEKWjExmhPlMRUgxJ0MGtjBGRw=;
 b=Eft7DShs/KBhHr0SVcnDd6I75TO4CeRgASSzDVK3yRrKip0T0+RmMy5yIVLF+E3xx7
 ZCuxhQ/Nhl+mKd7Zy09++52imBmIBuhseKLBab6IgowlVLuQ1Rn+vB0Kdjs7v06TP+1m
 hbkP8tJd8gfz0Y1FRuS782qBrAUny0dbFwMQveMTRZWxeNf4fLwd9braSh2JTNVyPmno
 cooLX4Ke1vPRXQgbKTQPywNaGIYHuxg3W5sAVsk3UnDTGG04c8WoeVwLTxZMNYuDhSkw
 Zqxum/raTIoeo5CDDVHzSigMeo4JD5eaZ9rmJqx7xtfhddqwgrpeNPjXQzEYOZ2crCbH
 l8YQ==
X-Gm-Message-State: APjAAAUtMjxy6wv+eBPrBtWaUt2Jr2/1BDMhLUHGahO7n9pq3S0xnS5y
 LpNXVl7fnuSrR4hwgI5pU4RF1w==
X-Google-Smtp-Source: APXvYqwJQk57QyPPSliDMpx/TLAP/3gZsfyUbeD0wIjPChdmVZhDN6xHmFptwm401ttBoWD0dmL27g==
X-Received: by 2002:a7b:ce12:: with SMTP id m18mr4243729wmc.130.1573147589458; 
 Thu, 07 Nov 2019 09:26:29 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id c24sm4188148wrb.27.2019.11.07.09.26.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Nov 2019 09:26:28 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id CEE191FF87;
 Thu,  7 Nov 2019 17:26:27 +0000 (GMT)
References: <20191107142613.2379-1-robert.foley@linaro.org>
 <20191107142613.2379-5-robert.foley@linaro.org>
 <87tv7fhcl7.fsf@linaro.org>
User-agent: mu4e 1.3.5; emacs 27.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Robert Foley <robert.foley@linaro.org>
Subject: Re: [PATCH 4/4] Added tests for close and change of logfile.
In-reply-to: <87tv7fhcl7.fsf@linaro.org>
Date: Thu, 07 Nov 2019 17:26:27 +0000
Message-ID: <87imnvha2k.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::343
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
Cc: peter.puhov@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Alex Benn=C3=A9e <alex.bennee@linaro.org> writes:

> Robert Foley <robert.foley@linaro.org> writes:
>
>> One test ensures that the logfile handle is still valid even if
>> the logfile is changed during logging.
>> The other test validates that the logfile handle remains valid under
>> the logfile lock even if the logfile is closed.

Also this doesn't see to work:

17:24:31 [alex@zen:~/l/q/b/all] review/rcu-logfile|=E2=80=A6 2 + ./tests/te=
st-logging
/logging/parse_range: OK
/logging/parse_path: OK
/logging/logfile_write_path: free(): double free detected in tcache 2
fish: =E2=80=9C./tests/test-logging=E2=80=9D terminated by signal SIGABRT (=
Abort)

in gdb

Starting program: /home/alex/lsrc/qemu.git/builds/all/tests/test-logging
[Thread debugging using libthread_db enabled]
Using host libthread_db library "/lib/x86_64-linux-gnu/libthread_db.so.1".
[New Thread 0x7ffff6f38700 (LWP 28960)]
/logging/parse_range: OK
/logging/parse_path: OK
/logging/logfile_write_path: free(): double free detected in tcache 2

Thread 1 "test-logging" received signal SIGABRT, Aborted.
__GI_raise (sig=3Dsig@entry=3D6) at ../sysdeps/unix/sysv/linux/raise.c:50
50      ../sysdeps/unix/sysv/linux/raise.c: No such file or directory.
(gdb) bt
#0  __GI_raise (sig=3Dsig@entry=3D6) at ../sysdeps/unix/sysv/linux/raise.c:=
50
#1  0x00007ffff7587535 in __GI_abort () at abort.c:79
#2  0x00007ffff75de508 in __libc_message (action=3Daction@entry=3Ddo_abort,=
 fmt=3Dfmt@entry=3D0x7ffff76e928d "%s\n") at ../sysdeps/posix/libc_fatal.c:=
181
#3  0x00007ffff75e4c1a in malloc_printerr (str=3Dstr@entry=3D0x7ffff76eaf58=
 "free(): double free detected in tcache 2") at malloc.c:5341
#4  0x00007ffff75e66fd in _int_free (av=3D0x7ffff7720c40 <main_arena>, p=3D=
0x5555555cac40, have_lock=3D<optimized out>) at malloc.c:4193
#5  0x00005555555614a8 in qemu_set_log_filename (filename=3D0x5555555cb110 =
"/tmp/qemu-test-logging.RO35A0/qemu_test_log_write0.log", errp=3D0x7fffffff=
def0) at /home/alex/lsrc/qemu.git/util/log.c:148
#6  0x000055555555d8be in test_logfile_write (data=3D0x5555555c7370) at /ho=
me/alex/lsrc/qemu.git/tests/test-logging.c:127
#7  0x00007ffff7cdc15a in test_case_run (tc=3D0x5555555c9c60) at ../../../g=
lib/gtestutils.c:2318
#8  g_test_run_suite_internal (suite=3Dsuite@entry=3D0x5555555c8a40, path=
=3Dpath@entry=3D0x0) at ../../../glib/gtestutils.c:2403
#9  0x00007ffff7cdc014 in g_test_run_suite_internal (suite=3Dsuite@entry=3D=
0x5555555c8a20, path=3Dpath@entry=3D0x0) at ../../../glib/gtestutils.c:2415
#10 0x00007ffff7cdc412 in g_test_run_suite (suite=3D0x5555555c8a20) at ../.=
./../glib/gtestutils.c:2490
#11 0x00007ffff7cdc431 in g_test_run () at ../../../glib/gtestutils.c:1755
#12 0x000055555555ce07 in main (argc=3D<optimized out>, argv=3D<optimized o=
ut>) at /home/alex/lsrc/qemu.git/tests/test-logging.c:212


>>
>> Signed-off-by: Robert Foley <robert.foley@linaro.org>
>> ---
>>  tests/test-logging.c | 74 ++++++++++++++++++++++++++++++++++++++++++++
>>  1 file changed, 74 insertions(+)
>>
>> diff --git a/tests/test-logging.c b/tests/test-logging.c
>> index a12585f70a..a3190ff92c 100644
>> --- a/tests/test-logging.c
>> +++ b/tests/test-logging.c
>> @@ -108,6 +108,76 @@ static void test_parse_path(gconstpointer data)
>>      error_free_or_abort(&err);
>>  }
>>
>> +static void test_logfile_write(gconstpointer data)
>> +{
>> +    QemuLogFile *logfile;
>> +    gchar const *dir =3D data;
>> +    Error *err =3D NULL;
>> +    gchar *file_path;
>> +    gchar *file_path1;
>
>   with g_autofree char *file_path you can avoid the free down bellow.
>
>> +    FILE *orig_fd;
>> +
>> +    file_path =3D g_build_filename(dir, "qemu_test_log_write0.log", NUL=
L);
>> +    file_path1 =3D g_build_filename(dir, "qemu_test_log_write1.log", NU=
LL);
>> +
>> +    /*
>> +     * Test that even if an open file handle is changed,
>> +     * our handle remains valid due to RCU.
>> +     */
>> +    qemu_set_log_filename(file_path, &err);
>> +    g_assert(!err);
>> +    rcu_read_lock();
>> +    logfile =3D atomic_rcu_read(&qemu_logfile);
>> +    orig_fd =3D logfile->fd;
>> +    g_assert(logfile && logfile->fd);
>> +    fprintf(logfile->fd, "%s 1st write to file\n", __func__);
>> +    fflush(logfile->fd);
>> +
>> +    /* Change the logfile and ensure that the handle is still valid. */
>> +    qemu_set_log_filename(file_path1, &err);
>> +    g_assert(!err);
>
> Maybe better would be:
>
>   logfile2 =3D atomic_rcu_read(&qemu_logfile);
>   g_assert(logfile->fd =3D=3D orig_fd);
>   g_assert(logfile2->fd !=3D logfile->fd);
>   fprintf(logfile2->fd, "%s 2nd write to file\n", __func__);
>   fflush(logfile2->fd);
>
> <snip>
>> +    g_assert(logfile->fd =3D=3D orig_fd);
>> +    fprintf(logfile->fd, "%s 2nd write to file\n", __func__);
>> +    fflush(logfile->fd);
>> +    rcu_read_unlock();
>> +
>> +    g_free(file_path);
>> +    g_free(file_path1);
>> +}
>> +
>> +static void test_logfile_lock(gconstpointer data)
>> +{
>> +    FILE *logfile;
>> +    gchar const *dir =3D data;
>> +    Error *err =3D NULL;
>> +    gchar *file_path;
>
> g_autofree
>
>> +
>> +    file_path =3D g_build_filename(dir, "qemu_test_logfile_lock0.log", =
NULL);
>> +
>> +    /*
>> +     * Test the use of the logfile lock, such
>> +     * that even if an open file handle is closed,
>> +     * our handle remains valid for use due to RCU.
>> +     */
>> +    qemu_set_log_filename(file_path, &err);
>> +    logfile =3D qemu_log_lock();
>> +    g_assert(logfile);
>> +    fprintf(logfile, "%s 1st write to file\n", __func__);
>> +    fflush(logfile);
>> +
>> +    /*
>> +     * Initiate a close file and make sure our handle remains
>> +     * valid since we still have the logfile lock.
>> +     */
>> +    qemu_log_close();
>> +    fprintf(logfile, "%s 2nd write to file\n", __func__);
>> +    fflush(logfile);
>> +    qemu_log_unlock(logfile);
>> +
>> +    g_assert(!err);
>> +    g_free(file_path);
>> +}
>> +
>>  /* Remove a directory and all its entries (non-recursive). */
>>  static void rmdir_full(gchar const *root)
>>  {
>> @@ -134,6 +204,10 @@ int main(int argc, char **argv)
>>
>>      g_test_add_func("/logging/parse_range", test_parse_range);
>>      g_test_add_data_func("/logging/parse_path", tmp_path, test_parse_pa=
th);
>> +    g_test_add_data_func("/logging/logfile_write_path",
>> +                         tmp_path, test_logfile_write);
>> +    g_test_add_data_func("/logging/logfile_lock_path",
>> +                         tmp_path, test_logfile_lock);
>>
>>      rc =3D g_test_run();


--
Alex Benn=C3=A9e

