Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 209F834A81D
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Mar 2021 14:31:28 +0100 (CET)
Received: from localhost ([::1]:59898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPmYf-0002Ka-Li
	for lists+qemu-devel@lfdr.de; Fri, 26 Mar 2021 09:31:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40642)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lPmWm-0001tA-1I
 for qemu-devel@nongnu.org; Fri, 26 Mar 2021 09:29:28 -0400
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f]:44001)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lPmWk-0002Of-AF
 for qemu-devel@nongnu.org; Fri, 26 Mar 2021 09:29:27 -0400
Received: by mail-ej1-x62f.google.com with SMTP id l4so8382300ejc.10
 for <qemu-devel@nongnu.org>; Fri, 26 Mar 2021 06:29:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=PwyMwbTrNnQalE5HamaxAh24xeb071kdAC6o6Of1jkQ=;
 b=OQeqDVqMuqrY8F4VoPOtasMnuCwQmc8aVsHgeQG5T7OOkSZBFHIhRUVYcBX6sfPSpp
 kLLA07j2SpVLjZYmFxnKn4tzWLRpjcWFGr0Nb/I/d59ZOhXEkXugPl2ALVFCORxdHU19
 /5CXbXOnyakZdX1GRcLcF/LvMY+Rws4MhyfY/uTWvgduAjwB0B9aflVaS5ISchgiO4bg
 Erxw9+lGnfh4rJx6aOp0eHJHOgGsdJOFKA0ZvqXUWCFycFz4+ChSeiCq+RhKdzu+9CMB
 NvD1a9Z2j9d4IRaDRDHx1QlzXMR61TWG42EdZtqe70OJ6IYnUDMUb7y5JnM3zkc+6ED4
 ad/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=PwyMwbTrNnQalE5HamaxAh24xeb071kdAC6o6Of1jkQ=;
 b=N9g0JP00TkF8ILSSlLVWz1uIJsOeNIKWSfxqy2zXOCgF9bmbw+CkiO138trUhi7y6m
 eOc/TCZoLNs3Cv4NJPTBcaCsWBzOwoo6XOWqB+ppi7GaQgu+qbwX+19QyqHgkEwJdjvm
 /tvgBNW2+KV1RMZUu/wKKw/2rMiHsG6jdEpkypb3d6oCvNGpBDrNZtZjp8DW7bosxMdL
 QZcK7Ut5VvoTBRNJS1ajjymAmp//hGWIrAmcFZ864Cq7SpWvtjJPjFgOGY+0EA+EnVGT
 MEll02K1lqlO4HM8U/lwS6eEWAuDfufqn9TCLcF/9RhKb+uzt77hf8rn4iglZBtwujTe
 iA4g==
X-Gm-Message-State: AOAM532G3GBV+TNFYR5PIN4zN5P/Um/Qaa0LZqBlF62LXE5eJlLQxpCO
 EcU6543+rr9IFh+7UlDtzubGbILpl9VE0LBKUG/XXQ==
X-Google-Smtp-Source: ABdhPJxoBOovShaQ4ljohRFdxPgw8Tv+q4czHl6cYN5FfP5tqmzTuIIeWRTAzfzNwABhGyfpHbSZuqril2jnYARzAT8=
X-Received: by 2002:a17:906:8a65:: with SMTP id
 hy5mr15705156ejc.250.1616765363816; 
 Fri, 26 Mar 2021 06:29:23 -0700 (PDT)
MIME-Version: 1.0
References: <CAFNex=Ddc_9Sta2W+_a90Qg7hCidMhxuqmGuggygfWWCzZdBhQ@mail.gmail.com>
 <74ee406f-f503-a66e-80d6-989b2c8ed4aa@vivier.eu>
In-Reply-To: <74ee406f-f503-a66e-80d6-989b2c8ed4aa@vivier.eu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 26 Mar 2021 13:28:55 +0000
Message-ID: <CAFEAcA8Buc1PnX0CcCYr2w6p0PTJxOtNT1nJWZDitOA6jdQp9w@mail.gmail.com>
Subject: Re: [PATCH] linux-user: allow NULL msg in recvfrom
To: Laurent Vivier <laurent@vivier.eu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Zach Reizner <zachr@google.com>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 26 Mar 2021 at 13:24, Laurent Vivier <laurent@vivier.eu> wrote:
>
> Le 26/03/2021 =C3=A0 05:05, Zach Reizner a =C3=A9crit :
> > The kernel allows a NULL msg in recvfrom so that he size of the next
> > message may be queried before allocating a correctly sized buffer. This
> > change allows the syscall translator to pass along the NULL msg pointer
> > instead of returning early with EFAULT.
> >
> > Signed-off-by: Zach Reizner <zachr@google.com>
> > ---
> >  linux-user/syscall.c | 2 --
> >  1 file changed, 2 deletions(-)
> >
> > diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> > index 1e508576c7..332544b43c 100644
> > --- a/linux-user/syscall.c
> > +++ b/linux-user/syscall.c
> > @@ -3680,8 +3680,6 @@ static abi_long do_recvfrom(int fd, abi_ulong
> > msg, size_t len, int flags,
> >      abi_long ret;
> >
> >      host_msg =3D lock_user(VERIFY_WRITE, msg, len, 0);
> > -    if (!host_msg)
> > -        return -TARGET_EFAULT;
> >      if (target_addr) {
> >          if (get_user_u32(addrlen, target_addrlen)) {
> >              ret =3D -TARGET_EFAULT;
> >
>
> Applied to my linux-user-for-6.0 branch

Doesn't this mean we'll now incorrectly treat "guest passed
a bad address" the same as "guest passed NULL" ? lock_user()
returns NULL for errors, so if you need to handle NULL input
specially you want something like

   if (!msg) {
       host_msg =3D NULL;
   } else {
       host_msg =3D lock_user(VERIFY_WRITE, msg, len, 0);
       if (!host_msg) {
           return -TARGET_EFAULT;
       }
   }

I think ?

thanks
-- PMM

