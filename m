Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C5E134F37F0
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Apr 2022 16:26:40 +0200 (CEST)
Received: from localhost ([::1]:51044 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nbk8l-0006xS-AK
	for lists+qemu-devel@lfdr.de; Tue, 05 Apr 2022 10:26:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34540)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=0878235d2=anthony.perard@citrix.com>)
 id 1nbk6L-0005cu-CW; Tue, 05 Apr 2022 10:24:09 -0400
Received: from esa6.hc3370-68.iphmx.com ([216.71.155.175]:20018)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=0878235d2=anthony.perard@citrix.com>)
 id 1nbk6I-0000Bc-CN; Tue, 05 Apr 2022 10:24:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1649168646;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=jujJyxLjaVGhBGCD3FuCmkLh3dgzDZvsxlACmDmXXAA=;
 b=MTxSJt+LGlfVT6fbUlJdKLjFokwzvVoVzdlN4bYv2EOhahifWHHi9AYH
 D6dXSpMV1Ul7tcDFiCLshA57Q+Bw4jJb8LSQTjrT/vHo1Ak0mhIVoiHLF
 uV2brq9npjsccerruyxpHL61aO1je4TXCssmWrSVZGu1AWrEXn43DtEM4 0=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 67949315
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:qp4xU6k6fJfsZAtUvuwNRjvo5gw7JkRdPkR7XQ2eYbSJt1+Wr1Gzt
 xIaCziEMq3fNGX0fNl/bY62/U4PvpHQn9IySlBkrXs3HiMWpZLJC+rCIxarNUt+DCFioGGLT
 Sk6QoOdRCzhZiaE/n9BCpC48T8kk/vgqoPUUIYoAAgoLeNfYHpn2EoLd9IR2NYy24DlW17V4
 7senuWEULOb828sWo4rw/rrRCNH5JwebxtB4zTSzdgS1LPvvyF94KA3fMldHFOhKmVgJcaoR
 v6r8V2M1jixEyHBqD+Suu2TnkUiGtY+NOUV45Zcc/DKbhNq/kTe3kunXRa1hIg+ZzihxrhMJ
 NtxWZOYcVg2fY3livsheRhRKhNhE5Zf4pHeGC3q2SCT5xWun3rExvxvCAc9PJEC+/YxCmZLn
 RAaAGlTNFbZ3bvwme/lDLk37iggBJCD0Ic3s3d8zTbfHLA+TIrKWani7t5ExjYgwMtJGJ4yY
 uJHNmszPU+ZPnWjPH8xFrscx+fxokXecmZJ82uxgZMO8kLMmVkZPL/Fb4OOJ43iqd9utkuUu
 2vc82PRAhgQN9uE1XyD/27ErvXOliPyQo5UFLC++vNwm1qV7mgSDhQMUh28u/bRolWlR9tVJ
 kgQ+ywvhas/7kqmSp/6RRLQiG6JuFsQVsRdF8U+6RqR0ezE7gCBHG8GQzVdLts8u6ceXTU30
 neZktWvAiZg2JWNQ3Wb5LaSrBuoNCQVJHNEbigBJSMc7tz+5Y0+kB/LZtBkFqGzk5vyAz6Y6
 yuKoS4iiqQ7gssC1qH99lfC6xq1q53UCxIv5xvWV2aN6AR/a4i4IYuy5jDz6P9aJ4udCFCZs
 nUAkcGD6cgBCJiMkGqGR+BlNLSy+96fPTHciEIpFJ4knwlB4Fb6I9oWumsnYh40bIBUIlcFf
 XM/pytpu4AQHFK4cpNdYouIOdsE9rH6O83cA6W8gsV1XrB9cwqO/SdLbEGW3nzwnEVErZzTK
 at3Yu73Uy9EVP0PIC6eAr5EjOR1nnxWKXb7H8iT8vix7VaJiJd5o58hOUDGUO025bjsTO79o
 4cGbJviJ/myvYTDjsjrHWw7cAtiwZsTX8meRylrmgireFcO9IYJUaK5/F/ZU9Y595m5b8+Rl
 p1HZmdWyUDkmVrMIhiQZ3ZoZdvHBMgj/CphZXBxYQ30hxDPhLpDCo9FKvPbmpF9qoReIQNcF
 aFZK61s/NwRItg4x9jtRcak99EzHPharQmPIzCkcFACk21IHGT0FivfVlK3rkEmV3Pv3eNn+
 uHI/l6LEPIrGlU5ZO6LOa3H8r9ElSVE8A6EdxCTeYc7lYSF2NUCFhEdeddseptWdEqammXBv
 +tUaD9BzdTwT0YO2IGhrci5Q02BSbYW8pZyd4UD0YuLCA==
IronPort-HdrOrdr: A9a23:RaePKq5e5/CZBpTRLQPXwMrXdLJyesId70hD6qhwISY1TiW9rb
 HIoB17726RtN9/Yh0dcLy7V5VoBEmsk6KdgrNhWItKPjOW21dARbsKheCJrgEIWReOlNK1vZ
 0QCpSWY+eRMbEVt6jH3DU=
X-IronPort-AV: E=Sophos;i="5.90,236,1643691600"; d="scan'208";a="67949315"
Date: Tue, 5 Apr 2022 15:23:48 +0100
To: Bernhard Beschow <shentey@gmail.com>
CC: <qemu-devel@nongnu.org>, <qemu-trivial@nongnu.org>, "Michael S. Tsirkin"
 <mst@redhat.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, "Paolo
 Bonzini" <pbonzini@redhat.com>, Richard Henderson
 <richard.henderson@linaro.org>, Eduardo Habkost <eduardo@habkost.net>,
 Stefano Stabellini <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>,
 "open list:X86 Xen CPUs" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 1/2] hw/xen/xen_pt: Confine igd-passthrough-isa-bridge to
 XEN
Message-ID: <YkxQ9JUtfn5t8oSR@perard.uk.xensource.com>
References: <20220326165825.30794-1-shentey@gmail.com>
 <20220326165825.30794-2-shentey@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20220326165825.30794-2-shentey@gmail.com>
Received-SPF: pass client-ip=216.71.155.175;
 envelope-from=prvs=0878235d2=anthony.perard@citrix.com;
 helo=esa6.hc3370-68.iphmx.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  Anthony PERARD <anthony.perard@citrix.com>
From:  Anthony PERARD via <qemu-devel@nongnu.org>

On Sat, Mar 26, 2022 at 05:58:23PM +0100, Bernhard Beschow wrote:
> igd-passthrough-isa-bridge is only requested in xen_pt but was
> implemented in pc_piix.c. This caused xen_pt to dependend on i386/pc
> which is hereby resolved.
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>

Acked-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

