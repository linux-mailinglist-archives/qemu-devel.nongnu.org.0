Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 16AC8401761
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Sep 2021 09:57:44 +0200 (CEST)
Received: from localhost ([::1]:43056 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mN9Ve-000374-KY
	for lists+qemu-devel@lfdr.de; Mon, 06 Sep 2021 03:57:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39700)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mN9Tw-0002KK-0t; Mon, 06 Sep 2021 03:55:56 -0400
Received: from mail-io1-xd30.google.com ([2607:f8b0:4864:20::d30]:35504)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mN9Tt-0005FI-MR; Mon, 06 Sep 2021 03:55:55 -0400
Received: by mail-io1-xd30.google.com with SMTP id a15so7606547iot.2;
 Mon, 06 Sep 2021 00:55:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vPYCl+i+oKxMa4I632l3ad4gPQG8GzRMiOp6dy5fbEk=;
 b=WeMreyekbgLmTV3/kqha8yA/KV89V3+Bqtiplhlchd/sbY/tnZqyK8SLH7iEHnilcy
 UOgJS9wfAWIxRwsrIhzZ1CBUUcWTERaSimYAUrjCn0bW8IXMdcllGS0gj5IbnoMEwJQa
 fHpIVRrx+GcHwTs5Dw6qadpiSil2AC87g+VsFuxQeAy/tmA5bu0IerAntQdqETzzNNhu
 BxrMGc2us3VOy7orKrqML1SpioBK79Ysslq+RSbzGwuadn6Xv4UAYJjg3lHM9uU6AZ3A
 HSA63yHKeYz99cjJGU+1HqI+qq+yiZlAbaqqIteRRhzc9f7YVNqmnxIANkG089dcUX1A
 YFGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vPYCl+i+oKxMa4I632l3ad4gPQG8GzRMiOp6dy5fbEk=;
 b=QYZM5tjF0YMcOypdZqA7Dvlnwo0MesuN2m1GID30bL856G7HI0ww79CSnVV8YaOon2
 F6Z9/D4AUyVeU8hcZauCoxRWsRAfDI8z5A0d+YghPGIEzNX1Eq2AJh2fUxQsuPdnetiH
 0hPVpIu6nd9R8kR4FF4726nW1qNjdoKrkMVan2oQzY0lLSToFy9J7eFqCjhGqxcopIRw
 B3P8PzhP+/VJrfx79ABDUZ3iM/cDA0JLjlDR5ncGlVUQ/6c6EqpJsHzQhTjaORxMQu66
 /EajOCZcq/kr1TpFjulBbDd85BCZI7oQc2wcv2wz0ZAK4r2YhPCtJPsn8p3iigOFOdj/
 z+UQ==
X-Gm-Message-State: AOAM532MfdLJZEoRZUaxwoKgYkeFFuKCG2fGJuym8fMh7kfpnoIOaO7a
 jJ0Fy2/cJMWEYctOeMlS3g07+rijhoLge90JdHE=
X-Google-Smtp-Source: ABdhPJy0Pxq6UYqsUg+NHsJoihlOsOMR3PW/Opjm7nimwDpKbV/rkN/biavjnBF8ISYq29r7i10B0Z5Ht+7i72ATk4A=
X-Received: by 2002:a6b:fd1a:: with SMTP id c26mr8652163ioi.57.1630914951581; 
 Mon, 06 Sep 2021 00:55:51 -0700 (PDT)
MIME-Version: 1.0
References: <20210826151332.32753-1-ruinland@andestech.com>
 <CAKmqyKPY=Q61x7gf_0S1-B66VMpZCFx1r5ENJG0J5FNX6NLz0w@mail.gmail.com>
 <YTW6ADQMBcs5csXv@ruinland-x1c>
 <CAKmqyKPu9MK0KRycXzcnb=pH_OjB1mCKzw8uhb2vSZAwxraAfg@mail.gmail.com>
 <YTXFGWBhpJ3gdxxb@ruinland-x1c>
In-Reply-To: <YTXFGWBhpJ3gdxxb@ruinland-x1c>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 6 Sep 2021 17:55:25 +1000
Message-ID: <CAKmqyKM2erOYCOqbT7rKmbQig5HC2Q_3hk2xHBDMbFG9ipx06A@mail.gmail.com>
Subject: Re: [RFC PATCH 0/2] riscv: Adding custom CSR related Kconfig options
To: Ruinland ChuanTzu Tsai <ruinland@andestech.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d30;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd30.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
Cc: guoren@linux.alibaba.com, "open list:RISC-V" <qemu-riscv@nongnu.org>,
 "Alan Quey-Liang Kao\(\(\(\(\(\(\(\(\(\(\)" <alankao@andestech.com>,
 wangjunqiang <wangjunqiang@iscas.ac.cn>, Dylan Jhong <dylan@andestech.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 ycliang@andestech.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Sep 6, 2021 at 5:37 PM Ruinland ChuanTzu Tsai
