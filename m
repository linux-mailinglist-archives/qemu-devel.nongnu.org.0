Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D5F82FB9CF
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 15:52:59 +0100 (CET)
Received: from localhost ([::1]:43464 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1sNO-0000zo-B5
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 09:52:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46966)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l1sLl-0007xj-9O
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 09:51:17 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:38613)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l1sLi-0006XZ-5K
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 09:51:17 -0500
Received: by mail-wm1-x335.google.com with SMTP id y187so1399wmd.3
 for <qemu-devel@nongnu.org>; Tue, 19 Jan 2021 06:51:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=1q28dFMb5vwgVc6oasyKknW+jNglDaiNk9hIqJ0mcT8=;
 b=jzSuyAj49ltXbb997GnrJwTtxzUal1fJTL0jFtYtN1O34FGjm1vXLBvdImdMs1XJMo
 I5FCP8FazM7uaTTHvZPCFaDd4dFPBx1BR5jpeNbEwrbmKV+iNn0QDLl5GrldRVrIvir2
 1Ycf9GgVMrsPGAJla/Pt21g1AvxeyiKGFIggTpCbC3dbC2VWs7ft/hbgN3ZhNoWGASfI
 M3ldM85j5D+u0m5RNnm+z2+jeL/7RE+/0rr6HIURUmXuxbCEC17jOvLgG9CVnq6LFIeP
 QmUVbPdjzXmTCDU0SwAesBjCgIp6Reul3TSu2G4FX6p8W6jDoV15VWdVO/4+BR1wJTGu
 5gyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=1q28dFMb5vwgVc6oasyKknW+jNglDaiNk9hIqJ0mcT8=;
 b=RD6Q5sX7c1/FtLaykCoK6mVv7Ws3i9OasKxA4sKC6+mojOu0yl9rLsK8mCLUufNqUf
 5AYLXwO5J7W62tbDD83djZLglx7Nkr9IOFxKhVNhhHhMj6FVJdcumtlYA4wdxhVtGFB/
 ybUXIN9172G6aG3Rdf1NXYSJIdHs3KPU1KjpuVpMZKb5ehXk6PreM8sKUMK/bi24dEeZ
 SAni6V3cY1d2iTaLtnbwnadIhw0Qz72KP/Ban1s0MyNy2GthJ4pmRQQjtVJ5lqZgv9LK
 jK892QJbCqeUSZnnHAbIXLvIRsmU0iPnV990C8ZFiyPxun6ma9nzdRQfg73B7gTjTe6r
 4JVQ==
X-Gm-Message-State: AOAM530It0OzDkEbhawYWPYnl+7y1e6Z24Z4x/pj+Dtr8oEV3cIddfzs
 mlf3DIrNwtTFNMw5mAntFhmbQA==
X-Google-Smtp-Source: ABdhPJx6RWX4i+Cm6Z1vBIrgGo/sCPfc+wYdQsr2DAe9P60eUkCMI04vE9jnjzyt7YlG4pBqWu936g==
X-Received: by 2002:a05:600c:1549:: with SMTP id
 f9mr4512976wmg.61.1611067872729; 
 Tue, 19 Jan 2021 06:51:12 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id h15sm4573652wmq.3.2021.01.19.06.51.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Jan 2021 06:51:11 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 0BAA81FF7E;
 Tue, 19 Jan 2021 14:51:11 +0000 (GMT)
References: <20210115130828.23968-1-alex.bennee@linaro.org>
 <20210115130828.23968-22-alex.bennee@linaro.org>
 <540354a8-bcba-aa82-814d-7f11dc75f5bf@suse.de>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Claudio Fontana <cfontana@suse.de>
Subject: Re: [PULL 21/30] target/arm: use official org.gnu.gdb.aarch64.sve
 layout for registers
Date: Tue, 19 Jan 2021 14:50:01 +0000
In-reply-to: <540354a8-bcba-aa82-814d-7f11dc75f5bf@suse.de>
Message-ID: <874kjdugip.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: peter.maydell@linaro.org, "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>,
 Luis Machado <luis.machado@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Claudio Fontana <cfontana@suse.de> writes:

