Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 440F25B1D86
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Sep 2022 14:45:32 +0200 (CEST)
Received: from localhost ([::1]:55400 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oWGuR-0000IJ-B2
	for lists+qemu-devel@lfdr.de; Thu, 08 Sep 2022 08:45:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ardb@kernel.org>) id 1oWGeG-0006iU-Vz
 for qemu-devel@nongnu.org; Thu, 08 Sep 2022 08:28:49 -0400
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1]:39950)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ardb@kernel.org>) id 1oWGeE-0008He-R1
 for qemu-devel@nongnu.org; Thu, 08 Sep 2022 08:28:48 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 720B161CC6
 for <qemu-devel@nongnu.org>; Thu,  8 Sep 2022 12:28:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D67FCC433D6
 for <qemu-devel@nongnu.org>; Thu,  8 Sep 2022 12:28:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1662640122;
 bh=U28ekyehFF4zl09McZF4xA6oqQCRhqFfvM23PnY6GIE=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Bd1eJndz3DHToHei2Pu55JkaM3s0NlY49/BVUWgxU1Zm2S7Oq1PB7I7kriP4B+JYl
 2rgcf4jeZfApnarPsD9NLfpVgflMT1kFbhC9HwcPG6LIXn73niKs0Ym1hc7MFJCE//
 /6j6aBTl01C280B9Q8wYsAdzgj+1rySSo7sEYCUI3lV9zZOvVV73T8+F9L8A+UfMUE
 m6obO55TW0oXgCw+4JjyPbUNyShkkaLJPNU2GMwbNewuVdMmqQzti4c7ojy4RDls0l
 7PNLIWJHb3+Yw3QuqyGnKruc2T5IWjvwfQpfayTrfl84eWdoGwxWvTnohPrvOBqTV6
 43Gd+8W+S4jRw==
Received: by mail-lj1-f169.google.com with SMTP id s15so19701425ljp.5
 for <qemu-devel@nongnu.org>; Thu, 08 Sep 2022 05:28:42 -0700 (PDT)
X-Gm-Message-State: ACgBeo1aGlximdbSRnBy0FfNm4LHT258PSr58WJeVGD7GRURpRH3p/7y
 EJ7A2KhduK7xXy3j+/TOp//muza8BiXzsLXkeAw=
X-Google-Smtp-Source: AA6agR5nzMEpETN8xr2ZkVusmf+vJheatX/PAvGFAee1SdP3wy/BscMpbIXi0JEKSNdrvXwXhM2+YIPZRry0bKaZdx0=
X-Received: by 2002:a2e:7314:0:b0:26a:ca18:60eb with SMTP id
 o20-20020a2e7314000000b0026aca1860ebmr2233209ljc.69.1662640120900; Thu, 08
 Sep 2022 05:28:40 -0700 (PDT)
MIME-Version: 1.0
References: <20220906103657.282785-1-Jason@zx2c4.com>
 <20220906063954-mutt-send-email-mst@kernel.org>
 <CAHmME9oyf5MmZ4gXkbm+dA3t1NBYB6XdPrk8N1OyKLi5Lke0Rg@mail.gmail.com>
 <20220906064500-mutt-send-email-mst@kernel.org>
 <CAMj1kXH3T48W=k42mrCbY15yc4KYvAfUaRaJJRrsfKbuOfE53A@mail.gmail.com>
 <YxcwCQ0vymro0vbu@redhat.com>
 <d45be9dc-b6e7-293a-7033-f2ca84fa387d@redhat.com>
In-Reply-To: <d45be9dc-b6e7-293a-7033-f2ca84fa387d@redhat.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Thu, 8 Sep 2022 14:28:29 +0200
X-Gmail-Original-Message-ID: <CAMj1kXG=5BW7Qb2pyBvYmNDKksOhoxc-4Cngd-4j_O7mAkbwMQ@mail.gmail.com>
Message-ID: <CAMj1kXG=5BW7Qb2pyBvYmNDKksOhoxc-4Cngd-4j_O7mAkbwMQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] x86: only modify setup_data if the boot protocol
 indicates safety
