Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 829F04A6803
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Feb 2022 23:31:39 +0100 (CET)
Received: from localhost ([::1]:38240 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nF1gY-00085C-JV
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 17:31:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37840)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1nExS0-00058X-Mv
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 13:00:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22172)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1nExRm-0005Sk-SY
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 13:00:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643738405;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lAppDlWFd4kSM0H0SRdqSLBDDOAMTyzoaH6OWOIw+54=;
 b=dV2BQIiFXJJGJNHxx2vFv37iAUF5sy+7/EFtndN02FWdmK1G2NiI7U06/qvMiRyTw+oY7+
 BvegfmdyJvlo5ZfuexEbFc4HhJXHV8e6TlnEZDkOt01nhwosHSZGIGKlPKzZ/BrjbCDVT9
 af3FVSFprUUvs9xZtULHRY30sUWnsew=
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com
 [209.85.221.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-568-mhkq3eQ3PsChZZJMELlgBA-1; Tue, 01 Feb 2022 13:00:04 -0500
X-MC-Unique: mhkq3eQ3PsChZZJMELlgBA-1
Received: by mail-vk1-f200.google.com with SMTP id
 s132-20020a1fa98a000000b0031b67c2dac0so2873281vke.23
 for <qemu-devel@nongnu.org>; Tue, 01 Feb 2022 10:00:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=lAppDlWFd4kSM0H0SRdqSLBDDOAMTyzoaH6OWOIw+54=;
 b=MoihShVfa2gtLmta950VYDBJQW89uwWtgXvEXr82zRAGQxyIVJuOvYgJT5WyqJQkmV
 TxrNIxgrTtWIx0+CbM5A62ha+xJ2DVsF3nQjizJuN9ILC6cbyz89vYJRBS+O7vwocfBp
 pQnFP4wJqCZJHwGC0Skz48ETY6iFgdrravKMzGq+ddTOrOz65FximwBKbLMZSko8Bz4O
 HhGU+1axFY26e4w77UDzIGhHM3F6x95I7X+F5G2wuro3ji/aTZYzXwbgRYzQ+e9QVUNu
 IK2wuPlpbqa3zkInneD33zGHQDChQzrOXcjHlCNQ7S/tID7lYyPBJ/wGRb4GN9Sgid6B
 u2Jw==
X-Gm-Message-State: AOAM533X+J8MNqWxI3Fu3sGHBnVQTT0lN+HYn8HlJMReqJ6cYGfiWuz6
 nCN28DTRGFVsppBkWqgrok3khIqOx829R/7RsuiOB4J1yr9A+3ES1GvNFlduBEBjPVSx+o1XbLB
 kIJN6GJHdRBNOCcKtD2Xr713/lMjekL8=
X-Received: by 2002:a67:c309:: with SMTP id r9mr10346387vsj.83.1643738403987; 
 Tue, 01 Feb 2022 10:00:03 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxSwo3QuLOwAfeTTMIpiLHhzPxTfRC1o0/KvNgQ+5+UqXgkFnale2pOvDQNx8HQvRnYEui9CVk1mjnGBH4ort8=
X-Received: by 2002:a67:c309:: with SMTP id r9mr10346371vsj.83.1643738403597; 
 Tue, 01 Feb 2022 10:00:03 -0800 (PST)
MIME-Version: 1.0
References: <CAFEAcA9cMZoj18gq7Ksv5PRoU1wRmXvW_e9UE73C_MEB7wTroQ@mail.gmail.com>
 <CAFEAcA9_d5jw5-HOrZA6dsG1vMqxzqmrfHA7Jo0KsDcaEXmB_Q@mail.gmail.com>
 <6c90ca3d-eaec-d7e8-5941-4deb83b58fd0@redhat.com>
 <87zgnp4b32.fsf@dusky.pond.sub.org>
 <CAFEAcA_kxrCgyxWPFLw6VZ-rKx-res0C8L2BWRvfB81cR+keLg@mail.gmail.com>
 <875yqd6zib.fsf@linaro.org> <YerPk2ABMHQf/3QP@redhat.com>
 <CA+bd_6KgJ_tG9r9Nhn5p6bDsdiXKRckGiZ75srxTNZj4bdd2UA@mail.gmail.com>
 <YflndOiIn8JbjuOS@redhat.com>
In-Reply-To: <YflndOiIn8JbjuOS@redhat.com>
From: Cleber Rosa <crosa@redhat.com>
Date: Tue, 1 Feb 2022 12:59:52 -0500
Message-ID: <CA+bd_6K=ZA_-CWuDR=D9t4Y5br-ZuB2wM=p6tLC8fWjT8rfnrA@mail.gmail.com>
Subject: Re: "make check-acceptance" takes way too long
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=crosa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.081,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Feb 1, 2022 at 12:01 PM Daniel P. Berrang=C3=A9 <berrange@redhat.co=
m> wrote:
>
> On Tue, Feb 01, 2022 at 12:29:56AM -0500, Cleber Rosa wrote:
> >
> > Assuming this is about "Testing that QEMU can boot a full distro", I wo=
uldn't
> > try to solve the problem by making the distro too slim to get to the
> > point of becoming
> > an unrealistic system.
>
> At a high level our with acceptance (integration) testing is of
> course to make sure that QEMU is correctly emulating a full virtual
> machine, such that we have confidence that it can run real world
> operating systems.
>
> There are a number of approaches to achieve that with varying
> tradeoffs.
>
>   - Testing with very specific tailored environments, running
>     very specific userspace tools and minimal kernel setup.
>
>     This can give us a pretty decent amount of coverage of
>     the core features of the emulated environment in a tightly
>     controlled amount of wallclock time. When it fails it ought
>     to be relatively easy to understand and debug.
>
>     The downside is that it is the QEMU code paths it hits are
>     going to be fairly static.
>
>
>   - Testing with arbitrary execution of real world OS images.
>
>     I think of this as a bit of scattergun approach. We're not
>     trying to tightly control what runs, we actually want it
>     to run alot of arbitrarily complex and unusual stuff.
>
>     This is going to be time consuming and is likely to have
>     higher false positive failure rates. It is worthwhile
>     because it is going to find the edge cases that you simply
>     won't detect any other way, because you can't even imagine
>     the problems that you're trying to uncover until you uncover
>     them by accident with a real OS workload.
>
>     It is kinda like fuzzing QEMU with an entire OS :-)
>
>
> Both of these approaches are valid/complementary and we should
> want to have both.
>

