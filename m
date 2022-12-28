Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C44E765759E
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Dec 2022 12:06:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pAUEj-0005GE-Kc; Wed, 28 Dec 2022 06:04:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ale@rev.ng>)
 id 1pAUER-0005EI-Eo; Wed, 28 Dec 2022 06:04:24 -0500
Received: from rev.ng ([5.9.113.41])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ale@rev.ng>)
 id 1pAUEP-0007gr-R6; Wed, 28 Dec 2022 06:04:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=rev.ng;
 s=dkim; h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=KDafz79801VyoVUiodW/5EjOq20HCSkbgkRPcfuv8AU=; b=Gae7OBWqCPsVHcMQcgbkhSnNid
 V//8mWVgfYCboOpKYXlacth4gYRFPGdE7/4MPIul8kh2/DDXRxy1YQ647Igw3GegzVyZzBD7byuYp
 iuISbmWocVrs72Fcexluhzx/61puxO+Dz6ceje7L+TOgrddGGP1QFDlizVwPLRHln7MU=;
Date: Wed, 28 Dec 2022 12:04:06 +0100
To: Matheus Tavares Bernardino <quic_mathbern@quicinc.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, tsimpson@quicinc.com
Subject: Re: [PATCH] target/hexagon/idef-parser: fix two typos in README
Message-ID: <20221228120406.63d6fd4d@orange>
In-Reply-To: <fe67371e03f9dde38eb7554937da0a96a230730e.1672174122.git.quic_mathbern@quicinc.com>
References: <fe67371e03f9dde38eb7554937da0a96a230730e.1672174122.git.quic_mathbern@quicinc.com>
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

On Tue, 27 Dec 2022 17:49:04 -0300
Matheus Tavares Bernardino <quic_mathbern@quicinc.com> wrote:

> Signed-off-by: Matheus Tavares Bernardino <quic_mathbern@quicinc.com>
> ---
>  target/hexagon/idef-parser/README.rst | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Alessandro Di Federico <ale@rev.ng>

Thanks for the fixes!

-- 
Alessandro Di Federico
rev.ng Labs

