Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 031D6332005
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 08:45:15 +0100 (CET)
Received: from localhost ([::1]:60334 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJX3K-0004e8-3W
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 02:45:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37336)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben.leslie@gmail.com>)
 id 1lJX2H-0004D9-Vh
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 02:44:10 -0500
Received: from mail-ed1-f44.google.com ([209.85.208.44]:43893)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ben.leslie@gmail.com>)
 id 1lJX2F-0008Ae-4J
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 02:44:08 -0500
Received: by mail-ed1-f44.google.com with SMTP id bd6so18422149edb.10
 for <qemu-devel@nongnu.org>; Mon, 08 Mar 2021 23:44:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=R34TRJGm8b/rvBJSv/fzNf4eQzBWEOsqqjVbstp1Fv8=;
 b=mUJGdtuKtdx3bpDArtXXn71eMHy1tBP3+ev/s+4/l+sb9FpOrDojJQbSfO6HVIrMKR
 FWDr7INfRwz0feMO4S3t8PtDWhF04AbRUNWXVW+MA/qadRc7zTGfALqxjOHgIsCAN2rn
 Qe1aUWm5xMvNFUx7zkxlOWDmTPRvpuyiLrh2sym4KYDuOfp2kTcMMrlHdRceppmM+sWA
 kwIw0rYihUaekHAmjcrXGVuAT01Nkis6V4mLM4eqLR11/rvroy+2YLo+loMV3GNfmFdt
 QRkOIGLr60yrJreyckuqZJKfADR+0QWEozLZJoGlo0TmPKmOLZAPbnYES+aVBpyr9yTv
 SDdg==
X-Gm-Message-State: AOAM530ab59KiOo7FCKPlfbvyYG+UB5mMsRC8oKUM3tTSBQKfPNZU1cQ
 /9Pi/OsUquLatlGCWRQZEEBsAI4VdCpGAh85TwQ=
X-Google-Smtp-Source: ABdhPJzY/ZTpwceIo/ceLNtH+7TUQCUvNZqi7xUzaK4/vSkGo8Z1yuon1yO3/caTVeuRemutzDgL336Cv0qeFRbwAmA=
X-Received: by 2002:a05:6402:27d4:: with SMTP id
 c20mr2627471ede.271.1615275845763; 
 Mon, 08 Mar 2021 23:44:05 -0800 (PST)
MIME-Version: 1.0
References: <CABZ0LtCh37eXx0evxYNsZigFJgq-RY+wdFvA0SMDH4HgxpK-zw@mail.gmail.com>
 <20210309072359.6ep2bmu2zda6ojud@sirius.home.kraxel.org>
In-Reply-To: <20210309072359.6ep2bmu2zda6ojud@sirius.home.kraxel.org>
From: Ben Leslie <benno@benno.id.au>
Date: Tue, 9 Mar 2021 18:43:54 +1100
Message-ID: <CABZ0LtCpm66=AO_XuXjMbYWPFWcR9Q+Uvu_UkLsn=C8_+SMF9g@mail.gmail.com>
Subject: Re: What is the intended behaviour of usb_host_get_port for root hubs?
To: Gerd Hoffmann <kraxel@redhat.com>
Content-Type: multipart/alternative; boundary="00000000000000461905bd15b744"
Received-SPF: pass client-ip=209.85.208.44; envelope-from=ben.leslie@gmail.com;
 helo=mail-ed1-f44.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000000461905bd15b744
Content-Type: text/plain; charset="UTF-8"

On Tue, 9 Mar 2021 at 18:24, Gerd Hoffmann <kraxel@redhat.com> wrote:

> On Tue, Mar 09, 2021 at 10:54:15AM +1100, Ben Leslie wrote:
> > When usb_host_get_port is called for a root-hub device what string should
> > be output in the port parameter?
>
> Just the port number, as string.
>
> (and in case this isn't a root port the hub port number(s) are appended,
> separated by a dot).
>
> > The current behaviour writes a string with whatever stack value happened
> to
> > be in the paths stack array.
>
> Huh?  Isn't paths updated by the libusb_get_port_numbers() call?
>

libusb_get_port_numbers() can return zero (for the root hub); or at least
it does
on the Linux systems I tried. If that happens path[0] won't be changed by
libusb_get_port_numbers. The rest of the function assumes that the path is
at least 1 item long and unconditionally access path[0], which isn't true
if a root-hub
device is passed to the function.

Of course, reading the current code more carefully, usb_host_get_port is
never
actually called with a hub device (let alone a root hub), so I guess it is
a valid
assumption that libusb_get_port_numbers will always return at least 1 in
the non-error
path. I hit the problem as I was trying to reuse the function with a hub
device, so my
bad.

Thanks,

Ben

--00000000000000461905bd15b744
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Tue, 9 Mar 2021 at 18:24, Gerd Hoffman=
n &lt;<a href=3D"mailto:kraxel@redhat.com">kraxel@redhat.com</a>&gt; wrote:=
<br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">On Tue, Mar 09, 2021 at 10:54:15AM +1100, Ben Leslie wrote:<br>
&gt; When usb_host_get_port is called for a root-hub device what string sho=
uld<br>
&gt; be output in the port parameter?<br>
<br>
Just the port number, as string.<br>
<br>
(and in case this isn&#39;t a root port the hub port number(s) are appended=
,<br>
separated by a dot).<br>
<br>
&gt; The current behaviour writes a string with whatever stack value happen=
ed to<br>
&gt; be in the paths stack array.<br>
<br>
Huh?=C2=A0 Isn&#39;t paths updated by the libusb_get_port_numbers() call?<b=
r></blockquote><div><br></div><div>libusb_get_port_numbers() can return zer=
o (for the root hub); or at least it does <br></div><div>on the Linux syste=
ms I tried. If that happens path[0] won&#39;t be changed by</div><div>libus=
b_get_port_numbers. The rest of the function assumes that the path is <br><=
/div><div>at least 1 item long and unconditionally access path[0], which is=
n&#39;t true if a root-hub</div><div>device is passed to the function.<br><=
/div><div><br></div>Of course, reading the current code more carefully, usb=
_host_get_port is never</div><div class=3D"gmail_quote">actually called wit=
h a hub device (let alone a root hub), so I guess it is a valid</div><div c=
lass=3D"gmail_quote">assumption that libusb_get_port_numbers will always re=
turn at least 1 in the non-error</div><div class=3D"gmail_quote">path. I hi=
t the problem as I was trying to reuse the function with a hub device, so m=
y</div><div class=3D"gmail_quote">bad.<br></div><div class=3D"gmail_quote">=
<div><br></div><div>Thanks,</div><div><br></div><div>Ben<br></div></div><di=
v class=3D"gmail_quote"><table class=3D"gmail-highlight gmail-tab-size gmai=
l-js-file-line-container"><tbody><tr><td id=3D"gmail-LC296" class=3D"gmail-=
blob-code gmail-blob-code-inner gmail-js-file-line"><span class=3D"gmail-pl=
-k"></span><br></td></tr><tr></tr></tbody></table></div></div>

--00000000000000461905bd15b744--

