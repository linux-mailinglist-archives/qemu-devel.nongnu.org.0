Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 829AA27B1A8
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Sep 2020 18:18:33 +0200 (CEST)
Received: from localhost ([::1]:49214 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kMvrD-0001OA-VP
	for lists+qemu-devel@lfdr.de; Mon, 28 Sep 2020 12:18:31 -0400
Received: from eggs.gnu.org ([209.51.188.92]:50972)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anthony.perard@citrix.com>)
 id 1kMvom-0000bV-Lp
 for qemu-devel@nongnu.org; Mon, 28 Sep 2020 12:16:01 -0400
Received: from esa6.hc3370-68.iphmx.com ([216.71.155.175]:34983)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anthony.perard@citrix.com>)
 id 1kMvoi-0006HI-7N
 for qemu-devel@nongnu.org; Mon, 28 Sep 2020 12:16:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1601309756;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=O2a4ggHVMxGwkIgX1SKbGKPbKeHPULf2/iNWYkEGc5U=;
 b=NOHYUJ2dKhlB2wFMxTreOGhLlaa/Mf3mAQS4SSYrxwKcyH2+0NGcJMtZ
 P3ZKpfCn0DJrIbJiWtqqU1X8W1EAoK3g3EXhYLeYkCrWIRMUzxYeljWVj
 WRxtTfpYSzeRy0ocX4bO70k+y1RW55dJReUOiQH6L6GHfJtXQqD7ORNBa 4=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: 590Te1h7Btz9nxkIFUyekaYheUsFx4Szo+tL8YggzFwIy28azrsEqy/XOPVCqw8gdhoha1t1ER
 uLJT2NUJBhyGSPzU06B4e7AGHpIkrGWR9uedN6Tb+9Q9D2tU1VrHMlbDPfno/sg3UW8+RV2Rpj
 H5p2yPV/fMgP8mxUQqh7ewpelxfx38Ba9xpJ+Y8+KXqvQh/AmH9OoeIpm8m2P66XyWvNRJUP+w
 SmG1VqaUjxmYvwfBpIIzC4Y2dfqeuT9Xc9RL4PaOx9ZWVB62iisLD3EDyIcxNspWNdehaxeRSI
 cNE=
X-SBRS: None
X-MesageID: 28052147
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,313,1596513600"; d="scan'208";a="28052147"
Date: Mon, 28 Sep 2020 17:15:47 +0100
To: Eduardo Habkost <ehabkost@redhat.com>
CC: <qemu-devel@nongnu.org>, <berrange@redhat.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>,
 <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 57/63] xen: Rename XENBACKEND_DEVICE to XENBACKEND
Message-ID: <20200928161547.GJ2024@perard.uk.xensource.com>
References: <20200902224311.1321159-1-ehabkost@redhat.com>
 <20200902224311.1321159-58-ehabkost@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20200902224311.1321159-58-ehabkost@redhat.com>
Received-SPF: pass client-ip=216.71.155.175;
 envelope-from=anthony.perard@citrix.com; helo=esa6.hc3370-68.iphmx.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/28 12:15:51
X-ACL-Warn: Detected OS   = FreeBSD 9.x or newer [fuzzy]
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.687,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-to: Anthony PERARD <anthony.perard@citrix.com>
From: Anthony PERARD via <qemu-devel@nongnu.org>

On Wed, Sep 02, 2020 at 06:43:05PM -0400, Eduardo Habkost wrote:
> Make the type checking macro name consistent with the TYPE_*
> constant.
> 
> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>

Acked-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

