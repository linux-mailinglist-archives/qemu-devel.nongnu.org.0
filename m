Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1998131BABD
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Feb 2021 15:08:48 +0100 (CET)
Received: from localhost ([::1]:53758 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBeYR-0002Wq-2Y
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 09:08:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1lBeWW-0000zE-Hh
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 09:06:48 -0500
Received: from kylie.crudebyte.com ([5.189.157.229]:60833)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1lBeWU-0001KD-4D
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 09:06:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=Vxmo3AgqBtH81chvYrvGelomaZjszGPdILK0OivRNqs=; b=nAvg91KwFKpWDDx/8WEuIih4cC
 k84T7kgUTdyXMZlRRAZ4qPsdiqvBgCzw5Lv+F5QweixIp4z463ZdM7ce0xbUtvYXE1icaeG5K+wBH
 qfU/uz/LrlmFMcWg8sNSIsvYR6V8DWbNM/DTZVy2h8retpEl0SxJt8PwODOFiQhO+Gj50URrJrC7X
 cK3XbE9Wwci8Imj1F+epZA1wCrKKeajyQc7s2TbsqeV8yVR/ydTtK7YeZtvXv1OxrkLcKNXpI4T+H
 Lv1QHFs9z49XIFD8c4SQX2C7PhymlhpaasGdlvcOb+zHG6N3rD/csCmkpNzHcUJoafXTJkg0JnTW9
 DXxZ8MIx8N9hcMFvPtGcexsvIHfGzmZe9EQIk+lIvJKGPri5XKbF2M9vFT5rscdWdKbzKSPkuBFT8
 5Mvif0L6bt0khLrHpldBAMjwnubG+2I/7/mHMl1h5Fl1/P2NCVWT81Q7oZfJnMHDF+mcx4e1e/p3W
 WTcnLaXli1Gb36QpxWK2FOsVCjkodREOSwUrhhToeTAJywILdVl6hWiTOOydAwB9IBBxbJzfe85ZP
 67zUgaRFdh3S18penqbLGPEf5Gm7BtNnFKQRqeEMGLTm3Z2j7V2H+RiwwmwkeH632+lKHEu7WnDWs
 Z1U+45JfSFsv15a5ssoLlQf5gGbRSwkLek88/LLsg=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PULL 09/19] libqos/qgraph: add qos_node_create_driver_named()
Date: Mon, 15 Feb 2021 15:06:41 +0100
Message-ID: <2293527.6E2vuH6pv7@silver>
In-Reply-To: <20210215131626.65640-10-pbonzini@redhat.com>
References: <20210215131626.65640-1-pbonzini@redhat.com>
 <20210215131626.65640-10-pbonzini@redhat.com>
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Montag, 15. Februar 2021 14:16:16 CET Paolo Bonzini wrote:
> From: qemu_oss--- via <qemu-devel@nongnu.org>
> 
> So far the qos subsystem of the qtest framework had the limitation
> that only one instance of the same official QEMU (QMP) driver name
> could be created for qtests. That's because a) the created qos
> node names must always be unique, b) the node name must match the
> official QEMU driver name being instantiated and c) all nodes are
> in a global space shared by all tests.
> 
> This patch removes this limitation by introducing a new function
> qos_node_create_driver_named() which allows test case authors to
> specify a node name being different from the actual associated
> QEMU driver name. It fills the new 'qemu_name' field of
> QOSGraphNode for that purpose.
> 
> Adjust build_driver_cmd_line() and qos_graph_node_set_availability()
> to correctly deal with either accessing node name vs. node's
> qemu_name correctly.
> 
> Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
> Message-Id:
> <3be962ff38f3396f8040deaa5ffdab525c4e0b16.1611704181.git.qemu_oss@crudebyte
> .com> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

Just a side note: The odd "From:" line was because of a temporary issue with 
the mailman version running GNU lists, which caused mailman to rewrite certain 
sender addresses. The problem with mailman had been fixed in the meantime.

I personally don't care about it, but just that you know that this did not 
happen by purpose or something.

Best regards,
Christian Schoenebeck



