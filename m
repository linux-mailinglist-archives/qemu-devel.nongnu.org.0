Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE0B1199C9
	for <lists+qemu-devel@lfdr.de>; Fri, 10 May 2019 10:40:02 +0200 (CEST)
Received: from localhost ([127.0.0.1]:39025 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hP14T-0003ok-T0
	for lists+qemu-devel@lfdr.de; Fri, 10 May 2019 04:40:01 -0400
Received: from eggs.gnu.org ([209.51.188.92]:32769)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kchamart@redhat.com>) id 1hP13T-0003V6-0k
	for qemu-devel@nongnu.org; Fri, 10 May 2019 04:38:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kchamart@redhat.com>) id 1hP13R-0000zF-US
	for qemu-devel@nongnu.org; Fri, 10 May 2019 04:38:58 -0400
Received: from mx1.redhat.com ([209.132.183.28]:51474)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kchamart@redhat.com>) id 1hP13R-0000xq-FG
	for qemu-devel@nongnu.org; Fri, 10 May 2019 04:38:57 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 75A453DDBE;
	Fri, 10 May 2019 08:38:54 +0000 (UTC)
Received: from paraplu.localdomain (ovpn-117-82.ams2.redhat.com [10.36.117.82])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3F2415DF4B;
	Fri, 10 May 2019 08:38:54 +0000 (UTC)
Received: by paraplu.localdomain (Postfix, from userid 1001)
	id 6216F3E0060; Fri, 10 May 2019 10:38:52 +0200 (CEST)
Date: Fri, 10 May 2019 10:38:52 +0200
From: Kashyap Chamarthy <kchamart@redhat.com>
To: Laurent Vivier <lvivier@redhat.com>
Message-ID: <20190510083852.GY4675@paraplu>
References: <20190509142342.6132-1-lvivier@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190509142342.6132-1-lvivier@redhat.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Fri, 10 May 2019 08:38:54 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [RFC] rng-builtin: add an RNG backend that uses
 qemu_guest_getrandom()
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Daniel P =?iso-8859-1?Q?=2E_Berrang=E9?= <berrange@redhat.com>,
	Amit Shah <amit@kernel.org>, qemu-devel@nongnu.org,
	Richard Henderson <richard.henderson@linaro.org>,
	Markus Armbruster <armbru@redhat.com>,
	"Richard W . M . Jones" <rjones@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, May 09, 2019 at 04:23:42PM +0200, Laurent Vivier wrote:
> Add a new RNG backend using QEMU builtin getrandom function.
> 
> It can be created with "-object rng-builtin".

Can you please specify a full, working example in the commit message?
It would be useful for later reference.

> This patch applies on top of
> "[PATCH v4 00/24] Add qemu_getrandom and ARMv8.5-RNG etc"
> Based-on: <20190506173353.32206-1-richard.henderson@linaro.org>
> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
> ---
>  backends/Makefile.objs |  2 +-
>  backends/rng-builtin.c | 56 ++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 57 insertions(+), 1 deletion(-)
>  create mode 100644 backends/rng-builtin.c

[...]

-- 
/kashyap

