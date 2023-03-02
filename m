Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 31DB56A8BC2
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 23:25:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXrMT-0008Q9-7T; Thu, 02 Mar 2023 17:25:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pXrMQ-0008PY-VZ
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 17:25:15 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pXrMP-0002JA-2c
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 17:25:14 -0500
Received: by mail-wr1-x42e.google.com with SMTP id g3so572653wri.6
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 14:25:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677795911;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ThQdYLnI+zhCdeoLmtn5mNV9OQ4DNbQ7a6T0t4T4sTU=;
 b=y6/2Fh4AOfmeNHWnQ+N5pDvJXzJQyzyaOerhexPF/5YGd8xCvlIr9F4LtG4Kohnw5L
 BxMTR29+5BT4RrOsSQzIcOLEiriQG9spYGYRTTUxSqyxsR1SpEHUP5BYi31AcRUbO7Yq
 8HQzeJ4ESlcLAYdpTrs3aUAWB8CAs6rAPpQozMibu97lySILUdhXmNpOhwxd6kYyu9lt
 kVpJXGCsD2n7teNgmgJcHvddQ2ptIDKOXrgU/9SHd5+HaWpfOYEXUPiVqel4Jt3XDSda
 xaOsMl49/4cUcdd/nqyXiKdqY0EtN4UG4LmFdPKg14FfdRceNvwEhBIhpqxspVBwFei4
 qB1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677795911;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ThQdYLnI+zhCdeoLmtn5mNV9OQ4DNbQ7a6T0t4T4sTU=;
 b=Ja2ZA0YhfImSzBzUe9B7N4EjyjO1OKGQsd6U9DJFSc5lx2OhSHtgHodsZihluXm+cJ
 tZUPfZR0RtJmyrxT9NSHg2Fr/CyM9BfTmdSWTM0H0rmgL89oxpNk79DqN0jbfH+5haM+
 v1DFhoOxGMC8PIipNgLNY8eEPFySNnKckZuLeWm45+hN+oDBk6hl1OUdDNU0J0DH7TK6
 gAG4fGKOlb2bPl162VdLlI7jdvUOj307aIJwM9xjwpD4zx3zf0kP/Bakn/zh7szLtL00
 FTSr1YQBBku5mgZfsFxiOIHDgyv0QTkqB6UXBUS0Q9zC7Hn3b76YnHQNBn5/Uwt8o/g+
 eFag==
X-Gm-Message-State: AO0yUKVFAdy+cJ3U7LQQQfgKX8XEy6ZtIjZBhDz0kvW9r9APnT9so5K0
 atzy4HTz2EKrdcXgvzjPCEMZsQ==
X-Google-Smtp-Source: AK7set8LnVTbEDji8ucTtLhz+zCaeWCSTy6f43MM8s6ZjeYfk4ZXW9DDSkg0zr5U3T9k6LiHFUYslQ==
X-Received: by 2002:adf:f791:0:b0:2c9:5dd8:2978 with SMTP id
 q17-20020adff791000000b002c95dd82978mr8957408wrp.59.1677795911436; 
 Thu, 02 Mar 2023 14:25:11 -0800 (PST)
Received: from [192.168.27.175] (43.red-95-127-39.staticip.rima-tde.net.
 [95.127.39.43]) by smtp.gmail.com with ESMTPSA id
 a12-20020a056000100c00b002c55ec7f661sm517607wrx.5.2023.03.02.14.25.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Mar 2023 14:25:10 -0800 (PST)
Message-ID: <e635b980-2d55-bf5a-a572-1b18244d330c@linaro.org>
Date: Thu, 2 Mar 2023 23:25:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH] tests/qtest/migration-test: Disable
 migration/multifd/tcp/plain/cancel
Content-Language: en-US
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Juan Quintela <quintela@redhat.com>
References: <20230302172211.4146376-1-peter.maydell@linaro.org>
 <ZADe2HMuRNUwCVxW@work-vm>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <ZADe2HMuRNUwCVxW@work-vm>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.092,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 2/3/23 18:37, Dr. David Alan Gilbert wrote:
