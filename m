Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A3E8831E7C5
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Feb 2021 10:12:18 +0100 (CET)
Received: from localhost ([::1]:58890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCfM9-0002IY-6n
	for lists+qemu-devel@lfdr.de; Thu, 18 Feb 2021 04:12:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1lCfKt-0001tL-22
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 04:10:59 -0500
Received: from kylie.crudebyte.com ([5.189.157.229]:60139)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1lCfKp-0007K1-KK
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 04:10:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=FU84H1y/WyDZmsGg31/vQYamQgZKzho8PommwjSKxxs=; b=eBZLqnFtxzHV9smYjVeinpdWTZ
 gWyScAHEDxXvjEF2344+34oZ+cU+Nus72uSsyvTbW7CSMpm58B7KrZwR79fUyXg2/M/zWj+cBg0PD
 BtUD/Ko6BC1+1vvQTazozvucM9H9guB+hV3qbEzJdT1V+tA722uEQofCB0Sm3qwKkekqXJKeNx+fQ
 4mponLpJ/ycpLLwRfA4rvrT06ebqiSBmRa9CtCASUBXRy2Iu/I5At8nocMuLCEs/1XZ/y9GhtyvY9
 WXazPGOCDaAfnTGBBYS6VsNek+8y59vCjQGHFERsoYNkUvBa8oI4Ct1G47WvS2Pv6zmMysxdBLFlh
 cpk2UdZhtDNjOX3j8ffvrUQy4d2+shHPC9DGSlGqdxALzrFxV9icAO4QQw/xGX+TZgb/5pLmucHSX
 qrz85/6cQN1Mcdj/5WYABsUOOryhyyc9nFRzBzNGy8hywCf8cvsOJ0L+w2QCznlEV35VtTVQdg2lu
 cDcE7POJjSmqby0Xe+5hIYidAlTZCmLmjhr6/bukCc1aeRTBgmS1pxs3PVLMoxnlzQ6SAnmt0z+FG
 fEm4nj7AgbHExu9I/pkL/XGAeERQSbZceNhLMJbYig7HmdpSavG7Soh/Hpb9XpraA25nJDxqFCQXo
 2IZm3L1VJ6vA0NxJ00X6hygkVqYHWLJ65KkNihMVE=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PULL 09/19] libqos/qgraph: add qos_node_create_driver_named()
Date: Thu, 18 Feb 2021 10:10:49 +0100
Message-ID: <2503182.7bSAqF82In@silver>
In-Reply-To: <2293527.6E2vuH6pv7@silver>
References: <20210215131626.65640-1-pbonzini@redhat.com>
 <20210215131626.65640-10-pbonzini@redhat.com> <2293527.6E2vuH6pv7@silver>
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

On Montag, 15. Februar 2021 15:06:41 CET Christian Schoenebeck wrote:
> On Montag, 15. Februar 2021 14:16:16 CET Paolo Bonzini wrote:
> > From: qemu_oss--- via <qemu-devel@nongnu.org>
> > 
> > So far the qos subsystem of the qtest framework had the limitation
> > that only one instance of the same official QEMU (QMP) driver name
> > could be created for qtests. That's because a) the created qos
> > node names must always be unique, b) the node name must match the
> > official QEMU driver name being instantiated and c) all nodes are
> > in a global space shared by all tests.
> > 
> > This patch removes this limitation by introducing a new function
> > qos_node_create_driver_named() which allows test case authors to
> > specify a node name being different from the actual associated
> > QEMU driver name. It fills the new 'qemu_name' field of
> > QOSGraphNode for that purpose.
> > 
> > Adjust build_driver_cmd_line() and qos_graph_node_set_availability()
> > to correctly deal with either accessing node name vs. node's
> > qemu_name correctly.
> > 
> > Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
> > Message-Id:
> > <3be962ff38f3396f8040deaa5ffdab525c4e0b16.1611704181.git.qemu_oss@crudebyt
> > e
> > .com> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> 
> Just a side note: The odd "From:" line was because of a temporary issue with
> the mailman version running GNU lists, which caused mailman to rewrite
> certain sender addresses. The problem with mailman had been fixed in the
> meantime.
> 
> I personally don't care about it, but just that you know that this did not
> happen by purpose or something.

Paolo, do you want me to resend these patches as v2 for fixing the author 
rewrite issue?

Best regards,
Christian Schoenebeck



