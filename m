Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C02776DF6B8
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Apr 2023 15:14:14 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmaI3-00081U-MV; Wed, 12 Apr 2023 09:13:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hsp.cat7@gmail.com>)
 id 1pmaHv-00080r-Dw
 for qemu-devel@nongnu.org; Wed, 12 Apr 2023 09:13:27 -0400
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <hsp.cat7@gmail.com>)
 id 1pmaHt-0007oG-Lw
 for qemu-devel@nongnu.org; Wed, 12 Apr 2023 09:13:27 -0400
Received: by mail-ej1-x62b.google.com with SMTP id sh8so28653541ejc.10
 for <qemu-devel@nongnu.org>; Wed, 12 Apr 2023 06:13:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681305204; x=1683897204;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=h9Jkj17PtM0YP+RFCRw6J+y9FuSu4ShBXi7bOVVX4u0=;
 b=qyRZYZXj4dgPLajIboAWZcK39Sw40rJ0kA4nM0UQYOlbbEbiJ7l4h6QJ7djFhaCjGl
 +771KzFZidZgCLocttrPC+QAFL7cbYboCLE69UDcrpsG+bnSzybUnXdxUx8FHDU7UKBE
 jQxOJvycFHXGUnEcV7xI52NzG4RO2DpTt78rRZgas7SVLVJIV7ns0nUhdG6o209Q9ODO
 QQBtmh8jdsE6tuYUhugZ+ZrIbBCNrJL5uWMvjvXxNPOVqPl18ZzNJ4TuKRVTDaWsMI89
 Y8Jw5F4NQEFInblV/cl94UCvLZ/+D7gpyxlRacxb5WsVIpWm6EC6SGXeUt0ONhytQ9bn
 3ucA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681305204; x=1683897204;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=h9Jkj17PtM0YP+RFCRw6J+y9FuSu4ShBXi7bOVVX4u0=;
 b=UNkzdgQd7Z3KPuedgQUaW+z5eSBDSSdSSycBZjxuaNBMu6DyiMqFnMXIu2ArECuRcL
 5Qwbw459RDcio9oqhDcQG7yaXnzd8561sak5+HY6A752rwVi9VOGNsTZjzxMwdQdgcJ+
 gD2CFcPn10B3xGMVoZ/im34QIw0IgSI9Oq7sB6NeIDvfShTeTB1DQr2BJK50XDTGm6kz
 t65qIX20EVgHOFPwE6aDcp+C14/UH1qvawgDFCtvg8wSEVWWn0I+VqWeG3nOzf0WLVro
 Fw9gJiGJSAfiPNhpqm6ZyvCeGLl0IfyTDldQGDtKPdeGEJXYQyeU6aNHCYjsuQX1wVIV
 BoDw==
X-Gm-Message-State: AAQBX9cW2pOKwOzTEK6EnXYlMfwUcg+UT1hDvDiYaCEXCtPIpH0fWV0s
 W+H6GnScM7Dr9NjbYVjuIvE2VNXeCmy2PdqcfLLoqKQdoc4=
X-Google-Smtp-Source: AKy350a9jrG3Ie+4gIXtwsYuLzMQTxcTrdDGcns38F4qOPmi5/JLaFv8I8p3yLnHskjQQLMc0PQUqDE3HkMBRtpYAJ4=
X-Received: by 2002:a17:906:5250:b0:92b:7e6a:bca5 with SMTP id
 y16-20020a170906525000b0092b7e6abca5mr3261464ejm.12.1681305203897; Wed, 12
 Apr 2023 06:13:23 -0700 (PDT)
MIME-Version: 1.0
From: Howard Spoelstra <hsp.cat7@gmail.com>
Date: Wed, 12 Apr 2023 15:13:09 +0200
Message-ID: <CABLmASGEEMLWTwsZN1Yft_B5tV6Cw_2MXv-as_A3CQYhrn-nWA@mail.gmail.com>
Subject: Re: source fails to compile on msys2
To: qemu-devel qemu-devel <qemu-devel@nongnu.org>
Content-Type: multipart/alternative; boundary="0000000000006ffcf905f9235fdc"
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=hsp.cat7@gmail.com; helo=mail-ej1-x62b.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, HTML_MESSAGE=0.001,
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

--0000000000006ffcf905f9235fdc
Content-Type: text/plain; charset="UTF-8"

Hello Peter,

