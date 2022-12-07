Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F40B64623B
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Dec 2022 21:16:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p30pC-0003Ep-MI; Wed, 07 Dec 2022 15:15:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p30p7-0003Co-4W
 for qemu-devel@nongnu.org; Wed, 07 Dec 2022 15:15:22 -0500
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p30p5-0001z6-Ga
 for qemu-devel@nongnu.org; Wed, 07 Dec 2022 15:15:20 -0500
Received: by mail-pj1-x1032.google.com with SMTP id b11so18748286pjp.2
 for <qemu-devel@nongnu.org>; Wed, 07 Dec 2022 12:15:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hoHH+vOG5oIm4M3auldq7CHZbXwueFdGzEoS/3eN2oc=;
 b=bR8Dwivzv65TmhI+ZKJtO93dmBPuuJc/+FrywXskFINavroAoSjz8q1GuMZealpqHW
 wzZLCasI3RPllWobzRc+3sBiHJOB38j9Su7wUSYlcdS1HGxVPK8hMSbm6gho2FKgAsYW
 j/F31vii3HV+mdTJCE6J1PQ6k40MgRG93yJYThC6rFSCHwx2PH9VuqmQLDYJy1uVjSM3
 YDWzGhEZTjdfjHi9IE3t/Cnf2XoBpWRNx+FBbBrD081d+5sDcQqomge2j41//3+qpIDv
 oOBYXgnxpoppnMkBvWmwTxtjTkA9IHGGX8K0MDKIE30E9zuPsQiaYId35UyDf4MyzTBB
 2a+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hoHH+vOG5oIm4M3auldq7CHZbXwueFdGzEoS/3eN2oc=;
 b=ueefJFapDoqdat1yA1e82XCkiaM0KKJgvv2VayKyRAQpR3DgIUjPRLbxlpfHZ/HBKy
 HupFLuGDRnvr5Dp7Cp7w+31o6Y6ygFnW0Qae692pEhxUvtULBjhRomg6UMjfcZJHO9la
 gtKbE13RxqthCH5MBIRrUpXplGV4tgipss6MGh2+erBUOcqGEfqTbY8Lh+BToy0r568i
 +LJkmJbbM6O17UbESGigFdxjDj9R/eQ2G4o4+svxsgj6XWLRehc7DAu4PYJELvRRxJn/
 HX206qlXplICTKHG+vN2fyEGPmNwKZ9iQPP0mxdt/le7YC7esWLUE9ep0/NwoRHbtw5n
 pQxg==
X-Gm-Message-State: ANoB5pnKRT6ePaDLhKX33eiLjHJuggMA6mnzHFl42JWo30VTWXCSgQeo
 E94Qi2mjZOfz4OGQ1jLoWSWeimPD9UEcbGUDS9NMqQ==
X-Google-Smtp-Source: AA0mqf7wRq+9sA7s3v15fX7kBg0U47lyaNsqbAigT/jGz6XWwvi3hL8Sxs3j55Ilp8upppl1fVfj3XDjKpblaBHlIuI=
X-Received: by 2002:a17:902:f292:b0:189:91b8:bf92 with SMTP id
 k18-20020a170902f29200b0018991b8bf92mr45403130plc.19.1670444117700; Wed, 07
 Dec 2022 12:15:17 -0800 (PST)
MIME-Version: 1.0
References: <20221207174129.77593-1-philmd@linaro.org>
 <20221207174129.77593-3-philmd@linaro.org>
 <CAFEAcA_DwMB7CZERo3EG2wRAQp6ugiikxhqtMxOaWS+dd8tn3g@mail.gmail.com>
 <6acb79ca-d12a-7f94-2112-5f0f9480f473@linaro.org>
In-Reply-To: <6acb79ca-d12a-7f94-2112-5f0f9480f473@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 7 Dec 2022 20:15:06 +0000
Message-ID: <CAFEAcA_4uJDc_q6ov=8n+BjtNm=j1980sNGb1D8+o1Lid-x3Yw@mail.gmail.com>
Subject: Re: [PATCH-for-8.0 2/4] gdbstub: Use vaddr type for generic
 insert/remove_breakpoint() API
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Eduardo Habkost <eduardo@habkost.net>, 
 Stafford Horne <shorne@gmail.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Yoshinori Sato <ysato@users.sourceforge.jp>, Marek Vasut <marex@denx.de>, 
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Yanan Wang <wangyanan55@huawei.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, 
 Fabiano Rosas <farosas@linux.ibm.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, 
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, 
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Max Filippov <jcmvbkbc@gmail.com>, 
 Greg Kurz <groug@kaod.org>, Artyom Tarasenko <atar4qemu@gmail.com>,
 Anton Johansson <anjo@rev.ng>, 
 qemu-ppc@nongnu.org, Chris Wulff <crwulff@gmail.com>, 
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

On Wed, 7 Dec 2022 at 18:27, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org=
> wrote:
>
> On 7/12/22 19:23, Peter Maydell wrote:
> > On Wed, 7 Dec 2022 at 17:42, Philippe Mathieu-Daud=C3=A9 <philmd@linaro=
.org> wrote:
> >>
> >> Both insert/remove_breakpoint() handlers are used in system and
> >> user emulation. We can not use the 'hwaddr' type on user emulation,
> >> we have to use 'vaddr' which is defined as "wide enough to contain
> >> any #target_ulong virtual address".

> >> @@ -48,8 +48,8 @@ struct AccelOpsClass {
> >>
> >>       /* gdbstub hooks */
> >>       bool (*supports_guest_debug)(void);
> >> -    int (*insert_breakpoint)(CPUState *cpu, int type, hwaddr addr, hw=
addr len);
> >> -    int (*remove_breakpoint)(CPUState *cpu, int type, hwaddr addr, hw=
addr len);
> >> +    int (*insert_breakpoint)(CPUState *cpu, int type, vaddr addr, vad=
dr len);
> >> +    int (*remove_breakpoint)(CPUState *cpu, int type, vaddr addr, vad=
dr len);
> >>       void (*remove_all_breakpoints)(CPUState *cpu);
> >>   };
> >
> > If you're changing the prototype of these methods on AccelOpsClass
> > don't you also want to change the implementations, eg tcg_breakpoint_in=
sert()?
> > Interestingly that function calls cpu_breakpoint_insert() which
> > already takes a 'vaddr' rather than a 'hwaddr'.
>
> Yes I neglected to include these changes here:
>
> -- >8 --
> diff --git a/gdbstub/gdbstub.c b/gdbstub/gdbstub.c
> diff --git a/gdbstub/softmmu.c b/gdbstub/softmmu.c
> diff --git a/gdbstub/user.c b/gdbstub/user.c

Those are the callsites to the methods, not the implementations, I think.

-- PMM

