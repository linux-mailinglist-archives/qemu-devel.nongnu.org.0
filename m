Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EAB37B98A7
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Sep 2019 22:50:59 +0200 (CEST)
Received: from localhost ([::1]:35402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iBPrm-0006Nd-H7
	for lists+qemu-devel@lfdr.de; Fri, 20 Sep 2019 16:50:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46303)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <crosa@redhat.com>) id 1iBPqC-0005t3-W6
 for qemu-devel@nongnu.org; Fri, 20 Sep 2019 16:49:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <crosa@redhat.com>) id 1iBPqB-0008Nu-GH
 for qemu-devel@nongnu.org; Fri, 20 Sep 2019 16:49:20 -0400
Received: from mx1.redhat.com ([209.132.183.28]:47716)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <crosa@redhat.com>) id 1iBPqB-0008Ne-B0
 for qemu-devel@nongnu.org; Fri, 20 Sep 2019 16:49:19 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 6BBF35AFE9;
 Fri, 20 Sep 2019 20:49:18 +0000 (UTC)
Received: from localhost.localdomain (ovpn-123-8.rdu2.redhat.com [10.10.123.8])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A35E71001947;
 Fri, 20 Sep 2019 20:49:12 +0000 (UTC)
Date: Fri, 20 Sep 2019 16:49:10 -0400
From: Cleber Rosa <crosa@redhat.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Subject: Re: [PATCH] Acceptance tests: use avocado.utils.ssh for SSH
 interaction
Message-ID: <20190920204910.GA9182@localhost.localdomain>
References: <20190919225905.10829-1-crosa@redhat.com>
 <20190920203335.GP5035@habkost.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190920203335.GP5035@habkost.net>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.39]); Fri, 20 Sep 2019 20:49:18 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
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
Cc: Aleksandar Rikalo <arikalo@wavecomp.com>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <wrampazz@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Sep 20, 2019 at 05:33:35PM -0300, Eduardo Habkost wrote:
> On Thu, Sep 19, 2019 at 06:59:05PM -0400, Cleber Rosa wrote:
> > This replaces paramiko with avocado.utils.ssh module, which is based
> > on a (open)ssh binary, supposedly more ubiquitous.
> > 
> > Signed-off-by: Cleber Rosa <crosa@redhat.com>
> 
> Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>
> 
> -- 
> Eduardo
> 

With this being reviewed, we can carry out the substitution of
https://lore.kernel.org/qemu-devel/20190830184033.7630-1-philmd@redhat.com/
for this one IMO.

And, as you've suggested, I'll be picking up your pending patches
(but that one) and queueing them on my python-next branch.

Thanks a lot!

- Cleber.

