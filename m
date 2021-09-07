Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D9D2402688
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Sep 2021 11:52:52 +0200 (CEST)
Received: from localhost ([::1]:43174 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNXmd-0002L3-KU
	for lists+qemu-devel@lfdr.de; Tue, 07 Sep 2021 05:52:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34750)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mNXjl-00007C-0B
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 05:49:53 -0400
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536]:39807)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mNXji-0000gp-PZ
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 05:49:52 -0400
Received: by mail-ed1-x536.google.com with SMTP id r7so13057878edd.6
 for <qemu-devel@nongnu.org>; Tue, 07 Sep 2021 02:49:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=qCkpKmFU+UpCAsAoDX99fqgW6dOxuQxW7Ax0vXDm7g4=;
 b=raQGixHPCN5RKBCDsNma/0ys6jpuwsFSHyJCNlmKY66TfDJ9gFmVVj9FrLrs9hCl4e
 rjbajNuUdLQOI/R4EpLUryd1TLj7nREdtcAJnIk0sT29NJySzSRRuur7ueSVc2WgavUN
 R2MejnGCoBb8rXs3GRO+STxFGj5METg1YhWFEz0+8KUv5eDC2nOc1rEy2UA0apag+01p
 5PfenudG+xXwxoRR1pVH7e0+Nz5xR335FsCoZkNehQa0qR6P/U4Sjfnq2tttIW2QbtSi
 hIsPlTNgcWQ9Dz8PODjs1f4HmOyXUfUy1nZZirmakc/VOBcPEjGZBqF2bSK0V46UcAcz
 BMbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=qCkpKmFU+UpCAsAoDX99fqgW6dOxuQxW7Ax0vXDm7g4=;
 b=O5Kgw4s6egFF+/SeP6NGVgfV7LrxbK2VBGahu5BRQnTDLT32aGSE3GeFUOFAIBLbKa
 u5PLaoeJAicPmsEB8YVrPu9mhqlDjS7+FMpfaDNpkkCxb9K45YQ4O9AWmc/Vi4xjbT7U
 SpivcIL5Qqv1A2Tuu1UfgGg0FRJWctsNDaDOB1FdLlMhbt452aD7R84qmPd+9f/MoLc3
 QpEQdvwxpZHaAWh4ueEDwaJxEN52nr3f3fbY6Y9DfIwMk2BSOSmVTh1GqzGEN7MHOniD
 RT4jRawPc3KO9uHWFwl7QlsNp4P2pD5wab56LlqnZHC8GdVbW8KuFxGDncMHgh4nS2zc
 aZkg==
X-Gm-Message-State: AOAM531upYn+Fnr1HGVl9MghTXAZ8nY85ogTVWwRgNxWwBoDT96lrKKt
 IVG/n/Pk/u+QpThP5Ln2jD0DMPdPbCK8Ou/GIVOsxw==
X-Google-Smtp-Source: ABdhPJzPB0kIHhKBU2h38vlvRPHQ5l6cemzwFcR9GvYHu9WtQQP1MB+sjRySrIFNnp6ZjqZj0r5gg6LhYcReFiZWzhM=
X-Received: by 2002:a05:6402:cab:: with SMTP id
 cn11mr17705425edb.293.1631008188201; 
 Tue, 07 Sep 2021 02:49:48 -0700 (PDT)
MIME-Version: 1.0
References: <20210904213506.486886-1-mst@redhat.com>
 <20210904213506.486886-7-mst@redhat.com>
 <6a9c2fde-317d-bd31-5a8c-135446b881dc@redhat.com>
 <alpine.DEB.2.22.394.2109061531570.2070064@anisinha-lenovo>
 <43ea19c8-fdd6-554d-5138-79b8995d22cd@redhat.com>
 <CAARzgwzkMPwgwbbSnHGH5yLF=mbr7_z1zpKTjbVkg6rgpX4MfA@mail.gmail.com>
 <CAARzgwxXCJ_a4Z-x0Bc_4PV_pEScxr2fp0cMxRf49BiZUvQ9dA@mail.gmail.com>
 <81639a95-654b-9064-de24-347561b6783e@redhat.com>
 <CAARzgwxkYk=ZMB_XqF1P1zhnFB+Tdjj=yNrPG4=MqBU=PJEF0A@mail.gmail.com>
In-Reply-To: <CAARzgwxkYk=ZMB_XqF1P1zhnFB+Tdjj=yNrPG4=MqBU=PJEF0A@mail.gmail.com>
From: Ani Sinha <ani@anisinha.ca>
Date: Tue, 7 Sep 2021 15:19:37 +0530
Message-ID: <CAARzgwxYW5Ab7B1v=J1O4RwcqfLt-yk-QfhszHXiH7PFNaUpaA@mail.gmail.com>
Subject: Re: [PULL 06/35] hw/acpi: refactor acpi hp modules so that targets
 can just use what they need
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: none client-ip=2a00:1450:4864:20::536;
 envelope-from=ani@anisinha.ca; helo=mail-ed1-x536.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Igor Mammedov <imammedo@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Sep 7, 2021 at 12:04 PM Ani Sinha <ani@anisinha.ca> wrote:
