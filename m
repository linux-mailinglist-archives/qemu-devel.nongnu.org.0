Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 78177469910
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Dec 2021 15:33:52 +0100 (CET)
Received: from localhost ([::1]:41798 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1muF3v-0004G1-Aq
	for lists+qemu-devel@lfdr.de; Mon, 06 Dec 2021 09:33:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51406)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1muEwv-0006Mb-2X
 for qemu-devel@nongnu.org; Mon, 06 Dec 2021 09:26:39 -0500
Received: from mail-ot1-f45.google.com ([209.85.210.45]:40613)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1muEws-0002ta-8G
 for qemu-devel@nongnu.org; Mon, 06 Dec 2021 09:26:36 -0500
Received: by mail-ot1-f45.google.com with SMTP id
 v15-20020a9d604f000000b0056cdb373b82so13805557otj.7
 for <qemu-devel@nongnu.org>; Mon, 06 Dec 2021 06:26:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=bLDMIkRvRpRW2SxfebCLqbLggZUol+gaML78X1Lxa0c=;
 b=ffN0udjj3EAntv3mMTFgurzKorabqoStUdAJ0uvd1KPfqjvx4eqxFCqxZ2PjOpEqxY
 +8r0WH0HElM645khT2qy2h35oM1f69r5oDvAq3U//AoeK+M3nTVM2+nwNJWivHmagHiB
 N85bpBu5C63wWYEMfk9LPFYYNQ8zIy+eAnsFqihIAxZQX/RPWktYYCSA3BlS+TEgCmep
 JysofYowHZQe61Jl7IJP8RAnJ1/4RqsYsh5/YHmCrQTAqVjwaCxW8SgSgZHP7senR4uZ
 aYelDddl3nIRTF+usxjMxNHg4e9Do6tacmiAI9xQRnIHmqKuUcSQgYqtWEWlEb8QL+Sn
 HLig==
X-Gm-Message-State: AOAM531ZAHZxrxdcdayu1WQcFpHM1XLVQ08Jul2NvkQygYT/jTZEd3dl
 yPuOORNokieFKlEC184xtp5NFKgMx9L6+piyV4RNpujU
X-Google-Smtp-Source: ABdhPJx/iFbDfw1RJb2m7n+DdJDnMGOh62QaA7Vd7UZrrMYb4bpEHQWOU2y/CxR3wYMFxA0AF5ONoJqQh6dHTTa5m3k=
X-Received: by 2002:a9d:6854:: with SMTP id c20mr30421076oto.190.1638800793176; 
 Mon, 06 Dec 2021 06:26:33 -0800 (PST)
MIME-Version: 1.0
References: <20211116210919.2823206-1-f4bug@amsat.org>
 <82134adb-acec-4638-821a-932f413b3ec3@amsat.org>
In-Reply-To: <82134adb-acec-4638-821a-932f413b3ec3@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Date: Mon, 6 Dec 2021 15:26:22 +0100
Message-ID: <CAAdtpL50jXCMFkYL-caWbBFXrWCTEePZeGjb7z1Cqk2qLLj4jA@mail.gmail.com>
Subject: Re: [PATCH] linux-user/hexagon: Use generic target_stat64 structure
To: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=209.85.210.45;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ot1-f45.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Taylor Simpson <tsimpson@quicinc.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Dec 6, 2021 at 3:21 PM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org=
> wrote:
>
> Hi Laurent,
>
> What is your plan for this patch? Technically this is a bugfix.

I see the code was released for 6.0, so not a regression. Probably 7.0
material now.

> On 11/16/21 22:09, Philippe Mathieu-Daud=C3=A9 wrote:
> > Linux Hexagon port doesn't define a specific 'struct stat'
> > but uses the generic one (see Linux commit 6103ec56c65c [*]
> > "asm-generic: add generic ABI headers" which predates the
> > introduction of the Hexagon port).
> >
> > Remove the target specific target_stat (which in fact is the
> > target_stat64 structure but uses incorrect target_long and
> > ABI unsafe long long types) and use the generic target_stat64
> > instead.
> >
> > [*] https://github.com/torvalds/linux/commit/6103ec56c65c3#diff-5f59b07=
b38273b7d6a74193bc81a8cd18928c688276eae20cb10c569de3253ee
> >
> > Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> > ---
> >  linux-user/syscall_defs.h | 28 ++--------------------------
> >  1 file changed, 2 insertions(+), 26 deletions(-)
> >
> > diff --git a/linux-user/syscall_defs.h b/linux-user/syscall_defs.h
> > index a5ce487dcc3..7ab612d163b 100644
> > --- a/linux-user/syscall_defs.h
> > +++ b/linux-user/syscall_defs.h
> > @@ -2129,7 +2129,8 @@ struct target_stat64  {
> >      abi_ulong __unused5;
> >  };
> >
> > -#elif defined(TARGET_OPENRISC) || defined(TARGET_NIOS2) || defined(TAR=
GET_RISCV)
> > +#elif defined(TARGET_OPENRISC) || defined(TARGET_NIOS2) \
> > +        || defined(TARGET_RISCV) || defined(TARGET_HEXAGON)
> >
> >  /* These are the asm-generic versions of the stat and stat64 structure=
s */
> >
> > @@ -2240,31 +2241,6 @@ struct target_stat64 {
> >      uint64_t   st_ino;
> >  };
> >
> > -#elif defined(TARGET_HEXAGON)
> > -
> > -struct target_stat {
> > -    unsigned long long st_dev;
> > -    unsigned long long st_ino;
> > -    unsigned int st_mode;
> > -    unsigned int st_nlink;
> > -    unsigned int st_uid;
> > -    unsigned int st_gid;
> > -    unsigned long long st_rdev;
> > -    target_ulong __pad1;
> > -    long long st_size;
> > -    target_long st_blksize;
> > -    int __pad2;
> > -    long long st_blocks;
> > -
> > -    target_long target_st_atime;
> > -    target_long target_st_atime_nsec;
> > -    target_long target_st_mtime;
> > -    target_long target_st_mtime_nsec;
> > -    target_long target_st_ctime;
> > -    target_long target_st_ctime_nsec;
> > -    int __unused[2];
> > -};
> > -
> >  #else
> >  #error unsupported CPU
> >  #endif
> >