Agreed.

> Any test suite is only going to find bugs though if it is
> actually executed.
>
> As a contributor though the former is stuff I'm likely to be
> willing to run myself before sending patches, while the latter
> is stuff I'm just always going to punt to merge testing infra.
>
> We want to be wary of leaving too much to be caught at time
> of merge tests, because that puts a significant burden on the
> person responsible for merging code in QEMU.  We need our
> contributors to be motivated to run as much testing as possible
> ahead of submitting patches.
>
> > IMO the deal breaker with regards to test time can be solved more cheap=
ly by
> > having and using KVM where these tests will run, and not running them b=
y
> > default otherwise.  With the tagging mechanism we should be able to set=
 a
> > condition such as: "If using TCG, exclude tests that boot a full blown =
distro.
> > If using KVM, do not criticize what gets booted".  Resulting in somethi=
ng
> > like:
>
> > Does that sound like something appropriate?
>
> Depends whether you only care about KVM or not. From a POV of QEMU
> community CI, I think it is valid to want to test TCG functionality
>
>

Maybe I wasn't clear enough.  I am suggesting that tests using TCG do
not run by default (on a "make check-avocado") if, and only if, they
are booting a complete OS.  That would  bring the time to run "make
check-avocado" to a fifth of its current time.

And to be clear, there are a *lot* of tests running TCG, but they
happen to boot kernel+initrd by default, so we're not necessarily
abandoning TCG at all.

Also, we can have another target, or option as suggested by others in
this thread, where those lengthy TCG based full fistro boot tests get
to run.

> > BTW, on the topic of "Using something as a base OS for scripts (tests) =
to run
> > on it", another possibility for using full blown OS would be to save
> > their initialized
> > state, and load it to memory for each test, saving the guest boot time.=
  This
> > should of course be done at the framework level and transparent to test=
s.
>
> There is *massive* virtue in simplicity & predictability for testing.
>
> Building more complex infrastructure to pre-initialize caches with
> clever techniques like saving running OS state is clever, but is
> certainly not simple or predictable. When that kind of stuff goes
> wrong, whoever gets to debug it is going to have a really bad day.
>
> This can be worth doing if there's no other viable approach to achieve
> the desired end goal. I don't think that's the case for our integration
> testing needs in QEMU though. There's masses of scope for us to explore
> testing with minimal tailored guest images/environments, before we need
> to resort to building more complex optimization strategies.
>

I'm aware and second that. Avocado-VT tests transitioned from a model
where VMs would, by default, be reused across tests, to a "start every
VM from scratch".  But, users can still opt-in to the "reuse VM model"
if they feel the tradeoff is valid.

Best regards!
- Cleber


