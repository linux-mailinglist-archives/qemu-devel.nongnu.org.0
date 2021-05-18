Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 95E7C387A43
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 15:43:42 +0200 (CEST)
Received: from localhost ([::1]:34714 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lj00b-0001ch-IJ
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 09:43:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thomas.parrott@canonical.com>)
 id 1liyrJ-0008CZ-6e
 for qemu-devel@nongnu.org; Tue, 18 May 2021 08:30:01 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:33621)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_CBC_SHA1:128)
 (Exim 4.90_1) (envelope-from <thomas.parrott@canonical.com>)
 id 1liyrH-0006L3-AX
 for qemu-devel@nongnu.org; Tue, 18 May 2021 08:30:00 -0400
Received: from mail-lj1-f197.google.com ([209.85.208.197])
 by youngberry.canonical.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.93)
 (envelope-from <thomas.parrott@canonical.com>) id 1liyrF-0002EU-KH
 for qemu-devel@nongnu.org; Tue, 18 May 2021 12:29:57 +0000
Received: by mail-lj1-f197.google.com with SMTP id
 b44-20020a05651c0b2cb02900ec3242ba00so4417798ljr.17
 for <qemu-devel@nongnu.org>; Tue, 18 May 2021 05:29:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=41YalBJtRN8YgtpGQFFv7sgbPItohF8blq2XDv0xCN4=;
 b=CVt8OM0rSpYfgEId5EGgL/g7j+B64fgJeN3Y4kSKOaxWS9cNxIUVdKNBsxgzBv9TfF
 ZcCRtiyqGli7mZTHNGAYzgiCgBu+jOdl32cPlPOOBiJKE3GtOWuIcFOrS+iKEacrWFKA
 PgttdRMmMd+QVdndvj4j/dHRvbg4TtEH2gPr3+soDiVUclaxfQskYwb0XBZsDmMEI25z
 URw4NLkGO4UgEp2o9FLKJ09IQxqcnpAE5sAVWxHP341X8oGVZ8KDpBrfGgMLLJlX5CxE
 MFVI+NPt6mc0psKjn9ccmA8w5/G4qSbV10PtagH9v0fzS6ATUZv0hZuyj9e+pleCtOo9
 f6ZA==
X-Gm-Message-State: AOAM530AcLfRMPT2HcGT3YbZm7GXr82G01KAbySsHqZ9Ee9fkfTw2LDD
 BU+STnreS1R9ddUgufFYZL2F63oqPtnU5jWe66tqeB3J3zRBvHL4tbqO/zpX6uozHGHpYiokW9F
 l/WhTjsT2wCOOWi552LiVc3i4ev6Ge+K/FkSw2hKapyi8/eVm
X-Received: by 2002:a19:4085:: with SMTP id n127mr4212582lfa.415.1621340997142; 
 Tue, 18 May 2021 05:29:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwvrzfbxHIWKXFTk6zLir9oHZmXZDXUFUf/+wd3jTfVR+K4JbLIYnVK1mcFxDmRAmfn3/WNM5WDBlzrFJRgayI=
X-Received: by 2002:a19:4085:: with SMTP id n127mr4212570lfa.415.1621340996961; 
 Tue, 18 May 2021 05:29:56 -0700 (PDT)
MIME-Version: 1.0
References: <CADNu6esr-fzfP8pug+Rfv+yJrEjDJaGy3EO+O-oLb_nMm7qLDg@mail.gmail.com>
In-Reply-To: <CADNu6esr-fzfP8pug+Rfv+yJrEjDJaGy3EO+O-oLb_nMm7qLDg@mail.gmail.com>
From: Thomas Parrott <thomas.parrott@canonical.com>
Date: Tue, 18 May 2021 13:29:30 +0100
Message-ID: <CADNu6ev6XQc1YoUfRx2y=odGVBykOLSAOfVbcPVKX_3HG4Rk9A@mail.gmail.com>
Subject: Re: Adding pcie-root-port devices via QMP apparently isn't possible
To: qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="0000000000002f248405c299de9e"
Received-SPF: none client-ip=91.189.89.112;
 envelope-from=thomas.parrott@canonical.com; helo=youngberry.canonical.com
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_HI=-5, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 18 May 2021 09:39:06 -0400
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
Cc: marcel@redhat.com, jusual@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000002f248405c299de9e
Content-Type: text/plain; charset="UTF-8"

