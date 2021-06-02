Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FC7E398AF2
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Jun 2021 15:45:37 +0200 (CEST)
Received: from localhost ([::1]:37400 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loRBg-0007BE-3t
	for lists+qemu-devel@lfdr.de; Wed, 02 Jun 2021 09:45:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gengdongjiu1@gmail.com>)
 id 1loRAU-0005vq-3i; Wed, 02 Jun 2021 09:44:22 -0400
Received: from mail-qv1-xf41.google.com ([2607:f8b0:4864:20::f41]:42691)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <gengdongjiu1@gmail.com>)
 id 1loRAS-0005oM-9O; Wed, 02 Jun 2021 09:44:21 -0400
Received: by mail-qv1-xf41.google.com with SMTP id u33so1288726qvf.9;
 Wed, 02 Jun 2021 06:44:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=129Pl9OSeUE3s5KLE+dbt5S1ITWq22ra9ssXImBVUdk=;
 b=R7WLlCg809KsuGwbbWqQm/Ad6sqwzSKUBVX3BbtrUgKeXhAuF43MqFuViwFvzD+isf
 I9DmsCTXR2mLWcEsBxMLxM7CQWMuxrf7ZaNOnSSlHVpOJSuRU5hHeGsoaynmNbu2OEnJ
 vH5BHjdtCTZNdWrKFajAucg+e5U1rXn/ZUI8GGRsP8qfrg/WbIB+ULKybmWrQ3Nu9k5g
 5olYn60rz9eEvQJRCHKrqhciTKf3L3ofCbEnAHkduj39/Q9EXOjIzjsenvfptAgdqkgw
 mdk2n+tuQdGdvjLiJTmeMZvka/zsPUBzjlSCxgw4H5qAUBuurKv87DOQZVoLrhOuqYC4
 Sv/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=129Pl9OSeUE3s5KLE+dbt5S1ITWq22ra9ssXImBVUdk=;
 b=s5MbzSBncq8kF3HAbsJVX3BWQ90nw6A1HczXu6JYvEmkgjgpTYpfFPWE5EVZS2x1b/
 tA1bfe0gflSgcWbpT8cb/OUPk2ycPTJuZBa5CVKaEO72mZuOv7GCkAvzyhKSfpfXck6u
 wSGdufS1B7CNGeaoJ3grIhE/AmViBjI5sauDKwxupMoNgp8ypRJyGmZHFPepFDo9kzCD
 CUG/bZiupanq5uzE//Udi1WeaN7dkExKEJd6xHyr/68qTZyeTqeBu99PYSMlZu/8U4dv
 gPcN6eImUV4rTr9R4beHGxGZI7Qvf3pvsfrvFynKzuBFTu9CwBFJ68MWGevV0qweszN1
 EVjA==
X-Gm-Message-State: AOAM531llYX3qPw+NTKOhSaWcYRvSPAeUcMVchOIP2GMt9nIMtWupgEz
 dp/CIhS/DuEK7gdqTc3sb7BOM1YBawbCc/lJiLs=
X-Google-Smtp-Source: ABdhPJzJ1IM7GvIyLG2Ec1ojxpdCcaNeISEKLqwd4bbo2Rzlq6f99UZSFiK5sQc53lMQvxveefSd+iKMgGhS5saljQw=
X-Received: by 2002:a0c:c184:: with SMTP id n4mr28431158qvh.36.1622641458215; 
 Wed, 02 Jun 2021 06:44:18 -0700 (PDT)
MIME-Version: 1.0
References: <20210525025823.3208218-1-swethajoshi139@gmail.com>
 <331a819e-1745-4d4b-cc4a-82521a58186a@linaro.org>
 <CAFEAcA8RbVafdjn2hkXifAPUF=wxZup20PqPcRpQ1ivtnWCxww@mail.gmail.com>
 <CALf2nm+LFqM2=vDs8=YfyxQSUT-0xxaCiVmcQzrKoOa+zaTtdg@mail.gmail.com>
 <CAFEAcA-oX0JR80UYzYKvczHsfxWG6oH3Pg4pbM6ByDe57XEHHw@mail.gmail.com>
 <CALf2nmKhPaWJa944dR+kFAQ1hCLXF0XPwXaHTqJQ-C6EW7ACKg@mail.gmail.com>
 <CAFEAcA9E4s3dST0GJkdg24DDAn90WU1FEmXwoKD6oQmNSB1vVA@mail.gmail.com>
 <CABSBigR1L9sE36eYA0Mq4smx1E9A4umTOKTe_x97foSMkryRnw@mail.gmail.com>
 <CALf2nmLOqtwacgrQ91TTz9_QRUmFS9ZNii2Kk7-tQ7LNp9vw2Q@mail.gmail.com>
