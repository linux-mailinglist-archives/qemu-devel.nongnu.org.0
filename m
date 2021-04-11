Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A04FD35B56A
	for <lists+qemu-devel@lfdr.de>; Sun, 11 Apr 2021 15:52:03 +0200 (CEST)
Received: from localhost ([::1]:36886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lVaVO-0006YP-9A
	for lists+qemu-devel@lfdr.de; Sun, 11 Apr 2021 09:52:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38720)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chetan4windows@gmail.com>)
 id 1lVaUE-0005yt-Pu
 for qemu-devel@nongnu.org; Sun, 11 Apr 2021 09:50:50 -0400
Received: from mail-il1-x134.google.com ([2607:f8b0:4864:20::134]:33491)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <chetan4windows@gmail.com>)
 id 1lVaUC-0001Oi-RL
 for qemu-devel@nongnu.org; Sun, 11 Apr 2021 09:50:50 -0400
Received: by mail-il1-x134.google.com with SMTP id 7so7049949ilz.0
 for <qemu-devel@nongnu.org>; Sun, 11 Apr 2021 06:50:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=aYkxVvCdlER8H/Wy1j81mpVVpnzyrcYNAH5NuM9tkkA=;
 b=F/ncFjc/4deN/VQTKs+45Yki0KXGblOCIrOlGd1IrNhdreR5LjOXWPfwRfTZGehIdG
 IzvqeX8z5Z8NYyYB8NzFsTqwbSASD2THMaF1D/zFLngoDp7hdz3+L3zPTvV7xW7HuWhV
 M3bFswVWCZyFJfw+ukP3FyAu3nBzMxcG5ak/UsPKaOOyzn+pJdDUCYh1uxE/S281TMkf
 rha3mjcmXw09sJbSqNAHg5nD+ECVgaMqP86SYQp9+XUvmJs8gKCIMldzMzOdXhCRurpg
 /A2PGYNCw/l5Mt4hV43YWjF5PhCflQyZwFPKPXa9/x4Lm65+S8GZcuSoO8I6wHAINeEA
 pYig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=aYkxVvCdlER8H/Wy1j81mpVVpnzyrcYNAH5NuM9tkkA=;
 b=s+u/J3pf3VF8xJf1/XvwjX8Hw7mzumDyn2GLuMJ9rrkX4GLw/VLUaWgngg21jQvkUT
 M/MkNvwGfpPScWOKtaV8L4kUuW01w0hyxUOnxuBEsDFnmpVC4BJuBcK1/7JDYPczEGwO
 3u5VsWO9eu8c+Uuhku4EItQiy/MbbYzOjcNM5Lxseb4cnuNTBmYYsBGB1OgERGfQ8DPG
 ZGmw78eQoDUvUKOWE59Ssb+P6ykPGw0pbw6xNeSp8cPd413L+W+qSoTYOilU3YsK+/Z8
 NiXOYk4IPCaO6mGqPbFOKQzwFvbN2F98qlWYoh23uaPqZNS6WNr+CTmD+i+3scrVnCY8
 z92w==
X-Gm-Message-State: AOAM531t7aPKLBTS4sekPxwzBx982xlyl/eAUwZoNa0DGRp9teShMDfw
 6yzlFraMkHn0bNpUUVyF92YluinhqU902Cp6cGxw+oCNoYEzQiIy
X-Google-Smtp-Source: ABdhPJyXd3pYpzUOxBKeheqtKH1VeBDkQa7WWhWPKFL9UyCumVZF6JgVo9wgi/xa4G0UTU6mQX/dDNDh+wLfK3glhSU=
X-Received: by 2002:a92:6810:: with SMTP id d16mr20612751ilc.88.1618149046827; 
 Sun, 11 Apr 2021 06:50:46 -0700 (PDT)
MIME-Version: 1.0
From: Chetan <chetan4windows@gmail.com>
Date: Sun, 11 Apr 2021 19:20:35 +0530
Message-ID: <CAPPKfOGwK7JDfHaTT-e4Z7bFkYoWu=dHvF-fT+QdqJhnwCLvOw@mail.gmail.com>
Subject: Better alternative to strncpy in QEMU.
To: qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000213cea05bfb2af2e"
Received-SPF: pass client-ip=2607:f8b0:4864:20::134;
 envelope-from=chetan4windows@gmail.com; helo=mail-il1-x134.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000213cea05bfb2af2e
Content-Type: text/plain; charset="UTF-8"

Hello All,

This mail is in reference to one of the tasks mentioned in '
*Contribute/BiteSizedTasks*' in QEMU wiki, under '*API conversion*' which
states to introduce a better alternative to strncpy function. I've drafted
and tested below implementation for the same. Before proceeding with any
changes in QEMU code can you all please go through it and suggest
changes/corrections if required.




































































