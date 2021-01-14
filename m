Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 79E0F2F55F9
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 02:57:13 +0100 (CET)
Received: from localhost ([::1]:55918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzrsu-0007rf-2P
	for lists+qemu-devel@lfdr.de; Wed, 13 Jan 2021 20:57:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55624)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <osy86dev@gmail.com>)
 id 1kzrrG-0007O3-E3
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 20:55:34 -0500
Received: from mail-io1-f47.google.com ([209.85.166.47]:37455)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <osy86dev@gmail.com>)
 id 1kzrrD-0004R3-I5
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 20:55:30 -0500
Received: by mail-io1-f47.google.com with SMTP id d13so5047856ioy.4
 for <qemu-devel@nongnu.org>; Wed, 13 Jan 2021 17:55:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=ZdJl3AUXMffVASCYriA4ZnXdizxmRsunYB5UgtHuwFY=;
 b=gRqI2ZbG+1rqx/H88DPPEdYt6wdaXNdy6v2pSkoyYZKbK1Guuf/+BHyBMpfdJuRDcC
 RzZ8CKye6jyL2zlK2+1eAMg5pdGRwt1HlYv2+6+ByvjgLo5jVLqjZztMPtStDTPC9BD3
 ivKcichqtLWrXBZL82V5vHkItkPRZPXOXFwy8eivZbxbEAKg+olDEknHq7ltltMIRCXI
 So+Y79rY48X+Nl+A7qSm6tnRvXXKe0Hy+jOcWnDAxBa7BzNzq7e2UAxbT+cC/CoJvnMZ
 4ewz/7EgBnMSjFXNUY1vEVwPVoNqF+pJPYmnQEZxxXRp6kRKBNH3y6K3LTElLzpSxBtN
 n5ag==
X-Gm-Message-State: AOAM530H5p9ExaAB+7ytjqAjKzYQCkOWvqx7f24+niza8icKILapmIf/
 apXOvhg7tsSB+Hn8Nzusd+TIWl4pVYc=
X-Google-Smtp-Source: ABdhPJxr3IzirKRvM0lAIU5+gHd0l2J6nKzJMrr7+pIQF1M4COtScyTwwwM0isIhyWv2jdMJDyw15w==
X-Received: by 2002:a5e:d603:: with SMTP id w3mr3819272iom.65.1610589325532;
 Wed, 13 Jan 2021 17:55:25 -0800 (PST)
Received: from mail-io1-f47.google.com (mail-io1-f47.google.com.
 [209.85.166.47])
 by smtp.gmail.com with ESMTPSA id g2sm2506761ilh.41.2021.01.13.17.55.25
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Jan 2021 17:55:25 -0800 (PST)
Received: by mail-io1-f47.google.com with SMTP id d13so5047803ioy.4
 for <qemu-devel@nongnu.org>; Wed, 13 Jan 2021 17:55:25 -0800 (PST)
X-Received: by 2002:a92:cccd:: with SMTP id u13mr4730015ilq.273.1610589324821; 
 Wed, 13 Jan 2021 17:55:24 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a02:6543:0:0:0:0:0 with HTTP; Wed, 13 Jan 2021 17:55:24
 -0800 (PST)
In-Reply-To: <62cb11ac-b251-d7f1-f050-4536354c54ae@linaro.org>
References: <20210113032806.18220-1-r.bolshakov@yadro.com>
 <62cb11ac-b251-d7f1-f050-4536354c54ae@linaro.org>
From: Joelle van Dyne <j@getutm.app>
Date: Wed, 13 Jan 2021 17:55:24 -0800
X-Gmail-Original-Message-ID: <CA+E+eSC00VUvYzG7FKFHZPQV8f2+CD0HTiQA9t6UcPZDTS65iA@mail.gmail.com>
Message-ID: <CA+E+eSC00VUvYzG7FKFHZPQV8f2+CD0HTiQA9t6UcPZDTS65iA@mail.gmail.com>
Subject: Re: [PATCH v3] tcg: Fix execution on Apple Silicon
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: multipart/alternative; boundary="00000000000095ca4605b8d28cb5"
Received-SPF: pass client-ip=209.85.166.47; envelope-from=osy86dev@gmail.com;
 helo=mail-io1-f47.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.248, HTML_MESSAGE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Roman Bolshakov <r.bolshakov@yadro.com>, Alexander Graf <agraf@csgraf.de>,
 Joelle van Dyne <j@getutm.app>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000095ca4605b8d28cb5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

No because of macOS weirdness you still have to map with RWX and MAP_JIT
before you can use this. Split w^x is only useful in iOS where they don=E2=
=80=99t
provide this functionality.

-j

On Wednesday, January 13, 2021, Richard Henderson <
richard.henderson@linaro.org> wrote:

> On 1/12/21 5:28 PM, Roman Bolshakov wrote:
> > Pages can't be both write and executable at the same time on Apple
> > Silicon. macOS provides public API to switch write protection [1] for
> > JIT applications, like TCG.
>
> So... considering that split w^x is now upstream, can we just call this
> once
> per thread to enable write and leave it write?
> Since we have the separate rw mapping.
>
>
> r~
>

--00000000000095ca4605b8d28cb5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

No because of macOS weirdness you still have to map with RWX and MAP_JIT be=
fore you can use this. Split w^x is only useful in iOS where they don=E2=80=
=99t provide this functionality.<div><br></div><div>-j<br><br>On Wednesday,=
 January 13, 2021, Richard Henderson &lt;<a href=3D"mailto:richard.henderso=
n@linaro.org">richard.henderson@linaro.org</a>&gt; wrote:<br><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;p=
adding-left:1ex">On 1/12/21 5:28 PM, Roman Bolshakov wrote:<br>
&gt; Pages can&#39;t be both write and executable at the same time on Apple=
<br>
&gt; Silicon. macOS provides public API to switch write protection [1] for<=
br>
&gt; JIT applications, like TCG.<br>
<br>
So... considering that split w^x is now upstream, can we just call this onc=
e<br>
per thread to enable write and leave it write?<br>
Since we have the separate rw mapping.<br>
<br>
<br>
r~<br>
</blockquote></div>

--00000000000095ca4605b8d28cb5--

