Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA0F3309668
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Jan 2021 16:56:54 +0100 (CET)
Received: from localhost ([::1]:37924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5scH-0004df-BU
	for lists+qemu-devel@lfdr.de; Sat, 30 Jan 2021 10:56:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48454)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iris@modwiz.com>) id 1l5saW-0003oS-Gt
 for qemu-devel@nongnu.org; Sat, 30 Jan 2021 10:55:04 -0500
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b]:35057)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <iris@modwiz.com>) id 1l5saU-0006rS-EL
 for qemu-devel@nongnu.org; Sat, 30 Jan 2021 10:55:04 -0500
Received: by mail-ej1-x62b.google.com with SMTP id ox12so17567111ejb.2
 for <qemu-devel@nongnu.org>; Sat, 30 Jan 2021 07:55:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=modwiz-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5sB/0vt17zWySnPJQH2SFG/pvsoxDH/WZi3mPp7kvno=;
 b=RdJ9e4AVba4ol0FjunS/iN79ew39gJ9A+G0QIuMOSUPPRKyQDCc6W5Dj+FfY41pswe
 +yJ0cTc8GwgjW+yyIRZaIaM9fANT3G9z8weweYY+hutHuoSOWzkG7NjszBsgyFKCAL+p
 3yl8Y4oeft2uEkEo3ct3i6KcauDjyiAGHg3eDb/KjeqzDT82eS4OAmRhZckSuy6UETUk
 3owKTM9Xivm4Ce3R7UUNxGyjlcrsBzRevdqOQVZg7rPLeKw12vKw5F1zcIeyDWbOh9sX
 Sk9MnLvRCVKazGrpNgt0+evx/PVhx2exMjmhIFC8VIf1axvN6MHZIKhpX+2rrX2CnPbS
 MxOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5sB/0vt17zWySnPJQH2SFG/pvsoxDH/WZi3mPp7kvno=;
 b=AxxGZUUwCtc4alnvU0KEm2EeiHW4cJcDnacdvS8xXaC1LBmwQZ1X32rVUFNVccesH2
 47UNFbcb6mRP7AvDiBo3Np8XZdjc7acVyW6TRH/V+zSrRc2WZkRSj+zwPvuD5on2x7FG
 WH92vYBFB8MCDcySODfCwIQ70AWeKvRuYr0Sro88MJ7gS2fdoKMFNRTfTIhhSIH40gRM
 A3Y1WjIvxazyPpR9Qf6dag2I6Gesdj//uUozaOHhD/NkFWQdHBJknol+Pk4id9FRrPGg
 g84OWRJ5PFvX3CoIRNsFuvu8raUtpQO4M3afEta4aL4s2sLIdi8SwK61SXZLGgbPSS1V
 k/lQ==
X-Gm-Message-State: AOAM530LIJWnqorMAnR3qTaQ663hm0TCzQzMlWcq/h+PxmNSrX7o2JXC
 nVMZ3P8pydkw9TfemJ9GtNc1HwQGO/fr2xFYINj5gg==
X-Google-Smtp-Source: ABdhPJyDX97PevDeoKo47gUH+ejmuw6K+O9n3r6n4kB/4WO8MIj4jgblH5kC3PyHRPASTGN3pAS6ZI1IcpooNc9ggps=
X-Received: by 2002:a17:907:2da0:: with SMTP id
 gt32mr2137013ejc.78.1612022100316; 
 Sat, 30 Jan 2021 07:55:00 -0800 (PST)
MIME-Version: 1.0
References: <20210129195631.1577922-1-iris@modwiz.com>
 <CAJ+F1C+KgEqoNXP8mD=Ebbk=gZRHYOccYr_pxQs+HwyKcA6R+Q@mail.gmail.com>
In-Reply-To: <CAJ+F1C+KgEqoNXP8mD=Ebbk=gZRHYOccYr_pxQs+HwyKcA6R+Q@mail.gmail.com>
From: Iris Johnson <iris@modwiz.com>
Date: Sat, 30 Jan 2021 09:54:49 -0600
Message-ID: <CAN6Exg2gm935eoHcLvwMLZ3qd7LSXhx8YzYhXNBQG4r80guO_w@mail.gmail.com>
Subject: Re: [PATCH] chardev/char-io: Fix polling by not removing polls when
 buffers are full
To: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Content-Type: multipart/alternative; boundary="000000000000a8e75905ba2024d3"
Received-SPF: none client-ip=2a00:1450:4864:20::62b;
 envelope-from=iris@modwiz.com; helo=mail-ej1-x62b.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000a8e75905ba2024d3
