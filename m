Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 005689F3CC
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Aug 2019 22:09:51 +0200 (CEST)
Received: from localhost ([::1]:57340 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i2hmn-0001XT-Re
	for lists+qemu-devel@lfdr.de; Tue, 27 Aug 2019 16:09:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46853)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <ehabkost@redhat.com>) id 1i2hlB-0000aJ-IQ
 for qemu-devel@nongnu.org; Tue, 27 Aug 2019 16:08:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <ehabkost@redhat.com>) id 1i2hl8-00034B-A4
 for qemu-devel@nongnu.org; Tue, 27 Aug 2019 16:08:07 -0400
Received: from mx1.redhat.com ([209.132.183.28]:41786)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <ehabkost@redhat.com>) id 1i2hl6-00030v-RJ
 for qemu-devel@nongnu.org; Tue, 27 Aug 2019 16:08:06 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 33AFF1801582;
 Tue, 27 Aug 2019 20:08:02 +0000 (UTC)
Received: from localhost (ovpn-116-73.gru2.redhat.com [10.97.116.73])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5D4B9600D1;
 Tue, 27 Aug 2019 20:08:01 +0000 (UTC)
Date: Tue, 27 Aug 2019 17:07:59 -0300
From: Eduardo Habkost <ehabkost@redhat.com>
To: Cleber Rosa <crosa@redhat.com>
Message-ID: <20190827200759.GD7077@habkost.net>
References: <20190826155832.17427-1-crosa@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190826155832.17427-1-crosa@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.63]); Tue, 27 Aug 2019 20:08:02 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v2] configure: more resilient Python
 version capture
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
Cc: Julio Montes <julio.montes@intel.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 tony.nguyen@bt.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Aug 26, 2019 at 11:58:32AM -0400, Cleber Rosa wrote:
> The current approach to capture the Python version is fragile, as it
> was demonstrated by a very specific build of Python 3 on Fedora 29
> that, under non-interactive shells would print multiline version
> information.
> 
> The (badly) stripped version output would be sent to config-host.mak,
> producing bad syntax and rendering the makefiles unusable.  Now, the
> Python versions is printed by configure, but only a simple (and better
> controlled variable) indicating whether the build system is using
> Python 2 is kept on config-host.mak.
> 
> Signed-off-by: Cleber Rosa <crosa@redhat.com>

Queued, thanks!

-- 
Eduardo

