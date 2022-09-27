Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EEBF5EBF0D
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 11:54:51 +0200 (CEST)
Received: from localhost ([::1]:47808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1od7Ig-0008Au-CC
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 05:54:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48580)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1od6SZ-00072x-3B
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 05:01:00 -0400
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e]:35385)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1od6SW-0007KE-Ig
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 05:00:58 -0400
Received: by mail-lf1-x12e.google.com with SMTP id z25so14740378lfr.2
 for <qemu-devel@nongnu.org>; Tue, 27 Sep 2022 02:00:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=BKDNcQI5MVRecLwvd+fd/9BQ+4Zz5UOnta/2qjoXUfY=;
 b=QSWRC0/gJZqnlGFwqjualZwYUubPiWYG5la8/lvLGVhxWk1fRzW2mf8O4CiolVvF55
 yMpgIBs+1pgkNKe4KWpQXUwKv392CgTbHZJdTm08WiZo0mhB5SFaEfNpbLmjLeXiCDa6
 Y6XAsJBj88XbDmfcgQmzlcGaW77cnK5AYIL7QTbOduz+gp2dTBGjV3a7B20AfHHmulae
 LU3qU6CxLmyzpEwsK5p61Qrmy6a8PNEdGMBSORcbOGxnO29FiNgXZazEC/97z/M6paSa
 x/nr9hpVGtinCcle99TQdPqUJPnAldx72dF5xhTM3t7R2FqX2MLCXPz5yieA+cLmlSBf
 RRYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=BKDNcQI5MVRecLwvd+fd/9BQ+4Zz5UOnta/2qjoXUfY=;
 b=Z+bykY21HVsVB+DXWmRybKy8gLxqV57u+hMhJyNP12rSCHlRrq5i8tTHzlIsASfBvj
 NUAkwD/fh959TkNMTj8QlNbt7Z5u2ByVgNwRJmjiVHiy8bvO0t57BU+MAcjMmWrxll7I
 DyvRfJvAijK8l6k21zfDHKuHLYUoh0JpOPzyWemJBVxrSqZjlmEnZzZr2zA2HHfsGO/F
 FaLyIZvVoZd29uoZooMbm2MMB8wrCx5WaYTMpjXNNthXIOqjgbPGd1vekIdXIBCIvkUw
 /6yzoVIxU/2sPBLuq1+TmdR4WczGXVHpu+q3AXKGqs/C5zjj5ex+j+dJE1f0VpnlNAXY
 XD9Q==
X-Gm-Message-State: ACrzQf0pXMCckZTGWOUjqEFfhHGHJfRCC7UV9vuhpEhQ2PihOVkPknz4
 KXb3TFeZ4C6dI46tDOOsSlfbmw2jcqzu999Aug4=
X-Google-Smtp-Source: AMsMyM56HI+MLNcv5pD++9io/atq+L2aRBjoXBpijfB7bUhb7qRrADw/dapOn0F7z13uwEdSg+KU4B64YSw0grtMYzA=
X-Received: by 2002:a05:6512:201b:b0:497:a29d:25c1 with SMTP id
 a27-20020a056512201b00b00497a29d25c1mr11238588lfb.276.1664269254087; Tue, 27
 Sep 2022 02:00:54 -0700 (PDT)
MIME-Version: 1.0
References: <20220925113032.1949844-1-bmeng.cn@gmail.com>
 <20220925113032.1949844-43-bmeng.cn@gmail.com>
 <CAJ+F1CLh=GzJ4gxQ+dEriC2nMzn5nUM-JBdhRpzai-z-RcPmxA@mail.gmail.com>
 <CAEUhbmX+Nsyf9dFb3D1TT0DaiUGZ4Z_G-ojnJmDXZXngyhqdRg@mail.gmail.com>
In-Reply-To: <CAEUhbmX+Nsyf9dFb3D1TT0DaiUGZ4Z_G-ojnJmDXZXngyhqdRg@mail.gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Tue, 27 Sep 2022 13:00:42 +0400
Message-ID: <CAJ+F1CJjtspCoyH0=hhhRa=J9824sKbnOhcpJh_i9CFQMNuDHQ@mail.gmail.com>
Subject: Re: [PATCH v3 42/54] chardev/char-file: Add FILE_SHARE_WRITE when
 opening the file for win32
