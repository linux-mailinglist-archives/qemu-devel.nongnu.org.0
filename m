Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CA203B110D
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Jun 2021 02:25:51 +0200 (CEST)
Received: from localhost ([::1]:48868 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvqiD-0005eP-JW
	for lists+qemu-devel@lfdr.de; Tue, 22 Jun 2021 20:25:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35000)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cyruscyliu@gmail.com>)
 id 1lvqhN-0004qo-UA
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 20:24:57 -0400
Received: from mail-oi1-x233.google.com ([2607:f8b0:4864:20::233]:43931)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cyruscyliu@gmail.com>)
 id 1lvqhL-0001oF-MV
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 20:24:57 -0400
Received: by mail-oi1-x233.google.com with SMTP id x196so1366918oif.10
 for <qemu-devel@nongnu.org>; Tue, 22 Jun 2021 17:24:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=Okk8+VeaPzE6QcQxg7837Q7rxZcL2AUuxE3NcHF6pcs=;
 b=qcmFJA88iAL9ntSyo4DewBq26BUe4e7wfaKy4G6u/a4cgdHR5J12EZjulPgzJvcxy3
 TEMJgb1eX6yKVXC6DYyzfJfPIe+ZdlSBzbQ47UiWhSXlRCxI+fD7JRIA2+0YYebvmPKw
 wDHS9jVt2QaW/7SxaOZFxBO0ywEK/HK4JrJXdwQw3Oyob2wl8stKBKTDpbmD6EyOwMzE
 p0/YzpZnxAN0De5JKdxfL64Blhgt8l85oupRLaSzDKJKFEH4I42C3DUWqhD4mVpsXAgg
 raC0DPxCBL0uhN01MobIOwRgn3pKTHIqC0tmkZUFLiJH6at1SXPO501IA9qlZdECfDYN
 OPoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=Okk8+VeaPzE6QcQxg7837Q7rxZcL2AUuxE3NcHF6pcs=;
 b=BtiHuadNNAFbUzmZ2riFVb368gaNTyU+OeWayAYG87dWOgN5DkbGcUcUshRrFOWIZy
 ywvSdUWAa0yUGCf2zPnKIqZtOUo490+ID2yU/eZS3KkW0A9bcyhg4YnRgCammIaueov6
 l+qcNVdLIVpRTwxJH4LNbKdbZb6h9cTGgMxKafGSuaSfVLho0/U0GMVixTmokeEzi3O3
 aYPf7ArOB/V4yYp35hahfKiHA1KH8IBq/pcsA8JReFNg52S6wA+CzPsBGtpMx17S0uS8
 v79YT6QtTfUNIUP2Lz1bJSbL3pc7lrffOcdxOnBlvUl51pVYJLfVorKIqodAjQ7CsvwD
 bNqg==
X-Gm-Message-State: AOAM532XTIzk/jDIBJsZVdYhMGaDhcwwo+YWcIQp8XaWNmAENmYNgYGz
 ZqdUeQS2hEXnxu1oTI/WCl5wCh2YGPdlpxniIcVTdy/EmkQ=
X-Google-Smtp-Source: ABdhPJyTWSdCQF/+DRiMyS0Inuu/k0SviiCtAmZnpKprdNFN6JAPXCLiN/BkLYMoswzCq+XuTgrQqIdCx06YSgbaMDc=
X-Received: by 2002:aca:b5c3:: with SMTP id e186mr1043206oif.43.1624407894200; 
 Tue, 22 Jun 2021 17:24:54 -0700 (PDT)
MIME-Version: 1.0
References: <CAAKa2jkj=rJVhOuE9XXC9ccsAt=2vg3_MO_NDL3OL98ALHMeFw@mail.gmail.com>
In-Reply-To: <CAAKa2jkj=rJVhOuE9XXC9ccsAt=2vg3_MO_NDL3OL98ALHMeFw@mail.gmail.com>
From: Qiang Liu <cyruscyliu@gmail.com>
Date: Wed, 23 Jun 2021 08:24:42 +0800
Message-ID: <CAAKa2jnbOLuaDbhaVT9Pc7BVfdJ632hpbFBsfk7eCW3evzzsgA@mail.gmail.com>
Subject: [PATCH] hw/audio/sb16: Restrict I/O sampling rate range for command
 41h/42h
