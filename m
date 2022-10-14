Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 03B3A5FEC28
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Oct 2022 11:53:14 +0200 (CEST)
Received: from localhost ([::1]:38012 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ojHNQ-0007z9-R2
	for lists+qemu-devel@lfdr.de; Fri, 14 Oct 2022 05:53:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43986)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den-plotnikov@yandex-team.ru>)
 id 1ojHIC-0004FS-Rf
 for qemu-devel@nongnu.org; Fri, 14 Oct 2022 05:47:49 -0400
Received: from forwardcorp1b.mail.yandex.net ([178.154.239.136]:48480)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den-plotnikov@yandex-team.ru>)
 id 1ojHI9-0001L4-GB
 for qemu-devel@nongnu.org; Fri, 14 Oct 2022 05:47:48 -0400
Received: from myt6-81d8ab6a9f9d.qloud-c.yandex.net
 (myt6-81d8ab6a9f9d.qloud-c.yandex.net
 [IPv6:2a02:6b8:c12:520a:0:640:81d8:ab6a])
 by forwardcorp1b.mail.yandex.net (Yandex) with ESMTP id 29B9061472;
 Fri, 14 Oct 2022 12:47:36 +0300 (MSK)
Received: from [IPV6:2a02:6b8:b081:6::1:3c] (unknown [2a02:6b8:b081:6::1:3c])
 by myt6-81d8ab6a9f9d.qloud-c.yandex.net (smtpcorp/Yandex) with
 ESMTPSA id qNqYlnGqr1-lYO84lud; Fri, 14 Oct 2022 12:47:35 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
Precedence: bulk
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1665740855; bh=0Lx7+hSupJCIFN0EY3JqYfKKZBBF8ZX3yOWGIl2SJPw=;
 h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
 b=E1RF0kg4wzFYiUBAoaWhg7f1gz8yElPU2DNih2Y+4kAx/+uxqKXZFLX5/HFeyDs1+
 YzVevheRuGqC4Z4V7Lnjv8ayB6I8G+zWiBjcCOB4wT4oi0nZitzMXBQgl02UDxY1eb
 t+Czp0JKk4otseYJnAeXw7QLaMIvewOLZNpYFstM=
Authentication-Results: myt6-81d8ab6a9f9d.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Message-ID: <029ae995-cf44-1310-45fd-e9951efce35a@yandex-team.ru>
Date: Fri, 14 Oct 2022 12:47:33 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v3] qapi/qmp: Add timestamps to qmp command responses
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, yc-core@yandex-team.ru, michael.roth@amd.com,
 vsementsov@yandex-team.ru, berrange@redhat.com, marcandre.lureau@gmail.com
References: <20221011153408.495401-1-den-plotnikov@yandex-team.ru>
 <87tu47vkdx.fsf@pond.sub.org>
From: Denis Plotnikov <den-plotnikov@yandex-team.ru>
In-Reply-To: <87tu47vkdx.fsf@pond.sub.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=178.154.239.136;
 envelope-from=den-plotnikov@yandex-team.ru; helo=forwardcorp1b.mail.yandex.net
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.25,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 13.10.2022 18:00, Markus Armbruster wrote:
> Denis Plotnikov <den-plotnikov@yandex-team.ru> writes:
>
>> Add "start" & "end" time values to qmp command responses.
> Please spell it QMP.  More of the same below.
ok
> Can you tell me about a problem you cracked (or could have cracked) with
> the help of this?

We have a management layer which interacts with qemu via qmp. When it 
issues a qmp command we measure execution time which takes to perform a 
certain qmp command. Some of that commands seems to execute longer that 
expected. In that case there is a question what part of command 
execution takes the majority of time. Is it the flaw in the management 
layer or in qemu qmp command scheduling or the qmp command execution 
itself? The timestaps being added help to exclude the qmp command 
execution time from the question. Also timestamps helps to get know the 
exact time when the command is started and ended and put that 
information to a system logs properly according to timestamps.

