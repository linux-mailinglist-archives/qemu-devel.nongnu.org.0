Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E02DE46C1F9
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Dec 2021 18:41:19 +0100 (CET)
Received: from localhost ([::1]:51294 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mueSq-0008Qv-QF
	for lists+qemu-devel@lfdr.de; Tue, 07 Dec 2021 12:41:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50496)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yaroshchuk2000@gmail.com>)
 id 1mueRZ-0007TU-8M
 for qemu-devel@nongnu.org; Tue, 07 Dec 2021 12:39:57 -0500
Received: from [2607:f8b0:4864:20::533] (port=46834
 helo=mail-pg1-x533.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yaroshchuk2000@gmail.com>)
 id 1mueRW-00067G-O4
 for qemu-devel@nongnu.org; Tue, 07 Dec 2021 12:39:57 -0500
Received: by mail-pg1-x533.google.com with SMTP id r138so14456375pgr.13
 for <qemu-devel@nongnu.org>; Tue, 07 Dec 2021 09:39:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gIxo3JvsGVpgTvSpDA+DpvDCudBAt5nfuwanvMe8Hps=;
 b=FyHAsmBPU++OqTovDysKiOuB00IGwiTAz8dnUsi2iJFteHrLABOVAwKR+qo+JZk4Bg
 lgfKg/crJKaScW9GFgfNwY3irwmBtaEpfxWcjDOiB22ceczrTzwFfMYV7Vx+y7nJKrsh
 pudV7yQ8YsnqjDZ/2MOvmxZ4YK63LtlFPvlgy1/hnyFgQ+xKpAw2Qcy4Vz3iO8gmmVx+
 3mlNvGW3hVpsgwltuOy6rUyxaul4mCDKjv0ZWvWaWm3H+/NgbkL6BXE803849c3355Rn
 O8FWzvHS3X6pUALCkzOp5wYe00ofGkDDqykmfvt1AXYErOU3/elbh2E0RsBuGqOh0lpL
 9uig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gIxo3JvsGVpgTvSpDA+DpvDCudBAt5nfuwanvMe8Hps=;
 b=lpsgJf+YkaZmIrSXhYwf+uI4LJBtx7UBM/c5ZtRVOm86pHl+qzyHYxy9hE06GAV86d
 QNi7Qk0S7NAhyuvpK3Pz4+Xa7EfTmGsIeKSzsyZr6QJNDeni7aHYCeNryMaeCsHNQ099
 oFBkEVH8LcmYUP8KH3jMgU5vhH6ftutUKJAFKHigv27+S6fVunAtNIiRfhsHP8d64eUk
 kJxWxsFIbPcHexkXKzMK9oKTvOEMyUO8nBAzp6sO8qB5X705Xcmxk64spzWTtkeB/bTP
 e5aqY+uLfu85xe6FArEj5EdbRWsZp750nZEpmPZT+XNGVcg9nJ/o7NNYNi4/iHebHmu6
 nNNQ==
X-Gm-Message-State: AOAM531+uh08gFKagYS/I00G1Cq5zABazD40pIZtHvlDctLve6lnS2x1
 S87GAs1DG7eQiA8v1bFhikLTbdccfVWqpcoCTfA=
X-Google-Smtp-Source: ABdhPJwXcpybeY4QmKYhyTCkRr+Cctdm5UdorNNtpiwSimQIW+3RQd7syWPDlqEe3JUbnsPmZ4aJ6iEthZKuo4LjNqE=
X-Received: by 2002:a63:161f:: with SMTP id w31mr4850269pgl.14.1638898792226; 
 Tue, 07 Dec 2021 09:39:52 -0800 (PST)
MIME-Version: 1.0
References: <20211207101828.22033-1-yaroshchuk2000@gmail.com>
 <20211207101828.22033-2-yaroshchuk2000@gmail.com>
 <87ilw07bca.fsf@dusky.pond.sub.org>
In-Reply-To: <87ilw07bca.fsf@dusky.pond.sub.org>
From: Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>
Date: Tue, 7 Dec 2021 20:39:41 +0300
Message-ID: <CADO9X9SF9gGUs6rQKS7eMZpHYTOA8W8pCztF8CSJOxDP2AEZ8A@mail.gmail.com>
Subject: Re: [PATCH v7 1/7] net/vmnet: add vmnet dependency and customizable
 option
To: Markus Armbruster <armbru@redhat.com>
Content-Type: multipart/alternative; boundary="00000000000055634805d291dced"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::533
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=yaroshchuk2000@gmail.com; helo=mail-pg1-x533.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, HTML_MESSAGE=0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Jason Wang <jasowang@redhat.com>, phillip.ennen@gmail.com,
 qemu-devel <qemu-devel@nongnu.org>, Roman Bolshakov <r.bolshakov@yadro.com>,
 Phillip Tennen <phillip@axleos.com>, Akihiko Odaki <akihiko.odaki@gmail.com>,
 Howard Spoelstra <hsp.cat7@gmail.com>, Alessio Dionisi <hello@adns.io>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000055634805d291dced
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

If you meant patch series cover letter, it exists, see
https://patchew.org/QEMU/20211207101828.22033-1-yaroshchuk2000@gmail.com/

=D0=B2=D1=82, 7 =D0=B4=D0=B5=D0=BA. 2021 =D0=B3. =D0=B2 17:12, Markus Armbr=
uster <armbru@redhat.com>:

> No cover letter?
>
>

--=20
Best Regards,

Vladislav Yaroshchuk

--00000000000055634805d291dced
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">If you meant patch series cover letter, i=
t exists, see=C2=A0<a href=3D"https://patchew.org/QEMU/20211207101828.22033=
-1-yaroshchuk2000@gmail.com/" target=3D"_blank">https://patchew.org/QEMU/20=
211207101828.22033-1-yaroshchuk2000@gmail.com/</a>=C2=A0</div><br><div clas=
s=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">=D0=B2=D1=82, 7 =D0=
=B4=D0=B5=D0=BA. 2021 =D0=B3. =D0=B2 17:12, Markus Armbruster &lt;<a href=
=3D"mailto:armbru@redhat.com" target=3D"_blank">armbru@redhat.com</a>&gt;:<=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">No cover letter?=
<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
><div dir=3D"ltr">Best Regards,<div><br><div>Vladislav Yaroshchuk</div></di=
v></div></div></div>

--00000000000055634805d291dced--

