Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E5E892FE1DD
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jan 2021 06:40:13 +0100 (CET)
Received: from localhost ([::1]:39394 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2ShY-0000uB-Fz
	for lists+qemu-devel@lfdr.de; Thu, 21 Jan 2021 00:40:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leonid.bloch@gmail.com>)
 id 1l2SgP-0000SK-L8
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 00:39:01 -0500
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e]:37499)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <leonid.bloch@gmail.com>)
 id 1l2SgN-00069U-Nx
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 00:39:01 -0500
Received: by mail-lj1-x22e.google.com with SMTP id 3so1124169ljc.4
 for <qemu-devel@nongnu.org>; Wed, 20 Jan 2021 21:38:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=5t5dFoEd/RS/AzGOuMXviAfooDX/JgR2PHHqqR7m34Y=;
 b=uUYebCxmG0SwEx7PwOPzN5coXp6rUtPhsdZyeWi0VMMOs/CrgQ6BxHGxvtLPFYtB5I
 8OqtSgQ1q5J75wWrny1RbllbMdOin6PFx9wGTddMfVAvKBn21dphHat4HSJxCqaNSSi3
 34bC2Ctm4EABFZeIzpAlIBjfzS5Ch6rpMudvAyUYpT7DLggknLd4sD/2lOsbrmaAmRTn
 PsVOvI5rPWa71L2lt0ALZbsI5eSzWmaSHShvpgzGusUm480gTIk/XIZETP2I5JsUtBBM
 Vyk6cLARUhrh5Cg+QQCyqr9QobMOrBrm5GND7wQjUIGLzP32Ct3dZ0i6DeipU2FUDuR6
 iEMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=5t5dFoEd/RS/AzGOuMXviAfooDX/JgR2PHHqqR7m34Y=;
 b=pyir1YG+EaMG99Oj98o1h5HRLx3FAXs6zvdyt/ZwDDooeP/W0ttx7/qs+2SymaKLX6
 wXq9jbk7Duenam9ppWhAfeTRYmabFQv2eF/iVvZpIJ4eXARZEznOYfBUL2sx9onJoBPi
 aDCch3G08Wr164smmn6D88YllFZaIgTskeczAZbqLJRboolwAox2XhJqKT4ESc2kgESD
 nx2hTrsLofXQueDvSY/YneFDPoIM8sjkcaaOzg/7CqqzGr1QduJnRJjal6e7j4bpDcqd
 B3XdDDMeeDxjGLEk43Opg5MRFSHgQ8AKLyhJujKE5CIeHrK1amj6ctl9qk6ObrZ8mo8H
 zSNQ==
X-Gm-Message-State: AOAM532j17F8Bi1aRtNkpFzDJC3fRRm4wqmFSu/gYNcg22h6G8h4afna
 KV008o2fIBBlEpeNF2N/Qh8JTsL5d7c+UqQiI5o=
X-Google-Smtp-Source: ABdhPJwIIEe0suBKUtdryoLE0Vwel1p0JrzhpLChsmnUdT2xyQAHPeQw0fBzKUBq7ONAV/4huIAYjvyRxjUgloPi/oA=
X-Received: by 2002:a2e:b0f7:: with SMTP id h23mr5638818ljl.137.1611207537311; 
 Wed, 20 Jan 2021 21:38:57 -0800 (PST)
MIME-Version: 1.0
References: <20210120205501.33918-1-lb.workbox@gmail.com>
 <b866c8ad-9336-5305-131d-5ccd63be2166@amsat.org>
In-Reply-To: <b866c8ad-9336-5305-131d-5ccd63be2166@amsat.org>
From: Leonid Bloch <lb.workbox@gmail.com>
Date: Thu, 21 Jan 2021 07:38:46 +0200
Message-ID: <CAOwCge0Qxh6hQiqrko=Mos3WM2jZXhirhCwxdq7N1Kg_e0H4Pw@mail.gmail.com>
Subject: Re: [PATCH 0/4] Introduce a battery, AC adapter, and lid button
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::22e;
 envelope-from=leonid.bloch@gmail.com; helo=mail-lj1-x22e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Phil,

Thanks for your feedback! Please see below.

On Wed, Jan 20, 2021 at 11:52 PM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.o=
rg> wrote:
>
> Hi Leonid, Marcel,
>
> On 1/20/21 9:54 PM, Leonid Bloch wrote:
> > This series introduces the following ACPI devices:
> >
> > * Battery
> > * AC adapter
> > * Laptop lid button
> >
> > When running QEMU on a laptop, these paravirtualized devices reflect th=
e
> > state of these physical devices onto the guest. This functionality is
> > relevant not only for laptops, but also for any other device which has =
e.g.
> > a battery. This even allows to insert a ``fake'' battery to the
> > guest, in a form of a file which emulates the behavior of the actual
> > battery in sysfs. A possible use case for such a ``fake'' battery can b=
e
> > limiting the budget of VM usage to a subscriber, in a naturally-visible=
 way.
>
> Your series looks good. Now for this feature to be even more useful for
> the community, it would be better to
>
> 1/ Have a generic (kind of abstract QDev) battery model.
>    Your model would be the ISA implementation. But we could add LPC,
>    SPI or I2C implementations for example.

It definitely feels that it needs to be more generic, and I thought
how to make it so, but so far it is what I came up with. I'll think
some more, but any ideas are welcome, cause nowadays I'm doing this in
my free time only.

> 2/ Make it a model backend accepting various kind of frontends:
>    - host Linux sysfs mirroring is a particular frontend implementation
>    - mirroring on Windows would be another
>    - any connection (TCP) to battery simulator (Octave, ...)

Well, it does accept an arbitrary file to represent a battery, so this
covers the battery simulator, does it? As for Windows - indeed, it
would be nice to have.

> Meanwhile 2/ is not available, it would be useful to have QMP commands
> to set the battery charge and state (also max capacity).

But the battery state is determined by the physical battery, or by an
externally provided file. Do you mean introducing another source for
battery information which will be controlled by QMP commands?
As for the max capacity, as with an actual battery, the "QEMU battery"
has it set "by the manufacturer". It is not passed through from the
host, for simplicity sake, and only the percentage is passed. How will
it help if we allow to set the max capacity? It's something pretty
much transparent to the user. (But if there is a use case, of course
it can be done.)

> Ditto QMP command to set the LID/AC adapter state.
>
> > But of course, the main purpose here is addressing the desktop users.
> >
> > This series was tested with Windows and (desktop) Linux guests, on whic=
h
> > indeed the battery icon appears in the corresponding state (full,
> > charging, discharging, time remaining to empty, etc.) and the AC adapte=
r
> > plugging/unplugging behaves as expected. So is the laptop lid button.
> [...]
>
> In patch #2 you comment 'if a "fake" host battery is to be provided,
> a 'sysfs_path' property allows to override the default one.'.
>
> Eventually you'd provide a such fake file as example, ideally used
> by a QTest.

Sure! I will - it's definitely a good idea.

> Another question. If the battery is disconnected, is there an event
> propagated to the guest?

No. I definitely need to add! Thanks!

> Thanks for contributing these patches :)

Thank you!
Leonid.

> Phil.