<ruinland@andestech.com> wrote:
>
> Hi Alistair,
>
> So glad to hear from you.
>
> On Mon, Sep 06, 2021 at 05:05:16PM +1000, Alistair Francis wrote:
> > On Mon, Sep 6, 2021 at 4:49 PM Ruinland ChuanTzu Tsai
> > <ruinland@andestech.com> wrote:
> > >
> > >
> > > Hi Alistair,
> > >
> > > Thanks for the heads up about the upcoming unification of RISC-V 32/64 targets.
> > > Yet I have several concerns and would like to have some brainstorming regarding
> > > such topics - -
> >
> > No worries, I'm happy to discuss.
> >
> > >
> > > That is, could you elaborate more about the "runtime check/switch" which you
> > > mentioned in the previous e-mail :
> > > https://lists.nongnu.org/archive/html/qemu-devel/2021-08/msg02154.html
> > > I'm not quite following the context.
> >
> > Yep, so something along the lines of this in `riscv_csrrw()`
> >
> > if (cpu == "MyCustomCPU") {
> >     my_custom_csr[csrno].read();
> > }
> >
> > So we check if using the CPU then apply extra CSR accesses.
> >
> > > If we don't have a way to toggle which (vendor) cores, which will be used,
> > > during compile time, it means that we have to build all the vendor code and
> > > link them all together; and we might have the chance to encounter collision on
> > > csrno between different vendors.
> >
> > I don't see how they will collide as we will only act on 1, based on
> > the CPU we are using.
>
> AFAIK, we need to put CSR number into `target/riscv/cpu_bits.h`, and they are
> exposed to the global and let others to use it. With my current design, which I
> have sent out by RFC patch series v3, I introduced an abstraction layer,
> `custom_cpu_bits.h`, which will toggle diffenet set of custom CSR number.
>
> If we teardown the Kconfig, all symbols will be exposed and then it could have
> a high chance to collide with each other.

I guess this depends on what you are trying to do.

We could have non public CSRs. So each CPU could have it's own custom
version of `riscv_csr_operations csr_ops[CSR_TABLE_SIZE]` which is in
it's own C file. We then just add a switch case to CSR accesses and if
using CPU "customcpu" then we check the `custom_cpu_csr_ops` table.
NOTE: That we can do something smarter than a switch, but you get the
point. We can implement a read/write function for every element in the
array, with the default just triggering an illegal instruction.

I guess that assumes that each CSR access is self contained. For
example if changing a custom CSR changes a core part of the
target/riscv code this won't really work.

On the other hand I'm not convinced we want vendor changes to affect
the core target/riscv code. Ideally all vendor code can be kept in
it's own file and it's fully self contained. That won't work for
everything, but it should work for enough use cases. We can even have
a custom vendor state that the vendor code can use (it can also change
the CPU state).

Does that make sense?

>
> >
> > >
> > > Secondly, I'm not quite sure about how we're going to merge decode tree files
> > > across RV32 and RV64. Vendor-designed custom instruction would have a different
> > > encoding scheme on bitfields for RV32 and RV64. Currently, we (Andes) are using
> > > different decodetree sources for gen32 and gen64 in `target/riscv/meson.build`.
> >
> > Ok, so custom instructions are a whole different problem. I think we
> > should leave that for now and focus on CSRs.
> >
> > A quick look though and I suspect we could do a similar CPU check in
> > decode_opc(). Dealing with the decodetree will be problematic though.
> >
> > > I'm preparing the patch to demonstrate such hiccups.
> > >
> > > As far as I know, there's no control flow logic for decodetree to parse
> > > decodetree files differently. (e.g. ifdef XLEN == 32 then blah, blah).
> > >
> > > To meet in the halfway, maybe after the grand unification on RV32/64, we can
> > > still confine vendor custom logic (i.e. instrucions and CSRs) to be toggled by
> > > whether a certain vendor cpu model is selected ?
> >wtih  the d
> > I honestly don't see a scenario where that happens. The maintenance
> > overhead and confusion of changing the CPUs at build time is too high.
> >
> > I also don't think we should need that for CSR accesses. Custom
> > instructions are a whole different can of worms.
>
> IMHO, custom CSR and custom instructions are two sides of a same coin in some
> way. Let me explain it with an example - -
>
> Andes has a custom instruction called `EXEC.IT`, which is a 16-bit long com-
> pressed instruction. By executing such instrcution, an instruction table
> reside in a particular address specified by a custom CSR called uitb will be
> fetch, decode and execute. By doing so, the code size could be reduced.

