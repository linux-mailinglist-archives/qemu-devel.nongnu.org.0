Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E6B5234BC
	for <lists+qemu-devel@lfdr.de>; Mon, 20 May 2019 14:43:28 +0200 (CEST)
Received: from localhost ([127.0.0.1]:35006 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hShdX-0001Fj-G1
	for lists+qemu-devel@lfdr.de; Mon, 20 May 2019 08:43:27 -0400
Received: from eggs.gnu.org ([209.51.188.92]:42008)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1hShcM-0000lM-OW
	for qemu-devel@nongnu.org; Mon, 20 May 2019 08:42:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1hShcK-0002Nf-Qv
	for qemu-devel@nongnu.org; Mon, 20 May 2019 08:42:14 -0400
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:42750)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
	id 1hShcI-0002LE-QQ
	for qemu-devel@nongnu.org; Mon, 20 May 2019 08:42:11 -0400
Received: by mail-wr1-x441.google.com with SMTP id l2so14427259wrb.9
	for <qemu-devel@nongnu.org>; Mon, 20 May 2019 05:42:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=references:user-agent:from:to:cc:subject:in-reply-to:date
	:message-id:mime-version:content-transfer-encoding;
	bh=W+PT5MeYqtVI3WJyT4I0fP97lFXZggzmVWDveqJN7UU=;
	b=l2oNlls/F2xewe6PJSy6JsrRNs4Cd4KvFuoSGx/oBbJJlS6LtjyYqevsCSpL25Kzyb
	/xdT4zYWkB4LWfzF7YPbVRxIaUitBwOd0lltdGoXXgplUY37QdMJ4eXYXxlq7VRl1L1O
	MpYT6jQdyBcF8uB282qcDH26qM5NV9i6X+HkJr8Z5bX5oop3hV4vamo1Xke+XIHFEn6b
	F+3ikEyebAJWSOi9sSFJi64PFfSgEmaxM9AnO+/lNCPbl8MnSuzhbMOBsX1BeY9m2aIT
	lhzaAx+0UrV32McJw+gL0iYu3aLaGwlD1A/lb1zlO/abCVjD0c9r/aFHxWFywCgvwI9X
	U+Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:references:user-agent:from:to:cc:subject
	:in-reply-to:date:message-id:mime-version:content-transfer-encoding;
	bh=W+PT5MeYqtVI3WJyT4I0fP97lFXZggzmVWDveqJN7UU=;
	b=gdG/bkGpVI3wqXaOKC4dtfEAG7LH7MWkPPPS58ysqAOumWHjLWB0j/8MbbhkTBDEQh
	QhE/be126LW70El8MY2GvmWuIFTPtnHYGa3/yc0t/6l04YOoqJ4HF0N/Cyjy9m58e4i7
	RuzksJS3165vSnlq5meRrxxjX0/REbOONLFxopznfi9dRwBm+d8hUAYrcddir3zC9Udq
	xXNTjSM2vPHVW3EM2tU6yGvxJzhZSsErOlW0wCqvfTJ9Ich9SKgYvyfst43ADeCF3QqG
	5n6lliZecAloOO3gBRErAn/QEd3HRlbjb83k6CIzwY4vJS+WOCHe11mCSKTTkNaAOA1Z
	3piw==
X-Gm-Message-State: APjAAAUwO6FmUZGSTgJaTF+sCwlDqqM2jmMi0gJAqGHhHzIDJ/zhZP/q
	YJMiPadB0c9u5NDkWDRC4mqguA==
X-Google-Smtp-Source: APXvYqyTweFfz/H7gIlkCvNpoHy+N61GSinksle+UvEgykzRyDI9nBQMFy3RJBS3XNHcd9F3JPPQGw==
X-Received: by 2002:adf:dcc8:: with SMTP id x8mr26706202wrm.3.1558356124080;
	Mon, 20 May 2019 05:42:04 -0700 (PDT)
Received: from zen.linaroharston ([81.128.185.34])
	by smtp.gmail.com with ESMTPSA id
	197sm7621482wma.36.2019.05.20.05.42.03
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 20 May 2019 05:42:03 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 27C3D1FF87;
	Mon, 20 May 2019 13:42:03 +0100 (BST)
References: <20190502081554.5521-1-arilou@gmail.com>
	<20190502081554.5521-27-arilou@gmail.com>
	<878sv7mwvs.fsf@zen.linaroharston>
	<CAP7QCojewXLDddbxLQ8qEM4WYGsN--7Axq8Sh5ShFecoecNO0Q@mail.gmail.com>
User-agent: mu4e 1.3.2; emacs 26.1
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Jon Doron <arilou@gmail.com>
In-reply-to: <CAP7QCojewXLDddbxLQ8qEM4WYGsN--7Axq8Sh5ShFecoecNO0Q@mail.gmail.com>
Date: Mon, 20 May 2019 13:42:03 +0100
Message-ID: <87sgt9guw4.fsf@zen.linaroharston>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::441
Subject: Re: [Qemu-devel] [PATCH v9 26/27] gdbstub: Add support to read a
 MSR for KVM target
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: QEMU <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Jon Doron <arilou@gmail.com> writes:

