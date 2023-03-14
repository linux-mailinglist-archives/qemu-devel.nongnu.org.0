Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C7F106B97ED
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Mar 2023 15:28:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pc5TS-0002x7-PR; Tue, 14 Mar 2023 10:17:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pc5TM-0002uz-Jd
 for qemu-devel@nongnu.org; Tue, 14 Mar 2023 10:17:52 -0400
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pc5TK-0001cI-Nn
 for qemu-devel@nongnu.org; Tue, 14 Mar 2023 10:17:52 -0400
Received: by mail-pf1-x42c.google.com with SMTP id b20so9802987pfo.6
 for <qemu-devel@nongnu.org>; Tue, 14 Mar 2023 07:17:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678803469;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=tYMdPFzIRpV1p5bEvaT+ZkrQi0D+4IZMKwhr7i9/2ds=;
 b=VctXVEjAtrMXIneyXOzp3kbDYIYPeo054uXNINVtzVgJUhUVgNe43nXXgLuxu8lyj2
 WFp/MCuYWLi78R5Xq3LxTH6W2l0hemub4QgSsnmSqlgFeDXBOjBzMrhjhqiqtRQ/ZrtC
 PJErgM/kXA3kCX+HGsJz9Fu/L/DOk/LaeF1S7eqDZMzUAPBLhdqb5bUFrYmlEdkJqp9q
 rp6KRG3+tupy5uCt5bkpzWzyhwFvRMmkPuKOkS4h6r6hgTvCfTHmrDCpV++7e9PGkSXY
 orqmSorb20h7uRLQc1uKbytN11KaawIs0OVeF6TMAqEkGGdg2Fz0CxmnVuNk4w7FPqwL
 VHqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678803469;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tYMdPFzIRpV1p5bEvaT+ZkrQi0D+4IZMKwhr7i9/2ds=;
 b=STxGD33hszuLw9rVlAtT6TwrY2NuOezxI7OhrMp9vVZEaxHI730EUZJv1nipzZiaJE
 XyUZcsErKao5YVNuQi1iWqKbkzbqKNs3xLUyfB37nL5WVey6/9z7dytLEf+yo5j+ghxi
 cyv9q2us5TOmwH8ye803eaQvMQQG2zNlzbtJyeYOLgRNHYV+Vf4SUP0uAhF5JTXoSEmk
 /G3Y9S0ynjZ7UAlSmiyeiw0zH8tarecNgoKMaWaMPYQInYbQFdFJtnjt1OwZVAUobhCZ
 Yz1YEJTQ+DESb1UjsGNdFD3rcdkdIIOZMjbH/pPQt2Ut2sSo6KYST+N7rbRM4ly3Ptck
 epdQ==
X-Gm-Message-State: AO0yUKWVm5ptWal4R0VhMORTHveW4eg54vjtCrbXSb23hXFeHOw+SXH5
 F0Bb20Z2fvYMFoOYl6+UMDHuhzLQtpwsE6UX//GZcw==
X-Google-Smtp-Source: AK7set/IE1fNDJ+c93371YJ+Om7ZXmqTCchIUc0AwLPDNOT15gJQNowaMELVKJ8xPxmSCrK+N6kXYv24FjG01TQGz9s=
X-Received: by 2002:a65:66c5:0:b0:503:99d9:d9a3 with SMTP id
 c5-20020a6566c5000000b0050399d9d9a3mr13430975pgw.6.1678803469102; Tue, 14 Mar
 2023 07:17:49 -0700 (PDT)
MIME-Version: 1.0
References: <20230314133310.1177954-1-peter.maydell@linaro.org>
 <a21f9c5f-d67f-8d88-d825-07d4175c56ef@redhat.com>
 <CAFEAcA92x061k1T0xRoHCT+9qb-0BT_Z75mPUFvSvdj5UDFqgg@mail.gmail.com>
 <811c3baf-5fe5-a70a-bd6e-18ee91c10408@redhat.com>
In-Reply-To: <811c3baf-5fe5-a70a-bd6e-18ee91c10408@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 14 Mar 2023 14:17:37 +0000
Message-ID: <CAFEAcA904=NOW5236nmMWWf9-uHGdgkYHc6Z1MS7z-bRw-k04w@mail.gmail.com>
Subject: Re: [PATCH] tests/qtest/migration-test: Disable postcopy/preempt tests
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>, 
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 peterx@redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x42c.google.com
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

On Tue, 14 Mar 2023 at 14:14, Thomas Huth <thuth@redhat.com> wrote:
>
> On 14/03/2023 15.08, Peter Maydell wrote:
> > On Tue, 14 Mar 2023 at 14:01, Thomas Huth <thuth@redhat.com> wrote:
> >>
> >> On 14/03/2023 14.33, Peter Maydell wrote:
> >>> The postcopy/preempt tests seem to have a race which makes them hang
> >>> on the s390x CI runner.  Disable them for the moment, while we
> >>> investigate.  As with the other disabled subtest, you can opt back in
> >>> by setting QEMU_TEST_FLAKY_TESTS=1 in your environment.
> >>>
> >>> Suggested-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> >>> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> >>> ---
> >>>    tests/qtest/migration-test.c | 23 ++++++++++++++++-------
> >>>    1 file changed, 16 insertions(+), 7 deletions(-)
> >>>
> >>> diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
> >>> index d4ab3934ed2..4643f7f49dc 100644
> >>> --- a/tests/qtest/migration-test.c
> >>> +++ b/tests/qtest/migration-test.c
> >>> @@ -2464,6 +2464,11 @@ int main(int argc, char **argv)
> >>>        const char *arch = qtest_get_arch();
> >>>        g_autoptr(GError) err = NULL;
> >>>        int ret;
> >>> +    /*
> >>> +     * Race condition suspected in the postcopy/preempt tests: see
> >>> +     * https://lore.kernel.org/qemu-devel/CAFEAcA-q1UwPePdHTzXNSX4i6Urh3j6h51kymy6=7SzDAFU87w@mail.gmail.com/
> >>> +     */
> >>> +    bool skip_postcopy_preempt = getenv("QEMU_TEST_FLAKY_TESTS");
>
> You could maybe also call the variale skip_flaky_tests and use it in the
> other spot where you recently added a getenv() already.

That would make it a bit harder to do a simple revert of the
commits when we figure out the cause of the problem, though.

-- PMM

