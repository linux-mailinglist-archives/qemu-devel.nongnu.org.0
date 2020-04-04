Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 87B9019E405
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Apr 2020 11:08:35 +0200 (CEST)
Received: from localhost ([::1]:36792 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jKen4-00086Q-2b
	for lists+qemu-devel@lfdr.de; Sat, 04 Apr 2020 05:08:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51904)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jKemJ-0007hD-8A
 for qemu-devel@nongnu.org; Sat, 04 Apr 2020 05:07:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1jKemH-00089U-SC
 for qemu-devel@nongnu.org; Sat, 04 Apr 2020 05:07:46 -0400
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241]:40742)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1jKemH-000895-Jp
 for qemu-devel@nongnu.org; Sat, 04 Apr 2020 05:07:45 -0400
Received: by mail-oi1-x241.google.com with SMTP id y71so8461868oia.7
 for <qemu-devel@nongnu.org>; Sat, 04 Apr 2020 02:07:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=8g0lmOr9Oz5b+wZDZoTqLY0iLXCNRrLHsVWoWCaNYTI=;
 b=XO+eg7Wh3AaZIQBqc21WSIxVuorW/HIr5SvmC5R4qrbUmZYe9d5ArqPsuz74bxV8Bq
 crhmrWeQpp2tO4S3OcOVcyq4p/yjDWXXScJ8xRwnVuEptVBILq/seANllic31vypGJgf
 0zSk65ibn7S+5YJFvcmDpFljRlJfo3smk0EoUrRCw2QnNKOcBf+c7x09cFnq3JtUIh8a
 sTUkC8UoJ52MkTAH9ALQWXiRiJ/2tYhY3/0hNDzA6kqbq1rnwFSpxkVvVHq525ljAhor
 JL7r2gXbVavhvYSB3H6IC0yVpeXbfnX012HnONW49Jm2ovpRLLY3MYn0k0cPq65CjJN2
 IGZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=8g0lmOr9Oz5b+wZDZoTqLY0iLXCNRrLHsVWoWCaNYTI=;
 b=Vd5q/KR+/YvMbl0XoS5T+FMbB86B/FeVT+KxfXh3Gb4f9BHIy2sLwJ8J7MjVUTjxnN
 /DG3XEdFrIUTUoSlxMTbjJVJTO/6r4vVNoROSTokkD62/f8rAL71lkqjk8fFESBOz0hs
 Avc5r2V3vWHLirW0N0wYaTtsbZSZS0qX30VxGmBaRmVyfeqgHiNcuk0pBDVTHv2aCjeZ
 ZgoNvIM5Vs1HLyFZdyUsaSirbGg0FePBsNzKqGY7Z4xY4DNBw4iH0bm+BsElv1VhAc7G
 EuhAJ68/bGAGvQ71341keDw7eSUXbprUoGzXqsG4W91oNanFn2CeG3oPYIsi+9SfZU8F
 TdkA==
X-Gm-Message-State: AGi0PuZt+2l4h5cCINpQL/1UxT3JqWG20SwlQkNaurrNIk2btLRFOw7+
 cxTgkOBcv8uiSLJBJz3tZsXxm67A5CpQWAxhhVjjjA==
X-Google-Smtp-Source: APiQypJ+4J4Ya47dI+BPjwuVQgzW+6SzETlIRIW0PiSfeygmLuU+JCwsHfPPACUGsLn2NKs8wsSx6l0Fr9sOVEJraek=
X-Received: by 2002:a05:6808:8cb:: with SMTP id
 k11mr5710715oij.48.1585991264449; 
 Sat, 04 Apr 2020 02:07:44 -0700 (PDT)
MIME-Version: 1.0
References: <20200324173630.12221-1-peter.maydell@linaro.org>
 <63099477-98e6-8c16-1c8c-a9a617062143@redhat.com>
In-Reply-To: <63099477-98e6-8c16-1c8c-a9a617062143@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 4 Apr 2020 10:07:33 +0100
Message-ID: <CAFEAcA-9zHCHjyJ58sjzHkNVf=GQ7_HyLyQpiOLYbr55T-DZ1Q@mail.gmail.com>
Subject: Re: [PATCH for-5.0] dump: Fix writing of ELF section
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::241
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
Cc: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 3 Apr 2020 at 21:55, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com=
> wrote:
>
> On 3/24/20 6:36 PM, Peter Maydell wrote:
> > In write_elf_section() we set the 'shdr' pointer to point to local
> > structures shdr32 or shdr64, which we fill in to be written out to
> > the ELF dump.  Unfortunately the address we pass to fd_write_vmcore()
> > has a spurious '&' operator, so instead of writing out the section
> > header we write out the literal pointer value followed by whatever is
> > on the stack after the 'shdr' local variable.
>
> How did you notice this? While reviewing around?

Coverity, but I forgot to quote the CID in the commit message.

-- PMM

