Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C18C66C968
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Jan 2023 17:49:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHSfM-0006UH-98; Mon, 16 Jan 2023 11:49:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pHSfJ-0006Ts-In
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 11:48:57 -0500
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pHSfH-0005EM-Pj
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 11:48:57 -0500
Received: by mail-pg1-x529.google.com with SMTP id b12so20048153pgj.6
 for <qemu-devel@nongnu.org>; Mon, 16 Jan 2023 08:48:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SY117IVANNWoEBH4Z1BYoaVAgZGhVixeLZJvbQdsb6M=;
 b=Ulbwi7OXIc/gWOY7hodN1/pvyuXaLnEIH78jXXezjIL/71gAWNE1Lswmd85uidopHC
 qMBcNgCHcOskoG73ZCsjdJkVG/ayRm5TGT19dByEywF0ZaSQca7sUCvTozqUB2Mdk10e
 QB2DcufSfm0baYyaTQ9ZyETAxJvxhbl8BDn+Jd4NKJ3KCbX3MelNXltK9rH7CcGHdr/t
 5CsJsMoHZFzIUzDXDjv2QFNJwvUoszd5ajR5XQjRUZTtSd46JNS1VGf9fP7U3H2ojXza
 jKMFt4Fg+9rSXAp1fKt7MP3HbvDHmkHCR5mM8bqZXLfIfc/dHiMCYjw9JAdVjEHM2xAV
 IBBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SY117IVANNWoEBH4Z1BYoaVAgZGhVixeLZJvbQdsb6M=;
 b=2iMYsY9Kt5eL3m6Ug3Atgq1IyOkRRFZz9GVthyhJEMEfAWnky5Usa2npclFzk2F6cN
 redYCGa8YFRxgKTe+eCb0y8Hm/OVC9r32mcjFaIo5K/wpVBipaLoegkq+NF+pX79WZMI
 XfHUgWWZbwZ8aS6KKmgiTer1DeIEoStmE7Fe3HZ+UqLeMGP640prtnYd2njLZrrPya0i
 a19mr9pTPvI8z9r4uX0rKGZE6UFuiQe6UIX4vZYzznzDjObEn5n1Zt1uRLwMVOwDLYNw
 acnvJYmvzE2zFeQirkAh/xJMuJv83JrIBnpleXpgoigednALJFG2yV88sEzWbEFsJ/gN
 DQoA==
X-Gm-Message-State: AFqh2krsMJ4u6E4BKYqPjIz5urO0jNYgcqrxB5GhYXfZl2Q9lHyOr/se
 63r1cWYI6rfkUU6MoF6GmE0/5OAo4Jh1oZycjtXR0Q==
X-Google-Smtp-Source: AMrXdXtpF5njSKy+x85gaJ9OuxPeHeIUjOpKVLcEN1vXfLwgOJchHj9TfEc+KmzHUfx9bv3yC+OvI9vO4Z9hmgwew0U=
X-Received: by 2002:a65:694b:0:b0:477:86c1:640f with SMTP id
 w11-20020a65694b000000b0047786c1640fmr6711510pgq.231.1673887734210; Mon, 16
 Jan 2023 08:48:54 -0800 (PST)
MIME-Version: 1.0
References: <20221224151821.464455-1-richard.henderson@linaro.org>
 <20221224151821.464455-5-richard.henderson@linaro.org>
 <CAFEAcA_viCsMxSjcpFtxL+hj-n5TTff0npg1RjOnLUpwGu47DA@mail.gmail.com>
 <87pmbil5rn.fsf@linaro.org> <a2ebe5dd-29a2-4c94-f3da-9c7f5dc7979f@linaro.org>
 <CAFEAcA_sZ7QbkhOHYJt-DPxh-NS6XnBg8MNJh=oe8X6KmuAYjg@mail.gmail.com>
 <87bkmye8xx.fsf@linaro.org>
In-Reply-To: <87bkmye8xx.fsf@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 16 Jan 2023 16:48:43 +0000
Message-ID: <CAFEAcA-4rWe0tUJHtZz+SpZzccFApfZNmCzQS4BLcewSs9HUaQ@mail.gmail.com>
Subject: Re: [PATCH 4/4] tests/tcg/multiarch: add vma-pthread.c
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Richard Henderson <richard.henderson@linaro.org>, iii@linux.ibm.com,
 qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x529.google.com
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

On Mon, 16 Jan 2023 at 16:33, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
>
> Peter Maydell <peter.maydell@linaro.org> writes:
>
> > On Mon, 16 Jan 2023 at 12:40, Philippe Mathieu-Daud=C3=A9 <philmd@linar=
o.org> wrote:
> >>
> >> On 13/1/23 18:10, Alex Benn=C3=A9e wrote:
> > Yep. Could somebody write a patch to disable this test while
> > we figure out why it's flaky, please?
>
> I don't think the test is flaky - I think it is triggering a race in
> QEMU code. I have not however been able to replicate it in anything other
> than CI.

My definition of "flaky" here is "the CI fails randomly".
Unless you have a patch to fix the underlying bug ready to
go right now, please can we disable this so we don't keep
getting CI failures trying to test merges?

thanks
-- PMM

