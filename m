Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 336763B4C2F
	for <lists+qemu-devel@lfdr.de>; Sat, 26 Jun 2021 05:32:24 +0200 (CEST)
Received: from localhost ([::1]:55392 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwz3O-0004VG-R3
	for lists+qemu-devel@lfdr.de; Fri, 25 Jun 2021 23:32:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39160)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lwz2I-0003hX-Ne; Fri, 25 Jun 2021 23:31:14 -0400
Received: from mail-yb1-xb2c.google.com ([2607:f8b0:4864:20::b2c]:33757)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lwz2G-000817-2y; Fri, 25 Jun 2021 23:31:14 -0400
Received: by mail-yb1-xb2c.google.com with SMTP id b64so7840731yba.0;
 Fri, 25 Jun 2021 20:31:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=ZwRSHfUJr4Nr10dAbYjigJKnZuy8v7iE2sb+mMxAZCc=;
 b=E2yCBTpvu14SMJV7dSSuPw+YfSoh1cz5bDjTgBZ6RYfvw7wQko9voG/YWttRpjTCUO
 it5YxXTap0u1WnorBMzOnInHFs7Q6/EOnd9YpKWpsfLY/F1F6fj+sg7c1Pr08+LZCZ0s
 rNQo9Wj1V7aSe3POkt4XNSYrYhSjnbEbhAvWc1+iDOH/AUZdbEBiUvUKrJOfZVugvS9J
 bLd1ZujKAwkeDjFON947LOUUpCt+VAm7QnrgyqN9jMiZSCm6uwav3NhDxLp3WyDswaTf
 waGK8+rn1KaRvAksD17ZnglMHOMwQzewHD7Dd6y/OiBy04fDfoXDlFLUndsNoL+ZACn0
 idNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ZwRSHfUJr4Nr10dAbYjigJKnZuy8v7iE2sb+mMxAZCc=;
 b=RDq9wWPMbp9gDKaIF0u85ueKd9eTnsP4VdLu+nnkWFXS7HIApTortqLBnvKpZR5LVm
 /EFHW4EbDZn6f6+UbPXYImRC3HLSZdGMgzW96c/nkWP5qVKBY7We/VbJAcNUBSMywxQY
 EhksjiA7RaRIZajVebyKr/7tKAcxf3Xp344pLYA8PDg0+833o9vfTL5UqsbWmOmE3cP2
 RUTIZE4v7z9QZC6uYNWCmfPDQl3R3vhSFGx43fq5500MD45qUnxQM50CW8xtwJtU98g/
 sykrXcUL6vrCI8emW88yZBR3oDCTqJKV/mmt47ZhQdpPcU2IOHb6jGfBeKHPZrOXc3i0
 3XUA==
X-Gm-Message-State: AOAM531TcyJLDXOUL/NmWHJdZcsfU2VCvlVCqzM/8R0OnrFst1fKT5FW
 wM2G5SK4MD3FWd1+f5/bQlmw2j6tOCiHroxpEVM=
X-Google-Smtp-Source: ABdhPJzlf9gaowyNIHDmI95K1nyX+8soJAZ1oynrRqkVn6zNsKD4UnrwubnpZJ5dlkIpyPUlxGxCWm56NOItlJU0MFU=
X-Received: by 2002:a25:4297:: with SMTP id
 p145mr14825959yba.387.1624678270696; 
 Fri, 25 Jun 2021 20:31:10 -0700 (PDT)
MIME-Version: 1.0
References: <20210624142209.1193073-1-f4bug@amsat.org>
 <20210624142209.1193073-7-f4bug@amsat.org>
 <CAEUhbmW+k+voLnqx8-3Y53-y=OYNPbVeQ8h-6kZ+Y=gfcdjyfA@mail.gmail.com>
 <e0d9a0c0-b8b9-9aae-a556-e7bf25494ef6@amsat.org>
In-Reply-To: <e0d9a0c0-b8b9-9aae-a556-e7bf25494ef6@amsat.org>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Sat, 26 Jun 2021 11:31:00 +0800
Message-ID: <CAEUhbmVVwf8SPLQvu83KYQEy6herCGun6ASd=WaPPaRzO_U4ng@mail.gmail.com>
Subject: Re: [RFC PATCH 06/10] hw/sd: Add sd_cmd_unimplemented() handler
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2c;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb2c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Qemu-block <qemu-block@nongnu.org>, Andrew Jeffery <andrew@aj.id.au>,
 Bin Meng <bin.meng@windriver.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, Jun 26, 2021 at 1:17 AM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g> wrote:
>
> On 6/25/21 3:49 PM, Bin Meng wrote:
> > On Thu, Jun 24, 2021 at 10:28 PM Philippe Mathieu-Daud=C3=A9 <f4bug@ams=
at.org> wrote:
> >>
> >> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> >> ---
> >>  hw/sd/sd.c | 21 ++++++++++++---------
> >>  1 file changed, 12 insertions(+), 9 deletions(-)
>
> >>      qemu_log_mask(LOG_GUEST_ERROR, "SD: ACMD%i in a wrong state\n", r=
eq.cmd);
> >> @@ -2096,6 +2096,9 @@ static const SDProto sd_proto_spi =3D {
> >>          [26]        =3D sd_cmd_illegal,
> >>          [52 ... 54] =3D sd_cmd_illegal,
> >>      },
> >> +    .cmd =3D {
> >> +        [6]         =3D sd_cmd_unimplemented,
> >> +    },
> >>  };
> >
> > Does this compile?
>
> Yes.
>
> > Or is this another GCC extension to C?
>
> I haven't checked when this was introduced, but QEMU uses it since
> quite some time now.
>
> Apparently this is:
> https://gcc.gnu.org/onlinedocs/gcc/Designated-Inits.html

Yep, I know designated initialization of a C array, but I don't know
gcc does not complain two .cmd here

>
>  "In ISO C99 you can give the elements in any order, specifying
>   the array indices or structure field names they apply to, and
>   GNU C allows this as an extension in C90 mode as well."
>
> > But I think you wanted to say .acmd =3D ?
>
> Oops!
>
> Thanks for the review,

Regards,
Bin

