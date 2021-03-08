Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C34C3318CB
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 21:43:51 +0100 (CET)
Received: from localhost ([::1]:37378 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJMjG-00007e-3E
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 15:43:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36516)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lJMhk-0007hP-SN
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 15:42:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:25931)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lJMhi-0004zB-MA
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 15:42:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615236131;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rnFFJaV+HEHeXEQDTitf8PUdSYNLp3O6qCoSxvISh2Y=;
 b=JLvVBdfO5yQZv/YPOdUVzieqOvBCGIGCFIPcAzVpRKbV+G9RKu+9b4kXlMnpE7nGSZVIPM
 2yr+Qu8QR7Zs44N9njpmC7szo+Fk2uX6kJp+aPFtwHAaJMsQxWK2yZWxbhF0qEonezst5A
 /xXCoMkhuAZLgyh2eh6ZqNAucLl89gA=
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com
 [209.85.222.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-146-EHJ_zjJ4MmG2RbnY_TV7fw-1; Mon, 08 Mar 2021 15:42:08 -0500
X-MC-Unique: EHJ_zjJ4MmG2RbnY_TV7fw-1
Received: by mail-ua1-f70.google.com with SMTP id 16so1960257uaq.18
 for <qemu-devel@nongnu.org>; Mon, 08 Mar 2021 12:42:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=rnFFJaV+HEHeXEQDTitf8PUdSYNLp3O6qCoSxvISh2Y=;
 b=OaAmEzVaJrc+0DtEKAtjunQ4wFOx5Iv4yYE/X7Ezm3/M1FPWlUC4KiXO4L4wjNEjKF
 g87XEMo3inwR0r4ZFfeamutAIBODFJSNmA3Ie5Z1pAPosaKkpWZVkfGLvs+w/8dckrot
 5q1tWetvzYQ+FHXPtkQtFYB+UsN6sIZJRQuRyz+E0Voxs6U/aTC+GZNsenKy05GXt6EX
 pBX5x3QC03p2S0mI/YZtNA8P4mQTJLEHqasyq92QpzVQyaStYlGk/fFPpWMfUchd0OQ+
 FfFbchjX5qCrQHb67FgauTbuQINu7uAACoLxtHYXrSXeNIePtFDrPFnIMazrIPQ8XJqn
 CFoQ==
X-Gm-Message-State: AOAM532R1yncwGj7Q6R4UoTf3qp7dEH9LJFBBt0GN92De/55r6IjvdXP
 /yamoV8DkO/MRTQKv8/PSoGwe6yfrDgxcaHY+5a27kgcGpjVYBh/l668mJxz0u24k62v2ROGbFf
 4M0bvIyxaG39eigDaRlL0x7HCv9JX2/M=
X-Received: by 2002:ac5:cbee:: with SMTP id i14mr11601471vkn.1.1615236128462; 
 Mon, 08 Mar 2021 12:42:08 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxm/tu7t7dH7/d8JQY2tq0sHGvRXiVuy/9NdsFH6qzN0Re8M7vrLOChdwo6U5p8udQx14o/Yu4szBEOpcrNlm8=
X-Received: by 2002:ac5:cbee:: with SMTP id i14mr11601443vkn.1.1615236127900; 
 Mon, 08 Mar 2021 12:42:07 -0800 (PST)
MIME-Version: 1.0
References: <20210304203540.41614-1-nieklinnenbank@gmail.com>
 <20210304203540.41614-3-nieklinnenbank@gmail.com>
 <CAKJDGDZq_ioF91BUWRo_y0GKYGbjgZa46Pt83wp7t3b_ZC=ixw@mail.gmail.com>
 <4d6d2e89-1152-249b-fe55-d1b611fd77e8@redhat.com>
 <CAPan3WqJHFy=GKVXFHgDbTimmZsBueUUhxvs4L+D58J-JQF3ew@mail.gmail.com>
In-Reply-To: <CAPan3WqJHFy=GKVXFHgDbTimmZsBueUUhxvs4L+D58J-JQF3ew@mail.gmail.com>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Mon, 8 Mar 2021 17:41:42 -0300
Message-ID: <CAKJDGDaUrbVpmNRvJvc+psWXzNUk6s=u8NxsR6E727UjiwsjeQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/5] tests/acceptance/boot_linux_console: remove
 Armbian 19.11.3 bionic test for orangepi-pc machine
