Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A71AB2FBC43
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 17:22:10 +0100 (CET)
Received: from localhost ([::1]:41566 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1tlh-0004q1-Ol
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 11:22:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43052)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.machado@linaro.org>)
 id 1l1tja-0003Sh-9u
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 11:19:59 -0500
Received: from mail-qk1-x72a.google.com ([2607:f8b0:4864:20::72a]:41263)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luis.machado@linaro.org>)
 id 1l1tjW-0004hx-MD
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 11:19:58 -0500
Received: by mail-qk1-x72a.google.com with SMTP id 19so22355993qkm.8
 for <qemu-devel@nongnu.org>; Tue, 19 Jan 2021 08:19:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NW0N4uLv1eQiKdM0oK4rx7h2Nsg5RamUU5ILDthX5Zo=;
 b=MMrBTVV5BcaoUnLTrzS7XjIFpATKXURlZn5y3HaNf8HpvRrJazFw+reSl9+M84HCYU
 WXkGxV2/pNQLzZIWAq0XnST9tJB9Ii91H9/yVyGLnvrmFewmyASfvbFFbXa0WlVR7mHf
 KNLj9Z6vx0GmCBz2aTQz340h+e61sl66qUlLtbfZbdykBM3YDpES3cvKtei0vOw0RlkL
 5ms4LsPtuF3OP7XdwajAa4Bq2o+sWbpKC2YnxCzVt4J2pmxnSzvPmvenaEcrZr2bYmEV
 mNMy2EZ8lApspYh4zYgKa7TJcYE3iQtHjm4eS970ZeSyzNM8EHodejwx2FGDHeyPGdy7
 pkUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NW0N4uLv1eQiKdM0oK4rx7h2Nsg5RamUU5ILDthX5Zo=;
 b=kHsdJ2jicOts+TCB0CY23gbeHYCXI1ibBDJyzZR+g0oVm39QBihDu9eeV0TZyiLzgT
 uSeekwHDkdpAY6WcDiaa6tPm2V+/Hljy1sikDd7bQ3SUizyBxvE6oD5uToit00loIozV
 IiWfsgohxRYs0GaFYRCnTixwZUyOpqfhe1i7TZGKWVzWxD5hQeWE1spuk8BQxy51sQF8
 VUfETvEiYMNdtMC1J3L1aPUprKA7IDFZtfHgvpg9G9Y3j4iK9sKjnJH/T8VIV8dtZVHG
 /lY6pFxSP/E20YfSuZ2Vnvx3mxDbQ3LMMtDC8NiqbUVRQCW6BiXgwX6cvb9bPIoTHGmi
 Rerw==
X-Gm-Message-State: AOAM533a7Oi2yJPtDJtExqQPp+HNw7dwVCxMP9fJtQCQxC9hE/mxjSOV
 WWkS0nBgwiTpfbQsrNQptOU39ZIQp5PkhC8jg5iGMA==
X-Google-Smtp-Source: ABdhPJxmvzDclGAyP2WLpwX70utku/6cR35D01gPLW6NDLFCE3YQV0HPwFNMZIn71P/3iQvs3vmyeZIyJc3JwHdXlaE=
X-Received: by 2002:a37:6810:: with SMTP id d16mr4896178qkc.194.1611073192927; 
 Tue, 19 Jan 2021 08:19:52 -0800 (PST)
MIME-Version: 1.0
References: <20210115130828.23968-1-alex.bennee@linaro.org>
 <20210115130828.23968-22-alex.bennee@linaro.org>
 <540354a8-bcba-aa82-814d-7f11dc75f5bf@suse.de>
 <874kjdugip.fsf@linaro.org> <8cb88b76-caa3-ba26-b288-4d87b06f56ec@suse.de>
 <871regvs0w.fsf@linaro.org>
In-Reply-To: <871regvs0w.fsf@linaro.org>
From: Luis Machado <luis.machado@linaro.org>
Date: Tue, 19 Jan 2021 13:19:36 -0300
Message-ID: <CAD2_up-4U+cfKYkNYkH-XKauwM=9C6_6-oEgyf1Y66EMj52ZbQ@mail.gmail.com>
Subject: Re: [PULL 21/30] target/arm: use official org.gnu.gdb.aarch64.sve
 layout for registers
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: multipart/alternative; boundary="0000000000005f3cb005b943359b"
Received-SPF: pass client-ip=2607:f8b0:4864:20::72a;
 envelope-from=luis.machado@linaro.org; helo=mail-qk1-x72a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>,
 Claudio Fontana <cfontana@suse.de>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000005f3cb005b943359b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

This is not ideal. GDB should probably have a way to negotiate available
types.

On Tue, 19 Jan 2021 at 12:57, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:

