Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 64F676D8E1F
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Apr 2023 05:56:54 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pkGjV-0003Do-An; Wed, 05 Apr 2023 23:56:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pkGjT-0003D5-5i; Wed, 05 Apr 2023 23:56:19 -0400
Received: from mail-ua1-x935.google.com ([2607:f8b0:4864:20::935])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pkGjQ-0008Hy-UK; Wed, 05 Apr 2023 23:56:18 -0400
Received: by mail-ua1-x935.google.com with SMTP id e12so27082145uaa.3;
 Wed, 05 Apr 2023 20:56:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680753375;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fjg+l+jrssJvn9lLwBmIlMKsHhsVz3rB/nEWW4L8Pkc=;
 b=MF3oAKdKCU1qlabvJsTJIb1R4RUiE5y/oWIDzwWA+wyqxqYbTUqYH3XFSMnqwLelZa
 WuKmN5jeuLrqyEB0mdG1emXw8IASthGeS2h1+mx8IzWzyXaHGOUY9pDZN7eFCFScM3eM
 lZAx50+a7GYU7XhGNc9lhaMbjKUMk5GNjfkiYYU9k3UPCHjGT4fh6JIHTfrD+bpDdSPN
 73A5P9NsP1NHWrG9XODV2cuWadvtpIF1BIMkPDzKuVwbBff3KqSJ1fPakOGKbxAT/t/W
 rmO+FXb0IQXTEeDkV1VKqH8sJREzDG0Zg3Lr3o+yJgBgzGP+61g30hHqT6Q2iA1Y7KXZ
 FzfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680753375;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fjg+l+jrssJvn9lLwBmIlMKsHhsVz3rB/nEWW4L8Pkc=;
 b=ONEg2GVKsMJBwoNMyvBZBmfPuGtZrLXAHM8n2GW/ManLV1BTeMaALjS3VhqWa4eQhK
 HfVIIvUmRPVgfFqew1yew4RxmO0dIAO5K9TRRgQ1ceF93AcxpBKzaAkjgIEulMs8GstV
 EDhcTmWo9DaVTrRAAMXKHjYVXZoZW2GP7e7OjOaI2cwpYF/B46iba8yfXJLb8cJofh+/
 oZAp8dIkhHYDkoXyi7fZ2mz7U1EKygMKOEvr4Jw68I+yFPZkFVH2KxZ26kjivv22Y9q9
 Nqtayb+rmVxyhGvs1fAu62VQE22qLbrroKC0D/5Df/VP053IXVdRQtTAXUW7VH4XhUlm
 YdqA==
X-Gm-Message-State: AAQBX9ce59QSuK9BK0cIgdBq9TSxIgmwJzAEeaHM8NwQ8Vx7FxiWEp5R
 GkHt7S3/ZQv4WwZE6Xz5WXOw/CcEaHso1F+cR0c=
X-Google-Smtp-Source: AKy350ZVcfMAgjJHC6SzyOmsbXTi59M3KRZw/juwrpn9M61uU3wrT/yII4GbYjaQUAXsFltbTKpeF8Ygm47mKl84mOw=
X-Received: by 2002:a1f:2147:0:b0:40c:4d1:b550 with SMTP id
 h68-20020a1f2147000000b0040c04d1b550mr6463886vkh.0.1680753374900; Wed, 05 Apr
 2023 20:56:14 -0700 (PDT)
MIME-Version: 1.0
References: <20230330135818.68417-1-liweiwei@iscas.ac.cn>
 <20230330135818.68417-2-liweiwei@iscas.ac.cn>
 <CAKmqyKMzPwFpScWg2H+JMZpvH6oJAP0A5vgaKAEiXR57db0r4w@mail.gmail.com>
 <2b52f993-158e-a7ee-9180-b84f85f432c6@iscas.ac.cn>
 <CAKmqyKOOHs-Wq2s6fNJLyEUAQ1B3=PoyU5EFZ7e_=BDL-vLwAg@mail.gmail.com>
 <0b8f3928-1901-b338-43a6-b436fb9013ed@iscas.ac.cn>
 <CAKmqyKM=R2c+ayUQnyMTJA8SweGAnLc=5ZxrcZpKn3JtUqgHYg@mail.gmail.com>
 <49a0e0dd-c304-46de-4734-0a1eb134ee9d@iscas.ac.cn>
In-Reply-To: <49a0e0dd-c304-46de-4734-0a1eb134ee9d@iscas.ac.cn>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 6 Apr 2023 13:55:48 +1000
Message-ID: <CAKmqyKMfK-zwJoRXYqN-NJTYnR46oBCRUXR0F40cP7YMWOJfBA@mail.gmail.com>
Subject: Re: [PATCH 1/2] target/riscv: Fix the mstatus.MPP value after
 executing MRET
To: liweiwei <liweiwei@iscas.ac.cn>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org, palmer@dabbelt.com, 
 alistair.francis@wdc.com, bin.meng@windriver.com, dbarboza@ventanamicro.com, 
 zhiwei_liu@linux.alibaba.com, wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::935;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x935.google.com
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

On Thu, Apr 6, 2023 at 1:02=E2=80=AFPM liweiwei <liweiwei@iscas.ac.cn> wrot=
e:
>
>
> On 2023/4/6 10:24, Alistair Francis wrote:
> > On Thu, Apr 6, 2023 at 12:14=E2=80=AFPM liweiwei <liweiwei@iscas.ac.cn>=
 wrote:
