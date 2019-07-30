Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C59527A9E8
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Jul 2019 15:43:27 +0200 (CEST)
Received: from localhost ([::1]:33036 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hsSPX-0008BM-1N
	for lists+qemu-devel@lfdr.de; Tue, 30 Jul 2019 09:43:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51543)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <quintela@redhat.com>) id 1hsSOd-0007Ek-Es
 for qemu-devel@nongnu.org; Tue, 30 Jul 2019 09:42:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <quintela@redhat.com>) id 1hsSOc-0007sq-HQ
 for qemu-devel@nongnu.org; Tue, 30 Jul 2019 09:42:31 -0400
Received: from mx1.redhat.com ([209.132.183.28]:36016)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <quintela@redhat.com>) id 1hsSOc-0007s6-An
 for qemu-devel@nongnu.org; Tue, 30 Jul 2019 09:42:30 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id B441D3091D63
 for <qemu-devel@nongnu.org>; Tue, 30 Jul 2019 13:42:28 +0000 (UTC)
Received: from redhat.com (ovpn-116-30.ams2.redhat.com [10.36.116.30])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B3A965C1B4;
 Tue, 30 Jul 2019 13:42:25 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: "Dr. David Alan Gilbert \(git\)" <dgilbert@redhat.com>
In-Reply-To: <20190730093719.12958-3-dgilbert@redhat.com> (David Alan
 Gilbert's message of "Tue, 30 Jul 2019 10:37:19 +0100")
References: <20190730093719.12958-1-dgilbert@redhat.com>
 <20190730093719.12958-3-dgilbert@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.2 (gnu/linux)
Date: Tue, 30 Jul 2019 15:42:23 +0200
Message-ID: <87mugvk5a8.fsf@trasno.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.42]); Tue, 30 Jul 2019 13:42:28 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH 2/2] pcie_root_port: Disable ACS on older
 machines
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
Reply-To: quintela@redhat.com
Cc: qemu-devel@nongnu.org, ehabkost@redhat.com, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

"Dr. David Alan Gilbert (git)" <dgilbert@redhat.com> wrote:
> From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
>
> ACS got added in 4.0 unconditionally,  that broke older<->4.0 migration
> where there was a PCIe root port.
> Fix this by turning it off for 3.1 and older machines; note this
> fixes compatibility for older QEMUs but breaks compatibility with 4.0
> for older machine types.
>
>     machine type    source qemu   dest qemu
>        3.1             3.1           4.0        broken
>        3.1             3.1           4.1rc2     broken
>        3.1             3.1           4.1+this   OK ++
>        3.1             4.0           4.1rc2     OK
>        3.1             4.0           4.1+this   broken --
>        4.0             4.0           4.1rc2     OK
>        4.0             4.0           4.1+this   OK
>
> So we gain and lose; the consensus seems to be treat this as a
> fix for older machine types.
>
> Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> ---

Reviewed-by: Juan Quintela <quintela@redhat.com>

