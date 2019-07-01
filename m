Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6084C2592D
	for <lists+qemu-devel@lfdr.de>; Tue, 21 May 2019 22:44:31 +0200 (CEST)
Received: from localhost ([127.0.0.1]:59214 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hTBcc-0002Ts-HZ
	for lists+qemu-devel@lfdr.de; Tue, 21 May 2019 16:44:30 -0400
Received: from eggs.gnu.org ([209.51.188.92]:34340)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1hTBa7-0000uG-V4
	for qemu-devel@nongnu.org; Tue, 21 May 2019 16:41:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1hTBNA-0006nb-Ar
	for qemu-devel@nongnu.org; Tue, 21 May 2019 16:28:33 -0400
Received: from mx1.redhat.com ([209.132.183.28]:32892)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1hTBN9-0006mG-6M; Tue, 21 May 2019 16:28:31 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 785D0307D988;
	Tue, 21 May 2019 20:28:30 +0000 (UTC)
Received: from localhost (ovpn-116-14.gru2.redhat.com [10.97.116.14])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0803460C18;
	Tue, 21 May 2019 20:28:27 +0000 (UTC)
Date: Tue, 21 May 2019 17:28:26 -0300
From: Eduardo Habkost <ehabkost@redhat.com>
To: John Snow <jsnow@redhat.com>
Message-ID: <20190521202826.GN10764@habkost.net>
References: <20190521200657.5377-1-jsnow@redhat.com>
	<20190521200657.5377-3-jsnow@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190521200657.5377-3-jsnow@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.48]);
	Tue, 21 May 2019 20:28:30 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH 2/2] docs/bitmaps: use QMP lexer instead of
 json
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

On Tue, May 21, 2019 at 04:06:57PM -0400, John Snow wrote:
> The annotated style json we use in QMP documentation is not strict json
> and depending on the version of Sphinx (2.0+) or Pygments installed,
> might cause the build to fail.
> 
> Use the new QMP lexer.
> 
> Further, some versions of Sphinx can not apply custom lexers to "code"
> directives and require the use of "code-block" directives instead, so
> make that change at this time as well.
> 
> Tested under:
> - Sphinx 1.3.6 and Pygments 2.4
> - Sphinx 1.7.6 and Pygments 2.2
> - Sphinx 2.0.1 and Pygments 2.4
> 
> Reported-by: Aarushi Mehta <mehta.aaru20@gmail.com>
> Signed-off-by: John Snow <jsnow@redhat.com>

Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>

-- 
Eduardo

