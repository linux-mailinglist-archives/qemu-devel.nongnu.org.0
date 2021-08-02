Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 740453DE2C4
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Aug 2021 00:57:27 +0200 (CEST)
Received: from localhost ([::1]:40150 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAgs9-0008BB-W0
	for lists+qemu-devel@lfdr.de; Mon, 02 Aug 2021 18:57:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56858)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1mAgr3-0007VL-Qe
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 18:56:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55647)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1mAgqz-0000oF-QN
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 18:56:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627944972;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SvapjqtQnlkaI9qvu6QvMP1fZDrBXwXhvjzy/ClQ6Vs=;
 b=C0ZYJheQAx6odrSDxxDH/xg/onHSKkUg/f5m6vIJND6D2tizo6LdLqgj3iv3iPUVF6cpe7
 cW5ntHdb08JNhbG5mh2kpvSNzw73/POU3mf1X9sqyKruupusrEtUcDuKS7FDpqDtAk4c6D
 r8ndU84UB2u7xbLyr4Xz8tTMd4I7YTY=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-246-XtBzenKdO56F92BsGz1r-w-1; Mon, 02 Aug 2021 18:56:09 -0400
X-MC-Unique: XtBzenKdO56F92BsGz1r-w-1
Received: by mail-ed1-f69.google.com with SMTP id
 o90-20020a5093e30000b02903bb95130460so9536450eda.0
 for <qemu-devel@nongnu.org>; Mon, 02 Aug 2021 15:56:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=SvapjqtQnlkaI9qvu6QvMP1fZDrBXwXhvjzy/ClQ6Vs=;
 b=i79+4AEFvLNwFhxvKrN4FGy7Wa0FUNlQtHs5Gp8dz5HhUekKhsdOpY5MIcsW9VNlBc
 2xSgZ31OU0E90tBpqLHrskaBRMVLDckXK3v1/yO2qC079D2zcyZWXJ0/ihBpN4eGaNov
 ayP2XC+qIJepMmgQ8F6fS5qTX+IktVu0orFfP+BK+6j3yBcCPDe12ly15ygLDk5+aDcI
 DOs5iZG1opnmUt1pLIz0iCyVk0G/zmZR/IDQnwnJGTfb4UIxQQJCFPhlwbOZ/Mgk5SkT
 neP1z0TmV1SGzd1tIOJyA8yUbq9UlbhhlFiG0VYcyZ2oxUKuj7nb0GlikT76sdbtZLuW
 B9yA==
X-Gm-Message-State: AOAM530igIvlm1oyhszevFJ56JFXCZq6S6TotZ2EWoesVKKg4nTftLBB
 SDpkcRi9jDbUXLuaLvxvC6KjicW4V14MPxpuQTdOTLkghn/DObK/Qd+1v7oVpQJNi7J3zsBeb79
 GgznRUr4Aw2AihY7LlcoSc4I3bBH8pIs=
X-Received: by 2002:a17:906:994b:: with SMTP id
 zm11mr17324354ejb.6.1627944968487; 
 Mon, 02 Aug 2021 15:56:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzVhA03cd0lvn4EklIWPEBgy42Fha6OPJhZgvmms8cBGsIyyq1wW3wKynL8ZRT6gEMBa/XDtuID3pYNUJuZX0U=
X-Received: by 2002:a17:906:994b:: with SMTP id
 zm11mr17324333ejb.6.1627944968271; 
 Mon, 02 Aug 2021 15:56:08 -0700 (PDT)
MIME-Version: 1.0
References: <CAFEAcA9cMZoj18gq7Ksv5PRoU1wRmXvW_e9UE73C_MEB7wTroQ@mail.gmail.com>
 <87sfzuwchl.fsf@linaro.org>
 <CAFEAcA8JO-8Tp1hW6e86x_=rtpJdk+cW4XnKYsko9Ehnx4_rBw@mail.gmail.com>
