Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 137C85AB6B3
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Sep 2022 18:37:41 +0200 (CEST)
Received: from localhost ([::1]:51654 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oU9fo-0006EZ-4S
	for lists+qemu-devel@lfdr.de; Fri, 02 Sep 2022 12:37:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48932)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oU9cP-00021O-Vy
 for qemu-devel@nongnu.org; Fri, 02 Sep 2022 12:34:10 -0400
Received: from mail-qv1-xf2c.google.com ([2607:f8b0:4864:20::f2c]:34799)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oU9cO-00044e-Dd
 for qemu-devel@nongnu.org; Fri, 02 Sep 2022 12:34:09 -0400
Received: by mail-qv1-xf2c.google.com with SMTP id kh8so1825232qvb.1
 for <qemu-devel@nongnu.org>; Fri, 02 Sep 2022 09:34:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date;
 bh=vkA3OWp8V12gjFj2vT2WtoMdBplP2vN9JtF40Fx2JKw=;
 b=lUVf5IgpEHS9WwvdOgo1T24jEcsGWmtPyTXG1QnWZt8XjqDvRaQPlUqyK10W5rGKeo
 xJgsCsxRHKlDTt2Uyaknjzq1xDqLSwFcaIhuewHIGe/tus4hJPaV4mWl/utOmFsqehu2
 DfTuqWT5I3Dx8N50gI9kxKKhieBFDTVBQbXUAL4GLywldE9DW0jahiw7R5hTEJevIkr+
 Smp14TNnk10ymyjVgQE8UkU+UunV4j7vXgC03xOojw+b9GBiA6sDbec7RVAsIB+glE+g
 40d7ex5P16tHrW+k+DPsMKLnx2d0ROqVP15312hHCwkzAvCMpYngRwq8U4Q5rmj/Dksf
 77XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date;
 bh=vkA3OWp8V12gjFj2vT2WtoMdBplP2vN9JtF40Fx2JKw=;
 b=Jv24Pj/IRJBcZT5N2DPXURrUpJiCr9eUpcQe8B4zImjTEn89fmmO4Yt36ZciDfCLdz
 qeozO/5g+sAg3MKMGUIdRY0+5mVk/wnWqFk8EPyeTHNVyUGrTM4Q2ZUwkouQQWET5Geb
 7b5mttUjqSQOVum/e6X2v8wPpE0YDcNz9BBWcQieHzASO2joQqOdtO+swzXF7uYoqOSB
 acM2sQOLXQi00KX2R88ZUPLmDhrOVbjkQCZZLcSMXAVsXassuu8BbRbuCghXDUiOl+r4
 +95IsFpCZAJ9TqRqz9eQNCoIM7T5Ch+Da5xvH6W6AktQVdAHZhiUkpuHqW7ssbd8Ibaz
 GO4g==
X-Gm-Message-State: ACgBeo16k/B45UM/n8iBQ3cOi7cPt3c8groML7DQ83ThIGr7mOWfkbvC
 JkHwh6jryusXfjL8YL38CZUgwBpLOZCSYzg48DjlZoCK
X-Google-Smtp-Source: AA6agR5YHqJzQ8j6+Uk52bRW5UFvjGMu4ezTxV86uz0Tu3P/SKk6GFfDiP3RAKY5sgx71Lp/SVgAeR70QKgD8UrOrxM=
X-Received: by 2002:a0c:810f:0:b0:47b:299a:56d7 with SMTP id
 15-20020a0c810f000000b0047b299a56d7mr29363224qvc.12.1662136447260; Fri, 02
 Sep 2022 09:34:07 -0700 (PDT)
MIME-Version: 1.0
References: <20220824094029.1634519-1-bmeng.cn@gmail.com>
 <20220824094029.1634519-42-bmeng.cn@gmail.com>
 <YwZ0X6cGmK/4N1yk@work-vm>
 <CAJ+F1CLJ3SFzHrp=f7amCCi6cSwp0+ANk7gdO4tgPzJh12uKxg@mail.gmail.com>
In-Reply-To: <CAJ+F1CLJ3SFzHrp=f7amCCi6cSwp0+ANk7gdO4tgPzJh12uKxg@mail.gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Sat, 3 Sep 2022 00:33:56 +0800
Message-ID: <CAEUhbmXjGCWqk-EOc3+gmUcX_Xy3ZFvf0QXoAH3Ty-hXAzQhxw@mail.gmail.com>
Subject: Re: [PATCH 41/51] tests/qtest: migration-test: Kill "to" after
 migration is canceled
To: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Xuzhou Cheng <xuzhou.cheng@windriver.com>, 
 Bin Meng <bin.meng@windriver.com>, Juan Quintela <quintela@redhat.com>, 
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2c;
 envelope-from=bmeng.cn@gmail.com; helo=mail-qv1-xf2c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Sep 1, 2022 at 7:35 PM Marc-Andr=C3=A9 Lureau
<marcandre.lureau@gmail.com> wrote:
>
> Hi
>
> On Wed, Aug 24, 2022 at 10:56 PM Dr. David Alan Gilbert <dgilbert@redhat.=
com> wrote:
>>
>> * Bin Meng (bmeng.cn@gmail.com) wrote:
>> > From: Xuzhou Cheng <xuzhou.cheng@windriver.com>
>> >
>> > Make sure QEMU process "to" is killed before launching another target
>> > for migration in the test_multifd_tcp_cancel case.
>> >
>> > Signed-off-by: Xuzhou Cheng <xuzhou.cheng@windriver.com>
>> > Signed-off-by: Bin Meng <bin.meng@windriver.com>
>> > ---
>> >
>> >  tests/qtest/migration-test.c | 4 ++++
>> >  1 file changed, 4 insertions(+)
>> >
>> > diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test=
.c
>> > index 125d48d855..18ec079abf 100644
>> > --- a/tests/qtest/migration-test.c
>> > +++ b/tests/qtest/migration-test.c
>> > @@ -2132,6 +2132,10 @@ static void test_multifd_tcp_cancel(void)
>> >      wait_for_migration_pass(from);
>> >
>> >      migrate_cancel(from);
>> > +    /* Make sure QEMU process "to" is killed */
>> > +    if (qtest_probe_child(to)) {
>> > +        qtest_kill_qemu(to);
>> > +    }
>>
>> I'm not sure that's safe - what happens if the qemu exits between the
>> probe and kill?
>

Umm, indeed there will be an issue if qemu exists between the probe and kil=
l.

I will change to a busy wait in v2.

>
> It looks safe to me, qtest_probe_child() resets the qemu_pid if it alread=
y exited. Otherwise, there is a process/handle waiting for waitpid/CloseHan=
dle done in qtest_kill_qemu().
>
> We are missing a CloseHandle() in qtest_probe_child() though, I'll send a=
 patch.
>
> so lgtm,
> Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

Regards,
Bin