In-Reply-To: <CALf2nmLOqtwacgrQ91TTz9_QRUmFS9ZNii2Kk7-tQ7LNp9vw2Q@mail.gmail.com>
From: Dongjiu Geng <gengdongjiu1@gmail.com>
Date: Wed, 2 Jun 2021 21:44:07 +0800
Message-ID: <CABSBigTga9Xc+RJMN-F=fb_z22Wyh9beoVjRb6o+RA=KDV1ujg@mail.gmail.com>
Subject: Re: [PATCH_V3] Adding ifdefs to call the respective routines only
 when their configs are enabled
To: Swetha Joshi <swethajoshi139@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::f41;
 envelope-from=gengdongjiu1@gmail.com; helo=mail-qv1-xf41.google.com
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
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Swetha Joshi <swethajoshi139@gmail.com> =E4=BA=8E2021=E5=B9=B45=E6=9C=8829=
=E6=97=A5=E5=91=A8=E5=85=AD =E4=B8=8A=E5=8D=883:41=E5=86=99=E9=81=93=EF=BC=
=9A
>
> I apologize for the delay, here are the repro steps:
> 1. Remove CONFIG_ARM_VIRT=3Dy from arm-softmmu.mak
> 2. In .gitlab-ci.yml, crossbuild.yml and in tests/vm/Makefile.include, in=
 all the places where we disable kvm using -disable-kvm, replace this with =
-enable-kvm
> 3. Build

According to your steps, I can not see such errors=EF=BC=8Calso your change=
 is
odd. I suggested you do not this change until you indeed encounter
errors

diff --git a/default-configs/devices/arm-softmmu.mak
b/default-configs/devices/arm-softmmu.mak
index 0500156a0c..f47ab0f3b1 100644
--- a/default-configs/devices/arm-softmmu.mak
+++ b/default-configs/devices/arm-softmmu.mak
@@ -6,7 +6,6 @@ CONFIG_ARM_V7M=3Dy
 # CONFIG_PCI_DEVICES=3Dn
 # CONFIG_TEST_DEVICES=3Dn

-CONFIG_ARM_VIRT=3Dy
 CONFIG_CUBIEBOARD=3Dy
 CONFIG_EXYNOS4=3Dy
 CONFIG_HIGHBANK=3Dy
diff --git a/tests/vm/Makefile.include b/tests/vm/Makefile.include
index e94d95ec54..95387c3e5a 100644
--- a/tests/vm/Makefile.include
+++ b/tests/vm/Makefile.include
@@ -110,7 +110,7 @@ vm-build-%: $(IMAGES_DIR)/%.img
                "  VM-BUILD $*")

 vm-boot-serial-%: $(IMAGES_DIR)/%.img
-       qemu-system-x86_64 -enable-kvm -m 4G -smp 2 -nographic \
+       qemu-system-x86_64 -disable-kvm -m 4G -smp 2 -nographic \
                -drive if=3Dnone,id=3Dvblk,cache=3Dwriteback,file=3D"$<" \
                -netdev user,id=3Dvnet \
                -device virtio-blk-pci,drive=3Dvblk \


>
> You should see errors pointing to these routines: virt_is_acpi_enabled, a=
cpi_ghes_record_errors
>
> Thanks,
> Swetha.
>
> On Fri, May 28, 2021 at 12:08 AM Dongjiu Geng <gengdongjiu1@gmail.com> wr=
ote:
>>
>> Peter Maydell <peter.maydell@linaro.org> =E4=BA=8E2021=E5=B9=B45=E6=9C=
=8827=E6=97=A5=E5=91=A8=E5=9B=9B =E4=B8=8A=E5=8D=882:19=E5=86=99=E9=81=93=
=EF=BC=9A
>> >
>> > On Wed, 26 May 2021 at 18:32, Swetha Joshi <swethajoshi139@gmail.com> =
wrote:
>> > >
>> > > Hello,
>> > >
>> > > One of the qemu machines we use has KVM enabled, but we don't want t=
he CONFIG_ARM_VIRT enabled as it pulls in emulation of a variety of physica=
l hardware that we don't need. The compilation errors I mentioned are not i=
n the qemu mainline per say but we see them in one of the qemu derived mach=
ines we use.
>> >
>> > Sure, but unless you can give me a recipe for reproducing the
>> > build failure in mainline I can't really help...
>>
>> Hi Swetha=EF=BC=8C
>>      Yes,  Can you give a method that how to reproduce the build
>> failure issues? Thanks
>>
>> >
>> > thanks
>> > -- PMM
>
>
>
> --
> Regards
>
> Swetha Joshi.

