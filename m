Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E2CE35A37C
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Apr 2021 18:37:12 +0200 (CEST)
Received: from localhost ([::1]:54606 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUu87-0007Go-Nx
	for lists+qemu-devel@lfdr.de; Fri, 09 Apr 2021 12:37:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54232)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lUu4p-0005qY-4l
 for qemu-devel@nongnu.org; Fri, 09 Apr 2021 12:33:48 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:45027)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lUu4l-0001b2-PJ
 for qemu-devel@nongnu.org; Fri, 09 Apr 2021 12:33:46 -0400
Received: by mail-wr1-x430.google.com with SMTP id e12so6214552wro.11
 for <qemu-devel@nongnu.org>; Fri, 09 Apr 2021 09:33:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=wMiliCgCEHcNEAcKM92/A7Y8ijWFeICAjq9Td1gHdeA=;
 b=hqBKNl4WvcycSU9ezldQqlU0V7DhkFBKCphtsS+rmbf7y4W+1yo+eL5LVrGMZ/6QoN
 iblZrS8+XUnaZsBFgAdPb1L5RtjSD7c8SSR+BJzOTaIGdieRtEfnm5WSiPFwzXPb7WnO
 fakgOk5YZ8xi9wqA5/gFyWMN7OAmNGunORC43O/nndUoMeg0Ts5vRhEWCnyL4h8r54Ze
 JCR+0wx5Mt8ugUsEBfHdPMYWskUqUW9HEREL1PPADkZaZGUroMQ9JWMx7s6B+FFjChEz
 YA4l8y94doUCcUk+VvHEHQpEny09Q8LMB8M20xiOmjvjgLHfM5md7Mb0gfkfUsBv7Te8
 ajwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=wMiliCgCEHcNEAcKM92/A7Y8ijWFeICAjq9Td1gHdeA=;
 b=OijLFuDj/NgnBQTEfpRwRxgWs3afChm3qa2ADEltV8QLnTNbe12xtR67DgIVCuHdMV
 EYs4eLq893+sCr+jn9aqSUPikKBngY6cZx5jSfNGpPRE9tGJO3ZUz5aC/uXQ6QlYNUc+
 NdUwYBv+sCe184Ske7YKUcB93QiB/vkv5AndRL1S3Nxi2ElJ+14SEEvNpRYgMYsjePgq
 AqETdH+chWVc/Tik+HeQs6MEx2ZfJbObntrRw2gVuHjsfvSwCeh/LVmfGqVaO6sHS0em
 7SqBm2p50Xil8k9RY2eofs4HyHiRqJRbLxu5D3broW6+jrHPFnTkmb6P1En9g7X1z4QO
 3tRQ==
X-Gm-Message-State: AOAM530+oKmmdLuJlyGugryRWPUVZIqF1WN/ujXkoApkLPqyerUNZ2Nd
 Ir96YapOKo9noOvHvH3TUk5H9g==
X-Google-Smtp-Source: ABdhPJwaViCAJRHzfT/3Sx2SV6NF/EeBX1+xKwjyaygZSKQdlKT19NFskotouEdUBrVfVIJe+U6nag==
X-Received: by 2002:adf:e4c9:: with SMTP id v9mr18755345wrm.342.1617986022082; 
 Fri, 09 Apr 2021 09:33:42 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id u14sm5645514wrq.65.2021.04.09.09.33.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Apr 2021 09:33:41 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id A0E471FF7E;
 Fri,  9 Apr 2021 17:33:40 +0100 (BST)
References: <87eefnwd0l.fsf@linaro.org>
 <032cba5b-1b8a-ef47-dd3d-6e4caef1223b@vivier.eu>
User-agent: mu4e 1.5.11; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Laurent Vivier <laurent@vivier.eu>
Subject: Re: trace_FOO_tcg bit-rotted?
Date: Fri, 09 Apr 2021 17:29:08 +0100
In-reply-to: <032cba5b-1b8a-ef47-dd3d-6e4caef1223b@vivier.eu>
Message-ID: <87czv3s9i3.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x430.google.com
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
Cc: matheus.ferst@eldorado.org.br,
 =?utf-8?Q?Llu=C3=ADs?= Vilanova <vilanova@ac.upc.edu>,
 Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Laurent Vivier <laurent@vivier.eu> writes:

> Le 06/04/2021 =C3=A0 18:00, Alex Benn=C3=A9e a =C3=A9crit=C2=A0:
>> Hi,
>>=20
>> It's been awhile since I last played with this but I think we are
>> suffering from not having some test cases for tracing code
>> generation/execution in the tree. I tried adding a simple trace point to
>> see if I could track ERET calls:
>>=20
>> --8<---------------cut here---------------start------------->8---
>> diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
>> index 0b42e53500..0d643f78fe 100644
>> --- a/target/arm/translate-a64.c
>> +++ b/target/arm/translate-a64.c
>> @@ -36,6 +36,7 @@
>>  #include "exec/log.h"
>>=20=20
>>  #include "trace-tcg.h"
>> +#include "trace.h"
>>  #include "translate-a64.h"
>>  #include "qemu/atomic128.h"
>>=20=20
>> @@ -2302,6 +2303,9 @@ static void disas_uncond_b_reg(DisasContext *s, ui=
nt32_t insn)
>>          default:
>>              goto do_unallocated;
>>          }
>> +
>> +        trace_eret_tcg(s->current_el, dst);
>> +
>>          if (tb_cflags(s->base.tb) & CF_USE_ICOUNT) {
>>              gen_io_start();
>>          }
>> diff --git a/target/arm/trace-events b/target/arm/trace-events
>> index 41c63d7570..2d4fca16a1 100644
>> --- a/target/arm/trace-events
>> +++ b/target/arm/trace-events
>> @@ -1,5 +1,10 @@
>>  # See docs/devel/tracing.txt for syntax documentation.
>>=20=20
>> +# translate-a64.c
>> +# Mode: softmmu
>> +# Targets: TCG(aarch64-softmmu)
>> +tcg eret(int current_el, TCGv target_el) "trans_eret: from EL%d", "exec=
_eret: EL%d to EL%"PRId64
>
> If I read correctly, the name should be eret_tcg()
> And I'm not sure TCGv will be accepted as a parameter type, use
> uint64_t instead (and %PRIu64)

This was my confusion. I thought the trace-events file was prefixed with
tcg like guest_mem_before:

  vcpu tcg guest_mem_before(TCGv vaddr, uint16_t info) "info=3D%d", "vaddr=
=3D0x%016"PRIx64" info=3D%d"

and that signalled the tools to generate _trans, _exec and _tcg hooks in
the generated files. The trace code (see other patch) also has logic to
translate natural TCG types into the natives types as well signalling
which values are only visible for the _exec portion.

Maybe I'm over thinking this. Perhaps all the TCG tracing use cases are
just as easily supported with TCG plugins now and we should deprecate
this unused bit of complexity. I certainly understand the plugin
interactions better ;-)

>
> Thanks,
> Laurent


--=20
Alex Benn=C3=A9e