> * Peter Maydell (peter.maydell@linaro.org) wrote:
>> migration-test has been flaky for a long time, both in CI and
>> otherwise:
>>
>> https://gitlab.com/qemu-project/qemu/-/jobs/3806090216
>> (a FreeBSD job)
>>    32/648 ERROR:../tests/qtest/migration-helpers.c:205:wait_for_migration_status: assertion failed: (g_test_timer_elapsed() < MIGRATION_STATUS_WAIT_TIMEOUT) ERROR
>>
>> on a local macos x86 box:
>> ▶  34/621 ERROR:../../tests/qtest/migration-helpers.c:151:migrate_query_not_failed: assertion failed: (!g_str_equal(status, "failed")) ERROR
>>   34/621 qemu:qtest+qtest-i386 / qtest-i386/migration-test                         ERROR          168.12s   killed by signal 6 SIGABRT
>> ――――――――――――――――――――――――――――――――――――― ✀  ―――――――――――――――――――――――――――――――――――――
>> stderr:
>> qemu-system-i386: Failed to peek at channel
>> query-migrate shows failed migration: Unable to write to socket: Broken pipe
>> **
>> ERROR:../../tests/qtest/migration-helpers.c:151:migrate_query_not_failed: assertion failed: (!g_str_equal(status, "failed"))
>>
>> (test program exited with status code -6)
>> ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――
>>
>> ▶  37/621 ERROR:../../tests/qtest/migration-helpers.c:151:migrate_query_not_failed: assertion failed: (!g_str_equal(status, "failed")) ERROR
>>   37/621 qemu:qtest+qtest-x86_64 / qtest-x86_64/migration-test                     ERROR          174.37s   killed by signal 6 SIGABRT
>> ――――――――――――――――――――――――――――――――――――― ✀  ―――――――――――――――――――――――――――――――――――――
>> stderr:
>> query-migrate shows failed migration: Unable to write to socket: Broken pipe
>> **
>> ERROR:../../tests/qtest/migration-helpers.c:151:migrate_query_not_failed: assertion failed: (!g_str_equal(status, "failed"))
>>
>> (test program exited with status code -6)
>>
>> In the cases where I've looked at the underlying log, this seems to
>> be in the migration/multifd/tcp/plain/cancel subtest.  Disable that
>> specific subtest by default until somebody can track down the
>> underlying cause. Enthusiasts can opt back in by setting
>> QEMU_TEST_FLAKY_TESTS=1 in their environment.
>>
>> We might need to disable more parts of this test if this isn't
>> sufficient to fix the flakiness.
>>
>> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>> ---
>> This is a slightly more targeted variation on my original
>> modest proposal.
>> ---
>>   tests/qtest/migration-test.c | 10 ++++++++--
>>   1 file changed, 8 insertions(+), 2 deletions(-)
>>
>> diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
>> index 109bc8e7b13..d4ab3934ed2 100644
>> --- a/tests/qtest/migration-test.c
>> +++ b/tests/qtest/migration-test.c
>> @@ -2572,8 +2572,14 @@ int main(int argc, char **argv)
>>       qtest_add_func("/migration/auto_converge", test_migrate_auto_converge);
>>       qtest_add_func("/migration/multifd/tcp/plain/none",
>>                      test_multifd_tcp_none);
>> -    qtest_add_func("/migration/multifd/tcp/plain/cancel",
>> -                   test_multifd_tcp_cancel);
>> +    /*
>> +     * This test is flaky and sometimes fails in CI and otherwise:
>> +     * don't run unless user opts in via environment variable.
>> +     */
>> +    if (getenv("QEMU_TEST_FLAKY_TESTS")) {
>> +        qtest_add_func("/migration/multifd/tcp/plain/cancel",
>> +                       test_multifd_tcp_cancel);
>> +    }
> 
> OK, that seems reasonably selective.
> 
> Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> 
> 
> (Cancel tests are always a pain; they can be racy with the test
> completing before you fire the cancel; or 'cancel' itself
> can hit lots of races inside the migration code if it's not written
> carefully enough to expect a cancel).

Set 'QEMU_TEST_FLAKY_TESTS' in your gitlab namespace:
https://docs.gitlab.com/ee/ci/variables/#for-a-project

(Also, set it in your local env or in the script you run
to automate your testing).

