Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC1CC530C97
	for <lists+qemu-devel@lfdr.de>; Mon, 23 May 2022 12:31:37 +0200 (CEST)
Received: from localhost ([::1]:51438 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nt5Lc-0006RU-FP
	for lists+qemu-devel@lfdr.de; Mon, 23 May 2022 06:31:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47166)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nt5Ev-0003lF-BB
 for qemu-devel@nongnu.org; Mon, 23 May 2022 06:24:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60463)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nt5Et-0006yY-47
 for qemu-devel@nongnu.org; Mon, 23 May 2022 06:24:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653301478;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+r9NK6LhAy6nKZgLMvYP4RCyHHAdqvEkJZ3i/J99eR8=;
 b=bHi4Byk+wxZrazABJt+SvHdiFjHMaXMs/WSizojN1wlmUJUHgMJpbaEpT8wEFx0/CO8lTl
 ab6a6G5R4I4+qkou4z4n8pNHl/5Y5sK3GlAa+rOH0JMABIW5RP2C3zDI4YsaqUmcs3T5cv
 TzC/YZ7V6G9c18FRAoxadAVbpMkEiv8=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-422-o4pB2r0OOY2hArqCc7nRwQ-1; Mon, 23 May 2022 06:24:37 -0400
X-MC-Unique: o4pB2r0OOY2hArqCc7nRwQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 z5-20020a5d4d05000000b0020e6457f2b4so3407470wrt.1
 for <qemu-devel@nongnu.org>; Mon, 23 May 2022 03:24:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=+r9NK6LhAy6nKZgLMvYP4RCyHHAdqvEkJZ3i/J99eR8=;
 b=Jq/3wOj6NOCwSrwdYcy3v7NNGFOOf43QM+9GKO0W6/BX0wUZsHnhjh877HvQK1L3Uy
 At+/d4mrbxanALldBVS2+1rJciBOuk47zzB/kE5ZUsIKeqVncozc/+askGZZHTDNl4RY
 DP9ef3Iv/Cx+Gik8H9WfMW0TYvjLAkQkLf7zC13eu+zwbsXc20e486KglL2o0Jn3MPDK
 qd+fsWWCAHaigKOuDo2yLON8IQ5OFCmp6FgE6Bp/0G6nP8JSb26HOQqP/g6GnKKvjjL7
 +4SVQZyegP0Ahv8J0j4nwYgEdOyuFVtwz87LjPYWcfhLLyoGDz3nK90DD8F+6rmkeZOG
 gfRg==
X-Gm-Message-State: AOAM532QncqmkIH33tCkPfqIVzHYD4yHtPgyR3gfOKT0OIpfEqb5WTv7
 +RxszDRFtS8jXaoyr99Z8qKgREeI4pmOmNybASWgFnYOz4vXXZFC5cGQRx1ycJGtJn7Ln3OqEWl
 BdxS2yJbfHFkwUKg=
X-Received: by 2002:adf:d843:0:b0:20e:614b:2b37 with SMTP id
 k3-20020adfd843000000b0020e614b2b37mr18895726wrl.618.1653301476000; 
 Mon, 23 May 2022 03:24:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJziyoe4LpezWrAgIRK+UiILpyQ/JEWtiHFGY+tE0jTV69mVkYGPg4LRPngotIY1+dX+0LUisg==
X-Received: by 2002:adf:d843:0:b0:20e:614b:2b37 with SMTP id
 k3-20020adfd843000000b0020e614b2b37mr18895702wrl.618.1653301475675; 
 Mon, 23 May 2022 03:24:35 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 p27-20020a05600c1d9b00b0039751bb8c62sm1110043wms.24.2022.05.23.03.24.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 May 2022 03:24:35 -0700 (PDT)
Date: Mon, 23 May 2022 11:24:33 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, laurent@vivier.eu,
 mjt@tls.msk.ru, danielhb413@gmail.com, clg@kaod.org, mst@redhat.com,
 qemu-arm@nongnu.org
Subject: Re: [PATCH] Trivial: 3 char repeat typos
Message-ID: <Yotg4WL1RYpiLfM2@work-vm>
References: <20220523095629.144441-1-dgilbert@redhat.com>
 <CAFEAcA8G0foQ0WrvknfdCTOUZHNEomJmB19xxTmjdzrS6xv18w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA8G0foQ0WrvknfdCTOUZHNEomJmB19xxTmjdzrS6xv18w@mail.gmail.com>
User-Agent: Mutt/2.2.1 (2022-02-19)
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

* Peter Maydell (peter.maydell@linaro.org) wrote:
> On Mon, 23 May 2022 at 11:09, Dr. David Alan Gilbert (git)
> <dgilbert@redhat.com> wrote:
> >
> > From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
> >
> > Inspired by Julia Lawall's fixing of Linux
> > kernel comments, I looked at qemu, although I did it manually.
> >
> > Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> 
> Checkpatch would probably ask you to fix up some of the comment
> styles when you touch some of these. Either way:

The only one it actually moaned about was hw/pci/shpc.c's comment style.
Does this need fixing in this patch?

> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

Thanks,

Dave

> > diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
> > index 04427e073f..2467c5bf76 100644
> > --- a/target/arm/cpu64.c
> > +++ b/target/arm/cpu64.c
> > @@ -997,7 +997,7 @@ static void aarch64_a64fx_initfn(Object *obj)
> >      cpu->gic_vpribits = 5;
> >      cpu->gic_vprebits = 5;
> >
> > -    /* Suppport of A64FX's vector length are 128,256 and 512bit only */
> > +    /* Support of A64FX's vector length are 128,256 and 512bit only */
> 
> This one came up in review of a different patch that happened to touch
> this function. We should ideally rephrase it to fix all of the typo, the
> missing space after comma and the unnatural grammar:
> 
> /* The A64FX supports only 128, 256 and 512 bit vector lengths */


> thanks
> -- PMM
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