*/* This function is introduced in place of strncpy(), it asserts if
destination * is large enough to fit strlen(source)+1 bytes and guarantees
null termination * in destination string. * * char source[], is expecting a
pointer to the source where data should be copied * from. * * char
destination[], is expecting a pointer to the destination where data
should * be copied to. * * size_t destination_size, is expecting size of
destination. * In case of char[], sizeof() function can be used to find the
size. * In case of char *, provide value which was passed to malloc()
function for * memory allocation. */char *qemu_strncpy(char destination[],
char source[], size_t destination_size){    /* Looping through the array
and copying the characters from     * source to destination.     */    for
(int i = 0; i < strlen(source); i++) {        destination[i] = source[i];
      /* Check if value of i is equal to the second last index         * of
destination array and if condition is true, mark last         * index as
NULL and break from the loop.         */        if (i == (destination_size
- 2)) {            destination[destination_size - 1] = '\0';
break;        }    }    return destination;}/* This function is introduced
in place of strncpy(), it asserts if destination * is large enough to fit
strlen(source) bytes and does not guarantee null * termination in
destination string. * * char source[], is expecting a pointer to the source
where data should be copied * from. * * char destination[], is expecting a
pointer to the destination where data should * be copied to. * * size_t
destination_size, is expecting size of destination. * In case of char[],
sizeof() function can be used to find the size. * In case of char *,
provide value which was passed to malloc() function for * memory
allocation. */char *qemu_strncpy_nonul(char destination[], char source[],
size_t destination_size){    /* Looping through the array and copying the
characters from     * source to destination.     */    for (int i = 0; i <
strlen(source); i++) {        destination[i] = source[i];        /* Check
if value of i is equal to the last index         * of the destination array
and if condition is true,         * break from the loop.         */
if (i == (destination_size - 1)) {            break;        }    }
return destination;} *

Regards,
Chetan P.

--000000000000213cea05bfb2af2e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hello All,</div><div><br></div><div>This mail is in r=
eference to one of the tasks mentioned in &#39;<i>Contribute/BiteSizedTasks=
</i>&#39; in QEMU wiki, under &#39;<i>API conversion</i>&#39; which states =
to introduce a better alternative to strncpy function. I&#39;ve drafted and=
 tested below implementation for the same. Before proceeding with any chang=
es in QEMU code can you all please go through it and suggest changes/correc=
tions if required.</div><div><br></div><div>
<i>/* This function is introduced in place of strncpy(), it asserts if dest=
ination<br>=C2=A0* is large enough to fit strlen(source)+1 bytes and guaran=
tees null termination<br>=C2=A0* in destination string.<br>=C2=A0*<br>=C2=
=A0* char source[], is expecting a pointer to the source where data should =
be copied<br>=C2=A0* from.<br>=C2=A0*<br>=C2=A0* char destination[], is exp=
ecting a pointer to the destination where data should<br>=C2=A0* be copied =
to.<br>=C2=A0*<br>=C2=A0* size_t destination_size, is expecting size of des=
tination.<br>=C2=A0* In case of char[], sizeof() function can be used to fi=
nd the size.<br>=C2=A0* In case of char *, provide value which was passed t=
o malloc() function for<br>=C2=A0* memory allocation.<br>=C2=A0*/<br>char *=
qemu_strncpy(char destination[], char source[], size_t destination_size)<br=
>{<br>=C2=A0 =C2=A0 /* Looping through the array and copying the characters=
 from<br>=C2=A0 =C2=A0 =C2=A0* source to destination.<br>=C2=A0 =C2=A0 =C2=
=A0*/<br>=C2=A0 =C2=A0 for (int i =3D 0; i &lt; strlen(source); i++) {<br>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 destination[i] =3D source[i];<br><br>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 /* Check if value of i is equal to the second last index<=
br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* of destination array and if conditio=
n is true, mark last<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* index as NULL a=
nd break from the loop.<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 if (i =3D=3D (destination_size - 2)) {<br>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 destination[destination_size - 1] =3D &#39;=
\0&#39;;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 }<br>=C2=A0 =C2=A0 }<br>=C2=A0 =C2=A0 return destination;=
<br>}<br><br>/* This function is introduced in place of strncpy(), it asser=
ts if destination<br>=C2=A0* is large enough to fit strlen(source) bytes an=
d does not guarantee null<br>=C2=A0* termination in destination string.<br>=
=C2=A0*<br>=C2=A0* char source[], is expecting a pointer to the source wher=
e data should be copied<br>=C2=A0* from.<br>=C2=A0*<br>=C2=A0* char destina=
tion[], is expecting a pointer to the destination where data should<br>=C2=
=A0* be copied to.<br>=C2=A0*<br>=C2=A0* size_t destination_size, is expect=
ing size of destination.<br>=C2=A0* In case of char[], sizeof() function ca=
n be used to find the size.<br>=C2=A0* In case of char *, provide value whi=
ch was passed to malloc() function for<br>=C2=A0* memory allocation.<br>=C2=
=A0*/<br>char *qemu_strncpy_nonul(char destination[], char source[], size_t=
 destination_size)<br>{<br>=C2=A0 =C2=A0 /* Looping through the array and c=
opying the characters from<br>=C2=A0 =C2=A0 =C2=A0* source to destination.<=
br>=C2=A0 =C2=A0 =C2=A0*/<br>=C2=A0 =C2=A0 for (int i =3D 0; i &lt; strlen(=
source); i++) {<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 destination[i] =3D source[i]=
;<br><br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Check if value of i is equal to the=
 last index<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* of the destination array=
 and if condition is true,<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* break fro=
m the loop.<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 if (i =3D=3D (destination_size - 1)) {<br>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 break;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>=C2=A0 =C2=A0 =
}<br>=C2=A0 =C2=A0 return destination;<br>}

</i></div><div></div><div><br></div><div>Regards,</div><div>Chetan P.<br></=
div></div>

--000000000000213cea05bfb2af2e--

