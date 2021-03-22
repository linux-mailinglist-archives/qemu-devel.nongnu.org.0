Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D72B344D32
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 18:24:57 +0100 (CET)
Received: from localhost ([::1]:50448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOOIS-00077w-G3
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 13:24:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40556)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lOOCo-0000L6-Vv
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 13:19:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33032)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lOOCd-00015o-KY
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 13:19:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616433527;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6EIOj8kOe3G8xmO5YEi69htRRkTwVIv59rtCOgFmuXc=;
 b=bvtOzIeITZTet3qeeR8uJ/L9eUy/41T6M/oFO9GCBPzSSb46roIKCZHTU+8QPhfEyljTgY
 cNQuqEzf6sHC9YH80RFIaT1qmUUpxbHddeHWsGkvQ2xRnH3O7DWZOvB0SwbaEItW1qyhtC
 dSAIbcqxmTgMccXNG0SgI55xowJ2Dmg=
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com
 [209.85.221.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-110-tuca0cI-OdyTeMYvLMx0QA-1; Mon, 22 Mar 2021 13:18:45 -0400
X-MC-Unique: tuca0cI-OdyTeMYvLMx0QA-1
Received: by mail-vk1-f200.google.com with SMTP id u123so15901984vku.15
 for <qemu-devel@nongnu.org>; Mon, 22 Mar 2021 10:18:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=6EIOj8kOe3G8xmO5YEi69htRRkTwVIv59rtCOgFmuXc=;
 b=b1c7scZ3ku8vGfy2BKKQoWLDUC6E8akPy5RvF4zLhPNpNCldo6E+SNMj5xAEznx2ON
 jXU5ZdV7D2oEzxgfjqJTwku7V8yXgBkFQ5IsQ8DaY+BqmW+7zSDGnHBSf6OwhYqA3HU6
 Y+TbO1wKIfv4EJEoWRVkxy9XgQVp0SL59ICl+GQvfZ7Wy+MovufALmrmyZFX+69vEizT
 ONXTzxkFpeA3VJ3HdF+TOtoEA4G0JXffcJg3vBeEuU35P//0n8Zw541aocumUJnLh7ya
 wD4K0K1C1Rfe2kC76JJb5vp42lDpRomYy/bG/uwaktK+FQhfRso/n7Zph5LG1qQR8U9s
 FYvg==
X-Gm-Message-State: AOAM5313zuho+KNfy96o4g1XUBqWnkpjnSQBta3ZX6ZS2f9A4MOYlYcm
 Y9J/Bx83+nwY9KAD3/B7AsTchbn/usXzndeZfoHTtDyPEvttPDs2AaSrPtQ5mPLsbYhYq6ugJOo
 ToQ0Uz85HKNFhDWCNlwt2WKSmxUfGU/Y=
X-Received: by 2002:a1f:7889:: with SMTP id t131mr958213vkc.2.1616433524909;
 Mon, 22 Mar 2021 10:18:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxUSUL7A7ErcCIBTC8i1bIwI6GGECPL2KJueHM82Jp3DKJ2bwOEh0ev1AUTLknH+FIhxb4VwqHWTpYyjK7dFIk=
X-Received: by 2002:a1f:7889:: with SMTP id t131mr958087vkc.2.1616433523716;
 Mon, 22 Mar 2021 10:18:43 -0700 (PDT)
MIME-Version: 1.0
References: <20210304203540.41614-1-nieklinnenbank@gmail.com>
 <20210304203540.41614-3-nieklinnenbank@gmail.com>
 <CAKJDGDZq_ioF91BUWRo_y0GKYGbjgZa46Pt83wp7t3b_ZC=ixw@mail.gmail.com>
 <4d6d2e89-1152-249b-fe55-d1b611fd77e8@redhat.com>
 <CAPan3WqJHFy=GKVXFHgDbTimmZsBueUUhxvs4L+D58J-JQF3ew@mail.gmail.com>
 <CAKJDGDaUrbVpmNRvJvc+psWXzNUk6s=u8NxsR6E727UjiwsjeQ@mail.gmail.com>
 <CAKJDGDZ2yf_Z1y6qxmet=6rtH90C1BZ_cOGNW41Jk-d1EzJFwQ@mail.gmail.com>
 <fe4d5ba3-643a-70c0-417f-73d5ccb5acda@amsat.org>
In-Reply-To: <fe4d5ba3-643a-70c0-417f-73d5ccb5acda@amsat.org>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Mon, 22 Mar 2021 14:18:17 -0300
Message-ID: <CAKJDGDZtNhro8YhCQVatO8Xw5riwz7593mmg9r4HaMDn+vC1ZQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/5] tests/acceptance/boot_linux_console: remove
 Armbian 19.11.3 bionic test for orangepi-pc machine
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
 Beniamino Galvani <b.galvani@gmail.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
 Pavel Dovgalyuk <Pavel.Dovgaluk@ispras.ru>,
 Cleber Rosa Junior <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Philippe,

