Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E647D325262
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Feb 2021 16:26:57 +0100 (CET)
Received: from localhost ([::1]:46334 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFIXY-0003lR-Sj
	for lists+qemu-devel@lfdr.de; Thu, 25 Feb 2021 10:26:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46750)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ale@rev.ng>) id 1lFIVY-0002GB-9E
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 10:24:52 -0500
Received: from rev.ng ([5.9.113.41]:34305)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ale@rev.ng>) id 1lFIVV-0003LU-S7
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 10:24:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=rev.ng;
 s=dkim; h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=9lAPWz8Eo2uqGbkJERDoXPBP9p67nVEsuzgM5jczxoA=; b=qaBpvV7nH/aB12in695AAF49zq
 X1sDTXMkRBK32k6UNnYQixzWcj9UYRd2nYGO+wvohA7G/jDc2H7GHe3Tce28bFWmaswcFT3LZ/pYB
 V9guSJednZOu7Vn0Dkjca7Qi+zvsNjK+hloxmIw2mqc5zts1H/Xb6JGgTb+UwYoilVNs=;
Date: Thu, 25 Feb 2021 16:24:36 +0100
To: Richard Henderson <richard.henderson@linaro.org>
Cc: Alessandro Di Federico <ale.qemu@rev.ng>, qemu-devel@nongnu.org,
 babush@rev.ng, bcain@quicinc.com, tsimpson@quicinc.com, nizzo@rev.ng
Subject: Re: [RFC PATCH 08/10] target/hexagon: import parser for idef-parser
Message-ID: <20210225162436.7132b02f@orange>
In-Reply-To: <85018b3a-bf9f-09b9-2415-fc68868f0cf2@linaro.org>
References: <20210211215051.2102435-1-ale.qemu@rev.ng>
 <20210211215051.2102435-9-ale.qemu@rev.ng>
 <85018b3a-bf9f-09b9-2415-fc68868f0cf2@linaro.org>
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
Reply-to:  Alessandro Di Federico <ale@rev.ng>
From:  Alessandro Di Federico via <qemu-devel@nongnu.org>

On Sun, 14 Feb 2021 08:56:11 -0800
Richard Henderson <richard.henderson@linaro.org> wrote:

> What version of bison are you using?

We were using a rather recent version of bison (3.7.5), but it's not
strictly required.

Fixed in v2.

-- 
Alessandro Di Federico
rev.ng

