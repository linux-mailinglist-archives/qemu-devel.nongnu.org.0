Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B78B30A638
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Feb 2021 12:10:03 +0100 (CET)
Received: from localhost ([::1]:52314 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6X5m-0001HW-NQ
	for lists+qemu-devel@lfdr.de; Mon, 01 Feb 2021 06:10:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43018)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1l6X4S-0008VH-3Y; Mon, 01 Feb 2021 06:08:42 -0500
Received: from kylie.crudebyte.com ([5.189.157.229]:50609)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1l6X4O-0007JR-EQ; Mon, 01 Feb 2021 06:08:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=5jdSVpy/1KSbNdZK0RnYNaH3tEI5Tt5lBT5F+axQkIM=; b=jNR36+vZN7K4f6vizdCFhK0VWe
 YjGK9XECVeAEJ++IMRmwxi9cb2qPQSh0U7EKjviF4ZDZIhqw2ey1FO1XWMyqGN2fHqCqTNPbuD2/7
 D9GCO/7ef0hOVQDEK8uSJ7OaHOhqvp1rsFEFxPZAmkqINVNmSEs56E0rdg4jFx/nnZdjEnq8WOzrf
 nDLXph6cixFF/dW9CoypGqlhhUnqs9vyPC4QpOo9HNwPxTONGsf8Pa+HRLXCR2VophTMcIysnlHAk
 6oDArMLcETJZPQTN5CqLZNSJ6B6S3slAHQvfBYAb3vjyz73013uR6dPFgm7u/cgDJjCx7NF67z+LL
 elOUT367H+NQ72JVZ7wPqNoBoOXr2JXMUOqrbkMVd6+KKPQ/IeHfhaCyeykSPodQKFdnCws83YtEe
 plfBKIAAZAdOT8F6qCEXmK69JX5P1U1qEle/pipoBMyarB8eJGu/1HoQTVhWRR1/MQLQMgBgyBJQ3
 CQpCeQbt4bC5SCqeGZgBTHpC2S9ZA/coDewXtfD+3rmrmMt2mOcTspWaWtIfuq9bbm5KtyaRKoLDA
 QTdZrgC6H+1IM4ZeEq62D63ozlAuEOlGYS85fC9vxNdGlO9r379AQfUtFqUQytTjiFgo4EGKwiYbd
 tVkyqNpdHkmwihg3vJqHe3Z38Gj8aN6e4Q4KC7uIM=;
To: qemu-devel@nongnu.org
Subject: Re: [PATCH] MAINTAINERS: add my github tree URL
Date: Mon, 01 Feb 2021 12:08:27 +0100
Message-ID: <6250520.xprUBRPNkx@silver>
In-Reply-To: <20210201110810.28b58ddc@bahia.lan>
References: <E1l5rYG-0005sv-87@lizzy.crudebyte.com>
 <20210201110810.28b58ddc@bahia.lan>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Received-SPF: pass client-ip=5.189.157.229;
 envelope-from=qemu_oss@crudebyte.com; helo=kylie.crudebyte.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Cc: qemu-trivial@nongnu.org, Greg Kurz <groug@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  Christian Schoenebeck <qemu_oss@crudebyte.com>
From: qemu_oss--- via <qemu-devel@nongnu.org>

On Montag, 1. Februar 2021 11:08:10 CET Greg Kurz wrote:
> On Sat, 30 Jan 2021 15:39:14 +0100
> 
> Christian Schoenebeck <qemu_oss@crudebyte.com> wrote:
> > I already used this github URL for PRs before and will continue to use it
> > in foreseeable future.
> > 
> > Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
> > ---
> 
> Reviewed-by: Greg Kurz <groug@kaod.org>
> 
> Unless you're planning to send a PR soon, I guess this can go
> through the trivial tree.

Yes, I would appreciate if that's going through the trivial queue, as it will 
indeed take a while for my next PR.

Thanks!

Best regards,
Christian Schoenebeck



