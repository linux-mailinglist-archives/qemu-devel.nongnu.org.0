Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EDB6477112
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Dec 2021 12:49:03 +0100 (CET)
Received: from localhost ([::1]:43034 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxpFu-0007co-ED
	for lists+qemu-devel@lfdr.de; Thu, 16 Dec 2021 06:49:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38336)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <movement@movementarian.org>)
 id 1mxpEi-0006wb-Kl
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 06:47:48 -0500
Received: from ssh.movementarian.org ([139.162.205.133]:37848
 helo=movementarian.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <movement@movementarian.org>)
 id 1mxpEg-0002GG-TA
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 06:47:48 -0500
Received: from movement by movementarian.org with local (Exim 4.94)
 (envelope-from <movement@movementarian.org>)
 id 1mxpEa-003d66-N6; Thu, 16 Dec 2021 11:47:40 +0000
Date: Thu, 16 Dec 2021 11:47:40 +0000
From: John Levon <levon@movementarian.org>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH v4 08/14] vfio-user: handle PCI config space accesses
Message-ID: <YbsnXH+wDJk0SgvT@movementarian.org>
References: <cover.1639549843.git.jag.raman@oracle.com>
 <34e287d0a8d585f104bdd06681b32fc93e8746c7.1639549843.git.jag.raman@oracle.com>
 <YbsjTPnOiAkNKmhb@stefanha-x1.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YbsjTPnOiAkNKmhb@stefanha-x1.localdomain>
X-Url: http://www.movementarian.org/
Received-SPF: pass client-ip=139.162.205.133;
 envelope-from=movement@movementarian.org; helo=movementarian.org
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
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
Cc: elena.ufimtseva@oracle.com, john.g.johnson@oracle.com, thuth@redhat.com,
 Jagannathan Raman <jag.raman@oracle.com>, bleal@redhat.com,
 swapnil.ingle@nutanix.com, alex.bennee@linaro.org, qemu-devel@nongnu.org,
 wainersm@redhat.com, alex.williamson@redhat.com, pbonzini@redhat.com,
 marcandre.lureau@gmail.com, crosa@redhat.com, thanos.makatos@nutanix.com,
 philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Dec 16, 2021 at 11:30:20AM +0000, Stefan Hajnoczi wrote:

> > +    ret = vfu_setup_region(o->vfu_ctx, VFU_PCI_DEV_CFG_REGION_IDX,
> > +                           pci_config_size(o->pci_dev), &vfu_object_cfg_access,
> > +                           VFU_REGION_FLAG_RW | VFU_REGION_FLAG_ALWAYS_CB,
> > +                           NULL, 0, -1, 0);
> 
> Thanos or John: QEMU's pci_host_config_read/write_common() works with
> host-endian values. I don't know which endianness libvfio-user's region
> callbacks expect. Does this patch look endian-safe to you (e.g. will it
> work on a big-endian host)?

https://github.com/nutanix/libvfio-user/issues/615

regards
john

