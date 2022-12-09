Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B46136487EB
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Dec 2022 18:45:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p3hQx-0008L0-Es; Fri, 09 Dec 2022 12:45:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <movement@movementarian.org>)
 id 1p3hQt-0008Ga-8h
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 12:45:11 -0500
Received: from ssh.movementarian.org ([139.162.205.133] helo=movementarian.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <movement@movementarian.org>)
 id 1p3hQr-0002w3-I2
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 12:45:10 -0500
Received: from movement by movementarian.org with local (Exim 4.95)
 (envelope-from <movement@movementarian.org>) id 1p3hQp-007OrH-Mk;
 Fri, 09 Dec 2022 17:45:07 +0000
Date: Fri, 9 Dec 2022 17:45:07 +0000
From: John Levon <levon@movementarian.org>
To: John Johnson <john.g.johnson@oracle.com>
Cc: qemu-devel@nongnu.org
Subject: Re: [PATCH v1 15/24] vfio-user: forward msix BAR accesses to server
Message-ID: <Y5N0Iy56KpFsu/D5@movementarian.org>
References: <cover.1667542066.git.john.g.johnson@oracle.com>
 <440467975afbc80a97caaead3222199397c0698e.1667542066.git.john.g.johnson@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <440467975afbc80a97caaead3222199397c0698e.1667542066.git.john.g.johnson@oracle.com>
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

On Tue, Nov 08, 2022 at 03:13:37PM -0800, John Johnson wrote:

> Server holds device current device pending state
> Use irq masking commands in socket case

As far as I'm able to tell, this looks good to me

regards
john

