Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 692425EA784
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Sep 2022 15:42:18 +0200 (CEST)
Received: from localhost ([::1]:37754 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocoNF-0005ox-2F
	for lists+qemu-devel@lfdr.de; Mon, 26 Sep 2022 09:42:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1oco3S-0001Rj-Sh
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 09:21:51 -0400
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134]:33645)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1oco3R-000346-5Y
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 09:21:50 -0400
Received: by mail-lf1-x134.google.com with SMTP id d42so10904556lfv.0
 for <qemu-devel@nongnu.org>; Mon, 26 Sep 2022 06:21:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=5EcPB8LuvoCygc1QU5nlRAYMYMoKo9d9YZCJ+gG5WYA=;
 b=XH7VOcyGpFk6T1ZZgofQs0InoTPD+kW1tBnDCt1dTV8daSERg6Alu7tEBYXzMppcO4
 nhaOyU/ATWyHqLNLi/Ybh2PtBeyZ0yc/tkOy9PWwgjsz/cz3ZnM8pPD4ydF3lceQMIYs
 tdM8HJzeEHIDtfKnWAWJoCPVfI/7p2bEZmrg1Wo8W8hWtg0crCOHTKCnmDIbKECqEjFN
 7S8/Vhu5yWP2XwTWMgf9ZBJZJVy465z1sxADggzX3COPClPtD/FzELvZQac2IpqajRPq
 CdpuxOpkxw/io/A6fiUEEPGUkb02HLgRV0GGCVPPoqsSC6TG0NmbdNoY/PDl7q1qfxpS
 0LcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=5EcPB8LuvoCygc1QU5nlRAYMYMoKo9d9YZCJ+gG5WYA=;
 b=Y7vMFp2gaQogeZQxexV/UIshKcV/T46TlM9r97/g1cM5Y+HhmpnH9Vzii5uYeWUpDq
 ZX05feyQqzTMLas6eVJXkD5aAhJxV612z8NNzKYTuG6B9cp8Zb5w1wpPdv6v6w5sPVin
 kRGoPb3U4eNVhNdKD7FrA8PINDLSBrdlUcPtPxOrV+n1wmwPfxr1tKw2Ib3zuAjeFzT/
 +chZZkXMOm0ApRgSa0XHAp6LN7vXrwU8myo9S53MdlFfS4aUa8KoUwm3iLrFA0WNGR2v
 Z6x8edosSUUMJ/yL2PTNJH3mfG97JZK+ntxrtcMRjNIHjctV+RBPTLVB6WSAMhQkHGZg
 +MVA==
X-Gm-Message-State: ACrzQf1xy5c+sHpfg02mtSNIerMW5dUNOcOP1zpkOQoOUK+qDhROMx+x
 jXUtcdAiNTJ00DqZHsZvIeHEFDgZJgZKN7mbDQA=
X-Google-Smtp-Source: AMsMyM6PYqNrQvZLo2rlqAwfbu4KyPFXKtX+EUI/UsR8kWhRFBootckgmUEQN+HFqhYpP9Mcc5L7d/GXJbgqSKo6dkM=
X-Received: by 2002:a05:6512:6c9:b0:49a:51d4:d517 with SMTP id
 u9-20020a05651206c900b0049a51d4d517mr9141457lff.329.1664198507599; Mon, 26
 Sep 2022 06:21:47 -0700 (PDT)
MIME-Version: 1.0
References: <20220925113032.1949844-1-bmeng.cn@gmail.com>
 <20220925113032.1949844-21-bmeng.cn@gmail.com>
In-Reply-To: <20220925113032.1949844-21-bmeng.cn@gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Mon, 26 Sep 2022 17:21:36 +0400
Message-ID: <CAJ+F1CKtCkf+GXX=Acq43xeNHgrDGyvvPpdiJHz=W9fH0+kPKA@mail.gmail.com>
Subject: Re: [PATCH v3 20/54] tests/qtest: virtio-scsi-test: Avoid using
 hardcoded /tmp
To: Bin Meng <bmeng.cn@gmail.com>
Cc: qemu-devel@nongnu.org, Bin Meng <bin.meng@windriver.com>, 
 Fam Zheng <fam@euphon.net>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000e19b6405e99468f3"
Received-SPF: pass client-ip=2a00:1450:4864:20::134;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lf1-x134.google.com
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

--000000000000e19b6405e99468f3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 25, 2022 at 4:10 PM Bin Meng <bmeng.cn@gmail.com> wrote:

> From: Bin Meng <bin.meng@windriver.com>
>
> This case was written to use hardcoded /tmp directory for temporary
> files. Update to use g_file_open_tmp() for a portable implementation.
>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>


