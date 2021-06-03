Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B824639A1FA
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 15:15:50 +0200 (CEST)
Received: from localhost ([::1]:34532 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lonCP-0005XV-Og
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 09:15:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1lonB9-0004Wg-5N
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 09:14:31 -0400
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530]:34650)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1lonB4-0000cN-Dy
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 09:14:30 -0400
Received: by mail-ed1-x530.google.com with SMTP id cb9so7091974edb.1
 for <qemu-devel@nongnu.org>; Thu, 03 Jun 2021 06:14:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=F676EvZh6+/fHCV7QL7FXoEu3+pozfhQgCzOtfOkrLI=;
 b=UIe0tOPtYy69nHh/pWS3ZVg/IIQJUcwCzOT1D06kj/e2TFz8aI3NMib7Md2GtWAIeL
 e8NPaSWaHyrWFlimh36UxQ7mJ5etHNZfYTM13DOAArU6mLZidVgsq9KwcnB1n3+9VDQK
 6T2k14FBdeSLmOfY5PuMwEN4AJvxRjro6rd3peU8r9C0b8Zx9gRXIOFCEp0j52FCQCxO
 kfXWiNvk4UL4CGKjkgjF4ktgQfeatIHmNj9MMye8Ry5Pj9K0PPpOpAJtiBbz/PpEQRn7
 jTgzD1aaz5xTNefi367p0/l9mq96IYYfH5aFUso80i/BFGiGkeG2sBCXHF7VjFl+NocA
 NWYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=F676EvZh6+/fHCV7QL7FXoEu3+pozfhQgCzOtfOkrLI=;
 b=MyewWHQ2eFEjU1Ai/T7b68ot0JO3dsDUPL+flNWvq3Srx8PNK5WIQyXLlHcfVtRPzy
 uJOI35mk+kKb1QpiG+mZYjyVwIYGd8f5+K4QisTdHkb5Dq2d/Grj2Yw4vXF8bDLlBoxs
 HoAx0t2XMPvgUux6YEbvLJABHx4OA1RKp1v71JpXncbahXwhFx0ap5dojGe1qCx0IA0Y
 7pnKU4RuEgcjdEqOKs+2QXmk+vQbN9NRBS5JMlk0tQJFMa72YxOINpLMz/8V5TxepMX3
 LnWa/xns/y0odoGVX93OBnKJcaxQ/xzBLdxG4pdSUsU9MgLqzicHy78vJGQXvPB1xd1Z
 Q9hw==
X-Gm-Message-State: AOAM532Eic37286bzpKwlJCVbL3h5lw5Dv1KF4mp5yb35cJUteVc87Cy
 JteCaYbu/2247nTzUcbIU4HJkg==
X-Google-Smtp-Source: ABdhPJxfv9ac3gsk1oGaAIPGR2EntR2GNwEaZeZhO4+JI0z02tPdGEBMIxgs9zBhKkoDnuyj2L+iIQ==
X-Received: by 2002:aa7:c7c7:: with SMTP id o7mr41360967eds.231.1622726064113; 
 Thu, 03 Jun 2021 06:14:24 -0700 (PDT)
Received: from myrica (adsl-84-226-111-173.adslplus.ch. [84.226.111.173])
 by smtp.gmail.com with ESMTPSA id v1sm1532076ejg.22.2021.06.03.06.14.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Jun 2021 06:14:23 -0700 (PDT)
Date: Thu, 3 Jun 2021 15:14:05 +0200
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH] hw/intc/arm_gicv3_cpuif: Tolerate spurious EOIR writes
Message-ID: <YLjVnWV7ZgEj/cpw@myrica>
References: <20210603110012.1182530-1-jean-philippe@linaro.org>
 <31c4e422-5451-3c0a-f5e6-df75559c9a9b@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <31c4e422-5451-3c0a-f5e6-df75559c9a9b@redhat.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=jean-philippe@linaro.org; helo=mail-ed1-x530.google.com
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jun 03, 2021 at 02:39:30PM +0200, Philippe Mathieu-Daudé wrote:
> > diff --git a/hw/intc/arm_gicv3_cpuif.c b/hw/intc/arm_gicv3_cpuif.c
> > index 81f94c7f4a..1d0964c9bf 100644
> > --- a/hw/intc/arm_gicv3_cpuif.c
> > +++ b/hw/intc/arm_gicv3_cpuif.c
> > @@ -1357,7 +1357,8 @@ static void icc_eoir_write(CPUARMState *env, const ARMCPRegInfo *ri,
> >          }
> >          break;
> >      default:
> > -        g_assert_not_reached();
> > +        /* No interrupt was active, this is UNPREDICTABLE. Ignore it. */
> 
> A qemu_log_mask(LOG_GUEST_ERROR, ...) call here could be useful,
> do you mind adding it?

No problem. I had it at first, but then wondered if that meant I should
update similar cases in the GIC device that silently ignore guest errors
at the moment (e.g. the guest writes a number > 1023 to EOIR) and decided
against it. I'll resend with only this error report if there is no
objection.

Thanks,
Jean

> > +        return;
> >      }
> >  
> >      icc_drop_prio(cs, grp);
> > 
> 