My source was cloned today. I just cloned again and I still see the tokens
reversed:
git clone https://www.gitlab.com/qemu/qemu qemu-master-clean

/**
 * qemu_build_not_reached()
 *
 * The compiler, during optimization, is expected to prove that a call
 * to this function cannot be reached and remove it.  If the compiler
 * supports QEMU_ERROR, this will be reported at compile time; otherwise
 * this will be reported at link time due to the missing symbol.
 */
extern G_NORETURN
void QEMU_ERROR("code path is reachable")
    qemu_build_not_reached_always(void);
#if defined(__OPTIMIZE__) && !defined(__NO_INLINE__)
#define qemu_build_not_reached()  qemu_build_not_reached_always()
#else
#define qemu_build_not_reached()  g_assert_not_reached()
#endif


The source on gitlab shows the correct order:

/** * qemu_build_not_reached() * * The compiler, during optimization,
is expected to prove that a call * to this function cannot be reached
and remove it.  If the compiler * supports QEMU_ERROR, this will be
reported at compile time; otherwise * this will be reported at link
time due to the missing symbol. */G_NORETURN externvoid
QEMU_ERROR("code path is reachable")
qemu_build_not_reached_always(void);#if defined(__OPTIMIZE__) &&
!defined(__NO_INLINE__)#define qemu_build_not_reached()
qemu_build_not_reached_always()#else#define qemu_build_not_reached()
g_assert_not_reached()#endif

--0000000000006ffcf905f9235fdc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hello Peter,</div><div><br></div><div>My source was c=
loned today. I just cloned again and I still see the tokens reversed:</div>=
<div>git clone <a href=3D"https://www.gitlab.com/qemu/qemu">https://www.git=
lab.com/qemu/qemu</a> qemu-master-clean</div><div><br></div><div>/**<br>=C2=
=A0* qemu_build_not_reached()<br>=C2=A0*<br>=C2=A0* The compiler, during op=
timization, is expected to prove that a call<br>=C2=A0* to this function ca=
nnot be reached and remove it.=C2=A0 If the compiler<br>=C2=A0* supports QE=
MU_ERROR, this will be reported at compile time; otherwise<br>=C2=A0* this =
will be reported at link time due to the missing symbol.<br>=C2=A0*/<br>ext=
ern G_NORETURN<br>void QEMU_ERROR(&quot;code path is reachable&quot;)<br>=
=C2=A0 =C2=A0 qemu_build_not_reached_always(void);<br>#if defined(__OPTIMIZ=
E__) &amp;&amp; !defined(__NO_INLINE__)<br>#define qemu_build_not_reached()=
 =C2=A0qemu_build_not_reached_always()<br>#else<br>#define qemu_build_not_r=
