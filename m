Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB95D34E766
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Mar 2021 14:22:23 +0200 (CEST)
Received: from localhost ([::1]:60948 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRDO2-0003VY-PA
	for lists+qemu-devel@lfdr.de; Tue, 30 Mar 2021 08:22:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53624)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lRDLt-0002uk-4i
 for qemu-devel@nongnu.org; Tue, 30 Mar 2021 08:20:09 -0400
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b]:38460)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lRDLr-00005H-3N
 for qemu-devel@nongnu.org; Tue, 30 Mar 2021 08:20:08 -0400
Received: by mail-ed1-x52b.google.com with SMTP id h13so17939319eds.5
 for <qemu-devel@nongnu.org>; Tue, 30 Mar 2021 05:20:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=z2kcFuN5PNjq+Eahc4CoU53z5200vTelCYJc6I17ZhE=;
 b=n0ANfWekWrT/W43qzQq1g0di2xYM5i3akfE2Fl7dnBpyYpnRNdzYks9OPmwepm1YTg
 v50K1/uEluMX8fGfd3Anc5fdPGE5FUAQwQ4bND08dAncGCEBs/CrWEcVMG/pRA/0Etly
 w0F7386JXju65BPHbnW/Qd4BsxRs1e6io3aR4eV0VP5lbXkk8CJumCyE2uS0ZXwC+ozl
 HsxY1Ii4LMM8E6L2X2nAajVrmmYRB7I+wHYj8cXUCGI6I4kP373hD3ab/h5QPgsvAJs8
 V05LySPeUL3vAWswQNmUIe7hAJ7pbmZ/WkP/7PkLePLkX7CG0R1/shBNrkVd0egFcuSd
 k6QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=z2kcFuN5PNjq+Eahc4CoU53z5200vTelCYJc6I17ZhE=;
 b=GX/gS8iNEmVqiqS6v94hZ4N44HgSlxgMGjHEWzq5DTFhQjug+Rm1eZiZxnmRqgxd/y
 zie2Z9QKAFOPcl27p0YZfsQP5YKeH/2soOTbmIK4bEbSK2ZsUDFiOMeowen0LMhHxfdJ
 81BnHH2W+u3gid9WGxpaY/++OJgIn8Wwfmsyl5Jtr9qkcPO1zSJsDYDSxVaizEYxioJm
 4EAv/f2gPOJlxSw6eUMCwq0AIqOpWYsmPmqisnArGmC3B/BeRk+F9rhnraUVo3/mnuId
 xROaYoQ4ZWKYL5vaI3T/wk0YHStlBz09UJ1Jm3c6CAKKxkjRWIAGArQcJ5nVTKKOl6u/
 glaQ==
X-Gm-Message-State: AOAM531CVq+kJgvpPHM3cFWaImCS4ufcyVB2Qatk+ELoVcIKJt6SaEH+
 R24n9uJzAfPaVEkZqGYSxeMz8GYMhkx4jAfSefA1kw==
X-Google-Smtp-Source: ABdhPJzfKUdHYcqH96eLzMek7Q0x7sclT70x3aqIsusSbutWnG1FYvkGsiZZ0TeLeRy1tAxRwGdRrs1OSnm5tIkzJjg=
X-Received: by 2002:a05:6402:19a:: with SMTP id
 r26mr32927268edv.44.1617106804151; 
 Tue, 30 Mar 2021 05:20:04 -0700 (PDT)
MIME-Version: 1.0
References: <cb9d0504-aba5-3114-d121-694a5247764c@amsat.org>
 <YFOt+R77HfpNEYFc@stefanha-x1.localdomain>
 <2d1e40c6-5fa4-271f-5ecc-74da7c04ffea@redhat.com>
 <YFRv9zMvBXtpfN3t@stefanha-x1.localdomain>
 <20210319101848.ebdwkfttay73jajr@kamzik.brq.redhat.com>
 <cad173cb-7715-1286-eba2-75e9816e6177@redhat.com>
 <b351f107-a9fd-f7cf-1f27-2d435cea612a@amsat.org>
 <d05a40b2-ff80-d9c8-8dfe-5dfce2e57d3d@redhat.com>
 <YGHf3HjYTRJwktbf@stefanha-x1.localdomain>
 <YGMJSoIGa5VoVDB1@redhat.com>
 <04e5e251-7a09-dcf6-82ad-31bf696bc248@redhat.com>
In-Reply-To: <04e5e251-7a09-dcf6-82ad-31bf696bc248@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 30 Mar 2021 12:19:32 +0000
Message-ID: <CAFEAcA8gH1fupmKPf_H3O9jEWedttK+65-eVtjYjL0440f6b7Q@mail.gmail.com>
Subject: Re: Serious doubts about Gitlab CI
To: Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52b.google.com
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
Cc: Andrew Jones <drjones@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 30 Mar 2021 at 12:56, Thomas Huth <thuth@redhat.com> wrote:
> Right, I think we should also work more towards consolidating the QEMU
> binaries, to avoid that we have to always build sooo many target binaries
> again and again. E.g.:
>
> - Do we still need to support 32-bit hosts? If not we could
>    finally get rid of qemu-system-i386, qemu-system-ppc,
>    qemu-system-arm, etc. and just provide the 64-bit variants

We could drop qemu-system-i386 &c without dropping 32-bit host
support (except for the special case of wanting to use KVM):
32-bit host TCG happily runs the qemu-system-foo64 binary.
This does depend on the target arch having been set up so that
the 64-bit version works exactly like the 32-bit one for 32-bit
guest boards, though -- arm does this. I think x86 mostly does
except for differences like the default guest CPU type. riscv
used to have a "32 bit cpus only in the qemu-system-foo64 binary"
setup but I think that is either fixed or being fixed. There's
also the issue that it breaks existing working user commandlines,
of course.

> - Could we maybe somehow unify the targets that have both, big
>    and little endian versions? Then we could merge e.g.
>    qemu-system-microblaze and qemu-system-microblazeel etc.
>
> - Or could we maybe even build a unified qemu-system binary that
>    contains all target CPUs? ... that would also allow e.g.
>    machines with a x86 main CPU and an ARM-based board management
>    controller...

I would like to see this one day, but it's a pretty non-trivial
amount of engineering work to identify all the places where we
currently hard-code a compile-time setting about the target
architecture and make them runtime instead (in a way that doesn't
torpedo performance). "is the target CPU big-endian" is one of those...

> Also I wonder whether we could maybe even get rid of the capstone and slirp
> submodules in QEMU now ... these libraries should be available in the most
> distros by now, and otherwise people could also install them manually instead?

I suspect that's rather overoptimistic, but how widely available they
are is a question of fact that we can check.

thanks
-- PMM

