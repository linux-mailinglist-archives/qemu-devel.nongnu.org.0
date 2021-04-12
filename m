Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E39935D0FC
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Apr 2021 21:26:21 +0200 (CEST)
Received: from localhost ([::1]:41404 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lW2CS-0005cS-4w
	for lists+qemu-devel@lfdr.de; Mon, 12 Apr 2021 15:26:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lW29N-0004Wx-Ta
 for qemu-devel@nongnu.org; Mon, 12 Apr 2021 15:23:09 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:39583)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lW29L-0002lC-La
 for qemu-devel@nongnu.org; Mon, 12 Apr 2021 15:23:09 -0400
Received: by mail-wr1-x42e.google.com with SMTP id s7so13956324wru.6
 for <qemu-devel@nongnu.org>; Mon, 12 Apr 2021 12:23:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=nKD+Kt+AO6nJPz69zHs+b8yP3KSJHIGiVd9TopxfO5o=;
 b=hxG2Ja/hJw1DzPP3RRqf3ujHr6PR1Qr9c5IbLR9e/Z5qO0na4dDbzH9BNPlDiLmD0v
 4LY6HjxzP45LnqsbP14ri1/n1UFrE4z4amn09bp1a/V3TbWmaPe7e+O+nTYghnGFLKHU
 BpnAeFkRiYbevwjJUn4A+9Fxz2EvCrbKsiZo40yAGKInbALCRSqVrxH7srr/8JjiMS1W
 JmrvuMaG3b0kdVdsS/wjbrS1USBqFYN417//hmvM9cBQzSr7Q6QnHa0FTMpyuUd+FlyI
 6ai2pRfvoj9U1ca9inQduBziszUtwwu3zIW8fAIRAEslzPoflw6jw35HuQ+K0MfmE9A4
 WJpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=nKD+Kt+AO6nJPz69zHs+b8yP3KSJHIGiVd9TopxfO5o=;
 b=WHew/H6danw1Jq1dWitcNpT3aqTEnJr99oPAAvK00j/m9jBP+5S1yZO72KxOcg92Lj
 OEawoArxPJBvk1ocz+dDDDNpz/nOi5nPvIl8Ftyx0zuWMimOwtfiG1pmImL5Ydn/q6Uv
 ZM31uP0a9ObQmlP6K1IBrCmCuksK2O4BRIp3zxPjjnWCK6V/k5wt5Eeq2aeS5MQJA3SY
 8CTker7+sbJQ95cK8dfYiKCu2C/EyTf8PYmb21td49YZNQzYCSg2r1bwPtkfBzrIClBf
 my4qlIIDBXpp+M+AIlo/A1qYoZImHFtJtsn/YKuy2PoMV6DAKfrL7c/rOhWNAT3PLoAa
 08vw==
X-Gm-Message-State: AOAM53120S15DgqoHEQYXMfqd8PsCTOKt7VWwaFoDyIg3uspRZgi251J
 qukCM9Hf7MtZmKvS1LHzPwiYYA==
X-Google-Smtp-Source: ABdhPJyXD9+UlZqhnZP5oOcFbeU+y0JDjalVn5uKl4FlclYc40I0skQnNGQVnH1eAUL5BX9c/jpLAA==
X-Received: by 2002:adf:dc4f:: with SMTP id m15mr33235867wrj.420.1618255385949; 
 Mon, 12 Apr 2021 12:23:05 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id 61sm8388509wrm.52.2021.04.12.12.23.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Apr 2021 12:23:04 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 362721FF7E;
 Mon, 12 Apr 2021 20:23:04 +0100 (BST)
References: <87eefnwd0l.fsf@linaro.org>
 <032cba5b-1b8a-ef47-dd3d-6e4caef1223b@vivier.eu>
 <87czv3s9i3.fsf@linaro.org> <YHRgkuNwPhiRz6vn@stefanha-x1.localdomain>
User-agent: mu4e 1.5.11; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: trace_FOO_tcg bit-rotted?
Date: Mon, 12 Apr 2021 20:06:57 +0100
In-reply-to: <YHRgkuNwPhiRz6vn@stefanha-x1.localdomain>
Message-ID: <87r1jfmhnr.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: qemu-devel@nongnu.org, matheus.ferst@eldorado.org.br,
 Laurent Vivier <laurent@vivier.eu>,
 =?utf-8?Q?Llu=C3=ADs?= Vilanova <vilanova@ac.upc.edu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Stefan Hajnoczi <stefanha@redhat.com> writes:

> On Fri, Apr 09, 2021 at 05:29:08PM +0100, Alex Benn=C3=A9e wrote:
>>=20
>> Laurent Vivier <laurent@vivier.eu> writes:
>>=20
>> > Le 06/04/2021 =C3=A0 18:00, Alex Benn=C3=A9e a =C3=A9crit=C2=A0:
>> >> Hi,
>> >>=20
>> >> It's been awhile since I last played with this but I think we are
>> >> suffering from not having some test cases for tracing code
>> >> generation/execution in the tree. I tried adding a simple trace point=
 to