eached() =C2=A0g_assert_not_reached()<br>#endif<br></div><div><br></div><di=
v><br></div><div>The source on gitlab shows the correct order:</div><div>
<pre class=3D"gmail-code gmail-highlight" lang=3D"c"><span id=3D"gmail-LC23=
2" class=3D"gmail-line" lang=3D"c"><span class=3D"gmail-hljs-comment"><span=
 class=3D"gmail-hljs-comment">/**</span></span></span>
<span id=3D"gmail-LC233" class=3D"gmail-line" lang=3D"c"><span class=3D"gma=
il-hljs-comment"> * qemu_build_not_reached()</span></span>
<span id=3D"gmail-LC234" class=3D"gmail-line" lang=3D"c"><span class=3D"gma=
il-hljs-comment"> *</span></span>
<span id=3D"gmail-LC235" class=3D"gmail-line" lang=3D"c"><span class=3D"gma=
il-hljs-comment"> * The compiler, during optimization,</span><span class=3D=
"gmail-hljs-comment"> is expected to </span><span class=3D"gmail-hljs-comme=
nt">prove that a call</span></span>
<span id=3D"gmail-LC236" class=3D"gmail-line" lang=3D"c"><span class=3D"gma=
il-hljs-comment"> *</span><span class=3D"gmail-hljs-comment"> to this funct=
ion </span><span class=3D"gmail-hljs-comment">cannot be</span><span class=
=3D"gmail-hljs-comment"> reached and remove </span><span class=3D"gmail-hlj=
s-comment">it.  If the compiler</span></span>
<span id=3D"gmail-LC237" class=3D"gmail-line" lang=3D"c"><span class=3D"gma=
il-hljs-comment"> * supports QEMU_ERROR, this will be</span><span class=3D"=
gmail-hljs-comment"> reported at compile </span><span class=3D"gmail-hljs-c=
omment">time; otherwise</span></span>
<span id=3D"gmail-LC238" class=3D"gmail-line" lang=3D"c"><span class=3D"gma=
il-hljs-comment"> * this will be</span><span class=3D"gmail-hljs-comment"> =
reported at link </span><span class=3D"gmail-hljs-comment">time</span><span=
 class=3D"gmail-hljs-comment"> due to the </span><span class=3D"gmail-hljs-=
comment">missing symbol.</span></span>
<span id=3D"gmail-LC239" class=3D"gmail-line" lang=3D"c"><span class=3D"gma=
il-hljs-comment"> */</span><span class=3D"gmail-"></span></span>
<span id=3D"gmail-LC240" class=3D"gmail-line" lang=3D"c"><span class=3D"gma=
il-"></span><span class=3D"gmail-">G_NORETURN </span><span class=3D"gmail-h=
ljs-keyword">extern</span><span class=3D"gmail-"></span></span>
<span id=3D"gmail-LC241" class=3D"gmail-line" lang=3D"c"><span class=3D"gma=
il-"></span><span class=3D"gmail-hljs-type">void</span><span class=3D"gmail=
-"> </span><span class=3D"gmail-hljs-title.function">QEMU_ERROR</span><span=
 class=3D"gmail-hljs-params"><span class=3D"gmail-hljs-params">(</span><spa=
n class=3D"gmail-hljs-string">&quot;code path is reachable&quot;</span><spa=
n class=3D"gmail-hljs-params">)</span></span><span class=3D"gmail-"></span>=
</span>
<span id=3D"gmail-LC242" class=3D"gmail-line" lang=3D"c"><span class=3D"gma=
il-">    </span><span class=3D"gmail-hljs-title.function">qemu_build_not_re=
ached_always</span><span class=3D"gmail-hljs-params"><span class=3D"gmail-h=
ljs-params">(</span><span class=3D"gmail-hljs-type">void</span><span class=
=3D"gmail-hljs-params">)</span></span><span class=3D"gmail-">;</span></span=
>
<span id=3D"gmail-LC243" class=3D"gmail-line" lang=3D"c"><span class=3D"gma=
il-"></span><span class=3D"gmail-hljs-meta"><span class=3D"gmail-hljs-meta"=
>#</span><span class=3D"gmail-hljs-keyword">if</span><span class=3D"gmail-h=
ljs-meta"> defined(__OPTIMIZE__) &amp;&amp; !defined(__NO_INLINE__)</span><=
/span><span class=3D"gmail-"></span></span>
<span id=3D"gmail-LC244" class=3D"gmail-line" lang=3D"c"><span class=3D"gma=
il-"></span><span class=3D"gmail-hljs-meta"><span class=3D"gmail-hljs-meta"=
>#</span><span class=3D"gmail-hljs-keyword">define</span><span class=3D"gma=
il-hljs-meta"> qemu_build_not_reached()  qemu_build_not_reached_always()</s=
pan></span><span class=3D"gmail-"></span></span>
<span id=3D"gmail-LC245" class=3D"gmail-line" lang=3D"c"><span class=3D"gma=
il-"></span><span class=3D"gmail-hljs-meta"><span class=3D"gmail-hljs-meta"=
>#</span><span class=3D"gmail-hljs-keyword">else</span></span><span class=
=3D"gmail-"></span></span>
<span id=3D"gmail-LC246" class=3D"gmail-line" lang=3D"c"><span class=3D"gma=
il-"></span><span class=3D"gmail-hljs-meta"><span class=3D"gmail-hljs-meta"=
>#</span><span class=3D"gmail-hljs-keyword">define</span><span class=3D"gma=
il-hljs-meta"> qemu_build_not_reached()  g_assert_not_reached()</span></spa=
n><span class=3D"gmail-"></span></span>
<span id=3D"gmail-LC247" class=3D"gmail-line" lang=3D"c"><span class=3D"gma=
il-"></span><span class=3D"gmail-hljs-meta"><span class=3D"gmail-hljs-meta"=
>#</span><span class=3D"gmail-hljs-keyword">endif</span></span><span class=
=3D"gmail-"></span></span>
<span id=3D"gmail-LC248" class=3D"gmail-line" lang=3D"c"><span class=3D"gma=
il-"></span></span>
</pre>

</div></div>

--0000000000006ffcf905f9235fdc--

