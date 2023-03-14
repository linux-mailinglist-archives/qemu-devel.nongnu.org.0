Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 228476B9791
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Mar 2023 15:19:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pc5Kp-0008MW-Cr; Tue, 14 Mar 2023 10:09:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pc5Kn-0008MK-H5
 for qemu-devel@nongnu.org; Tue, 14 Mar 2023 10:09:01 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pc5Kl-0008VV-AI
 for qemu-devel@nongnu.org; Tue, 14 Mar 2023 10:09:01 -0400
Received: by mail-pj1-x102f.google.com with SMTP id
 gp15-20020a17090adf0f00b0023d1bbd9f9eso5061685pjb.0
 for <qemu-devel@nongnu.org>; Tue, 14 Mar 2023 07:08:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678802938;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=SMqThMyeLsPLcO0rl5uCMrLLZIZn4zv0RXpRmvUuLsg=;
 b=IyXN8t1I3aQd8amfeVcDvA4lUQv4uRfAwiKNkAeM9T9oDaL/Rh2f/sEO7+E66HWiih
 vhoQxOYRfh5NgTZoV79lUQbgoykhy2z7AFDEkvfS+axQbURO9VWQxVgpt/GFdV1EUCNG
 ZP/AxBNgof/i/hfZW9PfJzLPoulhmw4t87CrYyGgzZLbK7ogHcrSfvXgjDNCPrSAbnfc
 8NoXplgFmz8VxRPBw7WunDWciGJSUeN4N1kG/Gt39TjeYyPlPzzi4lQkyZIBLYniC6V4
 p2GAZFrFPuEAQkrMCjWDl1mq1DkxOIBxyRWYeMBdAEcHkG8Ya3gtie5vUkPf3E0jJR5i
 E6Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678802938;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=SMqThMyeLsPLcO0rl5uCMrLLZIZn4zv0RXpRmvUuLsg=;
 b=WDU0M+WoOGdswoyF7FMEF8IX2vQSUBOgR5zzxzFFcxFseq/+vedUa5gUjaWrza2Arb
 +76BuPILE3c2DTolnZpSIlKhi+vUav3jSs++e63qID/aExLsu+W1AZfzW9JdY19n4GrB
 o2cH3ZG5EX6IEl8WiZ76fkfvQMGZm16tSDrRaOLqR/biA5fphM3aCOkJHbjmhOR/pPFw
 yty0q5gk7ZCzDsgIhDdJAxSlyghGaIVGmAhsCeqZhRf4nB3B0BeSdAti4u/by8GujxDT
 5EL/zbMNrw0YFL8wtPUemIsTN+5+Z9YjPXTWKzkxm5EQQv3+jizrpf+gddACQmKsGeqH
 NSkQ==
X-Gm-Message-State: AO0yUKXXObLaPZihuUxLXe+5oMagI6jP8wYGjFKlqPWa+ajh+lUZZbEs
 vWm2iZH4B6Ma9gHV7ZM8JF9uEJRzfS+mLBWDWuaUyw==
X-Google-Smtp-Source: AK7set8O7mHmEMP+Ie06D8x59IGqp22uGtHR/SRiyoR/QuxlTVtFa3Mo6/XKPujZiABobM/pN6a1y980jkT10MpX2Q8=
X-Received: by 2002:a17:903:27ce:b0:19a:5953:e85c with SMTP id
 km14-20020a17090327ce00b0019a5953e85cmr5876904plb.1.1678802937764; Tue, 14
 Mar 2023 07:08:57 -0700 (PDT)
MIME-Version: 1.0
References: <20230314133310.1177954-1-peter.maydell@linaro.org>
 <a21f9c5f-d67f-8d88-d825-07d4175c56ef@redhat.com>
In-Reply-To: <a21f9c5f-d67f-8d88-d825-07d4175c56ef@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 14 Mar 2023 14:08:46 +0000
Message-ID: <CAFEAcA92x061k1T0xRoHCT+9qb-0BT_Z75mPUFvSvdj5UDFqgg@mail.gmail.com>
Subject: Re: [PATCH] tests/qtest/migration-test: Disable postcopy/preempt tests
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>, 
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 peterx@redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x102f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

On Tue, 14 Mar 2023 at 14:01, Thomas Huth <thuth@redhat.com> wrote:
>
> On 14/03/2023 14.33, Peter Maydell wrote:
> > The postcopy/preempt tests seem to have a race which makes them hang
> > on the s390x CI runner.  Disable them for the moment, while we
> > investigate.  As with the other disabled subtest, you can opt back in
> > by setting QEMU_TEST_FLAKY_TESTS=1 in your environment.
> >
> > Suggested-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> > Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> > ---
> >   tests/qtest/migration-test.c | 23 ++++++++++++++++-------
> >   1 file changed, 16 insertions(+), 7 deletions(-)
> >
> > diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
> > index d4ab3934ed2..4643f7f49dc 100644
> > --- a/tests/qtest/migration-test.c
> > +++ b/tests/qtest/migration-test.c
> > @@ -2464,6 +2464,11 @@ int main(int argc, char **argv)
> >       const char *arch = qtest_get_arch();
> >       g_autoptr(GError) err = NULL;
> >       int ret;
> > +    /*
> > +     * Race condition suspected in the postcopy/preempt tests: see
> > +     * https://lore.kernel.org/qemu-devel/CAFEAcA-q1UwPePdHTzXNSX4i6Urh3j6h51kymy6=7SzDAFU87w@mail.gmail.com/
> > +     */
> > +    bool skip_postcopy_preempt = getenv("QEMU_TEST_FLAKY_TESTS");
>
> Shouldn't that be "!getenv(...)" ?

Doh!

thanks
-- PMM

