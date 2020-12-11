Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ABBA2D778E
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 15:15:27 +0100 (CET)
Received: from localhost ([::1]:33208 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knjCg-0001aC-H9
	for lists+qemu-devel@lfdr.de; Fri, 11 Dec 2020 09:15:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36590)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1knjA5-0008RH-AN
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 09:12:45 -0500
Received: from mail-ej1-x641.google.com ([2a00:1450:4864:20::641]:38608)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1knjA0-0004ll-QA
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 09:12:45 -0500
Received: by mail-ej1-x641.google.com with SMTP id a16so12524773ejj.5
 for <qemu-devel@nongnu.org>; Fri, 11 Dec 2020 06:12:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=hin4F6m6Q3d9vhybERx7Xp/BFQbKpRH6aW97uNF+4XE=;
 b=EuUWW19GPHr4gvS5Sliirlz2xyOF6UA5gQNoq1yNQYSx97ANRjdO2/EF/OfxNZo6YR
 put+oGenuNV30pL3SZzfcTiJGjk/t7YlvAhIA70YPFK3ulVW6vIz2rH9jO8SE3amiPnG
 kfxfYD5W4JosDkwVxf2yKsdgAnu6+Rj3P0O8lw60rp0qbu4VIqvd2NemSXbxF+h0mpNU
 +iRRHNgjVpTtge8d5DnCKuvXmlZHAZ02s2oJj0aR3+m92QE5zQ3OtY+QWmtMKm/W1uaF
 J3BDbsEchIYsaIPMCnxsQ/9oe4vcL39nqjsI3XnqVmEDaMWIsgFKbf+J9CThD43cJOi1
 DwuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=hin4F6m6Q3d9vhybERx7Xp/BFQbKpRH6aW97uNF+4XE=;
 b=p+K7pY+UBWhF+yXc6VHex1CjcX/JPwH/Je4fduAo1DC2SJPtMNREA6XVb7qq3eux1G
 EXX1LYqeLSrVgG5gklnPk9STiOZBGc0v737jLrf5AgQ/hjjj/5ILt3MgrJSBIo15fG9P
 7q0nVO0nb9mbDah61wtWKbGjb4tU6CS2mi3DYOEkKRc7D3tqDHE0JGv0W3P8Meybe7Np
 1NrL39TngurDw6fV4gpUQNR30VDUkVnoMcNlI4AbCkOFSiFqzL6D5vLfqYq+hQhbGK20
 1B34HygpqT4+vEkbraHB6a+aMCP8i1RQNYVFqM93ep41q7TfGJO3V39Pzj7Ud0pT7VZv
 IXQA==
X-Gm-Message-State: AOAM531Vb7tUdbDEbhcLHW/JUj5oLLAaMTGA/B4dDCcYzjMK5sCURjVV
 yZmCfjt4KcLPUyeXYbWD+3P6SRZi8HN7RXvVof7hVQ==
X-Google-Smtp-Source: ABdhPJw3TLkPKCScCZkLlsCAJqMiZGmhMXVGEGeSCdoSi0/JZRRLXcOGvkjQ+5+oZ4e1wfRBeJiGzI62NTpDBk3MJF0=
X-Received: by 2002:a17:907:971c:: with SMTP id
 jg28mr11113058ejc.85.1607695959263; 
 Fri, 11 Dec 2020 06:12:39 -0800 (PST)
MIME-Version: 1.0
References: <20201121210342.10089-1-peter.maydell@linaro.org>
 <87im9wnqbf.fsf@linaro.org>
In-Reply-To: <87im9wnqbf.fsf@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 11 Dec 2020 14:12:27 +0000
Message-ID: <CAFEAcA-yqaXOkw8dXJdR8dthXfVqKVR4yGR9VVQ3BP5U_Gyg9w@mail.gmail.com>
Subject: Re: [PATCH] gdbstub: Correct misparsing of vCont C/S requests
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::641;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x641.google.com
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
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 23 Nov 2020 at 13:41, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
>
> Peter Maydell <peter.maydell@linaro.org> writes:
>
> > In the vCont packet, two of the command actions (C and S) take an
> > argument specifying the signal to be sent to the process/thread, which =
is
> > sent as an ASCII string of two hex digits which immediately follow the
> > 'C' or 'S' character.
> >
> > Our code for parsing this packet accidentally skipped the first of the
> > two bytes of the signal value, because it started parsing the hex strin=
g
> > at 'p + 1' when the preceding code had already moved past the 'C' or
> > 'S' with "cur_action =3D *p++".
> >
> > This meant that we would only do the right thing for signals below
> > 10, and would misinterpret the rest.  For instance, when the debugger
> > wants to send the process a SIGPROF (27 on x86-64) we mangle this into
> > a SIGSEGV (11).
> >
> > Remove the accidental double increment.
> >
> > Fixes: https://bugs.launchpad.net/qemu/+bug/1773743
> > Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>
> LGTM
>
> Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>
> > ---
> > Haven't really given this enough testing to want to put it into 5.2,
> > I think (though it does fix the repro in the bug report).
> > The bug has been present since commit 544177ad1cfd78 from 2017.
>
> I'd be happy including it. I don't have any gdbstub patches queued at
> the moment but I could put together one if you want or you could just
> include it directly if you are now happy to.

Now that 6.0 has opened up, I'll put this in via target-arm.next
unless you'd prefer to take it.

-- PMM

