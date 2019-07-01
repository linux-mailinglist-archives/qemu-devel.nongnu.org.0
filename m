Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F6B125429
	for <lists+qemu-devel@lfdr.de>; Tue, 21 May 2019 17:38:53 +0200 (CEST)
Received: from localhost ([127.0.0.1]:55722 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hT6qq-0004Pj-Gg
	for lists+qemu-devel@lfdr.de; Tue, 21 May 2019 11:38:52 -0400
Received: from eggs.gnu.org ([209.51.188.92]:59173)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex.williamson@redhat.com>) id 1hT6pj-00041u-Nq
	for qemu-devel@nongnu.org; Tue, 21 May 2019 11:37:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alex.williamson@redhat.com>) id 1hT6pi-0000so-Uh
	for qemu-devel@nongnu.org; Tue, 21 May 2019 11:37:43 -0400
Received: from mx1.redhat.com ([209.132.183.28]:50601)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <alex.williamson@redhat.com>)
	id 1hT6ph-0000s5-0J; Tue, 21 May 2019 11:37:42 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9F941307CDEA;
	Tue, 21 May 2019 15:37:39 +0000 (UTC)
Received: from x1.home (ovpn-117-92.phx2.redhat.com [10.3.117.92])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 192EE19C71;
	Tue, 21 May 2019 15:37:37 +0000 (UTC)
Date: Tue, 21 May 2019 09:37:36 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Li Qiang <liq3ea@163.com>
Message-ID: <20190521093736.417e8940@x1.home>
In-Reply-To: <20190521151543.92274-1-liq3ea@163.com>
References: <20190521151543.92274-1-liq3ea@163.com>
Organization: Red Hat
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.49]);
	Tue, 21 May 2019 15:37:39 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v2 0/4] hw: vfio: some trivial fix
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
Cc: lvivier@redhat.com, qemu-trivial@nongnu.org, liq3ea@gmail.com,
	qemu-devel@nongnu.org, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 21 May 2019 08:15:39 -0700
Li Qiang <liq3ea@163.com> wrote:

> These patchset fix some trivial issues,
> The first patch makes the code more QOMConventions.
> The second decouples VMStateDescription's name with
> QOM TypeInfo's name.
> The third fixes a typo.
> The fourth reduce duplicated code.
> 
> Change since v1:
> Add more commit message.

Thank you for making this series 'trivial' by providing explanation and
justification for each change.  If trivial wants to include this, for
series:

Acked-by: Alex Williamson <alex.williamson@redhat.com>

