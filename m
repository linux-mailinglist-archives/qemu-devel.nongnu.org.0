Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 241C958EBF2
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Aug 2022 14:27:23 +0200 (CEST)
Received: from localhost ([::1]:45030 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oLknx-0000rR-Vi
	for lists+qemu-devel@lfdr.de; Wed, 10 Aug 2022 08:27:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39306)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1oLkjN-0005Vi-1R
 for qemu-devel@nongnu.org; Wed, 10 Aug 2022 08:22:38 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:41698)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1oLkjL-0001bn-5F
 for qemu-devel@nongnu.org; Wed, 10 Aug 2022 08:22:36 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 az6-20020a05600c600600b003a530cebbe3so904268wmb.0
 for <qemu-devel@nongnu.org>; Wed, 10 Aug 2022 05:22:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc;
 bh=UtjXAxnRZ4BU+YBmktG8PTWeo+e0kRMEoNmJnh43TiI=;
 b=Q4SQe8FPlP32pUrwDb82yS3yZRKsDnE2dahMIK2OEvjEteUxbX64LFGIkz7klKQ4yI
 agG7I1UvYF6HEv6NpQB/nNblqxFDZ8E7SWWAkAaAK7sHqhV8BVjzYRAQ76FhEgJcWB00
 p4fGXBqrmVoVWhf+RBW+bFmT8NVdd8MjZM3lzGGUJNrDA4FDLPcgCjPNLa2tjJSV6fcw
 rJe8x84I1orb5ZFxp0leyA+2Q2YPG+Esf4oAxF02h27DVlIYz39YctxvmTldPREGEiHV
 TB/EvlBNRCHpQbhCN7PM0dMGTdydg0ZwzNRzCIz0LYV+3KpYrmxC85r7P35CtT2iTfb3
 oyBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
 bh=UtjXAxnRZ4BU+YBmktG8PTWeo+e0kRMEoNmJnh43TiI=;
 b=US7/9Km7K2W6EH23JA+yHgdjLEFxmh38UHjzwwwUcrPuTx5OfFFABv0RtrpqIW+Nen
 XcD8kItTMOIxjpwXQ8i4xwlEqOBOMD6YVRzJeM9mWNIX8jBfgw++77BbHbaG2gJGfwIt
 My91Vy4pE+WtYnXhlxRRJ8V5Abcb9olVlPMnu+MLm9OsgWe0vWvN3NWFiwomE2hRG/5i
 yCWEMw6WIzeKzYzkIf9iJUie9bOSMsLFbhwrrS4dgdehuloV4G/tXTrIahLJ7Lheq0k1
 fPx4GflkA5RynWDvLipJqTiVOGiZJfa0Koarf3MA4VxU7PIV1lz/rXMaHDABXo2SCPDq
 OAgA==
X-Gm-Message-State: ACgBeo31uDVapwOsPj1tnnAuc2cQMKtHYBAqkGaKaMMgG0uviXMFAHWJ
 C0BJsHyqimq/pblgqdYZTvEuHw==
X-Google-Smtp-Source: AA6agR7HPzFDEcbn7LUf1fbC0oVa/cO1znvBFOv+xS31fbFd1f4mJstHY1cB99a5ZobpRwooAyxVJg==
X-Received: by 2002:a1c:3b46:0:b0:3a5:a92d:9e62 with SMTP id
 i67-20020a1c3b46000000b003a5a92d9e62mr2225292wma.175.1660134153756; 
 Wed, 10 Aug 2022 05:22:33 -0700 (PDT)
Received: from localhost (cst2-173-67.cust.vodafone.cz. [31.30.173.67])
 by smtp.gmail.com with ESMTPSA id
 h16-20020a05600c415000b003a5542047afsm2211844wmm.19.2022.08.10.05.22.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Aug 2022 05:22:33 -0700 (PDT)