Hmmm... This is a much more complex use case than I was expecting. I
have been thinking more about custom CSRs to set a timer or control
the interrupt controller.

Something like what you described is going to be a lot more work.

In your case though I think we can still focus on the CSR aspect
first. Once that is sorted we can then look at the instruction part.

The main aim should be that all (or almost all) vendor code lives in
it's own file.

Alistair

>
> The problem is that we have different address encoding on RV32 and RV64.
>
> And just like you mentioned, in our in-house core, we apply the same logic on
> decode_opc() to decode custom instructions first. If such decoding/trans
> procedure fails, the original decoder will be invoked.
>
> >
> > >
> > > By the way, I'm wondering how our friends from T-Head (Guo Ren ?) regard this
> > > issue ? AFAIK, they forked QEMU from v3.2.0 and applied their vendor features
> > > on top of it for quite a while.
> >
> > I'm not sure.
>
> Sorry for the confusion, I was trying to ping Guo Ren :-D
> I CC'ed him in the previous e-mail.
>
> Cordially yours,
> Ruinland ChuanTzu Tsai
>
> >
> > Alistair
> >
> > >
> > > Cordially yours,
> > > Ruinland ChuanTzu Tsai
> > >
> > > On Thu, Sep 02, 2021 at 12:25:20PM +1000, Alistair Francis wrote:
> > > > On Fri, Aug 27, 2021 at 1:16 AM Ruinland Chuan-Tzu Tsai
> > > > <ruinland@andestech.com> wrote:
> > > > >
> > > > > From: Ruinland ChuanTzu Tsai <ruinland@andestech.com>
> > > > >
> > > > > During my modification on my previous patch series for custom CSR support, I
> > > > > believe this issue deserves its own discussion (or debate) because it's _not_
> > > > > as simple as "just put those options in Kconfig".
> > > > >
> > > > > The obstables I've encountered and the kluges I came up is listed as follow :
> > > > >
> > > > > (1) Due to the design of top-level meson.build, all Kconfig options will land
> > > > > into `*-config-devices.h` since minikconf will be only used after config_target
> > > > > being processed. This will let to the fact that linux-users won't be able to
> > > > > use custom CSR code properly becuase they only includes `*-config-devices.h`.
> > > > > And that is reasonble due to the fact that changes on cpu.c and csr.c is a
> > > > > target-related matter and linux-user mode shouldn't include device related
> > > > > headers in most of cases.
> > > > >
> > > > > So, modify meson.build to parse target/riscv/Kconfig during config_target phase
> > > > > is without doubts necessary.
> > > > >
> > > > > (2) Kconfig option `RISCV_CUSTOM_CSR` is introduced for RISC-V cpu models to
> > > > > toggle it at its will. Yet due to the fact that csr.o and cpu.o are linked
> > > > > altogether for all CPU models, the suffer will be shared without option.
> > > > > The only reasonable way to seperate build the fire lane which seperates vendor
> > > > > flavored cpu and spec-conformed ones, is to build them seperately with options
> > > > > toggled diffrently, just like RV32 and RV64 shares almost the same source base,
> > > > > yet the sources are compiled with differnt flags/definitions.
> > > > >
> > > > > To achieve that, miraculously, we can just put *.mak files into `target`
> > > > > directoy, because that's how `configure` enumerates what targets are supported.
> > > > >
> > > > > (3) The longest days are not over yet, if we take a good look at how the minikconf
> > > > > is invoked during config_devices and in what way *.mak presented its options
> > > > > inside `default-configs/devices`, we can see that *.mak files there is formated
> > > > > in `CONFIG_*` style and the minikconf is reading directly during config_device
> > > > > phase. That's totally different from *.mak files presented in
> > > > > `default-configs/targets`. To make the parsing logic consistent, I
> > > > > introduce a rv_custom directory inside which contains minikconf-parsable
> > > > > mak files.
> > > > >
> > > > > With this patches, ones can build a A25/AX25 linux-user platform by :
> > > > > $ ./configure --target-list=riscv64-andes-linux-user,riscv32-andes-linux-user
> > > >
> > > > Hey! Thanks for the patches
> > > >
> > > > I'm not convinced that we want this though.
> > > >
> > > > Right now we are trying to head towards a riscv64-softmmu binary being
> > > > able to run all RISC-V code. That include 32-bit cpus
> > > > (qemu-riscv64-softmmu -cpu r32...) and 64-bit CPUs. We shouldn't be
> > > > splitting out more targets.
> > > >
> > > > It also goes against the general idea of RISC-V in that everyone has a
> > > > standard compliant implementation, they can then add extra
> > > > functionality.
> > > >
> > > > In terms of Kconfig options. It doesn't seem like a bad idea to have
> > > > an option to fully disable custom CSRs. That way if someone really
> > > > wants performance and doesn't want custom CSRs they can disable the
> > > > switch. Otherwise we leave it on and all custom CSRs are available in
> > > > the build and then controlled by the CPU selection at runtime. If that
> > > > ends up being too difficult to implement though then we don't have to
> > > > have it.
> > > >
> > > > Thanks again for working on this.
> > > >
> > > > Alistair
> > > >
> > > >
> > > > > $ make
> > > > >
> > > > > P.S. The pacthes from :
> > > > > https://lists.gnu.org/archive/html/qemu-devel/2021-08/msg00913.html
> > > > > is needed. A clean-up and modified version will be sent out soon.
> > > > >
> > > > > P.P.S.
> > > > > I know these parts won't be easy to digest, and the further iterations will be
> > > > > needed, so I didn't ask my colleagues to sign-off for now.
> > > > >
> > > > > Cordially yours,
> > > > > Ruinland ChuanTzu Tsai
> > > > >
> > > > > Ruinland ChuanTzu Tsai (2):
> > > > >   Adding Kconfig options for custom CSR support and Andes CPU model
> > > > >   Adding necessary files for Andes platforms, cores to enable custom CSR
> > > > >     support
> > > > >
> > > > >  Kconfig                                       |  1 +
> > > > >  .../devices/riscv32-andes-softmmu.mak         | 17 ++++++++++++
> > > > >  .../devices/riscv64-andes-softmmu.mak         | 17 ++++++++++++
> > > > >  .../targets/riscv32-andes-linux-user.mak      |  1 +
> > > > >  .../targets/riscv32-andes-softmmu.mak         |  1 +
> > > > >  .../targets/riscv64-andes-linux-user.mak      |  1 +
> > > > >  .../targets/riscv64-andes-softmmu.mak         |  1 +
> > > > >  .../targets/rv_custom/no_custom.mak           |  0
> > > > >  .../rv_custom/riscv32-andes-linux-user.mak    |  1 +
> > > > >  .../rv_custom/riscv32-andes-softmmu.mak       |  1 +
> > > > >  .../targets/rv_custom/riscv32-linux-user.mak  |  1 +
> > > > >  .../targets/rv_custom/riscv32-softmmu.mak     |  1 +
> > > > >  .../rv_custom/riscv64-andes-linux-user.mak    |  1 +
> > > > >  .../rv_custom/riscv64-andes-softmmu.mak       |  1 +
> > > > >  .../targets/rv_custom/riscv64-linux-user.mak  |  1 +
> > > > >  .../targets/rv_custom/riscv64-softmmu.mak     |  1 +
> > > > >  meson.build                                   | 26 +++++++++++++++++++
> > > > >  target/riscv/Kconfig                          |  6 +++++
> > > > >  18 files changed, 79 insertions(+)
> > > > >  create mode 100644 default-configs/devices/riscv32-andes-softmmu.mak
> > > > >  create mode 100644 default-configs/devices/riscv64-andes-softmmu.mak
> > > > >  create mode 120000 default-configs/targets/riscv32-andes-linux-user.mak
> > > > >  create mode 120000 default-configs/targets/riscv32-andes-softmmu.mak
> > > > >  create mode 120000 default-configs/targets/riscv64-andes-linux-user.mak
> > > > >  create mode 120000 default-configs/targets/riscv64-andes-softmmu.mak
> > > > >  create mode 100644 default-configs/targets/rv_custom/no_custom.mak
> > > > >  create mode 100644 default-configs/targets/rv_custom/riscv32-andes-linux-user.mak
> > > > >  create mode 100644 default-configs/targets/rv_custom/riscv32-andes-softmmu.mak
> > > > >  create mode 120000 default-configs/targets/rv_custom/riscv32-linux-user.mak
> > > > >  create mode 120000 default-configs/targets/rv_custom/riscv32-softmmu.mak
> > > > >  create mode 100644 default-configs/targets/rv_custom/riscv64-andes-linux-user.mak
> > > > >  create mode 100644 default-configs/targets/rv_custom/riscv64-andes-softmmu.mak
> > > > >  create mode 120000 default-configs/targets/rv_custom/riscv64-linux-user.mak
> > > > >  create mode 120000 default-configs/targets/rv_custom/riscv64-softmmu.mak
> > > > >  create mode 100644 target/riscv/Kconfig
> > > > >
> > > > > --
> > > > > 2.32.0
> > > > >

