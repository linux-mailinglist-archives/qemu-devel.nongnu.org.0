Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2545E6A5415
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Feb 2023 09:04:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWux7-0002iy-1P; Tue, 28 Feb 2023 03:03:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pWuwo-0002iC-EE; Tue, 28 Feb 2023 03:02:55 -0500
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pWuwm-0002nw-CR; Tue, 28 Feb 2023 03:02:54 -0500
Received: by mail-ed1-x52e.google.com with SMTP id d30so36269257eda.4;
 Tue, 28 Feb 2023 00:02:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TL2t7woMLCXouUqQ7fnm7SToKschG3SJEZugMgPMGWo=;
 b=n24Q1rtzwE3zjDcwkUKnezfE466nv7A8OMxl3Ig78nLVnSG8NIqSXrVgk72AKF7noz
 mGWQW47cGZRVamZNj+vQXd5E/3ZO16ZYkoiS9iOzhvmsa3OCR/rGgvCVj0P/+b6y7PA5
 p08rnpdiTRClFV3Q/UaFhEMf/t5m0g+Y8lyDcI73ZycExFZNvzlMewSfivEzTDPQdNcA
 1L+7CvzpjBAPmj4q44UoA4rXPl5fyYR/MfN5Yqi3yrjy6JZYljWLsGAZTph7rZqYhIpb
 kna50Z7O+nzWYE326logLJNAHbAiHvflGZIjUaa816I7RFKGdMbPq+uHm3DVzYSR1mwj
 EyFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TL2t7woMLCXouUqQ7fnm7SToKschG3SJEZugMgPMGWo=;
 b=g+dQGYaeiLooCijZrgpDsaouBv8qwmIXprEmO8SiL55k2DrfK4pSBpKhARpPWioadt
 W7G9NchYyAIUOzUSXPtXvTtSP8R6Xwo/g5dTOqVElk7gzcxQRvX90qy/W/4nSEiwXP8+
 dbGf2fhrwhkx43kXak4MjaAAOVrz78UMo/FFebrrVp2NE8m1oTYO+/0Jyvz1a1W6pi+P
 r8JKoR0TolK/+tmi2cIXpok3GuY28OJemuFmRwe45uiYYNft8IhUnfctZFjf2cxp8pKx
 1XicKEJh9NZGNElf3zYMUv8Mf8AibWir1OlBiGfnvkWPtKILxzf2qBznE7wmy5WeO515
 o1oQ==
X-Gm-Message-State: AO0yUKV+9EDCuOz1p0TrnAldbE2oaY6kzsxVaNhJ9nxmfkxBSYgyfmcW
 EcbJzh5aAciu03RO+6rZCp0=
X-Google-Smtp-Source: AK7set8a8Q7xzsgv32a5HpeCny/u+LmVHacUdvJIulT7rHKc/nSjwUTjcpKKlGOjMyPwpRirO8Ti9w==
X-Received: by 2002:aa7:db58:0:b0:4ac:bd6e:9975 with SMTP id
 n24-20020aa7db58000000b004acbd6e9975mr2317696edt.20.1677571369252; 
 Tue, 28 Feb 2023 00:02:49 -0800 (PST)
Received: from [127.0.0.1] (dynamic-077-191-063-161.77.191.pool.telefonica.de.
 [77.191.63.161]) by smtp.gmail.com with ESMTPSA id
 a43-20020a509eae000000b004a21263bbaasm4025333edf.49.2023.02.28.00.02.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Feb 2023 00:02:48 -0800 (PST)
Date: Tue, 28 Feb 2023 08:02:42 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>,
 BALATON Zoltan <balaton@eik.bme.hu>
CC: qemu-devel@nongnu.org, Huacai Chen <chenhuacai@kernel.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, qemu-ppc@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH v4 0/7] Pegasos2 fixes and audio output support
In-Reply-To: <b4b60712-a94c-69f4-2de0-b9b5e08970fc@linaro.org>
References: <20230227125732.20941-1-shentey@gmail.com>
 <b86db1dd-b9ca-a774-963c-4f9404c9af5c@eik.bme.hu>
 <CAG4p6K74Rm2FaErjvSyVCgcMQ2Qz0pkh2dg6yPeXU5BmwYp3RQ@mail.gmail.com>
 <56e3575f-2cac-2138-23d1-78d8ff1388b5@eik.bme.hu>
 <CAG4p6K7Yd6SWBCC1_-fJJ1rLqCuRqwi=dOmypum7kiUZ4SoH=g@mail.gmail.com>
 <2952e466-98e1-cf16-b8c2-fdc49d0ebf48@eik.bme.hu>
 <b4b60712-a94c-69f4-2de0-b9b5e08970fc@linaro.org>
Message-ID: <9A21F1F3-270E-4C30-8B28-70719DF42D35@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x52e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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



Am 27=2E Februar 2023 22:12:46 UTC schrieb "Philippe Mathieu-Daud=C3=A9" <=
philmd@linaro=2Eorg>:
>On 27/2/23 18:47, BALATON Zoltan wrote:
>> On Mon, 27 Feb 2023, Bernhard Beschow wrote:
>>> Unfortunately my patches had changes merged in=2E This now makes it ha=
rd to
>>> show what really changed (spoiler: nothing that affects behavior)=2E
>>>=20
>>> As you probably noticed in the "resend" version of this iteration I sp=
lit
>>> off a patch introducing the priq properties=2E It belongs to the sub s=
eries
>>> of the Pegasos2 IRQ fixes which appear unnecessary to me, so I don't w=
ant
>>> to show up in `git blame` as the author of any of these changes=2E I
>>> attributed it to you because this was really your change which I'm not=
 even
>>> sure is legal=2E
>>>=20
>>> Let's avoid such complications by keeping our series separate=2E
>>=20
>> Let's cool down a bit=2E Philippe took some of the sm501 patches in his=
 giant pull request (and a lot of your patches too) now so I'll wait until =
that lands and hope to get some review for the remaining patches too=2E Onc=
e that pull req is merged I'll rebase the remaining patches and resubmit th=
e series also adding changes for reasonable review comments I get by then=
=2E
>
>I'm sorry it took me so long, I was expecting these patches to be picked
>up by other maintainers but everybody is very busy=2E I know you'll need
>to rebase and it might be painful=2E But I did that believing it is the
>best I could give to the project with my current capacity=2E Also I don't
>want to overlap (too much) into other (sub)maintained areas=2E
>If you are stuck with a rebase, I can try to help=2E
>We'll get to the end of PIIX, if this isn't this release, it will be
>the next one=2E I've been waiting for these cleanups since 4 years
>already, before Herv=C3=A9 Poussineau pushed toward that direction during
>3 years=2E We always hit problems due to PC world inheritance which,
>as a production system, can not regress=2E

Did you intend to reply in the PIIX consolidation or global ISA bus renova=
l series? This is a VT82xx thread=2E=2E=2E

Thanks for picking up the ICH9 changes!

>
>Also I don't want to compete with you guys, I'd really love to work
>together as team, but I have other responsibilities and sometime I
>can't spend the time I'd like here=2E
>
>What blocks the PIIX changes is the "q35/ich9/-device piix3" broken
>config=2E I'll explain elsewhere why it is broken=2E The problem is I
>don't know how to suggest alternative=2E
>
>Bernhard sometimes it is easier to share visions in a 30min call,
>rather than on a such thread=2E If you want I'm open for one=2E
>

Sure, I'm open for that=2E I'll let you know when I'll have some time=2E

Best regards,
Bernhard

