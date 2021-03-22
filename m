Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 096A6344C95
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 18:02:25 +0100 (CET)
Received: from localhost ([::1]:59634 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lONwd-0003BP-Pi
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 13:02:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33648)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lONts-00028o-MH; Mon, 22 Mar 2021 12:59:32 -0400
Received: from mail-ot1-f48.google.com ([209.85.210.48]:35522)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lONtq-0008Ge-RQ; Mon, 22 Mar 2021 12:59:32 -0400
Received: by mail-ot1-f48.google.com with SMTP id
 v24-20020a9d69d80000b02901b9aec33371so16646887oto.2; 
 Mon, 22 Mar 2021 09:59:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=gqMUuH4EEQSGlhLTI27KvLHV0n5Ee9E/f06i8uDrS8E=;
 b=TXCpA8MUB8PlsmZNGfyX2auikLlsBL5hI9rRqoDGeTYREFVHTKYQneSh0sGkb6Exj3
 UJY0SuF2d+rPJG1x37RVuOUf18SHKAR2TqVLwrf/C6U5BAW9q1dZun+IIZOsvExp0jIT
 rumGUKZBGDRH9HebDePRWZ20M5N8cHePbKqn7ZqnY/2W5CzTYW4R280wnx5wtVG1c9bd
 AsyTcwLLBllwR+ctAMa6k8S1RW28/q28MabaMFNGkBFnJRjECpkq79IAj9n+N0Vj5cln
 ubxDbdllLF1zeTSmkOABV6fK8rQlRo81dj6jW5DsQ89pcw+Rdl66YP+tcEd5gK0K4ZJv
 Ozjw==
X-Gm-Message-State: AOAM533D7hXogZHB9QRLuWnm0tZ7G2vjbFA+s1UHo2+vpEvv55fcw1UX
 8dIA4Wk9P+v51E3fCP4J3RAzImpZsLch+5+ZbtQ=
X-Google-Smtp-Source: ABdhPJyUte7btunTyUKTnUaiptLJR80LiJn50rx7fUvw4eE+YwJ/uw4tPEDIwp/JGIat0GT1OkEh/ZuPo/cBfRM0HMo=
X-Received: by 2002:a05:6830:619:: with SMTP id
 w25mr679413oti.371.1616432368961; 
 Mon, 22 Mar 2021 09:59:28 -0700 (PDT)
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
From: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Date: Mon, 22 Mar 2021 17:59:17 +0100
Message-ID: <CAAdtpL6vejm+ud+dJ8s4sQ-29P6-zP8LeZ4Hk92KKFrcA_TYhw@mail.gmail.com>
Subject: Re: [PATCH v3 2/5] tests/acceptance/boot_linux_console: remove
 Armbian 19.11.3 bionic test for orangepi-pc machine
To: Willian Rampazzo <wrampazz@redhat.com>, Beraldo Leal <bleal@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=209.85.210.48;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ot1-f48.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On Mon, Mar 22, 2021 at 5:54 PM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g> wrote:
>
> Hi Willian,
>
> On 3/8/21 9:44 PM, Willian Rampazzo wrote:
> > On Mon, Mar 8, 2021 at 5:41 PM Willian Rampazzo <wrampazz@redhat.com> w=
rote:
> >>

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

Also I just noticed I *do* have the image cached, even twice:

$ find /home/phil/avocado/data/cache/by_location/ -name
Armbian_20.08.1_Orangepipc_bionic_current_5.8.5.img.xz -ls
  131661 280768 -rw-rw-r--   1 phil     phil     287501560 Oct 23
12:45 /home/phil/avocado/data/cache/by_location/cac379e6a4480624b000dfde1b5=
d935454254ce2/Armbian_20.08.1_Orangepipc_bionic_current_5.8.5.img.xz
  131761 280776 -rw-rw-r--   1 phil     phil     287501560 Feb 20
00:39 /home/phil/avocado/data/cache/by_location/aac619d9e7ea3726ebc86c159fd=
dfb9d3f6274a5/Armbian_20.08.1_Orangepipc_bionic_current_5.8.5.img.xz

But the hash is different.

Cleber, why not use the blob hash as a cache key? It is supposed to be
constant...

Cc'ing Beraldo because I guess remember he worked on improving Avocado cach=
e.

> >>> Just to clarify here: in this patch I wanted to only make the change =
to remove the test for the 19.11.3 image.
> >>> And in the 3rd patch (tests/acceptance/boot_linux_console: change URL=
 for test_arm_orangepi_bionic_20_08)
> >>> do the update for to correct the 20.08 link. So each patch fixes one =
problem at a time.

