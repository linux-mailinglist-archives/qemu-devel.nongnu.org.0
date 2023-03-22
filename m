Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20B726C5942
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Mar 2023 23:07:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pf6Ok-0004Yc-FA; Wed, 22 Mar 2023 17:53:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ale@rev.ng>) id 1pf6OB-0004Y7-Jg
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 17:52:59 -0400
Received: from rev.ng ([5.9.113.41])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ale@rev.ng>) id 1pf6Nx-0003ZM-HL
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 17:52:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=rev.ng;
 s=dkim; h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=m6BG/qBOF+49sRQS/s18/yMSlBP6KWALwDFexX6CHQQ=; b=CUprftPjUCugFkFUg/cd5/cekl
 ex6S0kKvvDnC/8FQPDK4LfVQzsc9SF3I+xK6XZnp1EQLDOn6q5v8iwI4p3JUA/NtaHCzrYtsXU1Ft
 bhXb5/ab808IaiNoROI0XE1JdFzmAaoIgA1WyUr4CjO+c6JO4ZebYRRCxWEtNMSaWmcs=;
Date: Wed, 22 Mar 2023 22:15:35 +0100
To: Richard Henderson <richard.henderson@linaro.org>
Cc: Alex =?UTF-8?B?QmVubsOpZQ==?= <alex.bennee@linaro.org>, Philippe
 =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@linaro.org>,
 qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost
 <eduardo@habkost.net>
Subject: Re: [PATCH 06/10] includes: move irq definitions out of cpu-all.h
Message-ID: <20230322221535.5e4d7e6e@orange>
In-Reply-To: <a687d922-3ab0-d947-b664-0d313f817c75@linaro.org>
References: <20230320101035.2214196-1-alex.bennee@linaro.org>
 <20230320101035.2214196-7-alex.bennee@linaro.org>
 <20230321170652.170d1741@orange>
 <a687d922-3ab0-d947-b664-0d313f817c75@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=5.9.113.41; envelope-from=ale@rev.ng; helo=rev.ng
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-to:  Alessandro Di Federico <ale@rev.ng>
From:  Alessandro Di Federico via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, 21 Mar 2023 22:25:02 -0700
Richard Henderson <richard.henderson@linaro.org> wrote:

> No, this is not c++.

It's not C++, but this seems to be the direction the C language is
headed: C23 will introduce constexpr. No biggie though, I understand
it' be a huge change for little return.

-- 
Alessandro Di Federico
rev.ng Labs

