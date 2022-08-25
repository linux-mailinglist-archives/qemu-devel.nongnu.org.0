Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 297575A16DE
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Aug 2022 18:42:52 +0200 (CEST)
Received: from localhost ([::1]:46804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRFwO-0005EP-TM
	for lists+qemu-devel@lfdr.de; Thu, 25 Aug 2022 12:42:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48672)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wuhaotsh@google.com>)
 id 1oRFuV-0003J3-EC
 for qemu-devel@nongnu.org; Thu, 25 Aug 2022 12:40:51 -0400
Received: from mail-qt1-x836.google.com ([2607:f8b0:4864:20::836]:43636)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wuhaotsh@google.com>)
 id 1oRFuT-00016o-G9
 for qemu-devel@nongnu.org; Thu, 25 Aug 2022 12:40:51 -0400
Received: by mail-qt1-x836.google.com with SMTP id a4so15651574qto.10
 for <qemu-devel@nongnu.org>; Thu, 25 Aug 2022 09:40:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=b8CKJQ6KrwwP5Bb1S9rRR890oGlJn0CWNl675sLgaiI=;
 b=Ykrn8/tMkA41J8nHS06Yc4WNc5EHvVfPG3Le6zqTUtNtrPpFZM2+kQbxfL9GO756qN
 bHn5Qcxb36B+DsojnSw7NlDahUmtxd6IX6rl6e0HfhQjRuCqd2WjBLBixT9mchKSh9EG
 69uN3IZOXL1ZNRc0aGhut8NK0e57mIQwz79bX1MAqIQX/XvmxQBqUic8H2PVqrBtYinV
 wYN0LHUefUj/KVkOXtOmUTrl3yqhqkA2L0UVX2PDS6rkNT5sd/tHdxe7hV4aDVVqLLcR
 o5kVWgGF3Vbw6I/BlJbqJGwwnPk1NDfAyBluV4+2JgBDnq5h9hE4GRspq1RjUWed7QIQ
 N06g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=b8CKJQ6KrwwP5Bb1S9rRR890oGlJn0CWNl675sLgaiI=;
 b=Fgg1HOkaBXST0ZCM8XbO/XKTi6G7zasfgdW1GYYUvuQB5RIJyPDeLXFTYz1T2p7H8C
 Ny1rbn/bEHt8SHAxzm3BX6MHzIF3C+2AcmiAkyADP042/eyboTxd6BnjNdhe2vAi3UwQ
 KFfM0BX/Fudan8wycvu8kTpYDq3dJ+yStY2vz7G5PSC8nOqVhukdOEruAnPr/hDS2cbh
 O+vxUcA68/keJYYqSkghGPMWK3OcEe68692LJ27dfjFCkXxSqpl/b1NKT4ieFQHgQH4p
 9xNFwCpDrGDEme7EIUkZuD7xT31zGKgJdfUwTmxp2T2fK2wmnpp5Vpij/yCkwzf+hrsz
 aONw==
X-Gm-Message-State: ACgBeo0/nKtTgEm3Mu2RMk7nbg7TRX2UfZF3BO67JJ/P74MLfTdQXcZs
 4gKfDtkE4xflquNgX9s0DZ+1xIOBUaQA4pmlkOFViw==
X-Google-Smtp-Source: AA6agR7NBxFo0w81Mj0+AcXgatp/8TXrt1MLBIzOe81EzW5VGcXr9sWWOd4yd5JcwvPn/Z3lAmh9zyy6fOFFu+JvrmE=
X-Received: by 2002:ac8:5c8d:0:b0:344:568c:efc4 with SMTP id
 r13-20020ac85c8d000000b00344568cefc4mr4422811qta.557.1661445647796; Thu, 25
 Aug 2022 09:40:47 -0700 (PDT)
MIME-Version: 1.0
References: <20220824094029.1634519-1-bmeng.cn@gmail.com>
 <20220824094029.1634519-44-bmeng.cn@gmail.com>
In-Reply-To: <20220824094029.1634519-44-bmeng.cn@gmail.com>
From: Hao Wu <wuhaotsh@google.com>
Date: Thu, 25 Aug 2022 09:40:37 -0700
Message-ID: <CAGcCb13Lj3_GtNJy=vH6vAjpOvCch4tHy3yAJG921n-uTAvDkQ@mail.gmail.com>
Subject: Re: [PATCH 43/51] tests/qtest: npcm7xx_emc-test: Skip running
 test_{tx, rx} on win32
