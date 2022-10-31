Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C7ABC614012
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 22:44:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opcYE-0002Xn-Rd; Mon, 31 Oct 2022 17:42:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <brchuckz@aim.com>) id 1opcSJ-00032X-2e
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 17:36:28 -0400
Received: from sonic311-24.consmr.mail.gq1.yahoo.com ([98.137.65.205])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <brchuckz@aim.com>) id 1opcSA-00083l-Kh
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 17:36:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aol.com; s=a2048;
 t=1667252166; bh=uxOwrD0U0H546e379z6pIj7ishCHeKXz2cYS+K7ZCSA=;
 h=From:To:Cc:Subject:Date:References:From:Subject:Reply-To;
 b=t4PsUBVbL+tFKr+SCIjGYKBa8LZKNdOhXiAlD8Ly2GVIw9xKKr7GAb6WLl8nkGWlL9rdNykimQXvuey826Pa902P/J+FkhDiPMR8A7yagH3KB2HywKVEc2YKSBHVehmvz3F7xcGkQnDXmp/Jc+0/izPD+GctV5hyPFJsMXGC5SV/MX6leP/eGcEhfahXzR5uoM9ojxit7mD9uSuh99+SYGUhuuS+dxHhgrO6pGQfoCH9bFoKy4NoFksxRYVc20PrSsWwXydXXXi4kdPe6/azfT8a5TuQDdoXQG9YnqIpFSdPefMnP09w8JstPUX8iMASOrXJKDnk2qaSz9jPJXUcmw==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1667252166; bh=LRLXbF/s7/ITJbULB0qtJPEFf5qS9irXKOaTvElYx3I=;
 h=X-Sonic-MF:From:To:Subject:Date:From:Subject;
 b=QQqxT1+t3wWPEZ2YuPMqeG2lGig4FKsOxCc7iSM9SioH2/08Bri9fGMg0QMvnpo9jYMRhD5u7RCGJrbUq1FnZrVyHS6JsIMf/UbF1G2mtDBxOfkMU40FdBg5O3dZaqq4NZ6HAB5TTM/k0Zu7PxEyeyUi851bTcfkt178HNSU5CnltRmT10j+A8+On8/su50CwENmzIhYlyhW20bySUAX3bvxeKuZRTSqzeC5OUMZPMXIpfIn8JDBmTu8wer/FAsUcdKFvQe26ikGjQj4KXPfxG7W32lxgo2rLmsMrunrJctLBjV1AKXqL5LRX6KLrXQnbUWVMgFL9Prq5DNHk6lZ3g==
X-YMail-OSG: TrYy9g4VM1lWmXA0S3_Txh3IolAWizPT4cc1wBKX7DrboJBnewHToGBPbqJPiPo
 LXMUjBKN5dm.y1mMxLx9T2IGrHqRf3SqMpk9y6rvyTQFmJA8B41Z_DFJYaZW1rHhXKS9.L8pvtMS
 Kkoiv4BozHwDZZQmccnwgSaxoNyTGE0rqPFJzHbi2xThVJjb4byFJuafxtCqPV5OqxtwL9fvnQrL
 sTJ8zX2ymlG7.XouBq3yacHDhNiy.tFsMxjVvNzyJf4JAQCWGbKID4qrYHDMay7NFu5h1.4Cb4ga
 0psVCajKZyyf44HNZK0kC2ade4VSY4_tugvos_pxPkiOW3vaZyswY0Uq8BnEMozX3_phlA3yGJCv
 8yPybUXO5m4UHWmAO7PA8cOIFZ9XMzs2QbGrL.qm9H759_qFoajVGY6WiJ0.s.ydWDCg.HORmg27
 mBV7ZMeP0Q4750mJ9wLnnDcsSSEu.rwUOYgjjUzdkBeYyfTk6Bbe0OHwTglbUrjio3ETGIFJiXeD
 xTHm022rg7ZwKUnFeej1WZm18egsamcIB5_WVrvgrwfGURLCy8kAV7a3H3W5KH09Rkw.PVtRVovU
 GqPioWEuCEaBIWRc1aQgn_ZEaq15.dcGdwHa.qv298TQh6_MjHWIkQpp7XU6C0T.sm.aHh5Lyqdl
 C20.D54OoO0QSONrV8iXWza8n2wRys04kfknXiTqvpCp0.eYShKOMFoziAfWnjGsXe86cvlfyXUc
 odxYs6Xyy59JPo.G0z4SQYh6freIDjoVHxOaeMWYMN90eBYviYHozk_k29lv.KAptbL_LUFpH0L4
 bAIwDI9SR5CEaHS8jwKgCazVYg4ikOwsT4nu_h5gPJpmqeCfc6cpI.GVjZyzhWpXcdbZEXrPlxZN
 _qiQEh4xC21.VX7HhTvZZplbAF1eYT1j5j_NgW7vFg8RM5p7Q2oJud6hZl2_6v28OaIJhsDOv8sL
 Q446JpUE4klxwh9SxmGKEML_XeI5nZq2An3EuqYcGEIeZA8pNrheJxkcRWAF.mNSMDW7U2MdEQaS
 j.ZV1VLD9rIdfpM0xLiR8kIzYbYuetma6LuMzjkJScWwCcycCZygchycab4qsyNJ4mffmV9mmu7F
 qm8ooHzGqKFwpJU465pOc8u1gq40A1.BULOaYPMl9GRGRzr6uDQemUv8ohh5BGNi1DWj_l3zT8jB
 toKO8L__YcHil8ozB6vs4vRJEPgZTEf9qfOhmyxhqPniaKVzRRiTk5C4C0FhUmsoYxTQLJdVTLqV
 5cNzrNcntCMZKWFf_kiyqFzfxTgZ0yPgKM59L6alBoJUYEMlVwVQG5YWX7WekrTJyQ9uYWgWPpR3
 jLuE6x1AR8eCh_mN8uScWvTOIPd3I0FMTve8palMJNu0CMfkE.39yXp3QaFgeWlFSTYVoCaywAlv
 Wse2_IpIorDjOaqntZKad2_rD5aHknHNk0va96TLeisApzPCr4ncGMfZ_d_M68WlH.3lWzMkt1o_
 hNK1G40PYdvZdQh3XTOGVeQ1GcZtdtgvaHnkhiIrP8alfI5Wwa6RdxJEpeqbKCWJDtIvHwMaZE3l
 MdBzCfeZSLhwIfpHt.X2oYMNJU5SKPUh3xEqtn6T_IDLSkgu090iMUttM7tOnM_XRCAuctKqBEAr
 CnZauTtEeAh4yaqsLbfhy7058VL.L0fxbHp2tRNH4ROxc49.3orrEa1VPxppwtxqvm5Kdj1wJDkO
 SC3tKXYb25Kd8Netz5e7XEkqvgmArlgywyY1GH7ssOqZy.4cnyVstaI_4WEqR4ORvLDtKfzGO7Cr
 _b5ivGFcn8Bh9UI0mxDU33YlraZmWDSumETmG012Bu2iiILcOilXBAANYjKehG9h2GZSIYVNra21
 ovQelIX6fsXibhAXFvhulszrRAEc4RHKHFsipYcAa0VlwcUhAMQF9HecxOboBmJ.WyW34YqIhC.Q
 uEghrocvcRGcqCVNHbQRyEPZDXq7TksBpUZak_xTNYQLDxch.4gT3fUCfSWr3CzodhAWpoEOsGpJ
 q2qXPOFfRpy_t8DgB5mj35appz66z1SOgk4j7KO8M0PJZrfizhBnDUG9RtwOJnp.wkrkVVgTcA8B
 qwcwgYvq3mGi5BTl.bBZP0F.nmyaZz7LUGdvvU9me9lercry3L2sMLzYGIeYzWwLWDMsOBPTfCfk
 3Tr3f6FIEJHFKkfFdl9cE_.CeKJUogSbzcanBSVPIru89S6BkQ8OP4UcUMuqfPeidrs1uXpitkQg
 ftLSUzf0-
