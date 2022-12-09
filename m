Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 769EE648374
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Dec 2022 15:11:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p3e5e-0003nN-Br; Fri, 09 Dec 2022 09:11:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <movement@movementarian.org>)
 id 1p3e5V-0003jH-Eo
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 09:10:53 -0500
Received: from ssh.movementarian.org ([139.162.205.133] helo=movementarian.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <movement@movementarian.org>)
 id 1p3e5T-0007ZR-Cn
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 09:10:52 -0500
Received: from movement by movementarian.org with local (Exim 4.95)
 (envelope-from <movement@movementarian.org>) id 1p3e5P-007Knt-ND;
 Fri, 09 Dec 2022 14:10:47 +0000
Date: Fri, 9 Dec 2022 14:10:47 +0000
From: John Levon <levon@movementarian.org>
To: John Johnson <john.g.johnson@oracle.com>
Cc: qemu-devel@nongnu.org
Subject: Re: [PATCH v1 03/24] vfio-user: add container IO ops vector
Message-ID: <Y5NB524Q7UaaWAVx@movementarian.org>
References: <cover.1667542066.git.john.g.johnson@oracle.com>
 <d357c8c243ef839cc8e41fc1ae5c8db2d98fc2cc.1667542066.git.john.g.johnson@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d357c8c243ef839cc8e41fc1ae5c8db2d98fc2cc.1667542066.git.john.g.johnson@oracle.com>
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

On Tue, Nov 08, 2022 at 03:13:25PM -0800, John Johnson wrote:

> Used for communication with VFIO driver
> (prep work for vfio-user, which will communicate over a socket)

> index e573f5a..6fd40f1 100644
> --- a/include/hw/vfio/vfio-common.h
> +++ b/include/hw/vfio/vfio-common.h
> +
> +extern VFIOContIO vfio_cont_io_ioctl;

Nit, there's no need for this to be non-static, it's only used in
hw/vfio/common.c

regards
john