On Mon, Mar 22, 2021 at 1:54 PM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g> wrote:
>
> Hi Willian,
>
> On 3/8/21 9:44 PM, Willian Rampazzo wrote:
> > On Mon, Mar 8, 2021 at 5:41 PM Willian Rampazzo <wrampazz@redhat.com> w=
rote:
> >>
> >> On Mon, Mar 8, 2021 at 5:32 PM Niek Linnenbank <nieklinnenbank@gmail.c=
om> wrote:
> >>>
> >>> Hi Philippe, Willian,
> >>>
> >>> On Mon, Mar 8, 2021 at 8:52 AM Philippe Mathieu-Daud=C3=A9 <philmd@re=
dhat.com> wrote:
> >>>>
> >>>> On 3/5/21 4:16 PM, Willian Rampazzo wrote:
> >>>>> On Thu, Mar 4, 2021 at 5:44 PM Niek Linnenbank <nieklinnenbank@gmai=
l.com> wrote:
> >>>>>>
> >>>>>> The image for Armbian 19.11.3 bionic has been removed from the arm=
bian server.
> >>>>>> Without the image as input the test arm_orangepi_bionic_19_11 cann=
ot run.
> >>>>>>
> >>>>>> This commit removes the test completely and merges the code of the=
 generic function
> >>>>>> do_test_arm_orangepi_uboot_armbian back with the 20.08 test.
> >>>>>>
> >>>>>> Signed-off-by: Niek Linnenbank <nieklinnenbank@gmail.com>
> >>>>>> ---
> >>>>>>  tests/acceptance/boot_linux_console.py | 72 ++++++++-------------=
-----
> >>>>>>  1 file changed, 23 insertions(+), 49 deletions(-)
> >>>>>>
> >>>>>> diff --git a/tests/acceptance/boot_linux_console.py b/tests/accept=
ance/boot_linux_console.py
> >>>>>> index eb01286799..9fadea9958 100644
> >>>>>> --- a/tests/acceptance/boot_linux_console.py
> >>>>>> +++ b/tests/acceptance/boot_linux_console.py
> >>>>>> @@ -802,7 +802,29 @@ def test_arm_orangepi_sd(self):
> >>>>>>          # Wait for VM to shut down gracefully
> >>>>>>          self.vm.wait()
> >>>>>>
> >>>>>> -    def do_test_arm_orangepi_uboot_armbian(self, image_path):
> >>>>>> +    @skipUnless(os.getenv('ARMBIAN_ARTIFACTS_CACHED'),
> >>>>>> +                'Test artifacts fetched from unreliable apt.armbi=
an.com')
> >>>>>> +    @skipUnless(os.getenv('AVOCADO_ALLOW_LARGE_STORAGE'), 'storag=
e limited')
> >>>>>> +    def test_arm_orangepi_bionic_20_08(self):
> >>>>>> +        """
> >>>>>> +        :avocado: tags=3Darch:arm
> >>>>>> +        :avocado: tags=3Dmachine:orangepi-pc
> >>>>>> +        :avocado: tags=3Ddevice:sd
> >>>>>> +        """
> >>>>>> +
> >>>>>> +        # This test download a 275 MiB compressed image and expan=
d it
> >>>>>> +        # to 1036 MiB, but the underlying filesystem is 1552 MiB.=
..
> >>>>>> +        # As we expand it to 2 GiB we are safe.
> >>>>>> +
> >>>>>> +        image_url =3D ('https://dl.armbian.com/orangepipc/archive=
/'
> >>>>>> +                     'Armbian_20.08.1_Orangepipc_bionic_current_5=
.8.5.img.xz')
> >>>>>
> >>>>> The Armbian 20 is not available on this link anymore. I can browse =
just 21.
> >>>>
> >>>> Cat-and-mouse game *sigh*.
>
> 2021-03-22 17:18:10,701 download         L0067 INFO | Fetching
> https://archive.armbian.com/orangepipc/archive/Armbian_20.08.1_Orangepipc=
_bionic_current_5.8.5.img.xz
> -> /home/phil/avocado/da
> ta/cache/by_location/f2eb27a12b81ce15e93f340fabbced2136af1caa/Armbian_20.=
08.1_Orangepipc_bionic_current_5.8.5.img.xz.nfwdzivg
> 2021-03-22 17:18:11,263 asset            L0136 INFO | Temporary asset
> file unavailable due to failed download attempt.
> 2021-03-22 17:18:11,263 asset            L0368 ERROR| URLError: <urlopen
> error [Errno 113] No route to host>
>
> It might be a temporary problem, but looking long term the
> current setup doesn't scale IMHO.
>

Have you changed something in the test? The test is supposed to skip
when the asset is not available in the cache. What was the result of
this test execution? Skip, fail, or error? If it was not Skip, we need
to investigate what happened.

> >>> Just to clarify here: in this patch I wanted to only make the change =
to remove the test for the 19.11.3 image.
> >>> And in the 3rd patch (tests/acceptance/boot_linux_console: change URL=
 for test_arm_orangepi_bionic_20_08)
> >>> do the update for to correct the 20.08 link. So each patch fixes one =
problem at a time.
> >>>
> >>> Does that make sense, or do you prefer that I combine them in a singl=
e patch instead?
> >>
> >> Ops, I forgot about the 3rd patch in this series. That makes sense to
> >> me, sorry for the mess.
> >>
> >
> > And, in this case,
> >
> > Reviewed-by: Willian Rampazzo <willianr@redhat.com>
> >
> >>>
> >>> Regards,
> >>> Niek
> >>>
> >>> --
> >>> Niek Linnenbank
> >>>
> >
>


