Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC41540C46E
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Sep 2021 13:36:16 +0200 (CEST)
Received: from localhost ([::1]:54578 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQTD5-0002FP-AT
	for lists+qemu-devel@lfdr.de; Wed, 15 Sep 2021 07:36:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52372)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mQTAG-0000on-VX
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 07:33:21 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:34594)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mQTAE-0005OI-WD
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 07:33:20 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 v20-20020a1cf714000000b002e71f4d2026so3703248wmh.1
 for <qemu-devel@nongnu.org>; Wed, 15 Sep 2021 04:33:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=jdUARMrS4A/w7avyxnUsYUP4OyO1MxwVvpUIfBI9keU=;
 b=Bya8lxPvsPl9xjP7/t+WNUy8eNHSrXbABH/KLL5qOYy97W1cMysZs9gfFdTKEjDGRK
 lp3lqhonc28FHDPVoX2CrVoE46PsTErhAlqQAFhpruY1+SNyFmhZC6zN54wXFZyw+FbX
 TH4Z75gVqYC2W3H+fdydwEQewOqrqptetofUGoF8z6+wXmCC4dBVvRPfo+OtGcCAymp0
 tbNFfxCLupqyCh/nnAjktXegNm/3qTFh3s68JfMjWH990BPDPEiyzACeKvZhw4hbvbcR
 wxUdJflIkBMC+f5KkBnTw4JA7wwweHZkmX0zkurYngIjiOTeV23VJXRMpJoa3i8TLR8R
 IZ8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=jdUARMrS4A/w7avyxnUsYUP4OyO1MxwVvpUIfBI9keU=;
 b=hkm/jcStTxjkZkHOdzwhdC36gB4dn8b/6P+7y15C9xparc5Vqpl5f9Hb8FFD5zll/2
 4ZxNWMwW7KvboiMM8RGw5Z04brQpMaovyzUwvMPRsxDQcdMt20e9wZK381ztY4bsPZpq
 GmcUK6tXz3kLmzgrzZIF4rRTysy/LHo3kIe5Y3buBYWrDi/qFITVcV72PoBHz1amRnuj
 Rb60h6yJvu6Cgqq2P8bW9txNeru0KYsceV4BIN0olF10yTn294HnJzq1+w+9PvREBybQ
 zySnQMK6KwT6aVG950m2YOa3v0Co2/Ug5APGitBvtYPrWJfRpXdnY+bRLAI0mcrF/xh/
 /ZXQ==
X-Gm-Message-State: AOAM532NQfmyXGe/BU+ZP6WP4mOy3rXm8OBZiq0vnP3Yu/lZfAo4aCWs
 elYx5PpeL+q13bcnuO85llOX/w==
X-Google-Smtp-Source: ABdhPJxBKoosx95erfQJ0uxfo9xlkblQo6/bAxShD8A21PHjtLirSyKae50SwPzz1oOdYGF/fTKT0A==
X-Received: by 2002:a1c:9a8e:: with SMTP id c136mr3968255wme.191.1631705597053; 
 Wed, 15 Sep 2021 04:33:17 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id b16sm13513135wrp.82.2021.09.15.04.33.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Sep 2021 04:33:16 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 196151FF96;
 Wed, 15 Sep 2021 12:33:15 +0100 (BST)
References: <20210821094527.491232-1-florian.hauschild@fs.ei.tum.de>
 <20210821094527.491232-2-florian.hauschild@fs.ei.tum.de>
User-agent: mu4e 1.7.0; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Florian Hauschild <florian.hauschild@fs.ei.tum.de>
Subject: Re: [RFC PATCH 1/1] QEMU plugin interface extension
Date: Wed, 15 Sep 2021 11:51:03 +0100
In-reply-to: <20210821094527.491232-2-florian.hauschild@fs.ei.tum.de>
Message-ID: <87r1dqt6o4.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x334.google.com
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
Cc: Alexandre Iooss <erdnaxe@crans.org>,
 Mahmoud Mandour <ma.mandourr@gmail.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Florian Hauschild <florian.hauschild@fs.ei.tum.de> writes:

