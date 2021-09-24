Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9B37417762
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Sep 2021 17:19:11 +0200 (CEST)
Received: from localhost ([::1]:40622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTmyl-000815-1M
	for lists+qemu-devel@lfdr.de; Fri, 24 Sep 2021 11:19:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57554)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mTmwh-0005d8-Df; Fri, 24 Sep 2021 11:17:03 -0400
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a]:33326)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mTmwU-0001sc-80; Fri, 24 Sep 2021 11:17:03 -0400
Received: by mail-ed1-x52a.google.com with SMTP id c21so36892558edj.0;
 Fri, 24 Sep 2021 08:16:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=SauvnnXTScXFMiq4ZumTHnWQ42TlM0ud4KL5Y+OhEC0=;
 b=cxV9M+xOidaDXnRcYvirRkNx+bK0ZL2LB/YHIwqV6EFgYBS49uSJO4+D3JTY/e+xLC
 EzS9dWZP+PB1LIutFYjdiN2vgpD8mzZEL5ipeJTYb67+5+8dXXWnvEsOXl2jN568E5ng
 lOx1yFm1nc+VUMTc+hk4vlYHL53Mbc9HQX5+GqDGy4ShBsiaj6owz2WjrpyR4S4acK5c
 uA1/X/UVxb+1pN+I3EBa0RFZcmny2UjBsYmE/OoaWcnA9Pn+XeNT1cOGz3QzUgcHiklO
 8YJtkdOr4+/u8YtoNoD1sChFsDgAyEgvKJTxM+dmbnoBP11MdzQqdxH2H2ik8KB9DaFn
 zkxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=SauvnnXTScXFMiq4ZumTHnWQ42TlM0ud4KL5Y+OhEC0=;
 b=zBhb3cO0cKIhoKuRFQmMNPl+QMiKc/L6wulzNYHbuqbTaD4ABstsZFqpf0EGSEpsKr
 orblWsZIO4NP1SPqa9T7zBO+uYrY5rMID1uYX8a82Fu4Xt8EN7KSUelDqYyoXatsE1j8
 cTx7TZ5V2vtS5esdxGKC+7fpiWfveD4dlu8BOg8i0LNAz76H7VQHBHLoNATMFjtLS6Dm
 H1VRjJyWDlLKgVfXcWWeGp713jJir3SxxpTxvIbTowAa+BTbeTeG4gVH55XC7O/E8apd
 ziT5UtMmBrIXG66ygso3Vq9pX1sEtaYX7K+C71iS4v51aSwgWVIb6v7fUagZR9QC6zUh
 sL5Q==
X-Gm-Message-State: AOAM531Z61uFY8be2R9C9Hz2TbgwY/R4G4hv5nk75MXgKDx8XXf3WZ4Q
 t/lU8T2VxpAOMFuMA0eQM/8=
X-Google-Smtp-Source: ABdhPJwalksvOX353GVDdZphDqlMA6Df4xk8AzHUqMbSCFL0kD50GIt93WaCJV65BQ5M+ityUoIAwQ==
X-Received: by 2002:a17:906:774f:: with SMTP id
 o15mr11538655ejn.200.1632496607621; 
 Fri, 24 Sep 2021 08:16:47 -0700 (PDT)
Received: from [192.168.1.36] (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id m29sm8696435wrb.89.2021.09.24.08.16.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Sep 2021 08:16:47 -0700 (PDT)
Message-ID: <b466a1f8-4459-b6f5-ad3e-51370231ec94@amsat.org>
Date: Fri, 24 Sep 2021 17:16:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v2 0/5] Reduce load on ppc target maintainers
Content-Language: en-US
To: David Gibson <david@gibson.dropbear.id.au>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
References: <20210924095536.441849-1-david@gibson.dropbear.id.au>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20210924095536.441849-1-david@gibson.dropbear.id.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x52a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: peter.maydell@linaro.org, dbarboza@redhat.com, aik@ozlabs.ru,
 mark.cave-ayland@ilande.co.uk, groug@kaod.org,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>, clg@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/24/21 11:55, David Gibson wrote:
> Greg Kurz and myself have been co-maintainers for the ppc and ppc64
> targets for some time now.  However, both our day job responsibilities
> and interests are leading us towards other areas, so we have less time
> to devote to this any more.
> 
> Therefore, here's a bunch of updates to MAINTAINERS, intended to
> reduce the load on us.  Mostly this is marking fairly obscure
> platforms as orphaned (if someone wants to take over maintainership,
> let me know ASAP).  Bigger changes may be coming, but we haven't
> decided exactly what that's going to look like yet.
> 
> Changes since v1:
>   * Reworked how OpenPIC is listed
> 
> David Gibson (5):
>    MAINTAINERS: Orphan obscure ppc platforms
>    MAINTAINERS: Remove David & Greg as reviewers for a number of boards
>    MAINTAINERS: Remove David & Greg as reviewers/co-maintainers of
>      powernv
>    MAINTAINERS: Add information for OpenPIC
>    MAINTAINERS: Demote sPAPR from "Supported" to "Maintained"
> 
>   MAINTAINERS | 42 ++++++++++++++----------------------------
>   1 file changed, 14 insertions(+), 28 deletions(-)
> 

So after this series we still have:

PowerPC TCG CPUs
M: David Gibson <david@gibson.dropbear.id.au>
M: Greg Kurz <groug@kaod.org>
L: qemu-ppc@nongnu.org
S: Maintained
F: target/ppc/
F: hw/ppc/
F: include/hw/ppc/
F: disas/ppc.c
F: tests/acceptance/machine_ppc.py

You might want to drop the *hw/ppc* lines which should
be covered elsewhere now.

tests/acceptance/machine_ppc.py should be split in multiple
files to ease the tests maintainance.

Thanks for staying PPC/TCG maintainers :)

Regards,

Phil.

