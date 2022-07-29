Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA31E58549D
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jul 2022 19:37:02 +0200 (CEST)
Received: from localhost ([::1]:46456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oHTv3-0007Mm-SS
	for lists+qemu-devel@lfdr.de; Fri, 29 Jul 2022 13:37:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45748)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jaykhandkar2002@gmail.com>)
 id 1oHTt0-00059p-Bu
 for qemu-devel@nongnu.org; Fri, 29 Jul 2022 13:34:54 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:53092)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jaykhandkar2002@gmail.com>)
 id 1oHTsx-0006p3-Jt
 for qemu-devel@nongnu.org; Fri, 29 Jul 2022 13:34:54 -0400
Received: by mail-pj1-x102e.google.com with SMTP id ha11so5407216pjb.2
 for <qemu-devel@nongnu.org>; Fri, 29 Jul 2022 10:34:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=fdkKy2gzLiehD8hKZr/9zfoNyZodMczepKvVYfLORjo=;
 b=jz8OdRC09lr6C5mnsso1hUVMM/ip/7+2aQcmh/FqgEa2ykAQpoUKHJwgOY+L3XcGOW
 5WCELjxUjfPM7prCKleR/1A0oOCfOaSxAC3kPdYTJMZG435M1sn6XhYMB/MVGqN9HSv0
 nOc5EvU48gWA37ZNWeQaUQkpKd4UgNxofrdjc7YTyG/EXzPUldicKI4ZXg97sgSYyfQV
 gasTD+/4H43P0toz0xejnqp0AaCjsZbFBU7hlPwECD2bOulvj5mOy9lDSln93VYYcIs0
 a3pzUvSeyN0hAutMaEa2UsTp4n35L9LRP8Dffn+ubt5F6Qgt33XLkt9eac95WXZW5jTy
 l7PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=fdkKy2gzLiehD8hKZr/9zfoNyZodMczepKvVYfLORjo=;
 b=zLz53/CbnKXPqCWUwpNKAZvSMJTw1mbVwzd/WqFu9YENRN/km7sD39a+85+cS/Q3td
 sNc4IwQVpayEO2d5+Wd/hsIcOKN/epQp/W/FrDePp9vWWVHV695g3AFgMmBTVTE9crz9
 4/qhJ9oL3+qAfyBWQIw+TYdl3j+Bm6qSbMrQ1ACsdeWE7B9nAEOGzIuUYyfiVH7+2GOy
 pWfjDVL0L5PWUfpd7GKeMjpLhq0hVsYAg2NuMdYCKCno6xFgqRYP4MNj/vxfCSrrmPXX
 iIB2mJG1GPyNKbo0sESkczN3ru1igjzqM3DyBoIMteWntGvQX69CH1kzSR8g0dKOONDo
 1riw==
X-Gm-Message-State: ACgBeo0vAIKbv+nd5Uo+K/O+mEiA08ooUMUlKYhumS4PZq0SCE5TWf5J
 zlYrQJH4zuxiiQUkT3Fi67M=
X-Google-Smtp-Source: AA6agR4JAPIGyZnTO3m5IXy8OQOPs/hXXKnywCE9Jz5rn1C6ejtUoFUPklsi3n5zB5xJ7d1tcOGnQQ==
X-Received: by 2002:a17:902:db0a:b0:16d:6afd:ef46 with SMTP id
 m10-20020a170902db0a00b0016d6afdef46mr4822357plx.143.1659116089916; 
 Fri, 29 Jul 2022 10:34:49 -0700 (PDT)
Received: from thinkpad ([59.88.163.253]) by smtp.gmail.com with ESMTPSA id
 k14-20020a170902c40e00b0016a17da4ad4sm4020242plk.39.2022.07.29.10.34.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Jul 2022 10:34:49 -0700 (PDT)
Date: Fri, 29 Jul 2022 23:04:47 +0530
From: Jay Khandkar <jaykhandkar2002@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, pbonzini@redhat.com, mst@redhat.com
Subject: Re: [PATCH] hw/intc: Handle software disabling of APIC correctly
Message-ID: <YuQaN9GScQJ4ZXC+@thinkpad.localdomain>
References: <20220712141804.99494-1-jaykhandkar2002@gmail.com>
 <CAFEAcA_sBoNCvUEaTOC26Om5vZKeZvLLJS1edkPM-pbswzQvzA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA_sBoNCvUEaTOC26Om5vZKeZvLLJS1edkPM-pbswzQvzA@mail.gmail.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=jaykhandkar2002@gmail.com; helo=mail-pj1-x102e.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jul 29, 2022 at 06:09:01PM +0100, Peter Maydell wrote:
> On Tue, 12 Jul 2022 at 19:38, Jay Khandkar <jaykhandkar2002@gmail.com> wrote:
> >
> > When the local APIC is in a software disabled state, all local interrupt
> > sources must be masked and all attempts to unmask them should be
> > ignored. Currently, we don't do either. Fix this by handling it
> > correctly in apic_mem_write().
> >
> > Signed-off-by: Jay Khandkar <jaykhandkar2002@gmail.com>
> > ---
> >  hw/intc/apic.c | 16 +++++++++++++---
> >  1 file changed, 13 insertions(+), 3 deletions(-)
> >
> > diff --git a/hw/intc/apic.c b/hw/intc/apic.c
> > index 3df11c34d6..493c70af62 100644
> > --- a/hw/intc/apic.c
> > +++ b/hw/intc/apic.c
> > @@ -792,9 +792,16 @@ static void apic_mem_write(void *opaque, hwaddr addr, uint64_t val,
> >          s->dest_mode = val >> 28;
> >          break;
> >      case 0x0f:
> > -        s->spurious_vec = val & 0x1ff;
> > -        apic_update_irq(s);
> > -        break;
> > +        {
> > +            s->spurious_vec = val & 0x1ff;
> > +            if (!(val & APIC_SPURIO_ENABLED)) {
> > +                for (int i = 0; i < APIC_LVT_NB; i++) {
> > +                    s->lvt[i] |= APIC_LVT_MASKED;
> > +                }
> > +            }
> > +            apic_update_irq(s);
> > +            break;
> > +        }
> 
> What are the braces for here ? There's no local variable declaration...
> 
> thanks
> -- PMM
You are right, the braces are unnecessary for that part. I just put them in to
create a neat visually separate block. Can get rid of them.

Thanks,
Jay 