To: qemu-devel@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: multipart/alternative; boundary="00000000000081135705c563ef65"
Received-SPF: pass client-ip=2607:f8b0:4864:20::233;
 envelope-from=cyruscyliu@gmail.com; helo=mail-oi1-x233.google.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, URI_DOTEDU=1.999 autolearn=no autolearn_force=no
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

--00000000000081135705c563ef65
Content-Type: text/plain; charset="UTF-8"

The I/O sampling rate range is enforced to 5000 to 45000HZ according to
commit a2cd86a9. Setting I/O sampling rate with command 41h/42h, a guest
user can break this assumption and trigger an assertion in audio_calloc
via command 0xd4. This patch restricts the I/O sampling rate range for
command 41h/42h.

Fixes: 85571bc7415 ("audio merge (malc)")
Signed-off-by: Qiang Liu <cyruscyliu@gmail.com>
---
 hw/audio/sb16.c              | 31 +++++++++++++++++++------------
 tests/qtest/fuzz-sb16-test.c | 17 +++++++++++++++++
 2 files changed, 36 insertions(+), 12 deletions(-)

diff --git a/hw/audio/sb16.c b/hw/audio/sb16.c
index 5cf121f..60f1f75 100644
--- a/hw/audio/sb16.c
+++ b/hw/audio/sb16.c
@@ -229,6 +229,23 @@ static void continue_dma8 (SB16State *s)
     control (s, 1);
 }

+static inline int restrict_sampling_rate(int freq)
+{
+    if (freq < SAMPLE_RATE_MIN) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "sampling range too low: %d, increasing to %u\n",
+                      freq, SAMPLE_RATE_MIN);
+        return SAMPLE_RATE_MIN;
+    } else if (freq > SAMPLE_RATE_MAX) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "sampling range too high: %d, decreasing to %u\n",
+                      freq, SAMPLE_RATE_MAX);
+        return SAMPLE_RATE_MAX;
+    } else {
+        return freq;
+    }
+}
+
 static void dma_cmd8 (SB16State *s, int mask, int dma_len)
 {
     s->fmt = AUDIO_FORMAT_U8;
@@ -244,17 +261,7 @@ static void dma_cmd8 (SB16State *s, int mask, int
dma_len)
         int tmp = (256 - s->time_const);
         s->freq = (1000000 + (tmp / 2)) / tmp;
     }
-    if (s->freq < SAMPLE_RATE_MIN) {
-        qemu_log_mask(LOG_GUEST_ERROR,
-                      "sampling range too low: %d, increasing to %u\n",
-                      s->freq, SAMPLE_RATE_MIN);
-        s->freq = SAMPLE_RATE_MIN;
-    } else if (s->freq > SAMPLE_RATE_MAX) {
-        qemu_log_mask(LOG_GUEST_ERROR,
-                      "sampling range too high: %d, decreasing to %u\n",
-                      s->freq, SAMPLE_RATE_MAX);
-        s->freq = SAMPLE_RATE_MAX;
-    }
+    s->freq = restrict_sampling_rate(s->freq);

     if (dma_len != -1) {
         s->block_size = dma_len << s->fmt_stereo;
@@ -768,7 +775,7 @@ static void complete (SB16State *s)
              * and FT2 sets output freq with this (go figure).  Compare:
              *
http://homepages.cae.wisc.edu/~brodskye/sb16doc/sb16doc.html#SamplingRate
              */
-            s->freq = dsp_get_hilo (s);
+            s->freq = restrict_sampling_rate(dsp_get_hilo(s));
             ldebug ("set freq %d\n", s->freq);
             break;

diff --git a/tests/qtest/fuzz-sb16-test.c b/tests/qtest/fuzz-sb16-test.c
index 51030cd..f47a8bc 100644
--- a/tests/qtest/fuzz-sb16-test.c
+++ b/tests/qtest/fuzz-sb16-test.c
@@ -37,6 +37,22 @@ static void test_fuzz_sb16_0x91(void)
     qtest_quit(s);
 }

