Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E12AE58038C
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jul 2022 19:36:14 +0200 (CEST)
Received: from localhost ([::1]:36828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oG205-00006R-Hi
	for lists+qemu-devel@lfdr.de; Mon, 25 Jul 2022 13:36:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39518)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oG1xf-0006pe-T2
 for qemu-devel@nongnu.org; Mon, 25 Jul 2022 13:33:43 -0400
Received: from mail-yw1-x112c.google.com ([2607:f8b0:4864:20::112c]:45739)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oG1xe-0007xY-7v
 for qemu-devel@nongnu.org; Mon, 25 Jul 2022 13:33:43 -0400
Received: by mail-yw1-x112c.google.com with SMTP id
 00721157ae682-31bf3656517so117631687b3.12
 for <qemu-devel@nongnu.org>; Mon, 25 Jul 2022 10:33:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=A1xoBGegcTisYiy1THSfTWd+yEHiiURNCK+A+yv+yjE=;
 b=RD2Tr0fmic6Td50C+gD3eX4hrELbscEbgaPiE8cqmYhLlSmnoBhBY2sGlSjgUAOplC
 cbR8zTB2pf4+rWcHoUQ272ABBv0CgKYImxg3YTr+JzUPP65hCfjSX2tUaUrnHsEaOsx3
 s/JxKIdcBWAP01SPwNXavA+xBucARiOjE+vDMNHqEMi5zbLp4nCwlRllk6CahVEh4WLQ
 jG7f3AjmhRyZPx4QErUtANTnzsyoOQ7/Yg1dldXUWGDdrI4Ms+VmDARwQRLJW296zZuE
 PE9fnM9Lrc1dzG73F9220mzPdovYx7mrOvCsCFfQSbGBOPwWcSe+/Ogb3+cKzeBn+kGy
 Jc6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=A1xoBGegcTisYiy1THSfTWd+yEHiiURNCK+A+yv+yjE=;
 b=3LZ2Ylqpq8rw4dbOkkEuAv52hAOkttZjx05cncH38bPHk48Q5dlayrEOyl8U3JOqmB
 lU8Q5I+G2FqbaCoPIaUHVWjX0ImMaSBD8pCAKqiXUo8W86CTyA0i4Y7nVIDxLMkfanr+
 Ukvw+8utWSlv3k4xh/Fpq4OpJIEBfN3nfXp8t7mmiILDqGLCIYuZfM3PKNBySvimJ/kB
 E18fGfNtXUOQQcS68Tv0faDhCwYEjM6wkQ6Vy6gEyeePeJi+ivc/YXy6MLm+UBK4hmkf
 hWkWpIAdUAkDxzP2zKOvZu3qT1YuN0zKlbR4l8Tu+2EP9uR36PVZZL3paytv6/Pp4qBC
 24pA==
X-Gm-Message-State: AJIora/zAsaKEoajAtgysaAR8lwSyuh4SwXtjUN3nV4tYivBBbmBcpyj
 jHEhb7ILgSkRrwGhn4G2A8gutVxR9L61SCMuZxnNazei+io=
X-Google-Smtp-Source: AGRyM1t7WVzqHD4q+FnTA3Sk5i3MiKqXUtrBIJl2aVrUDXP+8MuCpvozYgT9jz3kF2peof2JdIgHOo6WvSm6Z6oTdjM=
X-Received: by 2002:a81:770a:0:b0:31e:7cd3:f2d0 with SMTP id
 s10-20020a81770a000000b0031e7cd3f2d0mr11059342ywc.347.1658770421324; Mon, 25
 Jul 2022 10:33:41 -0700 (PDT)
MIME-Version: 1.0
References: <8F58FBA7-17C8-44F6-9798-A65FD63E0E78@livius.net>
 <BE36745B-A3A6-443A-A290-31A5578F36E3@livius.net>
 <CAFEAcA_BcnzQ1KnRh=ovKTSahHCabc61n+BHvedqjC0bD2fKOg@mail.gmail.com>
 <4B583095-ED34-4D33-A193-59666FBFAB8A@livius.net>
 <CAFEAcA8BJ+jphWCMNemBC30x+wf3PW2kqSqNz6pCHeD+RyBFeQ@mail.gmail.com>
 <C1F087EA-B319-493F-B7BC-BB94D75B443C@livius.net>
In-Reply-To: <C1F087EA-B319-493F-B7BC-BB94D75B443C@livius.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 25 Jul 2022 18:33:01 +0100
Message-ID: <CAFEAcA8=iDh+QBKnRg2FH6niXo+i0uXi0M_5o8c7Gm33xi3t3g@mail.gmail.com>
Subject: Re: TARGET_SYS_HEAPINFO and Cortex-A15 memory map
To: Liviu Ionescu <ilg@livius.net>
Cc: QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112c;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 25 Jul 2022 at 18:02, Liviu Ionescu <ilg@livius.net> wrote:
> > On 25 Jul 2022, at 19:02, Peter Maydell <peter.maydell@linaro.org> wrote:
> > The one where SYS_HEAPINFO produces the bogus result putting the
> > heap at 0x04000000, that you mentioned in the original report with
> > the command line
> >
> > .../qemu-system-arm "--machine" "virt" "--cpu" "cortex-a15"
> > "--nographic" "-d" "unimp,guest_errors" "--semihosting-config"
> > "enable=on,target=native,arg=sample-test,arg=one,arg=two" -s -S
>
> ah, the bogus one... that's a bit more complicated, since it happened in the early tests, and I don't remember how I did it, it might be that I tried to load my code in flash and my data in ram, but I'm not sure.
>
> try to check the logic and avoid the cases when flash addresses are returned for heap, if possible.

Yeah, that's my plan. I think it'll be a one-line fix. But it'll
be much easier to be sure it works if I have a test case that
triggers the problem. I'll try a setup with code in flash and
data in RAM, that sounds like it might be a way to cause the
problem if there's not much code and a lot of data (because
then the remaining space in the flash is larger than the
remaining space in the RAM.)

> btw, this might be a different topic, but on Cortex-M devices
> I'm used to configure the linker scripts to allocate the text
> in flash and the data+bss in ram; for qemu aarch32/64 devices
> I could not make this work, and I had to allocate everything
> in ram, which is functional, but probably not very accurate
> for some tests, that might fail when running from flash.

I'm not a linker/toolchain expert, I'm afraid. Certainly in
theory it should be possible to have a split text/data setup
on A-profile devices, the same as M-profile ones.

thanks
-- PMM

