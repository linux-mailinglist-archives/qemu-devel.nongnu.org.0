Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B0C2436B73E
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Apr 2021 18:52:11 +0200 (CEST)
Received: from localhost ([::1]:53942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lb4Sw-0002NK-9M
	for lists+qemu-devel@lfdr.de; Mon, 26 Apr 2021 12:52:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45004)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dje@google.com>) id 1lb4QM-0001G9-ET
 for qemu-devel@nongnu.org; Mon, 26 Apr 2021 12:49:30 -0400
Received: from mail-vs1-xe2d.google.com ([2607:f8b0:4864:20::e2d]:35836)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dje@google.com>) id 1lb4QJ-00079G-1A
 for qemu-devel@nongnu.org; Mon, 26 Apr 2021 12:49:29 -0400
Received: by mail-vs1-xe2d.google.com with SMTP id x16so510118vsq.2
 for <qemu-devel@nongnu.org>; Mon, 26 Apr 2021 09:49:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=PFiygLIUMl9h/Ry6NeScprxAw8GpnGg3+2KO4C4FlvA=;
 b=dXuxM/YCMwIZOxbCbcDZ6kI0VBxiN8Ja1scJj3icOTiELuFRimNru82BfmCc0poa7A
 hTnwO4w1m9AU8MxrC+j3lZiAbMYq7dzIIKFjCaxRJTKOu0RWJ6f7P74phcYvVJx+oHYF
 UaIA9nqmBqhrECT94SKcn0upx//hVuoX8B3uSiOrve/Us+tPOtVQ7iy7Mwl9ZQfRZkf6
 bliS+i3bWoy6bEhlmuZfV3VjD4sCpiQQ4aK6Tj4zmfPuMQeD/SUBEot5RJxltGohywk5
 zyUrNQfW2oVulSiSgnsVrW1yqKHLpu0J7pkNxnVOjQwlJL7idY/MOQMEfiq25XkexGbD
 o3XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=PFiygLIUMl9h/Ry6NeScprxAw8GpnGg3+2KO4C4FlvA=;
 b=ZndLny2dtZxP55uhtQCN6SnG5p30+lzH8jTX4FkZlubZA5vE4g/3VJivBUY7OaRm8x
 g5wwyY3B5O82i/K0gV3qXfEUMar1dk7nFLNyZvqkqfhyJHX7kk5Tb1tTNZ0qW/yAbJRs
 T6sz999STuWst/IniaABtLgdLHm7Kv4rGwDct36Y1vRPY3nmrrHKQ9tRi9sfxASA3Btg
 JXH5J8Q9LnkSJ6AXcR+JFHP+xkYJT6ZWjOj6ZnRDS4wDhGOqkn7PDNJIsnSFtrX7n3/f
 ZtTBr67IkvGSGjRttIiHsyJDwYCxsRb5frL9P9Vg30VLCxPkMvo9yqTvxvjV3jyoFBBc
 zi6g==
X-Gm-Message-State: AOAM5328toIUuSP+hBXgng7Sgcjo2I898b/A3dGsc1+4+pq7w4W9U07R
 /7gFdf1YK9LpmzC1Wg5zYJWK0t9C/pPkoch1XtNXaEWbLJTjUkHS
X-Google-Smtp-Source: ABdhPJw45RdWmkXWTaFUnV81KJGWtJhDk9izVxv2T3+Tqqhs4DdDz7btxER/ju4flqn0HXM8YF3PlNDbm2pobEleoKk=
X-Received: by 2002:a67:1984:: with SMTP id 126mr13578770vsz.46.1619455762028; 
 Mon, 26 Apr 2021 09:49:22 -0700 (PDT)
MIME-Version: 1.0
From: Doug Evans <dje@google.com>
Date: Mon, 26 Apr 2021 09:48:44 -0700
Message-ID: <CADPb22QnVowGz2oCWk8mBtjZz-4Cuzu0z=LmfvwotG_QjbuPzQ@mail.gmail.com>
Subject: Ethernet-over-usb with linux guest using USB Device Controller ?
To: QEMU Developers <qemu-devel@nongnu.org>
Cc: kraxel@redhat.com
Content-Type: multipart/alternative; boundary="0000000000006d80c805c0e2ed66"
Received-SPF: pass client-ip=2607:f8b0:4864:20::e2d;
 envelope-from=dje@google.com; helo=mail-vs1-xe2d.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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

