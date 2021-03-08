Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 30E943318D3
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 21:47:21 +0100 (CET)
Received: from localhost ([::1]:41434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJMme-00027E-7c
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 15:47:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lJMkp-0001Lg-J1
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 15:45:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58110)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lJMkn-0006Mv-Ce
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 15:45:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615236324;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8DznHYerOPOtkTEXJEAY2N/mu3UvWoXYBXaJgVA4E2c=;
 b=iSZvYWU16TECHA82NeIptYAVSnr3MPAPr6pVbJpIN+A9zyVUdgD2Y9VFcuMPak7lhXGFcN
 fIwgtevFIE5/lL90+M5kQqQr6R7hmnwjkl8RaOgDiK7kyi2e0i4IsvvBJQDceybtlM2LfK
 QtMymCXTCt7WR1hYkJEX+MlKrQRuNrM=
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com
 [209.85.221.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-227-n17PohuTNYykrIZuIjM9AQ-1; Mon, 08 Mar 2021 15:45:22 -0500
X-MC-Unique: n17PohuTNYykrIZuIjM9AQ-1
Received: by mail-vk1-f197.google.com with SMTP id w10so1313713vke.13
 for <qemu-devel@nongnu.org>; Mon, 08 Mar 2021 12:45:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=8DznHYerOPOtkTEXJEAY2N/mu3UvWoXYBXaJgVA4E2c=;
 b=uTP3jv24sdkAxMdhNTgclIuT8ku+Ns+W2mtKB54fstsQ5+09v/CGWu5kiGq5hgmVZs
 6mZlimXr2nX2SfT6OY5qm9gXJDLf1Pj0feUiPKKKAeOmLVKwLX2nk9iYjcCvV9YAjzty
 qA9uIAdRXp/aRZoMz1kMKWdejoYDaRQfrsn2i0O6IvJdS+8OS78/KugvO7BSlruxtGGU
 SsnAIeYq/sICNrtRdE0twjPy+fPJRmjkZWQxKmjJLp7tXPPwlCgWmnZo6gr4u3TBtL0F
 hOZRpowNA7Vln/hgxKQrx8WGFOj/TkeNTlzJ92z798FGprLURYen4r6tBN1fjLLFueGg
 tMGg==
X-Gm-Message-State: AOAM531LBr0IlQvTtFomFe5X/mASMlJQLqet1ZA6tu2xojNsxuJ7lTgM
 MrVCxZNsIReXAMBDE4Bz3+41cnmQVWfuyTSVQR7vkzTherlxYa3gZVd/sp5ttj2Dr7oTKRF6aeq
 ptYERBUkTGwcv/k4ySPLyqWIrNZlop88=
X-Received: by 2002:a1f:b250:: with SMTP id b77mr15137773vkf.7.1615236322014; 
 Mon, 08 Mar 2021 12:45:22 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwSkRVdfZkiI5T1Sgs//qO0+zPWhIId+e+kweEtYyofNP0c6gF/pAk19+1CLI0BXnb5jG2TiGvBXZDAoZiIcHw=
X-Received: by 2002:a1f:b250:: with SMTP id b77mr15137756vkf.7.1615236321792; 
 Mon, 08 Mar 2021 12:45:21 -0800 (PST)
MIME-Version: 1.0
References: <20210304203540.41614-1-nieklinnenbank@gmail.com>
 <20210304203540.41614-3-nieklinnenbank@gmail.com>
 <CAKJDGDZq_ioF91BUWRo_y0GKYGbjgZa46Pt83wp7t3b_ZC=ixw@mail.gmail.com>
 <4d6d2e89-1152-249b-fe55-d1b611fd77e8@redhat.com>
 <CAPan3WqJHFy=GKVXFHgDbTimmZsBueUUhxvs4L+D58J-JQF3ew@mail.gmail.com>
 <CAKJDGDaUrbVpmNRvJvc+psWXzNUk6s=u8NxsR6E727UjiwsjeQ@mail.gmail.com>
In-Reply-To: <CAKJDGDaUrbVpmNRvJvc+psWXzNUk6s=u8NxsR6E727UjiwsjeQ@mail.gmail.com>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Mon, 8 Mar 2021 17:44:56 -0300
Message-ID: <CAKJDGDZ2yf_Z1y6qxmet=6rtH90C1BZ_cOGNW41Jk-d1EzJFwQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/5] tests/acceptance/boot_linux_console: remove
 Armbian 19.11.3 bionic test for orangepi-pc machine
