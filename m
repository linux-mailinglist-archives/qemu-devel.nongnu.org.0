Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DAD1C2D3668
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 23:45:00 +0100 (CET)
Received: from localhost ([::1]:51052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmlj9-0002St-Um
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 17:44:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35130)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stephane.duverger@free.fr>)
 id 1kmleV-0006HP-SG
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 17:40:13 -0500
Received: from smtp4-g21.free.fr ([2a01:e0c:1:1599::13]:52442)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stephane.duverger@free.fr>)
 id 1kmleR-0006pF-TP
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 17:40:11 -0500
Received: from wise (unknown [78.207.163.35])
 (Authenticated sender: stephane.duverger@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 9208E19F57B;
 Tue,  8 Dec 2020 23:39:59 +0100 (CET)
Date: Tue, 8 Dec 2020 23:39:52 +0100
From: Stephane Duverger <stephane.duverger@free.fr>
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Subject: Re: x86 TCG helpers clobbered registers
Message-ID: <20201208223952.GA36560@wise>
References: <20201204153446.GA66154@wise>
 <1d246e29-b364-099f-440c-5b644087b55f@linaro.org>
 <20201205013402.GA69224@wise>
 <5718f49e-8e17-17ae-45ec-94347f0a009d@linaro.org>
 <20201207101029.GA96540@wise>
 <4ee3b75a-c778-3cf5-2516-9c9290d96b44@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4ee3b75a-c778-3cf5-2516-9c9290d96b44@linaro.org>
Received-SPF: none client-ip=2a01:e0c:1:1599::13;
 envelope-from=stephane.duverger@free.fr; helo=smtp4-g21.free.fr
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Dec 08, 2020 at 03:18:54PM -0600, Richard Henderson wrote:
> As for modifying the fast path cases, the code is quite delicate,
> and you run into problems with live registers.  Which could be
> worked around in each backend, but... why?

Perhaps thinking that working at IR level would prevent these live
registers issues, seconded by the fact that vCPU TLBs handling seem to
be tcg-target agnostic.

But I do understand your position, have no patch suggesting a viable
alternative implementation, and most of all don't want to take more of
your time.

I appreciated the discussion and your help Richard. Thanks again.

