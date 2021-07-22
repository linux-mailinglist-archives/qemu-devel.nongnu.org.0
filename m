Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E0D513D22A4
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Jul 2021 13:20:37 +0200 (CEST)
Received: from localhost ([::1]:38916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6Wkm-0000LL-Cz
	for lists+qemu-devel@lfdr.de; Thu, 22 Jul 2021 07:20:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34618)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mrolnik@gmail.com>) id 1m6WjN-00085N-2b
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 07:19:09 -0400
Received: from mail-qv1-xf34.google.com ([2607:f8b0:4864:20::f34]:34353)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mrolnik@gmail.com>) id 1m6WjK-00081B-Sp
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 07:19:08 -0400
Received: by mail-qv1-xf34.google.com with SMTP id o31so2414035qvo.1
 for <qemu-devel@nongnu.org>; Thu, 22 Jul 2021 04:19:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wDY8Q4lNuYZ91NfkKHWeNeNI809nyOWJWHy1fYEVBWY=;
 b=fRlmSsrzoNrlSfHW/INijTHami1IDHNPuuCMxsFddS8z7lwl6P6VTIv86JPdffqvWb
 Mrp3CXpAP+kTyyWkVQVPr2g92VIh2di6yCtI9iQ0g1xQ9FTDKmAYV0b/KBgQofzd0cf5
 ysd06MQsK65JV0hZNY+HUG8DgnEJAVTb2QQbBINwXOUVtz/+PlkzbsGPXVoRCaqx+upF
 07u6GMQbzn//z3mA9RVDO7KGDDELnJEh3DF4z/pjjcoO7DOofffnpAyM9JjttiuarBPI
 lligt8mlqOc+xSJtfhXxAaUQFOdPWp2Iqt/2RTSVLJxUvgR09XzlYBCF0gsAhVqxeM8E
 vgKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wDY8Q4lNuYZ91NfkKHWeNeNI809nyOWJWHy1fYEVBWY=;
 b=PGWEPEl4qf6qRMj3y1Wonnm4kdCOMC27iAN7Vc6QkVcQcuFjiSVAw6HK7wHEaQyUJB
 AMhw8RaQ1L8C8+baEfYfJ7Jvjt1OoIGxurqVn7/zeCotoNWGod83hbZmnkQyZ/xWR6oV
 E87YQY1b0RiJPVBcbidb//mJOMzuMR27ZbM4e5Ejp2l7htCC0XH3dMs4uUwi7keLIzfE
 9WIdp5eNnbRSWo190O05j9uRkgmuSXJcI7t6xzXu0QLb4S8tE8+pBksIVp+qWZJDymXl
 GhqXbvuTrx25xeM7lGsppfZLM8GNBb8xWTzyt9XtqbyC9Fq4jQnBqBejpb6mxHHJqtBu
 Px9w==
X-Gm-Message-State: AOAM532iYNo2dTljuDK5lGbYTOQt7kM0accsStGsCU83EF+H2B4NFnzl
 Je+PsxBkgy6tF1/wgr3DuSQLQukVqLz0MAjHwhY=
X-Google-Smtp-Source: ABdhPJzpzQdFHvVvi47kgTKoy/1o0oKvG80QS+zjVVvn+3IH2+M2Hixj3tsUiRv07gdobjA2Sv9MoxCyuFukIBbB9fs=
X-Received: by 2002:ad4:5fca:: with SMTP id jq10mr11919528qvb.27.1626952745249; 
 Thu, 22 Jul 2021 04:19:05 -0700 (PDT)
MIME-Version: 1.0
References: <20210721064155.645508-1-richard.henderson@linaro.org>
 <20210721064155.645508-4-richard.henderson@linaro.org>
 <f54d0645-5dad-4f7e-e804-9b926524ffa1@amsat.org>
In-Reply-To: <f54d0645-5dad-4f7e-e804-9b926524ffa1@amsat.org>
From: Michael Rolnik <mrolnik@gmail.com>
Date: Thu, 22 Jul 2021 14:18:29 +0300
Message-ID: <CAK4993gxuaRGo7StD1YNq3=5kmPV552mi4dZnV6qy3eSNT=quA@mail.gmail.com>
Subject: Re: [PATCH for-6.2 03/23] target/avr: Drop checks for
 singlestep_enabled
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: multipart/alternative; boundary="000000000000726f3e05c7b4740e"
Received-SPF: pass client-ip=2607:f8b0:4864:20::f34;
 envelope-from=mrolnik@gmail.com; helo=mail-qv1-xf34.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000726f3e05c7b4740e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Reviewed-by: Michael Rolnik <mrolnik@gmail.com>
