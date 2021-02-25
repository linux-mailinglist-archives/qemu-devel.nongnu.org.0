Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F4E132501F
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Feb 2021 14:06:14 +0100 (CET)
Received: from localhost ([::1]:55698 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFGLM-0002fj-GU
	for lists+qemu-devel@lfdr.de; Thu, 25 Feb 2021 08:06:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39202)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jk@ozlabs.org>)
 id 1lFGKI-0002A6-KU; Thu, 25 Feb 2021 08:05:06 -0500
Received: from ozlabs.org ([203.11.71.1]:39707)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jk@ozlabs.org>)
 id 1lFGKF-0007Nl-1o; Thu, 25 Feb 2021 08:05:06 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4DmY0X3hV6z9s1l;
 Fri, 26 Feb 2021 00:04:44 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ozlabs.org; s=201707;
 t=1614258288; bh=xdo8jckoDqidgBqVBvKMnbCF1o0MGCpzeTi4KiY431s=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=yzwJMAlac2XE32U9QKiWliWR36Abhgo8b+GxMwXGIKJ0I6d4yc4QFchbcau6sVnxv
 OV8Ra6fSmMSIDiizg4BomcWpcs6HrLLATxCIeH3HHnGOOSgyJUKTt79Tp1am2/nBRR
 8qda7D5aVkxTZ84zqBnQkc7BHiFvDFumzJDz1JNIV6bgtSWBEwze1Z6ruBA2wI/ayc
 GhmDKR9HYZjkTQ06vVjA30jkEpqvNhb9aK7ujcZ9cyLsGtccad/9laFlDrw4lMTDuS
 8W2ZWWdHZoqL/5eocENLPILhs0WE2ibtfGcxS6b+p4nz4wkI094FQ4JKOTce00IJmj
 IVXH1WagNGEBw==
Message-ID: <ac5c0acbed14c415314b67fe5b99f89e2d5e067c.camel@ozlabs.org>
Subject: Re: who's using the ozlabs patchwork install for QEMU patches ?
From: Jeremy Kerr <jk@ozlabs.org>
To: Greg Kurz <groug@kaod.org>
Date: Thu, 25 Feb 2021 21:04:42 +0800
In-Reply-To: <20210224092020.269ab775@bahia.lan>
References: <CAFEAcA8h8QVoGsfJCLTYnbk3yzmrtphsWdSsDUrgQkB=vGh3zw@mail.gmail.com>
 <20210223123943.06d23a56@bahia.lan>
 <CAFEAcA9mgE5t5KpkGac7ABaVy3gK11PbpNMfO3p-gcVhSN51tQ@mail.gmail.com>
 <2915273.dLz0rCdnKo@silver>
 <e79d7306-c0d8-fbd2-9582-bfa169dd6289@ozlabs.ru>
 <4023a93314e1ae69c19a4a93e87b65c8bfaac619.camel@ozlabs.org>
 <20210224092020.269ab775@bahia.lan>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.3-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=203.11.71.1; envelope-from=jk@ozlabs.org;
 helo=ozlabs.org
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Stephen Rothwell <sfr@canb.auug.org.au>, Alexey Kardashevskiy <aik@ozlabs.ru>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, qemu-devel@nongnu.org,
 "qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Greg,

> > The standard process is to send me an email :)
> 
> Is this standard process mentioned somewhere ?

No, not really. I usually let the folks who request the project in the
first place know though.

> > You're wanting to add user 'groug' to the qemu project, is that
> > correct?
> > 
> 
> Yes. Thanks !

Sure thing, done!

You should now have access to modify patch states in the qemu
patchwork. If you'd prefer to work with patchwork from the command-
line, check out the pwclient, git-pw and pwnm-sync tools, at:

     https://patchwork.readthedocs.io/en/latest/usage/clients/

Cheers,


Jeremy


