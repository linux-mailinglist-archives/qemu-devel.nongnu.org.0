Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B72929EEAD
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Oct 2020 15:46:41 +0100 (CET)
Received: from localhost ([::1]:51910 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kY9CK-0002AZ-5I
	for lists+qemu-devel@lfdr.de; Thu, 29 Oct 2020 10:46:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53294)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1kY8xj-0001KX-Vp
 for qemu-devel@nongnu.org; Thu, 29 Oct 2020 10:31:36 -0400
Received: from lizzy.crudebyte.com ([91.194.90.13]:40041)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1kY8xg-0006lb-2r
 for qemu-devel@nongnu.org; Thu, 29 Oct 2020 10:31:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=lizzy; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=t0HrzI832l4JbOJJSgR5g51dru18OKqRUzK2xU6t0FA=; b=Ea5VWwnVS4MbshwI575G/0fWox
 a7hcp0MGmV9jTjmcY/GijsRCSN1m268z+6zRBaoIMi73pmyL+rBGvb1Ij0sQlQxvZwN55MeprSfG9
 WDF9VAqJFNeFAjnTmLYMPH8Wz6zzk3RcxJGosqzBP7RrpmiQN3nw6tnlZwtK+dUbHQTkb33qK20gJ
 GppAoT2fgbszjRUCK66CC9yQGHwGBph3RBR5rjZBjkKIrERxM9CsUzIAI+nJcC5ZwrlaH/QlLPHuz
 Y0rwU75GkQH/O5iMwGCnuIlQ4zxWAbvE37nMe7EOntt/mrK7q9s5Q+UuGDwmlXdxi0scqDhyWTHEF
 LWN5o98w==;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, Greg Kurz <groug@kaod.org>
Subject: Re: [PULL 00/13] 9p queue 2020-10-23
Date: Thu, 29 Oct 2020 15:31:27 +0100
Message-ID: <3209306.Oi7kq7t7ax@silver>
In-Reply-To: <CAFEAcA-+4Ac7tGyXxDjkPrsJw7NmH3bijkuXLY9gF=Vr7p1LWQ@mail.gmail.com>
References: <cover.1603452058.git.qemu_oss@crudebyte.com>
 <5649161.sut93UlCx4@silver>
 <CAFEAcA-+4Ac7tGyXxDjkPrsJw7NmH3bijkuXLY9gF=Vr7p1LWQ@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Received-SPF: pass client-ip=91.194.90.13; envelope-from=qemu_oss@crudebyte.com;
 helo=lizzy.crudebyte.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/29 08:52:23
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Donnerstag, 29. Oktober 2020 15:15:19 CET Peter Maydell wrote:
> On Thu, 29 Oct 2020 at 14:06, Christian Schoenebeck
> 
> <qemu_oss@crudebyte.com> wrote:
> > Ok, I'll use mkdtemp() instead, that avoids other potential parallel
> > config
> > colissions that I may not have considered yet.
> > 
> > The original motivation against mkdtemp() was that /tmp is isually a
> > ramfs,
> > hence very limited regarding large file tests. But that's not an issue
> > right now.
> 
> How large is "large" here ?
> 
> thanks
> -- PMM

E.g. ~10 GiB which might be a problem for cloud based CI platforms.

But again, we don't have any 9p test doing that yet. So mkdtemp() is just fine 
for now.

Best regards,
Christian Schoenebeck



