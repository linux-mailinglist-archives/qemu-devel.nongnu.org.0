Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 558A62592F
	for <lists+qemu-devel@lfdr.de>; Tue, 21 May 2019 22:44:54 +0200 (CEST)
Received: from localhost ([127.0.0.1]:59216 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hTBcz-0002tk-FC
	for lists+qemu-devel@lfdr.de; Tue, 21 May 2019 16:44:53 -0400
Received: from eggs.gnu.org ([209.51.188.92]:34340)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1hTBa9-0000uG-8t
	for qemu-devel@nongnu.org; Tue, 21 May 2019 16:41:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1hTBMx-0006fc-9T
	for qemu-devel@nongnu.org; Tue, 21 May 2019 16:28:20 -0400
Received: from mx1.redhat.com ([209.132.183.28]:37214)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1hTBMw-0006ej-6y; Tue, 21 May 2019 16:28:18 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 62084307BA56;
	Tue, 21 May 2019 20:28:17 +0000 (UTC)
Received: from localhost (ovpn-116-14.gru2.redhat.com [10.97.116.14])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D2AA419744;
	Tue, 21 May 2019 20:28:14 +0000 (UTC)
Date: Tue, 21 May 2019 17:28:13 -0300
From: Eduardo Habkost <ehabkost@redhat.com>
To: John Snow <jsnow@redhat.com>
Message-ID: <20190521202812.GM10764@habkost.net>
References: <20190521200657.5377-1-jsnow@redhat.com>
	<20190521200657.5377-2-jsnow@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190521200657.5377-2-jsnow@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.43]);
	Tue, 21 May 2019 20:28:17 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH 1/2] sphinx: add qmp_lexer
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org, qemu-block@nongnu.org,
	Aarushi Mehta <mehta.aaru20@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, May 21, 2019 at 04:06:56PM -0400, John Snow wrote:
> Sphinx, through Pygments, does not like annotated json examples very
> much. In some versions of Sphinx (1.7), it will render the non-json
> portions of code blocks in red, but in newer versions (2.0) it will
> throw an exception and not highlight the block at all. Though we can
> suppress this warning, it doesn't bring back highlighting on non-strict
> json blocks.
> 
> We can alleviate this by creating a custom lexer for QMP examples that
> allows us to properly highlight these examples in a robust way, keeping
> our directionality notations.
> 
> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
> Signed-off-by: John Snow <jsnow@redhat.com>

Thanks for figuring out how to integrate it into Sphinx!

Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>

-- 
Eduardo

