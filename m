Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53AC96D3619
	for <lists+qemu-devel@lfdr.de>; Sun,  2 Apr 2023 10:13:18 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pisoS-0003GY-8C; Sun, 02 Apr 2023 04:11:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jk@codeconstruct.com.au>)
 id 1pisoO-0003Fk-Ge; Sun, 02 Apr 2023 04:11:40 -0400
Received: from pi.codeconstruct.com.au ([203.29.241.158]
 helo=codeconstruct.com.au)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jk@codeconstruct.com.au>)
 id 1pisoL-00043j-OM; Sun, 02 Apr 2023 04:11:39 -0400
Received: from pecola.lan (unknown [159.196.93.152])
 by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 13DAE20034;
 Sun,  2 Apr 2023 16:11:24 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=codeconstruct.com.au; s=2022a; t=1680423086;
 bh=36Gp7rFfeu77aH3le9I5pZVoUSVuSdVRIV929CK8Pe0=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References;
 b=NAeU0WaZ3CkcOjrIcCV0lvyhGI8oY1FO0TZLhkGuWv2EtLQWErBcwtR4dTjfhl5iv
 KG+utz2jeOUVjLXaOrYu4mNep4yzURojl7hRnLOTjXT4T1dbIr5FWE6jVTQvT0+egE
 HeFdCCLGhuan0YwK+O3eh8gYSwyElL4kLeA9XdG4Vv/CJTqnWBNbPlITGUEMyZ1yCh
 ILmuIJMK+UA57a7Fqe8uAPdvgZrmjpou6wEATkCiyv1cON3yhU4MpKwyPdqDOCWfq3
 XuF9NAf0ieidloPQYLpDiTsgryCTYc2UfS+pacNW8ry1KSxKgXFHC0SUoDi55HMcmr
 cbVvtRctGQOFQ==
Message-ID: <50b19eb8929da77f150c34585f805345e460daed.camel@codeconstruct.com.au>
Subject: Re: [PATCH 00/16] i3c: aspeed: Add I3C support
From: Jeremy Kerr <jk@codeconstruct.com.au>
To: =?ISO-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>, Ben Dooks
 <qemu@fluff.org>, Joe Komlodi <komlodi@google.com>
Cc: qemu-devel@nongnu.org, venture@google.com, peter.maydell@linaro.org,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>, qemu-arm
 <qemu-arm@nongnu.org>, Troy Lee <troy_lee@aspeedtech.com>, Graeme Gregory
 <quic_ggregory@quicinc.com>
Date: Sun, 02 Apr 2023 16:11:23 +0800
In-Reply-To: <74148c47-8232-02d3-2c37-d12c1fe156e2@kaod.org>
References: <20230331010131.1412571-1-komlodi@google.com>
 <20230401172825.tvmfms6qbh3tmi5s@hetzy.fluff.org>
 <74148c47-8232-02d3-2c37-d12c1fe156e2@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.3-1 
MIME-Version: 1.0
Received-SPF: pass client-ip=203.29.241.158;
 envelope-from=jk@codeconstruct.com.au; helo=codeconstruct.com.au
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hi C=C3=A9dric,

> > Isn't this the designware i3c ip block, and as such could we name
> > it so?=20
>=20
> Currently, QEMU only has a model for a dummy Aspeed I3C variant so
> this is a great addition.

[...]

> According to recent work on the kernel, it is indeed based on
> designware I3C :
> =C2=A0=C2=A0
> https://lore.kernel.org/all/20230331091501.3800299-1-jk@codeconstruct.com=
.au/
>=20
> Jeremy, how different is it ? Could we introduce properties or sub
> classes, to support both.

The differences (at least from the view of the current Linux driver
implementation) are very minor; unless we want to be errata-compatible,
you could use the dw driver directly, plus the ast2600-specific global
register space.

Cheers,


Jeremy

