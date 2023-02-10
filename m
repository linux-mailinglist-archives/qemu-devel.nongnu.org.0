Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 352506923A1
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Feb 2023 17:49:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQWZn-0007FF-Jm; Fri, 10 Feb 2023 11:48:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pQWZl-0007Aq-MB
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 11:48:41 -0500
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pQWZj-0002Ea-NE
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 11:48:41 -0500
Received: by mail-pj1-x1033.google.com with SMTP id
 gj9-20020a17090b108900b0023114156d36so9952621pjb.4
 for <qemu-devel@nongnu.org>; Fri, 10 Feb 2023 08:48:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1676047717;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=6OEgyMn4g8KxwL5XWevu/GEAqapXUfm1glXupJysh80=;
 b=a97HRaCvnFyMW9gMjqpMQc2YlbWsz/xc4XqipZaxK+kKN5XMDoM8rred1rTHzU+mPb
 ItFspBzz7tU+wduj7klkzei4lGQC04TAIlpR3MLQMLrN2S5b5e+BdWxkPoMMt5EsDnqm
 5IXeDR95dekEMCrU13MWnAbJlBTUBVayzRDe7xYrNFhqCzzCvJ6KpbVSlZj8LGEn3WJK
 ypfTpef8ZeeQnIAzcMVsLQpOlhQMWQaQ3o6yKYDjF69KaZCWRgIjASQGrncS0wcwuNMY
 2htPrNc1xlHVTsOfkA/xXrjZNxXS8l2OIn/vATpW0iv+s/DFVQUrwG8OASrZrL+OFD2+
 2lcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1676047717;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6OEgyMn4g8KxwL5XWevu/GEAqapXUfm1glXupJysh80=;
 b=01nGSCjevdBa7Xd0aWtmGNg/mzCyRac/hCyKR6hAcO22Bt5r7nokL1B1lzb7wn3Obk
 2zzDnuxODhSV1VqHfkcrPkkQ7wIVjuqTbkxOPqSQTOHwhdgllnn2Cg+AkuZegIKtKxLV
 yQQZQ0TJzQz3XZ4P3fQVximxd+K8zMZkNNtQvE/ZLdNZSsLSYylyCCWVqgXzmtz4Uphg
 o8ZE2da1w0aUBRrA4SOT8qs9BCgWtPbzP3SSuClJ/Oobjid+i51GVjKXarW2ZnFc38aa
 c5czMcF4ZuP+Tpe6VJ1jIBr2pHB4ivPxEAXUBrYmT7FBRxCEuMVprAR7WR6G5/qcbZ9y
 NHAQ==
X-Gm-Message-State: AO0yUKXg97/It7TsdeQkJleXkyira7T4bFOB9U+fjY2qPbhW69g0E+Zy
 mZ++TKAPjoH4najd1ArvAxxETXN48uGzIAukFj44gg==
X-Google-Smtp-Source: AK7set/2cLMq8A8knzjST+cXGND4Y3kOLQVsx2WO1QAhe8cCj9hr+qOVSsbr52R7m2+17vtyRcN9Y7TeCAGhybpJZQU=
X-Received: by 2002:a17:902:9a87:b0:199:5374:b831 with SMTP id
 w7-20020a1709029a8700b001995374b831mr2234176plp.11.1676047716877; Fri, 10 Feb
 2023 08:48:36 -0800 (PST)
MIME-Version: 1.0
References: <20230206171359.1327671-1-peter.maydell@linaro.org>
 <20230206171359.1327671-2-peter.maydell@linaro.org>
 <8669ea09-05b4-b17f-aa85-9943071232d3@redhat.com>
In-Reply-To: <8669ea09-05b4-b17f-aa85-9943071232d3@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 10 Feb 2023 16:48:25 +0000
Message-ID: <CAFEAcA91Tgu6c2+5hj3ejdKpPdnXPwpmh3X-gUuF1HAu679hyQ@mail.gmail.com>
Subject: Re: [RFC PATCH 1/5] Rename the singlestep global variable to
 one_insn_per_tb
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>, 
 Paolo Bonzini <pbonzini@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, 
 Laurent Vivier <laurent@vivier.eu>, Warner Losh <imp@bsdimp.com>,
 Kyle Evans <kevans@freebsd.org>, Markus Armbruster <armbru@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x1033.google.com
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

On Mon, 6 Feb 2023 at 20:20, Thomas Huth <thuth@redhat.com> wrote:
>
> On 06/02/2023 18.13, Peter Maydell wrote:
> > The 'singlestep' global variable is badly misnamed, because it has
> > nothing to do with single-stepping the emulation either via the gdb
> > stub or by emulation of architectural debug facilities.  Instead what
> > it does is force TCG to put only one instruction into each TB.
> > Rename it to one_insn_per_tb, so that it reflects what it does better
> > and is easier to search for in the codebase.
> >
> > This misnaming is also present in user-facing interfaces: the command
> > line option '-singlestep', the HMP 'singlestep' command, and the QMP
> > StatusInfo object.  Those are harder to update because we need to
> > retain backwards compatibility.  Subsequent patches will add
> > better-named aliases so we can eventually deprecate-and-drop the old,
> > bad name.
> >
> > Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> > ---
> >   include/exec/cpu-common.h   | 2 +-
> >   accel/tcg/cpu-exec.c        | 4 ++--
> >   bsd-user/main.c             | 4 ++--
> >   linux-user/main.c           | 4 ++--
> >   softmmu/globals.c           | 2 +-
> >   softmmu/runstate-hmp-cmds.c | 4 ++--
> >   softmmu/runstate.c          | 2 +-
> >   softmmu/vl.c                | 2 +-
> >   8 files changed, 12 insertions(+), 12 deletions(-)
> >
> > diff --git a/include/exec/cpu-common.h b/include/exec/cpu-common.h
> > index 6feaa40ca7b..f2592a1967f 100644
> > --- a/include/exec/cpu-common.h
> > +++ b/include/exec/cpu-common.h
> > @@ -163,7 +163,7 @@ int cpu_memory_rw_debug(CPUState *cpu, vaddr addr,
> >                           void *ptr, size_t len, bool is_write);
> >
> >   /* vl.c */
> > -extern int singlestep;
> > +extern int one_insn_per_tb;
>
> IMHO the global variable should completely go away - this should get a
> property of the tcg accel instead.

I agree in principle, but this might be tricky because of the
user-mode emulators. I'll have a look.

-- PMM