To: Bin Meng <bmeng.cn@gmail.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>, Bin Meng <bin.meng@windriver.com>,
 Havard Skinnemoen <hskinnemoen@google.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Tyrone Ting <kfting@nuvoton.com>, qemu-arm <qemu-arm@nongnu.org>
Content-Type: multipart/alternative; boundary="000000000000a71c4705e71375ec"
Received-SPF: pass client-ip=2607:f8b0:4864:20::836;
 envelope-from=wuhaotsh@google.com; helo=mail-qt1-x836.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000a71c4705e71375ec
Content-Type: text/plain; charset="UTF-8"

On Wed, Aug 24, 2022 at 3:35 AM Bin Meng <bmeng.cn@gmail.com> wrote:

> From: Bin Meng <bin.meng@windriver.com>
>
> The test cases 'test_{tx,rx}' call socketpair() which does not exist
> on win32. Exclude them.
>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
>
Reviewed-by: Hao Wu <wuhaotsh@google.com>

> ---
>
>  tests/qtest/npcm7xx_emc-test.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/tests/qtest/npcm7xx_emc-test.c
> b/tests/qtest/npcm7xx_emc-test.c
> index a353fef0ca..c373d24e1e 100644
> --- a/tests/qtest/npcm7xx_emc-test.c
> +++ b/tests/qtest/npcm7xx_emc-test.c
> @@ -209,6 +209,7 @@ static int emc_module_index(const EMCModule *mod)
>      return diff;
>  }
>
> +#ifndef _WIN32
>  static void packet_test_clear(void *sockets)
>  {
>      int *test_sockets = sockets;
> @@ -243,6 +244,7 @@ static int *packet_test_init(int module_num, GString
> *cmd_line)
>      g_test_queue_destroy(packet_test_clear, test_sockets);
>      return test_sockets;
>  }
> +#endif /* _WIN32 */
>
>  static uint32_t emc_read(QTestState *qts, const EMCModule *mod,
>                           NPCM7xxPWMRegister regno)
> @@ -250,6 +252,7 @@ static uint32_t emc_read(QTestState *qts, const
> EMCModule *mod,
>      return qtest_readl(qts, mod->base_addr + regno * sizeof(uint32_t));
>  }
>
> +#ifndef _WIN32
>  static void emc_write(QTestState *qts, const EMCModule *mod,
>                        NPCM7xxPWMRegister regno, uint32_t value)
>  {
> @@ -339,6 +342,7 @@ static bool emc_soft_reset(QTestState *qts, const
> EMCModule *mod)
>      g_message("%s: Timeout expired", __func__);
>      return false;
>  }
> +#endif /* _WIN32 */
>
>  /* Check emc registers are reset to default value. */
>  static void test_init(gconstpointer test_data)
> @@ -387,6 +391,7 @@ static void test_init(gconstpointer test_data)
>      qtest_quit(qts);
>  }
>
> +#ifndef _WIN32
>  static bool emc_wait_irq(QTestState *qts, const EMCModule *mod, int step,
>                           bool is_tx)
>  {
> @@ -843,6 +848,7 @@ static void test_rx(gconstpointer test_data)
>
>      qtest_quit(qts);
>  }
> +#endif /* _WIN32 */
>
>  static void emc_add_test(const char *name, const TestData* td,
>                           GTestDataFunc fn)
> @@ -865,8 +871,10 @@ int main(int argc, char **argv)
>          td->module = &emc_module_list[i];
>
>          add_test(init, td);
> +#ifndef _WIN32
>          add_test(tx, td);
>          add_test(rx, td);
> +#endif
>      }
>
>      return g_test_run();
> --
> 2.34.1
>
>
>

