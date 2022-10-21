Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B6186074DE
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Oct 2022 12:18:13 +0200 (CEST)
Received: from localhost ([::1] helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olp6R-0007nA-RZ
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 06:18:11 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olonb-0002X0-UI
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 05:58:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1olonR-0001z0-UC
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 05:58:34 -0400
Received: from mail-il1-x129.google.com ([2607:f8b0:4864:20::129])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1olonC-0005Qj-K1
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 05:58:33 -0400
Received: by mail-il1-x129.google.com with SMTP id u2so1361655ilv.6
 for <qemu-devel@nongnu.org>; Fri, 21 Oct 2022 02:58:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OqIXMihpD1LNlozcqmOJBw4ot6dKB06aGwk0vIffl2E=;
 b=dWTZh+AJAPdHO2lX2hGTRz7XoAJ7JAetuSK6kKhMTP/HkeouTF4mbTdbRMuidu4owg
 xo8025CRaggIOXRnBXy6Klp9t/dhfPEoG7QXbkN4/Ug1KpWyJB2raWJuQXtriuiwKL+D
 l+qsmcXeo6ypRgj4OwH2JNM83oTNRRtXkyeNhl085A3NvipdX5vaxmJpffZ6BBJ3OFYp
 7V0dD6DIiOoZoSP2MqS4JaI0XfQrJE1fUAGAVFJHetVkd3J7FBCkhi2lwesiE5Sx3VgI
 toGb3ehJQGa+pSGZjtlbujNUeoT8e7JjAbinS1/i3Co9P8lFs/dRoWUl6VAdW1k0+Fm4
 Zi/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OqIXMihpD1LNlozcqmOJBw4ot6dKB06aGwk0vIffl2E=;
 b=H1rc168/1G7zuluDv9r3mocRYGTXGH906AiGGBP3sLHMUwa4AzfCcnC7Xu5s+cdGwj
 GMsbuJ9YrkZbErOjpCraguie24AFpH0zyJgrxiCgY5RZXUszy24gkk7+RLwW/FprNzdb
 5D9wybuYx4nplm3zKJ51JeQee6e/fokdjMRLchiaH6zOOvpLF3ui4YHUtEXSiXbpJP3T
 zoHImC8rDn4yy+agbPiqbQ8RojFUZh1/qQLQ7ng1KofNRyoaK8sfXZyAgiguSR5nE/Xz
 ivjetCyw3DAvfGXr1EN17Vr9ANpVt2xxuTIrwmSYIPNZDReC/A7aMpD8i65wamaoJ2SD
 SZOw==
X-Gm-Message-State: ACrzQf3itfGRN1eXEBnZxFzU2K0g4lqRkFZ9fUXtSO37GVxqjTgPtSJV
 CdA1c7kYR46GWeaB6bGNnWuYPtV2ZdUDaUOegFqgGA==
X-Google-Smtp-Source: AMsMyM5AhYUtL3qgscf8TN2VGsUDj9NUEwH3se7+rR8bumZ/OQlxUSdjrE2Mbiy+Ie7K2hpBoEwzbWR41rzb1N3XJAM=
X-Received: by 2002:a05:6e02:1253:b0:2fd:2fb5:c9f7 with SMTP id
 j19-20020a056e02125300b002fd2fb5c9f7mr13388793ilq.129.1666346296180; Fri, 21
 Oct 2022 02:58:16 -0700 (PDT)
MIME-Version: 1.0
References: <20221020083810-mutt-send-email-mst@kernel.org>
 <CAARzgwwd_How_h+9sHWPOrWWZ7CbX+DN-uy-KiGf1VVyVmrLnA@mail.gmail.com>
 <20221020084311-mutt-send-email-mst@kernel.org>
 <CAARzgwxfKbrxAqb15GXp4j1enDPUhGBsL5jUzFtDvJkGM-7azw@mail.gmail.com>
 <20221020150857-mutt-send-email-mst@kernel.org>
 <CAARzgwwDjjHL-1fEeuySNZm8NbnGNaeE5h6zrPz_zaANfs5dsw@mail.gmail.com>
 <CAARzgww8P4Za=+r8q2a30TCY7Uzw6g2tgHeLLKr7R+WV-7qQVg@mail.gmail.com>
 <20221021042449-mutt-send-email-mst@kernel.org>
 <CAARzgwyW+ved0iVinWzSCg+KSCL67v+m6KySRdg_hUUev8JLDA@mail.gmail.com>
 <87k04t7ca6.fsf@linaro.org> <20221021053828-mutt-send-email-mst@kernel.org>
In-Reply-To: <20221021053828-mutt-send-email-mst@kernel.org>
From: Ani Sinha <ani@anisinha.ca>
Date: Fri, 21 Oct 2022 15:28:05 +0530
Message-ID: <CAARzgwzQZXdJCxn_YmXPGOuVTd7CzwnZ=aQRjVgZ5p2XiTosQA@mail.gmail.com>
Subject: Re: [PATCH v6 00/10] Introduce new acpi/smbios avocado tests using
 biosbits
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Beraldo Leal <bleal@redhat.com>, Cleber Rosa <crosa@redhat.com>, 
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Igor Mammedov <imammedo@redhat.com>, John Snow <jsnow@redhat.com>, 
 Maydell Peter <peter.maydell@linaro.org>, Paolo Bonzini <pbonzini@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Qemu Devel <qemu-devel@nongnu.org>, Thomas Huth <thuth@redhat.com>, 
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: none client-ip=2607:f8b0:4864:20::129;
 envelope-from=ani@anisinha.ca; helo=mail-il1-x129.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

On Fri, Oct 21, 2022 at 3:10 PM Michael S. Tsirkin <mst@redhat.com> wrote:
>
> On Fri, Oct 21, 2022 at 10:30:09AM +0100, Alex Benn=C3=A9e wrote:
> >
> > Ani Sinha <ani@anisinha.ca> writes:
> >
> > > On Fri, Oct 21, 2022 at 2:02 PM Michael S. Tsirkin <mst@redhat.com> w=
rote:
> > >>
> > >> On Fri, Oct 21, 2022 at 05:45:15AM +0530, Ani Sinha wrote:
> > >> > And have multiple platform specific branches in bits that have fix=
es for those
> > >> > platforms so that bits can run there. Plus the existing test can b=
e enhanced to
> > >> > pull in binaries from those branches based on the platform on whic=
h it is being
> > >> > run.
> > >> >
> > >>
> > >> What a mess.
> > >> Who is going to be testing all these million platforms?
> > >
> > > I am not talking about branches in QEMU but branches in bits.
> > > If you are going to test multiple platforms, you do need to build bit=
s
> > > binaries for them. There is no way around it.
> > > bits is not all platform independent python. It does have binary exec=
utables.
> > >
> > > Currently bits is built only for the x86 platform. Other platforms ar=
e
> > > not tested. I doubt if anyone even tried building bits for arm or
> > > mips.
> >
> > I'm not worried about test bits on other targets, but we do run x86
> > targets on a number of hosts. The current reliance on a special patched
> > host build tool for only one architecture is the problem. If  we just
> > download the iso that problem goes away.
>
> =F0=9F=91=8Dwhat he said.

Yes, in that case the problem is that upstream bits does not pass all
the test out of the box. Hence we are taking this approach of keeping
some test scripts in QEMU repo and modifying them. Then generating the
iso with the modified scripts. It also helps developers who want to
write new tests or make enhancements to existing tests.
If modifications need to be made to tests, they need to be versioned.
We have gone through the route of not using submodules and I am not
going to open that can of worms again.
We also have no consensus on where to keep the one time built iso that
we can download for this test you are proposing.

So let's figure out the above first. Programmatically downloading an
iso and running tests within a VM would be a much simpler test than
the one I wrote. We can add a subtest or a brand new test anytime if
we can figure out the above logistics.

>
> > > It makes sense to try things incrementally once we have something goi=
ng.
> > >
> > > Lets discuss this on a separate thread.
> > >
> > >> All this does nothing at all to help developers avoid
> > >> bugs and when they do trigger debug the issue. Which is
> > >> after all why we have testing.
> > >> Yes once in a very long while we are going to tweak
> > >> something in the tests, and for that rare occurence
> > >> it makes sense to periodically rebuild everything,
> > >> otherwise code bitrots.
> > >>
> > >> But the test is supposed to run within a VM anyway, let's
> > >> have an image and be done with it.
> > >>
> > >> --
> > >> MST
> > >>
> >
> >
> > --
> > Alex Benn=C3=A9e
>

