Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B4AF244F269
	for <lists+qemu-devel@lfdr.de>; Sat, 13 Nov 2021 11:08:55 +0100 (CET)
Received: from localhost ([::1]:33818 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mlpxu-0002hq-Iz
	for lists+qemu-devel@lfdr.de; Sat, 13 Nov 2021 05:08:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58826)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1mlpx4-0001sC-OC; Sat, 13 Nov 2021 05:08:02 -0500
Received: from [2607:f8b0:4864:20::92e] (port=45763
 helo=mail-ua1-x92e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1mlpx3-0003iW-6q; Sat, 13 Nov 2021 05:08:02 -0500
Received: by mail-ua1-x92e.google.com with SMTP id ay21so23940985uab.12;
 Sat, 13 Nov 2021 02:07:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:reply-to:from:date:message-id:subject:to;
 bh=mqIC6MXCIfchUFi4BHLmk7F3BKLcQ6alT96mGY30vA4=;
 b=ptAoLSVlqqy3STUeZ30LYKSD2Dl5IK8NC9nmh34Bx5YcxokKWRGmeGytOOD2AQ2BAx
 78sq23mtTFquGI4YORARSdIgs1OE4U4lrAWyN+TJhAtDUgLh0kf16aEk+kTDz7P4R38D
 8wnq5AsyHK62na7o+qKlzBtSUuUBgPiSEdGRVgz2VkZdPWtH6whdyQq+HVD1QOM4GtjA
 +wM4m037LZQfw/8feNqWXW3N+Dx0zqnx6W9rQ5bc1iFo+b6Dp0FZaeXnO3bfxQCYox2H
 vnHgGW/YU63VxspoPWxO52qWgY9SzG6y9SKhlG2FyAs36LUEqSV9BSJSiF8r8lQ+7QHT
 tmvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:reply-to:from:date:message-id
 :subject:to;
 bh=mqIC6MXCIfchUFi4BHLmk7F3BKLcQ6alT96mGY30vA4=;
 b=6KYlNWJ7XAJXXCpjsmKcT8dwfvOtyxlrSlSLU9yOhUh0E52i/6vpGdgIc7HkAjvNOD
 p6HelE9x50qLZW1+LYFLz3+vdd/w7DxyjlpeAigKNEx28Y/W8RzfQnG0s/yLcJ/xsj3m
 FiTTf6zYVldP7789dDHIo4O84AbabgVP+88hBwmj6OW7yW/nBqoDof6cGMB7EBhWwCGk
 AOK7+Jr/dYX8Lc6hfeK5ikqW7QnFRLJP2c57pb800b36Ue1pEgIyn6QtwLi4qdSGNFZA
 2S+N2FKncfGsUXX6s4UNEhF3nGLxhXQZtm3EM8snG7PS64NMDuOKqbxPAd37Jpxe/GKj
 xA7A==
X-Gm-Message-State: AOAM533xcQZHyLKdkdRKth2X1IsItTeBe5nlvGDNc3O2x3X6LpnaDZuJ
 laiWHNqstk1o6485Wzt8uJhr/5NJONoSmcJoUigUiquTDpJjGJxj
X-Google-Smtp-Source: ABdhPJyjV3d6cylMc4JkhyYzKCCFxfW5783IcTK+3pAuE8B5nJlqTxwBHXhg1p/Yzbn1bKevRVVMeBVzvyA4pAuig20=
X-Received: by 2002:a05:6102:3232:: with SMTP id
 x18mr13441307vsf.38.1636798079130; 
 Sat, 13 Nov 2021 02:07:59 -0800 (PST)
MIME-Version: 1.0
From: =?UTF-8?B?572X5YuH5YiaKFlvbmdnYW5nIEx1byk=?= <luoyonggang@gmail.com>
Date: Sat, 13 Nov 2021 18:07:46 +0800
Message-ID: <CAE2XoE_1ajznMKob+r3OEHKztPueiqWxSAOE+PKF_hNS6nktjg@mail.gmail.com>
Subject: ppc/fpu_helper.c
To: qemu-ppc@nongnu.org, qemu-level <qemu-devel@nongnu.org>
Content-Type: multipart/alternative; boundary="000000000000135ebe05d0a8c0a8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::92e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::92e;
 envelope-from=luoyonggang@gmail.com; helo=mail-ua1-x92e.google.com
X-Spam_score_int: 14
X-Spam_score: 1.4
X-Spam_bar: +
X-Spam_report: (1.4 / 5.0 requ) BAYES_50=0.8, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Reply-To: luoyonggang@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000135ebe05d0a8c0a8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I've seen nothing in fpu_helper.c to update
the fpscr to FP_FR,
that is there is no code with `fpscr |=3D FP_FR`,
is that valid for PowerPC? or it's just because this is hard
to implement and then the FP_FR  are always not set  for  fpscr

--
         =E6=AD=A4=E8=87=B4
=E7=A4=BC
=E7=BD=97=E5=8B=87=E5=88=9A
Yours
    sincerely,
Yonggang Luo

--000000000000135ebe05d0a8c0a8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I&#39;ve seen nothing in fpu_helper.c to update<br>the fps=
cr to FP_FR,<br>that is there is no code with `fpscr |=3D FP_FR`,<br>is tha=
t valid for PowerPC? or it&#39;s just because this is hard<br>to implement =
and then the FP_FR =C2=A0are always not set =C2=A0for =C2=A0fpscr =C2=A0 <b=
r><br>--<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=E6=AD=A4=E8=87=B4<br>=E7=A4=
=BC<br>=E7=BD=97=E5=8B=87=E5=88=9A<br>Yours<br>=C2=A0 =C2=A0 sincerely,<br>=
Yonggang Luo</div>

--000000000000135ebe05d0a8c0a8--

