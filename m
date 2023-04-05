Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 427F16D7242
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Apr 2023 04:05:58 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjsVq-000193-GX; Tue, 04 Apr 2023 22:04:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <komlodi@google.com>)
 id 1pjsVo-00018p-GW
 for qemu-devel@nongnu.org; Tue, 04 Apr 2023 22:04:36 -0400
Received: from mail-qk1-x734.google.com ([2607:f8b0:4864:20::734])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <komlodi@google.com>)
 id 1pjsVm-0008PG-UV
 for qemu-devel@nongnu.org; Tue, 04 Apr 2023 22:04:36 -0400
Received: by mail-qk1-x734.google.com with SMTP id bi39so3036399qkb.13
 for <qemu-devel@nongnu.org>; Tue, 04 Apr 2023 19:04:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20210112; t=1680660274;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4YBwMJO/2oRosN8uWGIIssGFeU2IJcfYrvvrVjGvvbg=;
 b=Xup9U81+C1eqNj/Ns8d3CjZwjYTmX0qPUs3BErLnZDD3+qbrbfAR+sK+znpMYCRn24
 FxlhQ6onEJdu5afqv3j2O/PuGN19FK0/1DnLbMs3rP5pRPB/3vi8iYNxyH3+5kFNyPOx
 LqOBhdmZyF8JZiekYuq8FbhnPl01n6hwjQxxOmLoyyUSH8T6iLgAeEqjbM1OBuF3xahu
 lsjB+1zxUULzyUzBqdp8JNLorJeG63MjgdBUWTSOKDPNr9/T6tkHOluQ1Hez7KYsRVOo
 wns7haeuRhzQqNF/4mHjtAQWwIEZGvwL/McU9hUPs2sEj1f9hvrWkWD35O7oBUn9MGrK
 /A2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680660274;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4YBwMJO/2oRosN8uWGIIssGFeU2IJcfYrvvrVjGvvbg=;
 b=K5+othYFdxPXsQkseeLhEzoZ2WKDyH3+IZF6+hpc1WsKUOGNJ5jpAVz4s70kwo5Mvu
 dTyihNe8e5dmBFp59GPR1EqFD9r2AkoELhSpsoyfS9VOv9A+/f0RhiDktNdZOPgmqq2+
 vl91ccnvux18+OPhq/C1C1sOvH4lqNdgfK7/blesb+in38QoT2be7FMCxflMpr51gyQx
 RWfFnThWP3zd7ByLjdf8EswMh8y5Ra1ybvWrcNEsWCY5TB/p7N4HANsNkQgCXvKPdOAH
 L4uGapKMhIEkALvUEDIWJhV4QKCnnSWrazyid+Y4TEpsuszWGzrAl6VoIgVd7BUHIv+g
 g34g==
X-Gm-Message-State: AAQBX9dhc8lDy1uBpbj7x9NSSQVOltJd6psBlvc3gVpQPYgPpSJ46MbG
 M4MhwU9lkoWEalcHsopzfrJ2aJpmkVOrsaZbEdXpZQ==
X-Google-Smtp-Source: AKy350bJdLMXJhG5W//8sMg/9x2FEn0dZCiV+lyJO0zZSH5jFkhs8eoe+53Sp8mnhhMdcNI55dmM62lpetlqqt6/IC8=
X-Received: by 2002:a05:620a:bc7:b0:746:9072:5107 with SMTP id
 s7-20020a05620a0bc700b0074690725107mr583278qki.1.1680660273722; Tue, 04 Apr
 2023 19:04:33 -0700 (PDT)
MIME-Version: 1.0
References: <20230331010131.1412571-1-komlodi@google.com>
 <20230331010131.1412571-15-komlodi@google.com>
 <3bc0910f6b8078b07f43b3dd6d04686c25829ec1.camel@codeconstruct.com.au>
In-Reply-To: <3bc0910f6b8078b07f43b3dd6d04686c25829ec1.camel@codeconstruct.com.au>
From: Joe Komlodi <komlodi@google.com>
Date: Tue, 4 Apr 2023 19:04:22 -0700
Message-ID: <CAGDLtxuwJndMS_L1xWz9TWadA_T4SK3Rb6cExJf9+4jJ1ssQQg@mail.gmail.com>
Subject: Re: [PATCH 14/16] hw/i3c: remote_i3c: Add model
To: Jeremy Kerr <jk@codeconstruct.com.au>
Cc: qemu-devel@nongnu.org, venture@google.com, peter.maydell@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::734;
 envelope-from=komlodi@google.com; helo=mail-qk1-x734.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hi Jeremy,

On Sun, Apr 2, 2023 at 11:14=E2=80=AFPM Jeremy Kerr <jk@codeconstruct.com.a=
u> wrote:
>
> Hi Joe,
>
> > Adds a model to communicate to remote I3C devices over chardev. This
> > allows QEMU to communicate to I3C targets that exist outside of QEMU.
>
> Nice!
>
> I've been wanting something similar for a while, both for i2c and i3c
> busses, to the point of having a similar concept partly implemented.
>
> A couple of design decisions though:
>
> 1) Is this something that qemu upstream would accept? Do we need a
> formal description of the guest-to-host interface somewhere? Or is there
> a more standard way of exposing busses like this?
>
Not sure! I'm open to ideas.
I think the most controversial portion of the remote target like this
might be doing socket transfers in an MMIO context.
i.e. driver does a write to I3C controller -> triggers a transaction
to remote target -> remote target sends/reads data over socket.

Because of that, we might need to add a way to do these transactions
asynchronously.

> 2) My approach was at the bus level rather than the device level: the
> protocol is bidirectional to allow the model to either participate as a
> i3c controller or a target. There's quite a bit of mis-fit when applying
> that to the qemu device structure though, so your approach is a lot
> cleaner.
>
> I'll have a go at adapting my client to your protocol, and see how the
> device interface goes.
>
> Assuming we do adopt your approach though, I think the protocol
> description needs some work. There seems to be other messages not listed
> in your protocol comments, and the direction of some seems to be
> reversed. I'm happy to contribute to that documentation if you like.

Oops. I'll reread and revise in v2. If you have anything else you want
to add too, let me know and I'll add them as well.

Thanks,
Joe

>
> Cheers,
>
>
> Jeremy

