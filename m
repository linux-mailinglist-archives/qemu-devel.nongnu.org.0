Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 340752D788F
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 16:04:00 +0100 (CET)
Received: from localhost ([::1]:49934 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knjxf-0000LQ-8E
	for lists+qemu-devel@lfdr.de; Fri, 11 Dec 2020 10:03:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1knjur-00077N-Mz
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 10:01:05 -0500
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631]:35451)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1knjuo-0005u6-RD
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 10:01:04 -0500
Received: by mail-ej1-x631.google.com with SMTP id f23so12768932ejk.2
 for <qemu-devel@nongnu.org>; Fri, 11 Dec 2020 07:01:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/XB560NryjUGuFjmBhrqM/yLUzNMNWxFqcILxiYMJcw=;
 b=So2tSKpodw65uM0BXq5LMlQm8RKyOZ/fEXAkA5FYA+3VpSmundwZPUk04dSbQMgtFR
 zD+X6zzNuyqfJI2VRFUCjQlG3oJsnJSE3fPqA0wskPMJ882JHo/gv1FLqVEMYDvzmb+8
 GWxq9OPK+hf0gm4DgiWopsYNjMhxxeN0lnEsmtqk6V7VJPZ/e3+5C3wqS5csFAKFr8Q/
 XbeMGck3d8L13xxY2eTV7E5M6eaNt7izkzgjDN7Ow6O4UlzsH7TSYATsdA3LooNo8qcY
 JFiY1aX6PBPfUNETdNPWq0yxxJwTma8idOjl8aSfrkxxsMHREYEjA0acd43mZz40HnNQ
 7K4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/XB560NryjUGuFjmBhrqM/yLUzNMNWxFqcILxiYMJcw=;
 b=khUZpzgpXv+6E0bZsiclgUGz9mafnSNibmGXbdLn4DTrm3w1ZuWDcNnVpNhuHZhoB4
 uTMN7GCipBCJDDm5IrGt2uvwGZBW6MFVrIXpF8YuLHyXFJhHh1IduzIEqeJCgi6ZkB3q
 +PU4ZACXHdN15aGzTJmPhW19ms5adP4nTpoW7YRxBVERv2vA+/i5ODkjYnLCOODWKxYy
 K8+We/FDvvzypXdp5QUyF47ghX9znZAYPTX6Kt/2eSxEnW/AyFltMuGIin8e7vhw1UHp
 sOwPwja2FHsP4Cw0rlJ+/KfJeuons2xrwr8qy2a5TaAtjNraap0pwq536REs/Z3mvQg5
 PUjQ==
X-Gm-Message-State: AOAM530Ug/yZZbw4av+1hvjhmp9xWy2sB2NaUk2FTf3tIQE6hAnV+Bt+
 et1BhckdMSVkcUcgdXQah0vU9RAG1mJfvA9zoQKKYw==
X-Google-Smtp-Source: ABdhPJzTZQ9AS3CwwHF02y+NrsPE9Ax0lt4NfruybAnA+5q4UPACUcWp+sB5wyqvCCU6/tpCt+tm7jZwNQbyukuXSMU=
X-Received: by 2002:a17:907:971c:: with SMTP id
 jg28mr11294262ejc.85.1607698855224; 
 Fri, 11 Dec 2020 07:00:55 -0800 (PST)
MIME-Version: 1.0
References: <20201211123103.615007-1-pbonzini@redhat.com>
In-Reply-To: <20201211123103.615007-1-pbonzini@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 11 Dec 2020 15:00:44 +0000
Message-ID: <CAFEAcA-Su3FXL+xJVTg7ezpazWcPCP2hxAXPAstPzMTS-Q2KnQ@mail.gmail.com>
Subject: Re: [PULL v2 000/113] First batch of misc (i386, kernel-doc, memory, 
 vl.c) changes for QEMU 6.0
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x631.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 11 Dec 2020 at 12:34, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> The following changes since commit 379e9eaed497a2e09b5985e1e15967d7bfea8296:
>
>   Merge remote-tracking branch 'remotes/legoater/tags/pull-aspeed-20201210' into staging (2020-12-10 14:26:35 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/bonzini/qemu.git tags/for-upstream
>
> for you to fetch changes up to 953d0c333e2825656ba1ec5bd1c18bc53485b39c:
>
>   scripts: kernel-doc: remove unnecessary change wrt Linux (2020-12-10 12:15:25 -0500)
>
> ----------------------------------------------------------------
> * Fix for NULL segments (Bin Meng)
> * Support for 32768 CPUs on x86 without IOMMU (David)
> * PDEP/PEXT fix and testcase (myself)
> * Remove bios_name and ram_size globals (myself)
> * qemu_init rationalization (myself)
> * Update kernel-doc (myself + upstream patches)
> * Propagate MemTxResult across DMA and PCI functions (Philippe)
> * Remove master/slave when applicable (Philippe)
> * WHPX support for in-kernel irqchip (Sunil)
>
> ----------------------------------------------------------------
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.0
for any user-visible changes.

-- PMM