To: Bin Meng <bmeng.cn@gmail.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Xuzhou Cheng <xuzhou.cheng@windriver.com>, 
 Bin Meng <bin.meng@windriver.com>, Paolo Bonzini <pbonzini@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000b35c6405e9a4e1c8"
Received-SPF: pass client-ip=2a00:1450:4864:20::12e;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lf1-x12e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000b35c6405e9a4e1c8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Mon, Sep 26, 2022 at 7:05 PM Bin Meng <bmeng.cn@gmail.com> wrote:

> On Mon, Sep 26, 2022 at 9:27 PM Marc-Andr=C3=A9 Lureau
> <marcandre.lureau@gmail.com> wrote:
> >
> > Hi
> >
> > On Sun, Sep 25, 2022 at 4:35 PM Bin Meng <bmeng.cn@gmail.com> wrote:
> >>
> >> From: Xuzhou Cheng <xuzhou.cheng@windriver.com>
> >>
> >> The combination of GENERIC_WRITE and FILE_SHARE_READ options does not
> >> allow the same file to be opened again by CreateFile() from another
> >> QEMU process with the same options when the previous QEMU process
> >> still holds the file handle opened.
> >>
> >> This was triggered by running the test_multifd_tcp_cancel() case on
> >> Windows, which cancels the migration, and launches another QEMU
> >> process to migrate with the same file opened for write. Chances are
> >> that the previous QEMU process does not quit before the new QEMU
> >> process runs hence the old one still holds the file handle that does
> >> not allow shared write permission then the new QEMU process will fail.
> >>
> >> There is another test case boot-serial-test that triggers the same
> >> issue. The qtest executable created a serial chardev file to be
> >> passed to the QEMU executable. The serial file was created by
> >> g_file_open_tmp(), which internally opens the file with
> >> FILE_SHARE_WRITE security attribute, and based on [1], there is
> >> only one case that allows the first call to CreateFile() with
> >> GENERIC_READ & FILE_SHARE_WRITE, and second call to CreateFile()
> >> with GENERIC_WRITE & FILE_SHARE_READ. All other combinations
> >> require FILE_SHARE_WRITE in the second call. But there is no way
> >> for the second call (in this case the QEMU executable) to know
> >> what combination was passed to the first call, so we will have to
> >> add FILE_SHARE_WRITE to the second call.
> >>
> >> For both scenarios we should add FILE_SHARE_WRITE in the chardev
> >> file backend driver. This change also makes the behavior to be
> >> consistent with the POSIX platforms.
> >
> >
> > It seems to me the tests should be fixed instead. I thought you fixed
> the first case. For the second case, why not close the file before starti=
ng
> qemu? If you have issues, I will take a deeper look.
>
> Indeed, the following test case change can "fix" this issue:
>
> diff --git a/tests/qtest/boot-serial-test.c
> b/tests/qtest/boot-serial-test.c
> index 72310ba30e..f192fbc181 100644
> --- a/tests/qtest/boot-serial-test.c
> +++ b/tests/qtest/boot-serial-test.c
> @@ -233,6 +233,7 @@ static void test_machine(const void *data)
> ser_fd =3D g_file_open_tmp("qtest-boot-serial-sXXXXXX", &serialtmp, NULL)=
;
> g_assert(ser_fd !=3D -1);
> + close(ser_fd);
> if (test->kernel) {
> code =3D test->kernel;
> @@ -266,6 +267,7 @@ static void test_machine(const void *data)
> unlink(codetmp);
> }
> + ser_fd =3D open(serialtmp, O_RDONLY);
> if (!check_guest_output(qts, test, ser_fd)) {
> g_error("Failed to find expected string. Please check '%s'",
> serialtmp);
>
>
Please send this fix as a new patch in the series.


> But I think it just workarounds the problem. The original test case
> looks reasonable to me. If we update the case like above, we cannot
> guarantee users will do like the updated test case does.
>

If the test is enabled, it will fail, and the reasons are reasonably valid:
two processes shouldn't share the same file for writing with a chardev.

I still think the windows file chardev behavior is superior and we should
instead teach the posix implementation of exclusive write access, rather
than downgrading the windows implementation. I'd drop this patch from the
series for now.


>
> >
> >>
> >>
> >> [1]
> https://docs.microsoft.com/en-us/windows/win32/fileio/creating-and-openin=
g-files
> >>
> >> Signed-off-by: Xuzhou Cheng <xuzhou.cheng@windriver.com>
> >> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> >> ---
> >>
> >> Changes in v3:
> >> - Add another case "boot-serial-test" to justify the change
> >>
> >> Changes in v2:
> >> - Update commit message to include the use case why we should set
> >>   FILE_SHARE_WRITE when opening the file for win32
> >>
> >>  chardev/char-file.c | 4 ++--
> >>  1 file changed, 2 insertions(+), 2 deletions(-)
> >>
>
> Regards,
> Bin
>


--=20
Marc-Andr=C3=A9 Lureau

--000000000000b35c6405e9a4e1c8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Sep 26, 2022 at 7:05 PM Bin=
 Meng &lt;<a href=3D"mailto:bmeng.cn@gmail.com">bmeng.cn@gmail.com</a>&gt; =
wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Mon, S=
ep 26, 2022 at 9:27 PM Marc-Andr=C3=A9 Lureau<br>
&lt;<a href=3D"mailto:marcandre.lureau@gmail.com" target=3D"_blank">marcand=
re.lureau@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Hi<br>
&gt;<br>
&gt; On Sun, Sep 25, 2022 at 4:35 PM Bin Meng &lt;<a href=3D"mailto:bmeng.c=
n@gmail.com" target=3D"_blank">bmeng.cn@gmail.com</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; From: Xuzhou Cheng &lt;<a href=3D"mailto:xuzhou.cheng@windriver.co=
m" target=3D"_blank">xuzhou.cheng@windriver.com</a>&gt;<br>
&gt;&gt;<br>
&gt;&gt; The combination of GENERIC_WRITE and FILE_SHARE_READ options does =
not<br>
&gt;&gt; allow the same file to be opened again by CreateFile() from anothe=
r<br>
&gt;&gt; QEMU process with the same options when the previous QEMU process<=
br>
&gt;&gt; still holds the file handle opened.<br>
&gt;&gt;<br>
&gt;&gt; This was triggered by running the test_multifd_tcp_cancel() case o=
n<br>
&gt;&gt; Windows, which cancels the migration, and launches another QEMU<br=
>
&gt;&gt; process to migrate with the same file opened for write. Chances ar=
e<br>
&gt;&gt; that the previous QEMU process does not quit before the new QEMU<b=
r>
&gt;&gt; process runs hence the old one still holds the file handle that do=
es<br>
&gt;&gt; not allow shared write permission then the new QEMU process will f=
ail.<br>
&gt;&gt;<br>
&gt;&gt; There is another test case boot-serial-test that triggers the same=
<br>
&gt;&gt; issue. The qtest executable created a serial chardev file to be<br=
>
&gt;&gt; passed to the QEMU executable. The serial file was created by<br>
&gt;&gt; g_file_open_tmp(), which internally opens the file with<br>
&gt;&gt; FILE_SHARE_WRITE security attribute, and based on [1], there is<br=
>
&gt;&gt; only one case that allows the first call to CreateFile() with<br>
&gt;&gt; GENERIC_READ &amp; FILE_SHARE_WRITE, and second call to CreateFile=
()<br>
&gt;&gt; with GENERIC_WRITE &amp; FILE_SHARE_READ. All other combinations<b=
r>
&gt;&gt; require FILE_SHARE_WRITE in the second call. But there is no way<b=
r>
&gt;&gt; for the second call (in this case the QEMU executable) to know<br>
&gt;&gt; what combination was passed to the first call, so we will have to<=
br>
&gt;&gt; add FILE_SHARE_WRITE to the second call.<br>
&gt;&gt;<br>
&gt;&gt; For both scenarios we should add FILE_SHARE_WRITE in the chardev<b=
r>
&gt;&gt; file backend driver. This change also makes the behavior to be<br>
&gt;&gt; consistent with the POSIX platforms.<br>
&gt;<br>
&gt;<br>
&gt; It seems to me the tests should be fixed instead. I thought you fixed =
the first case. For the second case, why not close the file before starting=
 qemu? If you have issues, I will take a deeper look.<br>
<br>
Indeed, the following test case change can &quot;fix&quot; this issue:<br>
<br>
diff --git a/tests/qtest/boot-serial-test.c b/tests/qtest/boot-serial-test.=
c<br>
index 72310ba30e..f192fbc181 100644<br>
--- a/tests/qtest/boot-serial-test.c<br>
+++ b/tests/qtest/boot-serial-test.c<br>
@@ -233,6 +233,7 @@ static void test_machine(const void *data)<br>
ser_fd =3D g_file_open_tmp(&quot;qtest-boot-serial-sXXXXXX&quot;, &amp;seri=
altmp, NULL);<br>
g_assert(ser_fd !=3D -1);<br>
+ close(ser_fd);<br>
if (test-&gt;kernel) {<br>
code =3D test-&gt;kernel;<br>
@@ -266,6 +267,7 @@ static void test_machine(const void *data)<br>
unlink(codetmp);<br>
}<br>
+ ser_fd =3D open(serialtmp, O_RDONLY);<br>
if (!check_guest_output(qts, test, ser_fd)) {<br>
g_error(&quot;Failed to find expected string. Please check &#39;%s&#39;&quo=
t;,<br>
serialtmp);<br>
<br></blockquote><div><br></div><div>Please send this fix as a new patch in=
 the series.</div><div>=C2=A0<br></div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex">
But I think it just workarounds the problem. The original test case<br>
looks reasonable to me. If we update the case like above, we cannot<br>
guarantee users will do like the updated test case does.<br></blockquote><d=
iv><br></div><div>If the test is enabled, it will fail, and the reasons are=
 reasonably valid: two processes shouldn&#39;t share the same file for writ=
ing with a chardev.</div><div><br></div><div>I still think the windows file=
 chardev behavior is superior and we should instead teach the posix impleme=
ntation of exclusive write access, rather than downgrading the windows impl=
ementation. I&#39;d drop this patch from the series for now.<br></div><div>=
=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; [1] <a href=3D"https://docs.microsoft.com/en-us/windows/win32/file=
io/creating-and-opening-files" rel=3D"noreferrer" target=3D"_blank">https:/=
/docs.microsoft.com/en-us/windows/win32/fileio/creating-and-opening-files</=
a><br>
&gt;&gt;<br>
&gt;&gt; Signed-off-by: Xuzhou Cheng &lt;<a href=3D"mailto:xuzhou.cheng@win=
driver.com" target=3D"_blank">xuzhou.cheng@windriver.com</a>&gt;<br>
&gt;&gt; Signed-off-by: Bin Meng &lt;<a href=3D"mailto:bin.meng@windriver.c=
om" target=3D"_blank">bin.meng@windriver.com</a>&gt;<br>
&gt;&gt; ---<br>
&gt;&gt;<br>
&gt;&gt; Changes in v3:<br>
&gt;&gt; - Add another case &quot;boot-serial-test&quot; to justify the cha=
nge<br>
&gt;&gt;<br>
&gt;&gt; Changes in v2:<br>
&gt;&gt; - Update commit message to include the use case why we should set<=
br>
&gt;&gt;=C2=A0 =C2=A0FILE_SHARE_WRITE when opening the file for win32<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 chardev/char-file.c | 4 ++--<br>
&gt;&gt;=C2=A0 1 file changed, 2 insertions(+), 2 deletions(-)<br>
&gt;&gt;<br>
<br>
Regards,<br>
Bin<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--000000000000b35c6405e9a4e1c8--

