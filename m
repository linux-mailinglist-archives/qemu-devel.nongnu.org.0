Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 489B8344D01
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 18:15:38 +0100 (CET)
Received: from localhost ([::1]:57062 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOO9Q-0006An-RZ
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 13:15:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lOO7Y-0004v8-E8
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 13:13:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:47426)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lOO7S-00075n-Be
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 13:13:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616433211;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8VY3tCilkxsOn7PQH41opJ/GbzuJ5IG47FtySKPyw4U=;
 b=JvyEJ7e03redE1JM13Lxk8GcXNFelno9k2R64TdWbBa+hwDroVMILgcvJePpuFqcpXhis5
 jdyfWvXGgmmuGiPCZNrT6wTTNfeab+BsKERpdThOSSkgjXRzjvPK96vK10HKv59DHHQKB+
 NIns0AdZmOOEKGFdi37YkfYHNPFFyn4=
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com
 [209.85.221.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-412-aIHjQNzKPM6nCuHE7w1N_A-1; Mon, 22 Mar 2021 13:13:23 -0400
X-MC-Unique: aIHjQNzKPM6nCuHE7w1N_A-1
Received: by mail-vk1-f199.google.com with SMTP id a188so15982841vke.17
 for <qemu-devel@nongnu.org>; Mon, 22 Mar 2021 10:13:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=8VY3tCilkxsOn7PQH41opJ/GbzuJ5IG47FtySKPyw4U=;
 b=ipy0gjgBf3XmPucudr3v38eNJAaOAVtT9HMY7zugKNqb/JPkDpYUqJUm+xQhitW1aP
 j8++W0UjMPJg8QaJ181f+tsy408jTamGbqJXTKLeYBl6/SQHT/xOTEFxtEKO8t+ScdPe
 74NrdCw/WIIv0B4lRuZdxLSKvz+R9efDNI5TPWsN3xJljGhb5k+yUzyr2K0i30Oi+dBi
 dhRLskvD6W/4ou0/DlsPT7bAJjZlnUHO2tez+66/7iQX4dcVsVu5E5zo6oFQOPCzFBIe
 sy1tsYP7mjObt+xiqRY5itjWZ8Xw7ROjFCafHKQJMNwDhq0ibaHEZxHBTUaZcqxlY7s+
 57eA==
X-Gm-Message-State: AOAM532Fq5WB83kmh2571HdR5faWXmWYyynRom6+wX3Qdm+Z9GqZi5FK
 4uuCMcq1FgP37sBfr3ytKEHPFb08cW6bLaYuoewiLmqQYU+1itwUfqd8wh7ktJtTc+T6ad36h+h
 +9NPMPDnyYIPcC11rRFGXPb7fI+BjJuk=
X-Received: by 2002:ab0:3388:: with SMTP id y8mr784388uap.113.1616433203189;
 Mon, 22 Mar 2021 10:13:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwUr2lgsG0Q+NF4r0UCCpoTVKEzjsRZ3aV0eZVXh5IxGIVpI991YfgPwfK5L2MHxHB2m3eQ9160x/O0bedsFrY=
X-Received: by 2002:ab0:3388:: with SMTP id y8mr784370uap.113.1616433202959;
 Mon, 22 Mar 2021 10:13:22 -0700 (PDT)
MIME-Version: 1.0
References: <20210304203540.41614-1-nieklinnenbank@gmail.com>
 <20210304203540.41614-3-nieklinnenbank@gmail.com>
 <CAKJDGDZq_ioF91BUWRo_y0GKYGbjgZa46Pt83wp7t3b_ZC=ixw@mail.gmail.com>
 <4d6d2e89-1152-249b-fe55-d1b611fd77e8@redhat.com>
 <CAPan3WqJHFy=GKVXFHgDbTimmZsBueUUhxvs4L+D58J-JQF3ew@mail.gmail.com>
 <CAKJDGDaUrbVpmNRvJvc+psWXzNUk6s=u8NxsR6E727UjiwsjeQ@mail.gmail.com>
 <CAKJDGDZ2yf_Z1y6qxmet=6rtH90C1BZ_cOGNW41Jk-d1EzJFwQ@mail.gmail.com>
 <fe4d5ba3-643a-70c0-417f-73d5ccb5acda@amsat.org>
 <CAAdtpL6vejm+ud+dJ8s4sQ-29P6-zP8LeZ4Hk92KKFrcA_TYhw@mail.gmail.com>
In-Reply-To: <CAAdtpL6vejm+ud+dJ8s4sQ-29P6-zP8LeZ4Hk92KKFrcA_TYhw@mail.gmail.com>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Mon, 22 Mar 2021 14:12:56 -0300
Message-ID: <CAKJDGDaB1x1_6tb1Xh-NSs-Xu6iRp6W4oJC6Nkb2SqSg-E-8HA@mail.gmail.com>
Subject: Re: [PATCH v3 2/5] tests/acceptance/boot_linux_console: remove
 Armbian 19.11.3 bionic test for orangepi-pc machine
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=63.128.21.124; envelope-from=wrampazz@redhat.com;
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
 Daniel Berrange <berrange@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Beniamino Galvani <b.galvani@gmail.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
 Pavel Dovgalyuk <Pavel.Dovgaluk@ispras.ru>,
 Cleber Rosa Junior <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Philippe,

On Mon, Mar 22, 2021 at 1:59 PM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g> wrote:
>
> On Mon, Mar 22, 2021 at 5:54 PM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.=
org> wrote:
> >
> > Hi Willian,
> >
> > On 3/8/21 9:44 PM, Willian Rampazzo wrote:
> > > On Mon, Mar 8, 2021 at 5:41 PM Willian Rampazzo <wrampazz@redhat.com>=
 wrote:
> > >>
>
> > >>>>>> -    def do_test_arm_orangepi_uboot_armbian(self, image_path):
> > >>>>>> +    @skipUnless(os.getenv('ARMBIAN_ARTIFACTS_CACHED'),
> > >>>>>> +                'Test artifacts fetched from unreliable apt.arm=
bian.com')
> > >>>>>> +    @skipUnless(os.getenv('AVOCADO_ALLOW_LARGE_STORAGE'), 'stor=
age limited')
> > >>>>>> +    def test_arm_orangepi_bionic_20_08(self):
> > >>>>>> +        """
> > >>>>>> +        :avocado: tags=3Darch:arm
> > >>>>>> +        :avocado: tags=3Dmachine:orangepi-pc
> > >>>>>> +        :avocado: tags=3Ddevice:sd
> > >>>>>> +        """
> > >>>>>> +
> > >>>>>> +        # This test download a 275 MiB compressed image and exp=
and it
> > >>>>>> +        # to 1036 MiB, but the underlying filesystem is 1552 Mi=
B...
> > >>>>>> +        # As we expand it to 2 GiB we are safe.
> > >>>>>> +
> > >>>>>> +        image_url =3D ('https://dl.armbian.com/orangepipc/archi=
ve/'
> > >>>>>> +                     'Armbian_20.08.1_Orangepipc_bionic_current=
_5.8.5.img.xz')
> > >>>>>
> > >>>>> The Armbian 20 is not available on this link anymore. I can brows=
e just 21.
> > >>>>
> > >>>> Cat-and-mouse game *sigh*.
> >
> > 2021-03-22 17:18:10,701 download         L0067 INFO | Fetching
> > https://archive.armbian.com/orangepipc/archive/Armbian_20.08.1_Orangepi=
pc_bionic_current_5.8.5.img.xz
> > -> /home/phil/avocado/da
> > ta/cache/by_location/f2eb27a12b81ce15e93f340fabbced2136af1caa/Armbian_2=
0.08.1_Orangepipc_bionic_current_5.8.5.img.xz.nfwdzivg
> > 2021-03-22 17:18:11,263 asset            L0136 INFO | Temporary asset
> > file unavailable due to failed download attempt.
> > 2021-03-22 17:18:11,263 asset            L0368 ERROR| URLError: <urlope=
n
> > error [Errno 113] No route to host>
> >
> > It might be a temporary problem, but looking long term the
> > current setup doesn't scale IMHO.
>
> Also I just noticed I *do* have the image cached, even twice:
>
> $ find /home/phil/avocado/data/cache/by_location/ -name
> Armbian_20.08.1_Orangepipc_bionic_current_5.8.5.img.xz -ls
>   131661 280768 -rw-rw-r--   1 phil     phil     287501560 Oct 23
> 12:45 /home/phil/avocado/data/cache/by_location/cac379e6a4480624b000dfde1=
b5d935454254ce2/Armbian_20.08.1_Orangepipc_bionic_current_5.8.5.img.xz
>   131761 280776 -rw-rw-r--   1 phil     phil     287501560 Feb 20
> 00:39 /home/phil/avocado/data/cache/by_location/aac619d9e7ea3726ebc86c159=
fddfb9d3f6274a5/Armbian_20.08.1_Orangepipc_bionic_current_5.8.5.img.xz
>
> But the hash is different.
>

You have 2 images because you fetched them from different locations.
When you fetch by location, the assets go to the directory
representing the hash of the location, This allows, for example, the
fetch of multiple initrd or vmlinuz files from different locations,
representing different files, but with the same name. Also, this was
one of your requests some time ago :)

What Beraldo worked on in the last week was a way to remove "unused"
files. Your cache is a good example of files that are not necessary
anymore because now you are using a different location to fetch them.

> Cleber, why not use the blob hash as a cache key? It is supposed to be
> constant...
>

You can do that by setting the test to download the file by name, and
not by location.

> Cc'ing Beraldo because I guess remember he worked on improving Avocado ca=
che.
>
> > >>> Just to clarify here: in this patch I wanted to only make the chang=
e to remove the test for the 19.11.3 image.
> > >>> And in the 3rd patch (tests/acceptance/boot_linux_console: change U=
RL for test_arm_orangepi_bionic_20_08)
> > >>> do the update for to correct the 20.08 link. So each patch fixes on=
e problem at a time.
>