> ---
>
> Changes in v3:
> - Split to a separate patch
> - Ensure g_autofree variable is initialized
>
>  tests/qtest/virtio-scsi-test.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/tests/qtest/virtio-scsi-test.c
> b/tests/qtest/virtio-scsi-test.c
> index 8ceb12aacd..ceaa7f2415 100644
> --- a/tests/qtest/virtio-scsi-test.c
> +++ b/tests/qtest/virtio-scsi-test.c
> @@ -268,7 +268,7 @@ static void test_iothread_attach_node(void *obj, void
> *data,
>      QVirtioSCSIPCI *scsi_pci =3D obj;
>      QVirtioSCSI *scsi =3D &scsi_pci->scsi;
>      QVirtioSCSIQueues *vs;
> -    char tmp_path[] =3D "/tmp/qtest.XXXXXX";
> +    g_autofree char *tmp_path =3D NULL;
>      int fd;
>      int ret;
>
> @@ -282,7 +282,7 @@ static void test_iothread_attach_node(void *obj, void
> *data,
>      vs =3D qvirtio_scsi_init(scsi->vdev);
>
>      /* Create a temporary qcow2 overlay*/
> -    fd =3D mkstemp(tmp_path);
> +    fd =3D g_file_open_tmp("qtest.XXXXXX", &tmp_path, NULL);
>      g_assert(fd >=3D 0);
>      close(fd);
>
> --
> 2.34.1
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--000000000000e19b6405e99468f3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Sun, Sep 25, 2022 at 4:10 PM Bin M=
eng &lt;<a href=3D"mailto:bmeng.cn@gmail.com">bmeng.cn@gmail.com</a>&gt; wr=
ote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">From: Bin M=
eng &lt;<a href=3D"mailto:bin.meng@windriver.com" target=3D"_blank">bin.men=
g@windriver.com</a>&gt;<br>
<br>
This case was written to use hardcoded /tmp directory for temporary<br>
files. Update to use g_file_open_tmp() for a portable implementation.<br>
<br>
Signed-off-by: Bin Meng &lt;<a href=3D"mailto:bin.meng@windriver.com" targe=
t=3D"_blank">bin.meng@windriver.com</a>&gt;<br></blockquote><div><br></div>=
<div><div>Reviewed-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcand=
re.lureau@redhat.com">marcandre.lureau@redhat.com</a>&gt;</div>=C2=A0</div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">
---<br>
<br>
Changes in v3:<br>
- Split to a separate patch<br>
- Ensure g_autofree variable is initialized<br>
<br>
=C2=A0tests/qtest/virtio-scsi-test.c | 4 ++--<br>
=C2=A01 file changed, 2 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/tests/qtest/virtio-scsi-test.c b/tests/qtest/virtio-scsi-test.=
c<br>
index 8ceb12aacd..ceaa7f2415 100644<br>
--- a/tests/qtest/virtio-scsi-test.c<br>
+++ b/tests/qtest/virtio-scsi-test.c<br>
@@ -268,7 +268,7 @@ static void test_iothread_attach_node(void *obj, void *=
data,<br>
=C2=A0 =C2=A0 =C2=A0QVirtioSCSIPCI *scsi_pci =3D obj;<br>
=C2=A0 =C2=A0 =C2=A0QVirtioSCSI *scsi =3D &amp;scsi_pci-&gt;scsi;<br>
=C2=A0 =C2=A0 =C2=A0QVirtioSCSIQueues *vs;<br>
-=C2=A0 =C2=A0 char tmp_path[] =3D &quot;/tmp/qtest.XXXXXX&quot;;<br>
+=C2=A0 =C2=A0 g_autofree char *tmp_path =3D NULL;<br>
=C2=A0 =C2=A0 =C2=A0int fd;<br>
=C2=A0 =C2=A0 =C2=A0int ret;<br>
<br>
@@ -282,7 +282,7 @@ static void test_iothread_attach_node(void *obj, void *=
data,<br>
=C2=A0 =C2=A0 =C2=A0vs =3D qvirtio_scsi_init(scsi-&gt;vdev);<br>
<br>
=C2=A0 =C2=A0 =C2=A0/* Create a temporary qcow2 overlay*/<br>
-=C2=A0 =C2=A0 fd =3D mkstemp(tmp_path);<br>
+=C2=A0 =C2=A0 fd =3D g_file_open_tmp(&quot;qtest.XXXXXX&quot;, &amp;tmp_pa=
th, NULL);<br>
=C2=A0 =C2=A0 =C2=A0g_assert(fd &gt;=3D 0);<br>
=C2=A0 =C2=A0 =C2=A0close(fd);<br>
<br>
-- <br>
2.34.1<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--000000000000e19b6405e99468f3--

