Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 644415EC738
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 17:06:42 +0200 (CEST)
Received: from localhost ([::1]:58368 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odCAT-0000vf-GM
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 11:06:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50296)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1odAX8-0005K1-Sn
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 09:22:03 -0400
Received: from mail-qv1-xf31.google.com ([2607:f8b0:4864:20::f31]:42889)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1odAX5-0005SR-Gt
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 09:21:58 -0400
Received: by mail-qv1-xf31.google.com with SMTP id u8so559806qvv.9
 for <qemu-devel@nongnu.org>; Tue, 27 Sep 2022 06:21:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date;
 bh=fAElqi7GgAXJHrQNaEnFFUZWVVL/vlVPcLKTXrC2hEQ=;
 b=cPLG2GpfnZKhcMZr/L8eapBA9eKsiDTkUaGLJuWWA137q524PvLfNpHGfT1L8+k7sZ
 MVOrftzPEj0lCyvtRAmtvp4QWCO1knwpoR6QcmFSwAUDPvSPMXseyawT+OgT+xm2c/uh
 xRzc29MyevrKB4DvbmwzJoQtStKAevsmLhrPc33kvkFcBM93+YEYuyVdTTaQu+xDRr7L
 r9Y12gKYEpgBzByTjDo56VQ9UYGZnvqwyKBqAxhjCvU90/U2EWT9M62YBtLjVAIS2Buj
 +IqIczVvNdknSDZ+eFw9PkXjNvtQ69SvLWGG3E0hZMWyU82F68sL/ZMM41ZKJ34F+upl
 VDHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date;
 bh=fAElqi7GgAXJHrQNaEnFFUZWVVL/vlVPcLKTXrC2hEQ=;
 b=j49EHwzzLltxv0keDoSJlxh9vkC17YvUUUKpbanvA6aVgLIXusYnRXWUaw6KI1bOSM
 foS086bq13oYenwvL72hg4iOc7UDZSDekoC3Yre0JoR14KdQlKysOrTVqWw8AWgvQknu
 4vNEN6hNwoj2CV57cAfnI8B0pNkVQ0hQhD+U1M1eWZ+/43Nah01+thoRP+NJJfFRKts9
 9AihpASQwGUwh6v4HCoLeuYZ+5Ybu7p+gosHZBqiYcDg5gQ/Knkn3eAfr/1hdUx9pDei
 Ril/9VJPcwGJjvnJcS97XA6kSyazGFxYt7L8zEeoEMmSy2cvy2Vm+S+Ztk6rFVZb4Exm
 QXYQ==
X-Gm-Message-State: ACrzQf34c2hgNwKZnAiUCBJ/yO4q0lhcwhkAfo6uVy3z/+Rjx4UsSx+j
 zUPMrnXbQIbvGmQ5SQoWL8pJgUY0ZAdYdeZPe6Y=
X-Google-Smtp-Source: AMsMyM5ngWrHNhNol+L6uhXAUsV5VsrvFwQg03TSQ7SQ4XLArBk4s5ev4Q4GSStCKajUxkS1lSkn9tTleFz0O4axwf8=
X-Received: by 2002:ad4:5763:0:b0:4ad:6f51:2aff with SMTP id
 r3-20020ad45763000000b004ad6f512affmr21451177qvx.122.1664284903451; Tue, 27
 Sep 2022 06:21:43 -0700 (PDT)
MIME-Version: 1.0
References: <20220927110632.1973965-1-bmeng.cn@gmail.com>
 <20220927110632.1973965-44-bmeng.cn@gmail.com>
 <CAJ+F1C+BsM16peLANydiBtRamWada6S8Hg5hLYD=Z274AbN_3A@mail.gmail.com>
In-Reply-To: <CAJ+F1C+BsM16peLANydiBtRamWada6S8Hg5hLYD=Z274AbN_3A@mail.gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Tue, 27 Sep 2022 21:21:33 +0800
Message-ID: <CAEUhbmWHn_XYh1+xmvxUuK7DAuJf7=kq1zEhsxmLLs9Pb_B+YA@mail.gmail.com>
Subject: Re: [PATCH v4 43/54] tests/qtest: migration-test: Make sure QEMU
 process "to" exited after migration is canceled
To: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Cc: qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>, 
 Xuzhou Cheng <xuzhou.cheng@windriver.com>, Bin Meng <bin.meng@windriver.com>, 
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>, 
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::f31;
 envelope-from=bmeng.cn@gmail.com; helo=mail-qv1-xf31.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Sep 27, 2022 at 9:15 PM Marc-Andr=C3=A9 Lureau
<marcandre.lureau@gmail.com> wrote:
>
> Hi
>
> On Tue, Sep 27, 2022 at 5:02 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>>
>> From: Xuzhou Cheng <xuzhou.cheng@windriver.com>
>>
>> Make sure QEMU process "to" exited before launching another target
>> for migration in the test_multifd_tcp_cancel case.
>>
>> Signed-off-by: Xuzhou Cheng <xuzhou.cheng@windriver.com>
>> Signed-off-by: Bin Meng <bin.meng@windriver.com>
>> ---
>>
>> (no changes since v3)
>>
>> Changes in v3:
>> - Add a usleep(1) in the busy wait loop
>>
>> Changes in v2:
>> - Change to a busy wait after migration is canceled
>>
>>  tests/qtest/migration-test.c | 4 ++++
>>  1 file changed, 4 insertions(+)
>>
>> diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
>> index 45c5f5761b..6f9fe13488 100644
>> --- a/tests/qtest/migration-test.c
>> +++ b/tests/qtest/migration-test.c
>> @@ -2132,6 +2132,10 @@ static void test_multifd_tcp_cancel(void)
>>      wait_for_migration_pass(from);
>>
>>      migrate_cancel(from);
>> +    /* Make sure QEMU process "to" exited */
>> +    while (qtest_probe_child(to)) {
>> +        usleep(1);
>
>
> Why not add a qtest_wait_qemu() ? (I think qtest_probe_child() should als=
o be renamed)
>

Do you mean adding:

void qtest_wait_qemu(QTestState *s)
{
    while (qtest_probe_child(s)) {
        usleep(1);
    }
}

Do you have a better name for qtest_probe_child()?

Regards,
Bin

