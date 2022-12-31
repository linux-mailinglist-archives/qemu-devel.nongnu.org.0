Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B622365A4BF
	for <lists+qemu-devel@lfdr.de>; Sat, 31 Dec 2022 15:02:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pBcQ0-0006tK-3H; Sat, 31 Dec 2022 09:01:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ale@rev.ng>) id 1pBcPs-0006rt-MR
 for qemu-devel@nongnu.org; Sat, 31 Dec 2022 09:00:54 -0500
Received: from rev.ng ([5.9.113.41])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ale@rev.ng>) id 1pBcPq-0007Kl-SY
 for qemu-devel@nongnu.org; Sat, 31 Dec 2022 09:00:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=rev.ng;
 s=dkim; h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=BHQKYgBrcuQiPDoSFFU/YgcyAR8tevM9oLKUBpvbHOk=; b=iQXGmNHNWKQA6hoF/OatIFtJ+L
 6Wi7H1YsXxOiBHQb3Qyo+l7D2JUNcJAwm5aMO+sLyZXWsACXL+R48ixRec/37Wqwlug7dhjy6xCUC
 dmQ3tGdH+/kfYbR7yp6ozGMWsdYi8QHCAQTvOaMnVoK39nk6LvqZcLnCtV5nd1+cPsgg=;
Date: Sat, 31 Dec 2022 13:48:36 +0100
To: Zongyuan Li <zongyuan.li@smartx.com>
Cc: Anton Johansson <anjo@rev.ng>, qemu-devel@nongnu.org
Subject: Re: [PATCH 1/1] target/hexagon: work around unused variable in
 yyparser
Message-ID: <20221231134836.62509244@orange>
In-Reply-To: <20221231091935.152590-1-zongyuan.li@smartx.com>
References: <20221231091935.152590-1-zongyuan.li@smartx.com>
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

On Sat, 31 Dec 2022 17:19:35 +0800
Zongyuan Li <zongyuan.li@smartx.com> wrote:

> Variable 'yynerrs' is recognized as unused variable in clang15,

This issue is already handled by another similar patch (target/hexagon:
suppress unused variable warning) that will soon end up in a pull
request.

Thanks for looking into this though.

-- 
Alessandro Di Federico
rev.ng Labs

