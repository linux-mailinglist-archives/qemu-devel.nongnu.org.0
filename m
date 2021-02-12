Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EEB1931A252
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Feb 2021 17:06:18 +0100 (CET)
Received: from localhost ([::1]:41656 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAaxW-00057m-29
	for lists+qemu-devel@lfdr.de; Fri, 12 Feb 2021 11:06:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55764)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lAatd-0002Dh-0q
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 11:02:17 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:39204)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lAatb-0004at-7X
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 11:02:16 -0500
Received: by mail-wm1-x330.google.com with SMTP id u14so20687wmq.4
 for <qemu-devel@nongnu.org>; Fri, 12 Feb 2021 08:02:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=zkq717vAr7ylAEHluJAINrgiDXiJ6KWU9qS5hNhVd+s=;
 b=jsnJ/mIp3Zhakh9/ZzV1ckVks9pAp7Dg8xAkzSsudQgcBhjdYOjuSm02qwqnC/jHL7
 UAmDPfOYON8My8dpws9WcY34YMexo4x0RUYtNp7r6a0n8sk8Fb6pOgPTs2r5zftW5m1s
 acmtwtmi3HEwNp+BL9ZM/Vb+WCF4VryC8vW5uD0AT3+EXfCI/6ANSXtCCxU9iPy7+Hw8
 zTRMan17Z5v5nb51FAzpE/yU7QxgGsECe57aMHb1OXYvA7e5NCPXrpeCdd+mZr2/Phhl
 NSg2Dsr6lCdHDxAkb7PkgQMdQlpcGfelfdAJ/aBB/+4yFjgM6SLwudtkieq7OrjEBxK1
 n/dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=zkq717vAr7ylAEHluJAINrgiDXiJ6KWU9qS5hNhVd+s=;
 b=sznxYPjUmCL9k2zwpKaqtTp1vr06Qxuq/mUwtjYe51xl3KDwYysu3jl12tDdGBuWVN
 Xl1kxW0qvcSdSwSOtTptvNDOD/CtzL1U4HWyP5NblYaP1beU08NmkyWdo2oDMKw1F6R3
 3zIKEiigqazTSl0f/uqvjkAbNBWkgnABcv4bSp4LLN76zd8XqtMA+jU0zXWXinG/ypbT
 Un+Jay5B7RNQtGYUTudLbOn6iAcuEFQFWgzKSg8jtIcIp4hXEsMu78yPNhkAnpRkgAdE
 UJyE2hxk1gy21hXk6JNn9rcf9Fxppic5u8sv17wZ2l7o99HjaIb/oYcAHNU+0up+u0ol
 eVTA==
X-Gm-Message-State: AOAM531Ix679+A52csWJcvRLNn8lZ3L/OGlyXNvMNgkzPBQMh04xLeeg
 8I5R3Podtqc5do0Z0Jj1PYonyg==
X-Google-Smtp-Source: ABdhPJyIIKsW9BDYiGuYOeHfhSA8WvejfbthrEWMQHk5mmyfmwL1I8b/CuwRBhL3/U9mkBQZjXXv4A==
X-Received: by 2002:a05:600c:6c5:: with SMTP id
 b5mr3334166wmn.137.1613145732849; 
 Fri, 12 Feb 2021 08:02:12 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id w4sm14177962wmc.13.2021.02.12.08.02.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Feb 2021 08:02:11 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 1C04E1FF7E;
 Fri, 12 Feb 2021 16:02:11 +0000 (GMT)
References: <20210210221053.18050-1-alex.bennee@linaro.org>
 <20210210221053.18050-21-alex.bennee@linaro.org>
 <YCXRpCiekU+TgoAX@strawberry.localdomain> <877dndz6p7.fsf@linaro.org>
User-agent: mu4e 1.5.8; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Aaron Lindsay <aaron@os.amperecomputing.com>
Subject: Re: [PATCH  v2 20/21] accel/tcg: allow plugin instrumentation to be
 disable via cflags
Date: Fri, 12 Feb 2021 16:00:37 +0000
In-reply-to: <877dndz6p7.fsf@linaro.org>
Message-ID: <87y2ftxojg.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x330.google.com
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
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 robhenry@microsoft.com, mahmoudabdalghany@outlook.com, cota@braap.org,
 Paolo Bonzini <pbonzini@redhat.com>, kuhn.chenqun@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Alex Benn=C3=A9e <alex.bennee@linaro.org> writes:

> Aaron Lindsay <aaron@os.amperecomputing.com> writes:
>
>> On Feb 10 22:10, Alex Benn=C3=A9e wrote:
>>> When icount is enabled and we recompile an MMIO access we end up
>>> double counting the instruction execution. To avoid this we introduce
>>> the CF_NOINSTR cflag which disables instrumentation for the next TB.
>>> As this is part of the hashed compile flags we will only execute the
>>> generated TB while coming out of a cpu_io_recompile.
>>
>> Unfortunately this patch works a little too well!
>>
>> With this change, the memory access callbacks registered via
>> `qemu_plugin_register_vcpu_mem_cb()` are never called for the
>> re-translated instruction making the IO access, since we've disabled all
>> instrumentation.
>>
>> Is it possible to selectively disable only instruction callbacks using
>> this mechanism, while still allowing others that would not yet have been
>> called for the re-translated instruction?
>
> Can you try the following fugly patch on top of this series:
>
<snip>
> @@ -120,8 +128,13 @@ void qemu_plugin_register_vcpu_mem_cb(struct qemu_pl=
ugin_insn *insn,
>                                        enum qemu_plugin_mem_rw rw,
>                                        void *udata)
>  {
> -    plugin_register_vcpu_mem_cb(&insn->cbs[PLUGIN_CB_MEM][PLUGIN_CB_REGU=
LAR],
> -                                cb, flags, rw, udata);
> +    if (insn->store_only && (rw & QEMU_PLUGIN_MEM_W)) {
> +        plugin_register_vcpu_mem_cb(&insn->cbs[PLUGIN_CB_MEM][PLUGIN_CB_=
REGULAR],
> +                                    cb, flags, QEMU_PLUGIN_MEM_W, udata);
> +    } else {
> +        plugin_register_vcpu_mem_cb(&insn->cbs[PLUGIN_CB_MEM][PLUGIN_CB_=
REGULAR],
> +                                    cb, flags, rw, udata);
> +    }
>  }
<snip>

Actually I'm wondering if I've got my sense the wrong way around. Should
it be loads only:

  void qemu_plugin_register_vcpu_mem_cb(struct qemu_plugin_insn *insn,
                                        qemu_plugin_vcpu_mem_cb_t cb,
                                        enum qemu_plugin_cb_flags flags,
                                        enum qemu_plugin_mem_rw rw,
                                        void *udata)
  {
      if (insn->store_only && (rw & QEMU_PLUGIN_MEM_R)) {
          plugin_register_vcpu_mem_cb(&insn->cbs[PLUGIN_CB_MEM][PLUGIN_CB_R=
EGULAR],
                                      cb, flags, QEMU_PLUGIN_MEM_R, udata);
      } else {
          plugin_register_vcpu_mem_cb(&insn->cbs[PLUGIN_CB_MEM][PLUGIN_CB_R=
EGULAR],
                                      cb, flags, rw, udata);
      }
  }


obviously I'd have to rename the variables :-/

--=20
Alex Benn=C3=A9e

