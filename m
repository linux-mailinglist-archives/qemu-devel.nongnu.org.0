Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 142523DBE11
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Jul 2021 20:05:06 +0200 (CEST)
Received: from localhost ([::1]:58646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m9Wsb-0005PD-3Q
	for lists+qemu-devel@lfdr.de; Fri, 30 Jul 2021 14:05:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50622)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ctcaulfield@gmail.com>)
 id 1m9WQl-0005rA-DP
 for qemu-devel@nongnu.org; Fri, 30 Jul 2021 13:36:19 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:46780)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ctcaulfield@gmail.com>)
 id 1m9WQj-0001FL-Lk
 for qemu-devel@nongnu.org; Fri, 30 Jul 2021 13:36:19 -0400
Received: by mail-wr1-x42e.google.com with SMTP id c16so12229575wrp.13
 for <qemu-devel@nongnu.org>; Fri, 30 Jul 2021 10:36:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=Nf3h1OxKy8AcQZZllhsu8E3lrraWWb6LtpR+6pWA6IA=;
 b=B8j7omgsMZOSBRDuNZCyBZI2yaR9rzxye6U2tw7tVyPiG7QpT/6NH+CKMH8tZCKqtr
 NDm/eWlB6CVq32Blmd3NY0FFoflcBh0iYlJyty5O7joY1hE821b8QpDHz3uP3QyC3w3J
 aVWRB3+1sSgi5h7v02zPhPi7m9rZaqM9/imUmYfaRUrs/kM4zaal9+3WWTJUGZQr6zDc
 fluCbobEXizcDebUXyZCjmsCUbiKE3uWENq7LTc9YTYSCANMAFVXIMbcOVRdymaOqOFp
 HdSjsukf0v7jbkwSYmbop+Lv8sXfKwPm+Dy586ncSqXrs93P3+5Tzjq02mZIBNmWICvb
 kU4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=Nf3h1OxKy8AcQZZllhsu8E3lrraWWb6LtpR+6pWA6IA=;
 b=aOAE99y59lNfXYi75F3ILkEc/9Qg9h+PHRO76RwvIsYW5qUrM3N4tSjQSf2ma4v0sR
 FWXG9X/LbGbeZOI4dRmagVwCalfEn2PYQ/FAyEBgdzEmmXGMsfjdmszJfShL6oGtPsMo
 jGC4DhJ/m9cDw/msqbeUu4MdlIemv7MJ6K5AJuoJ1U+uxG97cI2lIEmjbkNfDHPufsdq
 3d9L8Omz3YhinHzsAHGMMaG82uZ90PexUkG5Tj3Y0c8isn5aArg3Z7La4MKs6wmw5yF6
 K6fugiGncDeInJbwbJDLjqCJDFA+iYJLZbhYSR8MXIaCJUUVkUmjlkRU/t+hEtR41zVL
 +TOg==
X-Gm-Message-State: AOAM533RDLdM3AdhrB4nE83QSDZ/Q5aWdAVkaxbiacUB1eGXU79bdt9C
 Wc4z2SoGGoPlrdpQQSvP/+mIFBkzR+b2MnGmnCl5e9j0GVsYIw==
X-Google-Smtp-Source: ABdhPJycNgbaQzJoJxVPsYMgGUwgBim9NTxx3x5LMlI9cDGc3XNvfVtQbjdz/B8gZhVOovtg3e+La5KTU0nG7DZ+RnI=
X-Received: by 2002:adf:f64b:: with SMTP id x11mr4199279wrp.155.1627666575468; 
 Fri, 30 Jul 2021 10:36:15 -0700 (PDT)
MIME-Version: 1.0
From: Christopher Caulfield <ctcaulfield@gmail.com>
Date: Fri, 30 Jul 2021 10:36:01 -0700
Message-ID: <CAGu1Vjjot17roFD-YTWmQcDhhMD=Lzi3b3Q51cHNRnz+6JT_HQ@mail.gmail.com>
Subject: QEMU on x64
To: qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="0000000000000b2dd905c85aa8c6"
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=ctcaulfield@gmail.com; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 30 Jul 2021 14:03:28 -0400
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
Cc: alexsmendez@live.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000000b2dd905c85aa8c6
Content-Type: text/plain; charset="UTF-8"

Hi QEMU community,

This is Christopher from the debugging experiences team at Microsoft
focused on kernel debugging. I am reaching out with a few questions about
QEMU on x64.


   1. Is it possible for the QEMU-x86-64 GDB Server to send the full set of
   x64 system registers (whether they are included in a separated system xml
   file or as part of the core registers xml file)?
      - e.g. System registers missing from i386-64bit.xml file

      DWORD64 IDTBase;
      DWORD64 IDTLimit;
      DWORD64 GDTBase;
      DWORD64 GDTLimit;
      DWORD SelLDT;
      SEG64_DESC_INFO SegLDT;
      DWORD SelTSS;
      SEG64_DESC_INFO SegTSS;
      2. How can I access x64 MSR registers by using the QEMU-x86-64 GDB
   server?
      - #define MSR_EFER 0xc0000080 // extended function enable register
      #define MSR_STAR 0xc0000081 // system call selectors
      #define MSR_LSTAR 0xc0000082 // system call 64-bit entry
      #define MSR_CSTAR 0xc0000083 // system call 32-bit entry
   3. Going off of #2 - can you access it via reading GDB memory command?
   if not - is there any plan to support reading/writing to MSRs via
   QEMU-x86-64 GDB server?


Thank you for taking time to answer our questions! :)

-Christopher
LinkedIn <https://www.linkedin.com/in/ctcaulfield/> | Twitter
<https://twitter.com/ctcaulfield>

--0000000000000b2dd905c85aa8c6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi QEMU community,<br><br>This is Christopher from the deb=
ugging experiences team at Microsoft focused on kernel debugging. I am reac=
hing out with a few questions about QEMU on x64.<div><br></div><div><ol><li=
>Is it possible for the QEMU-x86-64 GDB Server to send the full set of x64 =
system registers (whether they are included in a separated system xml file =
or as part of the core registers xml file)?</li><ul><li>e.g. System registe=
rs missing from i386-64bit.xml file<br><br>DWORD64 IDTBase;<br>DWORD64 IDTL=
imit;<br>DWORD64 GDTBase;<br>DWORD64 GDTLimit;<br>DWORD SelLDT;<br>SEG64_DE=
SC_INFO SegLDT;<br>DWORD SelTSS;<br>SEG64_DESC_INFO SegTSS;<br></li></ul><l=
i>How can I access x64 MSR registers by using the QEMU-x86-64 GDB server?</=
li><ul><li>#define MSR_EFER 0xc0000080 // extended function enable register=
<br>#define MSR_STAR 0xc0000081 // system call selectors<br>#define MSR_LST=
AR 0xc0000082 // system call 64-bit entry<br>#define MSR_CSTAR 0xc0000083 /=
/ system call 32-bit entry</li></ul><li>Going off of #2 - can you access it=
 via reading GDB memory command? if not - is there any plan to support read=
ing/writing to MSRs via QEMU-x86-64 GDB server?<br></li></ol></div><div><br=
>Thank you for taking time to answer our questions! :)</div><div><br></div>=
<div>-Christopher</div><div><a href=3D"https://www.linkedin.com/in/ctcaulfi=
eld/">LinkedIn</a>=C2=A0| <a href=3D"https://twitter.com/ctcaulfield">Twitt=
er</a></div></div>

--0000000000000b2dd905c85aa8c6--