--000000000000a71c4705e71375ec
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Aug 24, 2022 at 3:35 AM Bin M=
eng &lt;<a href=3D"mailto:bmeng.cn@gmail.com">bmeng.cn@gmail.com</a>&gt; wr=
ote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">From: Bin M=
eng &lt;<a href=3D"mailto:bin.meng@windriver.com" target=3D"_blank">bin.men=
g@windriver.com</a>&gt;<br>
<br>
The test cases &#39;test_{tx,rx}&#39; call socketpair() which does not exis=
t<br>
on win32. Exclude them.<br>
<br>
Signed-off-by: Bin Meng &lt;<a href=3D"mailto:bin.meng@windriver.com" targe=
t=3D"_blank">bin.meng@windriver.com</a>&gt;<br></blockquote><div>Reviewed-b=
y: Hao Wu &lt;<a href=3D"mailto:wuhaotsh@google.com">wuhaotsh@google.com</a=
>&gt;=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
---<br>
<br>
=C2=A0tests/qtest/npcm7xx_emc-test.c | 8 ++++++++<br>
=C2=A01 file changed, 8 insertions(+)<br>
<br>
diff --git a/tests/qtest/npcm7xx_emc-test.c b/tests/qtest/npcm7xx_emc-test.=
c<br>
index a353fef0ca..c373d24e1e 100644<br>
--- a/tests/qtest/npcm7xx_emc-test.c<br>
+++ b/tests/qtest/npcm7xx_emc-test.c<br>
@@ -209,6 +209,7 @@ static int emc_module_index(const EMCModule *mod)<br>
=C2=A0 =C2=A0 =C2=A0return diff;<br>
=C2=A0}<br>
<br>
+#ifndef _WIN32<br>
=C2=A0static void packet_test_clear(void *sockets)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0int *test_sockets =3D sockets;<br>
@@ -243,6 +244,7 @@ static int *packet_test_init(int module_num, GString *c=
md_line)<br>
=C2=A0 =C2=A0 =C2=A0g_test_queue_destroy(packet_test_clear, test_sockets);<=
br>
=C2=A0 =C2=A0 =C2=A0return test_sockets;<br>
=C2=A0}<br>
+#endif /* _WIN32 */<br>
<br>
=C2=A0static uint32_t emc_read(QTestState *qts, const EMCModule *mod,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 NPCM7xxPWMRegister regno)<br>
@@ -250,6 +252,7 @@ static uint32_t emc_read(QTestState *qts, const EMCModu=
le *mod,<br>
=C2=A0 =C2=A0 =C2=A0return qtest_readl(qts, mod-&gt;base_addr + regno * siz=
eof(uint32_t));<br>
=C2=A0}<br>
<br>
+#ifndef _WIN32<br>
=C2=A0static void emc_write(QTestState *qts, const EMCModule *mod,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0NPCM7xxPWMRegister regno, uint32_t value)<br>
=C2=A0{<br>
@@ -339,6 +342,7 @@ static bool emc_soft_reset(QTestState *qts, const EMCMo=
dule *mod)<br>
=C2=A0 =C2=A0 =C2=A0g_message(&quot;%s: Timeout expired&quot;, __func__);<b=
r>
=C2=A0 =C2=A0 =C2=A0return false;<br>
=C2=A0}<br>
+#endif /* _WIN32 */<br>
<br>
=C2=A0/* Check emc registers are reset to default value. */<br>
=C2=A0static void test_init(gconstpointer test_data)<br>
@@ -387,6 +391,7 @@ static void test_init(gconstpointer test_data)<br>
=C2=A0 =C2=A0 =C2=A0qtest_quit(qts);<br>
=C2=A0}<br>
<br>
+#ifndef _WIN32<br>
=C2=A0static bool emc_wait_irq(QTestState *qts, const EMCModule *mod, int s=
tep,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 bool is_tx)<br>
=C2=A0{<br>
@@ -843,6 +848,7 @@ static void test_rx(gconstpointer test_data)<br>
<br>
=C2=A0 =C2=A0 =C2=A0qtest_quit(qts);<br>
=C2=A0}<br>
+#endif /* _WIN32 */<br>
<br>
=C2=A0static void emc_add_test(const char *name, const TestData* td,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 GTestDataFunc fn)<br>
@@ -865,8 +871,10 @@ int main(int argc, char **argv)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0td-&gt;module =3D &amp;emc_module_list[i]=
;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0add_test(init, td);<br>
+#ifndef _WIN32<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0add_test(tx, td);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0add_test(rx, td);<br>
+#endif<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
=C2=A0 =C2=A0 =C2=A0return g_test_run();<br>
-- <br>
2.34.1<br>
<br>
<br>
</blockquote></div></div>

--000000000000a71c4705e71375ec--