To: Niek Linnenbank <nieklinnenbank@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=63.128.21.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
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
 Beniamino Galvani <b.galvani@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
 Pavel Dovgalyuk <Pavel.Dovgaluk@ispras.ru>,
 Cleber Rosa Junior <crosa@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Mar 8, 2021 at 5:32 PM Niek Linnenbank <nieklinnenbank@gmail.com> w=
rote:
>
> Hi Philippe, Willian,
>
> On Mon, Mar 8, 2021 at 8:52 AM Philippe Mathieu-Daud=C3=A9 <philmd@redhat=
.com> wrote:
>>
>> On 3/5/21 4:16 PM, Willian Rampazzo wrote:
>> > On Thu, Mar 4, 2021 at 5:44 PM Niek Linnenbank <nieklinnenbank@gmail.c=
om> wrote:
>> >>
>> >> The image for Armbian 19.11.3 bionic has been removed from the armbia=
n server.
>> >> Without the image as input the test arm_orangepi_bionic_19_11 cannot =
run.
>> >>
>> >> This commit removes the test completely and merges the code of the ge=
neric function
>> >> do_test_arm_orangepi_uboot_armbian back with the 20.08 test.
>> >>
>> >> Signed-off-by: Niek Linnenbank <nieklinnenbank@gmail.com>
>> >> ---
>> >>  tests/acceptance/boot_linux_console.py | 72 ++++++++----------------=
--
>> >>  1 file changed, 23 insertions(+), 49 deletions(-)
>> >>
>> >> diff --git a/tests/acceptance/boot_linux_console.py b/tests/acceptanc=
e/boot_linux_console.py
>> >> index eb01286799..9fadea9958 100644
>> >> --- a/tests/acceptance/boot_linux_console.py
>> >> +++ b/tests/acceptance/boot_linux_console.py
>> >> @@ -802,7 +802,29 @@ def test_arm_orangepi_sd(self):
>> >>          # Wait for VM to shut down gracefully
>> >>          self.vm.wait()
>> >>
>> >> -    def do_test_arm_orangepi_uboot_armbian(self, image_path):
>> >> +    @skipUnless(os.getenv('ARMBIAN_ARTIFACTS_CACHED'),
>> >> +                'Test artifacts fetched from unreliable apt.armbian.=
com')
>> >> +    @skipUnless(os.getenv('AVOCADO_ALLOW_LARGE_STORAGE'), 'storage l=
imited')
>> >> +    def test_arm_orangepi_bionic_20_08(self):
>> >> +        """
>> >> +        :avocado: tags=3Darch:arm
>> >> +        :avocado: tags=3Dmachine:orangepi-pc
>> >> +        :avocado: tags=3Ddevice:sd
>> >> +        """
>> >> +
>> >> +        # This test download a 275 MiB compressed image and expand i=
t
>> >> +        # to 1036 MiB, but the underlying filesystem is 1552 MiB...
>> >> +        # As we expand it to 2 GiB we are safe.
>> >> +
>> >> +        image_url =3D ('https://dl.armbian.com/orangepipc/archive/'
>> >> +                     'Armbian_20.08.1_Orangepipc_bionic_current_5.8.=
5.img.xz')
>> >
>> > The Armbian 20 is not available on this link anymore. I can browse jus=
t 21.
>>
>> Cat-and-mouse game *sigh*.
>>
>
> Just to clarify here: in this patch I wanted to only make the change to r=
emove the test for the 19.11.3 image.
> And in the 3rd patch (tests/acceptance/boot_linux_console: change URL for=
 test_arm_orangepi_bionic_20_08)
> do the update for to correct the 20.08 link. So each patch fixes one prob=
lem at a time.
>
> Does that make sense, or do you prefer that I combine them in a single pa=
tch instead?

Ops, I forgot about the 3rd patch in this series. That makes sense to
me, sorry for the mess.

>
> Regards,
> Niek
>
> --
> Niek Linnenbank
>


