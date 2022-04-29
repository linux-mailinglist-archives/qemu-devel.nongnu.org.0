Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 27E23514F36
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Apr 2022 17:22:14 +0200 (CEST)
Received: from localhost ([::1]:37888 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nkSRh-0005gB-8P
	for lists+qemu-devel@lfdr.de; Fri, 29 Apr 2022 11:22:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43052)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hch@lst.de>)
 id 1nkSN2-00081e-MU; Fri, 29 Apr 2022 11:17:24 -0400
Received: from verein.lst.de ([213.95.11.211]:49325)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hch@lst.de>)
 id 1nkSN0-0005Of-Td; Fri, 29 Apr 2022 11:17:24 -0400
Received: by verein.lst.de (Postfix, from userid 2407)
 id 92A3968AA6; Fri, 29 Apr 2022 17:17:15 +0200 (CEST)
Date: Fri, 29 Apr 2022 17:17:15 +0200
From: Christoph Hellwig <hch@lst.de>
To: Klaus Jensen <its@irrelevant.dk>
Subject: Re: [PATCH v2 2/5] hw/nvme: do not auto-generate eui64
Message-ID: <20220429151715.GA13491@lst.de>
References: <20220429083336.2201286-1-its@irrelevant.dk>
 <20220429083336.2201286-3-its@irrelevant.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220429083336.2201286-3-its@irrelevant.dk>
User-Agent: Mutt/1.5.17 (2007-11-01)
Received-SPF: none client-ip=213.95.11.211; envelope-from=hch@lst.de;
 helo=verein.lst.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Eduardo Habkost <eduardo@habkost.net>, qemu-block@nongnu.org,
 libvir-list@redhat.com, Klaus Jensen <k.jensen@samsung.com>,
 qemu-devel@nongnu.org,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 Yanan Wang <wangyanan55@huawei.com>, Luis Chamberlain <mcgrof@kernel.org>,
 Keith Busch <kbusch@kernel.org>, Christoph Hellwig <hch@lst.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Apr 29, 2022 at 10:33:33AM +0200, Klaus Jensen wrote:
> From: Klaus Jensen <k.jensen@samsung.com>
> 
> We cannot provide auto-generated unique or persistent namespace
> identifiers (EUI64, NGUID, UUID) easily. Since 6.1, namespaces have been
> assigned a generated EUI64 of the form "52:54:00:<namespace counter>".
> This is will be unique within a QEMU instance, but not globally.
> 
> Revert that this is assigned automatically and immediately deprecate the
> compatibility parameter. Users can opt-in to this with the
> `eui64-default=on` device parameter or set it explicitly with
> `eui64=UINT64`.

Looks good:

Reviewed-by: Christoph Hellwig <hch@lst.de>