>> >> see if I could track ERET calls:
>> >>=20
>> >> --8<---------------cut here---------------start------------->8---
>> >> diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
>> >> index 0b42e53500..0d643f78fe 100644
>> >> --- a/target/arm/translate-a64.c
>> >> +++ b/target/arm/translate-a64.c
>> >> @@ -36,6 +36,7 @@
>> >>  #include "exec/log.h"
>> >>=20=20
>> >>  #include "trace-tcg.h"
>> >> +#include "trace.h"
>> >>  #include "translate-a64.h"
>> >>  #include "qemu/atomic128.h"
>> >>=20=20
>> >> @@ -2302,6 +2303,9 @@ static void disas_uncond_b_reg(DisasContext *s,=
 uint32_t insn)
>> >>          default:
>> >>              goto do_unallocated;
>> >>          }
>> >> +
>> >> +        trace_eret_tcg(s->current_el, dst);
>> >> +
>> >>          if (tb_cflags(s->base.tb) & CF_USE_ICOUNT) {
>> >>              gen_io_start();
>> >>          }
>> >> diff --git a/target/arm/trace-events b/target/arm/trace-events
>> >> index 41c63d7570..2d4fca16a1 100644
>> >> --- a/target/arm/trace-events
>> >> +++ b/target/arm/trace-events
>> >> @@ -1,5 +1,10 @@
>> >>  # See docs/devel/tracing.txt for syntax documentation.
>> >>=20=20
>> >> +# translate-a64.c
>> >> +# Mode: softmmu
>> >> +# Targets: TCG(aarch64-softmmu)
>> >> +tcg eret(int current_el, TCGv target_el) "trans_eret: from EL%d", "e=
xec_eret: EL%d to EL%"PRId64
>> >
>> > If I read correctly, the name should be eret_tcg()
>> > And I'm not sure TCGv will be accepted as a parameter type, use
>> > uint64_t instead (and %PRIu64)
>>=20
>> This was my confusion. I thought the trace-events file was prefixed with
>> tcg like guest_mem_before:
>>=20
>>   vcpu tcg guest_mem_before(TCGv vaddr, uint16_t info) "info=3D%d", "vad=
dr=3D0x%016"PRIx64" info=3D%d"
>>=20
>> and that signalled the tools to generate _trans, _exec and _tcg hooks in
>> the generated files. The trace code (see other patch) also has logic to
>> translate natural TCG types into the natives types as well signalling
>> which values are only visible for the _exec portion.
>>=20
>> Maybe I'm over thinking this. Perhaps all the TCG tracing use cases are
>> just as easily supported with TCG plugins now and we should deprecate
>> this unused bit of complexity. I certainly understand the plugin
>> interactions better ;-)
>
> Llu=C3=ADs: are you happy to deprecate tcg trace events in favor of TCG
> plugins?
>
> My question is whether TCG plugins are really equivalent here. Will TCG
> plugin users have to write their own log file output code to extract
> this information from the QEMU process (i.e. reinventing tracing)?

Yes - although there is no reason we couldn't expose the trace output as
a helper. Currently there is:

  /**
   * qemu_plugin_outs() - output string via QEMU's logging system
   * @string: a string
   */
  void qemu_plugin_outs(const char *string);

which allows the user to echo to the log in conjunction with -d plugin
on the command line. Plugins are of course free to do there own thing.

> Is
> the performance at least as good as tracing?

Well like all things that depends ;-)

Generally on the sort of events you tend to trace (like the example
memory access) you usually either want to aggregate or filter your
results. With trace output their is no way to do this and you end up
post processing potentially very large files (smaller if you use the
non-default binary format). I don't know if a similar thing is possible
with uprobes and ebpf - I've only ever used the simple logging output in
anger. The example plugins generally do things like count total
accesses:

  https://gitlab.com/qemu-project/qemu/-/blob/master/tests/plugin/mem.c

(pretty fast in comparison to writing out reams of data)

or aggregate the results:

  https://gitlab.com/qemu-project/qemu/-/blob/master/contrib/plugins/hotpag=
es.c

(probably slower while running QEMU, but faster overall because no post
processing of log files required.)

Of course plugins are a non-default build option because although light
it does have a small performance impact on code generation even when no
instrumentation is occurring. As a result you can't use it without
building a version first.

If we had test code in the build that used the TCG tracing abilities I
wouldn't worry because at least we are defending the feature and we
wouldn't run into problems like the above. At least if plugins get
broken we'll know about it due to the fairly thorough workout on CI, e.g.:

  https://gitlab.com/qemu-project/qemu/-/jobs/1172484753#L3458

--=20
Alex Benn=C3=A9e

