Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E3E6660268
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Jan 2023 15:43:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDnvn-00035S-63; Fri, 06 Jan 2023 09:42:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=36316be06=anthony.perard@citrix.com>)
 id 1pDnvi-000358-PJ
 for qemu-devel@nongnu.org; Fri, 06 Jan 2023 09:42:47 -0500
Received: from esa6.hc3370-68.iphmx.com ([216.71.155.175])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=36316be06=anthony.perard@citrix.com>)
 id 1pDnvg-0006zC-4v
 for qemu-devel@nongnu.org; Fri, 06 Jan 2023 09:42:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1673016164;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=dIxp4kB3Fq0R4kfKEpGGR4PCvfMFoXf/LwvzR19LURA=;
 b=Bnc02z7uBlkd/ZgIKm5lvKl7ku1gMmkVaQrYFz77vxgd+U4AIl/kmY3b
 a1UN5TVBId0MnnInsqAdPghVEp/hx0l7V5sv2Sk8HU+u1R+r31XvFy0qe
 6ulDOP2rUSxDB75vriTzp9lwLIgpkCJU1iniUfJQU6PqyPRaJQwqT7nhh E=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 90966612
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:VJswE6jTu9xi3QxlCHxLmkylX1610BAKZh0ujC45NGQN5FlHY01je
 htvXmCAb66KNmChf41/aYzk8E0G7Zbcn9VqHApvrX89Fykb9cadCdqndUqhZCn6wu8v7q5Ex
 55HNoSfdpBcolv0/ErF3m3J9CEkvU2wbuOgTrWCYmUpH1QMpB4J0XpLg/Q+jpNjne+3CgaMv
 cKai8DEMRqu1iUc3lg8sspvkzsy+qWs0N8klgZmP6sT5QeAzyN94K83fsldEVOpGuG4IcbiL
 wrz5OnR1n/U+R4rFuSknt7TGqHdauePVeQmoiM+t5mK2nCulARrukoIHKN0hXNsoyeIh7hMJ
 OBl7vRcf+uL0prkw4zxWzEAe8130DYvFLXveRBTuuTLp6HKnueFL1yDwyjaMKVBktubD12i+
 tQaOmsffgiMo9uo44K3dMN8t58/KvPCadZ3VnFIlVk1DN4jSJHHBa7L+cVZzHE7gcUm8fT2P
 pRDL2A1NVKZPkMJagx/5JEWxY9EglH2dSFYr1SE47I6+WHJwCR60aT3McqTcduPLSlQthfA9
 zyYoT2jav0cHMSSxAHfq3utv8beu3nnVdMLF5yz+OE/1TV/wURMUUZLBDNXu8KRh0KjUshTL
 GQU8yAtqrMuskqmUrHVRRyzoHeeslgcVtxcHvch7welzqvS6hyeQG8eQVZpbcc6nNU7STwjy
 hmCmNaBLSxitviZRGyQ8p+QrCiuIm4FIGkafygGQAAZpd75r+kbixvVRdtnVqetgNDxEzjtx
 hiFqSE/g/MYistj/7y2+E2Cjz+yq5zhSAkz6QPKGGW/4WtRbpSuZ5Gj6krz5PFEao2eSzGpp
 2MYksKT6OQPC5CllyGXRugJWraz6J6tKDfbh0xuGZgJ7Tmh+3e/O4tX5VlWPE50Nu4UdDmvZ
 1Xc0T69/7cKYiHsN/UuJdvsVYJ6lsAMCOgJSNjWfIFccoB+UDaZ3xFiW2SA7jvxlnIFxPRX1
 YigTe6gCnMTCKJCxTWwRvsA3bJD+h3S1V8/VrigkU35jOP2iGq9DO5cbQDQNrxRALas+l29z
 jpJCyedJ/yzusXaazKfz4McJEtiwZMTVcGv8Jw/mgJuz2Nb9IAd5x35m+hJl29Nxf49egL0E
 paVBCdlJKLX3yGvFOlzQikLhEnTdZh+t2knGicnIEyl3XMuCa72svhFJsdsIOl2qL0ypRKRc
 xXjU5/QahioYm2ekwnxkLGn9NAyHPhVrVjm09WZjMgXIMc7Gl2hFi7MdQrz7igeZheKWT8Fi
 +T4jGvzGMNTLzmO+e6KMJpDOXvt5ylC8A+zNmOUSuRulLLEqtAycXKp1qVnf6nh63zrn1On6
 upfOj9AzcGlnmP/2IChaXysx2txL9ZDIw==
IronPort-HdrOrdr: A9a23:/alh+6ClgOS3hhjlHemd55DYdb4zR+YMi2TDgXoBLCC9E/bo7P
 xG+c5wuCMc5wxhP03I9erwQZVoIkm8yXcW2/h0AV7KZmCP01dASrsSjrcK7AeQeREWndQts5
 uIHZIOcOEYzmIUsS852mWF+hobruVvOZrJudvj
X-IronPort-AV: E=Sophos;i="5.96,305,1665460800"; d="scan'208";a="90966612"
Date: Fri, 6 Jan 2023 14:42:35 +0000
To: Chuck Zmudzinski <brchuckz@aol.com>
CC: <qemu-devel@nongnu.org>, Stefano Stabellini <sstabellini@kernel.org>, Paul
 Durrant <paul@xen.org>, Paolo Bonzini <pbonzini@redhat.com>, Richard
 Henderson <richard.henderson@linaro.org>, Eduardo Habkost
 <eduardo@habkost.net>, "Michael S. Tsirkin" <mst@redhat.com>, Marcel
 Apfelbaum <marcel.apfelbaum@gmail.com>, <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v6] xen/pt: reserve PCI slot 2 for Intel igd-passthru
Message-ID: <Y7gzW/hkYc6xPqEC@perard.uk.xensource.com>
References: <830263507e8f1a24a94f81909d5102c4b204e938.1672615492.git.brchuckz.ref@aol.com>
 <830263507e8f1a24a94f81909d5102c4b204e938.1672615492.git.brchuckz@aol.com>
 <Y7gqSLo8pMm4gfV+@perard.uk.xensource.com>
 <c39b9502-0020-ce54-abd8-b362430ba086@aol.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <c39b9502-0020-ce54-abd8-b362430ba086@aol.com>
Received-SPF: pass client-ip=216.71.155.175;
 envelope-from=prvs=36316be06=anthony.perard@citrix.com;
 helo=esa6.hc3370-68.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
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
Reply-to:  Anthony PERARD <anthony.perard@citrix.com>
From:  Anthony PERARD via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Fri, Jan 06, 2023 at 09:10:55AM -0500, Chuck Zmudzinski wrote:
> Well, our messages almost collided! I just proposed a v7 that adds
> a check to prevent the extra processing for cases when machine is
> not xenfv and the slot does not need to be cleared because it was
> never reserved. The proposed v7 would not change the behavior of the
> patch at all but it would avoid some unnecessary processing. Do you
> want me to submit that v7?

Well, preventing an simple assignment and a message from getting logged
isn't going to get us far. On the other end, the message "using slot 2"
when we don't even if slot 2 is actually going to be used could be
confusing, so I guess preventing that message from been logged could be
useful indeed.

So your proposed v7 would be fine.

Cheers,

-- 
Anthony PERARD

