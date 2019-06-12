Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D5172423AF
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Jun 2019 13:14:30 +0200 (CEST)
Received: from localhost ([::1]:58868 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hb1D4-0004CG-1s
	for lists+qemu-devel@lfdr.de; Wed, 12 Jun 2019 07:14:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58877)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <peter.maydell@linaro.org>) id 1hb0oR-0003ZI-Jt
 for qemu-devel@nongnu.org; Wed, 12 Jun 2019 06:49:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1hb0oP-0002vt-R5
 for qemu-devel@nongnu.org; Wed, 12 Jun 2019 06:49:03 -0400
Received: from mail-ot1-x331.google.com ([2607:f8b0:4864:20::331]:38741)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1hb0oP-0002uh-Fl
 for qemu-devel@nongnu.org; Wed, 12 Jun 2019 06:49:01 -0400
Received: by mail-ot1-x331.google.com with SMTP id d17so14947849oth.5
 for <qemu-devel@nongnu.org>; Wed, 12 Jun 2019 03:48:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jxX2YZtpvu36ZO7ZkTbylKEVyTGVuHsEBnOyHSagC6U=;
 b=s2EZ7kryOg+j8jLtr0/fWnUgaJF8faOsJxoBXPP41geku3a2cdRH+FZpxXN7DNgGd0
 GrB/YabnGXuyS/T4qQJGDD8qsdGnJKy67T9FfHbov7QcWpe0GefceX6Lm75qqmQi3jtE
 PT2OF8f3oB6lNtG39vD9KR9y1DvijT4AfZl1Ro9Uy6apf91bcmWZVHKbLTHkAYnYh/3h
 qTDN4wyx2olM5BPn5kv4+8RXdr7ds4tUy6w6QMJI5s576I1fZtA91tyrldtOf+vUcAuw
 CLDZdOb3HWVgnNcYqEKzqoNVNeAXuoZBpoRdgWKoTZBwKkKIJEwzOoUCQIFEIvXDVej+
 CIWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jxX2YZtpvu36ZO7ZkTbylKEVyTGVuHsEBnOyHSagC6U=;
 b=rVTqNwB9AcMPH2QfD7xKUt75VvWe+5wxAEb8HweNSlacP38gspmE6sWg+UNtpyJIEo
 vVTlLRFz+DNliRMILMnrtp1VRdb4kzNQSyQmzUAz5xuQaPmjV1cuxiyhuS+lB5/tpEMG
 UN+jg0hJ69zsABFkPI6thYXO+3AQuMHnB6mUOBX1a2h74lerTA+cXbrIu8Ho8nPyKj+x
 CFUt40eQLawna/aj8/ia5JtdpO8ebSATCDnUhesxY2XBcH0lQcSM7RlSaS0x+MkXnnLk
 iV+aL+mwY+827bbG7m4lMB9SQ5VDflrAf4LVxzmHuMIoqP/TaYi40TQ4iFFmK6E3o/Lp
 xgJg==
X-Gm-Message-State: APjAAAWU+qC9FnH1g6VRFZTBxE+yUguuC6kRXINbIJ4oVNyXNaqaa3EO
 br1pIqU0cMM+SGNOCF+p1pRhNv6m39ZD37KhuKanoA==
X-Google-Smtp-Source: APXvYqwgMidC9I73aoiQNHtKgSiFzKXb1dPl0XIovxDs3G4ncJDA0SYsT3ZuA4WaESzyhfrkZ+YrQfWE5Kv8Ma9wVEA=
X-Received: by 2002:a9d:193:: with SMTP id e19mr4321621ote.135.1560336532913; 
 Wed, 12 Jun 2019 03:48:52 -0700 (PDT)
MIME-Version: 1.0
References: <20190611182703.27505-1-armbru@redhat.com>
In-Reply-To: <20190611182703.27505-1-armbru@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 12 Jun 2019 11:48:41 +0100
Message-ID: <CAFEAcA8nHGb+nRXdWovSUgKzcOUiGGiTJqKNwAXw+n+KozbMHQ@mail.gmail.com>
To: Markus Armbruster <armbru@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::331
Subject: Re: [Qemu-devel] [PULL v2 00/12] Miscellaneous patches for
 2019-06-11
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

On Tue, 11 Jun 2019 at 19:31, Markus Armbruster <armbru@redhat.com> wrote:
>
> The following changes since commit a578cdfbdd8f9beff5ced52b7826ddb1669abbbf:
>
>   Merge remote-tracking branch 'remotes/rth/tags/pull-tcg-20190610' into staging (2019-06-10 16:09:19 +0100)
>
> are available in the Git repository at:
>
>   git://repo.or.cz/qemu/armbru.git tags/pull-misc-2019-06-11-v2
>
> for you to fetch changes up to f1566b78533010be839d24297bb8ebf382552668:
>
>   MAINTAINERS: Polish headline decorations (2019-06-11 20:22:10 +0200)
>
> ----------------------------------------------------------------
> Miscellaneous patches for 2019-06-11

Still fails on OSX:
error: format specifies type 'char *' but the argument has type
'<dependent type>' [-Werror,-Wformat]
/Users/pm215/src/qemu-for-merges/ui/cocoa.m:1448:38: error: use of
undeclared identifier 'QEMU_COPYRIGHT'
                                     QEMU_COPYRIGHT]];
                                     ^
  CC      accel/tcg/trace.o
  CC      crypto/trace.o
/Users/pm215/src/qemu-for-merges/ui/cocoa.m:1708:14: error: implicit
declaration of function 'qemu_main' is invalid in C99
[-Werror,-Wimplicit-function-declaration]
    status = qemu_main(gArgc, gArgv, *_NSGetEnviron());
             ^
/Users/pm215/src/qemu-for-merges/ui/cocoa.m:1708:14: note: did you
mean 'qemu_open'?
/Users/pm215/src/qemu-for-merges/include/qemu/osdep.h:463:5: note:
'qemu_open' declared here
int qemu_open(const char *name, int flags, ...);
    ^
/Users/pm215/src/qemu-for-merges/ui/cocoa.m:1708:14: error: this
function declaration is not a prototype [-Werror,-Wstrict-prototypes]
    status = qemu_main(gArgc, gArgv, *_NSGetEnviron());
             ^
4 errors generated.

thanks
-- PMM

