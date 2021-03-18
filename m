Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 10DB434045A
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Mar 2021 12:16:31 +0100 (CET)
Received: from localhost ([::1]:52554 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMqdi-0000n2-3y
	for lists+qemu-devel@lfdr.de; Thu, 18 Mar 2021 07:16:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40010)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lMqcK-0000Ez-El
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 07:15:04 -0400
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635]:33775)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lMqaN-0001kD-Ba
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 07:15:03 -0400
Received: by mail-ej1-x635.google.com with SMTP id k10so3284486ejg.0
 for <qemu-devel@nongnu.org>; Thu, 18 Mar 2021 04:13:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=iKnWf2Ps8plmTeLplo5chu5peDqJOknA6Iy9ZDnIt5I=;
 b=PM5lWTCH+pbAkS/6Whlh5roB51IU6x5omSOyp9LahlvhmmkJEI5H7ujd/vInaRbUzq
 yJoiM0R2XkUZWAEwTLjHLFFibATK3alYCZQ5aMd0wURcW7G8VcoR+76JQPdmi6zlX0PL
 zO5Hsq7Ek1mm9GPrvSidBqM8nERH6ZBY0oPX9facJ0BJ4YppftqVP4mtuO2nOv8x+Ln9
 jYsTuolb9gZVWdTG9WpgWqxBwyqwxmDqUQgXleXZC5YLc9pTXzAMI8Fe9o36WumgjYKP
 ro5pQ+HRSR3D42N2c5OHksu+ij9Gn6aNjhymwBVkp9nO0tyPcbpaBVAdPzJkBkP6Y2nR
 WnBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iKnWf2Ps8plmTeLplo5chu5peDqJOknA6Iy9ZDnIt5I=;
 b=a/L2m+ybLn9/ezNdDl8wdIH5MmXYRZm+3VEDmVu3AYEv527kGb14C/YWKOXAnOn8hG
 s6+FCc1wmlzAd5nRk1r4dxYi8NNTy4o18qLhaCPKZ2eWwCIRhgOaExL+UrLxt3+8lPQN
 8ETkx/2J+LbwBW2+TLe/9X7nJTBXJfunOsrRrNTJE98/mrwB/uV9xkMTrTGdU9pTXz43
 5PQhszEHAFMOrlo4JH6Apwc33wfLjrMDSIijAOzGg+ZOL41ZM1Q9yHoSeSdwrSbZTgM4
 LiX5SS9mxVYdN/PehNV8GCx3xa9JSYYir2XAqNNAZGJdUVJB4lCUV5n2CSLsFi7ve99f
 jtgQ==
X-Gm-Message-State: AOAM533r3LX5m5ou2PlTafGyJTVl6gB8nwqD8c35P3YXiyBxHsKH2Mkv
 XUaCuEZO6gf4L/UVoGjQFTmC5vWpi92YN8q0vaqjIA==
X-Google-Smtp-Source: ABdhPJyWN19Djx9gslC9xq3odK5hSCbU/NXzxkCWtEKTOFHhTJhZ1qbFo9KciQdrNabcXgWSDzXvURr/SL3DhYJrE7A=
X-Received: by 2002:a17:907:10ce:: with SMTP id
 rv14mr41051649ejb.56.1616065981971; 
 Thu, 18 Mar 2021 04:13:01 -0700 (PDT)
MIME-Version: 1.0
References: <YFJjIq45ggSZz0CX@work-vm>
 <CAFEAcA8aifakYwKn0umNbuCVtAsa_1svEGEq-coj9iVo3b1WPA@mail.gmail.com>
 <YFMpCPtMJzXUeeIk@work-vm>
 <CAFEAcA_+Yvn5S8P3zwPcsO9HF=0rXCJrfUZKs6RAQWhdyG_-fQ@mail.gmail.com>
 <YFMqmDmwDZwRQviM@work-vm>
 <CAFEAcA825k8uttjmJuwNM=rDa-m7nOWJZEAQzP9Zz3e7yyS9Aw@mail.gmail.com>
 <YFMvO/79vcSFOEix@work-vm>
In-Reply-To: <YFMvO/79vcSFOEix@work-vm>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 18 Mar 2021 11:12:38 +0000
Message-ID: <CAFEAcA8+FfNaQ+26cSKYP8X05F-hqZ+0CxF7cS0hj=AW2M6O6g@mail.gmail.com>
Subject: Re: of AVR target page size
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x635.google.com
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
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Michael Rolnik <mrolnik@gmail.com>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 18 Mar 2021 at 10:45, Dr. David Alan Gilbert
<dgilbert@redhat.com> wrote:
>
> * Peter Maydell (peter.maydell@linaro.org) wrote:
> > Also, what does the
> >  /* 0x80 is reserved in migration.h start with 0x100 next */
> > comment refer to? migration.h has no instances of "RAM_SAVE"
> > or 0x80 or 1 << 7...
>
> It looks like it got moved to qemu-file.h a few years ago
> as RAM_SAVE_FLAG_HOOK.

Could we put the define of RAM_SAVE_FLAG_HOOK in migration.h
with all the other RAM_SAVE_FLAG defines ? It looks like the two
places that use it already include migration.h...

thanks
-- PMM

