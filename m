Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA1345F2E43
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Oct 2022 11:40:15 +0200 (CEST)
Received: from localhost ([::1]:38914 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofHvn-0006ng-1B
	for lists+qemu-devel@lfdr.de; Mon, 03 Oct 2022 05:40:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ofHoq-0002Od-UT
 for qemu-devel@nongnu.org; Mon, 03 Oct 2022 05:33:01 -0400
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a]:39562)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ofHom-0001dk-0I
 for qemu-devel@nongnu.org; Mon, 03 Oct 2022 05:32:58 -0400
Received: by mail-ej1-x62a.google.com with SMTP id b2so20850946eja.6
 for <qemu-devel@nongnu.org>; Mon, 03 Oct 2022 02:32:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date;
 bh=CQoROMgheGkTL+kR6wN5hPqjCSlzO0nN+4WRLqliQko=;
 b=aWrTHOPiRxGScTtlBzjMHzGOU0I2Vwxcdwgnns1bXrHkzN2dElUmXPD5uiXiwvKxSy
 spJcdssF68JFZs7P7A3gH9c5jVoM2tXNrOL06PFTGn8PrNXYUqhJCy0vXZvhPpagh66Z
 SFJEW/5Rgda730HLS+C0Kh5wvmtopi7luH+LxTB0x3/vweZSRJXLNIsJBm436onbICZU
 /QvsJp780gk6FV+c494iEnRIrb6NA76F5+6z/R04EZpnJUGvPg9VKr022fVdBkEwT1rZ
 12CVoiaOP3WVWia+TzxBWEKaFWiZfkAFJhlQrzaCj7WSx+HtgCCdsgFakloKs2ZAlCeJ
 5KEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date;
 bh=CQoROMgheGkTL+kR6wN5hPqjCSlzO0nN+4WRLqliQko=;
 b=7xWmZWBqLYa2hPx92jCTilR/NznjqfTmMwLOBC3B9PehDgbnr0ayuv2GsRqRrP/x6S
 P4u4b6VECOEXwQTmDU8ytMUzrxinWv60bwSUMZ0kBrsltVNi6FhdzgDOYPjrPUTTJ/i1
 tba8/ijnut/6APQ6zGnHl7Flyx0ico2aKGBvJ90vAjZ43x0fDQLZdQEu8ySK0bLVTPi8
 raPwDJ/I/SoA8w/Zwm774jHeOALnU8+w091beRG/UjFsmuKmfIIgXD/GFxu8NdqzQ/Rb
 RlTZ9IL9OsZN9TIwWrGB5W/vWGjUNnMxbbTsXBcA2B0fILl0bDqLMcrvptXBuj1yWMq1
 8xHw==
X-Gm-Message-State: ACrzQf239yRkj2P7BfOevhu6wCs0czWXNBxkhdySfR+TLvxN9ewENfyG
 Wy6BttAjikSSkYMIw1gawZw90ii0N0UpDFlUuwUptg==
X-Google-Smtp-Source: AMsMyM5EE5JG1EfW3sroYlmCchb853jd7jkeSPBv4U034PIPuhnvXX4WXKzQfk/QlVh8nVN1W0vsniNCYrxaWZv0SlU=
X-Received: by 2002:a17:906:9c83:b0:779:c14c:55e4 with SMTP id
 fj3-20020a1709069c8300b00779c14c55e4mr13976345ejc.619.1664789574173; Mon, 03
 Oct 2022 02:32:54 -0700 (PDT)
MIME-Version: 1.0
References: <20220822132358.3524971-1-peter.maydell@linaro.org>
 <20220822132358.3524971-4-peter.maydell@linaro.org>
 <87sfk5nv5n.fsf@linaro.org>
In-Reply-To: <87sfk5nv5n.fsf@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 3 Oct 2022 10:32:43 +0100
Message-ID: <CAFEAcA8EpE49YADm14BeuX7jBKt6_K3qxVuZGtiwTnCXEXdiWA@mail.gmail.com>
Subject: Re: [PATCH v2 03/10] target/arm: Don't mishandle count when enabling
 or disabling PMU counters
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>, 
 qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Mon, 3 Oct 2022 at 09:55, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrot=
e:
>
>
> Peter Maydell <peter.maydell@linaro.org> writes:
>
> > The PMU cycle and event counter infrastructure design requires that
> > operations on the PMU register fields are wrapped in pmu_op_start()
> > and pmu_op_finish() calls (or their more specific pmmcntr and
> > pmevcntr equivalents).  This includes any changes to registers which
> > affect whether the counter should be enabled or disabled, but we
> > forgot to do this.
> >
> > The effect of this bug is that in sequences like:
> >  * disable the cycle counter (PMCCNTR) using the PMCNTEN register
> >  * write a value such as 0xfffff000 to the PMCCNTR
> >  * restart the counter by writing to PMCNTEN
> > the value written to the cycle counter is corrupted, and it starts
> > counting from the wrong place. (Essentially, we fail to record that
> > the QEMU_CLOCK_VIRTUAL timestamp when the counter should be considered
> > to have started counting is the point when PMCNTEN is written to enable
> > the counter.)
> >
> > Add the necessary bracketing calls, so that updates to the various
> > registers which affect whether the PMU is counting are handled
> > correctly.
> >
> > Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> > Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>
> I'm not sure why but this commit seems to be breaking a bunch of avocado
> tests for me, including the TCG plugin ones:
>
>   =E2=9E=9C  ./tests/venv/bin/avocado run tests/avocado/tcg_plugins.py:te=
st_aarch64_virt_insn_icount
>   JOB ID     : 0f5647d95f678e73fc01730cf9f8d7f80118443e
>   JOB LOG    : /home/alex/avocado/job-results/job-2022-10-02T20.19-0f5647=
d/job.log
>    (1/1) tests/avocado/tcg_plugins.py:PluginKernelNormal.test_aarch64_vir=
t_insn_icount: INTERRUPTED: Test interrupted by SIGTERM\nRunner error occur=
red: Timeout reached\nOrigi
>   nal status: ERROR\n{'name': '1-tests/avocado/tcg_plugins.py:PluginKerne=
lNormal.test_aarch64_virt_insn_icount', 'logdir': '/home/alex/avocado/job-r=
esults/job-2022-10-02T20.19
>   -0f5647d/te... (120.43 s)
>   RESULTS    : PASS 0 | ERROR 0 | FAIL 0 | SKIP 0 | WARN 0 | INTERRUPT 1 =
| CANCEL 0
>   JOB TIME   : 120.72 s

Known issue, fixed by
https://patchew.org/QEMU/20220930133511.2112734-1-peter.maydell@linaro.org/=
20220930133511.2112734-2-peter.maydell@linaro.org/
in a pending pullreq.

(I have no idea why avocado reports this as a timeout, because
what actually happens is the QEMU binary prints an error
message and exits with non-zero exit status.)

-- PMM

