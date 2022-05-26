Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D9F71534CFB
	for <lists+qemu-devel@lfdr.de>; Thu, 26 May 2022 12:08:06 +0200 (CEST)
Received: from localhost ([::1]:42842 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nuAPU-0007yq-LN
	for lists+qemu-devel@lfdr.de; Thu, 26 May 2022 06:08:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47758)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nuAJl-0005Kb-FZ
 for qemu-devel@nongnu.org; Thu, 26 May 2022 06:02:11 -0400
Received: from mail-yw1-x1133.google.com ([2607:f8b0:4864:20::1133]:33807)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nuAJj-0000Ll-UV
 for qemu-devel@nongnu.org; Thu, 26 May 2022 06:02:09 -0400
Received: by mail-yw1-x1133.google.com with SMTP id
 00721157ae682-30026b1124bso10475947b3.1
 for <qemu-devel@nongnu.org>; Thu, 26 May 2022 03:02:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8L/z7+JdzQwrECg3wQ2ussJWeybxgaviJDeK56nxHfw=;
 b=bh/0pqm9QL3pWHAnf1E6LS5npkudK5K9hc46GY0J9TnmRiVLc0sUS7XI9rAl26cQRW
 u8GLoPnsZ4FYIZWqlkK3qk2tLaXIy+z7maL/voMa2FDii4hevHIPYVsCrndmUX/+fXH9
 WVJh4NUk8VuTir2eD3Azq+K0R0F+MxbqJ0sKpVgBLBZ8y9Z+hk9j6ryNbA5uAsSUgcnP
 /Nh6mFGqyAecTlYs5DHnSC7Q8hkVTWjObFvb9mbwPQ1p4gfUB7H26d4lxWxRKl1YoKvk
 wNkEHh++zEvOhBKRY7rSD2gEVesPryCpZqHLh1fOtqRvcMdZtWnY3L5ylZECuTjRHiP4
 IrBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8L/z7+JdzQwrECg3wQ2ussJWeybxgaviJDeK56nxHfw=;
 b=tNnlA3huuiupCPQbdHxtSQv3a0rBQo8TE6XGok5u4MhMTbUIvSKfn3ISjDKIQfYG3x
 PMSEH4qfXSlUWlxlGSCSCiYDjwFLDHp7gNIF0gJCVoOgu6PQ4NUl9yLCg4aHbMg+bM6H
 H84vPph+vizDI6xpa1UxeKs+hddpUK+7iFO6HRlqMqCD/p7x2SHT0P+Ft2eIcddv7Q3k
 BynH1kABWBLf6lfiRNqFXB4rMo4cvtm13dTNbSNBS74gty47MUQnkZCwjOtUjUrWey/F
 +N8KrVVjeDxRPE/82218wA3KbE2/wJGXm291LanZkx0yI9c2nNPQ+L1WGXoaW88egAyg
 beyA==
X-Gm-Message-State: AOAM5307s7oMoDPlIKG3RmoSKPGZZ0JtkXPsjuvqXJ6CgkVSp0lJVxmB
 nQ70qV3OC0m70U3RfhED4l8r+jpFwUyh+fhvMO2jAqB5NWYKHg==
X-Google-Smtp-Source: ABdhPJwt94SSs72wt2zIYkV3t6eU28uGsCb2qIgAXHSjjjVuB/a5T7xsU5DEA4CWWbwjWwIBVNmLSFed1924Frzbjzg=
X-Received: by 2002:a81:106:0:b0:2d0:e682:8a7a with SMTP id
 6-20020a810106000000b002d0e6828a7amr38488061ywb.257.1653559326634; Thu, 26
 May 2022 03:02:06 -0700 (PDT)
MIME-Version: 1.0
References: <AADD58D2-C3BE-40DF-8EE5-3A901F4F8F04@livius.net>
 <CAFEAcA-n4GMq1_SCdTDp6sQmHzyyzTk5hav4QqOY3-j3Sr86Jg@mail.gmail.com>
 <EA9AEE55-A416-4819-98FF-E51B2317390F@livius.net>
In-Reply-To: <EA9AEE55-A416-4819-98FF-E51B2317390F@livius.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 26 May 2022 11:01:55 +0100
Message-ID: <CAFEAcA_beHgi7pg+ByW4ufG5qfz5n7o4ZP22WuayTtdGSQ_EQQ@mail.gmail.com>
Subject: Re: AArch64 semihosting?
To: Liviu Ionescu <ilg@livius.net>
Cc: QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1133;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1133.google.com
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

On Thu, 26 May 2022 at 09:32, Liviu Ionescu <ilg@livius.net> wrote:
> > On 26 May 2022, at 11:20, Peter Maydell <peter.maydell@linaro.org> wrote:
> >
> > ... can you provide us with
> > a reproduce case (eg the binary you used here)?
>
> Sure. I'll try to attach it to this message, it is only 64K.
>
> The command I used to run the test is in the previous message.
>
> Please confirm that you get the same behaviour on your machine.

Yes, I can reproduce this. What seems to be happening is that
QEMU decides to do semihosting via gdb, but then crashes because
gdbserver_state.c_cpu is NULL (which in turn is probably because
there is no GDB connected). This is strange given the 'target=native'
in the command line. I'll investigate further...

Did you intend to pass '-s' (allow gdbstub connection) but not
'-S' (wait on startup for gdb to connect and say "continue"),
by the way?

-- PMM

