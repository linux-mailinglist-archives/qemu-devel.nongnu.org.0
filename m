Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EDE830FC75
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 20:22:18 +0100 (CET)
Received: from localhost ([::1]:34598 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7kCn-0007q7-DG
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 14:22:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40992)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l7jZA-00073S-9s
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 13:41:20 -0500
Received: from mail-oi1-f173.google.com ([209.85.167.173]:38483)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l7jZ8-0006b8-Sk
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 13:41:20 -0500
Received: by mail-oi1-f173.google.com with SMTP id h6so4772000oie.5
 for <qemu-devel@nongnu.org>; Thu, 04 Feb 2021 10:41:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Trt7JuFvp5zItWZMjvK0pdCObniFQaOJh0i61XZhWOU=;
 b=sEzsbkGMMd7xNH47Bt4y9nja1EkdgQaOtuOcSLDBXjhjsxobGH8C5gJ3i1TYiu4CWh
 +rSr0y6L44tyPkjJLSVHSG/KyMXuLh3ub9TSAOfUM+4CTrbsG5pkjfIq1MtQcpvslFRJ
 y8U4tELhTt4XzVTh3pY+pxn8xqSqtfrSm5wveF+moyPkMgd6Fa4ST2H+aQlOcH/VuXEZ
 KTTd16r9d0cIsoYONiiUVToZBUOjGkGijR7mmN22JDrNbSkuZbenuNUpkyYjc/OFHrgJ
 Y5SseESyfdw9NsHOJYksB27tPiBPNxusPMnudV4FrNxemP7J9sWMhEIQTzME5XaslzmA
 k2OA==
X-Gm-Message-State: AOAM533HvKa7Ba0kNz+LYhwTom+EDddXQx/TrUnLXgJfM2Kf0rRpnSjm
 CuZ0d8Nmye0AQWandZMKNj7jy4tvDL+KIx0QGYs=
X-Google-Smtp-Source: ABdhPJwn+9aPvRA4QiURZiGZLqh83Tid5DDzDvfY2ZYNxBDjyCCnmFIp3JSIAvGKAU0Y1ybtmpvoCCBnqC8D2UWT3I0=
X-Received: by 2002:a54:4482:: with SMTP id v2mr570352oiv.121.1612464077835;
 Thu, 04 Feb 2021 10:41:17 -0800 (PST)
MIME-Version: 1.0
References: <20210204180328.1735105-1-f4bug@amsat.org>
 <0e3863f5-179c-7bb9-e5de-5a5a6d21c2c6@redhat.com>
In-Reply-To: <0e3863f5-179c-7bb9-e5de-5a5a6d21c2c6@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Date: Thu, 4 Feb 2021 19:41:06 +0100
Message-ID: <CAAdtpL6+vkmJSPB39jww75CsFv6ZkTgfD+7yzUqBH+OX-uT4gQ@mail.gmail.com>
Subject: Re: [PATCH] exec/cpu-defs: Remove TCG backends dependency
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=209.85.167.173;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-oi1-f173.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Claudio Fontana <cfontana@suse.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Feb 4, 2021 at 7:19 PM Paolo Bonzini <pbonzini@redhat.com> wrote:
> On 04/02/21 19:03, Philippe Mathieu-Daud=C3=A9 wrote:
> > "exec/cpu-defs.h" contains common CPU definitions for
> > accelerators, which is not related to the TCG backends.
> > See tcg/README description:
>
> Most of the definitions are actually for TCG, not for all accelerators
> (the TLB mostly).

Ah ok. Richard, could you update the description or do you want
me to respin?

> However, they're indeed unrelated to the backends, so
>
> Acked-by: Paolo Bonzini <pbonzini@redhat.com>

Thanks, this avoids rebuilding the whole tree when doing a single change
in these headers (I'll send a quick mail about it later, proven useful whil=
e
bisecting).