Tested-by: Michael Rolnik <mrolnik@gmail.com>

On Wed, Jul 21, 2021 at 9:00 PM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g>
wrote:

> +Michael/Alex/Pavel
>
> On 7/21/21 8:41 AM, Richard Henderson wrote:
> > GDB single-stepping is now handled generically.
> >
> > Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> > ---
> >  target/avr/translate.c | 19 ++++---------------
> >  1 file changed, 4 insertions(+), 15 deletions(-)
> >
> > diff --git a/target/avr/translate.c b/target/avr/translate.c
> > index 1111e08b83..0403470dd8 100644
> > --- a/target/avr/translate.c
> > +++ b/target/avr/translate.c
> > @@ -1089,11 +1089,7 @@ static void gen_goto_tb(DisasContext *ctx, int n=
,
> target_ulong dest)
> >          tcg_gen_exit_tb(tb, n);
> >      } else {
> >          tcg_gen_movi_i32(cpu_pc, dest);
> > -        if (ctx->base.singlestep_enabled) {
> > -            gen_helper_debug(cpu_env);
> > -        } else {
> > -            tcg_gen_lookup_and_goto_ptr();
> > -        }
> > +        tcg_gen_lookup_and_goto_ptr();
> >      }
> >      ctx->base.is_jmp =3D DISAS_NORETURN;
> >  }
> > @@ -3011,17 +3007,10 @@ static void avr_tr_tb_stop(DisasContextBase
> *dcbase, CPUState *cs)
> >          tcg_gen_movi_tl(cpu_pc, ctx->npc);
> >          /* fall through */
> >      case DISAS_LOOKUP:
> > -        if (!ctx->base.singlestep_enabled) {
> > -            tcg_gen_lookup_and_goto_ptr();
> > -            break;
> > -        }
> > -        /* fall through */
> > +        tcg_gen_lookup_and_goto_ptr();
> > +        break;
> >      case DISAS_EXIT:
> > -        if (ctx->base.singlestep_enabled) {
> > -            gen_helper_debug(cpu_env);
> > -        } else {
> > -            tcg_gen_exit_tb(NULL, 0);
> > -        }
> > +        tcg_gen_exit_tb(NULL, 0);
> >          break;
> >      default:
> >          g_assert_not_reached();
> >
>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>
> Not related to this patch, but looking at the last
> gen_helper_debug() use:
>
> /*
>  *  The BREAK instruction is used by the On-chip Debug system, and is
>  *  normally not used in the application software. When the BREAK
> instruction is
>  *  executed, the AVR CPU is set in the Stopped Mode. This gives the
> On-chip
>  *  Debugger access to internal resources.  If any Lock bits are set, or
> either
>  *  the JTAGEN or OCDEN Fuses are unprogrammed, the CPU will treat the
> BREAK
>  *  instruction as a NOP and will not enter the Stopped mode.  This
> instruction
>  *  is not available in all devices. Refer to the device specific
> instruction
>  *  set summary.
>  */
> static bool trans_BREAK(DisasContext *ctx, arg_BREAK *a)
> {
>     if (!avr_have_feature(ctx, AVR_FEATURE_BREAK)) {
>         return true;
>     }
>
> #ifdef BREAKPOINT_ON_BREAK
>     tcg_gen_movi_tl(cpu_pc, ctx->npc - 1);
>     gen_helper_debug(cpu_env);
>     ctx->base.is_jmp =3D DISAS_EXIT;
> #else
>     /* NOP */
> #endif
>
>     return true;
> }
>
> Shouldn't we have a generic 'bool gdbstub_is_attached()' in
> "exec/gdbstub.h", then use it in replay_gdb_attached() and
> trans_BREAK() instead of this BREAKPOINT_ON_BREAK build-time
> definitions?
>


--=20
Best Regards,
Michael Rolnik

--000000000000726f3e05c7b4740e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Reviewed-by: Michael Rolnik &lt;<a href=3D"mailto:mrolnik@=
gmail.com">mrolnik@gmail.com</a>&gt;<div>Tested-by: Michael Rolnik &lt;<a h=
ref=3D"mailto:mrolnik@gmail.com">mrolnik@gmail.com</a>&gt;</div></div><br><=
div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Jul=
 21, 2021 at 9:00 PM Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:f4bu=
