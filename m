Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D0FA68DB91
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 15:33:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPP2C-0001Ug-Jh; Tue, 07 Feb 2023 09:33:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1pPP1u-0001G6-Fb
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 09:33:07 -0500
Received: from mail-yw1-x112b.google.com ([2607:f8b0:4864:20::112b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1pPP1s-0007vc-PN
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 09:33:06 -0500
Received: by mail-yw1-x112b.google.com with SMTP id
 00721157ae682-527979e8670so111174307b3.10
 for <qemu-devel@nongnu.org>; Tue, 07 Feb 2023 06:33:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=RTH+aH0oSY3ZVMd9O3U15uYMHnEaKKfdSwajJ12ADOI=;
 b=OVTQhbegMlYyAF7g4djIvtyt0hHaAhM6URGUcqV79ytkKaJSPqC0WwFghFl2Bz4TeM
 SmlvTClvHyY+w2+Ln0z9WhuEDQ/MZ3/zF7dx/Y+aLhZ9bjFkFqHZ4f1AFOPsTINeBHl9
 T7iVdmIS8lIcNcYHHO7QFYIkj3RMdhXYAmAR4RV7SmvNuDGefaks32Mgg+ji1+NaIUyQ
 oYQ4ZX4cVVrPmGwtVphzMeL/yN4660mDSr/V/udj7Mwuj6imMSlB4ARcHMl10x9CprA7
 VuulCT68r1CIc0B1MDq+IWJ73ghRaxV5EjRFFbavlGb0GuzRvEwRDfpIbOPh8Wrya7MC
 d3SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=RTH+aH0oSY3ZVMd9O3U15uYMHnEaKKfdSwajJ12ADOI=;
 b=dCXpilbxQkg8pOnTG3SbaAPRDuPzSVM3gRdajgKdZbQuu3+oG9vaPcYy2H3kVOf5+2
 Dj9mY3efCX59yQXNC+eyw8DVVdKTJhx89u2RF+XMv269cI6QS1/sJMWIqo9nXcq7XP8/
 CFDCYosDUSROA/70UC/Nt0XKPmUYhrM95NuRNrvT5pJneCMHU0n1Y2RxjjroSiOlWhd1
 OjnlZ5xA/FxUpVKrE9gwGWnylxmfaRGb0J93HFY2Q9H7yj7Hg1/2emUo/IE3LGYPSdxY
 lp2LqsmmyXehhSazSv71t7YAysHQ+aKAgFRPBgZ7dEzkLl4Z3qGVsar8F2M7lLI3OE1K
 Ubsg==
X-Gm-Message-State: AO0yUKVoE/Hd+x6H4kwoAh/sJSIy1f7FNymoZfAyl427xyl8GhaHF01M
 wOO/5ryei9SduL0x7ktpAg4eBtOHVh/rYKS5Am4=
X-Google-Smtp-Source: AK7set++S9is4bzsa+KfhYVLzXm962DXR+Of+cTGrOBJRzVHYEGEkM2v3+gXYH3mkJxJfixxV/DpetVZ9yy3PmWI3+Q=
X-Received: by 2002:a81:a10f:0:b0:527:ac79:7808 with SMTP id
 y15-20020a81a10f000000b00527ac797808mr301705ywg.239.1675780382820; Tue, 07
 Feb 2023 06:33:02 -0800 (PST)
MIME-Version: 1.0
References: <CAJSP0QUuuZLC0DJNEfZ7amyd3XnRhRNr1k+1OgLfDeF77X1ZDQ@mail.gmail.com>
 <CAELaAXysa3M-TPbLMCVCwpt40iqhXpF7PCan_i6SzY_YMafXrg@mail.gmail.com>
 <CAJSP0QWLdbNqyrGnhRB3AqMpH0xYFK6+=TpWrrytQzn9MGD2zA@mail.gmail.com>
 <CAELaAXwAF1QSyfFEzqBFJk69VZN9cEC=H=hHh6kvndFm9p0f6w@mail.gmail.com>
 <CAELaAXx6cUhcs+Yi4Kev6BfcG0LO8H_hAKWrCBL77TbmguKO+w@mail.gmail.com>
In-Reply-To: <CAELaAXx6cUhcs+Yi4Kev6BfcG0LO8H_hAKWrCBL77TbmguKO+w@mail.gmail.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Tue, 7 Feb 2023 09:32:50 -0500
Message-ID: <CAJSP0QXqOkVEza0S=A-Ct_6FqRGe3BQgkJEG6HnqoMAdLhJ5pA@mail.gmail.com>
Subject: Re: Call for GSoC and Outreachy project ideas for summer 2023
To: Alberto Faria <afaria@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, kvm <kvm@vger.kernel.org>, 
 Rust-VMM Mailing List <rust-vmm@lists.opendev.org>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Paolo Bonzini <pbonzini@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Thomas Huth <thuth@redhat.com>, John Snow <jsnow@redhat.com>, 
 Stefano Garzarella <sgarzare@redhat.com>,
 =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>, 
 "Florescu, Andreea" <fandree@amazon.com>,
 Damien <damien.lemoal@opensource.wdc.com>, 
 Dmitry Fomichev <dmitry.fomichev@wdc.com>, Hanna Reitz <hreitz@redhat.com>, 
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Bernhard Beschow <shentey@gmail.com>, Sean Christopherson <seanjc@google.com>, 
 Vitaly Kuznetsov <vkuznets@redhat.com>, gmaglione@redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112b;
 envelope-from=stefanha@gmail.com; helo=mail-yw1-x112b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, 7 Feb 2023 at 05:30, Alberto Faria <afaria@redhat.com> wrote:
>
> On Tue, Feb 7, 2023 at 10:23 AM Alberto Faria <afaria@redhat.com> wrote:
> > On Mon, Feb 6, 2023 at 9:22 PM Stefan Hajnoczi <stefanha@gmail.com> wrote:
> > > Great that you're interesting, Alberto! Both sound feasible. I would
> > > like to co-mentor the zoned storage project or can at least commit to
> > > being available to help because zoned storage is currently on my mind
> > > anyway :).
> >
> > Perfect, I'll have time to co-mentor one project, but probably not
> > two, so let's leave the NVMe driver project aside for now. If anyone
> > wants to take that one over, though, go for it.
> >
> > > Do you want to write up one or both of them using the project template
> > > below? You can use the other project ideas as a reference for how much
> > > detail to include: https://wiki.qemu.org/Google_Summer_of_Code_2023
> >
> > I feel like this is closer to a 175 hour project than a 350 hour one,
> > but I'm not entirely sure.
> >
> >   === Zoned device support for libblkio ===
> >
> >    '''Summary:''' Add support for zoned block devices to the libblkio library.
> >
> >    Zoned block devices are special kinds of disks that are split into several
> >    regions called zones, where each zone may only be written
> > sequentially and data
> >    can't be updated without resetting the entire zone.
> >
> >    libblkio is a library that provides an API for efficiently accessing block
> >    devices using modern high-performance block I/O interfaces like
> > Linux io_uring.
> >
> >    The goal is to extend libblkio so users can use it to access zoned devices
> >    properly. This will require adding support for more request types, expanding
> >    its API to expose additional metadata about the device, and making the
> >    appropriate changes to each libblkio "driver".
> >
> >    This is important for QEMU since it will soon support zoned devices too and
> >    several of its BlockDrivers rely on libblkio. In particular, this
> > project would
> >    enable QEMU to access zoned vhost-user-blk and vhost-vdpa-blk devices.
>
> Also, a stretch/bonus goal could be to make the necessary changes to
> QEMU to actually make use of libblkio's zoned device support.

Great, I have added it to the wiki and included a list of tasks:
https://wiki.qemu.org/Internships/ProjectIdeas/LibblkioZonedStorage

Feel free to edit it.

I think this project could just as easily be 350 hours, but I'm happy
to mentor a 175 hour project with a more modest scope.

Stefan

