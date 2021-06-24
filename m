Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9275A3B362B
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Jun 2021 20:53:16 +0200 (CEST)
Received: from localhost ([::1]:55594 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwUTT-0006YH-KA
	for lists+qemu-devel@lfdr.de; Thu, 24 Jun 2021 14:53:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33640)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lwUS3-0005De-I8
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 14:51:47 -0400
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635]:40663)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lwURz-0003tW-Md
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 14:51:47 -0400
Received: by mail-ej1-x635.google.com with SMTP id d16so7600982ejm.7
 for <qemu-devel@nongnu.org>; Thu, 24 Jun 2021 11:51:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=BZcHcAV8pKQK07TAyrQCn2jKnN7sS0Ph+XjLTpHtXeg=;
 b=Pc+4to+mmuF91fchfoY26/6y42/tXKdFsvuapFNu102YNJ8W5XNSANjmprmkQkjus7
 01xB1g07EeVR36gMNHfM7fmBS0z7LXGzBJbZ9OvHQOQJ88tUpAsOm0Ke4TjDQVwPfXpD
 3Irtsg6n32fs1e7md2oNrppE14cPKDTcyUUtJyCusTYiyuYdHlPkvvnA2bgLJD+M8c4u
 c2wP2DTxD0G7bWVEBWDYU0fierm30ZZO9wiiU8yK6Vw6pk7v8fAUHj5GvKk3U6gjKx2a
 2iSARaXSr4rTiEn/U7NKUonqarYwLk2vAyw2NyYfMvXc6hyveZ6z/TNHq5EjzqCKhhTS
 bseQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=BZcHcAV8pKQK07TAyrQCn2jKnN7sS0Ph+XjLTpHtXeg=;
 b=PTvtCDk/mcJX6HH0E/yqOsyvE15rOhxJqyK7Yd4+BvYOu1Ce9IdWDYLLeTb6V0hKyL
 gFrjLxdfa1H23jIWAPg1LwqExxwqlyAyfwk40psGS4wRRRbu9fGw56A+eWkekjHT4+Cj
 0to3KBt285l3tdzUfyDbCztEVgD3+cfwtXDNpCXzG9MHJUE/F6ZlCy35jYii3yLdnGt0
 EfrLGkXx2fBngzRqCmpXXxufLMBjgskkGd7YoTV8bH+VrKNRHpohnsgzRNeTl0TlKP3S
 q2SsTKnUkl1QbbfUD/2GLIxnzipSRc1+jGUHhxFt2KNAwYE//1LnZMqKghoymkY1T3vi
 1dSA==
X-Gm-Message-State: AOAM530cfdBjMkVO7OX8zQ5haU2JdgvmfwHUfwUg2AZdcUqaNpxZWzDR
 RcgWILbq2yN0GX3mjcysp1cQrAYovMlq85zARwiwEA==
X-Google-Smtp-Source: ABdhPJwmFA5VWMwMJp0GpBW51LX99QNZsZ8lrri8PhgWKIztaLpTl3Gn9eUjTcuJGtW98ZPmZXfDzJeobYUwb7AbZYc=
X-Received: by 2002:a17:906:a38d:: with SMTP id
 k13mr6895915ejz.250.1624560701114; 
 Thu, 24 Jun 2021 11:51:41 -0700 (PDT)
MIME-Version: 1.0
References: <CA+5M2MC9q5RTNYh2YTan_g0TMAkNc0YD_Nx0OV7ze4v7dYdP9w@mail.gmail.com>
 <CAFEAcA8eADzVVMVZHaHBC9Lm09aVvC5Wwj-q7nLkKoRUn3vS5A@mail.gmail.com>
 <CA+5M2MDnOEvpmAn3Vhc_crj7prR6pDymTgtkFYgyh1HXJvyddA@mail.gmail.com>
In-Reply-To: <CA+5M2MDnOEvpmAn3Vhc_crj7prR6pDymTgtkFYgyh1HXJvyddA@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 24 Jun 2021 19:51:05 +0100
Message-ID: <CAFEAcA-VVwVvPC0qSWZc0c8evWO9FyBO7FqtjrE=HOK1d0GayQ@mail.gmail.com>
Subject: Re: Extracting PC information from QEMU/KVM during single-step
To: sraasch@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x635.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 24 Jun 2021 at 18:09, Steven Raasch <sraasch@gmail.com> wrote:
> NOTE: I do not yet understand how gdb interacts with the virtual machine.=
 I have experience with GDB, but only at a linux app-debug level. I don't g=
rok how gdb on a linux host works with QEMU running a windows guest.
> My *assumption* is that the VM continues to run while an app is being deb=
ugged with GDB can be stopped, stepped, etc. If this is the case, I would e=
xpect that the VM's sense of time will continue to move forward while the a=
pp is paused. This would be an issue for my time-sensitive app.

No, that's not how it works. A gdb connected to QEMU's gdbstub is a
bit like a hardware JTAG debugger connected to a real CPU, if that
helps. When gdb gets control the entire VM is stopped; stepping
steps one instruction of whatever the VM is doing. gdb and the
gdbstub have no understanding of individual processes running
inside the guest OS -- single stepping will happily step through
the app, into interrupt handlers, across the OS context switching
and into other processes, etc.

-- PMM