> This extension covers functions:
>   * to read and write guest memory
>   * to read and write guest registers
>   * to flush tb cache
>   * to control single stepping of qemu from plugin

Next time please split the functionality into separate patches to aid
review.

>
> These changes allow the user to
>   * collect more information about the behaviour of the system

More introspection into guest state is a welcome improvement.

>   * change the guest state with a plugin during execution

I have no in principle objection to this but the wider community may
disagree. We are wary of plugins being used for GPL avoidance reasons.

>   * control cache of tcg

Why? From the plugins point of view the internal state of the translator
should be irrelevant. If it's not it's a bug.

>   * allow for precise instrumentation in execution flow

More precise than every instruction and memory access? How exactly?

>
> Signed-off-by: Florian Hauschild <florian.hauschild@fs.ei.tum.de>
> ---
>  include/qemu/qemu-plugin.h   |  35 ++++++++++++
>  plugins/meson.build          |   1 +
>  plugins/readwriteextension.c | 106 +++++++++++++++++++++++++++++++++++
>  3 files changed, 142 insertions(+)
>  create mode 100644 plugins/readwriteextension.c
>
> diff --git a/include/qemu/qemu-plugin.h b/include/qemu/qemu-plugin.h
> index e6e815abc5..c7a0c5f379 100644
> --- a/include/qemu/qemu-plugin.h
> +++ b/include/qemu/qemu-plugin.h
> @@ -577,4 +577,39 @@ int qemu_plugin_n_max_vcpus(void);
>   */
>  void qemu_plugin_outs(const char *string);
>=20=20
> +
> +/**
> + * read_reg() read a register
> + * @reg: Number of the register
> + *
> + * Returns the value of the register
> + */
> +uint64_t read_reg(int reg);
> +
> +/**
> + * write_reg() - write to a register
> + * @reg: number of the register
> + * @val: value written to register
> + */
> +void write_reg(int reg, uint64_t val);
> +
> +/**
> + * plugin_flush_tb() - Flush the tb cache
> + */
> +void plugin_flush_tb(void);
> +
> +/**
> + * plugin_rw_memory_cpu() - Function to read from and write to a guest a=
ddress.
> + * @address: baseaddress of the memory section
> + * @buffer: buffer managed by caller the value should be written to
> + * @buf_size: size of the buffer and memory size read/written.
> + * @write: 1 if write, 0 if read
> + */
> +int plugin_rw_memory_cpu(uint64_t address, uint8_t buffer[], size_t buf_=
size, char write);
> +
> +/**
> + * plugin_single_step() - Function to change single step behaviour from =
the plugin.
> + */
> +void plugin_single_step(int enable);
> +
>  #endif /* QEMU_PLUGIN_API_H */
> diff --git a/plugins/meson.build b/plugins/meson.build
> index e77723010e..b95cbab0b1 100644
> --- a/plugins/meson.build
> +++ b/plugins/meson.build
> @@ -10,4 +10,5 @@ specific_ss.add(when: 'CONFIG_PLUGIN', if_true: [files(
>    'loader.c',
>    'core.c',
>    'api.c',
> +  'readwriteextension.c',
>  ), declare_dependency(link_args: plugin_ldflags)])
> diff --git a/plugins/readwriteextension.c b/plugins/readwriteextension.c
> new file mode 100644
> index 0000000000..47460c396f
> --- /dev/null
> +++ b/plugins/readwriteextension.c
> @@ -0,0 +1,106 @@
> +/**
> + * QEMU Plugin read write extension code
> + *
> + * This is the code that allows the plugin to read and write
> + * memory and registers and flush the tb cache. Also allows
> + * to set QEMU into singlestep mode from Plugin.
> + *
> + * Based on plugin interface:
> + * Copyright (C) 2017, Emilio G. Cota <cota@braap.org>
> + * Copyright (C) 2019, Linaro
> + *
> + * Copyright (C) 2021 Florian Hauschild <florian.hauschild@tum.de>
> + *
> + * License: GNU GPL, version 2 or later.
> + *   See the COPYING file in the top-level directory.
> + *
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + */
> +
> +
> +
> +#include "qemu/osdep.h"
> +#include "qemu/plugin.h"
> +#include "hw/core/cpu.h"
> +#include "cpu.h"
> +#include "exec/exec-all.h"
> +
> +void plugin_async_flush_tb(CPUState *cpu, run_on_cpu_data arg);
> +void plugin_async_flush_tb(CPUState *cpu, run_on_cpu_data arg)
> +{
> +    g_assert(cpu_in_exclusive_context(cpu));
> +    tb_flush(cpu);
> +}
> +
> +
> +
> +int plugin_rw_memory_cpu(uint64_t address, uint8_t buffer[], size_t buf_=
size, char write)
> +{
> +    return cpu_memory_rw_debug(current_cpu, address, buffer, buf_size, w=
rite);

Accessing memory during a plugin event is tricky. There is no way to
know if memory has changed underneath you. Would it instead be more
useful to derive the access from instrumented instructions? That way you
can know the exact value read or written at that exact moment in time.

> +}
> +
> +
> +void plugin_flush_tb(void)
> +{
> +    async_safe_run_on_cpu(current_cpu, plugin_async_flush_tb, RUN_ON_CPU=
_NULL);
> +}
> +
> +static int plugin_read_register(CPUState *cpu, GByteArray *buf, int reg)
> +{
> +    CPUClass *cc =3D CPU_GET_CLASS(cpu);
> +    if (reg < cc->gdb_num_core_regs) {
> +        return cc->gdb_read_register(cpu, buf, reg);
> +    }
> +    return 0;
> +}