To: Niek Linnenbank <nieklinnenbank@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Daniel Berrange <berrange@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Beniamino Galvani <b.galvani@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
 Pavel Dovgalyuk <Pavel.Dovgaluk@ispras.ru>,
 Cleber Rosa Junior <crosa@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Mar 8, 2021 at 5:41 PM Willian Rampazzo <wrampazz@redhat.com> wrote=
:
>
> On Mon, Mar 8, 2021 at 5:32 PM Niek Linnenbank <nieklinnenbank@gmail.com>=
 wrote:
> >
> > Hi Philippe, Willian,
> >
> > On Mon, Mar 8, 2021 at 8:52 AM Philippe Mathieu-Daud=C3=A9 <philmd@redh=
at.com> wrote:
> >>
> >> On 3/5/21 4:16 PM, Willian Rampazzo wrote:
> >> > On Thu, Mar 4, 2021 at 5:44 PM Niek Linnenbank <nieklinnenbank@gmail=
.com> wrote:
> >> >>
> >> >> The image for Armbian 19.11.3 bionic has been removed from the armb=
ian server.
> >> >> Without the image as input the test arm_orangepi_bionic_19_11 canno=
t run.
> >> >>
> >> >> This commit removes the test completely and merges the code of the =
generic function
> >> >> do_test_arm_orangepi_uboot_armbian back with the 20.08 test.
> >> >>
> >> >> Signed-off-by: Niek Linnenbank <nieklinnenbank@gmail.com>
> >> >> ---
> >> >>  tests/acceptance/boot_linux_console.py | 72 ++++++++--------------=
----
> >> >>  1 file changed, 23 insertions(+), 49 deletions(-)
> >> >>
> >> >> diff --git a/tests/acceptance/boot_linux_console.py b/tests/accepta=
nce/boot_linux_console.py
> >> >> index eb01286799..9fadea9958 100644
> >> >> --- a/tests/acceptance/boot_linux_console.py
> >> >> +++ b/tests/acceptance/boot_linux_console.py
> >> >> @@ -802,7 +802,29 @@ def test_arm_orangepi_sd(self):
> >> >>          # Wait for VM to shut down gracefully
> >> >>          self.vm.wait()
> >> >>
> >> >> -    def do_test_arm_orangepi_uboot_armbian(self, image_path):
> >> >> +    @skipUnless(os.getenv('ARMBIAN_ARTIFACTS_CACHED'),
> >> >> +                'Test artifacts fetched from unreliable apt.armbia=
n.com')
> >> >> +    @skipUnless(os.getenv('AVOCADO_ALLOW_LARGE_STORAGE'), 'storage=
 limited')
> >> >> +    def test_arm_orangepi_bionic_20_08(self):
> >> >> +        """
> >> >> +        :avocado: tags=3Darch:arm
> >> >> +        :avocado: tags=3Dmachine:orangepi-pc
> >> >> +        :avocado: tags=3Ddevice:sd
> >> >> +        """
> >> >> +
> >> >> +        # This test download a 275 MiB compressed image and expand=
 it
> >> >> +        # to 1036 MiB, but the underlying filesystem is 1552 MiB..=
.
> >> >> +        # As we expand it to 2 GiB we are safe.
> >> >> +
> >> >> +        image_url =3D ('https://dl.armbian.com/orangepipc/archive/=
'
> >> >> +                     'Armbian_20.08.1_Orangepipc_bionic_current_5.=
8.5.img.xz')
> >> >
> >> > The Armbian 20 is not available on this link anymore. I can browse j=
ust 21.
> >>
> >> Cat-and-mouse game *sigh*.
> >>
> >
> > Just to clarify here: in this patch I wanted to only make the change to=
 remove the test for the 19.11.3 image.
> > And in the 3rd patch (tests/acceptance/boot_linux_console: change URL f=
or test_arm_orangepi_bionic_20_08)
> > do the update for to correct the 20.08 link. So each patch fixes one pr=
oblem at a time.
> >
> > Does that make sense, or do you prefer that I combine them in a single =
patch instead?
>
> Ops, I forgot about the 3rd patch in this series. That makes sense to
> me, sorry for the mess.
>

And, in this case,

Reviewed-by: Willian Rampazzo <willianr@redhat.com>

> >
> > Regards,
> > Niek
> >
> > --
> > Niek Linnenbank
> >