X-Sonic-MF: <brchuckz@aim.com>
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic311.consmr.mail.gq1.yahoo.com with HTTP; Mon, 31 Oct 2022 21:36:06 +0000
Received: by hermes--production-ne1-c47ffd5f5-2l5gs (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID 1d450870d12d3f727fe97841ca3633d5; 
 Mon, 31 Oct 2022 21:36:03 +0000 (UTC)
From: Chuck Zmudzinski <brchuckz@aol.com>
To: qemu-devel@nongnu.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, xen-devel@lists.xenproject.org
Subject: [PATCH v4 0/2] xen/pt: fix FTBFS and reserve PCI slot 2 for the Intel
 IGD
Date: Mon, 31 Oct 2022 17:35:51 -0400
Message-Id: <cover.1667242033.git.brchuckz@aol.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
References: <cover.1667242033.git.brchuckz.ref@aol.com>
Received-SPF: pass client-ip=98.137.65.205; envelope-from=brchuckz@aim.com;
 helo=sonic311-24.consmr.mail.gq1.yahoo.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.001,
 FREEMAIL_FROM=0.001, FREEMAIL_REPLY=1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org

This is a series of two patches:

The first fixes FTBFS when --enable-xen and --disable-xen-pci-passthrough
configure options are set with when building for the linux target os.

The second fixes a regression that was introduced many years ago with the
upgrade from the Qemu traditional device model that is still available
from xenbits.xen.org and based on very old Qemu version 0.10.2.

The regression is that the Qemu traditional device model reserves slot 2
for the Intel IGD on the PCI bus when the Intel IGD is passed through
to a Xen HVM domain, but the current Qemu upsream device model does not
and in fact results in a different slot assigned to the Intel IGD.

This behavior does not conform to the requirement that the Intel IGD must
be assigned to slot 2, as noted in docs/igd-assign.txt in the Qemu source
code: "IGD must be given address 02.0 on the PCI root bus in the VM."

I have used the second patch of the series for the past two years with
no problems. Without the patch, the reliability of PCI passthrough of the
Intel IGD to a Xen HVM guest is very poor, and in some cases the guest
fails to start without the patch.

v2: Remove From: <email address> tag at top of message

v3: No change to this cover letter since v2

v4: Use brchuckz@aol.com instead of brchuckz@netscape.net for the author's
    email address to match the address used by the same author in commits
    be9c61da and c0e86b76 

Chuck Zmudzinski (2):
  xen/pt: fix syntax error that causes FTBFS in some configurations
  xen/pt: reserve PCI slot 2 for Intel igd-passthru

 hw/i386/pc_piix.c    |  3 +++
 hw/xen/meson.build   |  2 +-
 hw/xen/xen_pt.c      | 25 +++++++++++++++++++++++++
 hw/xen/xen_pt.h      | 16 ++++++++++++++++
 hw/xen/xen_pt_stub.c |  4 ++++
 5 files changed, 49 insertions(+), 1 deletion(-)

-- 
2.37.2


