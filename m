Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A31503B7462
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Jun 2021 16:33:10 +0200 (CEST)
Received: from localhost ([::1]:33006 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyEnU-0006ft-Vt
	for lists+qemu-devel@lfdr.de; Tue, 29 Jun 2021 10:33:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54562)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ale@rev.ng>) id 1lyEhZ-0005vH-2l
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 10:27:01 -0400
Received: from rev.ng ([5.9.113.41]:44601)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ale@rev.ng>) id 1lyEhW-0007o0-4C
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 10:27:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=rev.ng;
 s=dkim; h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Io8DozIEWiGC1MJpLa1JEngxJZpAy7W4XjsC57y3wz4=; b=EcfVLy6eubXJ+OoniI/LwKusfJ
 Ku482W1TeEegFNnswP+6TIC/sX5h7leFNcUywZhFLoUJMyBBiA2AqOP4ZjfaBrkU+rvo8/xx7TeoY
 TjL1XwhfuIG0ZQlxps9Uv9aX5NvP7uVMHR32g8OKkKgEG45uqzwJfxwTc3c6M7PQQnJI=;
Date: Tue, 29 Jun 2021 16:26:36 +0200
To: qemu-devel@nongnu.org, alex.bennee@linaro.org
Cc: tsimpson@quicinc.com, bcain@quicinc.com, babush@rev.ng, nizzo@rev.ng,
 philmd@redhat.com, richard.henderson@linaro.org
Subject: Re: [PATCH v5 14/14] gitlab-ci: do not use qemu-project Docker
 registry
Message-ID: <20210629162636.3762a3d4@orange>
In-Reply-To: <20210619093713.1845446-15-ale.qemu@rev.ng>
References: <20210619093713.1845446-1-ale.qemu@rev.ng>
 <20210619093713.1845446-15-ale.qemu@rev.ng>
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  Alessandro Di Federico <ale.qemu@rev.ng>
From:  Alessandro Di Federico via <qemu-devel@nongnu.org>

On Sat, 19 Jun 2021 11:37:13 +0200
Alessandro Di Federico <ale.qemu@rev.ng> wrote:

> From: Alessandro Di Federico <ale@rev.ng>
> 
> This commit is necessary in order to use container built by the
> current run of the CI. If we don't do this, we use official
> containers which are not affected by the additional dependencies
> we're introducing.
> 
> Signed-off-by: Alessandro Di Federico <ale@rev.ng>

Alex, what do you think about this?

-- 
Alessandro Di Federico
rev.ng