--0000000000006d80c805c0e2ed66
Content-Type: text/plain; charset="UTF-8"

Hi.

I'm working on a project where I want to have the linux qemu guest
communicate with another linux system via ethernet-over-usb (as far as the
guest is concerned, as it will be using a usb network gadget).
In this case the linux guest will be using a USB Device Controller (UDC) to
drive its side of the connection, and the protocol will be, IIUC, CDC-ECM.

The modeling would basically look like:

linux-guest <--> UDC-model <--> ?#1 <--> ?#2 <--> linux-host
|<-------------------- QEMU -------------->|

UDC-model will be working with CDC-ECM, but is there a use-case where we'd
want "?#1" to be libslirp and "?#2" to be the host's IP network? Another
use case is propagating CDC-ECM (or the USB packets in general) outside of
QEMU such that it can be fed directly into the USB of the host (or remote
host).

Questions: Is this support in QEMU and if so got any pointers to source for
existing examples?
If not, any guidance on how to proceed?

Of course we'd want this to not be a one-off. E.g., the code would be
partitioned such that the UDC-model-independent-support would be available
to other UDC models to use. Thus perhaps this falls under the scope of
things like this?
https://yhbt.net/lore/all/YFDo%2FoHikOEcXFcg@work-vm/
I'm new to all of this side of USB btw ...

--0000000000006d80c805c0e2ed66
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-size:small">Hi.=
<br></div><div class=3D"gmail_default" style=3D"font-size:small"><br></div>=
<div class=3D"gmail_default" style=3D"font-size:small">I&#39;m working on a=
 project where I want to have the linux qemu guest communicate with another=
 linux system via ethernet-over-usb (as far as the guest is concerned, as i=
t will be using a usb network gadget).</div><div class=3D"gmail_default" st=
yle=3D"font-size:small">In this case the linux guest will be using a USB De=
vice Controller (UDC) to drive its side of the connection, and the protocol=
 will be, IIUC, CDC-ECM.</div><div class=3D"gmail_default" style=3D"font-si=
ze:small"><br></div><div class=3D"gmail_default" style=3D"font-size:small">=
The modeling would basically look like:</div><div class=3D"gmail_default" s=
tyle=3D"font-size:small"><br></div><div class=3D"gmail_default" style=3D"fo=
nt-size:small">linux-guest &lt;--&gt; UDC-model &lt;--&gt; ?#1=C2=A0&lt;--&=
gt; ?#2 &lt;--&gt; linux-host</div><div class=3D"gmail_default" style=3D"fo=
nt-size:small">|&lt;-------------------- QEMU --------------&gt;|</div><div=
 class=3D"gmail_default" style=3D"font-size:small"><br></div><div class=3D"=
gmail_default" style=3D"font-size:small">UDC-model will be working with CDC=
-ECM, but is there a use-case where we&#39;d want &quot;?#1&quot; to be lib=
slirp and &quot;?#2&quot; to be the host&#39;s IP network? Another use case=
 is propagating CDC-ECM (or the USB packets in general) outside of QEMU suc=
h that it can be fed directly into the USB of the host (or remote host).</d=
iv><div class=3D"gmail_default" style=3D"font-size:small"><br></div><div cl=
ass=3D"gmail_default" style=3D"font-size:small">Questions: Is this support =
in QEMU and if so got any pointers to source for existing examples?</div><d=
iv class=3D"gmail_default" style=3D"font-size:small">If not, any guidance o=
n how to proceed?</div><div class=3D"gmail_default" style=3D"font-size:smal=
l"><br></div><div class=3D"gmail_default" style=3D"font-size:small">Of cour=
se we&#39;d want this to not be a one-off. E.g., the code would be partitio=
ned such that the UDC-model-independent-support would be available to other=
 UDC models to use. Thus perhaps this falls under the scope of things like =
this?<br></div><div class=3D"gmail_default" style=3D"font-size:small"><a hr=
ef=3D"https://yhbt.net/lore/all/YFDo%2FoHikOEcXFcg@work-vm/">https://yhbt.n=
et/lore/all/YFDo%2FoHikOEcXFcg@work-vm/</a><br></div><div class=3D"gmail_de=
fault" style=3D"font-size:small">I&#39;m new to all of this side of USB btw=
 ...</div><div class=3D"gmail_default" style=3D"font-size:small"><br></div>=
</div>

--0000000000006d80c805c0e2ed66--

