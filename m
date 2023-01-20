Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AC426757E5
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Jan 2023 15:59:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIsrJ-0004A3-64; Fri, 20 Jan 2023 09:59:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pIsrG-00049S-G6
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 09:59:10 -0500
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pIsrE-00048l-Q3
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 09:59:10 -0500
Received: by mail-pj1-x102b.google.com with SMTP id
 n20-20020a17090aab9400b00229ca6a4636so8435725pjq.0
 for <qemu-devel@nongnu.org>; Fri, 20 Jan 2023 06:59:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YDKBYwteG91NDk7qv6c8eTy9yJSWUy4FnqfoR671MTI=;
 b=BeYlnLRYcv/JaV545xqF3Bb7MZVDqYUNQ7ukb/Jx7pQhBL+Oc5Y/Z9919la8df4xwV
 crOtpA3fkonfeadStshAybUmJ4vqFNPmYqZBdhfefJiw/UwdjMeL0Z6s6LFqZ3r98KFr
 Sq/EMtiJXch882SQpImyed3c0BqU4cnUpD9NkMysRLKrl1yzHrbtWW4VZofNlz2sc487
 JRm09Jj5aLOm0ip+TIF1C2pcEj76XNRWWMIe4kcdPbAPfDX38sDJT3ovnZw1QPl/8DaX
 k0z3xU1w9fw4EK/zr1yFBl0HhFSzHxVXs7zNcl4p/6SeFKQiEjXaEcSxa45nLYgQsLjT
 6f6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YDKBYwteG91NDk7qv6c8eTy9yJSWUy4FnqfoR671MTI=;
 b=17Nq16mKqJZhlV6ZxZqlU1o8M5d4nTh9dF7cHzy/4uadUspJm3yD4RGlgJMZoMNItM
 4AdHwddjg8PbswUKf9VaXJsvnYtFtpOuEPhtSgXjp1lIf11p9p5+mbhnWOKwBxm559w1
 rVFYV30N6+MsrnEBV9SQHBcEWT7rrvH2X7W3ROxzbYpTQZ7RfrrWCYBNiyOZVGsCa/LA
 Hn4NwENBeyXrvEysReqgDHI9xjXEOq+LRHdez7lNTxG9CDJyx+JC14ICy/9KR2bkFtwJ
 fqUiJP8FHDgzsxrixnbmBWT+wszRGJfp838CyqJs/NyVqzmNAdACxv4HQWUUIeL9LRuP
 Rmag==
X-Gm-Message-State: AFqh2krec67vinuW+LvonozHAFl8ZtLp6d9MXPGi48rG6AwKA7v+1aoq
 asM3BmNcdZ1/q7QHCIgwzf3xRx3yO2bR+pJAsQ2rIw==
X-Google-Smtp-Source: AMrXdXtDX/kvtRbPqG78lT76Ouws2G5w9p5K91q4ZebsrfzSx+4m4FwSw7PYQp+Aj9aOrw8AtipOZxFw+7jazHc8E8s=
X-Received: by 2002:a17:902:f7d6:b0:189:7bfe:1eb5 with SMTP id
 h22-20020a170902f7d600b001897bfe1eb5mr1630825plw.9.1674226747375; Fri, 20 Jan
 2023 06:59:07 -0800 (PST)
MIME-Version: 1.0
References: <20221224151821.464455-1-richard.henderson@linaro.org>
 <20221224151821.464455-5-richard.henderson@linaro.org>
 <CAFEAcA_viCsMxSjcpFtxL+hj-n5TTff0npg1RjOnLUpwGu47DA@mail.gmail.com>
 <87pmbil5rn.fsf@linaro.org>
In-Reply-To: <87pmbil5rn.fsf@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 20 Jan 2023 14:58:55 +0000
Message-ID: <CAFEAcA_8KAWdjRfsDV5hHwS9pmkFQgD+yXurhJEocZ2PS5Xd=w@mail.gmail.com>
Subject: Re: [PATCH 4/4] tests/tcg/multiarch: add vma-pthread.c
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: Richard Henderson <richard.henderson@linaro.org>, iii@linux.ibm.com,
 qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x102b.google.com
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

On Fri, 13 Jan 2023 at 17:10, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
>
> Peter Maydell <peter.maydell@linaro.org> writes:
>
> > On Sat, 24 Dec 2022 at 15:19, Richard Henderson
> > <richard.henderson@linaro.org> wrote:
> >>
> >> From: Ilya Leoshkevich <iii@linux.ibm.com>
> >>
> >> Add a test that locklessly changes and exercises page protection bits
> >> from various threads. This helps catch race conditions in the VMA
> >> handling.
> >>
> >> Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
> >> Message-Id: <20221223120252.513319-1-iii@linux.ibm.com>
> >> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> >
> > I've noticed that this newly added vma-pthread test seems to
> > be flaky. Here's an example from a clang-user job:
> > https://gitlab.com/qemu-project/qemu/-/jobs/3600385176
> >
> > TEST vma-pthread-with-libbb.so on aarch64
> > fail indirect write 0x5500b1eff0 (Bad address)
> > timeout: the monitored command dumped core
> > Aborted
> > make[1]: *** [Makefile:173: run-plugin-vma-pthread-with-libbb.so] Error=
 134
> >
> > and another from a few days earlier:
> > https://gitlab.com/qemu-project/qemu/-/jobs/3572970612
> >
> > TEST vma-pthread-with-libsyscall.so on s390x
> > fail indirect read 0x4000999000 (Bad address)
> > timeout: the monitored command dumped core
> > Aborted
> > make[1]: *** [Makefile:173: run-plugin-vma-pthread-with-libsyscall.so] =
Error 134
> >
> > thanks
> > -- PMM
>
> Interesting those are both with plugins. I wonder if the tsan plugin
> fixes in my latest tree help?

I think this is a failure in the non-plugin case:
https://gitlab.com/qemu-project/qemu/-/jobs/3636082364

-- PMM