I'm not super keen on exposing gdb register id's to the plugins. For one
thing they can be dynamic and there is no way for the plugins to know
what the mapping is. I'd rather abstract the registers in a way that can
be cleanly used by HMP, logging and plugins.

> +
> +uint64_t read_reg(int reg)
> +{
> +    GByteArray *val =3D g_byte_array_new();
> +    uint64_t reg_ret =3D 0;
> +    int ret_bytes =3D plugin_read_register(current_cpu, val, reg);
> +    if (ret_bytes =3D=3D 1) {
> +        reg_ret =3D val->data[0];
> +    }
> +    if (ret_bytes =3D=3D 2) {
> +        reg_ret =3D *(uint16_t *) &(val->data[0]);
> +    }
> +    if (ret_bytes =3D=3D 4) {
> +        reg_ret =3D *(uint32_t *) &(val->data[0]);
> +    }
> +    if (ret_bytes =3D=3D 8) {
> +        reg_ret =3D *(uint64_t *) &(val->data[0]);
> +    }
> +    return reg_ret;
> +}

There are larger registers than 8 bytes - for example the various vector
implementations. They need to be accessible via this interface.

> +
> +void write_reg(int reg, uint64_t val)
> +{
> +    CPUState *cpu =3D current_cpu;
> +    CPUClass *cc =3D CPU_GET_CLASS(cpu);
> +
> +    if (reg < cc->gdb_num_core_regs) {
> +        cc->gdb_write_register(cpu, (uint8_t *) &val, reg);
> +    }
> +}
> +
> +void plugin_single_step(int enable)
> +{
> +    /* singlestep is set in softmmu/vl.c*/
> +    static int orig_value;
> +    static int executed =3D 1;
> +
> +    if (unlikely(executed =3D=3D 1)) {
> +        orig_value =3D singlestep;
> +        executed =3D 2;
> +    }
> +
> +    if (enable =3D=3D 1) {
> +        singlestep =3D 1;
> +    } else {
> +        singlestep =3D orig_value;
> +    }
> +
> +    tb_flush(current_cpu);
> +}

Again why? What does this gain over instrumenting instructions themselves?

--=20
Alex Benn=C3=A9e

