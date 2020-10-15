Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6417628F586
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Oct 2020 17:06:59 +0200 (CEST)
Received: from localhost ([::1]:46142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kT4qI-0005eZ-6f
	for lists+qemu-devel@lfdr.de; Thu, 15 Oct 2020 11:06:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44104)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kT4h1-0006kU-5c
 for qemu-devel@nongnu.org; Thu, 15 Oct 2020 10:57:29 -0400
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630]:32995)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kT4gv-0002iN-HU
 for qemu-devel@nongnu.org; Thu, 15 Oct 2020 10:57:20 -0400
Received: by mail-ej1-x630.google.com with SMTP id c22so4119548ejx.0
 for <qemu-devel@nongnu.org>; Thu, 15 Oct 2020 07:57:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=G0MtCDtWq/32YqRkQgDeY0B5ASaZ76/mMIxhaRr+/fo=;
 b=pMpwPpWtoVOjo5K05m+Kep9rlRTdq4hY/akrLz1CCA68nVvmGVgs8Xl2wKARLJRn5Q
 /ulFsgxcW00wW6SNnjhg5C+tzIBw9PZ9JkyRknB8nL36DX3CNWHvW32pRlgHUa9DJoiH
 MGGHCM/QUfRR/IpD1YFy35Mid8yQ+VtFMSWZUaDB5D1gsGTP02WhJgC5anoB86lcrmFR
 ZerCor+aCxkoc5pUy+R9mhlqjx+9fW9j5U5sVFdlrEbAsV4fsmsLlIV4iNnVzqoxFjtJ
 uD7kQEsP50h4Sq+KfrRQkCRyXl00WD2FPHpyCXqmrG8hnG7XZBChZZ0aLS0Jj43rstIy
 xxtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=G0MtCDtWq/32YqRkQgDeY0B5ASaZ76/mMIxhaRr+/fo=;
 b=CJG0C7WGflk6rPKyhTg+R4k510UzkSEcD5eE1rriiOgIIYjm7uAt1DLE2JI37+2EGB
 gc+SkzxkfOMW4b7lHpdnwxxzQJz8ayQGz3VoeocvVTGkpB4rvjK9/2wbEaa8sTOqqZX2
 kbLPkTI9nrHfku+UCzeptwkuz6f1LSbDaG5CUct8YVxdx4mIoZcRRA1gl3aBP1QZixpV
 B52/+Bmmbs5oMo6EjBBI4QU7Cg0TsQJjdXGElv3Jg4EZ6mWHzNqnkv0vuFJbtEPGRy3j
 JSlVVkcZ151Uv4PnEAmBOGc820JpDpjN0eNDhWhUpw3xEcIq++MOaCD1FAeJVHgTDs/f
 G87w==
X-Gm-Message-State: AOAM530jMVNDXM0qPhAku3sqsd7p4jZS8vrqxtgCdk5P5qITKnLbcELJ
 4EdBAmPJ7l4J8vE7Ha9qJM4Foh2Necu/12y6CTt2pQ==
X-Google-Smtp-Source: ABdhPJz1lIzvU38dvHqcMsbMHkWrDPEAFvCVE/tsPnZNgvVnBLtWLnAF6/xb4n+B6xmwp1QrE+zLRNxC5Jt9Srh51a8=
X-Received: by 2002:a17:906:3a97:: with SMTP id
 y23mr4946926ejd.250.1602773834128; 
 Thu, 15 Oct 2020 07:57:14 -0700 (PDT)
MIME-Version: 1.0
References: <20201015040639.70C6D414009F@webmail.sinamail.sina.com.cn>
 <7fecfc67da4caab1d677a8b4cd5386b3@kernel.org>
 <20201015133505.ubxvbrt6xyvl4362@kamzik.brq.redhat.com>
 <16400df4bdf79b8b22e824eb1a20e2b4@kernel.org>
 <20201015144104.ytwzpxjlsgyun3ob@kamzik.brq.redhat.com>
In-Reply-To: <20201015144104.ytwzpxjlsgyun3ob@kamzik.brq.redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 15 Oct 2020 15:57:02 +0100
Message-ID: <CAFEAcA-LBmbjp-Teb35f=O-1QtMLd8bAuq5XaCz9URdQZ1jxow@mail.gmail.com>
Subject: Re: Kernel patch cases qemu live migration failed.
To: Andrew Jones <drjones@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x630.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: qemu-devel <qemu-devel@nongnu.org>, Marc Zyngier <maz@kernel.org>,
 xu910121@sina.com, "Dave.Martin" <dave.martin@arm.com>,
 kvmarm <kvmarm@lists.cs.columbia.edu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 15 Oct 2020 at 15:41, Andrew Jones <drjones@redhat.com> wrote:
> The reporter states neither the source nor destination hardware supports
> SVE. My guess is that what's happening is the reserved ID register
> ID_UNALLOCATED(4,4) was showing up in the KVM_GET_REG_LIST count on
> the old kernel, but the new kernel filters it out. Maybe it is a
> bug to filter it out of the count, as it's a reserved ID register and
> I suppose the other reserved ID registers are still showing up?

Yeah, RES0 ID registers should show up in the list, because otherwise
userspace has to annoyingly special case them when the architecture
eventually defines behaviour for them.

Dave's comment in the kernel commit message
# ID_AA64ZFR0_EL1 is RO-RAZ for MRS/MSR when SVE is disabled for the
# guest, but for compatibility with non-SVE aware KVM implementations
# the register should not be enumerated at all for KVM_GET_REG_LIST
# in this case.
seems wrong to me -- for compatibility the register should remain
present and behave as RAZ/WI if SVE is disabled in the guest,
the same way it was before the kernel/KVM knew about SVE at all.

thanks
-- PMM

