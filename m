Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9759D46BD0D
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Dec 2021 14:57:14 +0100 (CET)
Received: from localhost ([::1]:35510 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1muay1-00017h-NR
	for lists+qemu-devel@lfdr.de; Tue, 07 Dec 2021 08:57:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42674)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1muawf-0007nw-9B
 for qemu-devel@nongnu.org; Tue, 07 Dec 2021 08:55:49 -0500
Received: from [2a00:1450:4864:20::436] (port=36363
 helo=mail-wr1-x436.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1muawd-0002XV-1p
 for qemu-devel@nongnu.org; Tue, 07 Dec 2021 08:55:48 -0500
Received: by mail-wr1-x436.google.com with SMTP id u17so22326238wrt.3
 for <qemu-devel@nongnu.org>; Tue, 07 Dec 2021 05:55:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OmnCqI7AQQEi74h0vSav94J/f/7nc4qjmWkUhokZ68U=;
 b=vDmAlMmlUXVt/iiqAWvt/z7iavoDf+ja1DUC+dx17wuo8kxynZGXm6YEJsJoqxCS4F
 TK920B33aBaC4aF80snEDpO2tty039zx4IaPGaCqqb0Dt4Zj1tS+ywnTcy2mjH1HWEny
 2VVS+E9WDK7O5hDL1oMbawdGTunmf0x+2QjcbYIIaqfEhrYg+3emPivDoukaZLpbHO3i
 Y3l3+Mz3e1FuS0hItLOgu6iEvKCXHgBoQVIOg7g9urQvtteWuZg1yeCOhdJ3WZzVPDVl
 BVjHw+88IlZdFlv/uKR7F8lUM2yHVH0wXgyu4bI04evLhZlhW2pXVnXDHOLnoCaVlL2R
 B38g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OmnCqI7AQQEi74h0vSav94J/f/7nc4qjmWkUhokZ68U=;
 b=5CpSjzez0praIGdjvD+l62+emHTXKgn3LNw9bHB6OPspaVhGtPCpRvSjVFg7AyXnG1
 H+rVHSqhXPncSLSU/IjJdfvi6QfPhz9s+xAFB580jrpP8BFwjqDquADww3HEZpB7aaxQ
 iLERYCmIZMLM5Ym5VeGMl3MOOMeLmZUzqiB8kck0/N4YAWvQ2WwFabUSApSXeH9VmDTb
 KFg0X6J9aBtRu87Ocw4VcnGZONi43QjC4MVBKbHsZyPauvEmwHjBsC6fdkJDOcJwxF/Z
 MhG6JWludruIRkFAbKeggcKnBkNEmm1fqXwIjZ1bD8E8EY4kax0HbH+Gh/aDP9dkptW/
 PP6w==
X-Gm-Message-State: AOAM530gvB3Dcg2A3qT7F6rhyQ6nWBuDfqZke8z6TmCH/7l6oxlfISkV
 EiqDnhbxlhFKikQPlCQSQIHClCHjNdBXPrd8y3MNJg==
X-Google-Smtp-Source: ABdhPJxWxDb8O2AJ5m+kqCAzpnDmFfr3BlCu6yvlyZ9nTwCynQkKsHkxfq2Q0/N8VxSLWOLFKy44U9F7WlEZS2f43pI=
X-Received: by 2002:adf:cf05:: with SMTP id o5mr51439357wrj.325.1638885345790; 
 Tue, 07 Dec 2021 05:55:45 -0800 (PST)
MIME-Version: 1.0
References: <20211206142632.116925-1-stefanha@redhat.com>
 <CAFEAcA9=T-2AxzN1fhrtnu5U_5k7D8TPVjFXOLS_MeOCvR8FNA@mail.gmail.com>
 <Ya9nP63gwsk80POC@stefanha-x1.localdomain>
In-Reply-To: <Ya9nP63gwsk80POC@stefanha-x1.localdomain>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 7 Dec 2021 13:55:34 +0000
Message-ID: <CAFEAcA_PfjwqS=4c=LCzZWbJBiELeBsdQ4QZur5wMtrtu1BFuQ@mail.gmail.com>
Subject: Re: [RFC v3 0/4] tls: add macros for coroutine-safe TLS variables
To: Stefan Hajnoczi <stefanha@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::436
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, fweimer@redhat.com, thuth@redhat.com,
 Daniel Berrange <berrange@redhat.com>, qemu-block@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Kevin Wolf <kwolf@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Warner Losh <imp@bsdimp.com>, sguelton@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 7 Dec 2021 at 13:53, Stefan Hajnoczi <stefanha@redhat.com> wrote:
>
> On Mon, Dec 06, 2021 at 02:34:45PM +0000, Peter Maydell wrote:
> > On Mon, 6 Dec 2021 at 14:33, Stefan Hajnoczi <stefanha@redhat.com> wrote:
> > >
> > > v3:
> > > - Added __attribute__((weak)) to get_ptr_*() [Florian]
> >
> > Do we really need it *only* on get_ptr_*() ? If we need to
> > noinline the other two we probably also should use the same
> > attribute weak to force no optimizations at all.
>
> The weak attribute can't be used on static functions, so I think we need
> a different approach:
>
> In file included from ../util/async.c:35:
> /builds/stefanha/qemu/include/qemu/coroutine-tls.h:201:11: error: weak declaration of 'get_ptr_my_aiocontext' must be public
>      type *get_ptr_##var(void)                                                \
>            ^~~~~~~~
> ../util/async.c:673:1: note: in expansion of macro 'QEMU_DEFINE_STATIC_CO_TLS'
>  QEMU_DEFINE_STATIC_CO_TLS(AioContext *, my_aiocontext)
>  ^~~~~~~~~~~~~~~~~~~~~~~~~
>
> Adding asm volatile("") seems to work though:
> https://godbolt.org/z/3hn8Gh41d

You can see in the clang disassembly there that this isn't
sufficient. The compiler puts in both calls, but it ignores
the return results and always returns "true" from the function.

-- PMM

