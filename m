Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A4E3C3976C1
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Jun 2021 17:31:54 +0200 (CEST)
Received: from localhost ([::1]:46334 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lo6Mx-0008M8-GV
	for lists+qemu-devel@lfdr.de; Tue, 01 Jun 2021 11:31:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41906)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lo6Da-0006hk-GE
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 11:22:12 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c]:45634)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lo6DY-0007p9-9A
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 11:22:10 -0400
Received: by mail-ed1-x52c.google.com with SMTP id dg27so8098500edb.12
 for <qemu-devel@nongnu.org>; Tue, 01 Jun 2021 08:22:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=C+7DEb22BEvtItehjPr9U48yd44UE8dUIQpK3BIdDZE=;
 b=VtSg82TJpZgYUUWtqM4O050rAKQUAFlpjqPe02SX/9qfcphQoNyfgq9tGXrRwKTWxe
 rRTXpflK4qtmhKZMIGPA++lUVqJ3CWs6VO+dRikMsXEhPV98vmQkdzqz0W6dXmATYBvI
 pMfJLx4DzPyEAhdwkazTKxqP3kc007yu2yse0YEyS6vAbnaIqYEVccSnziFSFFfWjqZK
 4NWO1fhg5o68/S4pHHQ5ZBCAPfCqovlewkCwSC+uQJiq1hblNrYjq8PQ5z9MuZcZLSIh
 LOlsptGxDLXPFRe8+X15vNq2gRmeCuOi7DAbAI+O+42Q5jJXXCBT93L/vF08UNODQhfJ
 jzAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=C+7DEb22BEvtItehjPr9U48yd44UE8dUIQpK3BIdDZE=;
 b=nNyjnsPB6z75sv/eHpDATlXnYW38ewY5d70U+N0edJGmXMMz9CV1UIRnx1VKajFzBk
 07jAccEQRgYzdRxmTLdMQplwZYkcdmMxQa02KWEwyeXWS2rphS6/egV4MaCIs5Q+BHNr
 cCZj5nAsB+BeMastXY6ujvnDNCifY0zHAXNxW8YnCSc8aGN1D4Zq6tEm6xXJmTnU9P5t
 rk3vhyg9xQxm2kblUTSsX9wqMiHkBa26cZJqaA00+kdiIVV/fFmq/Q4LqJ8ElKjNxVdt
 x6q96Q+R93o3et2DrLttc/dHosUkSpA/p3DXC+nlddteGkGjaJ3dUcUO4AHp4AgDmqAn
 x8ww==
X-Gm-Message-State: AOAM53105W+vjpWu07H92aWKEdluY4089A+cXta0vs2XoX3k/bzJOcem
 G34GWwfISIHEHemIa59X+oczxmx1CagS/Uoy6rbCFQ==
X-Google-Smtp-Source: ABdhPJz/0ht9rDRaiR5cONXeEOuTqs1hppC83vqpDo06fI+HtdLqzQRZkAWAAlrj74G/ww8wIQmKDQiZw/dK/6cg1Ig=
X-Received: by 2002:a05:6402:1383:: with SMTP id
 b3mr12411647edv.100.1622560926058; 
 Tue, 01 Jun 2021 08:22:06 -0700 (PDT)
MIME-Version: 1.0
References: <OS3PR01MB61515F08F0709D9E22B8DDDFE9249@OS3PR01MB6151.jpnprd01.prod.outlook.com>
 <TYCPR01MB6160FB4A9712F3F5E14D8BBAE93E9@TYCPR01MB6160.jpnprd01.prod.outlook.com>
In-Reply-To: <TYCPR01MB6160FB4A9712F3F5E14D8BBAE93E9@TYCPR01MB6160.jpnprd01.prod.outlook.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 1 Jun 2021 16:21:35 +0100
Message-ID: <CAFEAcA_fZ_jC640XrFUCSk6YxzoSmdwDaMDAXoX47mBFKdS9hg@mail.gmail.com>
Subject: Re: [RFC] Adding the A64FX's HPC funtions.
To: "ishii.shuuichir@fujitsu.com" <ishii.shuuichir@fujitsu.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

