Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EF733B371B
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Jun 2021 21:38:31 +0200 (CEST)
Received: from localhost ([::1]:58988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwVBF-0004hi-LU
	for lists+qemu-devel@lfdr.de; Thu, 24 Jun 2021 15:38:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42482)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sraasch@gmail.com>) id 1lwV9g-00041c-EK
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 15:36:52 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:33709)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sraasch@gmail.com>) id 1lwV9e-0006Qw-OD
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 15:36:52 -0400
Received: by mail-wr1-x432.google.com with SMTP id d11so7988943wrm.0
 for <qemu-devel@nongnu.org>; Thu, 24 Jun 2021 12:36:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:reply-to:from:date:message-id
 :subject:to:cc;
 bh=L35NkCW5mTgfUeGVE/lgXCa7QJjD7yZWm4SISOet7os=;
 b=QBHgsH3Vdt3JufzYyRjORS+3bHbN8eAqUiFBE1TwHm8mqd3T/KPTw08aVkFEqR479f
 S1mAz3SFsQBLSi2kYS0wF+ztRUeF/HwyXFJhcSuHUKJLfMIEkw3eGt3X9eOGPh13Y7Ga
 P0EAzFFSJuc6VPTvebQ9BS8H60AiUdoTY2f4G2gHclIYBqKutxbVmbiz4N2PA37Eo8g/
 Us2kGE57K8G61OhiX1jLOA2lIcimG5VDbLDQPYt7tXqUNPoZ3+4udUrugjdZ3wdXyr+G
 OUho9KIslyL95catbMrsdxg1wRVHnk5X3X2YNAQAJN9A5tb1fZPSPymjQR46ow7JAZut
 Lczw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
 :from:date:message-id:subject:to:cc;
 bh=L35NkCW5mTgfUeGVE/lgXCa7QJjD7yZWm4SISOet7os=;
 b=BvpQcbxop9Yg5o6MQyb3knqlaeOFdgh0e9RF9+UIqeyxCz55WgTdh+Fn/ozQAkHaHm
 a/nfaKh9aBxbB6XZImOtmB/LSO/1eAVsBYKWjeYoYyC04XQMPa2lR5SEsade/a6edNWD
 EEeu1eXXF38iOxo5hVXStQanhbsJzC3TZUFKC1a0wOm3WdhQxdV2L9QN8smtb/ilU1if
 r2Zx/FRq2Z9tTRg4/wIcIJEMWup2ISY2PRnkd5gOY1KX/CXMewEG2QxSA25flxhlJ2GS
 qj+EJ4qwQoP8o2yUth8cVOuIMc6Qz60yN9+cvyV0990nAo95kaptqCc9SYaPXhh5aF1p
 6Ryw==
X-Gm-Message-State: AOAM530VQUBeX+0AhD1WZzKhI/SCqvDpZtNS6lpE4XiXHgU3gbxN8Rfw
 Wt/Bp6ltDDUUYJu2tJP76kR3qHHi+NWb8xFlKHM=
X-Google-Smtp-Source: ABdhPJyubnFY92ZzsgNkYNXOqmEWLGfJ5dOG8enztIM3Ca215KZY1wV9GrLUHlOC7e5tarFPppst44+c90OWLza4sBE=
X-Received: by 2002:adf:ef8b:: with SMTP id d11mr6212626wro.276.1624563408534; 
 Thu, 24 Jun 2021 12:36:48 -0700 (PDT)
MIME-Version: 1.0
References: <CA+5M2MC9q5RTNYh2YTan_g0TMAkNc0YD_Nx0OV7ze4v7dYdP9w@mail.gmail.com>
 <CAFEAcA8eADzVVMVZHaHBC9Lm09aVvC5Wwj-q7nLkKoRUn3vS5A@mail.gmail.com>
 <CA+5M2MDnOEvpmAn3Vhc_crj7prR6pDymTgtkFYgyh1HXJvyddA@mail.gmail.com>
 <CAFEAcA-VVwVvPC0qSWZc0c8evWO9FyBO7FqtjrE=HOK1d0GayQ@mail.gmail.com>