+/*
+ * This used to trigger the assert in audio_calloc
+ * through command 0xd4
+ */
+static void test_fuzz_sb16_0xd4(void)
+{
+    QTestState *s = qtest_init("-M pc -display none "
+                               "-device sb16,audiodev=none "
+                               "-audiodev id=none,driver=none");
+    qtest_outb(s, 0x22c, 0x41);
+    qtest_outb(s, 0x22c, 0x00);
+    qtest_outb(s, 0x22c, 0x14);
+    qtest_outb(s, 0x22c, 0xd4);
+    qtest_quit(s);
+}
+
 int main(int argc, char **argv)
 {
     const char *arch = qtest_get_arch();
@@ -46,6 +62,7 @@ int main(int argc, char **argv)
    if (strcmp(arch, "i386") == 0) {
         qtest_add_func("fuzz/test_fuzz_sb16/1c", test_fuzz_sb16_0x1c);
         qtest_add_func("fuzz/test_fuzz_sb16/91", test_fuzz_sb16_0x91);
+        qtest_add_func("fuzz/test_fuzz_sb16/d4", test_fuzz_sb16_0xd4);
    }

    return g_test_run();
--
2.7.4

--00000000000081135705c563ef65
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr"><span style=3D"font-family:arial,sans-serif">The I/O sampling rate r=
ange is enforced to 5000 to 45000HZ according to</span><br></div><div dir=
=3D"ltr"><font face=3D"arial, sans-serif">commit a2cd86a9. Setting I/O samp=
ling rate with command 41h/42h, a guest<br>user can break this assumption a=
nd trigger an assertion in audio_calloc<br>via command 0xd4. This patch res=
tricts the I/O sampling rate range for<br>command 41h/42h.<br><br>Fixes: 85=
571bc7415 (&quot;audio merge (malc)&quot;)<br>Signed-off-by: Qiang Liu &lt;=
<a href=3D"mailto:cyruscyliu@gmail.com" target=3D"_blank" style=3D"">cyrusc=
yliu@gmail.com</a>&gt;<br>---<br>=C2=A0hw/audio/sb16.c =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 31 +++++++++++++++++++------------<br>=C2=A0t=
ests/qtest/fuzz-sb16-test.c | 17 +++++++++++++++++<br>=C2=A02 files changed=
, 36 insertions(+), 12 deletions(-)<br><br>diff --git a/hw/audio/sb16.c b/h=
w/audio/sb16.c<br>index 5cf121f..60f1f75 100644<br>--- a/hw/audio/sb16.c<br=
>+++ b/hw/audio/sb16.c<br>@@ -229,6 +229,23 @@ static void continue_dma8 (S=
B16State *s)<br>=C2=A0 =C2=A0 =C2=A0control (s, 1);<br>=C2=A0}<br><br>+stat=
ic inline int restrict_sampling_rate(int freq)<br>+{<br>+ =C2=A0 =C2=A0if (=
freq &lt; SAMPLE_RATE_MIN) {<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0qemu_log_mask(=
LOG_GUEST_ERROR,<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0&quot;sampling range too low: %d, increasing to %u\=
n&quot;,<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0freq, SAMPLE_RATE_MIN);<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0re=
turn SAMPLE_RATE_MIN;<br>+ =C2=A0 =C2=A0} else if (freq &gt; SAMPLE_RATE_MA=
X) {<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0qemu_log_mask(LOG_GUEST_ERROR,<br>+ =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0&quot;sampling range too high: %d, decreasing to %u\n&quot;,<br>+ =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0freq,=
 SAMPLE_RATE_MAX);<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0return SAMPLE_RATE_MAX;<=
br>+ =C2=A0 =C2=A0} else {<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0return freq;<br>=
+ =C2=A0 =C2=A0}<br>+}<br>+<br>=C2=A0static void dma_cmd8 (SB16State *s, in=
t mask, int dma_len)<br>=C2=A0{<br>=C2=A0 =C2=A0 =C2=A0s-&gt;fmt =3D AUDIO_=
FORMAT_U8;<br>@@ -244,17 +261,7 @@ static void dma_cmd8 (SB16State *s, int =
mask, int dma_len)<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int tmp =3D (256 - =
s-&gt;time_const);<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0s-&gt;freq =3D (100=
0000 + (tmp / 2)) / tmp;<br>=C2=A0 =C2=A0 =C2=A0}<br>- =C2=A0 =C2=A0if (s-&=
gt;freq &lt; SAMPLE_RATE_MIN) {<br>- =C2=A0 =C2=A0 =C2=A0 =C2=A0qemu_log_ma=
sk(LOG_GUEST_ERROR,<br>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;sampling range too low: %d, increasing to =
%u\n&quot;,<br>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0s-&gt;freq, SAMPLE_RATE_MIN);<br>- =C2=A0 =C2=A0 =C2=A0=
 =C2=A0s-&gt;freq =3D SAMPLE_RATE_MIN;<br>- =C2=A0 =C2=A0} else if (s-&gt;f=
req &gt; SAMPLE_RATE_MAX) {<br>- =C2=A0 =C2=A0 =C2=A0 =C2=A0qemu_log_mask(L=
OG_GUEST_ERROR,<br>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0&quot;sampling range too high: %d, decreasing to %u=
\n&quot;,<br>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0s-&gt;freq, SAMPLE_RATE_MAX);<br>- =C2=A0 =C2=A0 =C2=A0 =
=C2=A0s-&gt;freq =3D SAMPLE_RATE_MAX;<br>- =C2=A0 =C2=A0}<br>+ =C2=A0 =C2=
=A0s-&gt;freq =3D restrict_sampling_rate(s-&gt;freq);<br><br>=C2=A0 =C2=A0 =
=C2=A0if (dma_len !=3D -1) {<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0s-&gt;blo=
ck_size =3D dma_len &lt;&lt; s-&gt;fmt_stereo;<br>@@ -768,7 +775,7 @@ stati=
c void complete (SB16State *s)<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 * and FT2 sets output freq with this (go figure).=C2=A0 Compare:<br=
>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * <a href=3D"http://homep=
ages.cae.wisc.edu/~brodskye/sb16doc/sb16doc.html#SamplingRate" target=3D"_b=
lank" style=3D"">http://homepages.cae.wisc.edu/~brodskye/sb16doc/sb16doc.ht=
ml#SamplingRate</a><br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<=
br>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0s-&gt;freq =3D dsp_get_hilo (=
s);<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0s-&gt;freq =3D restrict_s=
ampling_rate(dsp_get_hilo(s));<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0ldebug (&quot;set freq %d\n&quot;, s-&gt;freq);<br>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br><br>diff --git a/tests/qtest/fuzz-=
sb16-test.c b/tests/qtest/fuzz-sb16-test.c<br>index 51030cd..f47a8bc 100644=
<br>--- a/tests/qtest/fuzz-sb16-test.c<br>+++ b/tests/qtest/fuzz-sb16-test.=
c<br>@@ -37,6 +37,22 @@ static void test_fuzz_sb16_0x91(void)<br>=C2=A0 =C2=
=A0 =C2=A0qtest_quit(s);<br>=C2=A0}<br><br>+/*<br>+ * This used to trigger =
the assert in audio_calloc<br>+ * through command 0xd4<br>+ */<br>+static v=
oid test_fuzz_sb16_0xd4(void)<br>+{<br>+ =C2=A0 =C2=A0QTestState *s =3D qte=
st_init(&quot;-M pc -display none &quot;<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 &quot;-device sb16,audiodev=3Dnone &quot;<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 &quot;-audiodev id=3Dnone,driver=3Dnone&quot;);<br>+ =C2=A0 =C2=A0qt=
est_outb(s, 0x22c, 0x41);<br>+ =C2=A0 =C2=A0qtest_outb(s, 0x22c, 0x00);<br>=
+ =C2=A0 =C2=A0qtest_outb(s, 0x22c, 0x14);<br>+ =C2=A0 =C2=A0qtest_outb(s, =
0x22c, 0xd4);<br>+ =C2=A0 =C2=A0qtest_quit(s);<br>+}<br>+<br>=C2=A0int main=
(int argc, char **argv)<br>=C2=A0{<br>=C2=A0 =C2=A0 =C2=A0const char *arch =
=3D qtest_get_arch();<br>@@ -46,6 +62,7 @@ int main(int argc, char **argv)<=
br>=C2=A0 =C2=A0 if (strcmp(arch, &quot;i386&quot;) =3D=3D 0) {<br>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0qtest_add_func(&quot;fuzz/test_fuzz_sb16/1c&quot=
;, test_fuzz_sb16_0x1c);<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qtest_add_fun=
c(&quot;fuzz/test_fuzz_sb16/91&quot;, test_fuzz_sb16_0x91);<br>+ =C2=A0 =C2=
=A0 =C2=A0 =C2=A0qtest_add_func(&quot;fuzz/test_fuzz_sb16/d4&quot;, test_fu=
zz_sb16_0xd4);<br>=C2=A0 =C2=A0 }<br><br>=C2=A0 =C2=A0 return g_test_run();=
<br>--<br>2.7.4</font></div>
</div></div>

--00000000000081135705c563ef65--