> >>
> >> On 2023/4/6 09:46, Alistair Francis wrote:
> >>> On Thu, Apr 6, 2023 at 10:56=E2=80=AFAM liweiwei <liweiwei@iscas.ac.c=
n> wrote:
> >>>> On 2023/4/6 08:43, Alistair Francis wrote:
> >>>>
> >>>> On Thu, Mar 30, 2023 at 11:59=E2=80=AFPM Weiwei Li <liweiwei@iscas.a=
c.cn> wrote:
> >>>>
> >>>> The MPP will be set to the least-privileged supported mode (U if
> >>>> U-mode is implemented, else M).
> >>>>
> >>>> I don't think this is right, the spec in section 8.6.4 says this:
> >>>>
> >>>> Sorry, I didn't find this section in latest release of both privileg=
e and un-privilege spec
> >>> I updated my spec, using commit
> >>> f6b8d5c7d2dcd935b48689a337c8f5bc2be4b5e5 it's now section 9.6.4 Trap
> >>> Return
> >> Yeah. I see it. However, this is a little different from the descripti=
on
> >> in section 3.1.6.1.
> > They seem to be in conflict. It's probably worth opening an issue
> > against the spec to get some clarification here.
>
> I have sent an issue for
> it(https://github.com/riscv/riscv-isa-manual/issues/1006).
>
> However, I just find it may be not a conflict. Section 9.6.4 is the spec
> for hypervisor. And when hypervisor is supported,
>
> S-mode, then U-mode should be supported too.

Ah, I didn't think to check the actual section!

Good call. I think you are right then. In which case this patch is the
correct way to go :)

Feel free to close the issue if you want to.

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

>
> Regards,
>
> Weiwei Li
>
> >
> >> And MPP is WARL field.  PRV_U will be an illegal value for MPP if U-mo=
de
> >> is not implemented.
> > Yeah, I think you are right. It just directly goes against the mret
> > section. I suspect the mret section is wrong and needs to be updated
> >
> >> So I think description in section 3.1.6.1 seems more reasonable.
> >>
> >>>> (draft-20230131-c0b298a: Clarify WFI trapping behavior (#972)).
> >>> Also, you replied with a HTML email which loses the conversation
> >>> history (just see above). Can you fixup your client to reply with
> >>> plain text please
> >> Sorry. I don't get your problem. I replied by Thunderbird. Above is th=
e
> > Have a look at your previous email, it's a HTML email. If I view the
> > source of the email I see this:
> >
> >      Content-Type: text/html; charset=3DUTF-8
> >
> > and the formatting is a little off.
> >
> > This email that I'm replying to is a plain text email. I'm not sure
> > what happened, but try to check that your responses are plain text. I
> > think there is a setting in Thunderbird to just open and reply to all
> > emails as plain text, which is probably worth turning on
> >
> > Alistair
> >
> >> title for the latest release version of the spec in riscv-isa-manual
> >> github
> >> (https://github.com/riscv/riscv-isa-manual/releases/tag/draft-20230131=
-c0b298a).
> >>
> >> Regards,
> >>
> >> Weiwei Li
> >>
> >>> Alistair
> >>>
> >>>> "MRET then in mstatus/mstatush sets MPV=3D0, MPP=3D0,
> >>>> MIE=3DMPIE, and MPIE=3D1"
> >>>>
> >>>> In section 3.1.6.1, the privilege spec says this:
> >>>>
> >>>> "An MRET or SRET instruction is used to return from a trap in M-mode=
 or S-mode respectively.
> >>>> When executing an xRET instruction, supposing xPP holds the value y,=
 xIE is set to xPIE; the
> >>>> privilege mode is changed to y; xPIE is set to 1; and xPP is set to =
the least-privileged supported
> >>>> mode (U if U-mode is implemented, else M). If y=CC=B8=3DM, xRET also=
 sets MPRV=3D0"
> >>>>
> >>>> And I think PRV_U is an illegal value for MPP if U-mode is not imple=
mented.
> >>>>
> >>>> Regards,
> >>>>
> >>>> Weiwei Li
> >>>>
> >>>> So it should just always be 0 (PRV_U is 0)
> >>>>
> >>>> Alistair
> >>>>
> >>>> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
> >>>> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
> >>>> ---
> >>>>    target/riscv/op_helper.c | 3 ++-
> >>>>    1 file changed, 2 insertions(+), 1 deletion(-)
> >>>>
> >>>> diff --git a/target/riscv/op_helper.c b/target/riscv/op_helper.c
> >>>> index 84ee018f7d..991f06d98d 100644
> >>>> --- a/target/riscv/op_helper.c
> >>>> +++ b/target/riscv/op_helper.c
> >>>> @@ -339,7 +339,8 @@ target_ulong helper_mret(CPURISCVState *env)
> >>>>        mstatus =3D set_field(mstatus, MSTATUS_MIE,
> >>>>                            get_field(mstatus, MSTATUS_MPIE));
> >>>>        mstatus =3D set_field(mstatus, MSTATUS_MPIE, 1);
> >>>> -    mstatus =3D set_field(mstatus, MSTATUS_MPP, PRV_U);
> >>>> +    mstatus =3D set_field(mstatus, MSTATUS_MPP,
> >>>> +                        riscv_has_ext(env, RVU) ? PRV_U : PRV_M);
> >>>>        mstatus =3D set_field(mstatus, MSTATUS_MPV, 0);
> >>>>        if ((env->priv_ver >=3D PRIV_VERSION_1_12_0) && (prev_priv !=
=3D PRV_M)) {
> >>>>            mstatus =3D set_field(mstatus, MSTATUS_MPRV, 0);
> >>>> --
> >>>> 2.25.1
> >>>>
> >>>>
>