In-Reply-To: <CAFEAcA-VVwVvPC0qSWZc0c8evWO9FyBO7FqtjrE=HOK1d0GayQ@mail.gmail.com>
From: Steven Raasch <sraasch@gmail.com>
Date: Thu, 24 Jun 2021 14:36:32 -0500
Message-ID: <CA+5M2MChKqjHEYEb2dD1B=BtxYr0vSVSDu=GpyDb=7M6+g5h6A@mail.gmail.com>
Subject: Re: Extracting PC information from QEMU/KVM during single-step
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: multipart/alternative; boundary="000000000000e17fa705c5882457"
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=sraasch@gmail.com; helo=mail-wr1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Reply-To: sraasch@gmail.com
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000e17fa705c5882457
Content-Type: text/plain; charset="UTF-8"

Peter -

Thanks for the clarification, that makes perfect sense.

In this case, using GDB is clearly the best way to go about the tracing.

I appreciate your time!

-S

On Thu, Jun 24, 2021 at 1:51 PM Peter Maydell <peter.maydell@linaro.org>
wrote:

> On Thu, 24 Jun 2021 at 18:09, Steven Raasch <sraasch@gmail.com> wrote:
> > NOTE: I do not yet understand how gdb interacts with the virtual
> machine. I have experience with GDB, but only at a linux app-debug level. I
> don't grok how gdb on a linux host works with QEMU running a windows guest.
> > My *assumption* is that the VM continues to run while an app is being
> debugged with GDB can be stopped, stepped, etc. If this is the case, I
> would expect that the VM's sense of time will continue to move forward
> while the app is paused. This would be an issue for my time-sensitive app.
>
> No, that's not how it works. A gdb connected to QEMU's gdbstub is a
> bit like a hardware JTAG debugger connected to a real CPU, if that
> helps. When gdb gets control the entire VM is stopped; stepping
> steps one instruction of whatever the VM is doing. gdb and the
> gdbstub have no understanding of individual processes running
> inside the guest OS -- single stepping will happily step through
> the app, into interrupt handlers, across the OS context switching
> and into other processes, etc.
>
> -- PMM
>

--000000000000e17fa705c5882457
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Peter -<div><br></div><div>Thanks for the clarification, t=
hat makes perfect sense.</div><div><br></div><div>In this case, using GDB i=
s clearly the best way to go about the tracing.</div><div><br></div><div>I =
appreciate your time!</div><div><br></div><div>-S</div></div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Jun 24, 2021=
 at 1:51 PM Peter Maydell &lt;<a href=3D"mailto:peter.maydell@linaro.org">p=
eter.maydell@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex">On Thu, 24 Jun 2021 at 18:09, Steven Raasch &lt;<a h=
ref=3D"mailto:sraasch@gmail.com" target=3D"_blank">sraasch@gmail.com</a>&gt=
; wrote:<br>
&gt; NOTE: I do not yet understand how gdb interacts with the virtual machi=
ne. I have experience with GDB, but only at a linux app-debug level. I don&=
#39;t grok how gdb on a linux host works with QEMU running a windows guest.=
<br>
&gt; My *assumption* is that the VM continues to run while an app is being =
debugged with GDB can be stopped, stepped, etc. If this is the case, I woul=
d expect that the VM&#39;s sense of time will continue to move forward whil=
e the app is paused. This would be an issue for my time-sensitive app.<br>
<br>
No, that&#39;s not how it works. A gdb connected to QEMU&#39;s gdbstub is a=
<br>
bit like a hardware JTAG debugger connected to a real CPU, if that<br>
helps. When gdb gets control the entire VM is stopped; stepping<br>
steps one instruction of whatever the VM is doing. gdb and the<br>
gdbstub have no understanding of individual processes running<br>
inside the guest OS -- single stepping will happily step through<br>
the app, into interrupt handlers, across the OS context switching<br>
and into other processes, etc.<br>
<br>
-- PMM<br>
</blockquote></div>

--000000000000e17fa705c5882457--

