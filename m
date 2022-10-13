Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A19915FDB01
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Oct 2022 15:37:23 +0200 (CEST)
Received: from localhost ([::1]:32916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiyOn-000619-UK
	for lists+qemu-devel@lfdr.de; Thu, 13 Oct 2022 09:37:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48442)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrea@rivosinc.com>)
 id 1oiuMz-000869-8c
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 05:19:19 -0400
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635]:41599)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <andrea@rivosinc.com>)
 id 1oiuMw-0003zZ-NX
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 05:19:12 -0400
Received: by mail-ej1-x635.google.com with SMTP id d26so2536248ejc.8
 for <qemu-devel@nongnu.org>; Thu, 13 Oct 2022 02:19:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=rDFt6iMZ7ZVc1sA/9c6sEq5s5Ne3nlOqn+YmeGxVeig=;
 b=tCjW8sOO7Rk02TRYats3SyL1Lqqyx8ZpNPyQZtK8b2F1ZV80ktGlXQDe7exud4t7mf
 UAXsEDU5MRnBpcKHIVrfr/wxZl2skJMaR581Vg3ZqlwXxiEhKm8mM4BcDDl+dM/1/9bj
 1sDOuolTrc27+8I3V/B4ctWCdavbg4uJKdLZkEnpvoRIuOixauabPTY5dxrskPp8cGRa
 0g/MhAX1dxtdMYNewHrJvPAkSg5Gz+VUkoWj9cG1/qwg16FgJaRT8bSW/r8JGt4U3Qiw
 T9ytvZ101ZTjHg1bfqnSv3/5MPeTiCzs4CCwcR7u51RRD/Gnra1cIk5BJZm7y6SKvC99
 +uew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rDFt6iMZ7ZVc1sA/9c6sEq5s5Ne3nlOqn+YmeGxVeig=;
 b=1Gk01+Cn0p70Uq3QTP0F7108IBuB86yLmFXmshq0vBiJwPa4EZCckC/Cs3CMZUKoIq
 E2bebh2k9M/Z4d1H8LVcvR3SVK8Np4iDg6GNUQfgvGRyc5PRLADmbZIbHccivxeyR1+W
 kbcIByQ3M4jjrdakxgkhc95BUMSPHhvLtl6gny38EAR9oid+885ELE5ieVlHBoc9rWWM
 jhQ2Zsdtfs2s/SOanmY2MNcatPa6PIyygcFfYTeaF1CQfb7NbagwkZyOI9sPR/zGneyY
 tpewMzYq0uwJqGTKk7uPCYVRGxfR4iPadBDKHe7oIShPwXSxrj7Nt51PQlfeyUnaXONm
 QIIA==
X-Gm-Message-State: ACrzQf09cSwgJQ33o7meIi25sgXNbEvAxCAzO1dTj3wOajRYOS3P94km
 Sg824jTHqkLA4urrsWWSsic51TwostvdnQ==
X-Google-Smtp-Source: AMsMyM7jsc/ALWg4YiIr351H7VfSi2cTeCg+6Ovkkhz6216nt1PnnEAcgIhJfA1DBsL/YQk9vekTHA==
X-Received: by 2002:a17:907:7f25:b0:78d:e76a:ef18 with SMTP id
 qf37-20020a1709077f2500b0078de76aef18mr8534055ejc.378.1665652738609; 
 Thu, 13 Oct 2022 02:18:58 -0700 (PDT)
Received: from andrea ([77.89.52.45]) by smtp.gmail.com with ESMTPSA id
 h8-20020a1709070b0800b0077a1dd3e7b7sm2681475ejl.102.2022.10.13.02.18.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Oct 2022 02:18:58 -0700 (PDT)
Date: Thu, 13 Oct 2022 11:18:53 +0200
From: Andrea Parri <andrea@rivosinc.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Cc: Palmer Dabbelt <palmer@rivosinc.com>, alex.bennee@linaro.org,
 qemu-devel@nongnu.org
Subject: Re: [PATCH] RISC-V: Add support for Ztso
Message-ID: <Y0fX/VloiH7Bqewm@andrea>
References: <YzXvIKVeFcHQ3ZQI@work-vm>
 <mhng-36837e18-1883-443f-85a7-69010d5d38ef@palmer-ri-x1c9>
 <YzqhAdsGwC0so55O@work-vm>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YzqhAdsGwC0so55O@work-vm>
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=andrea@rivosinc.com; helo=mail-ej1-x635.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 13 Oct 2022 09:17:25 -0400
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

> > > Is x86's brand of memory ordering strong enough for Ztso?
> > > I thought x86 had an optimisation where it was allowed to store forward
> > > within the current CPU causing stores not to be quite strictly ordered.

[...]

> then a bit further down, '8.2.3.5 Intra-Processor Forwarding Is Allowed'
> has an example and says
> 
>     'The memory-ordering model allows concurrent stores by two processors to be seen in
>     different orders by those two processors; specifically, each processor may perceive
>     its own store occurring before that of the other.'
> 
> Having said that, I remember it's realyl difficult to trigger; it's ~10
> years since I saw an example to trigger it, and can't remember it.

AFAICT, Ztso allows the forwarding in question too.  Simulations with
the axiomatic formalization confirm such expectation:

RISCV intra-processor-forwarding
{
0:x5=1; 0:x6=x; 0:x8=y;
1:x5=1; 1:x6=y; 1:x8=x;
}
 P0          | P1          ;
 sw x5,0(x6) | sw x5,0(x6) ;
 lw x9,0(x6) | lw x9,0(x6) ;
 lw x7,0(x8) | lw x7,0(x8) ;
exists
(0:x7=0 /\ 1:x7=0 /\ 0:x9=1 /\ 1:x9=1)

Test intra-processor-forwarding Allowed
States 4
0:x7=0; 0:x9=1; 1:x7=0; 1:x9=1;
0:x7=0; 0:x9=1; 1:x7=1; 1:x9=1;
0:x7=1; 0:x9=1; 1:x7=0; 1:x9=1;
0:x7=1; 0:x9=1; 1:x7=1; 1:x9=1;
Ok
Witnesses
Positive: 1 Negative: 3
Condition exists (0:x7=0 /\ 1:x7=0 /\ 0:x9=1 /\ 1:x9=1)
Observation intra-processor-forwarding Sometimes 1 3
Time intra-processor-forwarding 0.00
Hash=518e4b9b2f0770c94918ac5d7e311ba5

  Andrea

