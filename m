Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A89674ED6A4
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Mar 2022 11:17:46 +0200 (CEST)
Received: from localhost ([::1]:58228 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZqw5-0006Bc-GY
	for lists+qemu-devel@lfdr.de; Thu, 31 Mar 2022 05:17:45 -0400
Received: from eggs.gnu.org ([209.51.188.92]:36662)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1nZqbo-0002dG-7p
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 04:56:55 -0400
Received: from [2a00:1450:4864:20::434] (port=41782
 helo=mail-wr1-x434.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1nZqbk-000328-9b
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 04:56:47 -0400
Received: by mail-wr1-x434.google.com with SMTP id h23so32718609wrb.8
 for <qemu-devel@nongnu.org>; Thu, 31 Mar 2022 01:56:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FcUC+CqJxfStT+z2FWz64cKPro4WJoymHFX7Wr33H3c=;
 b=JKoRG8M2DZHnzmP3gYAoXtO9j9ZYuaNH5OtGKLpiF4DwqGoZZooptPT+MqifQAMsNe
 Ib+KUwebApNpMRS3OK4tr/1CPyTX5WUqtbJnGk1ITOTw29sqG4qf0kvRzQF3P18TRzHt
 8SwuqAAzCteaYfpThwVxIkv40JSPWsdHDdMfPqzRz8OAcyjAhlKpXJXIqDYxkBsM9Kes
 bcYfR+dMjTlxjJ292mAty52AQG5OSJt03r0Zrpwv1JlUjOxubHUJAdSpquu177VVzM86
 isUmtj9OaEitBYjEmITcpY261QSN8QxRqt1gNhBjEw2BHhCjsZ3fO/ssIAAzG4dxXgkF
 92FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FcUC+CqJxfStT+z2FWz64cKPro4WJoymHFX7Wr33H3c=;
 b=DIK1Zz12GGAwSOKWAnFaTwfL0+QpMs2eX0t2dRmDr1FAPhqhMhrIZZ+q1pZkun85C/
 aTm78Np90c1BThIOOzakl4v4E8zNLds61YzL/spbfMWAouDgy0pNaQ99b/bCN8Ze60Rp
 YWnxLAIyj5szwLJ2PPzB4UwZcXZiqd0jdiO2r2AN88Zl2xS3vYsBGiWE+Sn24xtmen12
 FM1yQwRb73qpLtGU+n4w2rTDanVe1zOzL+YlmUg0tVk36ztN72hik8wPwBJ+gR2JPqLK
 5RRziUJ9tG7unRH7WpM1b+amjKAQM1LIKjQQ6MX1P6NGlVTS+X8YKiBPOh+llBBhxBeH
 Uy6g==
X-Gm-Message-State: AOAM533H06NGTVsEhpQcJp3VhlMrINr/2DX2dwi8vWyDo4eZv3f9oH6B
 XlGuYbTrq+QLk+8oucAsXdGEkCnuqWkE/R9zX7Y=
X-Google-Smtp-Source: ABdhPJzyDeiAcXDLvcoNn6V/Cj7EH/EjdUhZkeAYMudOts/toyZ9b1npxjKJkDRfjIIHp9WgA24KPG6jt8LGm9LuArQ=
X-Received: by 2002:a05:6000:1107:b0:205:b8e5:8929 with SMTP id
 z7-20020a056000110700b00205b8e58929mr3268115wrw.187.1648717000091; Thu, 31
 Mar 2022 01:56:40 -0700 (PDT)
MIME-Version: 1.0
References: <20220330123603.107120-1-frankja@linux.ibm.com>
 <20220330123603.107120-9-frankja@linux.ibm.com>
In-Reply-To: <20220330123603.107120-9-frankja@linux.ibm.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Thu, 31 Mar 2022 12:56:26 +0400
Message-ID: <CAJ+F1CK+1+4XfpccOC-z7kJ8ACeghp0oa=mqAn0kPbbDvNoB+Q@mail.gmail.com>
Subject: Re: [PATCH v3 8/9] dump: Cleanup dump_begin write functions
To: Janosch Frank <frankja@linux.ibm.com>
Content-Type: multipart/alternative; boundary="000000000000202d2405db7fd79d"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::434
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-wr1-x434.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, QEMU <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000202d2405db7fd79d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 30, 2022 at 4:52 PM Janosch Frank <frankja@linux.ibm.com> wrote=
:

> There's no need to have a gigantic if in there let's move the elf
> 32/64 bit logic into the section, segment or note code.
>
> Signed-off-by: Janosch Frank <frankja@linux.ibm.com>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>


> ---
>  dump/dump.c | 42 +++++++++++-------------------------------
>  1 file changed, 11 insertions(+), 31 deletions(-)
>
> diff --git a/dump/dump.c b/dump/dump.c
> index 365798f5a1..92acd9eb5c 100644
> --- a/dump/dump.c
> +++ b/dump/dump.c
> @@ -555,46 +555,26 @@ static void dump_begin(DumpState *s, Error **errp)
>          return;
>      }
>
> -    if (dump_is_64bit(s)) {
> -        /* write all PT_LOAD to vmcore */
> -        write_elf_loads(s, errp);
> +    /* write all PT_LOAD to vmcore */
> +    write_elf_loads(s, errp);
> +    if (*errp) {
> +        return;
> +    }
> +
> +    /* write section to vmcore */
> +    if (s->shdr_num) {
> +        write_elf_section(s, 1, errp);
>          if (*errp) {
>              return;
>          }
> +    }
>
> -        /* write section to vmcore */
> -        if (s->shdr_num) {
> -            write_elf_section(s, 1, errp);
> -            if (*errp) {
> -                return;
> -            }
> -        }
> -
> +    if (dump_is_64bit(s)) {
>          /* write notes to vmcore */
>          write_elf64_notes(fd_write_vmcore, s, errp);
> -        if (*errp) {
> -            return;
> -        }
>      } else {
> -        /* write all PT_LOAD to vmcore */
> -        write_elf_loads(s, errp);
> -        if (*errp) {
> -            return;
> -        }
> -
> -        /* write section to vmcore */
> -        if (s->shdr_num) {
> -            write_elf_section(s, 0, errp);
> -            if (*errp) {
> -                return;
> -            }
> -        }
> -
>          /* write notes to vmcore */
>          write_elf32_notes(fd_write_vmcore, s, errp);
> -        if (*errp) {
> -            return;
> -        }
>      }
>  }
>
> --
> 2.32.0
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--000000000000202d2405db7fd79d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Mar 30, 2022 at 4:52 PM Janos=
ch Frank &lt;<a href=3D"mailto:frankja@linux.ibm.com" target=3D"_blank">fra=
nkja@linux.ibm.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">There&#39;s no need to have a gigantic if in there let&#3=
9;s move the elf<br>
32/64 bit logic into the section, segment or note code.<br>
<br>
Signed-off-by: Janosch Frank &lt;<a href=3D"mailto:frankja@linux.ibm.com" t=
arget=3D"_blank">frankja@linux.ibm.com</a>&gt;<br>
Reviewed-by: Richard Henderson &lt;<a href=3D"mailto:richard.henderson@lina=
ro.org" target=3D"_blank">richard.henderson@linaro.org</a>&gt;<br></blockqu=
ote><div><br></div><div><div>Reviewed-by: Marc-Andr=C3=A9 Lureau &lt;<a hre=
f=3D"mailto:marcandre.lureau@redhat.com" target=3D"_blank">marcandre.lureau=
@redhat.com</a>&gt;</div>=C2=A0</div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">
---<br>
=C2=A0dump/dump.c | 42 +++++++++++-------------------------------<br>
=C2=A01 file changed, 11 insertions(+), 31 deletions(-)<br>
<br>
diff --git a/dump/dump.c b/dump/dump.c<br>
index 365798f5a1..92acd9eb5c 100644<br>
--- a/dump/dump.c<br>
+++ b/dump/dump.c<br>
@@ -555,46 +555,26 @@ static void dump_begin(DumpState *s, Error **errp)<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
-=C2=A0 =C2=A0 if (dump_is_64bit(s)) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* write all PT_LOAD to vmcore */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 write_elf_loads(s, errp);<br>
+=C2=A0 =C2=A0 /* write all PT_LOAD to vmcore */<br>
+=C2=A0 =C2=A0 write_elf_loads(s, errp);<br>
+=C2=A0 =C2=A0 if (*errp) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 /* write section to vmcore */<br>
+=C2=A0 =C2=A0 if (s-&gt;shdr_num) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 write_elf_section(s, 1, errp);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (*errp) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 }<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* write section to vmcore */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (s-&gt;shdr_num) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 write_elf_section(s, 1, errp);<b=
r>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (*errp) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-<br>
+=C2=A0 =C2=A0 if (dump_is_64bit(s)) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* write notes to vmcore */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0write_elf64_notes(fd_write_vmcore, s, err=
p);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (*errp) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
=C2=A0 =C2=A0 =C2=A0} else {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* write all PT_LOAD to vmcore */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 write_elf_loads(s, errp);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (*errp) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* write section to vmcore */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (s-&gt;shdr_num) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 write_elf_section(s, 0, errp);<b=
r>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (*errp) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* write notes to vmcore */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0write_elf32_notes(fd_write_vmcore, s, err=
p);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (*errp) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0}<br>
<br>
-- <br>
2.32.0<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr">Marc-Andr=
=C3=A9 Lureau<br></div></div>

--000000000000202d2405db7fd79d--

