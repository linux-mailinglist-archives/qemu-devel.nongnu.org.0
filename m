Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C187544DDD
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 15:39:30 +0200 (CEST)
Received: from localhost ([::1]:35984 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzINl-0005Mk-2l
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 09:39:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45038)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzG3a-0003ER-27
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 07:10:30 -0400
Received: from mail-yb1-xb32.google.com ([2607:f8b0:4864:20::b32]:36544)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzG3Y-0001Ge-JQ
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 07:10:29 -0400
Received: by mail-yb1-xb32.google.com with SMTP id k2so1816860ybj.3
 for <qemu-devel@nongnu.org>; Thu, 09 Jun 2022 04:10:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=suAm6ZTDZIs9iFlfm6fgwQ/veDXUU3Qf3j53mLW/Los=;
 b=kOxTA92INfef3OoCpuXHPDdjQwhwx2OBK8lYrQQJkFxDV6Jru5F+Y4OsJm5YJtWRlu
 WICMoEfcVcS+XOITBI50kF9Mtu88ReS7ucFYTQ7b3LRPIUhRL65ng3lXSXOVNgRXkxTj
 mVYWCB9NB911F5jMm4qXSM54srp1meEAvqTjn/TX3Qk8uMgq4lob4scas0b41sPFIwet
 DSod45QX+ZD5M3fYTznROx1PnTMQCbzFTlKE23LGwWJWWDURQeXFiaPR5lUrBqr84VvH
 6XE2MbRPTq+POsWjeduP7Jl1F72MPXqokEdq3XehPrXG/LGb9JcPV+j77P4Smprvs5wv
 cIng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=suAm6ZTDZIs9iFlfm6fgwQ/veDXUU3Qf3j53mLW/Los=;
 b=VErGiCAJaWXR7vK5QYlnIVrkFx+fWQSKV6UzuAm7Lh4dVNpfVmpHGzYCnyRpbXTvVF
 sYjHQ4pz0zPvDcYWQVH3qcXF2dQfF+H5EaU/6mqZ0Bp01EP/OX2p/vI+XCFzCilCWtfd
 ychAE4qO3WF2hou3UbMmXekTA1IoNDmI8OKGgfwPrTcG5vP6yXBAjaZX5+feWqz1qtvH
 Fyeyn5ffni6VUG208vf6qyrhuIW0r6Qx3W0B0Dc2BvTVd5vUJ1mBCho7T8Ulqc6iHzum
 LaAV8UA6+h94fpINVAuO3Ub8XIF/TuarnrkmFH5Guqlg8dRWZCbgqSq5fMXSuN2umKqH
 ujHA==
X-Gm-Message-State: AOAM533Pyp5QY2w3ZNhjasKjbqHldglgJBjFwor6jRiOFRNLiCl1UXsQ
 PJ/43hG0OjcJzQC5e5UPF52YYtdYgpiOKHX2FdlARg==
X-Google-Smtp-Source: ABdhPJw4TNj1zcZqcsSZoe40WQNv0jc5qJJeE6SkUPbeL4Tz1bWWHmQmyIUBD6FE+B852II2+VcfH+Sxhdx/iclHHXQ=
X-Received: by 2002:a5b:14c:0:b0:64f:c826:a76b with SMTP id
 c12-20020a5b014c000000b0064fc826a76bmr38713967ybp.479.1654773027239; Thu, 09
 Jun 2022 04:10:27 -0700 (PDT)
MIME-Version: 1.0
References: <20220522181836.864-1-mark.cave-ayland@ilande.co.uk>
 <20220522181836.864-40-mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20220522181836.864-40-mark.cave-ayland@ilande.co.uk>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 9 Jun 2022 12:10:17 +0100
Message-ID: <CAFEAcA-cH-pE0yQw5Sa_UiSjLSKnkhS275YSLOPE4rvwA_M1ag@mail.gmail.com>
Subject: Re: [PATCH 39/50] lasips2: rename lasips2_init() to lasips2_initfn()
 and update it to return the LASIPS2 device
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc: richard.henderson@linaro.org, deller@gmx.de, mst@redhat.com, 
 pbonzini@redhat.com, hpoussin@reactos.org, aleksandar.rikalo@syrmia.com, 
 f4bug@amsat.org, jiaxun.yang@flygoat.com, qemu-arm@nongnu.org, 
 qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b32;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb32.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

On Sun, 22 May 2022 at 19:20, Mark Cave-Ayland
<mark.cave-ayland@ilande.co.uk> wrote:
>
> When QOMifying a device it is typical to use _init() as the suffix for an
> instance_init function, however this name is already in use by the legacy LASIPS2
> wrapper function. Eventually the wrapper function will be removed, but for now
> rename it to lasips2_initfn() to avoid a naming collision.
>
> At the same time update lasips2_initfn() return the LASIPS2 device so that it
> can later be accessed using qdev APIs by the HPPA machine.
>
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

