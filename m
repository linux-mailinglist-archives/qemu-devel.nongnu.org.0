Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A073367DA7
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Apr 2021 11:26:18 +0200 (CEST)
Received: from localhost ([::1]:50772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZVbF-0001dE-34
	for lists+qemu-devel@lfdr.de; Thu, 22 Apr 2021 05:26:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33184)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lZVX4-0008GM-8a
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 05:21:58 -0400
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530]:33709)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lZVWi-0004oY-Uu
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 05:21:50 -0400
Received: by mail-ed1-x530.google.com with SMTP id cq11so8949565edb.0
 for <qemu-devel@nongnu.org>; Thu, 22 Apr 2021 02:21:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=oTDBjX4XiyghVb3qEdCMT4BhWVgGbXQnMwT2LVEIGfM=;
 b=T4QGFuH4xMc5Msb4F4YsiAITn9XW5V5/eNNGDndRolkmeukDHqwCp7legSQua8DYox
 /wTR+Rz0FMnz2x3e1LXdzVy1xi7YpQJj88u556eY47hCZCbJDBSJ1h6Fqfw5OvJ+J5Sc
 Je75mfBBEuHzOZarnF8k+Ig2B0lfvwdGAamE4uefyxu/FxPCIMGkyc+Veeo7QRWKhhDp
 MOy//gMQtdOrfd2p6DqF4ZLjeR22W0T4QCJyESazUV/VXi7lz2bzYxqjokr64jGCPPqz
 /HxyfWZOWmrgmdPCE5gniySA8eIhxRyGNTFzhCE08WzebO4zD3O4MxNoiDhSYeh3GXDe
 cyjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oTDBjX4XiyghVb3qEdCMT4BhWVgGbXQnMwT2LVEIGfM=;
 b=CiffQ8SeUmh8qpOW1FY+ZUIOWFrBRcU0j8GDbW2vw1TB8Tj/mSlivIeuRWAcfWkDbb
 fIzgEyweVcvEEyHNoaFplGbmk+TchkB6cCNdvFIuU42gr2/7X+Tbyjp9bVqkRxtQ2SOk
 0nqTwyPuZHGvAVdWM3mNi6F09udTVDSCDsmTYvkUG+EsTAzoAE8gxCHSSUZq8EU0qLS0
 fy2LtEfqs2i5G2ABDrMa11hrIgR93DLwX3ng194I0vDbqqo9s3zl6HMKgRVHa7yrBd8n
 KXviu2mtc99hAnbj5h/WCM1hHPccCAoDEHrSNg5GcDrPTGXgUP0kF387Kyhxbum5tr5k
 +Tew==
X-Gm-Message-State: AOAM532M7ahRwc0yK6oecWx7OPPsu+O27YA4vtbWxwxA5bZ5NQS2z6aT
 TDMo881ykdsdYh9b8t9YksHUtQIPnyp/Axo0xxqwJw==
X-Google-Smtp-Source: ABdhPJzKU0uWNUKCUDcHbRN3VLMg+X/y/u89D/jw6hvGsJuAh8X6ZKpGDle72RTsAsvurU6dBIyY+r4zp2jCqAwe1T4=
X-Received: by 2002:a05:6402:51d0:: with SMTP id
 r16mr2611613edd.52.1619083293577; 
 Thu, 22 Apr 2021 02:21:33 -0700 (PDT)
MIME-Version: 1.0
References: <YH98WLDMQ5c0Zf5E@humpty.home.comstyle.com>
 <CAFEAcA995L--csz+fX4MqkSPTPxQ7Nx=q-Lh70bi_zQGoj54mw@mail.gmail.com>
 <1ebc5a66-2763-1379-24e0-774739f2edbe@linaro.org>
In-Reply-To: <1ebc5a66-2763-1379-24e0-774739f2edbe@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 22 Apr 2021 10:20:39 +0100
Message-ID: <CAFEAcA9TaxkByWscOa2WC=o6fXAxaqAUt30CUsmA24jZ6HEYEA@mail.gmail.com>
Subject: Re: [PATCH] tcg/ppc: Fix building with Clang
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x530.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>, Brad Smith <brad@comstyle.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 22 Apr 2021 at 06:18, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 4/21/21 2:03 AM, Peter Maydell wrote:
> >> +/* Clang does not define _CALL_* */
> >> +#if defined(__clang__) && defined(__ELF__) && !defined(_CALL_SYSV)
> >> +#define _CALL_SYSV 1
> >> +#endif
> >
> > This is trying to identify the calling convention used by the OS.
> > That's not purely compiler specific (ie it is not the case that
> > all ELF output from clang is definitely using the calling convention
> > that _CALL_SYSV implies), so settign it purely based on "this is clang
> > producing ELF files" doesn't seem right.
>
> We can get pretty close though.  There are three ppc32 calling conventions:
> AIX, DARWIN, SYSV.  The _CALL_ELF symbol is a 64-bit thing, and AIX itself
> doesn't use ELF.
>
> > I guess if clang doesn't reliably tell us the calling convention
> > maybe we should scrap the use of _CALL_SYSV and _CALL_ELF and
> > use the host OS defines to guess the calling convention ?
>
> No, I'd rely on _CALL_* first, and only fall back to something else if they're
> not present.
>
> I'm thinking something like
>
> #if !defined(_CALL_SYSV) && \
>      !defined(_CALL_DARWIN) && \
>      !defined(_CALL_AIX) && \
>      !defined(_CALL_ELF)
> # if defined(__APPLE__)
> #  define _CALL_DARWIN
> # elif defined(__ELF__) && TCG_TARGET_REG_BITS == 32
> #  define _CALL_SYSV
> # else
> #  error "Unknown ABI"
> # endif
> #endif

Doesn't this also need some case that handles "64bit ppc clang which doesn't
define _CALL_anything" ?

thanks
-- PMM