>
> Claudio Fontana <cfontana@suse.de> writes:
>
> > On 1/19/21 3:50 PM, Alex Benn=C3=A9e wrote:
> >>
> >> Claudio Fontana <cfontana@suse.de> writes:
> >>
> >>> Hi Alex,
> >>>
> >>> after updating to latest master today, I am getting the following
> error with
> >>>
> >>> make check-tcg
> >>>
> >>> qemu-system-aarch64: -gdb
> unix:path=3D/tmp/tmp9ru5tgk8qemu-gdbstub/gdbstub.socket,server: info: QEM=
U
> waiting for connection on:
> disconnected:unix:/tmp/tmp9ru5tgk8qemu-gdbstub/gdbstub.socket,server
> >>> warning: while parsing target description (at line 47): Vector
> "svevhf" references undefined type "ieee_half"
> >>> warning: Could not load XML target description; ignoring
> >>> qemu-system-aarch64: QEMU: Terminated via GDBstub
> >>>
> >>> Seems to indicate it is "ieee_half" -related?
> >>
> >> *sigh*
> >>
> >> yes - it is. I thought this was solved by the GDB version check in
> >> 14/30. What does your gdb report?
> >
> >
> > $ gdb --version
> > GNU gdb (GDB; openSUSE Leap 15.2) 8.3.1
> > Copyright (C) 2019 Free Software Foundation, Inc.
> > License GPLv3+: GNU GPL version 3 or later <
> http://gnu.org/licenses/gpl.html>
> > This is free software: you are free to change and redistribute it.
> > There is NO WARRANTY, to the extent permitted by law.
> >
> > gdb --configuration
> > This GDB was configured as follows:
> >    configure --host=3Dx86_64-suse-linux --target=3Dx86_64-suse-linux
> >              --with-auto-load-dir=3D$debugdir:$datadir/auto-load
> >              --with-auto-load-safe-path=3D$debugdir:$datadir/auto-load
> >              --with-expat
> >              --with-gdb-datadir=3D/usr/share/gdb
> >              --with-jit-reader-dir=3D/usr/lib64/gdb
> >              --without-libunwind-ia64
> >              --with-lzma
> >              --without-babeltrace
> >              --with-intel-pt
> >              --disable-libmcheck
> >              --with-mpfr
> >              --with-python=3D/usr
> >              --without-guile
> >              --disable-source-highlight
> >              --with-separate-debug-dir=3D/usr/lib/debug
> >              --with-system-gdbinit=3D/etc/gdbinit
> >
> >
> > does this help?
>
> So it looks like TDESC_TYPE_IEEE_HALF was only implemented in GDB 9.1
> and there is no probing possible during the gdbstub connection. I guess
> I can either go back to stubbing it out (which would break gdb's SVE
> understanding) or up our minimum GDB version check for running tests.
> That would mean less people test GDB (or at least until the distros
> catch up) but considering it was zero people not too long ago maybe
> that's acceptable?
>
> >
> > Let me know if more info is needed. Thanks!
> >
> > Claudio
> >
> >
> >>
> >>>
> >>> Thanks,
> >>>
> >>> Claudio
> >>>
> >>> On 1/15/21 2:08 PM, Alex Benn=C3=A9e wrote:
> >>>> While GDB can work with any XML description given to it there is
> >>>> special handling for SVE registers on the GDB side which makes the
> >>>> users life a little better. The changes aren't that major and all th=
e
> >>>> registers save the $vg reported the same. All that changes is:
> >>>>
> >>>>   - report org.gnu.gdb.aarch64.sve
> >>>>   - use gdb nomenclature for names and types
> >>>>   - minor re-ordering of the types to match reference
> >>>>   - re-enable ieee_half (as we know gdb supports it now)
> >>>>   - $vg is now a 64 bit int
> >>>>   - check $vN and $zN aliasing in test
> >>>>
> >>>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> >>>> Reviewed-by: Luis Machado <luis.machado@linaro.org>
> >>>> Message-Id: <20210108224256.2321-11-alex.bennee@linaro.org>
> >>>>
> >>>> diff --git a/target/arm/gdbstub.c b/target/arm/gdbstub.c
> >>>> index 866595b4f1..a8fff2a3d0 100644
> >>>> --- a/target/arm/gdbstub.c
> >>>> +++ b/target/arm/gdbstub.c
> >>>> @@ -195,22 +195,17 @@ static const struct TypeSize vec_lanes[] =3D {
> >>>>      { "uint128", 128, 'q', 'u' },
> >>>>      { "int128", 128, 'q', 's' },
> >>>>      /* 64 bit */
> >>>> +    { "ieee_double", 64, 'd', 'f' },
> >>>>      { "uint64", 64, 'd', 'u' },
> >>>>      { "int64", 64, 'd', 's' },
> >>>> -    { "ieee_double", 64, 'd', 'f' },
> >>>>      /* 32 bit */
> >>>> +    { "ieee_single", 32, 's', 'f' },
> >>>>      { "uint32", 32, 's', 'u' },
> >>>>      { "int32", 32, 's', 's' },
> >>>> -    { "ieee_single", 32, 's', 'f' },
> >>>>      /* 16 bit */
> >>>> +    { "ieee_half", 16, 'h', 'f' },
> >>>>      { "uint16", 16, 'h', 'u' },
> >>>>      { "int16", 16, 'h', 's' },
> >>>> -    /*
> >>>> -     * TODO: currently there is no reliable way of telling
> >>>> -     * if the remote gdb actually understands ieee_half so
> >>>> -     * we don't expose it in the target description for now.
> >>>> -     * { "ieee_half", 16, 'h', 'f' },
> >>>> -     */
> >>>>      /* bytes */
> >>>>      { "uint8", 8, 'b', 'u' },
> >>>>      { "int8", 8, 'b', 's' },
> >>>> @@ -223,17 +218,16 @@ int arm_gen_dynamic_svereg_xml(CPUState *cs,
> int base_reg)
> >>>>      GString *s =3D g_string_new(NULL);
> >>>>      DynamicGDBXMLInfo *info =3D &cpu->dyn_svereg_xml;
> >>>>      g_autoptr(GString) ts =3D g_string_new("");
> >>>> -    int i, bits, reg_width =3D (cpu->sve_max_vq * 128);
> >>>> +    int i, j, bits, reg_width =3D (cpu->sve_max_vq * 128);
> >>>>      info->num =3D 0;
> >>>>      g_string_printf(s, "<?xml version=3D\"1.0\"?>");
> >>>>      g_string_append_printf(s, "<!DOCTYPE target SYSTEM
> \"gdb-target.dtd\">");
> >>>> -    g_string_append_printf(s, "<feature
> name=3D\"org.qemu.gdb.aarch64.sve\">");
> >>>> +    g_string_append_printf(s, "<feature
> name=3D\"org.gnu.gdb.aarch64.sve\">");
> >>>>
> >>>>      /* First define types and totals in a whole VL */
> >>>>      for (i =3D 0; i < ARRAY_SIZE(vec_lanes); i++) {
> >>>>          int count =3D reg_width / vec_lanes[i].size;
> >>>> -        g_string_printf(ts, "vq%d%c%c", count,
> >>>> -                        vec_lanes[i].sz, vec_lanes[i].suffix);
> >>>> +        g_string_printf(ts, "svev%c%c", vec_lanes[i].sz,
> vec_lanes[i].suffix);
> >>>>          g_string_append_printf(s,
> >>>>                                 "<vector id=3D\"%s\" type=3D\"%s\"
> count=3D\"%d\"/>",
> >>>>                                 ts->str, vec_lanes[i].gdb_type,
> count);
> >>>> @@ -243,39 +237,37 @@ int arm_gen_dynamic_svereg_xml(CPUState *cs,
> int base_reg)
> >>>>       * signed and potentially float versions of each size from 128 =
to
> >>>>       * 8 bits.
> >>>>       */
> >>>> -    for (bits =3D 128; bits >=3D 8; bits /=3D 2) {
> >>>> -        int count =3D reg_width / bits;
> >>>> -        g_string_append_printf(s, "<union id=3D\"vq%dn\">", count);
> >>>> -        for (i =3D 0; i < ARRAY_SIZE(vec_lanes); i++) {
> >>>> -            if (vec_lanes[i].size =3D=3D bits) {
> >>>> -                g_string_append_printf(s, "<field name=3D\"%c\"
> type=3D\"vq%d%c%c\"/>",
> >>>> -                                       vec_lanes[i].suffix,
> >>>> -                                       count,
> >>>> -                                       vec_lanes[i].sz,
> vec_lanes[i].suffix);
> >>>> +    for (bits =3D 128, i =3D 0; bits >=3D 8; bits /=3D 2, i++) {
> >>>> +        const char suf[] =3D { 'q', 'd', 's', 'h', 'b' };
> >>>> +        g_string_append_printf(s, "<union id=3D\"svevn%c\">", suf[i=
]);
> >>>> +        for (j =3D 0; j < ARRAY_SIZE(vec_lanes); j++) {
> >>>> +            if (vec_lanes[j].size =3D=3D bits) {
> >>>> +                g_string_append_printf(s, "<field name=3D\"%c\"
> type=3D\"svev%c%c\"/>",
> >>>> +                                       vec_lanes[j].suffix,
> >>>> +                                       vec_lanes[j].sz,
> vec_lanes[j].suffix);
> >>>>              }
> >>>>          }
> >>>>          g_string_append(s, "</union>");
> >>>>      }
> >>>>      /* And now the final union of unions */
> >>>> -    g_string_append(s, "<union id=3D\"vq\">");
> >>>> -    for (bits =3D 128; bits >=3D 8; bits /=3D 2) {
> >>>> -        int count =3D reg_width / bits;
> >>>> -        for (i =3D 0; i < ARRAY_SIZE(vec_lanes); i++) {
> >>>> -            if (vec_lanes[i].size =3D=3D bits) {
> >>>> -                g_string_append_printf(s, "<field name=3D\"%c\"
> type=3D\"vq%dn\"/>",
> >>>> -                                       vec_lanes[i].sz, count);
> >>>> -                break;
> >>>> -            }
> >>>> -        }
> >>>> +    g_string_append(s, "<union id=3D\"svev\">");
> >>>> +    for (bits =3D 128, i =3D 0; bits >=3D 8; bits /=3D 2, i++) {
> >>>> +        const char suf[] =3D { 'q', 'd', 's', 'h', 'b' };
> >>>> +        g_string_append_printf(s, "<field name=3D\"%c\"
> type=3D\"svevn%c\"/>",
> >>>> +                               suf[i], suf[i]);
> >>>>      }
> >>>>      g_string_append(s, "</union>");
> >>>>
> >>>> +    /* Finally the sve prefix type */
> >>>> +    g_string_append_printf(s,
> >>>> +                           "<vector id=3D\"svep\" type=3D\"uint8\"
> count=3D\"%d\"/>",
> >>>> +                           reg_width / 8);
> >>>> +
> >>>>      /* Then define each register in parts for each vq */
> >>>>      for (i =3D 0; i < 32; i++) {
> >>>>          g_string_append_printf(s,
> >>>>                                 "<reg name=3D\"z%d\" bitsize=3D\"%d\=
""
> >>>> -                               " regnum=3D\"%d\" group=3D\"vector\"=
"
> >>>> -                               " type=3D\"vq\"/>",
> >>>> +                               " regnum=3D\"%d\" type=3D\"svev\"/>"=
,
> >>>>                                 i, reg_width, base_reg++);
> >>>>          info->num++;
> >>>>      }
> >>>> @@ -287,31 +279,22 @@ int arm_gen_dynamic_svereg_xml(CPUState *cs,
> int base_reg)
> >>>>                             " regnum=3D\"%d\" group=3D\"float\""
> >>>>                             " type=3D\"int\"/>", base_reg++);
> >>>>      info->num +=3D 2;
> >>>> -    /*
> >>>> -     * Predicate registers aren't so big they are worth splitting u=
p
> >>>> -     * but we do need to define a type to hold the array of quad
> >>>> -     * references.
> >>>> -     */
> >>>> -    g_string_append_printf(s,
> >>>> -                           "<vector id=3D\"vqp\" type=3D\"uint16\"
> count=3D\"%d\"/>",
> >>>> -                           cpu->sve_max_vq);
> >>>> +
> >>>>      for (i =3D 0; i < 16; i++) {
> >>>>          g_string_append_printf(s,
> >>>>                                 "<reg name=3D\"p%d\" bitsize=3D\"%d\=
""
> >>>> -                               " regnum=3D\"%d\" group=3D\"vector\"=
"
> >>>> -                               " type=3D\"vqp\"/>",
> >>>> +                               " regnum=3D\"%d\" type=3D\"svep\"/>"=
,
> >>>>                                 i, cpu->sve_max_vq * 16, base_reg++)=
;
> >>>>          info->num++;
> >>>>      }
> >>>>      g_string_append_printf(s,
> >>>>                             "<reg name=3D\"ffr\" bitsize=3D\"%d\""
> >>>>                             " regnum=3D\"%d\" group=3D\"vector\""
> >>>> -                           " type=3D\"vqp\"/>",
> >>>> +                           " type=3D\"svep\"/>",
> >>>>                             cpu->sve_max_vq * 16, base_reg++);
> >>>>      g_string_append_printf(s,
> >>>>                             "<reg name=3D\"vg\" bitsize=3D\"64\""
> >>>> -                           " regnum=3D\"%d\" group=3D\"vector\""
> >>>> -                           " type=3D\"uint32\"/>",
> >>>> +                           " regnum=3D\"%d\" type=3D\"int\"/>",
> >>>>                             base_reg++);
> >>>>      info->num +=3D 2;
> >>>>      g_string_append_printf(s, "</feature>");
> >>>> diff --git a/target/arm/helper.c b/target/arm/helper.c
> >>>> index 5ab3f5ace3..8a492465d6 100644
> >>>> --- a/target/arm/helper.c
> >>>> +++ b/target/arm/helper.c
> >>>> @@ -276,7 +276,7 @@ static int arm_gdb_get_svereg(CPUARMState *env,
> GByteArray *buf, int reg)
> >>>>           * while the ZCR works in Vector Quads (VQ) which is 128bit
> chunks.
> >>>>           */
> >>>>          int vq =3D sve_zcr_len_for_el(env, arm_current_el(env)) + 1=
;
> >>>> -        return gdb_get_reg32(buf, vq * 2);
> >>>> +        return gdb_get_reg64(buf, vq * 2);
> >>>>      }
> >>>>      default:
> >>>>          /* gdbstub asked for something out our range */
> >>>> diff --git a/tests/tcg/aarch64/gdbstub/test-sve-ioctl.py
> b/tests/tcg/aarch64/gdbstub/test-sve-ioctl.py
> >>>> index 972cf73c31..b9ef169c1a 100644
> >>>> --- a/tests/tcg/aarch64/gdbstub/test-sve-ioctl.py
> >>>> +++ b/tests/tcg/aarch64/gdbstub/test-sve-ioctl.py
> >>>> @@ -40,6 +40,17 @@ class TestBreakpoint(gdb.Breakpoint):
> >>>>          except gdb.error:
> >>>>              report(False, "checking zregs (out of range)")
> >>>>
> >>>> +        # Check the aliased V registers are set and GDB has correct=
ly
> >>>> +        # created them for us having recognised and handled SVE.
> >>>> +        try:
> >>>> +            for i in range(0, 16):
> >>>> +                val_z =3D gdb.parse_and_eval("$z0.b.u[%d]" % i)
> >>>> +                val_v =3D gdb.parse_and_eval("$v0.b.u[%d]" % i)
> >>>> +                report(int(val_z) =3D=3D int(val_v),
> >>>> +                       "v0.b.u[%d] =3D=3D z0.b.u[%d]" % (i, i))
> >>>> +        except gdb.error:
> >>>> +            report(False, "checking vregs (out of range)")
> >>>> +
> >>>>
> >>>>  def run_test():
> >>>>      "Run through the tests one by one"
> >>>>
> >>
> >>
>
>
> --
> Alex Benn=C3=A9e
>

--0000000000005f3cb005b943359b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">This is not ideal. GDB should probably have a way to negot=
iate available types.</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Tue, 19 Jan 2021 at 12:57, Alex Benn=C3=A9e &lt;<a =
href=3D"mailto:alex.bennee@linaro.org">alex.bennee@linaro.org</a>&gt; wrote=
:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><br>
Claudio Fontana &lt;<a href=3D"mailto:cfontana@suse.de" target=3D"_blank">c=
fontana@suse.de</a>&gt; writes:<br>
<br>
&gt; On 1/19/21 3:50 PM, Alex Benn=C3=A9e wrote:<br>
&gt;&gt; <br>
&gt;&gt; Claudio Fontana &lt;<a href=3D"mailto:cfontana@suse.de" target=3D"=
_blank">cfontana@suse.de</a>&gt; writes:<br>
&gt;&gt; <br>
&gt;&gt;&gt; Hi Alex,<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; after updating to latest master today, I am getting the follow=
ing error with<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; make check-tcg<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; qemu-system-aarch64: -gdb unix:path=3D/tmp/tmp9ru5tgk8qemu-gdb=
stub/gdbstub.socket,server: info: QEMU waiting for connection on: disconnec=
ted:unix:/tmp/tmp9ru5tgk8qemu-gdbstub/gdbstub.socket,server<br>
&gt;&gt;&gt; warning: while parsing target description (at line 47): Vector=
 &quot;svevhf&quot; references undefined type &quot;ieee_half&quot;<br>
&gt;&gt;&gt; warning: Could not load XML target description; ignoring<br>
&gt;&gt;&gt; qemu-system-aarch64: QEMU: Terminated via GDBstub<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Seems to indicate it is &quot;ieee_half&quot; -related?<br>
&gt;&gt; <br>
&gt;&gt; *sigh*<br>
&gt;&gt; <br>
&gt;&gt; yes - it is. I thought this was solved by the GDB version check in=
<br>
&gt;&gt; 14/30. What does your gdb report?<br>
&gt;<br>
&gt;<br>
&gt; $ gdb --version<br>
&gt; GNU gdb (GDB; openSUSE Leap 15.2) 8.3.1<br>
&gt; Copyright (C) 2019 Free Software Foundation, Inc.<br>
&gt; License GPLv3+: GNU GPL version 3 or later &lt;<a href=3D"http://gnu.o=
rg/licenses/gpl.html" rel=3D"noreferrer" target=3D"_blank">http://gnu.org/l=
icenses/gpl.html</a>&gt;<br>
&gt; This is free software: you are free to change and redistribute it.<br>
&gt; There is NO WARRANTY, to the extent permitted by law.<br>
&gt;<br>
&gt; gdb --configuration<br>
&gt; This GDB was configured as follows:<br>
&gt;=C2=A0 =C2=A0 configure --host=3Dx86_64-suse-linux --target=3Dx86_64-su=
se-linux<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --with-auto-load-dir=
=3D$debugdir:$datadir/auto-load<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --with-auto-load-safe-=
path=3D$debugdir:$datadir/auto-load<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --with-expat<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --with-gdb-datadir=3D/=
usr/share/gdb<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --with-jit-reader-dir=
=3D/usr/lib64/gdb<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --without-libunwind-ia=
64<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --with-lzma<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --without-babeltrace<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --with-intel-pt<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --disable-libmcheck<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --with-mpfr<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --with-python=3D/usr<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --without-guile<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --disable-source-highl=
ight<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --with-separate-debug-=
dir=3D/usr/lib/debug<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --with-system-gdbinit=
=3D/etc/gdbinit<br>
&gt;<br>
&gt;<br>
&gt; does this help?<br>
<br>
So it looks like TDESC_TYPE_IEEE_HALF was only implemented in GDB 9.1<br>
and there is no probing possible during the gdbstub connection. I guess<br>
I can either go back to stubbing it out (which would break gdb&#39;s SVE<br=
>
understanding) or up our minimum GDB version check for running tests.<br>
That would mean less people test GDB (or at least until the distros<br>
catch up) but considering it was zero people not too long ago maybe<br>
that&#39;s acceptable?<br>
<br>
&gt;<br>
&gt; Let me know if more info is needed. Thanks!<br>
&gt;<br>
&gt; Claudio<br>
&gt;<br>
&gt;<br>
&gt;&gt; <br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Thanks,<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Claudio<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; On 1/15/21 2:08 PM, Alex Benn=C3=A9e wrote:<br>
&gt;&gt;&gt;&gt; While GDB can work with any XML description given to it th=
ere is<br>
&gt;&gt;&gt;&gt; special handling for SVE registers on the GDB side which m=
akes the<br>
&gt;&gt;&gt;&gt; users life a little better. The changes aren&#39;t that ma=
jor and all the<br>
&gt;&gt;&gt;&gt; registers save the $vg reported the same. All that changes=
 is:<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0- report org.gnu.gdb.aarch64.sve<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0- use gdb nomenclature for names and types<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0- minor re-ordering of the types to match refe=
rence<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0- re-enable ieee_half (as we know gdb supports=
 it now)<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0- $vg is now a 64 bit int<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0- check $vN and $zN aliasing in test<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; Signed-off-by: Alex Benn=C3=A9e &lt;<a href=3D"mailto:alex=
.bennee@linaro.org" target=3D"_blank">alex.bennee@linaro.org</a>&gt;<br>
&gt;&gt;&gt;&gt; Reviewed-by: Luis Machado &lt;<a href=3D"mailto:luis.macha=
do@linaro.org" target=3D"_blank">luis.machado@linaro.org</a>&gt;<br>
&gt;&gt;&gt;&gt; Message-Id: &lt;<a href=3D"mailto:20210108224256.2321-11-a=
lex.bennee@linaro.org" target=3D"_blank">20210108224256.2321-11-alex.bennee=
@linaro.org</a>&gt;<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; diff --git a/target/arm/gdbstub.c b/target/arm/gdbstub.c<b=
r>
&gt;&gt;&gt;&gt; index 866595b4f1..a8fff2a3d0 100644<br>
&gt;&gt;&gt;&gt; --- a/target/arm/gdbstub.c<br>
&gt;&gt;&gt;&gt; +++ b/target/arm/gdbstub.c<br>
&gt;&gt;&gt;&gt; @@ -195,22 +195,17 @@ static const struct TypeSize vec_lan=
es[] =3D {<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 { &quot;uint128&quot;, 128, &#39;q&#39=
;, &#39;u&#39; },<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 { &quot;int128&quot;, 128, &#39;q&#39;=
, &#39;s&#39; },<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 /* 64 bit */<br>
&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 { &quot;ieee_double&quot;, 64, &#39;d&#39;,=
 &#39;f&#39; },<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 { &quot;uint64&quot;, 64, &#39;d&#39;,=
 &#39;u&#39; },<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 { &quot;int64&quot;, 64, &#39;d&#39;, =
&#39;s&#39; },<br>
&gt;&gt;&gt;&gt; -=C2=A0 =C2=A0 { &quot;ieee_double&quot;, 64, &#39;d&#39;,=
 &#39;f&#39; },<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 /* 32 bit */<br>
&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 { &quot;ieee_single&quot;, 32, &#39;s&#39;,=
 &#39;f&#39; },<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 { &quot;uint32&quot;, 32, &#39;s&#39;,=
 &#39;u&#39; },<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 { &quot;int32&quot;, 32, &#39;s&#39;, =
&#39;s&#39; },<br>
&gt;&gt;&gt;&gt; -=C2=A0 =C2=A0 { &quot;ieee_single&quot;, 32, &#39;s&#39;,=
 &#39;f&#39; },<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 /* 16 bit */<br>
&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 { &quot;ieee_half&quot;, 16, &#39;h&#39;, &=
#39;f&#39; },<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 { &quot;uint16&quot;, 16, &#39;h&#39;,=
 &#39;u&#39; },<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 { &quot;int16&quot;, 16, &#39;h&#39;, =
&#39;s&#39; },<br>
&gt;&gt;&gt;&gt; -=C2=A0 =C2=A0 /*<br>
&gt;&gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0* TODO: currently there is no reliabl=
e way of telling<br>
&gt;&gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0* if the remote gdb actually understa=
nds ieee_half so<br>
&gt;&gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0* we don&#39;t expose it in the targe=
t description for now.<br>
&gt;&gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0* { &quot;ieee_half&quot;, 16, &#39;h=
&#39;, &#39;f&#39; },<br>
&gt;&gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0*/<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 /* bytes */<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 { &quot;uint8&quot;, 8, &#39;b&#39;, &=
#39;u&#39; },<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 { &quot;int8&quot;, 8, &#39;b&#39;, &#=
39;s&#39; },<br>
&gt;&gt;&gt;&gt; @@ -223,17 +218,16 @@ int arm_gen_dynamic_svereg_xml(CPUSt=
ate *cs, int base_reg)<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 GString *s =3D g_string_new(NULL);<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 DynamicGDBXMLInfo *info =3D &amp;cpu-&=
gt;dyn_svereg_xml;<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 g_autoptr(GString) ts =3D g_string_new=
(&quot;&quot;);<br>
&gt;&gt;&gt;&gt; -=C2=A0 =C2=A0 int i, bits, reg_width =3D (cpu-&gt;sve_max=
_vq * 128);<br>
&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 int i, j, bits, reg_width =3D (cpu-&gt;sve_=
max_vq * 128);<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 info-&gt;num =3D 0;<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 g_string_printf(s, &quot;&lt;?xml vers=
ion=3D\&quot;1.0\&quot;?&gt;&quot;);<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 g_string_append_printf(s, &quot;&lt;!D=
OCTYPE target SYSTEM \&quot;gdb-target.dtd\&quot;&gt;&quot;);<br>
&gt;&gt;&gt;&gt; -=C2=A0 =C2=A0 g_string_append_printf(s, &quot;&lt;feature=
 name=3D\&quot;org.qemu.gdb.aarch64.sve\&quot;&gt;&quot;);<br>
&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 g_string_append_printf(s, &quot;&lt;feature=
 name=3D\&quot;org.gnu.gdb.aarch64.sve\&quot;&gt;&quot;);<br>
&gt;&gt;&gt;&gt;=C2=A0 <br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 /* First define types and totals in a =
whole VL */<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 for (i =3D 0; i &lt; ARRAY_SIZE(vec_la=
nes); i++) {<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int count =3D reg_width =
/ vec_lanes[i].size;<br>
&gt;&gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_string_printf(ts, &quot;vq%=
d%c%c&quot;, count,<br>
&gt;&gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 vec_lanes[i].sz, vec_lanes[i].suffix);<br>
&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_string_printf(ts, &quot;sve=
v%c%c&quot;, vec_lanes[i].sz, vec_lanes[i].suffix);<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 g_string_append_printf(s=
,<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;&lt;vector=
 id=3D\&quot;%s\&quot; type=3D\&quot;%s\&quot; count=3D\&quot;%d\&quot;/&gt=
;&quot;,<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ts-&gt;str, vec_=
lanes[i].gdb_type, count);<br>
&gt;&gt;&gt;&gt; @@ -243,39 +237,37 @@ int arm_gen_dynamic_svereg_xml(CPUSt=
ate *cs, int base_reg)<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0* signed and potentially float v=
ersions of each size from 128 to<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0* 8 bits.<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
&gt;&gt;&gt;&gt; -=C2=A0 =C2=A0 for (bits =3D 128; bits &gt;=3D 8; bits /=
=3D 2) {<br>
&gt;&gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 int count =3D reg_width / bit=
s;<br>
&gt;&gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_string_append_printf(s, &qu=
ot;&lt;union id=3D\&quot;vq%dn\&quot;&gt;&quot;, count);<br>
&gt;&gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 for (i =3D 0; i &lt; ARRAY_SI=
ZE(vec_lanes); i++) {<br>
&gt;&gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (vec_lanes[i=
].size =3D=3D bits) {<br>
&gt;&gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 g=
_string_append_printf(s, &quot;&lt;field name=3D\&quot;%c\&quot; type=3D\&q=
uot;vq%d%c%c\&quot;/&gt;&quot;,<br>
&gt;&gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0vec_lanes[i].suffix,<br>
&gt;&gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0count,<br>
&gt;&gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0vec_lanes[i].sz, vec_lanes[i].suffix);<br>
&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 for (bits =3D 128, i =3D 0; bits &gt;=3D 8;=
 bits /=3D 2, i++) {<br>
&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 const char suf[] =3D { &#39;q=
&#39;, &#39;d&#39;, &#39;s&#39;, &#39;h&#39;, &#39;b&#39; };<br>
&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_string_append_printf(s, &qu=
ot;&lt;union id=3D\&quot;svevn%c\&quot;&gt;&quot;, suf[i]);<br>
&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 for (j =3D 0; j &lt; ARRAY_SI=
ZE(vec_lanes); j++) {<br>
&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (vec_lanes[j=
].size =3D=3D bits) {<br>
&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 g=
_string_append_printf(s, &quot;&lt;field name=3D\&quot;%c\&quot; type=3D\&q=
uot;svev%c%c\&quot;/&gt;&quot;,<br>
&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0vec_lanes[j].suffix,<br>
&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0vec_lanes[j].sz, vec_lanes[j].suffix);<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 g_string_append(s, &quot=
;&lt;/union&gt;&quot;);<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 /* And now the final union of unions *=
/<br>
&gt;&gt;&gt;&gt; -=C2=A0 =C2=A0 g_string_append(s, &quot;&lt;union id=3D\&q=
uot;vq\&quot;&gt;&quot;);<br>
&gt;&gt;&gt;&gt; -=C2=A0 =C2=A0 for (bits =3D 128; bits &gt;=3D 8; bits /=
=3D 2) {<br>
&gt;&gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 int count =3D reg_width / bit=
s;<br>
&gt;&gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 for (i =3D 0; i &lt; ARRAY_SI=
ZE(vec_lanes); i++) {<br>
&gt;&gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (vec_lanes[i=
].size =3D=3D bits) {<br>
&gt;&gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 g=
_string_append_printf(s, &quot;&lt;field name=3D\&quot;%c\&quot; type=3D\&q=
uot;vq%dn\&quot;/&gt;&quot;,<br>
&gt;&gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0vec_lanes[i].sz, count);<br>
&gt;&gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 b=
reak;<br>
&gt;&gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;&gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 g_string_append(s, &quot;&lt;union id=3D\&q=
uot;svev\&quot;&gt;&quot;);<br>
&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 for (bits =3D 128, i =3D 0; bits &gt;=3D 8;=
 bits /=3D 2, i++) {<br>
&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 const char suf[] =3D { &#39;q=
&#39;, &#39;d&#39;, &#39;s&#39;, &#39;h&#39;, &#39;b&#39; };<br>
&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_string_append_printf(s, &qu=
ot;&lt;field name=3D\&quot;%c\&quot; type=3D\&quot;svevn%c\&quot;/&gt;&quot=
;,<br>
&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0suf[i], suf[i]);<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 g_string_append(s, &quot;&lt;/union&gt=
;&quot;);<br>
&gt;&gt;&gt;&gt;=C2=A0 <br>
&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 /* Finally the sve prefix type */<br>
&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 g_string_append_printf(s,<br>
&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;&lt;vector id=3D\&quot;svep\=
&quot; type=3D\&quot;uint8\&quot; count=3D\&quot;%d\&quot;/&gt;&quot;,<br>
&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reg_width / 8);<br>
&gt;&gt;&gt;&gt; +<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 /* Then define each register in parts =
for each vq */<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 for (i =3D 0; i &lt; 32; i++) {<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 g_string_append_printf(s=
,<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;&lt;reg na=
me=3D\&quot;z%d\&quot; bitsize=3D\&quot;%d\&quot;&quot;<br>
&gt;&gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot; regnum=3D\&qu=
ot;%d\&quot; group=3D\&quot;vector\&quot;&quot;<br>
&gt;&gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot; type=3D\&quot=
;vq\&quot;/&gt;&quot;,<br>
&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot; regnum=3D\&qu=
ot;%d\&quot; type=3D\&quot;svev\&quot;/&gt;&quot;,<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0i, reg_width, ba=
se_reg++);<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 info-&gt;num++;<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt;&gt;&gt;&gt; @@ -287,31 +279,22 @@ int arm_gen_dynamic_svereg_xml(CPUSt=
ate *cs, int base_reg)<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot; regnum=3D\&quot;%d\&quo=
t; group=3D\&quot;float\&quot;&quot;<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot; type=3D\&quot;int\&quot=
;/&gt;&quot;, base_reg++);<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 info-&gt;num +=3D 2;<br>
&gt;&gt;&gt;&gt; -=C2=A0 =C2=A0 /*<br>
&gt;&gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0* Predicate registers aren&#39;t so b=
ig they are worth splitting up<br>
&gt;&gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0* but we do need to define a type to =
hold the array of quad<br>
&gt;&gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0* references.<br>
&gt;&gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0*/<br>
&gt;&gt;&gt;&gt; -=C2=A0 =C2=A0 g_string_append_printf(s,<br>
&gt;&gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;&lt;vector id=3D\&quot;vqp\&=
quot; type=3D\&quot;uint16\&quot; count=3D\&quot;%d\&quot;/&gt;&quot;,<br>
&gt;&gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cpu-&gt;sve_max_vq);<br>
&gt;&gt;&gt;&gt; +<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 for (i =3D 0; i &lt; 16; i++) {<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 g_string_append_printf(s=
,<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;&lt;reg na=
me=3D\&quot;p%d\&quot; bitsize=3D\&quot;%d\&quot;&quot;<br>
&gt;&gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot; regnum=3D\&qu=
ot;%d\&quot; group=3D\&quot;vector\&quot;&quot;<br>
&gt;&gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot; type=3D\&quot=
;vqp\&quot;/&gt;&quot;,<br>
&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot; regnum=3D\&qu=
ot;%d\&quot; type=3D\&quot;svep\&quot;/&gt;&quot;,<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0i, cpu-&gt;sve_m=
ax_vq * 16, base_reg++);<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 info-&gt;num++;<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 g_string_append_printf(s,<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;&lt;reg name=3D\&quot;ff=
r\&quot; bitsize=3D\&quot;%d\&quot;&quot;<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot; regnum=3D\&quot;%d\&quo=
t; group=3D\&quot;vector\&quot;&quot;<br>
&gt;&gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot; type=3D\&quot;vqp\&quot;/&g=
t;&quot;,<br>
&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot; type=3D\&quot;svep\&quot;/&=
gt;&quot;,<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cpu-&gt;sve_max_vq * 16, base_=
reg++);<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 g_string_append_printf(s,<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;&lt;reg name=3D\&quot;vg=
\&quot; bitsize=3D\&quot;64\&quot;&quot;<br>
&gt;&gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot; regnum=3D\&quot;%d\&quot; g=
roup=3D\&quot;vector\&quot;&quot;<br>
&gt;&gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot; type=3D\&quot;uint32\&quot;=
/&gt;&quot;,<br>
&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot; regnum=3D\&quot;%d\&quot; t=
ype=3D\&quot;int\&quot;/&gt;&quot;,<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0base_reg++);<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 info-&gt;num +=3D 2;<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 g_string_append_printf(s, &quot;&lt;/f=
eature&gt;&quot;);<br>
&gt;&gt;&gt;&gt; diff --git a/target/arm/helper.c b/target/arm/helper.c<br>
&gt;&gt;&gt;&gt; index 5ab3f5ace3..8a492465d6 100644<br>
&gt;&gt;&gt;&gt; --- a/target/arm/helper.c<br>
&gt;&gt;&gt;&gt; +++ b/target/arm/helper.c<br>
&gt;&gt;&gt;&gt; @@ -276,7 +276,7 @@ static int arm_gdb_get_svereg(CPUARMSt=
ate *env, GByteArray *buf, int reg)<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* while the ZCR wo=
rks in Vector Quads (VQ) which is 128bit chunks.<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int vq =3D sve_zcr_len_f=
or_el(env, arm_current_el(env)) + 1;<br>
&gt;&gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 return gdb_get_reg32(buf, vq =
* 2);<br>
&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return gdb_get_reg64(buf, vq =
* 2);<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 default:<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* gdbstub asked for som=
ething out our range */<br>
&gt;&gt;&gt;&gt; diff --git a/tests/tcg/aarch64/gdbstub/test-sve-ioctl.py b=
/tests/tcg/aarch64/gdbstub/test-sve-ioctl.py<br>
&gt;&gt;&gt;&gt; index 972cf73c31..b9ef169c1a 100644<br>
&gt;&gt;&gt;&gt; --- a/tests/tcg/aarch64/gdbstub/test-sve-ioctl.py<br>
&gt;&gt;&gt;&gt; +++ b/tests/tcg/aarch64/gdbstub/test-sve-ioctl.py<br>
&gt;&gt;&gt;&gt; @@ -40,6 +40,17 @@ class TestBreakpoint(gdb.Breakpoint):<b=
r>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 except gdb.error:<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 report(Fal=
se, &quot;checking zregs (out of range)&quot;)<br>
&gt;&gt;&gt;&gt;=C2=A0 <br>
&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Check the aliased V registe=
rs are set and GDB has correctly<br>
&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # created them for us having =
recognised and handled SVE.<br>
&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 try:<br>
&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for i in range(=
0, 16):<br>
&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 v=
al_z =3D gdb.parse_and_eval(&quot;$z0.b.u[%d]&quot; % i)<br>
&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 v=
al_v =3D gdb.parse_and_eval(&quot;$v0.b.u[%d]&quot; % i)<br>
&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 r=
eport(int(val_z) =3D=3D int(val_v),<br>
&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;v0.b.u[%d] =3D=3D z0.b.u[%d]&quot; % (i, i=
))<br>
&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 except gdb.error:<br>
&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 report(False, &=
quot;checking vregs (out of range)&quot;)<br>
&gt;&gt;&gt;&gt; +<br>
&gt;&gt;&gt;&gt;=C2=A0 <br>
&gt;&gt;&gt;&gt;=C2=A0 def run_test():<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 &quot;Run through the tests one by one=
&quot;<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt; <br>
&gt;&gt; <br>
<br>
<br>
-- <br>
Alex Benn=C3=A9e<br>
</blockquote></div>

--0000000000005f3cb005b943359b--

