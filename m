Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5428431E7F6
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Feb 2021 10:26:16 +0100 (CET)
Received: from localhost ([::1]:40952 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCfZf-00073T-BT
	for lists+qemu-devel@lfdr.de; Thu, 18 Feb 2021 04:26:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47038)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1lCfXK-0005fJ-Vt
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 04:23:51 -0500
Received: from kylie.crudebyte.com ([5.189.157.229]:51715)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1lCfXI-0005AO-Av
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 04:23:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=ToQ9cNySWIhq8bUG0l8gJq2WURsIpFiTpje/gUzw+IA=; b=vyNJEam0Ar0ymTWP1kMW6OTsRT
 GF/p5r0ywoHZXHmmn93ZKM7S98tL80OfeKfCUHHCpxVCyP5RQt3whXeP0nn+59djkkQFYBcx2M0Xi
 dFr1plNO82hGOsIDrkcmfGSa6yZwuqk2O0zEIgnpsL5mxdlxXBug9AkwfoclgVxCG1bNlVtHVDN4u
 n36eNQQeYfwrfFfKS3rZpdK4hgPSbovR+bv7VVANA8s7tFbllEYYpdBUoCPIyN4ckZTZnCpsdgpiV
 HWsmnR53GGz7IYGFwWfveM0FzlZPg0uaFtwjPmEf9UgmB0oKMQUzTaoQbZ1+sE3sKgIp0VVz/yoST
 q+tJ41UXGMGZjHp6n2Fv1Yq9X3TtUjSdfFLoQ7h7fKhKkBCm8oKpi/2zZPQHtuU+BhyPnXzZj+Pxf
 zPl9kpVu4xM0fJXI/gdOX+cpU4MbG42nzBUCDUp96qT43NNXWLmI4PyAsbaA0CZuCkraMtwUhMPt6
 aiqV8bDjkY1imQjtZC63+abs0YzSKrR3TtIlrpLyhY+J4qN27a8l/Cp3USMImtSErEnM6ebj3F5Y3
 BMlV3yqtgG8FqaI9MXDiqDlY2pZ4VZEcSz9GJZnpRkSg8VwBtSp0K4W5HIXDcWdA8jN6dKqY4pb9E
 X9CoH3QkhiUhE11JLwVu2uBnN1SKuLtZfoA5mdbpA=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PULL 09/19] libqos/qgraph: add qos_node_create_driver_named()
Date: Thu, 18 Feb 2021 10:23:45 +0100
Message-ID: <1976495.8VCTCZSzPG@silver>
In-Reply-To: <c7872ca9-4eb9-805c-2fdc-ceda65b89e5a@redhat.com>
References: <20210215131626.65640-1-pbonzini@redhat.com>
 <2503182.7bSAqF82In@silver> <c7872ca9-4eb9-805c-2fdc-ceda65b89e5a@redhat.com>
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

On Donnerstag, 18. Februar 2021 10:14:12 CET Paolo Bonzini wrote:
> On 18/02/21 10:10, Christian Schoenebeck wrote:
> > On Montag, 15. Februar 2021 15:06:41 CET Christian Schoenebeck wrote:
> >> On Montag, 15. Februar 2021 14:16:16 CET Paolo Bonzini wrote:
> >>> From: qemu_oss--- via <qemu-devel@nongnu.org>
> >>> 
> >>> So far the qos subsystem of the qtest framework had the limitation
> >>> that only one instance of the same official QEMU (QMP) driver name
> >>> could be created for qtests. That's because a) the created qos
> >>> node names must always be unique, b) the node name must match the
> >>> official QEMU driver name being instantiated and c) all nodes are
> >>> in a global space shared by all tests.
> >>> 
> >>> This patch removes this limitation by introducing a new function
> >>> qos_node_create_driver_named() which allows test case authors to
> >>> specify a node name being different from the actual associated
> >>> QEMU driver name. It fills the new 'qemu_name' field of
> >>> QOSGraphNode for that purpose.
> >>> 
> >>> Adjust build_driver_cmd_line() and qos_graph_node_set_availability()
> >>> to correctly deal with either accessing node name vs. node's
> >>> qemu_name correctly.
> >>> 
> >>> Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
> >>> Message-Id:
> >>> <3be962ff38f3396f8040deaa5ffdab525c4e0b16.1611704181.git.qemu_oss@crudeb
> >>> yt
> >>> e
> >>> .com> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> >> 
> >> Just a side note: The odd "From:" line was because of a temporary issue
> >> with the mailman version running GNU lists, which caused mailman to
> >> rewrite certain sender addresses. The problem with mailman had been
> >> fixed in the meantime.
> >> 
> >> I personally don't care about it, but just that you know that this did
> >> not
> >> happen by purpose or something.
> > 
> > Paolo, do you want me to resend these patches as v2 for fixing the author
> > rewrite issue?
> 
> The patches already in and with the right author.
> 
> Paolo

Right, I just noticed that. Sorry Paolo for the trouble. :/

Best regards,
Christian Schoenebeck



