Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D1C3940F696
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Sep 2021 13:14:02 +0200 (CEST)
Received: from localhost ([::1]:41242 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mRBof-0007mJ-No
	for lists+qemu-devel@lfdr.de; Fri, 17 Sep 2021 07:14:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54472)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mRBmt-0006P3-Qn
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 07:12:11 -0400
Received: from mail-ot1-f53.google.com ([209.85.210.53]:42627)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mRBms-0000PO-Ax
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 07:12:11 -0400
Received: by mail-ot1-f53.google.com with SMTP id
 67-20020a9d0449000000b00546e5a8062aso278953otc.9
 for <qemu-devel@nongnu.org>; Fri, 17 Sep 2021 04:12:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Ns+QrogH0lSYdtguaxxpoj4nPRcAEXUAVKBAepZPi/0=;
 b=dd9w6i3IvPHjskX0OPqQxRyVsiukh0MzaB7dRRgOSJSwOJI5lfJXvgSrrQNcvikMhw
 aJUvu1ECKmX7NYcYjoxbTtRtmg5rjFchEfNquvt1rqGRFgK7nBswBO3rvgkQ+bwslzof
 Ct33ogMGTAgVQxA7qSWsB9Se4whDL4xgRlyppH4E0U/ek2QXt84FgB9eAcuqYKa+cqQv
 OIdVv/vqUXooIIJ6g13lgH9AqVasclEE+ETNm2b3SCvqILpTfIISuoIOFssgbgcSO/Od
 EtmTFY/6xH7K/5i7tTZgMdEVKz550OxPDPKmsBp6CBPu87iE0D7Vo5As9qc31erVNd2W
 4vLQ==
X-Gm-Message-State: AOAM533vvSr9lahTtNAgtOJtK7qlFcnZsMMdHX3HyRLdN/Pb98LV7xJ3
 JV9GhWBZ0hzN6OyQtvcu5tKEEvUi+5KoB0CMvfw=
X-Google-Smtp-Source: ABdhPJwyonrq4sZ6EDy0y1siTzCmcK5rNQLbDow37r+9DMpqoIUFLG6eZfdQhQnuuDS0cem3t1CspFaamxIZjHV1qMA=
X-Received: by 2002:a9d:7156:: with SMTP id y22mr6256621otj.75.1631877127684; 
 Fri, 17 Sep 2021 04:12:07 -0700 (PDT)
MIME-Version: 1.0
References: <YURYvaOpya498Xx2@yekko>
In-Reply-To: <YURYvaOpya498Xx2@yekko>
From: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Date: Fri, 17 Sep 2021 13:11:56 +0200
Message-ID: <CAAdtpL5W9eztLiPSu=goROh8eHMn+7BLUuKaEfukcVrKCEAtXg@mail.gmail.com>
Subject: Re: Rust in Qemu BoF followup: Rust vs. qemu platform support
To: David Gibson <david@gibson.dropbear.id.au>
Content-Type: multipart/alternative; boundary="00000000000083480905cc2f00fe"
Received-SPF: pass client-ip=209.85.210.53;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ot1-f53.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Sergio Lopez <slp@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>, hreitz@redhat.com,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000083480905cc2f00fe
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le ven. 17 sept. 2021 10:58, David Gibson <david@gibson.dropbear.id.au> a
=C3=A9crit :

> Hi all,
>
> At the qemu-in-rust BoF at KVM Forum, I volunteered to look into
> whether Rust supported all the host/build platforms that qemu does,
> which is obviously vital if we want to make Rust a non-optional
> component of the build
>

Could user mode emulation be impacted by this decision? What code used by
user emulation could potentially be converted to Rust?

>

--00000000000083480905cc2f00fe
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D=
"gmail_attr">Le ven. 17 sept. 2021 10:58, David Gibson &lt;<a href=3D"mailt=
o:david@gibson.dropbear.id.au">david@gibson.dropbear.id.au</a>&gt; a =C3=A9=
crit=C2=A0:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 =
0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Hi all,<br>
<br>
At the qemu-in-rust BoF at KVM Forum, I volunteered to look into<br>
whether Rust supported all the host/build platforms that qemu does,<br>
which is obviously vital if we want to make Rust a non-optional<br>
component of the build<br></blockquote></div></div><div><br></div><div>Coul=
d user mode emulation be impacted by this decision? What code used by user =
emulation could potentially be converted to Rust?</div><div><div class=3D"g=
mail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex">
</blockquote></div></div></div>

--00000000000083480905cc2f00fe--

