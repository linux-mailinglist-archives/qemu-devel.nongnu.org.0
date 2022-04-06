Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2B984F5C0D
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Apr 2022 13:18:07 +0200 (CEST)
Received: from localhost ([::1]:53604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nc3fq-0005kX-HV
	for lists+qemu-devel@lfdr.de; Wed, 06 Apr 2022 07:18:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37070)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nc3ch-0003v4-Ty
 for qemu-devel@nongnu.org; Wed, 06 Apr 2022 07:14:51 -0400
Received: from mail-yw1-x112c.google.com ([2607:f8b0:4864:20::112c]:39069)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nc3cf-0008Iy-AC
 for qemu-devel@nongnu.org; Wed, 06 Apr 2022 07:14:51 -0400
Received: by mail-yw1-x112c.google.com with SMTP id
 00721157ae682-2eb3db5b172so22147347b3.6
 for <qemu-devel@nongnu.org>; Wed, 06 Apr 2022 04:14:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MkKxjYAV/v0VMd11SMXqG8EhXPeJQ34GzLrs6aLHBhk=;
 b=BnkL/xviW3/SATQQBN0J4jLUdrTQRMmZsVp7lEWCOmkmWwekK4I3vVJpW5wY+oaW6o
 wMWw7poztVXO8dmLd+4dn47QCBX/MLXDvtQ0FtncjF48Ky/apTe5LetGClF9I8xv8hLd
 39QIq1nCVrCyq+b89tHhY+wy8NDABlDcruy0U3VUH+wy5CC/74PQNoqlWZUGpPI4ktd2
 2syhOC3nTsaeBG0iofZAEy+fKLdo2YsKyo/Wo++rIt2NrTU9fzPbBH0Ng8KlfS5PTmtk
 EZZmtp49FjP3cappOUQR7sHOielNZL7XjaQF+GBy228W5SABlrjalbp+fGs0YWTIyb9y
 NQoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MkKxjYAV/v0VMd11SMXqG8EhXPeJQ34GzLrs6aLHBhk=;
 b=32uRKRJ0LWry0h+rj2HuAc3SD/Qx/YGoQogVzviYdNafUoEJzWddD/2pLHWEReu9mN
 H5hVZwfJ7RX5gbMsXicG3r0kbdFeG3yzTUpEcujPXyQOOoccSKAZgvjYvP6+RlwJhesA
 UYyDpRonbMfBOgwfUmDICTBi1eQr3hR1bkoGAh9991G8WPbbKFJeOwHV+DRWbHwzSFBu
 hMdJMCPcR+uhHGZF0JllsD5cjUwKrgTFyKyZUQKJtu4tl1s/cTcB5SvhWYFjZNDR+aO1
 1dW6IDSH4LG9AFNXt4ma3Z0r0MHI9ywukSeEalNTlD+lZ8t5obIfgAOBhHIOaCf9vy0Z
 BXnA==
X-Gm-Message-State: AOAM530qPGE/QusYaZq8JWbwpjFbNoO7OpWWElKwh33CmYAm8uRTrShX
 AbkKF8Bcbr0Jr9cX/UXXQfCMQEhMIwAiTy5SlGb04w==
X-Google-Smtp-Source: ABdhPJytWaKSjrcKoa2mbzwJv7RhwFSgw11lPqUjgtEaNT3OmaJMCRA7mDMdyjLwii6p/gHggvStzLZXxV0l/YkXcmI=
X-Received: by 2002:a81:1592:0:b0:2eb:5472:c681 with SMTP id
 140-20020a811592000000b002eb5472c681mr6491648ywv.10.1649243687745; Wed, 06
 Apr 2022 04:14:47 -0700 (PDT)
MIME-Version: 1.0
References: <20220323155743.1585078-1-marcandre.lureau@redhat.com>
 <20220323155743.1585078-33-marcandre.lureau@redhat.com>
 <CAARzgwzXXKqhvP9CnST3iD_obfqCWn8Z+8WNcs0u-O_UGoM1-w@mail.gmail.com>
 <87o81epk1s.fsf@pond.sub.org>