> Ah cool did not know about that I will look into it and perhaps can do
> a different patchset just for this no need to add it on top of this
> patchset

Yes just drop these arch specific patches for your next iteration while
you rework them for the target/ approach. Hopefully we'll have the
re-factor merged before you've finished.

>
> On Wed, May 15, 2019 at 8:48 PM Alex Benn=C3=A9e <alex.bennee@linaro.org>=
 wrote:
>>
>>
>> Jon Doron <arilou@gmail.com> writes:
>>
>> > gdb> maint packet qqemu.kvm.Rdmsr:MsrIndex
>>
>> gdbserver already has a mechanism for exposing system registers see:
>>
>>   commit 200bf5b7ffea635079cc05fdfb363372b9544ce7
>>   Author: Abdallah Bouassida <abdallah.bouassida@lauterbach.com>
>>   Date:   Fri May 18 17:48:07 2018 +0100
>>
>> for an example. As MSR's are very specific to x86 all this should be
>> handled via target/i386/gdbstub and kept out of the generic code.
>>
>> >
>> > Signed-off-by: Jon Doron <arilou@gmail.com>
>> > ---
>> >  gdbstub.c | 38 +++++++++++++++++++++++++++++++++++++-
>> >  1 file changed, 37 insertions(+), 1 deletion(-)
>> >
>> > diff --git a/gdbstub.c b/gdbstub.c
>> > index 34da10260d..f48c3a2b5f 100644
>> > --- a/gdbstub.c
>> > +++ b/gdbstub.c
>> > @@ -2141,7 +2141,14 @@ static void handle_query_attached(GdbCmdContext=
 *gdb_ctx, void *user_ctx)
>> >
>> >  static void handle_query_qemu_supported(GdbCmdContext *gdb_ctx, void =
*user_ctx)
>> >  {
>> > -    put_packet(gdb_ctx->s, "sstepbits;sstep;PhyMemMode");
>> > +    snprintf(gdb_ctx->str_buf, sizeof(gdb_ctx->str_buf),
>> > +             "sstepbits;sstep;PhyMemMode");
>> > +
>> > +    if (kvm_enabled()) {
>> > +        pstrcat(gdb_ctx->str_buf, sizeof(gdb_ctx->str_buf), ";kvm.Rdm=
sr");
>> > +    }
>> > +
>> > +    put_packet(gdb_ctx->s, gdb_ctx->str_buf);
>> >  }
>> >
>> >  static void handle_query_qemu_phy_mem_mode(GdbCmdContext *gdb_ctx,
>> > @@ -2166,6 +2173,29 @@ static void handle_set_qemu_phy_mem_mode(GdbCmd=
Context *gdb_ctx, void *user_ctx)
>> >      put_packet(gdb_ctx->s, "OK");
>> >  }
>> >
>> > +static void handle_query_kvm_read_msr(GdbCmdContext *gdb_ctx, void *u=
ser_ctx)
>> > +{
>> > +    uint64_t msr_val;
>> > +
>> > +    if (!kvm_enabled()) {
>> > +        return;
>> > +    }
>> > +
>> > +    if (!gdb_ctx->num_params) {
>> > +        put_packet(gdb_ctx->s, "E22");
>> > +        return;
>> > +    }
>> > +
>> > +    if (kvm_arch_read_msr(gdbserver_state->c_cpu, gdb_ctx->params[0].=
val_ul,
>> > +                          &msr_val)) {
>> > +        put_packet(gdb_ctx->s, "E00");
>> > +        return;
>> > +    }
>> > +
>> > +    snprintf(gdb_ctx->str_buf, sizeof(gdb_ctx->str_buf), "0x%" PRIx64=
, msr_val);
>> > +    put_packet(gdb_ctx->s, gdb_ctx->str_buf);
>> > +}
>> > +
>> >  static GdbCmdParseEntry gdb_gen_query_set_common_table[] =3D {
>> >      /* Order is important if has same prefix */
>> >      {
>> > @@ -2250,6 +2280,12 @@ static GdbCmdParseEntry gdb_gen_query_table[] =
=3D {
>> >          .handler =3D handle_query_qemu_phy_mem_mode,
>> >          .cmd =3D "qemu.PhyMemMode",
>> >      },
>> > +    {
>> > +        .handler =3D handle_query_kvm_read_msr,
>> > +        .cmd =3D "qemu.kvm.Rdmsr:",
>> > +        .cmd_startswith =3D 1,
>> > +        .schema =3D "l0"
>> > +    },
>> >  };
>> >
>> >  static GdbCmdParseEntry gdb_gen_set_table[] =3D {
>>
>>
>> --
>> Alex Benn=C3=A9e


--
Alex Benn=C3=A9e