>>       "return": {"status": "running", "singlestep": false, "running": true}}
>>
>> The responce of the qmp command contains the start & end time of
> response
ok
>
>> the qmp command processing.
>>
>> Suggested-by: Andrey Ryabinin <arbn@yandex-team.ru>
>> Signed-off-by: Denis Plotnikov <den-plotnikov@yandex-team.ru>
>> Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
> Please spell out that this affects both QMP and qemu-ga.
ok
>>     command does not return data
>>   - The "id" member contains the transaction identification associated
>>     with the command execution if issued by the Client
>> +- The "start" member contains the exact time of when the server
>> +  started executing the command. This excludes any time the
>> +  command request spent queued, after reading it off the wire.
>> +  It is a fixed json-object with time in seconds and microseconds
>> +  relative to the Unix Epoch (1 Jan 1970)
> What's a "fixed json-object"?
>
> Hmm, I guess you're copying from the description of event member
> "timestamp".
That's right
> Let's go with "a json-object with the number of seconds and microseconds
> since the Unix epoch" everywhere.
ok
>
> Make this int64_t, because that's what g_get_real_time() returns.
>
> Same for add_timestamps() parameters.
ok, will fix the type everywhere
>
> +    qobject_unref(resp);
> I'd be tempted to fold this into existing tests.

Do you want me to put timestamp checking to an existing testcase?


Thanks,

Denis

>
>> +
>>       qtest_quit(qts);
>>   }
>>   
>> diff --git a/tests/unit/test-qga.c b/tests/unit/test-qga.c
>> index b4e0a145737d1..18ec9bac3650e 100644
>> --- a/tests/unit/test-qga.c
>> +++ b/tests/unit/test-qga.c
>> @@ -217,6 +217,36 @@ static void test_qga_ping(gconstpointer fix)
>>       qmp_assert_no_error(ret);
>>   }
>>   
>> +static void test_qga_timestamps(gconstpointer fix)
>> +{
>> +    QDict *start, *end;
>> +    uint64_t start_s, start_us, end_s, end_us, start_ts, end_ts;
>> +    const TestFixture *fixture = fix;
>> +    g_autoptr(QDict) ret = NULL;
>> +
>> +    ret = qmp_fd(fixture->fd, "{'execute': 'guest-ping'}");
>> +    g_assert_nonnull(ret);
>> +    qmp_assert_no_error(ret);
>> +
>> +    start = qdict_get_qdict(ret, "start");
>> +    g_assert(start);
>> +    end = qdict_get_qdict(ret, "end");
>> +    g_assert(end);
>> +
>> +    start_s = qdict_get_try_int(start, "seconds", 0);
>> +    g_assert(start_s);
>> +    start_us = qdict_get_try_int(start, "microseconds", 0);
>> +
>> +    end_s = qdict_get_try_int(end, "seconds", 0);
>> +    g_assert(end_s);
>> +    end_us = qdict_get_try_int(end, "microseconds", 0);
>> +
>> +    start_ts = (start_s * G_USEC_PER_SEC) + start_us;
>> +    end_ts = (end_s * G_USEC_PER_SEC) + end_us;
>> +
>> +    g_assert(end_ts > start_ts);
>> +}
>> +
>>   static void test_qga_id(gconstpointer fix)
>>   {
>>       const TestFixture *fixture = fix;
>> @@ -948,6 +978,7 @@ int main(int argc, char **argv)
>>       g_test_add_data_func("/qga/sync-delimited", &fix, test_qga_sync_delimited);
>>       g_test_add_data_func("/qga/sync", &fix, test_qga_sync);
>>       g_test_add_data_func("/qga/ping", &fix, test_qga_ping);
>> +    g_test_add_data_func("/qga/timestamps", &fix, test_qga_timestamps);
>>       g_test_add_data_func("/qga/info", &fix, test_qga_info);
>>       g_test_add_data_func("/qga/network-get-interfaces", &fix,
>>                            test_qga_network_get_interfaces);
>> diff --git a/tests/unit/test-qmp-cmds.c b/tests/unit/test-qmp-cmds.c
>> index 6085c099950b5..54d63bb8e346f 100644
>> --- a/tests/unit/test-qmp-cmds.c
>> +++ b/tests/unit/test-qmp-cmds.c
>> @@ -154,7 +154,7 @@ static QObject *do_qmp_dispatch(bool allow_oob, const char *template, ...)
>>       g_assert(resp);
>>       ret = qdict_get(resp, "return");
>>       g_assert(ret);
>> -    g_assert(qdict_size(resp) == 1);
>> +    g_assert(qdict_size(resp) == 3);
>>   
>>       qobject_ref(ret);
>>       qobject_unref(resp);
>> @@ -181,7 +181,7 @@ static void do_qmp_dispatch_error(bool allow_oob, ErrorClass cls,
>>                       ==, QapiErrorClass_str(cls));
>>       g_assert(qdict_get_try_str(error, "desc"));
>>       g_assert(qdict_size(error) == 2);
>> -    g_assert(qdict_size(resp) == 1);
>> +    g_assert(qdict_size(resp) == 3);
>>   
>>       qobject_unref(resp);
>>       qobject_unref(req);

