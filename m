Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B74074E194F
	for <lists+qemu-devel@lfdr.de>; Sun, 20 Mar 2022 02:17:06 +0100 (CET)
Received: from localhost ([::1]:36164 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nVkBt-0001bT-AX
	for lists+qemu-devel@lfdr.de; Sat, 19 Mar 2022 21:17:05 -0400
Received: from eggs.gnu.org ([209.51.188.92]:46522)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dmiller423@gmail.com>)
 id 1nVk9k-0000oq-7s; Sat, 19 Mar 2022 21:14:52 -0400
Received: from [2607:f8b0:4864:20::22e] (port=36528
 helo=mail-oi1-x22e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dmiller423@gmail.com>)
 id 1nVk9f-0007MR-ND; Sat, 19 Mar 2022 21:14:49 -0400
Received: by mail-oi1-x22e.google.com with SMTP id z8so12828614oix.3;
 Sat, 19 Mar 2022 18:14:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=POEXv5dCsKFj0yf3SN9ClQ9ToB0mcWyX/UBB1k/SHEI=;
 b=fabyvt4RDnNRN7rJ0m20o68C70A4DTT2RY4tPQRL9aljE5+fsAEu15SiI89pi0nIb1
 7o/sM4P40Tcqv5xHFi+/fJEMnJMQFnLP94fk71iQgLuYFkF38SMaF3sS+XzwMwoS47vL
 /Rnt/uUWZbqVvJTrFNG16ONGfcFfYdwDQGrndY6XBDN9tbt7pNXVonFWk1CVVf19MnID
 v2sTr91hHketLIocDzs9WkZGHsCTnwQslkPLn8xQTte75iSjwJSlzv9LKRyirYMU3s4b
 ZcTUxaThcMxG0kGwmnc/kNaKG++VXvyD03cYga5G0TJhTyvmb3+ycZ1ptsAcMYYMKb+Z
 b0iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=POEXv5dCsKFj0yf3SN9ClQ9ToB0mcWyX/UBB1k/SHEI=;
 b=3VnYCQ7XlZJk5dWZjlZ8dVFf9ji78G3m26iwcBx4kNYSdnRUfz8GgLlSWVR9sU8EzC
 lws1Vg6K5w4MQhr6UVqQ5iTzstmqCfzFRt8SayXKtS2m4cvHMTNkyv5yYPpzAAXmEJhA
 HSiB8AXnsYXgdQGUyMg/LgtbVaGmhNbujIP0LE06k6IVOkEuToZLihMJYFx2TPkqIMW2
 C0U+mJT9MXvIKbBsMXQ+E17zFG2/oVbDci8qqMrnMfmK1QxBCFdNw/T2ax5A0+1aHz9N
 m+W39nvEfqmnZRhHhBJH35coLJADt4T2sTzhdPMmmO1cHwIy3qv7erZ5dGjYwo/ImEPx
 KOiQ==
X-Gm-Message-State: AOAM533N/ji8iLUfQEyscQY5Goh6jNmApmW1k4lKj8/wSkfpilPTjMZA
 nschdI7kTzb/EwOqwhUQz/TGEtLphgY7GrpVIMc=
X-Google-Smtp-Source: ABdhPJwO1/+X0phAERvfwbEnv4QjDbvU4w9dbr4Z7Xyctw6LxMnUys3QzN16dAVFZsCFkDcUXE0aSjGCqPGM2FCKu/s=
X-Received: by 2002:a05:6808:2327:b0:2ec:a7fe:fb0c with SMTP id
 bn39-20020a056808232700b002eca7fefb0cmr7207206oib.16.1647738884823; Sat, 19
 Mar 2022 18:14:44 -0700 (PDT)
MIME-Version: 1.0
References: <20220308015358.188499-1-richard.henderson@linaro.org>
 <CAEgyohXWk7uFrZmOwZKSYtrHs8_NnAWhvr9DgqnYP0JmLEPP_Q@mail.gmail.com>