In-Reply-To: <87o81epk1s.fsf@pond.sub.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 6 Apr 2022 12:14:36 +0100
Message-ID: <CAFEAcA9kYweS2zMHjWDuV_y2AxKbgJ5UYNHLK3sASCLVD=yEqg@mail.gmail.com>
Subject: Re: [PATCH 32/32] Remove qemu-common.h include from most units
To: Markus Armbruster <armbru@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112c;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: John G Johnson <john.g.johnson@oracle.com>,
 Alexey Kardashevskiy <aik@ozlabs.ru>, Li Zhijian <lizhijian@fujitsu.com>,
 KONRAD Frederic <frederic.konrad@adacore.com>,
 "open list:raw" <qemu-block@nongnu.org>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 Huacai Chen <chenhuacai@kernel.org>, Halil Pasic <pasic@linux.ibm.com>,
 Kamil Rytarowski <kamil@netbsd.org>,
 =?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Michael Roth <michael.roth@amd.com>, Alexander Bulekov <alxndr@bu.edu>,
 Stefan Hajnoczi <stefanha@redhat.com>, John Snow <jsnow@redhat.com>,
 Aarushi Mehta <mehta.aaru20@gmail.com>, Kevin Wolf <kwolf@redhat.com>,
 Andrew Jeffery <andrew@aj.id.au>, Chris Wulff <crwulff@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>, Zhang Chen <chen.zhang@intel.com>,
 "open list:sPAPR \(pseries\)" <qemu-ppc@nongnu.org>,
 Igor Mammedov <imammedo@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Fam Zheng <fam@euphon.net>, David Hildenbrand <david@redhat.com>,
 Yanan Wang <wangyanan55@huawei.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Helge Deller <deller@gmx.de>,
 Qiuhao Li <Qiuhao.Li@outlook.com>, Artyom Tarasenko <atar4qemu@gmail.com>,
 Stefano Garzarella <sgarzare@redhat.com>, Eric Farman <farman@linux.ibm.com>,
 Corey Minyard <minyard@acm.org>, Stefan Weil <sw@weilnetz.de>,
 Julia Suvorova <jusual@redhat.com>, Greg Kurz <groug@kaod.org>,
 Cameron Esfahani <dirty@apple.com>, Bandan Das <bsd@redhat.com>,
 Alexander Graf <agraf@csgraf.de>, Michael Rolnik <mrolnik@gmail.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 "open list:RISC-V TCG CPUs" <qemu-riscv@nongnu.org>,
 Cornelia Huck <cohuck@redhat.com>,
 "open list:S390-ccw boot" <qemu-s390x@nongnu.org>,
 Tyrone Ting <kfting@nuvoton.com>, Hanna Reitz <hreitz@redhat.com>,
 "open list:ARM PrimeCell and..." <qemu-arm@nongnu.org>,
 Wenchao Wang <wenchao.wang@intel.com>, Aurelien Jarno <aurelien@aurel32.net>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>, Jason Wang <jasowang@redhat.com>,
 Bin Meng <bin.meng@windriver.com>, Taylor Simpson <tsimpson@quicinc.com>,
 Colin Xu <colin.xu@intel.com>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, Joel Stanley <joel@jms.id.au>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Fabien Chouteau <chouteau@adacore.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Laurent Vivier <Laurent@vivier.eu>,
 "open list:Overall KVM CPUs" <kvm@vger.kernel.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, qemu-devel@nongnu.org,
 "open list:X86 HAXM CPUs" <haxm-team@intel.com>, Ani Sinha <ani@anisinha.ca>,
 Warner Losh <imp@bsdimp.com>, Marek Vasut <marex@denx.de>,
 Jagannathan Raman <jag.raman@oracle.com>,
 Havard Skinnemoen <hskinnemoen@google.com>,
 Reinoud Zandijk <reinoud@netbsd.org>, Kyle Evans <kevans@freebsd.org>,
 marcandre.lureau@redhat.com, Richard Henderson <richard.henderson@linaro.org>,
 David Gibson <david@gibson.dropbear.id.au>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Darren Kenny <darren.kenny@oracle.com>, Eric Auger <eric.auger@redhat.com>,
 Thomas Huth <huth@tuxfamily.org>, Marcelo Tosatti <mtosatti@redhat.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 6 Apr 2022 at 11:45, Markus Armbruster <armbru@redhat.com> wrote:
>
> First of all: thank you so much for completing the "empty out
> qemu-common.h" job!
>
> This is what's left:
>
>     #ifndef QEMU_COMMON_H
>     #define QEMU_COMMON_H
>
>     /* Copyright string for -version arguments, About dialogs, etc */
>     #define QEMU_COPYRIGHT "Copyright (c) 2003-2022 " \
>         "Fabrice Bellard and the QEMU Project developers"
>
>     /* Bug reporting information for --help arguments, About dialogs, etc */
>     #define QEMU_HELP_BOTTOM \
>         "See <https://qemu.org/contribute/report-a-bug> for how to report bugs.\n" \
>         "More information on the QEMU project at <https://qemu.org>."
>
>     #endif




> Rename the header?  Or replace the macros by variables, and move their
> declarations elsewhere?  Not demands; this series is lovely progress as
> is.

We should put those in a qemu/copyright.h, I think.
Leaving a "qemu-common.h" around is an open invitation to people
throwing more random stuff into it again in future.

As you say, we can totally do this as a later followup.

thanks
-- PMM