To: Laszlo Ersek <lersek@redhat.com>
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>, "Jason A. Donenfeld" <Jason@zx2c4.com>,
 Gerd Hoffmann <kraxel@redhat.com>, 
 Laurent Vivier <laurent@vivier.eu>, Paolo Bonzini <pbonzini@redhat.com>, 
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2604:1380:4641:c500::1;
 envelope-from=ardb@kernel.org; helo=dfw.source.kernel.org
X-Spam_score_int: -70
X-Spam_score: -7.1
X-Spam_bar: -------
X-Spam_report: (-7.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 8 Sept 2022 at 13:30, Laszlo Ersek <lersek@redhat.com> wrote:
>
> On 09/06/22 13:33, Daniel P. Berrang=C3=A9 wrote:
> > On Tue, Sep 06, 2022 at 01:14:50PM +0200, Ard Biesheuvel wrote:
> >> (cc Laszlo)
> >>
> >> On Tue, 6 Sept 2022 at 12:45, Michael S. Tsirkin <mst@redhat.com> wrot=
e:
> >>>
> >>> On Tue, Sep 06, 2022 at 12:43:55PM +0200, Jason A. Donenfeld wrote:
> >>>> On Tue, Sep 6, 2022 at 12:40 PM Michael S. Tsirkin <mst@redhat.com> =
wrote:
> >>>>>
> >>>>> On Tue, Sep 06, 2022 at 12:36:56PM +0200, Jason A. Donenfeld wrote:
> >>>>>> It's only safe to modify the setup_data pointer on newer kernels w=
here
> >>>>>> the EFI stub loader will ignore it. So condition setting that offs=
et on
> >>>>>> the newer boot protocol version. While we're at it, gate this on S=
EV too.
> >>>>>> This depends on the kernel commit linked below going upstream.
> >>>>>>
> >>>>>> Cc: Gerd Hoffmann <kraxel@redhat.com>
> >>>>>> Cc: Laurent Vivier <laurent@vivier.eu>
> >>>>>> Cc: Michael S. Tsirkin <mst@redhat.com>
> >>>>>> Cc: Paolo Bonzini <pbonzini@redhat.com>
> >>>>>> Cc: Peter Maydell <peter.maydell@linaro.org>
> >>>>>> Cc: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> >>>>>> Cc: Richard Henderson <richard.henderson@linaro.org>
> >>>>>> Cc: Ard Biesheuvel <ardb@kernel.org>
> >>>>>> Link: https://lore.kernel.org/linux-efi/20220904165321.1140894-1-J=
ason@zx2c4.com/
> >>>>>> Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
> >>>>>
> >>>>> BTW what does it have to do with SEV?
> >>>>> Is this because SEV is not going to trust the data to be random any=
way?
> >>>>
> >>>> Daniel (now CC'd) pointed out in one of the previous threads that th=
is
> >>>> breaks SEV, because the image hash changes.
> >>>>
> >>>> Jason
> >>>
> >>> Oh I see. I'd add a comment maybe and definitely mention this
> >>> in the commit log.
> >>>
> >>
> >> This does raise the question (as I mentioned before) how things like
> >> secure boot and measured boot are affected when combined with direct
> >> kernel boot: AIUI, libvirt uses direct kernel boot at guest
> >> installation time, and modifying setup_data will corrupt the image
> >> signature.
> >
> > IIUC, qemu already modifies setup_data when using direct kernel boot.
> >
> > It put in logic to skip this if SEV is enabled, to avoid interfering
> > with SEV hashes over the kernel, but there's nothing doing this more
> > generally for non-SEV cases using UEFI. So potentially use of SecureBoo=
t
> > may already be impacted when using direct kernel boot.
>
> Yes,
>
> https://github.com/tianocore/edk2/commit/82808b422617
>

Ah yes, thanks for jogging my memory.

So virt-install --network already ignores secure boot failures on
direct kernel boot, so this is not going to make it any worse.

