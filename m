Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 507F531721C
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Feb 2021 22:13:43 +0100 (CET)
Received: from localhost ([::1]:56740 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9wnu-0006pH-CW
	for lists+qemu-devel@lfdr.de; Wed, 10 Feb 2021 16:13:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42150)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wuhaotsh@google.com>)
 id 1l9wbZ-000772-1B
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 16:00:57 -0500
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e]:46678)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wuhaotsh@google.com>)
 id 1l9wbP-00082a-M0
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 16:00:56 -0500
Received: by mail-lf1-x12e.google.com with SMTP id v5so4905334lft.13
 for <qemu-devel@nongnu.org>; Wed, 10 Feb 2021 13:00:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tEQIrzp5YhSl1KFmaOZHJDORB+39XuCtY2rYFYt8XnA=;
 b=qjVjw2djgslg4lsCNbwCPBfiKP5Xymxz0aHz+jwCpy/IbHPSBK1AGCZaz6+yQy/oHA
 V5+USZ0cEyjyoRwGWAm+XRFOTTpEi8NhkGoXy+NyAJcPqny4KrNXHF286Wwp82T9AMdZ
 UpQ+BCIU4mQsY/n+hmRAEVqp5yHBnAqxE62rou2DqnOy8SXXvKTg9ltTEiew0G85hxDI
 PbgjeOpKs1WSvfR4z88rl90lRVYfLLJcyXWbiE3a82dMmdiWCMOvzhJ+DqGnvXgi6J3e
 yRaD+7wof1wW+EqBzCjexiNyobe4OerFpwnebccjj/UoRaZjF5UyongKuA8Uw8iAvZf8
 Z1AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tEQIrzp5YhSl1KFmaOZHJDORB+39XuCtY2rYFYt8XnA=;
 b=TCZMNCZ9k15fjbngHnZIgYRL8Eb++SgNpVZTSlMQB9aZ5bRTL97AwLZj+iUuyQHd97
 t8iUHKgnjbKcc1EJWz1+P2NJiEtpiDVzttWZTBmM3s8UctVNbo4/gG2lgaBWRKVQus79
 pveZeHywb9+N6/oNgfTMZf+n5BFAAltjGefHouupEBex+IYwl8LvbGwNXR/l6eg+ewb2
 gMyxFRprMZlob0Zd8pBrt9kSvFPoaIbLh1QEA3AIDMEX+eBkx6GaoDSfNPLbX5IgH5uf
 TJCh79/RU3BV7YEqJRXaH4Op7St5+RUWr8KfCds0oQm48BEJo5FUTzQtXedG1RA9RyoY
 KwDw==
X-Gm-Message-State: AOAM532MLw9M2iPp7SDByWqceJuQX2FzfPzc+BoIgq/DQbpTNScMBozl
 cVkeFG92Nbs32Ee81IOEgN4WMMbw0BJbk5UwP4MViA==
X-Google-Smtp-Source: ABdhPJxt3PGtPkkWmhpAm5PfVOedToQHByCCRtR1Zzs2XjpVOuTJVnHgybpUhcFB6IyHIsz7tIcEQZHTucxErNclyLs=
X-Received: by 2002:a19:ed19:: with SMTP id y25mr1846938lfy.337.1612990844288; 
 Wed, 10 Feb 2021 13:00:44 -0800 (PST)
MIME-Version: 1.0
References: <20210209132040.5091-1-peter.maydell@linaro.org>
 <20210209132040.5091-4-peter.maydell@linaro.org>
In-Reply-To: <20210209132040.5091-4-peter.maydell@linaro.org>
From: Hao Wu <wuhaotsh@google.com>
Date: Wed, 10 Feb 2021 13:00:31 -0800
Message-ID: <CAGcCb12LZHa31V31HszJd2k_QNCw2cM+xA+m+_xSn+QnOLO=Ug@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] clock: Add clock_ns_to_ticks() function
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>, 
 Tyrone Ting <kfting@nuvoton.com>, Luc Michel <luc@lmichel.fr>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Havard Skinnemoen <hskinnemoen@google.com>
Content-Type: multipart/alternative; boundary="0000000000004d3e9605bb01b2f6"
Received-SPF: pass client-ip=2a00:1450:4864:20::12e;
 envelope-from=wuhaotsh@google.com; helo=mail-lf1-x12e.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000004d3e9605bb01b2f6
Content-Type: text/plain; charset="UTF-8"

On Tue, Feb 9, 2021 at 5:27 AM Peter Maydell <peter.maydell@linaro.org>
wrote:

> Add a clock_ns_to_ticks() function which does the opposite of
> clock_ticks_to_ns(): given a duration in nanoseconds, it returns the
> number of clock ticks that would happen in that time.  This is useful
> for devices that have a free running counter register whose value can
> be calculated when it is read.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>
Reviewed-by: Hao Wu <wuhaotsh@google.com>