I meant to also add that it has been suggested we could discuss this
further on one of the forthcoming weekly community calls.

Thanks
Tom

On Tue, 18 May 2021 at 13:28, Thomas Parrott <thomas.parrott@canonical.com>
wrote:

> Due to QEMU moving towards a QMP configuration mechanism and away from
> config file support, the LXD team are currently in the process of migrating
> to using QMP to add devices to VMs (so that we can support the use of QEMU
> 6.0).
>
> Currently we are using the `-S` flag to freeze CPU at startup, then using
> QMP to add NIC devices via the `device_add` command, and then using the
> `cont` command to start the VM guest.
>
> However we have found that it is apparently not possible to add a
> pcie-root-port device via QMP.
>
> Initially we tried using something like:
>
> device_add
> {"id":"qemu_pcie5","driver":"pcie-root-port","bus":"pcie.0","addr":"1.5","chassis":5,"multifunction":"on"}
>
> Which was a straight conversion from the current config file we use.
>
> However this gave the error:
>
> Error: Bus 'pcie.0' does not support hotplugging
>
> Then I found the `--preconfig` flag which sounded interesting, so we
> removed the use of `-daemonize` which prevents the use of --preconfig` and
> then tried adding the pcie-root-port devices in the preconfig stage.
>
> But this resulted in the error:
>
> The command 'device_add' isn't permitted in 'preconfig' state
>
> So we wondered is this a bug, or if not, what is the correct way to be
> adding pcie-root-ports going forward?
>
> Thanks
> Tom Parrott
>
>
>

--0000000000002f248405c299de9e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>I meant to also add that it has been suggested we cou=
ld discuss this further on one of the forthcoming weekly community calls.</=
div><div><br></div><div>Thanks</div><div>Tom<br></div></div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, 18 May 2021 =
at 13:28, Thomas Parrott &lt;<a href=3D"mailto:thomas.parrott@canonical.com=
">thomas.parrott@canonical.com</a>&gt; wrote:<br></div><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex"><div dir=3D"ltr"><div>Due to QEMU moving towa=
rds a QMP configuration mechanism and away=20
from config file support, the LXD team are currently in the process of=20
migrating to using QMP to add devices to VMs (so that we can support the
 use of QEMU 6.0).</div><div><br></div><div>Currently we are using the=20
`-S` flag to freeze CPU at startup, then using QMP to add NIC devices=20
via the `device_add` command, and then using the `cont` command to start
 the VM guest.<br></div><div><br></div><div>However we have found that it i=
s apparently not possible to add a pcie-root-port device via QMP.</div><div=
><br></div><div>Initially we tried using something like:</div><div><br></di=
v><div>device_add {&quot;id&quot;:&quot;qemu_pcie5&quot;,&quot;driver&quot;=
:&quot;pcie-root-port&quot;,&quot;bus&quot;:&quot;pcie.0&quot;,&quot;addr&q=
uot;:&quot;1.5&quot;,&quot;chassis&quot;:5,&quot;multifunction&quot;:&quot;=
on&quot;}</div><div><br></div><div>Which was a straight conversion from the=
 current config file we use.</div><div><br></div><div>However this gave the=
 error:</div><div><br></div><div>Error: Bus &#39;pcie.0&#39; does not suppo=
rt hotplugging</div><div><br></div><div>Then I found the `--preconfig` flag=
 which sounded interesting, so we removed the use of `-daemonize` which pre=
vents the use of --preconfig` and then tried adding the pcie-root-port devi=
ces in the preconfig stage.</div><div><br></div><div>But this resulted in t=
he error:</div><div><br></div><div>The command &#39;device_add&#39; isn&#39=
;t permitted in &#39;preconfig&#39; state</div><div><br></div><div>So we wo=
ndered is this a bug, or if not, what is the correct way to be adding pcie-=
root-ports going forward?</div><div><br></div><div>Thanks</div><div>Tom Par=
rott<br></div><div><br></div><div><br></div></div>
</blockquote></div>

--0000000000002f248405c299de9e--

