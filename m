Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FDF8344FAB
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 20:12:30 +0100 (CET)
Received: from localhost ([::1]:33394 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOPyW-0002KW-VY
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 15:12:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43786)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lOPwt-0001W3-NQ
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 15:10:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57859)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lOPwq-000193-CZ
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 15:10:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616440242;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iJLiJlao2JEVHQqhu1TuzWzq5H/HE6Zosy427/9Q7ps=;
 b=eCk2kZ6mit3hGzZOYkHcWOIWgSVeoENYvk0NvlrMxiOnmFRvQdvvUtFW1HvVZmw/ZQvGyq
 BiYdOjszWblKiEhfsRiUtTpZzWwnEFkG/iuv/Ld0e7lwUI+lYTpAKoOYwYCrfF6WuheJ+G
 RW7kYxOSvLSQ1iLZ1BQlaj74zKwrbaI=
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com
 [209.85.221.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-50-ql6sTElVPMOjIy56xgn-6w-1; Mon, 22 Mar 2021 15:10:35 -0400
X-MC-Unique: ql6sTElVPMOjIy56xgn-6w-1
Received: by mail-vk1-f200.google.com with SMTP id i65so16069894vkg.19
 for <qemu-devel@nongnu.org>; Mon, 22 Mar 2021 12:10:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=iJLiJlao2JEVHQqhu1TuzWzq5H/HE6Zosy427/9Q7ps=;
 b=RiyEgTAe/ccvl1xKfaZQkIhND5xmFEmH/dgW45H6gDlrNeRA/Yp8sCeL17dOB0Djwz
 1eGXog0XRo8RRyCXxaagzYiiu7kIKhDnBQt7RlDZuvO9UDcPIqHT9uaDrgeEey3w2eyM
 +YaFxRM0yJPFgWjNuutCczT5tRMniTgzroULgiKuQKOi/ot3yyGoG9gfcrf/5JEWxF96
 NsbywKSSFijxPv1ekfv6AOth+X1S2N0cLqeapaMeiOy6XTWKuNmtVAzYhV5g/8KBppwp
 VUsmSOhENaKRb2IAOpbksq5xX07gbYujj85Gr9HNAuOOCPVM2pFm47tkmUsjakNzVPkO
 35oA==
X-Gm-Message-State: AOAM531V5wL2om2Sg3jGnNEiR7xmCMZZ9Os9IEnudt0MpDRfvYPu2GLW
 RcaHbw8t51lJ5AKNzhKrHBJS2+xyrr00TAzpSM5yGwcxWhOQRcWEz1zvKV4CwaUQakiCE/8vQ/w
 +h4DtWdqaCNsgplTnh50YjeAY9Ojjx0M=
X-Received: by 2002:a67:3241:: with SMTP id y62mr1023728vsy.45.1616440233961; 
 Mon, 22 Mar 2021 12:10:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy/Ea3i8aDpVCbMPeqKE5w89jfz+pN4W4Dpp82MDYThHTBp/aPXKrdAfrgWil7PmVrcpCrnkIihRYd5Z8q54wk=
X-Received: by 2002:a67:3241:: with SMTP id y62mr1023696vsy.45.1616440233710; 
 Mon, 22 Mar 2021 12:10:33 -0700 (PDT)
MIME-Version: 1.0
References: <20210304203540.41614-1-nieklinnenbank@gmail.com>
 <20210304203540.41614-3-nieklinnenbank@gmail.com>
 <CAKJDGDZq_ioF91BUWRo_y0GKYGbjgZa46Pt83wp7t3b_ZC=ixw@mail.gmail.com>
 <4d6d2e89-1152-249b-fe55-d1b611fd77e8@redhat.com>
 <CAPan3WqJHFy=GKVXFHgDbTimmZsBueUUhxvs4L+D58J-JQF3ew@mail.gmail.com>
 <CAKJDGDaUrbVpmNRvJvc+psWXzNUk6s=u8NxsR6E727UjiwsjeQ@mail.gmail.com>
 <CAKJDGDZ2yf_Z1y6qxmet=6rtH90C1BZ_cOGNW41Jk-d1EzJFwQ@mail.gmail.com>
 <fe4d5ba3-643a-70c0-417f-73d5ccb5acda@amsat.org>
 <CAKJDGDZtNhro8YhCQVatO8Xw5riwz7593mmg9r4HaMDn+vC1ZQ@mail.gmail.com>
 <e7768c98-752c-177d-8c5c-2979d8d22a3e@amsat.org>
In-Reply-To: <e7768c98-752c-177d-8c5c-2979d8d22a3e@amsat.org>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Mon, 22 Mar 2021 16:10:07 -0300
Message-ID: <CAKJDGDaCQpBViVk+HgsE7J1mpZo+F7RLURK+NcVjEizf-Q2hMw@mail.gmail.com>
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
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Mon, Mar 22, 2021 at 3:47 PM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g> wrote:
>
> On 3/22/21 6:18 PM, Willian Rampazzo wrote:
> > Hi Philippe,
> >
> > On Mon, Mar 22, 2021 at 1:54 PM Philippe Mathieu-Daud=C3=A9 <f4bug@amsa=
t.org> wrote:
> >>
> >> Hi Willian,
> >>
> >> On 3/8/21 9:44 PM, Willian Rampazzo wrote:
> >>> On Mon, Mar 8, 2021 at 5:41 PM Willian Rampazzo <wrampazz@redhat.com>=
 wrote:
> >>>>
> >>>> On Mon, Mar 8, 2021 at 5:32 PM Niek Linnenbank <nieklinnenbank@gmail=
.com> wrote:
> >>>>>
> >>>>> Hi Philippe, Willian,
> >>>>>
> >>>>> On Mon, Mar 8, 2021 at 8:52 AM Philippe Mathieu-Daud=C3=A9 <philmd@=
redhat.com> wrote:
> >>>>>>
> >>>>>> On 3/5/21 4:16 PM, Willian Rampazzo wrote:
> >>>>>>> On Thu, Mar 4, 2021 at 5:44 PM Niek Linnenbank <nieklinnenbank@gm=
ail.com> wrote:
> >>>>>>>>
> >>>>>>>> The image for Armbian 19.11.3 bionic has been removed from the a=
rmbian server.
> >>>>>>>> Without the image as input the test arm_orangepi_bionic_19_11 ca=
nnot run.
> >>>>>>>>
> >>>>>>>> This commit removes the test completely and merges the code of t=
he generic function
> >>>>>>>> do_test_arm_orangepi_uboot_armbian back with the 20.08 test.
> >>>>>>>>
> >>>>>>>> Signed-off-by: Niek Linnenbank <nieklinnenbank@gmail.com>
> >>>>>>>> ---
> >>>>>>>>  tests/acceptance/boot_linux_console.py | 72 ++++++++-----------=
-------
> >>>>>>>>  1 file changed, 23 insertions(+), 49 deletions(-)
> >>>>>>>>
> >>>>>>>> diff --git a/tests/acceptance/boot_linux_console.py b/tests/acce=
ptance/boot_linux_console.py
> >>>>>>>> index eb01286799..9fadea9958 100644
> >>>>>>>> --- a/tests/acceptance/boot_linux_console.py
> >>>>>>>> +++ b/tests/acceptance/boot_linux_console.py
> >>>>>>>> @@ -802,7 +802,29 @@ def test_arm_orangepi_sd(self):
> >>>>>>>>          # Wait for VM to shut down gracefully
> >>>>>>>>          self.vm.wait()
> >>>>>>>>
> >>>>>>>> -    def do_test_arm_orangepi_uboot_armbian(self, image_path):
> >>>>>>>> +    @skipUnless(os.getenv('ARMBIAN_ARTIFACTS_CACHED'),
> >>>>>>>> +                'Test artifacts fetched from unreliable apt.arm=
bian.com')
> >>>>>>>> +    @skipUnless(os.getenv('AVOCADO_ALLOW_LARGE_STORAGE'), 'stor=
age limited')
> >>>>>>>> +    def test_arm_orangepi_bionic_20_08(self):
> >>>>>>>> +        """
> >>>>>>>> +        :avocado: tags=3Darch:arm
> >>>>>>>> +        :avocado: tags=3Dmachine:orangepi-pc
> >>>>>>>> +        :avocado: tags=3Ddevice:sd
> >>>>>>>> +        """
> >>>>>>>> +
> >>>>>>>> +        # This test download a 275 MiB compressed image and exp=
and it
> >>>>>>>> +        # to 1036 MiB, but the underlying filesystem is 1552 Mi=
B...
> >>>>>>>> +        # As we expand it to 2 GiB we are safe.
> >>>>>>>> +
> >>>>>>>> +        image_url =3D ('https://dl.armbian.com/orangepipc/archi=
ve/'
> >>>>>>>> +                     'Armbian_20.08.1_Orangepipc_bionic_current=
_5.8.5.img.xz')
> >>>>>>>
> >>>>>>> The Armbian 20 is not available on this link anymore. I can brows=
e just 21.
> >>>>>>
> >>>>>> Cat-and-mouse game *sigh*.
> >>
> >> 2021-03-22 17:18:10,701 download         L0067 INFO | Fetching
> >> https://archive.armbian.com/orangepipc/archive/Armbian_20.08.1_Orangep=
ipc_bionic_current_5.8.5.img.xz
> >> -> /home/phil/avocado/da
> >> ta/cache/by_location/f2eb27a12b81ce15e93f340fabbced2136af1caa/Armbian_=
20.08.1_Orangepipc_bionic_current_5.8.5.img.xz.nfwdzivg
> >> 2021-03-22 17:18:11,263 asset            L0136 INFO | Temporary asset
> >> file unavailable due to failed download attempt.
> >> 2021-03-22 17:18:11,263 asset            L0368 ERROR| URLError: <urlop=
en
> >> error [Errno 113] No route to host>
> >>
> >> It might be a temporary problem, but looking long term the
> >> current setup doesn't scale IMHO.
> >>
> >
> > Have you changed something in the test? The test is supposed to skip
> > when the asset is not available in the cache. What was the result of
> > this test execution? Skip, fail, or error? If it was not Skip, we need
> > to investigate what happened.
>
> No change, on commit b1847509268.
>
> The result was all good but 1 "Cancelled" so I looked at the job.log.
>
> All good IMO.
>

Okay, good! Unfortunately, I don't think there is much more we can do
on the qemu side or on Avocado side to handle network glitches.


