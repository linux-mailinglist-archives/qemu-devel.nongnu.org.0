Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DE284D446A
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Mar 2022 11:22:45 +0100 (CET)
Received: from localhost ([::1]:35768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSFwS-0008QO-5K
	for lists+qemu-devel@lfdr.de; Thu, 10 Mar 2022 05:22:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34382)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <movement@movementarian.org>)
 id 1nSFue-0007Ze-N7
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 05:20:52 -0500
Received: from ssh.movementarian.org ([139.162.205.133]:53188
 helo=movementarian.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <movement@movementarian.org>)
 id 1nSFud-00050i-5q
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 05:20:52 -0500
Received: from movement by movementarian.org with local (Exim 4.94.2)
 (envelope-from <movement@movementarian.org>)
 id 1nSFuW-001QOr-Cq; Thu, 10 Mar 2022 10:20:44 +0000
Date: Thu, 10 Mar 2022 10:20:44 +0000
From: John Levon <levon@movementarian.org>
To: Alex Williamson <alex.williamson@redhat.com>
Subject: Re: [RFC v4 01/21] vfio-user: introduce vfio-user protocol
 specification
Message-ID: <YinQ/AU7Z02PFEbk@movementarian.org>
References: <cover.1641584316.git.john.g.johnson@oracle.com>
 <a9b696ca38ee2329e371c28bcaa2921cac2a48a2.1641584316.git.john.g.johnson@oracle.com>
 <20220309153453.25eee9dd.alex.williamson@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220309153453.25eee9dd.alex.williamson@redhat.com>
X-Url: http://www.movementarian.org/
Received-SPF: pass client-ip=139.162.205.133;
 envelope-from=movement@movementarian.org; helo=movementarian.org
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: John Johnson <john.g.johnson@oracle.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Mar 09, 2022 at 03:34:53PM -0700, Alex Williamson wrote:

> > +The only device-specific region type and subtype supported by vfio-user is
> > +``VFIO_REGION_TYPE_MIGRATION`` (3) and ``VFIO_REGION_SUBTYPE_MIGRATION`` (1).
> 
> These should be considered deprecated from the kernel interface.  I
> hope there are plans for vfio-user to adopt the new interface that's
> currently available in linux-next and intended for v5.18.

https://github.com/nutanix/libvfio-user/issues/654

regards
john