g@amsat.org">f4bug@amsat.org</a>&gt; wrote:<br></div><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex">+Michael/Alex/Pavel<br>
<br>
On 7/21/21 8:41 AM, Richard Henderson wrote:<br>
&gt; GDB single-stepping is now handled generically.<br>
&gt; <br>
&gt; Signed-off-by: Richard Henderson &lt;<a href=3D"mailto:richard.henders=
on@linaro.org" target=3D"_blank">richard.henderson@linaro.org</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 target/avr/translate.c | 19 ++++---------------<br>
&gt;=C2=A0 1 file changed, 4 insertions(+), 15 deletions(-)<br>
&gt; <br>
&gt; diff --git a/target/avr/translate.c b/target/avr/translate.c<br>
&gt; index 1111e08b83..0403470dd8 100644<br>
&gt; --- a/target/avr/translate.c<br>
&gt; +++ b/target/avr/translate.c<br>
&gt; @@ -1089,11 +1089,7 @@ static void gen_goto_tb(DisasContext *ctx, int =
n, target_ulong dest)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tcg_gen_exit_tb(tb, n);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 } else {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tcg_gen_movi_i32(cpu_pc, dest);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ctx-&gt;base.singlestep_enabled) {<br=
>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gen_helper_debug(cpu_env);<=
br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tcg_gen_lookup_and_goto_ptr=
();<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 tcg_gen_lookup_and_goto_ptr();<br>
&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 =C2=A0 =C2=A0 ctx-&gt;base.is_jmp =3D DISAS_NORETURN;<br>
&gt;=C2=A0 }<br>
&gt; @@ -3011,17 +3007,10 @@ static void avr_tr_tb_stop(DisasContextBase *d=
cbase, CPUState *cs)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tcg_gen_movi_tl(cpu_pc, ctx-&gt;npc)=
;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* fall through */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 case DISAS_LOOKUP:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!ctx-&gt;base.singlestep_enabled) {<b=
r>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tcg_gen_lookup_and_goto_ptr=
();<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* fall through */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 tcg_gen_lookup_and_goto_ptr();<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 case DISAS_EXIT:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ctx-&gt;base.singlestep_enabled) {<br=
>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gen_helper_debug(cpu_env);<=
br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tcg_gen_exit_tb(NULL, 0);<b=
r>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 tcg_gen_exit_tb(NULL, 0);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 default:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 g_assert_not_reached();<br>
&gt; <br>
<br>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:f4bug@amsat.=
org" target=3D"_blank">f4bug@amsat.org</a>&gt;<br>
<br>
Not related to this patch, but looking at the last<br>
gen_helper_debug() use:<br>
<br>
/*<br>
=C2=A0*=C2=A0 The BREAK instruction is used by the On-chip Debug system, an=
d is<br>
=C2=A0*=C2=A0 normally not used in the application software. When the BREAK=
<br>
instruction is<br>
=C2=A0*=C2=A0 executed, the AVR CPU is set in the Stopped Mode. This gives =
the On-chip<br>
=C2=A0*=C2=A0 Debugger access to internal resources.=C2=A0 If any Lock bits=
 are set, or<br>
either<br>
=C2=A0*=C2=A0 the JTAGEN or OCDEN Fuses are unprogrammed, the CPU will trea=
t the BREAK<br>
=C2=A0*=C2=A0 instruction as a NOP and will not enter the Stopped mode.=C2=
=A0 This<br>
instruction<br>
=C2=A0*=C2=A0 is not available in all devices. Refer to the device specific=
<br>
instruction<br>
=C2=A0*=C2=A0 set summary.<br>
=C2=A0*/<br>
static bool trans_BREAK(DisasContext *ctx, arg_BREAK *a)<br>
{<br>
=C2=A0 =C2=A0 if (!avr_have_feature(ctx, AVR_FEATURE_BREAK)) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 return true;<br>
=C2=A0 =C2=A0 }<br>
<br>
#ifdef BREAKPOINT_ON_BREAK<br>
=C2=A0 =C2=A0 tcg_gen_movi_tl(cpu_pc, ctx-&gt;npc - 1);<br>
=C2=A0 =C2=A0 gen_helper_debug(cpu_env);<br>
=C2=A0 =C2=A0 ctx-&gt;base.is_jmp =3D DISAS_EXIT;<br>
#else<br>
=C2=A0 =C2=A0 /* NOP */<br>
#endif<br>
<br>
=C2=A0 =C2=A0 return true;<br>
}<br>
<br>
Shouldn&#39;t we have a generic &#39;bool gdbstub_is_attached()&#39; in<br>
&quot;exec/gdbstub.h&quot;, then use it in replay_gdb_attached() and<br>
trans_BREAK() instead of this BREAKPOINT_ON_BREAK build-time<br>
definitions?<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature">Best Regards,<br>Michael Rolnik</div>

--000000000000726f3e05c7b4740e--

