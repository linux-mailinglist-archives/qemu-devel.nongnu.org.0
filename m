Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8A2962D43B
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Nov 2022 08:39:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovZUf-0002Es-42; Thu, 17 Nov 2022 02:39:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1ovZUc-0002EQ-TU
 for qemu-devel@nongnu.org; Thu, 17 Nov 2022 02:39:26 -0500
Received: from mail-il1-x12b.google.com ([2607:f8b0:4864:20::12b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1ovZUa-0007rz-Pq
 for qemu-devel@nongnu.org; Thu, 17 Nov 2022 02:39:26 -0500
Received: by mail-il1-x12b.google.com with SMTP id d3so545178ils.1
 for <qemu-devel@nongnu.org>; Wed, 16 Nov 2022 23:39:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=M4aNRpWwveMNmTeqkuzbHdPKwxYlTR9WtRcADrSXlNo=;
 b=O+PMhJZs0KvqGrYn+NeCDEEuMLfN4TT+s6XzDglfXtfRhHYKxyI0k27FgWJnLRrYL7
 BqvPRLT6dPpjgg6M+ZBWVO3auyf7kNMQiPpoVlkDLth54sU464Re2AfYC/7azsZe24co
 NHucD4OJNhsJBt4M8b2uRiLvvbG/yG6WtbTTMu3rqz/kooI4sIdVZSYggZdxfnabBT0x
 9bEvwm7bzCzfTZejnp6lj3uYLLG7RlvVWlcLCvuQVwwYhkiPWh9DAAAXU0hNQRNEhfyX
 sKkXuJe4B83eOwVBohvmuxXtAcMG3U6XgmlRevGirTFGba7I29JsfccJKEJiV56WhR71
 NsEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=M4aNRpWwveMNmTeqkuzbHdPKwxYlTR9WtRcADrSXlNo=;
 b=cED7yCCGgYVehw1q34yPiezwkEJvA6M0wCNi8SWWPld0tVq1UC7ekMP92ZE26PZc7M
 B0xKZfzu8Eg9XOdj1DaWHCuneWXdZ0gXosTzFlB0Te3l29av4L7PAVUPtiJLfLs1PDsN
 Htllr/ljy8+As4q7yakCTpg/8Jpz3lXEtpzB2nFzyHsDxEk1uxFumvOQ3bwl2PHRHBTM
 Pvp5zQgqS7tqbBDh+3NF1/XhAbXEPRE5onQPjRxHkJPrWW63KDI3a0CtbuXWd5Pry5k0
 TFFoAYQiW7zgYXPowjPICSFFW18NvVumxj/qrFwFZm41r/bMBQ/RZL+JRFpRfvaZp03/
 AMbg==
X-Gm-Message-State: ANoB5pmVB1wortzvNk/6loZUKGX1wNW+JFW8pb5nbE50oJlmR3nBPfg6
 DV2VUJhM1S/p3USydFNtlno3ZgN40HcyWoaV0MT4cw==
X-Google-Smtp-Source: AA0mqf5RRnlFwxoPGZJD6PxWKEIuxngZc3d6jUD3/9nGb1c5RiQlWW9Z4qxdJFJTbyuGh/HmvtV6NtXGdKUx+NIVCfM=
X-Received: by 2002:a92:d03:0:b0:302:988e:4ea7 with SMTP id
 3-20020a920d03000000b00302988e4ea7mr695916iln.224.1668670762727; Wed, 16 Nov
 2022 23:39:22 -0800 (PST)
MIME-Version: 1.0
References: <20221115212759.3095751-1-jsnow@redhat.com>
 <CAARzgwxaVyQf424PeUOO=efyPHdiMK9nF7g+pHuKufqU1cg1-g@mail.gmail.com>
 <CAFn=p-bkTkpJxT6RyT2JGEF6Kn0FMFy+PU9Ux3eykehzJ+8u9w@mail.gmail.com>
 <CAARzgwyXZMoRAUjc6PR-DUDGYsscBX8321YFhd=5+wrVmJ+xSA@mail.gmail.com>
In-Reply-To: <CAARzgwyXZMoRAUjc6PR-DUDGYsscBX8321YFhd=5+wrVmJ+xSA@mail.gmail.com>
From: Ani Sinha <ani@anisinha.ca>
Date: Thu, 17 Nov 2022 13:09:11 +0530
Message-ID: <CAARzgwyhbEz=Nvbeb4H7Db77SOGsV0VSsxXdYR2H890LSzC=+w@mail.gmail.com>
Subject: Re: [PATCH] tests/avocado: configure acpi-bits to use avocado timeout
To: John Snow <jsnow@redhat.com>
Cc: Beraldo Leal <bleal@redhat.com>, Cleber Rosa <crosa@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: none client-ip=2607:f8b0:4864:20::12b;
 envelope-from=ani@anisinha.ca; helo=mail-il1-x12b.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

On Thu, Nov 17, 2022 at 5:24 AM Ani Sinha <ani@anisinha.ca> wrote:
>
>
>
> On Wed, Nov 16, 2022 at 11:31 PM John Snow <jsnow@redhat.com> wrote:
>>
>>
>>
>> On Tue, Nov 15, 2022, 10:24 PM Ani Sinha <ani@anisinha.ca> wrote:
>>>
>>> On Wed, Nov 16, 2022 at 2:58 AM John Snow <jsnow@redhat.com> wrote:
>>> >
>>> > Instead of using a hardcoded timeout, just rely on Avocado's built-in
>>> > test case timeout. This helps avoid timeout issues on machines where =
60
>>> > seconds is not sufficient.
>>> >
>>> > Signed-off-by: John Snow <jsnow@redhat.com>
>>>
>>> Reviewed-by: Ani Sinha <ani@anisinha.ca>
>>
>>
>> Alex's critique is valid, though: the way vm.wait() works is to immediat=
ely  terminate the serial console connection as it prepares for the VM to s=
hut down. I forgot about this.
>>
>> (For historical reasons, it does this to avoid deadlocks when the pipe f=
ills.)
>>
>> I think we definitely do want to make sure we watch the console *while* =
we wait for it to shut down, which is not a feature QEMUMachine really offe=
rs right now in a meaningful way.
>
>
> Maybe  we can push your current patch while we consider these console log=
ging enhancements for the next release window. Console logging woikd requir=
e some changes in bits and some more testing. I'm not sure if I'll have tim=
e for it immediately at present.
>
>>
>> I need to make some more drastic changes to machine.py, but in the meant=
ime I can revise this patch to do something a bit smarter so we get console=
 logging while we wait. This is a use case worth supporting.
>>
>> (Thanks for writing new and interesting tests!)

Spoke to John on IRC. Seems this patch using vm.wait() is safe for
this release as I do not use the console o/p in the test and do not
call vm.set_console().
When we enable the console output, some additional work will need to
be done for the QemuMachine library to make sure we avoid races when
we call vm.wait() with _early_cleanup().

>>
>>>
>>> > ---
>>> >  tests/avocado/acpi-bits.py | 10 ++--------
>>> >  1 file changed, 2 insertions(+), 8 deletions(-)
>>> >
>>> > diff --git a/tests/avocado/acpi-bits.py b/tests/avocado/acpi-bits.py
>>> > index 8745a58a766..ac13e22dc93 100644
>>> > --- a/tests/avocado/acpi-bits.py
>>> > +++ b/tests/avocado/acpi-bits.py
>>> > @@ -385,12 +385,6 @@ def test_acpi_smbios_bits(self):
>>> >          self._vm.launch()
>>> >          # biosbits has been configured to run all the specified test=
 suites
>>> >          # in batch mode and then automatically initiate a vm shutdow=
n.
>>> > -        # sleep for maximum of one minute
>>> > -        max_sleep_time =3D time.monotonic() + 60
>>> > -        while self._vm.is_running() and time.monotonic() < max_sleep=
_time:
>>> > -            time.sleep(1)
>>> > -
>>> > -        self.assertFalse(time.monotonic() > max_sleep_time,
>>> > -                         'The VM seems to have failed to shutdown in=
 time')
>>> > -
>>> > +        # Rely on avocado's unit test timeout.
>>> > +        self._vm.wait(timeout=3DNone)
>>>
>>> I think this is fine. This just waits until the VM is shutdown on its
>>> own and relies on the avocado framework to timeout if it doesn't. We
>>> do not need to look into the console. The test issues a shutdown from
>>> the VM itself once its done with the batch operations.
>>
>>
>> Still, if it fails, we want to see the output, right? It's very frustrat=
ing if it doesn't, especially in an automated pipeline.
>>
>>>
>>> >          self.parse_log()
>>> > --
>>> > 2.37.3
>>> >
>>>