>
>
>
> On Tue, Sep 7, 2021 at 11:44 AM Philippe Mathieu-Daud=C3=A9 <philmd@redha=
t.com> wrote:
>>
>> On 9/7/21 7:55 AM, Ani Sinha wrote:
>> > On Mon, Sep 6, 2021 at 4:19 PM Ani Sinha <ani@anisinha.ca> wrote:
>> >>
>> >> On Mon, Sep 6, 2021 at 3:54 PM Philippe Mathieu-Daud=C3=A9 <philmd@re=
dhat.com> wrote:
>> >>>
>> >>> On 9/6/21 12:03 PM, Ani Sinha wrote:
>> >>>> On Mon, 6 Sep 2021, Philippe Mathieu-Daud=C3=A9 wrote:
>> >>>>> On 9/4/21 11:36 PM, Michael S. Tsirkin wrote:
>> >>>>>> From: Ani Sinha <ani@anisinha.ca>
>> >>>>>>
>> >>>>>> Currently various acpi hotplug modules like cpu hotplug, memory h=
otplug, pci
>> >>>>>> hotplug, nvdimm hotplug are all pulled in when CONFIG_ACPI_X86 is=
 turned on.
>> >>>>>> This brings in support for whole lot of subsystems that some targ=
ets like
>> >>>>>> mips does not need. They are added just to satisfy symbol depende=
ncies. This
>> >>>>>> is ugly and should be avoided. Targets should be able to pull in =
just what they
>> >>>>>> need and no more. For example, mips only needs support for PIIX4 =
and does not
>> >>>>>> need acpi pci hotplug support or cpu hotplug support or memory ho=
tplug support
>> >>>>>> etc. This change is an effort to clean this up.
>> >>>>>> In this change, new config variables are added for various acpi h=
otplug
>> >>>>>> subsystems. Targets like mips can only enable PIIX4 support and n=
ot the rest
>> >>>>>> of all the other modules which were being previously pulled in as=
 a part of
>> >>>>>> CONFIG_ACPI_X86. Function stubs make sure that symbols which piix=
4 needs but
>> >>>>>> are not required by mips (for example, symbols specific to pci ho=
tplug etc)
>> >>>>>> are available to satisfy the dependencies.
>> >>>>>>
>> >>>>>> Currently, this change only addresses issues with mips malta targ=
ets. In future
>> >>>>>> we might be able to clean up other targets which are similarly pu=
lling in lot
>> >>>>>> of unnecessary hotplug modules by enabling ACPI_X86.
>> >>>>>>
>> >>>>>> This change should also address issues such as the following:
>> >>>>>> https://gitlab.com/qemu-project/qemu/-/issues/221
>> >>>>>> https://gitlab.com/qemu-project/qemu/-/issues/193
>> >>>>>
>> >>>>> FYI per https://docs.gitlab.com/ee/administration/issue_closing_pa=
ttern.html
>> >>>>> this should have been:
>> >>>>>
>> >>>>> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/193
>> >>>>> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/221
>> >>>>>
>> >>>>
>> >>>> Ah my apologies. Will do this next time.
>> >>>>
>> >>>>> Can we close these issues manually?
>> >>>>
>> >>>> Since both you and I have verified that those issues gets fixed wit=
h my
>> >>>> change, yes we can close them. I do not have a gitlab account. Shou=
ld I
>> >>>> have one? Is there special permissions needed to handle these ticke=
ts?
>> >>>
>> >>> Since you are listed in the MAINTAINERS file, long-term you'll
>> >>> eventually use it anyway (i.e. to run the CI pipelines before sendin=
g
>> >>> patches, to subscribe to the 'ACPI' label to get notifications or
>> >>> comment ACPI-related issues).
>> >>>
>> >>> The process is quite straight-forward, once having an account you
>> >>> simply request to be member of the project via the WebUI then you
>> >>> can help triaging the issues (and closing these two).
>> >>
>> >> Hmm. I created an account and added a comment to the tickets. However
>> >> I am unable to close them. I requested access to the project.
>> >
>> > I could be wrong, but I think only reporters can open and close bugs
>> > like yourself on gitlab.
>>
>> Hmm it is unclear who can close an issue, per:
>> https://docs.gitlab.com/ee/user/permissions.html#project-members-permiss=
ions
>>
>> Let's wait until you get added to the project as a member: I assume
>> you are currently 'guest' and would become 'reporter'.
>
>
> Ok will ping people on IRC today.

Bonzini helped. I have closed both tickets.

