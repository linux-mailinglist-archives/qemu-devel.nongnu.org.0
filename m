Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A50A4198CDC
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Mar 2020 09:21:23 +0200 (CEST)
Received: from localhost ([::1]:33186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jJBD8-0007xl-PJ
	for lists+qemu-devel@lfdr.de; Tue, 31 Mar 2020 03:21:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50220)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alex.bennee@linaro.org>) id 1jJBCL-0007Wf-Js
 for qemu-devel@nongnu.org; Tue, 31 Mar 2020 03:20:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1jJBCJ-0006sf-7I
 for qemu-devel@nongnu.org; Tue, 31 Mar 2020 03:20:33 -0400
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:39547)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1jJBCJ-0006s7-0c
 for qemu-devel@nongnu.org; Tue, 31 Mar 2020 03:20:31 -0400
Received: by mail-wr1-x442.google.com with SMTP id p10so24544785wrt.6
 for <qemu-devel@nongnu.org>; Tue, 31 Mar 2020 00:20:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version:content-transfer-encoding;
 bh=imrAE/ffXQzCoxNXZvjsT7WpTFugKJmejFu11KvGyeQ=;
 b=bEBlUUj/73na93RLQU1i100MECp3oMtWnjIp7jdYXWeEneI67+g9aXXBATE9zjNPb1
 dOwOCFac4r9U/CvOjd6jSYTV1OUug7DXs5l32r5u0eOYRCX8Wjeo1pmzxqNahE99pWaY
 pRO0C0hBs+2WAC38kRrpDLy6s939vkqUihyOkuK9fUX0OnnKzv9/W7SOB3REkD7hCluM
 ST8vqCX7QP5m4pSh+XoKilgFJNHpV1VtnQvrWQ+taT8yzeOJkG6Oo3qtXpDcB5hooM1i
 t9obIZA/gLLjNRZwKNbupowvKb/TxSVqXW+MjEREeofAQ2zPgF5z0WsM8tiHtb0zT6Vb
 t8Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version:content-transfer-encoding;
 bh=imrAE/ffXQzCoxNXZvjsT7WpTFugKJmejFu11KvGyeQ=;
 b=Y2IRksmLFCMSL2boL2PG6jwSSppEo0upFVXls9kcK5g4mA1WpPl2q2hr0v2EDaC1dF
 66T0EFN7ke01aRIq4KKakht6Yyb3iSQqbBsUTDI12+HFO5rCsqLKupJsOCGQyIlz/qB1
 b19B3i3Djkd+41+fgEh1NbAkupDY35JOiIDtuI61zAOFR668z9gWFkftHpyaIVjAP55S
 wCE48+C2rBH7+kAucbJeya4L21jNW2Ziu9koCvCeLiGw5m4i/TqKSGnVDSwLM3NDUiqV
 F1sQzSkORZm6OWk7VlgHq2ymOkHymBggnfqO9/IU4vHjHvAibj6g1SHUVaRJtolp579n
 92lQ==
X-Gm-Message-State: ANhLgQ1FAUMEZfPNCX/js/qT1EcTRvsB4/842zJvS/Hbybe+xdcsOu34
 tFGDOqfVlZGAFzFP/EnRomPxaw==
X-Google-Smtp-Source: ADFU+vsQgJa6IFf5vXUs+QUwNrUG/ok1lOxwF9H8KEFJdemBBg+z2Kmg+PnaufTZU+hrQwFjH9nCRg==
X-Received: by 2002:adf:a319:: with SMTP id c25mr18954194wrb.197.1585639229477; 
 Tue, 31 Mar 2020 00:20:29 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id a64sm2645658wmh.39.2020.03.31.00.20.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Mar 2020 00:20:27 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 628521FF7E;
 Tue, 31 Mar 2020 08:20:26 +0100 (BST)
References: <20200307010051.97022-1-yuanzi@google.com>
 <CADjx4CKDPY9J7Zr1YTLv78Ku6mQS6zrMu7oX7-ujU3PGxvHA4w@mail.gmail.com>
 <87imizidwc.fsf@linaro.org>
 <CADjx4CJJdQep+K3ibfhjin7Eo6uCEFGQ6R6yVC0OcNo8MsfvJw@mail.gmail.com>
 <87d095u804.fsf@linaro.org>
 <CADjx4CKhoikcZanqYCs11ubGY+6tOeNjToiCgjnp8V_rzZcDHw@mail.gmail.com>
 <87tv25fwvz.fsf@linaro.org>
 <CADjx4CK-NtPP9iRmao_J9A+25y-MUjco=sM+sKwHfpWXzSV_yA@mail.gmail.com>
User-agent: mu4e 1.3.10; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Lirong Yuan <yuanzi@google.com>
Subject: Re: [PATCH] gdbstub: add support to Xfer:auxv:read: packet
In-reply-to: <CADjx4CK-NtPP9iRmao_J9A+25y-MUjco=sM+sKwHfpWXzSV_yA@mail.gmail.com>
Date: Tue, 31 Mar 2020 08:20:26 +0100
Message-ID: <87o8sdf0sl.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::442
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
Cc: Josh Kunz <jkz@google.com>,
 Philippe =?utf-8?Q?Mathieu-Da?= =?utf-8?Q?ud=C3=A9?= <philmd@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Shu-Chun Weng <scw@google.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Lirong Yuan <yuanzi@google.com> writes:

