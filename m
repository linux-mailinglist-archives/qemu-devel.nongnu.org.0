Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2D9F408A91
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Sep 2021 13:55:15 +0200 (CEST)
Received: from localhost ([::1]:46138 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPkYM-0005l3-V5
	for lists+qemu-devel@lfdr.de; Mon, 13 Sep 2021 07:55:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40296)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mPkQv-0006iB-2p
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 07:47:33 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:46009)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mPkQq-0006iH-7A
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 07:47:32 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 j17-20020a05600c1c1100b002e754875260so6384100wms.4
 for <qemu-devel@nongnu.org>; Mon, 13 Sep 2021 04:47:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=QqX7zi2/fiYEhYtHFRtK49p3CC8zKh3HGtBL9QroxxI=;
 b=lyxB5e8UPUEBnMHVnsixelQwxuMJUQm6fDbDiy+UwwXOC4t1+YtnGDRfFqe7n+RbU1
 N9PtqIM2UWhc9yDzh/gq2Q3ScFFuvlv0cAyrCF5PMUpGPvb0I6NJetgCcjJg9F7n0ogK
 Nju0A5nF7Ijxezg1E8yki/PHB6WnvQ22h9OGSMt0OdR1iJF4v2Mh74wnOxwVrI/e5y+w
 YL4dwrPse3G7tMphcUvO40eFllKSo+sbvrwXMgSqc3NtB9JAjwsNhz5y0RC/UIHBQNmW
 KAD4tcHlaHB3NeZ/wAaSg/kbhN5kfrJQAAzOujVxgTsT9pxKVi/JccgE2+0+6xWcKD/p
 3QNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=QqX7zi2/fiYEhYtHFRtK49p3CC8zKh3HGtBL9QroxxI=;
 b=BRsw2jce0RKHPevoGPmuXObBagfZNdWU9s9Zd5Rgr94P4UMZzfhtLLl5u07JfEM6R6
 uMA7GZ/MN6we+a+jjVL4KX4sEoNMtaGAYgvw8zBJfFGowIBGtODGTDCz/pMEavydwN/a
 NWAj1ADl4SjOc0h5S5JUplUROfc0CIGw5aN7QqIqCfwNKnOXD8uRLghAOh0pR5qRRToX
 ip39J2OgHJ6MIuccriBnKqifbJVwbOMPmLAJMofjkwSR11K0Vw7NIWgfkhb7enpfuD7a
 /oOLyFHX0IXkbqguSylEFtHaisLJeEh6GprfGhhqdWRrmvUBvP+ZgnxySYANFlcc5/wv
 n8cw==
X-Gm-Message-State: AOAM530ycV3+R3N5p/ddEwT3PwDsRi9/PwDYu+yY7+UkMc89D7Fs8+vq
 5fH8t3S/FCu4fR6H01Hl93QhKctYPMSfdEgo56fa9w==
X-Google-Smtp-Source: ABdhPJwhhpnzIsHjit+jRnawU5sZY22PoJuhGXqEler4YgnvuoLQKlxXTH4zH4Z/LEsZK07D5j4fUbS3oVfGi9WIQi4=
X-Received: by 2002:a7b:c246:: with SMTP id b6mr10763922wmj.37.1631533646726; 
 Mon, 13 Sep 2021 04:47:26 -0700 (PDT)
MIME-Version: 1.0
References: <20210907121943.3498701-1-marcandre.lureau@redhat.com>
 <20210907121943.3498701-2-marcandre.lureau@redhat.com>
 <CAFEAcA9BzYj5N3P-Cykm7tzbu9xJAnBO8rF=vBZ87DJnk=kKzQ@mail.gmail.com>
 <CAMxuvaymO7KUWaQ19r1uL-4bNDnXYP57FHeZfSBTpeh-f0rZbg@mail.gmail.com>
In-Reply-To: <CAMxuvaymO7KUWaQ19r1uL-4bNDnXYP57FHeZfSBTpeh-f0rZbg@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 13 Sep 2021 12:46:36 +0100
Message-ID: <CAFEAcA-J+g+iV8v_8E4-yzSuSyuMCVTAL-rm3p3aVdJDzjctWw@mail.gmail.com>
Subject: Re: [RFC v3 01/32] RFC: docs: add supported host CPUs section
To: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x336.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 13 Sept 2021 at 12:32, Marc-Andr=C3=A9 Lureau
<marcandre.lureau@redhat.com> wrote:
>
> Hi
>
> On Tue, Sep 7, 2021 at 4:34 PM Peter Maydell <peter.maydell@linaro.org> w=
rote:
>>
>> On Tue, 7 Sept 2021 at 13:23, <marcandre.lureau@redhat.com> wrote:
>> >
>> > From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>> >
>> > I was looking for such documentation, but couldn't find it.
>>
>> Yes; this is definitely something we should document, and in
>> the build-platforms doc is as good a place as any.
>>
>> > Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>> > ---
>> >  docs/about/build-platforms.rst | 28 ++++++++++++++++++++++++++++
>> >  meson.build                    |  2 +-
>> >  2 files changed, 29 insertions(+), 1 deletion(-)
>> >
>> > diff --git a/docs/about/build-platforms.rst b/docs/about/build-platfor=
ms.rst
>> > index 692323609e..bfe90e574e 100644
>> > --- a/docs/about/build-platforms.rst
>> > +++ b/docs/about/build-platforms.rst
>> > @@ -29,6 +29,34 @@ The `Repology`_ site is a useful resource to identi=
fy
>> >  currently shipped versions of software in various operating systems,
>> >  though it does not cover all distros listed below.
>> >
>> > +Supported host CPUs
>> > +-------------------
>> > +
>> > +Those host CPUs have a native TCG backend and are regularly tested:
>>
>> This is a list of host architectures, not CPUs.
>
>
> Isn't it CPU architecture we are talking about? (CPU for short in the tit=
le)

My point is that "CPU" !=3D "CPU architecture". "CPU" is something
like "Skylake" or "Cortex-A15". "CPU architecture" is "x86-64",
"arm", etc.

>> The table also seems to me to be a bit confusing, because
>> the introductory text suggests it's a list of the TCG
>> support for each architecture, but the table itself lists
>> only the non-TCG accelerators. I think we should just list
>> all the accelerators supported for each host architecture.
>
>
> All the architectures we support (in the list) have proper TCG, right?

Yes.

thanks
-- PMM