It looks like you didn't get any responses because something went
wrong and your email never went out to the mailing lists.
I only got it because I was cc'd directly. I'll try effectively
resending it like this to see if that works better. You might want
to check whether the mail server at your end actually sent the
email or if you got a bounce mail or something.

thanks
-- PMM

On Tue, 1 Jun 2021 at 05:53, ishii.shuuichir@fujitsu.com
<ishii.shuuichir@fujitsu.com> wrote:
>
> Ping?
> I'd appreciate any comments.
>
> Best regards,
> Shuuichirou Ishii
>
> > -----Original Message-----
> > From: Ishii, Shuuichirou/=E7=9F=B3=E4=BA=95 =E5=91=A8=E4=B8=80=E9=83=8E=
 <ishii.shuuichir@fujitsu.com>
> > Sent: Wednesday, May 26, 2021 4:57 PM
> > To: 'peter.maydell@linaro.org' <peter.maydell@linaro.org>;
> > 'qemu-arm@nongnu.org' <qemu-arm@nongnu.org>;
> > 'qemu-devel@nongnu.org' <qemu-devel@nongnu.org>
> > Cc: Ishii, Shuuichirou/=E7=9F=B3=E4=BA=95 =E5=91=A8=E4=B8=80=E9=83=8E <=
ishii.shuuichir@fujitsu.com>
> > Subject: [RFC] Adding the A64FX's HPC funtions.
> >
> > Hi all!
> >
> > I'm thinking of implementing A64FX HPC extension in qemu.
> > A64FX [1] is a CPU developed by Fujitsu that implements armv8+SVE.
> >
> > [1]
> > https://github.com/fujitsu/A64FX/blob/master/doc/A64FX_Microarchitectur=
e
> > _Manual_en_1.4.pdf
> >
> > A64FX is a CPU developed for HPC (High Performance Computing), and HPC
> > extensions [2] are implemented to improve the performance of user progr=
ams.
> >
> > [2]
> > https://github.com/fujitsu/A64FX/blob/master/doc/A64FX_Specification_HP
> > C_Extension_v1_EN.pdf
> >
> > The details of each function are described in [2], and the HPC extensio=
ns
> > include
> > 1) Tag address override
> > 2) Sector cache
> > 3) Hardware barrier
> > 4) Hardware prefetch assist
> > are implemented.
> >
> > The A64FX has been installed in systems such as the supercomputer Fugak=
u,
> > FX700, and FX1000, but since the A64FX functions have not yet been
> > implemented in QEMU, we would like to be able to develop programs in QE=
MU
> > to use the HPC extensions.
> >
> > Currently, the register specifications for the HPC extensions have been
> > published in [2],  so we would like to implement these registers in QEM=
U and
> > make them accessible.
> > Eventually, we would also like to consider a mechanism that allows HPC
> > extensions  to operate within the scope of the published information.
> >
> > We would like your comments on the following points in this RFC.
> >
> > 1) Is target/arm/helper.c enough to implement the register (ARMCPRegInf=
o
> > structure) of HPC extension function of A64FX?
> >
> > 2) Is it OK to specify the option to set the HPC extension of A64FX as =
follows,
> > for example?
> >
> > -M virt -cpu max,a64fx-hpc-sec=3Don (*sector cache function) -M virt -c=
pu
> > max,a64fx-hpc-hwpf=3Don (*hardware prefetvh assist function) -M virt -c=
pu
> > max,a64fx-hpc-hwb=3Don (*hardware barrier function)
> >
> > It is also possible to implement something like -cpu a64fx, but since w=
e don't
> > know if we can implement it immediately, we assume that we will use the=
 -cpu
> > max option first.
> >
> > Since there is no example of A64FX function implemented in QEMU, we wou=
ld
> > appreciate your comments before we post a patch.
> >
> > Best regards.