> ---
> I have made the overflow behaviour here be "wrap", with justification
> as per the comment; but I'm not 100% set on this.
> ---
>  docs/devel/clocks.rst | 12 ++++++++++++
>  include/hw/clock.h    | 41 +++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 53 insertions(+)
>
> diff --git a/docs/devel/clocks.rst b/docs/devel/clocks.rst
> index f0391e76b4f..956bd147ea0 100644
> --- a/docs/devel/clocks.rst
> +++ b/docs/devel/clocks.rst
> @@ -360,6 +360,18 @@ rather than simply passing it to a QEMUTimer function
> like
>  ``timer_mod_ns()`` then you should be careful to avoid overflow
>  in those calculations, of course.)
>
> +Obtaining tick counts
> +---------------------
> +
> +For calculations where you need to know the number of ticks in
> +a given duration, use ``clock_ns_to_ticks()``. This function handles
> +possible non-whole-number-of-nanoseconds periods and avoids
> +potential rounding errors. It will return '0' if the clock is stopped
> +(i.e. it has period zero). If the inputs imply a tick count that
> +overflows a 64-bit value (a very long duration for a clock with a
> +very short period) the output value is truncated, so effectively
> +the 64-bit output wraps around.
> +
>  Changing a clock period
>  -----------------------
>
> diff --git a/include/hw/clock.h b/include/hw/clock.h
> index d7a6673c29e..79c3b7ebe40 100644
> --- a/include/hw/clock.h
> +++ b/include/hw/clock.h
> @@ -286,6 +286,47 @@ static inline uint64_t clock_ticks_to_ns(const Clock
> *clk, uint64_t ticks)
>      return ns_low >> 32 | ns_high << 32;
>  }
>
> +/**
> + * clock_ns_to_ticks:
> + * @clk: the clock to query
> + * @ns: duration in nanoseconds
> + *
> + * Returns the number of ticks this clock would make in the given
> + * number of nanoseconds. Because a clock can have a period which
> + * is not a whole number of nanoseconds, it is important to use this
> + * function rather than attempting to obtain a "period in nanoseconds"
> + * value and then dividing the duration by that value.
> + *
> + * If the clock is stopped (ie it has period zero), returns 0.
> + *
> + * For some inputs the result could overflow a 64-bit value (because
> + * the clock's period is short and the duration is long). In these
> + * cases we truncate the result to a 64-bit value. This is on the
> + * assumption that generally the result is going to be used to report
> + * a 32-bit or 64-bit guest register value, so wrapping either cannot
> + * happen or is the desired behaviour.
> + */
> +static inline uint64_t clock_ns_to_ticks(const Clock *clk, uint64_t ns)
> +{
> +    /*
> +     * ticks = duration_in_ns / period_in_ns
> +     *       = ns / (period / 2^32)
> +     *       = (ns * 2^32) / period
> +     * The hi, lo inputs to divu128() are (ns << 32) as a 128 bit value.
> +     */
> +    uint64_t lo = ns << 32;
> +    uint64_t hi = ns >> 32;
> +    if (clk->period == 0) {
> +        return 0;
> +    }
> +    /*
> +     * Ignore divu128() return value as we've caught div-by-zero and don't
> +     * need different behaviour for overflow.
> +     */
> +    divu128(&lo, &hi, clk->period);
> +    return lo;
> +}
> +
>  /**
>   * clock_is_enabled:
>   * @clk: a clock
> --
> 2.20.1
>
>
>

--0000000000004d3e9605bb01b2f6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Feb 9, 2021 at 5:27 AM Peter =
Maydell &lt;<a href=3D"mailto:peter.maydell@linaro.org">peter.maydell@linar=
o.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex">Add a clock_ns_to_ticks() function which does the opposite of<br>
clock_ticks_to_ns(): given a duration in nanoseconds, it returns the<br>
number of clock ticks that would happen in that time.=C2=A0 This is useful<=
br>
for devices that have a free running counter register whose value can<br>
be calculated when it is read.<br>
<br>
Signed-off-by: Peter Maydell &lt;<a href=3D"mailto:peter.maydell@linaro.org=
" target=3D"_blank">peter.maydell@linaro.org</a>&gt;<br></blockquote><div>R=
eviewed-by: Hao Wu &lt;<a href=3D"mailto:wuhaotsh@google.com">wuhaotsh@goog=
le.com</a>&gt;=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>
---<br>
I have made the overflow behaviour here be &quot;wrap&quot;, with justifica=
tion<br>
as per the comment; but I&#39;m not 100% set on this.<br>
---<br>
=C2=A0docs/devel/clocks.rst | 12 ++++++++++++<br>
=C2=A0include/hw/clock.h=C2=A0 =C2=A0 | 41 ++++++++++++++++++++++++++++++++=
+++++++++<br>
=C2=A02 files changed, 53 insertions(+)<br>
<br>
diff --git a/docs/devel/clocks.rst b/docs/devel/clocks.rst<br>
index f0391e76b4f..956bd147ea0 100644<br>
--- a/docs/devel/clocks.rst<br>
+++ b/docs/devel/clocks.rst<br>
@@ -360,6 +360,18 @@ rather than simply passing it to a QEMUTimer function =
like<br>
=C2=A0``timer_mod_ns()`` then you should be careful to avoid overflow<br>
=C2=A0in those calculations, of course.)<br>
<br>
+Obtaining tick counts<br>
+---------------------<br>
+<br>
+For calculations where you need to know the number of ticks in<br>
+a given duration, use ``clock_ns_to_ticks()``. This function handles<br>
+possible non-whole-number-of-nanoseconds periods and avoids<br>
+potential rounding errors. It will return &#39;0&#39; if the clock is stop=
ped<br>
+(i.e. it has period zero). If the inputs imply a tick count that<br>
+overflows a 64-bit value (a very long duration for a clock with a<br>
+very short period) the output value is truncated, so effectively<br>
+the 64-bit output wraps around.<br>
+<br>
=C2=A0Changing a clock period<br>
=C2=A0-----------------------<br>
<br>
diff --git a/include/hw/clock.h b/include/hw/clock.h<br>
index d7a6673c29e..79c3b7ebe40 100644<br>
--- a/include/hw/clock.h<br>
+++ b/include/hw/clock.h<br>
@@ -286,6 +286,47 @@ static inline uint64_t clock_ticks_to_ns(const Clock *=
clk, uint64_t ticks)<br>
=C2=A0 =C2=A0 =C2=A0return ns_low &gt;&gt; 32 | ns_high &lt;&lt; 32;<br>
=C2=A0}<br>
<br>
+/**<br>
+ * clock_ns_to_ticks:<br>
+ * @clk: the clock to query<br>
+ * @ns: duration in nanoseconds<br>
+ *<br>
+ * Returns the number of ticks this clock would make in the given<br>
+ * number of nanoseconds. Because a clock can have a period which<br>
+ * is not a whole number of nanoseconds, it is important to use this<br>
+ * function rather than attempting to obtain a &quot;period in nanoseconds=
&quot;<br>
+ * value and then dividing the duration by that value.<br>
+ *<br>
+ * If the clock is stopped (ie it has period zero), returns 0.<br>
+ *<br>
+ * For some inputs the result could overflow a 64-bit value (because<br>
+ * the clock&#39;s period is short and the duration is long). In these<br>
+ * cases we truncate the result to a 64-bit value. This is on the<br>
+ * assumption that generally the result is going to be used to report<br>
+ * a 32-bit or 64-bit guest register value, so wrapping either cannot<br>
+ * happen or is the desired behaviour.<br>
+ */<br>
+static inline uint64_t clock_ns_to_ticks(const Clock *clk, uint64_t ns)<br=
>
+{<br>
+=C2=A0 =C2=A0 /*<br>
+=C2=A0 =C2=A0 =C2=A0* ticks =3D duration_in_ns / period_in_ns<br>
+=C2=A0 =C2=A0 =C2=A0*=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D ns / (period / 2^32)<b=
r>
+=C2=A0 =C2=A0 =C2=A0*=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D (ns * 2^32) / period<b=
r>
+=C2=A0 =C2=A0 =C2=A0* The hi, lo inputs to divu128() are (ns &lt;&lt; 32) =
as a 128 bit value.<br>
+=C2=A0 =C2=A0 =C2=A0*/<br>
+=C2=A0 =C2=A0 uint64_t lo =3D ns &lt;&lt; 32;<br>
+=C2=A0 =C2=A0 uint64_t hi =3D ns &gt;&gt; 32;<br>
+=C2=A0 =C2=A0 if (clk-&gt;period =3D=3D 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 /*<br>
+=C2=A0 =C2=A0 =C2=A0* Ignore divu128() return value as we&#39;ve caught di=
v-by-zero and don&#39;t<br>
+=C2=A0 =C2=A0 =C2=A0* need different behaviour for overflow.<br>
+=C2=A0 =C2=A0 =C2=A0*/<br>
+=C2=A0 =C2=A0 divu128(&amp;lo, &amp;hi, clk-&gt;period);<br>
+=C2=A0 =C2=A0 return lo;<br>
+}<br>
+<br>
=C2=A0/**<br>
=C2=A0 * clock_is_enabled:<br>
=C2=A0 * @clk: a clock<br>
-- <br>
2.20.1<br>
<br>
<br>
</blockquote></div></div>

--0000000000004d3e9605bb01b2f6--

