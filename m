Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 169A04DBAAD
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Mar 2022 23:30:57 +0100 (CET)
Received: from localhost ([::1]:60222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUcAR-0005n9-U9
	for lists+qemu-devel@lfdr.de; Wed, 16 Mar 2022 18:30:55 -0400
Received: from eggs.gnu.org ([209.51.188.92]:51404)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nUc3O-0006F6-NU
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 18:23:38 -0400
Received: from [2607:f8b0:4864:20::132] (port=35617
 helo=mail-il1-x132.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nUc3N-0006og-8C
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 18:23:38 -0400
Received: by mail-il1-x132.google.com with SMTP id i2so1507654ila.2
 for <qemu-devel@nongnu.org>; Wed, 16 Mar 2022 15:23:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bnlMCyeG1qAFVZXCZjgt6KB/TjUZTdtn/PiWY+AK/jQ=;
 b=C5FD7sarfsZq9EdytsQImug79G88Q/aj6P0x7SU9NP04dR1D44quH+/YmPcZc3bGyI
 nh2hqZ0sIisAO9k6FhkgDh464l+AASc0HbLTNhicv87IPklYSnLJfFMtDO4fZ3Ph9+U7
 ENl2J/ZbRZHqhdz6kDzxl2dx97edjtg2OXXd7woiwh4CrUR+XadI8haI1wFatYKuAoIU
 sicotC2mjhqwKAoOP8PhLgArS0ePVx3EVxNrLcymPBkffQPDPltW4bOHiqQq5tWvtWIE
 pqu3+3jhvK9f5MhxVuBZTlOY/FYJ2ohlhLc6uoMG12LjK3Kiv/+8wWr9L6aBY8h+/JxT
 bSzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bnlMCyeG1qAFVZXCZjgt6KB/TjUZTdtn/PiWY+AK/jQ=;
 b=3Zla9hV3gZxSWGvuPEjU5N9K5py8KkjrMCUDFnM2mEax0WG1s2K4F10qH8n0s2d/KI
 K3u3WG/P4VOAwhjySAfJ23T0NqbmRPQZ9pf5B/NAGEC2g7jJMKSlCfVhYjgBumJY/KEE
 FkPd+r1IqmDfbAM6MAuf0N/7BOxbkI/STYOllBBD9RqMeprw/SwiS25Ix3GTRXlotgV2
 NkVuPxbGq/Aw4P6gwhfy2+asfRiOjhIzKBiqWMU0FmQopMylu+0WebWUCmWG9t4vrSUc
 2/MNDrGqy6bH+aydJVhl1GuRSdLgEvjbcCOzPBlu+TG1UqZO057jddD/GAyHO1wtYnXg
 IeXA==
X-Gm-Message-State: AOAM530Gh9j9tdmzXbSK4I6r4YRQrlbI3V49sB9I7v5CaFoZXfLLlgvD
 f3DecnXrD1zkwpqtJqYamT49TakliktzFlMVkiw=
X-Google-Smtp-Source: ABdhPJxp7ruotHcqy3FbyaMI8I2y7nQTeX+kVGD9mRjs/xMZqlGaL9mCRJEJ70nv6OwbMyu+c5sUS3zozCv1yJ71kyM=
X-Received: by 2002:a05:6e02:154c:b0:2c6:4ffa:57ec with SMTP id
 j12-20020a056e02154c00b002c64ffa57ecmr670245ilu.55.1647469415769; Wed, 16 Mar
 2022 15:23:35 -0700 (PDT)
MIME-Version: 1.0
References: <57412635-6b46-823b-14a4-0ee694ace5b8@oth-regensburg.de>
 <CAKmqyKOZN=hS73TfgHfMtxktZ9kkw4kBBA4-gjGAV8Q0Kw+KHw@mail.gmail.com>
 <CAAhSdy23Ag=ZqUj82aZ6BNA2SJq54rbCDjeX=1cHtbq7LR8jaQ@mail.gmail.com>
 <a840f9ac-7315-4381-4c85-719efb413b18@oth-regensburg.de>
 <CAFEAcA98VQmM_ETpNuhq31Y7xLkS_AjVRsTeCdnqzMZG-3uxBA@mail.gmail.com>
 <3783dce0-0c5b-824e-2097-bbc3367281a6@oth-regensburg.de>
In-Reply-To: <3783dce0-0c5b-824e-2097-bbc3367281a6@oth-regensburg.de>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 17 Mar 2022 08:23:09 +1000
Message-ID: <CAKmqyKNf3qL9k83tRD+=Frdue=+WZNAJ8RxK4UivCjz0Adjbqg@mail.gmail.com>
Subject: Re: [EXT] Re: QEMU+KVM on RISC-V + Hypervisor Extension
To: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::132
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::132;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x132.google.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.659,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Anup Patel <apatel@ventanamicro.com>,
 Peter Maydell <peter.maydell@linaro.org>, Anup Patel <anup@brainfault.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Jiangyifei <jiangyifei@huawei.com>,
 Stefan Huber <stefan.huber@oth-regensburg.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Mar 15, 2022 at 10:51 PM Ralf Ramsauer
<ralf.ramsauer@oth-regensburg.de> wrote:
>
>
>
> On 15/03/2022 13:42, Peter Maydell wrote:
> > On Tue, 15 Mar 2022 at 12:29, Ralf Ramsauer
> > <ralf.ramsauer@oth-regensburg.de> wrote:
> >> I have no kernel specified in the guest, so I'd then expect to boot into
> >> an completely empty machine (besides the tiny startup stub in the MROM).
> >> However, I still get the exact same error as mentioned in my initial mail.
> >>
> >> Again, without "-enable-kvm", everything works as expected (i.e., I
> >> don't see any output, because there's basically no guest code to execute).
> >
> > Well, you'll always be trying to execute something, even if it's
> > all-zeroes. I dunno what RISC-V does with its encodings, but you
> > typically either end up in an infinite loop of taking exceptions
> > (if all-0s isn't a valid instruction) or else you just execute
> > through all of guest RAM (if it is something similar to a no-op).
> > In the latter scenario it's quite plausible that the guest ends
> > up doing something KVM doesn't expect, such as trying to execute
> > from an area of the address space where there is no RAM, or a device.
> > If so, "return failure from VCPU_RUN and QEMU aborts" is what I
> > think I would expect to see.
> >
> > If I were you I would try it with some actual guest code loaded
> > at a location where there is RAM...
>
> I guess you are right, and I think, together with the other mail, I now
> understand why I experienced a failure:
>
> As Anup explained, there is no M-Mode, but I passed an OpenSBI BIOS. The
> initial MROM handed over to OpenSBI (located at RAM base 0x80000000). At
> some point, OpenSBI threw an exception (maybe it accessed an CSR it is
> not allowed to, whatever), because it is in S-Mode. Exception vectors
> were not (yet) installed, but initialized with 0x0.

Hmm... This seems like a bug. We shouldn't allow the user to specify a
`-bios` option if using KVM. Would you mind preparing a patch to catch
this?

Alistair

>
> This is how I ended up with the PC at 0x0. Behind 0x0, there's no
> physical backing, and KVM threw an Instruction Guest PF (SCAUSE=0x14).
>
> Didn't verify this, but this somehow sounds plausible to me.
>
> Thanks!
>    Ralf
>
> >
> > -- PMM

