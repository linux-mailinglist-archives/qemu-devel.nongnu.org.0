Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 58BF53D5C9B
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Jul 2021 17:08:17 +0200 (CEST)
Received: from localhost ([::1]:47868 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m82DI-0006pB-EW
	for lists+qemu-devel@lfdr.de; Mon, 26 Jul 2021 11:08:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51940)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <movement@li1368-133.members.linode.com>)
 id 1m82Ai-0003F3-9W
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 11:05:36 -0400
Received: from ssh.movementarian.org ([2a01:7e00::f03c:92ff:fefb:3ad2]:33980
 helo=movementarian.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <movement@li1368-133.members.linode.com>)
 id 1m82Af-0003tw-2v
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 11:05:35 -0400
Received: from movement by movementarian.org with local (Exim 4.93)
 (envelope-from <movement@li1368-133.members.linode.com>)
 id 1m82Aa-000IfR-O7; Mon, 26 Jul 2021 15:05:28 +0000
Date: Mon, 26 Jul 2021 15:05:28 +0000
From: John Levon <levon@movementarian.org>
To: Jagannathan Raman <jag.raman@oracle.com>
Subject: Re: [PATCH RFC server 04/11] vfio-user: find and init PCI device
Message-ID: <20210726150528.GA71233@li1368-133.members.linode.com>
References: <cover.1626675354.git.elena.ufimtseva@oracle.com>
 <cover.1626722742.git.jag.raman@oracle.com>
 <9c728a63a896ecf3de92a269668c3306cc3e6f5f.1626722742.git.jag.raman@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9c728a63a896ecf3de92a269668c3306cc3e6f5f.1626722742.git.jag.raman@oracle.com>
X-Url: http://www.movementarian.org/
Received-SPF: none client-ip=2a01:7e00::f03c:92ff:fefb:3ad2;
 envelope-from=movement@li1368-133.members.linode.com; helo=movementarian.org
X-Spam_score_int: 1
X-Spam_score: 0.1
X-Spam_bar: /
X-Spam_report: (0.1 / 5.0 requ) BAYES_00=-1.9, FORGED_SPF_HELO=1,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, KHOP_HELO_FCRDNS=0.4, RCVD_IN_XBL=0.375,
 SPF_HELO_PASS=-0.001, SPF_NONE=0.001 autolearn=no autolearn_force=no
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
Cc: elena.ufimtseva@oracle.com, john.g.johnson@oracle.com,
 swapnil.ingle@nutanix.com, qemu-devel@nongnu.org, alex.williamson@redhat.com,
 stefanha@redhat.com, thanos.makatos@nutanix.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jul 19, 2021 at 04:00:06PM -0400, Jagannathan Raman wrote:

> +    vfu_pci_set_id(o->vfu_ctx,
> +                   pci_get_word(o->pci_dev->config + PCI_VENDOR_ID),
> +                   pci_get_word(o->pci_dev->config + PCI_DEVICE_ID),
> +                   pci_get_word(o->pci_dev->config + PCI_SUBSYSTEM_VENDOR_ID),
> +                   pci_get_word(o->pci_dev->config + PCI_SUBSYSTEM_ID));

Since you handle all config space accesses yourselves, is there even any need
for this?

regards
john