> On Mon, Mar 30, 2020 at 12:47 PM Alex Benn=C3=A9e <alex.bennee@linaro.org=
> wrote:
>
>>
>> Lirong Yuan <yuanzi@google.com> writes:
>>
>> > On Sat, Mar 21, 2020 at 6:56 AM Alex Benn=C3=A9e <alex.bennee@linaro.o=
rg>
>> wrote:
>> >
>> >>
>> >> Lirong Yuan <yuanzi@google.com> writes:
>> >>
>> >> > On Fri, Mar 20, 2020 at 2:17 AM Alex Benn=C3=A9e <alex.bennee@linar=
o.org>
>> >> wrote:
>> >> <snip>
>> >> >>
>> >> >> Sorry I missed this on my radar. There was a minor re-factor of
>> gdbstub
>> >> >> that was just merged which will mean this patch needs a re-base to
>> use
>> >> >> g_string_* functions to expand stings.
>> >> >>
>> >> >> Also we have some simple gdbstub tests now - could we come up with=
 a
>> >> >> multiarch gdbstub test to verify this is working properly?
>> >> >>
>> >> <snip>
>> >> > For sure, I will re-base this patch to use g_string_* functions.
>> >> >
>> >> > Currently we are using qemu aarch64. I am not sure how to do this y=
et,
>> >> but
>> >> > I could try to add something to
>> >> > https://github.com/qemu/qemu/tree/master/tests/tcg/aarch64/gdbstub
>> >>
>> >> If the auxv support is appropriate to all linux-user targets you can
>> >> plumb it into the multiarch tests - you can even use the existing
>> >> binaries.
>> >>
>> >> So you need:
>> >>
>> >>   - a stanza in the makefiles to launch the test (see
>> >>     tests/tcg/aarch64/Makefile.target)
>> >>
>> >>   - a .py test script that manipulates gdbstub to check things are
>> working
>> >>
>> >> So something like:
>> >>
>> >> .PHONY: gdbstub-foo-binary
>> >> run-gdbstub-foo-binary: foo-binary
>> >>         $(call run-test, $@, $(GDB_SCRIPT) \
>> >>                 --gdb $(HAVE_GDB_BIN) \
>> >>                 --qemu $(QEMU) --qargs "$(QEMU_OPTS)" \
>> >>                 --bin $< --test $(MULTIARCH_SRC)/gdbstub/test-foo.py,=
 \
>> >>         "basic gdbstub FOO support")
>> >>
>> >>
>> >> >
>> >> > Does this sound good?
>> >>
>> >> Hope that helps.
>> >>
>> >> >
>> >> > Thanks!
>> >> > Lirong
>> >>
>> >>
>> >> --
>> >> Alex Benn=C3=A9e
>> >>
>> >
>> > Hi Alex,
>> >
>> > Thanks for the instructions, very helpful!
>> >
>> > I rebased this patch to use g_string_* functions, and the link to
>> patchwork
>> > is:
>> > http://patchwork.ozlabs.org/patch/1264125/
>> > Could you help take another look?
>> >
>> > Regarding testing, I looked at some instructions for running tests, e.=
g.
>> > https://github.com/qemu/qemu/blob/master/docs/devel/testing.rst
>> > https://wiki.qemu.org/Testing
>> > However I still could not get the tests for aarch64 to run. Do you know
>> how
>> > to run the aarch64 or multi-arch tests?
>>
>> The aarch64 ones run with "make run-tcg-tests-aarch64-linux-user" add
>> V=3D1 to see the details.
>>
>> > Also there aren't any existing gdb stub tests that try to read
>> > uninterpreted bytes from the target=E2=80=99s special data area identi=
fied by a
>> > keyword:
>> >
>> https://sourceware.org/gdb/current/onlinedocs/gdb/General-Query-Packets.=
html#qXfer-auxiliary-vector-read
>> > I looked at some other gdb stub tests, but they did not seem to send a=
ny
>> > queries:
>> > https://github.com/qemu/qemu/tree/master/tests/tcg/aarch64/gdbstub
>> > So I am not sure how to set up one for "Xfer:auxv:read:" packets...
>> > Are there plans to add more tests for other packets like
>> > "Xfer:features:read:"?
>> > I'd be happy to add a test if there is an example of how to do it. :)
>>
>> What would you do from a normal gdb command line. At the very least you
>> run the same command with gdb.execute(), e.g.:
>>
>>   gdb.execute("set confirm off")
>>
>> is the same as typing
>>
>>   set confirm off
>>
>> at the gdb command prompt.
>>
>> >
>> > Thanks,
>> > Lirong
>>
>>
>> --
>> Alex Benn=C3=A9e
>>
>
> Hey Alex,
>
> I tried to run the test but they were skipped. Do you know if there's any
> other flag that needs to be set?
>
> $ make run-tcg-tests-aarch64-linux-user
> make[1]: Entering directory '/usr/local/google/home/yuanzi/qemu/slirp'
> make[1]: Nothing to be done for 'all'.
> make[1]: Leaving directory '/usr/local/google/home/yuanzi/qemu/slirp'
>   BUILD   TCG tests for aarch64-linux-user
>   BUILD   aarch64-linux-user guest-tests SKIPPED
>   RUN     TCG tests for aarch64-linux-user
>   RUN     tests for aarch64-linux-user SKIPPED

Ahh you either need to have docker enabled or the aarch64 compilers in
your path when you run configure so the test programs can be built. The
details are in docs/devel/testing.rst

> I don't think any command needs to be run. It should just send the query
> automatically.
> Could we assume that it will work the same in the test?

If that is enough to exercise the code. Can we not validate the data someho=
w?


--=20
Alex Benn=C3=A9e