> Hi Alex,
>
> after updating to latest master today, I am getting the following error w=
ith
>
> make check-tcg
>
> qemu-system-aarch64: -gdb unix:path=3D/tmp/tmp9ru5tgk8qemu-gdbstub/gdbstu=
b.socket,server: info: QEMU waiting for connection on: disconnected:unix:/t=
mp/tmp9ru5tgk8qemu-gdbstub/gdbstub.socket,server
> warning: while parsing target description (at line 47): Vector "svevhf" r=
eferences undefined type "ieee_half"
> warning: Could not load XML target description; ignoring
> qemu-system-aarch64: QEMU: Terminated via GDBstub
>
> Seems to indicate it is "ieee_half" -related?

*sigh*

yes - it is. I thought this was solved by the GDB version check in
14/30. What does your gdb report?

>
> Thanks,
>
> Claudio
>
> On 1/15/21 2:08 PM, Alex Benn=C3=A9e wrote:
>> While GDB can work with any XML description given to it there is
>> special handling for SVE registers on the GDB side which makes the
>> users life a little better. The changes aren't that major and all the
>> registers save the $vg reported the same. All that changes is:
>>=20
>>   - report org.gnu.gdb.aarch64.sve
>>   - use gdb nomenclature for names and types
>>   - minor re-ordering of the types to match reference
>>   - re-enable ieee_half (as we know gdb supports it now)
>>   - $vg is now a 64 bit int
>>   - check $vN and $zN aliasing in test
>>=20
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> Reviewed-by: Luis Machado <luis.machado@linaro.org>
>> Message-Id: <20210108224256.2321-11-alex.bennee@linaro.org>
>>=20
>> diff --git a/target/arm/gdbstub.c b/target/arm/gdbstub.c
>> index 866595b4f1..a8fff2a3d0 100644
>> --- a/target/arm/gdbstub.c
>> +++ b/target/arm/gdbstub.c
>> @@ -195,22 +195,17 @@ static const struct TypeSize vec_lanes[] =3D {
>>      { "uint128", 128, 'q', 'u' },
>>      { "int128", 128, 'q', 's' },
>>      /* 64 bit */
>> +    { "ieee_double", 64, 'd', 'f' },
>>      { "uint64", 64, 'd', 'u' },
>>      { "int64", 64, 'd', 's' },
>> -    { "ieee_double", 64, 'd', 'f' },
>>      /* 32 bit */
>> +    { "ieee_single", 32, 's', 'f' },
>>      { "uint32", 32, 's', 'u' },
>>      { "int32", 32, 's', 's' },
>> -    { "ieee_single", 32, 's', 'f' },
>>      /* 16 bit */
>> +    { "ieee_half", 16, 'h', 'f' },
>>      { "uint16", 16, 'h', 'u' },
>>      { "int16", 16, 'h', 's' },
>> -    /*
>> -     * TODO: currently there is no reliable way of telling
>> -     * if the remote gdb actually understands ieee_half so
>> -     * we don't expose it in the target description for now.
>> -     * { "ieee_half", 16, 'h', 'f' },
>> -     */
>>      /* bytes */
>>      { "uint8", 8, 'b', 'u' },
>>      { "int8", 8, 'b', 's' },
>> @@ -223,17 +218,16 @@ int arm_gen_dynamic_svereg_xml(CPUState *cs, int b=
ase_reg)
>>      GString *s =3D g_string_new(NULL);
>>      DynamicGDBXMLInfo *info =3D &cpu->dyn_svereg_xml;
>>      g_autoptr(GString) ts =3D g_string_new("");
>> -    int i, bits, reg_width =3D (cpu->sve_max_vq * 128);
>> +    int i, j, bits, reg_width =3D (cpu->sve_max_vq * 128);
>>      info->num =3D 0;
>>      g_string_printf(s, "<?xml version=3D\"1.0\"?>");
>>      g_string_append_printf(s, "<!DOCTYPE target SYSTEM \"gdb-target.dtd=
\">");
>> -    g_string_append_printf(s, "<feature name=3D\"org.qemu.gdb.aarch64.s=
ve\">");
>> +    g_string_append_printf(s, "<feature name=3D\"org.gnu.gdb.aarch64.sv=
e\">");
>>=20=20
>>      /* First define types and totals in a whole VL */
>>      for (i =3D 0; i < ARRAY_SIZE(vec_lanes); i++) {
>>          int count =3D reg_width / vec_lanes[i].size;
>> -        g_string_printf(ts, "vq%d%c%c", count,
>> -                        vec_lanes[i].sz, vec_lanes[i].suffix);
>> +        g_string_printf(ts, "svev%c%c", vec_lanes[i].sz, vec_lanes[i].s=
uffix);
>>          g_string_append_printf(s,
>>                                 "<vector id=3D\"%s\" type=3D\"%s\" count=
=3D\"%d\"/>",
>>                                 ts->str, vec_lanes[i].gdb_type, count);
>> @@ -243,39 +237,37 @@ int arm_gen_dynamic_svereg_xml(CPUState *cs, int b=
ase_reg)
>>       * signed and potentially float versions of each size from 128 to
>>       * 8 bits.
>>       */
>> -    for (bits =3D 128; bits >=3D 8; bits /=3D 2) {
>> -        int count =3D reg_width / bits;
>> -        g_string_append_printf(s, "<union id=3D\"vq%dn\">", count);
>> -        for (i =3D 0; i < ARRAY_SIZE(vec_lanes); i++) {
>> -            if (vec_lanes[i].size =3D=3D bits) {
>> -                g_string_append_printf(s, "<field name=3D\"%c\" type=3D=
\"vq%d%c%c\"/>",
>> -                                       vec_lanes[i].suffix,
>> -                                       count,
>> -                                       vec_lanes[i].sz, vec_lanes[i].su=
ffix);
>> +    for (bits =3D 128, i =3D 0; bits >=3D 8; bits /=3D 2, i++) {
>> +        const char suf[] =3D { 'q', 'd', 's', 'h', 'b' };
>> +        g_string_append_printf(s, "<union id=3D\"svevn%c\">", suf[i]);
>> +        for (j =3D 0; j < ARRAY_SIZE(vec_lanes); j++) {
>> +            if (vec_lanes[j].size =3D=3D bits) {
>> +                g_string_append_printf(s, "<field name=3D\"%c\" type=3D=
\"svev%c%c\"/>",
>> +                                       vec_lanes[j].suffix,
>> +                                       vec_lanes[j].sz, vec_lanes[j].su=
ffix);
>>              }
>>          }
>>          g_string_append(s, "</union>");
>>      }
>>      /* And now the final union of unions */
>> -    g_string_append(s, "<union id=3D\"vq\">");
>> -    for (bits =3D 128; bits >=3D 8; bits /=3D 2) {
>> -        int count =3D reg_width / bits;
>> -        for (i =3D 0; i < ARRAY_SIZE(vec_lanes); i++) {
>> -            if (vec_lanes[i].size =3D=3D bits) {
>> -                g_string_append_printf(s, "<field name=3D\"%c\" type=3D=
\"vq%dn\"/>",
>> -                                       vec_lanes[i].sz, count);
>> -                break;
>> -            }
>> -        }
>> +    g_string_append(s, "<union id=3D\"svev\">");
>> +    for (bits =3D 128, i =3D 0; bits >=3D 8; bits /=3D 2, i++) {
>> +        const char suf[] =3D { 'q', 'd', 's', 'h', 'b' };
>> +        g_string_append_printf(s, "<field name=3D\"%c\" type=3D\"svevn%=
c\"/>",
>> +                               suf[i], suf[i]);
>>      }
>>      g_string_append(s, "</union>");
>>=20=20
>> +    /* Finally the sve prefix type */
>> +    g_string_append_printf(s,
>> +                           "<vector id=3D\"svep\" type=3D\"uint8\" coun=
t=3D\"%d\"/>",
>> +                           reg_width / 8);
>> +
>>      /* Then define each register in parts for each vq */
>>      for (i =3D 0; i < 32; i++) {
>>          g_string_append_printf(s,
>>                                 "<reg name=3D\"z%d\" bitsize=3D\"%d\""
>> -                               " regnum=3D\"%d\" group=3D\"vector\""
>> -                               " type=3D\"vq\"/>",
>> +                               " regnum=3D\"%d\" type=3D\"svev\"/>",
>>                                 i, reg_width, base_reg++);
>>          info->num++;
>>      }
>> @@ -287,31 +279,22 @@ int arm_gen_dynamic_svereg_xml(CPUState *cs, int b=
ase_reg)
>>                             " regnum=3D\"%d\" group=3D\"float\""
>>                             " type=3D\"int\"/>", base_reg++);
>>      info->num +=3D 2;
>> -    /*
>> -     * Predicate registers aren't so big they are worth splitting up
>> -     * but we do need to define a type to hold the array of quad
>> -     * references.
>> -     */
>> -    g_string_append_printf(s,
>> -                           "<vector id=3D\"vqp\" type=3D\"uint16\" coun=
t=3D\"%d\"/>",
>> -                           cpu->sve_max_vq);
>> +
>>      for (i =3D 0; i < 16; i++) {
>>          g_string_append_printf(s,
>>                                 "<reg name=3D\"p%d\" bitsize=3D\"%d\""
>> -                               " regnum=3D\"%d\" group=3D\"vector\""
>> -                               " type=3D\"vqp\"/>",
>> +                               " regnum=3D\"%d\" type=3D\"svep\"/>",
>>                                 i, cpu->sve_max_vq * 16, base_reg++);
>>          info->num++;
>>      }
>>      g_string_append_printf(s,
>>                             "<reg name=3D\"ffr\" bitsize=3D\"%d\""
>>                             " regnum=3D\"%d\" group=3D\"vector\""
>> -                           " type=3D\"vqp\"/>",
>> +                           " type=3D\"svep\"/>",
>>                             cpu->sve_max_vq * 16, base_reg++);
>>      g_string_append_printf(s,
>>                             "<reg name=3D\"vg\" bitsize=3D\"64\""
>> -                           " regnum=3D\"%d\" group=3D\"vector\""
>> -                           " type=3D\"uint32\"/>",
>> +                           " regnum=3D\"%d\" type=3D\"int\"/>",
>>                             base_reg++);
>>      info->num +=3D 2;
>>      g_string_append_printf(s, "</feature>");
>> diff --git a/target/arm/helper.c b/target/arm/helper.c
>> index 5ab3f5ace3..8a492465d6 100644
>> --- a/target/arm/helper.c
>> +++ b/target/arm/helper.c
>> @@ -276,7 +276,7 @@ static int arm_gdb_get_svereg(CPUARMState *env, GByt=
eArray *buf, int reg)
>>           * while the ZCR works in Vector Quads (VQ) which is 128bit chu=
nks.
>>           */
>>          int vq =3D sve_zcr_len_for_el(env, arm_current_el(env)) + 1;
>> -        return gdb_get_reg32(buf, vq * 2);
>> +        return gdb_get_reg64(buf, vq * 2);
>>      }
>>      default:
>>          /* gdbstub asked for something out our range */
>> diff --git a/tests/tcg/aarch64/gdbstub/test-sve-ioctl.py b/tests/tcg/aar=
ch64/gdbstub/test-sve-ioctl.py
>> index 972cf73c31..b9ef169c1a 100644
>> --- a/tests/tcg/aarch64/gdbstub/test-sve-ioctl.py
>> +++ b/tests/tcg/aarch64/gdbstub/test-sve-ioctl.py
>> @@ -40,6 +40,17 @@ class TestBreakpoint(gdb.Breakpoint):
>>          except gdb.error:
>>              report(False, "checking zregs (out of range)")
>>=20=20
>> +        # Check the aliased V registers are set and GDB has correctly
>> +        # created them for us having recognised and handled SVE.
>> +        try:
>> +            for i in range(0, 16):
>> +                val_z =3D gdb.parse_and_eval("$z0.b.u[%d]" % i)
>> +                val_v =3D gdb.parse_and_eval("$v0.b.u[%d]" % i)
>> +                report(int(val_z) =3D=3D int(val_v),
>> +                       "v0.b.u[%d] =3D=3D z0.b.u[%d]" % (i, i))
>> +        except gdb.error:
>> +            report(False, "checking vregs (out of range)")
>> +
>>=20=20
>>  def run_test():
>>      "Run through the tests one by one"
>>=20


--=20
Alex Benn=C3=A9e

