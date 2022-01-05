Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 683FF4858A9
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jan 2022 19:48:43 +0100 (CET)
Received: from localhost ([::1]:49170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5BKz-0004r8-9X
	for lists+qemu-devel@lfdr.de; Wed, 05 Jan 2022 13:48:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45974)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1n5BDH-0002YG-81
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 13:40:46 -0500
Received: from [2a00:1450:4864:20::536] (port=35530
 helo=mail-ed1-x536.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1n5BDC-0003Gc-I1
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 13:40:42 -0500
Received: by mail-ed1-x536.google.com with SMTP id y22so158421edq.2
 for <qemu-devel@nongnu.org>; Wed, 05 Jan 2022 10:40:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=06w8gqSZR8QU1vtQYPkUBPp49qmn9Gr/dyODiNVOe2Q=;
 b=ZRq7+MA0JotuMU7I/n4wEGbjDZZH69ZVzh9c6FbbrCPptwWVRRaoXCM9QZWXMaszDM
 Dih8hwqCg96HRtgrkSD2+/sKF0Y3urIP9IkZz9/gkzt9TWp/TIkLTW4XKzNKCv+un2oa
 eI4+uXsTvE7eIQiqkk5ZqE0Sch6ntAm2Y14Gs7LjPTIQshsiBVQ3DrmRnGWpqY4sUbuJ
 V2wNk5bs6ihjDMqvtL6GlmM1Lw4DltbNhgf61TO04KLpurm+IwUlfh2aa+WzUq33rxhF
 JIPIvOEE/0cpN0epF7NJyK9acMim9Rfdl9aemHsdeYcNwUnbFSiTwLD4aQJlcJpjVYmH
 bQIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=06w8gqSZR8QU1vtQYPkUBPp49qmn9Gr/dyODiNVOe2Q=;
 b=zc+1thIj/4h/MIO11HkqcGSmpzkokClDA0tBmrGOTeNEYcKjh9i5znHQ9vOZw5shnH
 mKZ2OA4+upsCPAnJ9BvB45Qf6dHQXZG9jotUr1zO8xO3bYoK25zx0PaY1c/DpNc5AglC
 4qlio3/VlGDToI5yrGxr3b2kAEYop5N8JnVfUL21KnRJ/YecQTS3F74tT6XBuN78CFvu
 /Al5+cx4P6w84QH+eLaAbIPqG0F8wK/eH+cqMp1s0r4dqFvVZfUv9LmVxi3jbP66V5xa
 t+rJqpXaEsAH+0EqJYZQbsngVJZRfkSYlYBs/IkU+PFhi/+ShJ1rHNX5qMLZ59tViVP3
 hssQ==
X-Gm-Message-State: AOAM533W2jcO6IKaBjiar7cuo6E+TobVYoj4X8je/M/OSMud3BlNT6/0
 j35GbHn+pv3/c9iGu+4jaB3uxw==
X-Google-Smtp-Source: ABdhPJyBVgNAS3O/RM1cZrVqbSwsMS6vVDKrJVwVvhLMO+C11hX7rY5J6j6hZRevI9ERLWnu1kJRFw==
X-Received: by 2002:a17:906:7305:: with SMTP id
 di5mr43310566ejc.702.1641408035068; 
 Wed, 05 Jan 2022 10:40:35 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id z22sm1319003edd.68.2022.01.05.10.40.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Jan 2022 10:40:34 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 65F4C1FFB7;
 Wed,  5 Jan 2022 18:40:33 +0000 (GMT)
References: <00a79b65-288f-f17c-abe4-fcfd3f7971fd@oth-regensburg.de>
 <cover.1641309725.git.konrad.schwarz@siemens.com>
 <85d02ac883c7cf40fbd54e8747783937e0370eaa.1641309725.git.konrad.schwarz@siemens.com>
 <18d1fbb3-ddff-6d3c-55a1-cbec27ac9f1e@linaro.org>
 <9511f23e9cdf42609866bc597f87b97e@siemens.com>
User-agent: mu4e 1.7.5; emacs 28.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: "Schwarz, Konrad" <konrad.schwarz@siemens.com>
Subject: Re: [PATCH v2 1/5] RISC-V: larger and more consistent register set
 for 'info registers'
Date: Wed, 05 Jan 2022 18:21:40 +0000
In-reply-to: <9511f23e9cdf42609866bc597f87b97e@siemens.com>
Message-ID: <878rvujaam.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::536
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x536.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Bin Meng <bin.meng@windriver.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>, qemu-devel@nongnu.org,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


"Schwarz, Konrad" <konrad.schwarz@siemens.com> writes:

>> -----Original Message-----
>> From: Richard Henderson <richard.henderson@linaro.org>
>> Sent: Tuesday, January 4, 2022 21:57
>> Subject: Re: [PATCH v2 1/5] RISC-V: larger and more consistent register =
set for 'info registers'
>>=20
>> On 1/4/22 7:51 AM, Konrad Schwarz wrote:
>> >           static const int dump_csrs[] =3D {
>> > +
>> > +#  if 0
>> > +            CSR_USTATUS,
>> > +            CSR_UIE,
>> > +            CSR_UTVEC,
>>=20
>> Adding huge sections of #if 0 code is not acceptable.
>
> I'm not sure on how to solve the dilemma of
>
> * transgressing on QEMUs coding guidelines on the one side
>   (large sections of commented out code)
>
> * having `info registers' output a huge swath of CSRs,
>   swamping the user and making the command impractical
>
> I feel that providing some control at compile
> time via `# if' conditional compilation is preferrable to just dumping
> everything.  I could of course only list the CSRs that
> are interesting to me, currently, but I thought it
> would be better to list (almost) all of them and give at least
> programmers an easy way to enable the blocks of CSRs
> that are of interest to them.
>
> Obviously, the best solution would be to extend the command to
> add a filter argument, similar to GDB's `info registers'
> (i.e. info registers XXX), but I don't know how to do that in QEMU and
> it would work differently from other target architectures.

This is a problem that needs solving not only for "info registers" but
also things like "-d cpu", gdbserver and (eventually) TCG plugins.

My (so far unrealised) vision is to have a architecture independent
sub-system that we can register (sic) registers. The frontends would
replace their existing qemu_log and gdbserver hooks with a group aware
registering function to the sub-system. For example:

  register_reg("x0", REG_CORE, get_gen_reg, set_gen_reg, offsetof(CPUARMSta=
te, xregs[0]))
  register_reg(ri->name, REG_SYSTEM, get_cpreg, set_cpreg, ri);

and so on. This would then provide a common point for the register value
consumers to request values and sets. So we could have options like:

  (hmp) info registers fpu
  -d cpu:pc
  qemu_plugin_get_regset("x0-x7");

and avoid having too much per-architecture special casing. I'd also like
to get rid of custom gdb XML generation in the frontends (e.g.
arm_gen_dynamic_svereg_xml) and make that common functionality.

> What would you suggest?

--=20
Alex Benn=C3=A9e

