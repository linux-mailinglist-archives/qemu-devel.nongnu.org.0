Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A7F82F9BE7
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jan 2021 10:31:38 +0100 (CET)
Received: from localhost ([::1]:52274 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1Qsr-00082Y-Ip
	for lists+qemu-devel@lfdr.de; Mon, 18 Jan 2021 04:31:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48408)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1l1Qra-0007ak-0a
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 04:30:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:55293)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1l1QrY-0000zx-5L
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 04:30:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610962215;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2GlbhgRVa86oCVKCiayj5XB5c7EiiQaO0TvRHn3xsBw=;
 b=jPpjZ5nedteyaM7BEEgujMVRoMaIMoyazOVGCM8K8In5RtL6Hx4mCEQAvJzojl06HKMRRE
 QwO+F3lMGpQhQ23BsFwUa19Qh1JwWn+KI0hE/DR9oGUrlxBX1l1dJConvqqP/RPaHFYYtn
 4xEOhPtSnJJyAUnI1tnG7uzbLP6yaUk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-502-9NbU-6J5NTS3nBSBoXHJUQ-1; Mon, 18 Jan 2021 04:30:13 -0500
X-MC-Unique: 9NbU-6J5NTS3nBSBoXHJUQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DC0C2AFA81;
 Mon, 18 Jan 2021 09:30:12 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-189.ams2.redhat.com [10.36.112.189])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F21C327C26;
 Mon, 18 Jan 2021 09:30:04 +0000 (UTC)
Subject: Re: pending fuzzing patches (was Re: [PATCH 2/2] fuzz: log the
 arguments used to initialize QEMU)
To: Paolo Bonzini <pbonzini@redhat.com>, Alexander Bulekov <alxndr@bu.edu>,
 qemu-devel@nongnu.org
References: <20210117201014.271610-1-alxndr@bu.edu>
 <20210117201014.271610-3-alxndr@bu.edu>
 <4e63a37a-d9f1-7841-3761-6f8cd7ac9051@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <84615bb8-564e-5d5f-b134-83fa223cf583@redhat.com>
Date: Mon, 18 Jan 2021 10:30:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <4e63a37a-d9f1-7841-3761-6f8cd7ac9051@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.189,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.252, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Bandan Das <bsd@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 18/01/2021 09.43, Paolo Bonzini wrote:
> On 17/01/21 21:10, Alexander Bulekov wrote:
>> This is useful for building reproducers. Instead checking the code or
>> the QEMU_FUZZ_ARGS, the arguments are at the top of the crash log.
>>
>> Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
>> ---
>>   tests/qtest/fuzz/fuzz.c | 11 ++++++++++-
>>   1 file changed, 10 insertions(+), 1 deletion(-)
>>
>> diff --git a/tests/qtest/fuzz/fuzz.c b/tests/qtest/fuzz/fuzz.c
>> index 238866a037..496d11a231 100644
>> --- a/tests/qtest/fuzz/fuzz.c
>> +++ b/tests/qtest/fuzz/fuzz.c
>> @@ -159,6 +159,8 @@ int LLVMFuzzerInitialize(int *argc, char ***argv, char 
>> ***envp)
>>       char *target_name;
>>       const char *bindir;
>>       char *datadir;
>> +    GString *cmd_line;
>> +    gchar *pretty_cmd_line;
>>       bool serialize = false;
>>       /* Initialize qgraph and modules */
>> @@ -217,7 +219,7 @@ int LLVMFuzzerInitialize(int *argc, char ***argv, char 
>> ***envp)
>>       }
>>       /* Run QEMU's softmmu main with the fuzz-target dependent arguments */
>> -    GString *cmd_line = fuzz_target->get_init_cmdline(fuzz_target);
>> +    cmd_line = fuzz_target->get_init_cmdline(fuzz_target);
>>       g_string_append_printf(cmd_line, " %s -qtest /dev/null ",
>>                              getenv("QTEST_LOG") ? "" : "-qtest-log none");
>> @@ -226,6 +228,13 @@ int LLVMFuzzerInitialize(int *argc, char ***argv, 
>> char ***envp)
>>       wordexp(cmd_line->str, &result, 0);
>>       g_string_free(cmd_line, true);
>> +    if (getenv("QTEST_LOG")) {
>> +        pretty_cmd_line  = g_strjoinv(" ", result.we_wordv + 1);
>> +        printf("Starting %s with Arguments: %s\n",
>> +                result.we_wordv[0], pretty_cmd_line);
>> +        g_free(pretty_cmd_line);
>> +    }
>> +
>>       qemu_init(result.we_wordc, result.we_wordv, NULL);
>>       /* re-enable the rcu atfork, which was previously disabled in 
>> qemu_init */
>>
> 
> Hi Alexander, can you send _me_ a pull request for all the pending fuzzing 
> patches?  I haven't paid much attention, but I have seen external 
> contributions and I have the feeling that they aren't being applied/reviewed 
> promptly.

I'm normally taking the fuzzing patches through the qtest tree (and also 
merged some contributions last week, see 22ec0c696fd28e and the following 
commits) ... which patch series that got missed did you have in mind?

Anyway, the amount of fuzzer patches seems to have increased during the last 
weeks, and I'm not very familiar with the fuzzing stuff and also sometimes I 
do not get CC:-ed on fuzzing patches, so it might make sense indeed that 
Alexander now gathers the fuzzing patches and starts sending pull requests 
for these. Alexander, do you want to have a try now?

  Thomas


