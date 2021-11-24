Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C45FA45C670
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Nov 2021 15:05:58 +0100 (CET)
Received: from localhost ([::1]:54148 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpsuL-0002ZD-UJ
	for lists+qemu-devel@lfdr.de; Wed, 24 Nov 2021 09:05:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56358)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1mpspC-0004Pe-Jx
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 09:00:38 -0500
Received: from [2a00:1450:4864:20::436] (port=36651
 helo=mail-wr1-x436.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1mpsp9-0001WY-7f
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 09:00:37 -0500
Received: by mail-wr1-x436.google.com with SMTP id s13so4427424wrb.3
 for <qemu-devel@nongnu.org>; Wed, 24 Nov 2021 06:00:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=e9Mn5K1owWIXHle2ZzNz3IX3nu6clOgZG8JjNG/lAkM=;
 b=nq/bQBXtxMjliTMB9hQ+vAG9csYCP3jIorTuxy2woCmFh5H8yM/sgxFBLEgQJpwaLP
 L0F1TCAWsxjXi1O3CpcOE8cwgxFTFr2f0fOuG7PwdIi/8Pqlw7UqJ93IoRTNUEZcljl+
 /BUQimPyznBpc24CkUaoFlFML4EXQNtx5L3VElLq9bQS4ta85L6Bof5VKu2x5O4futaO
 ue5hGo6B0+C4bnnsLyCTOEe1+3Y6ddQd0aKf39zfXTNWToVNwuPg/DdNH75o2QYWOuT6
 qzM+VKLgawzN8FQar0PsTrjLh6ALpPy0IUocxKJwAuLjzshoGPBCeTDAd3o1Y781kzN+
 lNiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=e9Mn5K1owWIXHle2ZzNz3IX3nu6clOgZG8JjNG/lAkM=;
 b=5ncwt4c47M0ptUqC0P+9mhpXJPUQ2s6Kq1H3qClqkxu7lmaem7HVWxqpkU7b7JUBxF
 i7fXeO7FoWtn9UaE19E+fzmh0Y7Ga2xV/eg8bnLaKHjra5ba5J5AIwKxFlNuVozmrdXR
 95EsTB5evq/I8OAbDXgLna8dZW6NxEK3eZgTtbCyaQedqSOmJ4tF0szbHdTaWfF+nZN3
 +Pf2qjXMsML4FXv80rWPiDs9RldKLKqCnSajW/LUHbtlYYaEPXpwzq6dLOhXniRIJLca
 YD4vKt5yz4uvH9kiKsHWtkCd9JOd/czQwa/BKfmAWDFbZJ1N+fqGAXDJrViH3/16VbyZ
 Vsgw==
X-Gm-Message-State: AOAM531TJZxyKcfHIcMCp8hNnYoFdovEsCa64bF5CcUDHtoN3OY/LMOB
 3aTO0ulqsqQafI7kWxxWS964GcexaMM/M6/H7xpJkDu+mmRX3w==
X-Google-Smtp-Source: ABdhPJy4dPWgG4tOqKp0Ca+TpbSg0FJT3wJzMDVj0fiOoGqRqMwrw+57CpX/x2vLrxDTzTaLAJxrQmZAmM29UlKeQNg=
X-Received: by 2002:a5d:6c6b:: with SMTP id r11mr19086693wrz.231.1637762432624; 
 Wed, 24 Nov 2021 06:00:32 -0800 (PST)
MIME-Version: 1.0
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Wed, 24 Nov 2021 18:00:21 +0400
Message-ID: <CAJ+F1C+HXNBbfROqQBU1Wrt5fiVa9xrSpgg9ymSO2wR+WPRqBA@mail.gmail.com>
Subject: RFC: extending QGA guest-network-get-interfaces
To: QEMU <qemu-devel@nongnu.org>
Content-Type: multipart/alternative; boundary="00000000000005e9b505d1894862"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::436
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-wr1-x436.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: oshoval@redhat.com, Michael Roth <mdroth@linux.vnet.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000005e9b505d1894862
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

Or Shoval filed two RFE for guest-network-get-interfaces:
- "Guest agent should report the interface Permanent address"
https://bugzilla.redhat.com/show_bug.cgi?id=3D2025303
- "Guest agent should report interfaces from non root network namespaces"
https://bugzilla.redhat.com/show_bug.cgi?id=3D2025296

They have in common that the implementation requires a bit more
system-specific calls than what is currently being done afaik, and may be
specific to Linux using a netlink socket.

Rather than extending guest-network-get-interfaces with system-specific and
more complex code (and re-implementing "ip" as we add more features), I am
wondering if it wouldn't make more sense to add some kind of
"guest-exec-linux-ip" command. Since "ip" can output its result as JSON
with -j, the response could be embedded, or let the client parse it from an
escaped "output" string.

Any opinion or idea?

--=20
Marc-Andr=C3=A9 Lureau

--00000000000005e9b505d1894862
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi</div><div><span><br></span></div><div><span>Or Sho=
val filed two RFE for guest-network-get-interfaces:<br></span></div><div>- =
&quot;<span id=3D"gmail-summary_container"><span id=3D"gmail-short_desc_non=
edit_display">Guest agent should report the interface Permanent address&quo=
t; </span></span><a href=3D"https://bugzilla.redhat.com/show_bug.cgi?id=3D2=
025303">https://bugzilla.redhat.com/show_bug.cgi?id=3D2025303</a></div><div=
>- &quot;Guest agent should report interfaces from non root network namespa=
ces&quot;<span id=3D"gmail-summary_container"><span id=3D"gmail-short_desc_=
nonedit_display"></span></span>=C2=A0 <a href=3D"https://bugzilla.redhat.co=
m/show_bug.cgi?id=3D2025296">https://bugzilla.redhat.com/show_bug.cgi?id=3D=
2025296</a></div><div><br></div><div>They have in common that the implement=
ation requires a bit more system-specific calls than what is currently bein=
g done afaik, and may be specific to Linux using a netlink socket.</div><di=
v><br></div><div>Rather than extending guest-network-get-interfaces with sy=
stem-specific and more complex code (and re-implementing &quot;ip&quot; as =
we add more features), I am wondering if it wouldn&#39;t make more sense to=
 add some kind of &quot;guest-exec-linux-ip&quot; command. Since &quot;ip&q=
uot; can output its result as JSON with -j, the response could be embedded,=
 or let the client parse it from an escaped &quot;output&quot; string.<br><=
/div><div><span id=3D"gmail-summary_container"><span id=3D"gmail-short_desc=
_nonedit_display"><br></span></span></div><div><span id=3D"gmail-summary_co=
ntainer"><span id=3D"gmail-short_desc_nonedit_display">Any opinion or idea?=
<br></span></span></div><div><br>-- <br><div dir=3D"ltr" class=3D"gmail_sig=
nature" data-smartmail=3D"gmail_signature">Marc-Andr=C3=A9 Lureau<br></div>=
</div></div>

--00000000000005e9b505d1894862--

