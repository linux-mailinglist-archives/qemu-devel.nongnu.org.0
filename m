Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89BE65A594
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Jun 2019 22:05:57 +0200 (CEST)
Received: from localhost ([::1]:36098 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hgx88-0004eZ-Q4
	for lists+qemu-devel@lfdr.de; Fri, 28 Jun 2019 16:05:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39219)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <ehabkost@redhat.com>) id 1hgx6D-0003OB-9R
 for qemu-devel@nongnu.org; Fri, 28 Jun 2019 16:03:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <ehabkost@redhat.com>) id 1hgx6A-0004kz-TS
 for qemu-devel@nongnu.org; Fri, 28 Jun 2019 16:03:57 -0400
Received: from mx1.redhat.com ([209.132.183.28]:57510)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <ehabkost@redhat.com>) id 1hgx6A-0004eI-5b
 for qemu-devel@nongnu.org; Fri, 28 Jun 2019 16:03:54 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 5002830BC564;
 Fri, 28 Jun 2019 20:03:34 +0000 (UTC)
Received: from localhost (ovpn-116-7.gru2.redhat.com [10.97.116.7])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A72815C634;
 Fri, 28 Jun 2019 20:03:29 +0000 (UTC)
Date: Fri, 28 Jun 2019 17:03:28 -0300
From: Eduardo Habkost <ehabkost@redhat.com>
To: Sergio Lopez <slp@redhat.com>
Message-ID: <20190628200328.GI1862@habkost.net>
References: <20190628115349.60293-1-slp@redhat.com>
 <20190628115349.60293-2-slp@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190628115349.60293-2-slp@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.49]); Fri, 28 Jun 2019 20:03:34 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH 1/4] hw/i386: Factorize CPU routine
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
Cc: pbonzini@redhat.com, rth@twiddle.net, qemu-devel@nongnu.org, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jun 28, 2019 at 01:53:46PM +0200, Sergio Lopez wrote:
[...]
>  /* Enables contiguous-apic-ID mode, for compatibility */
> -static bool compat_apic_id_mode;
> +bool compat_apic_id_mode;

We can get rid of this global variable, see the patch I have just
sent:

  [PATCH] pc: Move compat_apic_id_mode variable to PCMachineClass

-- 
Eduardo

