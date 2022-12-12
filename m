Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F37C8649D03
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Dec 2022 12:05:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4gbE-00086J-1f; Mon, 12 Dec 2022 06:03:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <movement@movementarian.org>)
 id 1p4gaz-00085b-SV
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 06:03:42 -0500
Received: from ssh.movementarian.org ([139.162.205.133] helo=movementarian.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <movement@movementarian.org>)
 id 1p4gax-0004fu-OE
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 06:03:40 -0500
Received: from movement by movementarian.org with local (Exim 4.95)
 (envelope-from <movement@movementarian.org>) id 1p4gaq-007qAE-9Q;
 Mon, 12 Dec 2022 11:03:32 +0000
Date: Mon, 12 Dec 2022 11:03:32 +0000
From: John Levon <levon@movementarian.org>
To: =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@redhat.com>
Cc: John Johnson <john.g.johnson@oracle.com>, qemu-devel@nongnu.org
Subject: Re: [PATCH v1 06/24] vfio-user: Define type vfio_user_pci_dev_info
Message-ID: <Y5cKhIY/F4/BwORD@movementarian.org>
References: <cover.1667542066.git.john.g.johnson@oracle.com>
 <957361f0e497e0b95f10a3caf617fe04d9c6fb72.1667542066.git.john.g.johnson@oracle.com>
 <78476e9d-0d40-12e8-075c-ec4ac84aab32@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <78476e9d-0d40-12e8-075c-ec4ac84aab32@redhat.com>
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, Dec 12, 2022 at 10:01:33AM +0100, Cédric Le Goater wrote:

> > diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
> > index 80b03a2..dc19869 100644
> > --- a/hw/vfio/pci.c
> > +++ b/hw/vfio/pci.c
> > @@ -19,6 +19,7 @@
> >    */
> >   #include "qemu/osdep.h"
> > +#include CONFIG_DEVICES
> >   #include <linux/vfio.h>
> >   #include <sys/ioctl.h>
> > @@ -3421,3 +3422,91 @@ static void register_vfio_pci_dev_type(void)
> >   }
> >   type_init(register_vfio_pci_dev_type)
> > +
> > +
> > +#ifdef CONFIG_VFIO_USER_PCI
> 
> Why not introduce a new file hw/vfio/user.c file ? It would be
> cleaner.

user.c is in this series, and holds the vfio-user implementation - it's not a
PCI specific thing. So it would have to be hw/vfio/user_pci.c or something

regards
john

