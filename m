Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E3B676F4818
	for <lists+qemu-devel@lfdr.de>; Tue,  2 May 2023 18:12:49 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ptsbn-0004m8-Ak; Tue, 02 May 2023 12:12:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ptsbh-0004kw-0t
 for qemu-devel@nongnu.org; Tue, 02 May 2023 12:12:01 -0400
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ptsbb-0002Az-6G
 for qemu-devel@nongnu.org; Tue, 02 May 2023 12:12:00 -0400
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-956eacbe651so805793266b.3
 for <qemu-devel@nongnu.org>; Tue, 02 May 2023 09:11:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683043909; x=1685635909;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=LprwXtVwFSGcGun4/bwMCVjX1R9MCpd/Hpmv+3jmq18=;
 b=FVw/amibW0/saDpimMef0Q7d35/PTHrtm/UrrDV6K4bnaSXMiJxAWuDCr0/X+ZJo0B
 ufrGebO6GmKP2iueAnJb/yEYdhSoRw7r0GPxa8fXBD0dz6tNxnql3H0666wrp1K/PRWl
 tnaaPhR66fYstYhoTzn/BHeTgIwAHAHYXmukF6wDABB5WcaneQQ00EPWh/BbVS/j8WJ4
 8/F5ncrgZizp40t2bgzbL9qIE0dxG3DTHQdsErm58ls9ahPPQi/zfxQMNDOi9nce7Gs/
 uT1z6Fsxbd7KAbmbnd4kmKVJOhJtqArwdKvJTU8EZcNsD7hqt3boe4ZCBXT0jl2n3zcC
 O9uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683043909; x=1685635909;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LprwXtVwFSGcGun4/bwMCVjX1R9MCpd/Hpmv+3jmq18=;
 b=bNSDHpnmOrJXepWbQz1fE/MndtVInIOw+Nbm3wgPA85T7FYfweLZF+lhB1KvCJAzkM
 62sdQnT+ufLXIlm6Le97e3INkxBEbVArwvxabaiZ7TqueC7oB2UwRGbyn0hSLMo6J+/X
 REXmh+KKty4wPC624YNd6ySHdnuLrQcpcAkGrxMsiae/uDCq7imggIVuDOFImE8UnlVz
 +CM85OPYr3MjKc+FujY4ckrKjnIHxdLhceTWQn+fxTxBgVjoRfH9HOs1XygSkOaThtUh
 DhFkafkAr/2j7hugJqUbCxqmQXrjCAdzAdCQCxRKM2SeY74dsiPcRNS2RRPS6boNY9PT
 ECsQ==
X-Gm-Message-State: AC+VfDxytnkbegFz73+9QprYh57gTzataisavo4sQLlu6eqIq6BsEikN
 GljWGJflpdcVoNEsOJEtdRxeCxb2H3kNBb+ULU1uFHPLC4AONfSs
X-Google-Smtp-Source: ACHHUZ5q2cN66Fr/se//EIEoqDC5MN7XZzzJljdR1Oc2WApWv1M7HGxt8y6WHpto5dDk3HNRzsmwNan5NrhQ0xwYgOg=
X-Received: by 2002:a17:906:dacd:b0:94f:1c90:cb70 with SMTP id
 xi13-20020a170906dacd00b0094f1c90cb70mr385681ejb.66.1683043909377; Tue, 02
 May 2023 09:11:49 -0700 (PDT)
MIME-Version: 1.0
References: <20230425193146.2106111-1-richard.henderson@linaro.org>
In-Reply-To: <20230425193146.2106111-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 2 May 2023 17:11:38 +0100
Message-ID: <CAFEAcA-R5uNg19c7VfvJ5bzZWLhkcUUwmucHwe8ZeJYMQ-vCeg@mail.gmail.com>
Subject: Re: [PATCH v3 00/57] tcg: Improve atomicity support
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-s390x@nongnu.org, 
 qemu-riscv@nongnu.org, qemu-ppc@nongnu.org, git@xen0n.name, 
 jiaxun.yang@flygoat.com, philmd@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x633.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, 25 Apr 2023 at 20:32, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> v1: https://lore.kernel.org/qemu-devel/20221118094754.242910-1-richard.henderson@linaro.org/
> v2: https://lore.kernel.org/qemu-devel/20230216025739.1211680-1-richard.henderson@linaro.org/
>
> Based-on: 20230424054105.1579315-1-richard.henderson@linaro.org
> ("[PATCH v3 00/57] tcg: Simplify calls to load/store helpers")
>
> The main objective here is to support Arm FEAT_LSE2, which says that any
> single memory access that does not cross a 16-byte boundary is atomic.
> This is the MO_ATOM_WITHIN16 control.
>
> While I'm touching all of this, a secondary objective is to handle the
> atomicity of the IBM machines.  Both Power and s390x treat misaligned
> accesses as atomic on the lsb of the pointer.  For instance, an 8-byte
> access at ptr % 8 == 4 will appear as two atomic 4-byte accesses, and
> ptr % 4 == 2 will appear as four 3-byte accesses.

I hope you mean "four 2-byte accesses", although I'm never
quite sure how odd s390x can get :-)

-- PMM

