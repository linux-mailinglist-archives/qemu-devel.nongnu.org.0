Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA5092D7A01
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 16:56:13 +0100 (CET)
Received: from localhost ([::1]:36392 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knkmC-0004mw-OO
	for lists+qemu-devel@lfdr.de; Fri, 11 Dec 2020 10:56:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59642)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1knkf7-0004Ux-2W
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 10:48:55 -0500
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:40634)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1knkey-0005pq-DH
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 10:48:50 -0500
Received: by mail-wm1-x343.google.com with SMTP id a3so9017475wmb.5
 for <qemu-devel@nongnu.org>; Fri, 11 Dec 2020 07:48:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=8RIsO2yB9uXnTGe/ocHgJifqRZ7EkQXsQpkcY6epmnY=;
 b=WnJ90AKY17zRCD1eblJkXhKI6oLmTd4VsD/58xREf02IGd/S2qyrjk1k7wCaXzWT6K
 +EtY/B6F6vL1oxrlygH4zssty2FUCUA9m1q2xf7zQuOh4Nvfh/cV5GQRPsASujRoJzxj
 7TjDwlei7CRuTeqHt6f6kFuDGnB1cB8W2EgCTG3MeydCLSikWDhlU4b+WyNtrzpAYHYQ
 LgCMDcXtRKS44p2vG/aO4y56PoFYn7BieBX0Xqo8SA6XQYvxl71FO4llMT4yNvHPAu6F
 4ujdkU5fWPEAm++LPSXmeZYnThWOUQgSR/ZY4Kt2Zb+a0B7i2P14AdUmHvXLGpaSniZH
 Pzww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=8RIsO2yB9uXnTGe/ocHgJifqRZ7EkQXsQpkcY6epmnY=;
 b=HElvq5KiD9YehUUIxJjZt+Lb43Ej76/Z7Z53xaW+SQJD6WTOW98JSs2RrpLDz+C8sH
 ZhzPg9BxhDOUSzAnHPdeM2yDgpdub+c/cpMkYQSX1aZBOkL0wnU4NRkNJ1wE7LVJ0uO7
 XJNsWWmu11zxonWAv0pyzJqk/8zj7L4sNfT8mr6Np504mQvwuoy/4sPmmTRk3LBFeMsE
 NURT7bzvTlM/He/e8m70map/jeN53X78OLZIWSrEXUJcWQewznDUXXu5UfQkB+UBlQ4U
 sGvD3guDbsSsIYXgx7Jr7WU76eBGxwFieUj+rJ8KXEFAnFkOpj3Qv3+5gRy1foCU9Kyk
 GNjQ==
X-Gm-Message-State: AOAM531AlhKsjskbejcWfIsTbr2Y/c52Iu1KUVnIX9wCg2GoXbcd1OpV
 wmIzObA0Mtmse1ag8dvNTD93Xg==
X-Google-Smtp-Source: ABdhPJwWtkc9DPVnKnQkvK6vGfqB7/xvTExh51kXs20jwupyazjkf3+mu2iU/9fxiD/+HvzQntFOJQ==
X-Received: by 2002:a7b:c208:: with SMTP id x8mr14265607wmi.179.1607701722887; 
 Fri, 11 Dec 2020 07:48:42 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id y2sm14715825wma.6.2020.12.11.07.48.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Dec 2020 07:48:41 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 0311D1FF7E;
 Fri, 11 Dec 2020 15:48:41 +0000 (GMT)
References: <20201121210342.10089-1-peter.maydell@linaro.org>
 <87im9wnqbf.fsf@linaro.org>
 <CAFEAcA-yqaXOkw8dXJdR8dthXfVqKVR4yGR9VVQ3BP5U_Gyg9w@mail.gmail.com>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH] gdbstub: Correct misparsing of vCont C/S requests
Date: Fri, 11 Dec 2020 15:48:28 +0000
In-reply-to: <CAFEAcA-yqaXOkw8dXJdR8dthXfVqKVR4yGR9VVQ3BP5U_Gyg9w@mail.gmail.com>
Message-ID: <87r1nwbaxz.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::343;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x343.google.com
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
Cc: Philippe =?utf-8?Q?Mathieu-Da?= =?utf-8?Q?ud=C3=A9?= <philmd@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Peter Maydell <peter.maydell@linaro.org> writes:

> On Mon, 23 Nov 2020 at 13:41, Alex Benn=C3=A9e <alex.bennee@linaro.org> w=
rote:
>>
>>
>> Peter Maydell <peter.maydell@linaro.org> writes:
>>
>> > In the vCont packet, two of the command actions (C and S) take an
>> > argument specifying the signal to be sent to the process/thread, which=
 is
>> > sent as an ASCII string of two hex digits which immediately follow the
>> > 'C' or 'S' character.
>> >
>> > Our code for parsing this packet accidentally skipped the first of the
>> > two bytes of the signal value, because it started parsing the hex stri=
ng
>> > at 'p + 1' when the preceding code had already moved past the 'C' or
>> > 'S' with "cur_action =3D *p++".
>> >
>> > This meant that we would only do the right thing for signals below
>> > 10, and would misinterpret the rest.  For instance, when the debugger
>> > wants to send the process a SIGPROF (27 on x86-64) we mangle this into
>> > a SIGSEGV (11).
>> >
>> > Remove the accidental double increment.
>> >
>> > Fixes: https://bugs.launchpad.net/qemu/+bug/1773743
>> > Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>>
>> LGTM
>>
>> Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>>
>> > ---
>> > Haven't really given this enough testing to want to put it into 5.2,
>> > I think (though it does fix the repro in the bug report).
>> > The bug has been present since commit 544177ad1cfd78 from 2017.
>>
>> I'd be happy including it. I don't have any gdbstub patches queued at
>> the moment but I could put together one if you want or you could just
>> include it directly if you are now happy to.
>
> Now that 6.0 has opened up, I'll put this in via target-arm.next
> unless you'd prefer to take it.

Go for it, I have nothing else at the moment.

>
> -- PMM


--=20
Alex Benn=C3=A9e