Date: Wed, 10 Aug 2022 14:22:32 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Ben Dooks <qemu@ben.fluff.org>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org,
 Alistair Francis <Alistair.Francis@wdc.com>, qemu-arm@nongnu.org
Subject: Re: [PATCH v3 1/5] device_tree: add qemu_fdt_setprop_strings() helper
Message-ID: <20220810122232.g7tfnhvsbwtpkegg@kamzik>
References: <20220727223905.624285-1-qemu@ben.fluff.org>
 <20220727223905.624285-2-qemu@ben.fluff.org>
 <20220728092227.m2v6nyy4eblcreo2@kamzik>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220728092227.m2v6nyy4eblcreo2@kamzik>
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=ajones@ventanamicro.com; helo=mail-wm1-x335.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On Thu, Jul 28, 2022 at 11:22:27AM +0200, Andrew Jones wrote:
> On Wed, Jul 27, 2022 at 11:39:01PM +0100, Ben Dooks wrote:
> > Add a helper to set a property from a set of strings
> > to reduce the following code:
> > 
> >     static const char * const clint_compat[2] = {
> >         "sifive,clint0", "riscv,clint0"
> >     };
> > 
> >     qemu_fdt_setprop_string_array(fdt, nodename, "compatible",
> >         (char **)&clint_compat, ARRAY_SIZE(clint_compat));
> > 
> > Signed-off-by: Ben Dooks <qemu@ben.fluff.org>
> > ---
> > v3;
> >  - fix return value for the call
> >  - add better help text
> > v2:
> >  - fix node/path in comment
> > ---
> >  include/sysemu/device_tree.h | 19 +++++++++++++++++++
> >  1 file changed, 19 insertions(+)
> > 
> > diff --git a/include/sysemu/device_tree.h b/include/sysemu/device_tree.h
> > index ef060a9759..83bdfe390e 100644
> > --- a/include/sysemu/device_tree.h
> > +++ b/include/sysemu/device_tree.h
> > @@ -87,6 +87,25 @@ int qemu_fdt_setprop_string(void *fdt, const char *node_path,
> >  int qemu_fdt_setprop_string_array(void *fdt, const char *node_path,
> >                                    const char *prop, char **array, int len);
> >  
> > +/**
> > + * qemu_fdt_setprop_strings: set a property from a set of strings
> > + *
> > + * @fdt: pointer to the dt blob
> > + * @path: node name
> > + * @prop: property array
> > + *
> > + * This is a helper for the qemu_fdt_setprop_string_array() function
> > + * which takes a va-arg set of strings instead of having to setup a
> > + * single use string array.
> > + */
> > +#define qemu_fdt_setprop_strings(fdt, path, prop, ...)          \
> > +    ({ int __ret; do {                                          \
> > +        static const char * const __strs[] = { __VA_ARGS__ };   \
> > +        __ret = qemu_fdt_setprop_string_array(fdt, path, prop,  \
> > +                (char **)&__strs, ARRAY_SIZE(__strs));          \
> > +     } while(0); __ret; })
> 
> The do { } while (0) shouldn't be necessary inside the ({}), but I
> think we should change the places that are checking the return value
> of qemu_fdt_setprop_string_array() to not check the return value,
> because it will always be zero. qemu_fdt_setprop_string_array() calls
> qemu_fdt_setprop() which exits QEMU on error. Then, after there are
> no callers checking the return value we can change this macro to
> 
> #define qemu_fdt_setprop_strings(fdt, path, prop, ...)          \
>     do {                                                       \
>        static const char * const __strs[] = { __VA_ARGS__ };   \

Eh, I just realized I didn't notice the static the first time I read this
and so I copy+pasted here in my suggestion. Sorry about that.

Thanks,
drew


>        qemu_fdt_setprop_string_array(fdt, path, prop,          \
>                (char **)&__strs, ARRAY_SIZE(__strs));          \
>      } while(0)
> 
> 
> Thanks,
> drew

