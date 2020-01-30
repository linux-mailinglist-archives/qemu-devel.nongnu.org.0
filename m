Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 223A314E59A
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Jan 2020 23:46:37 +0100 (CET)
Received: from localhost ([::1]:40506 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ixIa4-0002jy-4u
	for lists+qemu-devel@lfdr.de; Thu, 30 Jan 2020 17:46:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55728)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <aleksandar.m.mail@gmail.com>) id 1ixIYO-00027u-FQ
 for qemu-devel@nongnu.org; Thu, 30 Jan 2020 17:44:53 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aleksandar.m.mail@gmail.com>) id 1ixIYN-00013F-I9
 for qemu-devel@nongnu.org; Thu, 30 Jan 2020 17:44:52 -0500
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:46897)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <aleksandar.m.mail@gmail.com>)
 id 1ixIYN-00011t-Ds; Thu, 30 Jan 2020 17:44:51 -0500
Received: by mail-ot1-x344.google.com with SMTP id g64so4689620otb.13;
 Thu, 30 Jan 2020 14:44:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=iLRray2RDn1E7iHTOsfdVOo1NJI5AxqxL25YXlBeNwI=;
 b=qA1cg1I4X1k3gKwj2Ul2JndecWGOCXKkUfgHqGlFWfY2N441H4hGwHzkr1KULnBMZx
 OofLEjBtotx20wM0ucQ8PJFb+yReYkTVwRx+IJNLUHG9BTjOoKYLYNjggIfop4y7WrUE
 FF3r7nYU2HIG22BUm0dXjJtMEmrrOMOGVYjnaHydrFRDhRhuA/V8WFVWyXgL5//nM1vL
 FULW2N5/cUV0EQs1xpOlARleozYSEsQS4HREwaN+a53sgz4MS0l/CBzAlT1jAdXKw05F
 yFflDZah0BdOZuKW+kxNeLzo2TSqf7FZOgxh1gV1q4pK5wFUUhKqAVufkROluL4A6pz6
 EmJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iLRray2RDn1E7iHTOsfdVOo1NJI5AxqxL25YXlBeNwI=;
 b=pjTXT51aG2IZR48VqJnPke8RlKVTT/MSlplpoTf7D4hUO83cu/Er5nRv8kUYtMIaDC
 ncHKRe633e+HGVoxVJAj9zcjDuVesSN7a5bdY1lv8q6qQB+HlFviZxu52Juk0S5rkA3z
 y+dM36PpC5JCioH0HsEQF//2FXlj14C8ZWjK51BKUrLM5UEPLXJ0s/TiTvBM0pRAP6Ct
 htlcZA79FT3MS8L4R74636lDYREKLOsA4I0yZtSnBIXb40h+4f9/ybpULkvzssjf1m8T
 WMbvjJDqEDBhZU6dDKqk5UUtLQ2sulgdEGVZczHyBY9+4BViktExmI8XbKrF2/TkElKN
 D5Wg==
X-Gm-Message-State: APjAAAXbpEROAdvfxLIaKBJsPC7FPuWw1L7xv6o+ur4qC/I92vmxbwFc
 iNWQJBWYkuWo6Va1fhzEN5Wo4dL9lMsWUxleFT4=
X-Google-Smtp-Source: APXvYqylDXy5GRGmdZoQAZMmn7cnNxjJZqqKAlZH1WHtAbYzUCM+PfbwI5LQiGU0gpktKSgf2gOVfRmCPmqgJXIsjdw=
X-Received: by 2002:a05:6830:12c3:: with SMTP id
 a3mr5502320otq.341.1580424290276; 
 Thu, 30 Jan 2020 14:44:50 -0800 (PST)
MIME-Version: 1.0
References: <20200124005131.16276-1-f4bug@amsat.org>
 <20200124005131.16276-13-f4bug@amsat.org>
 <875zh1yw38.fsf@linaro.org> <790c5181-c4b0-ea7b-f4e4-07bacae220b2@redhat.com>
 <20200124120722.705ae8bac5cfc939dae2db5f@kent.ac.uk>
In-Reply-To: <20200124120722.705ae8bac5cfc939dae2db5f@kent.ac.uk>
From: Aleksandar Markovic <aleksandar.m.mail@gmail.com>
Date: Thu, 30 Jan 2020 23:44:39 +0100
Message-ID: <CAL1e-=hCH7WQU-10zrOZW5imibZxAz7Ao0DVxekJEjSVB5pQhA@mail.gmail.com>
Subject: Re: [PATCH rc2 12/25] hw/timer: Add limited support for Atmel 16 bit
 timer peripheral
To: Sarah Harris <seh53@kent.ac.uk>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::344
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
Cc: Fam Zheng <fam@euphon.net>, "S.Harris" <S.E.Harris@kent.ac.uk>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 "me@xcancerberox.com.ar" <me@xcancerberox.com.ar>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Markus Armbruster <armbru@redhat.com>,
 "dovgaluk@ispras.ru" <dovgaluk@ispras.ru>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, "thuth@redhat.com" <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 "richard.henderson@linaro.org" <richard.henderson@linaro.org>,
 "mrolnik@gmail.com" <mrolnik@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 "qemu-riscv@nongnu.org" <qemu-riscv@nongnu.org>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, "E.Robbins" <E.J.C.Robbins@kent.ac.uk>,
 "imammedo@redhat.com" <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jan 24, 2020 at 1:07 PM Sarah Harris <seh53@kent.ac.uk> wrote:
>
> Hi,
>
> Do I understand correctly that you need Ed to email a "Signed-off-by: Ed Robbins <email>" himself?
> Ed's cc'ed already, but I'll email him directly to make sure he's seen this discussion.
>
> Sarah
>

All authors should have their "Signed-off-by:" line in the commit
message. That is what Alex meant. I will fix that in rc4.

Aleksandar

