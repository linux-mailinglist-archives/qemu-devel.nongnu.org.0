Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 79B953DDEAB
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Aug 2021 19:38:28 +0200 (CEST)
Received: from localhost ([::1]:54918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAbtT-000666-2m
	for lists+qemu-devel@lfdr.de; Mon, 02 Aug 2021 13:38:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39462)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mAbsH-0005Pc-GF
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 13:37:13 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:41635)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mAbsF-0005Wa-O5
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 13:37:13 -0400
Received: by mail-wr1-x42c.google.com with SMTP id c9so2108776wri.8
 for <qemu-devel@nongnu.org>; Mon, 02 Aug 2021 10:37:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=f70nOleJqO3Qxy5hUVphlkZHY5OGoBlJvgROvyQv1Y0=;
 b=gFDZTBPlLqCE2euNPRc4uVS3u1+lQpiP1byEdcR2hYN8W+TX7lFdsZqZDMUEuojyWY
 l8MWxiZTbR+Tnbb2Nz5HJSFxq612SyOS0QEkrDwpeOYe93UGvRFgTTJTHO3v6eEkDpYI
 1LWNUPzpGx2BhAsgjCO8CG7ZWxujujtJx8DPJfhT9R4Oa+MT53lise7ngIOw87VZHOzf
 db1i87jHwLzYSRYICXI1vfzFQZNcpKM2NLPOqyKEMeuNGu4xH72lVnmEGWAH7k48dmMf
 0pV827GbuplXLksxh9eDjeS2ordWRVD/qB/le74L19CHmrGQdTa4xsjBkB+AsJENxl9M
 b+Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=f70nOleJqO3Qxy5hUVphlkZHY5OGoBlJvgROvyQv1Y0=;
 b=SONuZk2rWwI+iCsSTzfmfMfPxRdLue79unP12aWaF8xMZ++950zPnGaTPokUyuXOFR
 FIK4S8PfZaUgFKlUJeA8/rOjG2wPPEMvQH8cOK2YJL69YjI3Mgp0W1tKnNjGCZ8o0+XA
 aH60e6JPfoiRfC7EG5bCdnGFGM/z/M8STzD+yEjoWRcLcpl2OEyL/cGOyFMgbQhmuJIE
 Mb9EMboaj7lpuDezzeoG8kKx8Ef4j1+0yMjyJ4X9ErWk7h5Lrx4ULIgDNCTNcypHjkb6
 RAw4bgmAo/YokEbDYY/vjoXUPoGQ2l7TwoDBVc/E+36Nrswn1coDBOSs6CqI4IlYclmX
 ltpw==
X-Gm-Message-State: AOAM53082rVP9LjvFAkRfHxAVkeI70evw08YzIe9htXPfrUOTwstWVR0
 G/2AC12q2h8BzIbMl8WPbCbN1g==
X-Google-Smtp-Source: ABdhPJyVBew0iKJsGBTghFE2sSgzQiERnqZYsnukSLs/igogPS1lCZuPRo7zD1Sfac7F3ofV5r8wFg==
X-Received: by 2002:adf:efc4:: with SMTP id i4mr19227265wrp.53.1627925829748; 
 Mon, 02 Aug 2021 10:37:09 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id i29sm10808425wmb.20.2021.08.02.10.37.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Aug 2021 10:37:09 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 7673F1FF96;
 Mon,  2 Aug 2021 18:37:08 +0100 (BST)
References: <CAGu1Vjjot17roFD-YTWmQcDhhMD=Lzi3b3Q51cHNRnz+6JT_HQ@mail.gmail.com>
 <CAFEAcA9QexXsrXMHMQrS-aGNbA_4_G2CB+9KeRJqMEF5LQ84ig@mail.gmail.com>
User-agent: mu4e 1.6.1; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: QEMU on x64
Date: Mon, 02 Aug 2021 18:27:57 +0100
In-reply-to: <CAFEAcA9QexXsrXMHMQrS-aGNbA_4_G2CB+9KeRJqMEF5LQ84ig@mail.gmail.com>
Message-ID: <87zgtzg33v.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42c.google.com
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
Cc: Christopher Caulfield <ctcaulfield@gmail.com>, alexsmendez@live.com,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Peter Maydell <peter.maydell@linaro.org> writes:

> On Fri, 30 Jul 2021 at 19:05, Christopher Caulfield
> <ctcaulfield@gmail.com> wrote:
>> This is Christopher from the debugging experiences team at Microsoft foc=
used on kernel debugging. I am reaching out with a few questions about QEMU=
 on x64.
>>
>> Is it possible for the QEMU-x86-64 GDB Server to send the full set
>> of x64 system registers (whether they are included in a separated
>> system xml file or as part of the core registers xml file)?
>
> Do you mean "is it possible for somebody to write code for
> QEMU to make it do that", or "does QEMU do it today if you pass
> it the right command line option" ? The answer to the former
> is "yes", to the latter "no". (If you want the debugger to
> be able to write to the system registers this might be a little
> trickier, mostly in terms of "auditing the code to make sure this
> can't confuse QEMU if you change some sysreg under its feet.".)
>
>> e.g. System registers missing from i386-64bit.xml file
>
>> DWORD64 IDTBase;
>> DWORD64 IDTLimit;
>> DWORD64 GDTBase;
>> DWORD64 GDTLimit;
>> DWORD SelLDT;
>> SEG64_DESC_INFO SegLDT;
>> DWORD SelTSS;
>> SEG64_DESC_INFO SegTSS;
>>
>> How can I access x64 MSR registers by using the QEMU-x86-64 GDB server?
>>
>> #define MSR_EFER 0xc0000080 // extended function enable register
>
> EFER is in the xml ("x64_efer") so should be already accessible.
> For anything else you're going to need to write some code to
> make it happen.
>
>>is there any plan to support reading/writing to MSRs via QEMU-x86-64
>GDB server?

Not at the moment but I am keen to see any eventual solution try to be
generic rather than hardwired for one architecture. The ARM code
currently builds custom XML from it's register descriptors to expose
it's MSR registers to the gdbstub. Ideally architecture front ends
should register their registers with a new subsystem which can then do
the glue between gdbstub as well as other systems that also care about
register values (logging, HMP, TCG plugins).

That said I'm not going to block any patches that just fix up the
current XML and target/i386/gdbstub code. I'm not familiar enough with
what the internal register representation state is for x86 w.r.t to TCG
and hypervisor based running modes.

> Not that I know of. We'd be happy to review patches if you want to
> write them.
>
> thanks
> -- PMM


--=20
Alex Benn=C3=A9e

