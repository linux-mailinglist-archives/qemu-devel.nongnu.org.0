Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D1E22B9DE4
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Nov 2020 23:57:46 +0100 (CET)
Received: from localhost ([::1]:37612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfss5-0001Fi-Fv
	for lists+qemu-devel@lfdr.de; Thu, 19 Nov 2020 17:57:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35116)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ale@rev.ng>) id 1kfsoS-0006oe-RX
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 17:54:00 -0500
Received: from rev.ng ([5.9.113.41]:53943)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ale@rev.ng>) id 1kfsoR-0004ra-51
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 17:54:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=rev.ng;
 s=dkim; h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=IFDuTM7rQuwwbxsoSjhTxM72ej5TvTHfSGi1EtFllUs=; b=vRNH5QfGaxmr6q7mSCYwXdopDq
 PpHzeMFkJGQtUwEIDFo2aW44V21QmMKtzL7WiZClGnrHxzzxhxNpDfrSmy8aNuo00ZX9PbwwVolDv
 FTcBQ26VZF71Yz5/Kiax5JyzFgYgQ8AGmrLd6UtIhBx86RLHQ58NoxtOFscfjioVKrqM=;
Date: Thu, 19 Nov 2020 23:53:40 +0100
To: Taylor Simpson <tsimpson@quicinc.com>
Cc: qemu-devel@nongnu.org, bcain@quicinc.com, richard.henderson@linaro.org,
 at.org@qualcomm.com, laurent@vivier.eu
Subject: Re: [RFC PATCH v5 20/33] Hexagon (target/hexagon) generator phase 2
 - generate header files
Message-ID: <20201119235340.418ffabf@orange>
In-Reply-To: <1604016519-28065-21-git-send-email-tsimpson@quicinc.com>
References: <1604016519-28065-1-git-send-email-tsimpson@quicinc.com>
 <1604016519-28065-21-git-send-email-tsimpson@quicinc.com>
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
Reply-to: Alessandro Di Federico <ale.qemu@rev.ng>
From: Alessandro Di Federico via <qemu-devel@nongnu.org>

On Thu, 29 Oct 2020 19:08:26 -0500
Taylor Simpson <tsimpson@quicinc.com> wrote:

> +from hex_common import *

I'd suggest to avoid `import *`.

See:

    python -c 'import this' | sed -n '4p'

-- 
Alessandro Di Federico
rev.ng