Content-Type: text/plain; charset="UTF-8"

>
> > I don't think this works well enough: if the source isn't removed, but

> fd_can_read() returns 0, there is a potential busy loop on the next
> > fd_read().
>

This shouldn't happen. The sources all get set to non-blocking mode, the
only
blocking code is the poll itself. If fd_can_read() returns 0, then the next
time
fd_read() is called, it will attempt to read zero bytes. The backend logic
checks the
results of the same method that fd_can_read() calls and sets its read size
to that amount, in the case of a full buffer it will read 0 bytes and
return.

> My understanding is that if data is read from the frontend, the loop
> > will be re-entered and io_watch_poll_prepare will set the callback
> > again.
>

This just doesn't happen. The issue is that between the poll being added
(and
some but not all data being read) and the frontend code getting triggered by
the guest, the IO loop runs again and the poll is removed, it then runs
again
with the poll removed (since the poll is removed during setup) and it's now
just going to block because the input fd in question has been "temporarily
removed". Except that nothing in the fd set it polls on is now connected to
the guest clearing the buffer.

Meanwhile the guest reads the data during what can be a potentially
infinite block (if nothing else sets the timeout, in my case something
in the uart peripheral sets a 1000ms timeout so I could read a byte
every second or so in the guest). The guest will now be spinning until
the poll is re-added, meanwhile the poll is blocking on a timeout or another
fd becoming ready because the buffers are small, the fd in question has
already been removed from the set by the time the guest has a chance
to clear the buffer.


> > Could you provide a simple use-case or reproducer where we can
> > evaluate how your patch improves the situation?


I can do this, but I don't have anything ready immediately, my test case
isn't
ideal for others to reproduce. But I can attach one later today when I have
that done.

Thanks,
Iris Johnson

--000000000000a8e75905ba2024d3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">&gt; I don&#39;t think this works well enough: if the so=
urce isn&#39;t removed, but</blockquote><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex">&gt; fd_can_read() returns 0, there is a potential busy loop=
 on the next<br>&gt; fd_read().<br></blockquote><div>=C2=A0</div><div>This =
shouldn&#39;t happen. The sources all get set to non-blocking mode, the onl=
y=C2=A0</div><div>blocking code is the poll itself. If fd_can_read() return=
s 0, then the next time</div><div>fd_read() is called, it will attempt to r=
ead zero bytes. The backend=C2=A0logic checks the</div><div>results of the =
same method that fd_can_read() calls and sets its read size</div><div>to th=
at amount, in the case of a full buffer it will read 0 bytes and return.</d=
iv><div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">&gt; My=
 understanding is that if data is read from the frontend, the loop<br>&gt; =
will be re-entered and io_watch_poll_prepare will set the callback<br>&gt; =
again.<br></blockquote><div><br></div><div>This just doesn&#39;t happen. Th=
e issue is that between the poll being added (and</div><div>some but not al=
l data being read) and the frontend code getting triggered by</div><div>the=
 guest, the IO loop runs again and the poll is removed, it then runs again<=
/div><div>with the poll removed (since the poll is removed during setup) an=
d it&#39;s now</div><div>just going to block because the input fd in questi=
on has been &quot;temporarily</div><div>removed&quot;. Except that nothing =
in the fd set it polls on is now connected to</div><div>the guest clearing =
the buffer.</div><div><br></div><div>Meanwhile the guest reads the data dur=
ing what can be a potentially=C2=A0=C2=A0</div><div>infinite block (if noth=
ing else sets the timeout, in my case something</div><div>in the uart perip=
heral sets a 1000ms timeout so I could read a byte</div><div>every second o=
r so in the guest). The guest will now be spinning until</div><div>the poll=
 is re-added, meanwhile the poll is blocking on a timeout or another</div><=
div>fd becoming ready because the buffers are small, the fd in question has=
</div><div>already been removed from the set by the time the guest has a ch=
ance</div><div>to clear the buffer.</div><div>=C2=A0</div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">&gt; Could you provide a simple use-case o=
r reproducer where we can<br>&gt; evaluate how your patch improves the situ=
ation?</blockquote><div>=C2=A0</div><div>I can do this, but I don&#39;t hav=
e anything ready immediately, my test case isn&#39;t</div><div>ideal for ot=
hers to reproduce. But I can attach one later today when I have that done.<=
/div><div><br></div><div>Thanks,</div><div>Iris Johnson</div></div></div>

--000000000000a8e75905ba2024d3--