In-Reply-To: <CAEgyohXWk7uFrZmOwZKSYtrHs8_NnAWhvr9DgqnYP0JmLEPP_Q@mail.gmail.com>
From: David Miller <dmiller423@gmail.com>
Date: Sat, 19 Mar 2022 21:14:32 -0400
Message-ID: <CAEgyohX__f2CmMTpJQ=y7T2GT3B9Pa7k9VggxsPaMdTNdkDK=w@mail.gmail.com>
Subject: Re: [PATCH v3 00/11] s390x/tcg: Implement Vector-Enhancements
 Facility 2
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::22e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::22e;
 envelope-from=dmiller423@gmail.com; helo=mail-oi1-x22e.google.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.659,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: qemu-s390x@nongnu.org, Christian Borntraeger <borntraeger@linux.ibm.com>,
 qemu-devel@nongnu.org, David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Is this waiting on me for anything?
I wanted to ensure this is wrapped up before starting a new project.

Thanks,
-  David Miller

On Mon, Mar 7, 2022 at 11:09 PM David Miller <dmiller423@gmail.com> wrote:
>
>
> I've reviewed all changes,  looks good.
> Ran all of my own tests including vstrs, all passed.
>
> Thank you for all reviews and changes here.
>
> - David Miller
>
> On Mon, Mar 7, 2022 at 8:54 PM Richard Henderson <richard.henderson@linaro.org> wrote:
>>
>> Hi David,
>>
>> I've split up the patches a bit, made some improvements to
>> the shifts and reversals, and fixed a few bugs.
>>
>> Please especially review vector string search, as that is
>> has had major changes.
>>
>>
>> r~
>>
>>
>> David Miller (9):
>>   target/s390x: vxeh2: vector convert short/32b
>>   target/s390x: vxeh2: vector string search
>>   target/s390x: vxeh2: Update for changes to vector shifts
>>   target/s390x: vxeh2: vector shift double by bit
>>   target/s390x: vxeh2: vector {load, store} elements reversed
>>   target/s390x: vxeh2: vector {load, store} byte reversed elements
>>   target/s390x: vxeh2: vector {load, store} byte reversed element
>>   target/s390x: add S390_FEAT_VECTOR_ENH2 to cpu max
>>   tests/tcg/s390x: Tests for Vector Enhancements Facility 2
>>
>> Richard Henderson (2):
>>   tcg: Implement tcg_gen_{h,w}swap_{i32,i64}
>>   target/s390x: Fix writeback to v1 in helper_vstl
>>
>>  include/tcg/tcg-op.h                 |   6 +
>>  target/s390x/helper.h                |  13 +
>>  target/s390x/gen-features.c          |   2 +
>>  target/s390x/tcg/translate.c         |   3 +-
>>  target/s390x/tcg/vec_fpu_helper.c    |  31 ++
>>  target/s390x/tcg/vec_helper.c        |   2 -
>>  target/s390x/tcg/vec_int_helper.c    |  58 ++++
>>  target/s390x/tcg/vec_string_helper.c | 101 ++++++
>>  tcg/tcg-op.c                         |  30 ++
>>  tests/tcg/s390x/vxeh2_vcvt.c         |  97 ++++++
>>  tests/tcg/s390x/vxeh2_vlstr.c        | 146 +++++++++
>>  tests/tcg/s390x/vxeh2_vs.c           |  91 ++++++
>>  target/s390x/tcg/translate_vx.c.inc  | 442 ++++++++++++++++++++++++---
>>  target/s390x/tcg/insn-data.def       |  40 ++-
>>  tests/tcg/s390x/Makefile.target      |   8 +
>>  15 files changed, 1018 insertions(+), 52 deletions(-)
>>  create mode 100644 tests/tcg/s390x/vxeh2_vcvt.c
>>  create mode 100644 tests/tcg/s390x/vxeh2_vlstr.c
>>  create mode 100644 tests/tcg/s390x/vxeh2_vs.c
>>
>> --
>> 2.25.1
>>