In-Reply-To: <CAFEAcA8JO-8Tp1hW6e86x_=rtpJdk+cW4XnKYsko9Ehnx4_rBw@mail.gmail.com>
From: Cleber Rosa <crosa@redhat.com>
Date: Mon, 2 Aug 2021 18:55:57 -0400
Message-ID: <CA+bd_6KTdCdUUugGHZbuyqdNrKqoGPQVCamL-rDyrDh-fCmjaA@mail.gmail.com>
Subject: Re: "make check-acceptance" takes way too long
To: Peter Maydell <peter.maydell@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=crosa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.701,
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
Cc: "Daniel P. Berrange" <berrange@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, Jul 31, 2021 at 4:33 PM Peter Maydell <peter.maydell@linaro.org> wr=
ote:
>
> On Sat, 31 Jul 2021 at 19:43, Alex Benn=C3=A9e <alex.bennee@linaro.org> w=
rote:
> >
> >
> > Peter Maydell <peter.maydell@linaro.org> writes:
> >
> > > "make check-acceptance" takes way way too long. I just did a run
> > > on an arm-and-aarch64-targets-only debug build and it took over
> > > half an hour, and this despite it skipping or cancelling 26 out
> > > of 58 tests!
> > >
> > > I think that ~10 minutes runtime is reasonable. 30 is not;
> > > ideally no individual test would take more than a minute or so.
> > >
> > > Output saying where the time went. The first two tests take
> > > more than 10 minutes *each*. I think a good start would be to find
> > > a way of testing what they're testing that is less heavyweight.
> > >
> > >  (01/58) tests/acceptance/boot_linux.py:BootLinuxAarch64.test_virt_tc=
g_gicv2:
> > > PASS (629.74 s)
> > >  (02/58) tests/acceptance/boot_linux.py:BootLinuxAarch64.test_virt_tc=
g_gicv3:
> > > PASS (628.75 s)
> > >  (03/58) tests/acceptance/boot_linux.py:BootLinuxAarch64.test_virt_kv=
m:
> > > CANCEL: kvm accelerator does not seem to be available (1.18 s)
> >
> > For these tests which purport to exercise the various GIC configuration=
s
> > I think we would be much better served by running kvm-unit-tests which
> > at least try and exercise all the features rather than rely on the side
> > effect of booting an entire OS.
>
> I think "can we boot Linux via UEFI?" is worth testing, as is
> "can we boot Linux and do at least some stuff in userspace?"
> (there's a lot of TCG that doesn't get exercised by pure kernel boot).
> We just need to find a guest OS that isn't so overweight it takes 10
> minutes...
>
> -- PMM
>

I think using alternative guests is absolutely the way to go here.  I
had that in mind in the past, so much that I made sure to include
cirros[1] as one of the supported images[2] in avocado.utils.vmimage
(used in these tests above).  These tests are based on the LinuxTest
class[3], and they support the distro[4] and distro_version[5]
parameters.

But, cirros doesn't ship with a fully capable cloud-init package and I
deferred to support it in avocado.utils.cloudinit, and thus, support
cirrus in those tests.  I gave that idea another try, and the results
are encouraging, with reduction of runtime by almost a factor of 6.
On my system I get:

$ avocado run -p distro=3Dfedora -p distro_version=3D31
tests/acceptance/boot_linux.py:BootLinuxAarch64.test_virt_tcg_gicv3
 (1/1) tests/acceptance/boot_linux.py:BootLinuxAarch64.test_virt_tcg_gicv3:
PASS (165.48 s)

And with cirros:

$ avocado run -p distro=3Dcirros -p distro_version=3D0.5.2
tests/acceptance/boot_linux.py:BootLinuxAarch64.test_virt_tcg_gicv3
(1/1) tests/acceptance/boot_linux.py:BootLinuxAarch64.test_virt_tcg_gicv3:
PASS (28.80 s)

I'll work on posting the bits needed to have this working out of the
box, but it'll require new code on the Avocado side too (tentative to
version 91.0).

Regards,
- Cleber.

[1] https://github.com/cirros-dev/cirros
[2] https://avocado-framework.readthedocs.io/en/90.0/guides/writer/libs/vmi=
mage.html#supported-images
[3] https://qemu-project.gitlab.io/qemu/devel/testing.html#the-avocado-qemu=
-linuxtest-base-test-class
[4] https://qemu-project.gitlab.io/qemu/devel/testing.html#distro
[5] https://qemu-project.gitlab.io/qemu/devel/testing.html#distro-version


