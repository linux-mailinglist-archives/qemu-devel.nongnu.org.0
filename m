Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FF5457C963
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jul 2022 12:52:52 +0200 (CEST)
Received: from localhost ([::1]:52516 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oETnX-0007YQ-I6
	for lists+qemu-devel@lfdr.de; Thu, 21 Jul 2022 06:52:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44128)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1oETm1-0005Rw-Qd
 for qemu-devel@nongnu.org; Thu, 21 Jul 2022 06:51:17 -0400
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633]:35432)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1oETlz-0003qS-UM
 for qemu-devel@nongnu.org; Thu, 21 Jul 2022 06:51:17 -0400
Received: by mail-ej1-x633.google.com with SMTP id j22so2501928ejs.2
 for <qemu-devel@nongnu.org>; Thu, 21 Jul 2022 03:51:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:user-agent:in-reply-to:references
 :message-id:mime-version:content-transfer-encoding;
 bh=A1rXyauJAHvPVf5eLj8TpObWwS1xyNaNkEKi85NgJNY=;
 b=oxlLrBri/INB4qEIvmtzL/FmErEVPmoheeq/uai8o/Id9zYW1H2SFrEOIBJiXcFmvx
 SudEYGWluKmj7dXIJiq/YRIIO86gjKxzK8iDbLCffhRs3SvHfmIuZMrxkRJtfYwmFzN2
 kcij9i3/Ugc5+SReey+Rpm2LYmzpCfn4j8WYmY8EzbPX+rmZALr6uuLsyKN9li9NNQq/
 8C6PxSXjw97nLP0dXB9euE10ecW98JrViibClE2Wv0nfjBOiV+g2QtIMH+XW0GYXu6pQ
 Ee3o737dULvx5IIp7p6DGdI+zoVkOlL6aZb1pv9Nbgp77gsg4VIh/UdR3PNHQ4UR608p
 6Fsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:user-agent:in-reply-to
 :references:message-id:mime-version:content-transfer-encoding;
 bh=A1rXyauJAHvPVf5eLj8TpObWwS1xyNaNkEKi85NgJNY=;
 b=CKzXPA/H9INZDXWPAEdEE5Ybbg5qVwxu76LA7RCJetSrKEGG1UjuaNtlRJ+Ez0Tvec
 H0ss9TZELCsSqH9RKML6pO07QA9UFoDa9+3hgyNUUDrGRcHRyT/6hxfph8gr1edazk30
 q1SNIm3Bd/Hxck3ewhU6mWRhTkmE5BvBRr9M8J/KKW95pbiysUb42t9oeODg7+W/U6PJ
 RqYvlLBtRauO08drxOnrf0cA+G4IRqeX+GexSpmM92ao/o1i7q43XkL6G0f0DRDi6JG7
 swrJKPZeX0uVs2q36reivC9VpwhIGir6l7IOFeanw9Nmm9mbuWi7Zo0KgfwYEVETuLp1
 Xc3A==
X-Gm-Message-State: AJIora/9LA6KEz+M6tl4UfOWUPY6QkFMET0aemVHzmHUX0apZnCIsWlZ
 YuWnDpzhs96atKcXkJwmntcFVC4JkS0y8w==
X-Google-Smtp-Source: AGRyM1tqBi2uEkDRRJ/dwNhzHqgj0BvLQ24jAmfFpCCstLNmQHQwbkQ5eeJ/YcRIra/6AdAHredPUg==
X-Received: by 2002:a17:907:e87:b0:72b:4a74:e30b with SMTP id
 ho7-20020a1709070e8700b0072b4a74e30bmr40474500ejc.222.1658400673828; 
 Thu, 21 Jul 2022 03:51:13 -0700 (PDT)
Received: from [127.0.0.1] (dynamic-077-191-091-219.77.191.pool.telefonica.de.
 [77.191.91.219]) by smtp.gmail.com with ESMTPSA id
 q6-20020a056402032600b0043574d27ddasm761177edw.16.2022.07.21.03.51.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Jul 2022 03:51:13 -0700 (PDT)
Date: Thu, 21 Jul 2022 12:51:10 +0200
From: BB <shentey@gmail.com>
To: qemu-devel@nongnu.org, Ani Sinha <ani@anisinha.ca>,
 Peter Maydell <peter.maydell@linaro.org>
CC: "Michael S. Tsirkin" <mst@redhat.com>,
 =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Igor Mammedov <imammedo@redhat.com>
Subject: =?US-ASCII?Q?Re=3A_=5BPULL_06/35=5D_hw/acpi=3A_refactor_acpi_hp_modu?=
 =?US-ASCII?Q?les_so_that_targets_can_just_use_what_they_need?=
User-Agent: K-9 Mail for Android
In-Reply-To: <alpine.DEB.2.22.394.2207201450430.17070@anisinha-lenovo>
References: <20210904213506.486886-1-mst@redhat.com>
 <20210904213506.486886-7-mst@redhat.com>
 <CAFEAcA9WBo2Kn9BPz1y2JCxpBGnBWDOtgLFiu31V4PL2m6b7bQ@mail.gmail.com>
 <alpine.DEB.2.22.394.2207201132430.9370@anisinha-lenovo>
 <CAFEAcA8-ufAM2sg8-WkCPV3ksBZ=RU_1M2aq-wUBij82ot7iUw@mail.gmail.com>
 <alpine.DEB.2.22.394.2207201450430.17070@anisinha-lenovo>
Message-ID: <E0C00EA5-7C15-483D-9A02-F7789AF6A911@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x633.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On July 21, 2022 12:13:06 AM GMT+02:00, Ani Sinha <ani@anisinha=2Eca> wrot=
e:
>
>
>On Wed, 20 Jul 2022, Peter Maydell wrote:
>
>> On Wed, 20 Jul 2022 at 19:37, Ani Sinha <ani@anisinha=2Eca> wrote:
>> >
>> >
>> >
>> > On Tue, 19 Jul 2022, Peter Maydell wrote:
>> >
>> > > On Sat, 4 Sept 2021 at 22:36, Michael S=2E Tsirkin <mst@redhat=2Eco=
m> wrote:
>> > > How is this intended to work? The obvious fix from my point
>> > > of view would just be to say "piix4=2Ec requires pcihp=2Ec"
>> > > and cause CONFIG_ACPI_PIIX4 to pull in CONFIG_ACPI_PCIHP,
>> > > but that seems like it would be rather undoing the point
>> > > of this change=2E
>> >
>> > Yes=2E From the commit log and the vague recollection I have about th=
is
>> > change :
>> >
>> > > For example, mips only needs support for PIIX4 and does not
>> > > need acpi pci hotplug support or cpu hotplug support or memory hotp=
lug
>> > support
>> > > etc
>> >
>> > So does malta really need acpi hotplug? If not, then the stubbing out=
 of
>> > the vmstate struct is correct=2E
>>
>> It's not, because the vmstate struct is actually used when you
>> savevm/loadvm a malta machine=2E If the malta shouldn't have
>> acpi hotplug then we need to arrange for the hotplug code
>> to be avoided at an earlier point, not just stub in the
>> vmstate struct field=2E
>
>yes I think that would be more appropriate fix, I agree=2E Since mst adde=
d
>that vmstate, maybe he can comment on this=2E
>

Despite its name, ACPI_PIIX4 is also used by PIIX3, which is required by t=
he "pc" machines=2E These machines support migration etc=2E which may expla=
in why ACPI_PIIX4 has the vmstate struct field=2E To me it just looks like =
an oversight that the Malta board doesn't support all ACPI_PIIX4 features=
=2E

Best regards,
Bernhard

