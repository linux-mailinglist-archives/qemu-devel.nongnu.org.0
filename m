Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F4B03F89D2
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Aug 2021 16:09:46 +0200 (CEST)
Received: from localhost ([::1]:50378 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJG4e-0007Qo-U6
	for lists+qemu-devel@lfdr.de; Thu, 26 Aug 2021 10:09:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35104)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1mJG3a-0006XH-BV; Thu, 26 Aug 2021 10:08:38 -0400
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131]:36858)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1mJG3Y-00073B-Rg; Thu, 26 Aug 2021 10:08:38 -0400
Received: by mail-lf1-x131.google.com with SMTP id r9so7166005lfn.3;
 Thu, 26 Aug 2021 07:08:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=BjKuYdswOqSy3z980LflDXbiUQ4p4k3SDJCZrTQ02YY=;
 b=YZNrI6h6Ib4nKMbOwwqfDuJXIBC6uOdAbeYMqiluF5+cv6O97A7CpdsC8XsvkLl+Gk
 ivYs7cYBYfu0QzjW257b4/EcTxPlDida2NF4ffKHKXjahVQYyZfom0SauqJdj2vnj8RZ
 iGGXXVpk4fgBRjz4YnSvwwPslll99EgzWF/91/oihQmI52KY5Y43UPoJrHBXYfmjOaGi
 IgHEiG2H5kVn1bBJxCd7SFxRqCmNDn675Y4L8FQGnFLICgg/M8W2XY1jqMtN5g0mv+yF
 CuM80MlJS1TlnpBqhAp6VgpFeoQ74RH8vV5HMYWvtjMNTMm4z6y0U0LuqyL4jhDrTjPm
 6/xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=BjKuYdswOqSy3z980LflDXbiUQ4p4k3SDJCZrTQ02YY=;
 b=s5bx+tUnsmww76Vz+v3uRNGEvwvCCszqB0NB7vtaG2ZKMxEH7rLIl65AgjYGRsjcwh
 p5+zjNpwS2VwwAUr5TdHEQ6RV9xrZxs5z97Bf3juq3Vs/H5P1sVqWRA0VVvB0LqHiszf
 JiETHWLKekB4OCrdjFJr6VSIBUldpS5CIUJCe4NtOyT7RImS5qxskSMfuKdJZQtES3cW
 67AmDCg169pxJ9KqdLTjVDJW9JFDne4pLtlH102wv1D382UGetGfhiBc8/Gd/AwRWscL
 2/PbDxGnp/vb9R/VT/Z2jknAyyyWFel4zYDH7nhuC0hkpNoylcMGxUl84n8In90r0mtP
 8xeA==
X-Gm-Message-State: AOAM532lo7y7cEXJzUTNhWRyWaV5StCGcGzfUOEg7bceuk8e+GrpJWfD
 txxvDwrdzpEzzsp2xiB3YmI=
X-Google-Smtp-Source: ABdhPJwJLmnQpcX3hNiITFW4GgzD1r1U3B6s6jd8bCGVocCcAd7+HmrHxhr2YEFYN+4lTqhVg7eC6g==
X-Received: by 2002:a19:c197:: with SMTP id r145mr1986192lff.276.1629986913077; 
 Thu, 26 Aug 2021 07:08:33 -0700 (PDT)
Received: from gmail.com (81-231-232-130-no39.tbcn.telia.com. [81.231.232.130])
 by smtp.gmail.com with ESMTPSA id 131sm354848ljj.52.2021.08.26.07.08.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Aug 2021 07:08:32 -0700 (PDT)
Date: Thu, 26 Aug 2021 16:08:32 +0200
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: Tong Ho <tong.ho@xilinx.com>
Subject: Re: [PATCH v2 0/9] hw/nvram: hw/arm: Introduce Xilinx eFUSE and BBRAM
Message-ID: <20210826140832.GL3586016@toto>
References: <20210823174924.201669-1-tong.ho@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210823174924.201669-1-tong.ho@xilinx.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::131;
 envelope-from=edgar.iglesias@gmail.com; helo=mail-lf1-x131.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 alistair@alistair23.me
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Aug 23, 2021 at 10:49:15AM -0700, Tong Ho wrote:
> This series implements the Xilinx eFUSE and BBRAM devices for
> the Versal and ZynqMP product families.
> 
> Furthermore, both new devices are connected to the xlnx-versal-virt
> board and the xlnx-zcu102 board.
> 
> See changes in docs/system/arm/xlnx-versal-virt.rst for detail.


Thanks Tong,

On the entire series:

Acked-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
Tested-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>

