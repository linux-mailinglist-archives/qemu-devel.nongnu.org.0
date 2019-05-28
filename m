Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 364802BF27
	for <lists+qemu-devel@lfdr.de>; Tue, 28 May 2019 08:16:56 +0200 (CEST)
Received: from localhost ([127.0.0.1]:57824 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hVVPr-0005UD-Ev
	for lists+qemu-devel@lfdr.de; Tue, 28 May 2019 02:16:55 -0400
Received: from eggs.gnu.org ([209.51.188.92]:58752)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1hVVOV-0004xo-KR
	for qemu-devel@nongnu.org; Tue, 28 May 2019 02:15:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1hVVOU-0007KN-Qc
	for qemu-devel@nongnu.org; Tue, 28 May 2019 02:15:31 -0400
Received: from mx1.redhat.com ([209.132.183.28]:59482)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <armbru@redhat.com>)
	id 1hVVOO-0007B3-BH; Tue, 28 May 2019 02:15:26 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 676B130001E2;
	Tue, 28 May 2019 06:15:20 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-117-250.ams2.redhat.com
	[10.36.117.250])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 212CE19C79;
	Tue, 28 May 2019 06:15:20 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id A0A3E1138648; Tue, 28 May 2019 08:15:13 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>, Max Reitz <mreitz@redhat.com>
References: <20190524075848.23781-1-sgarzare@redhat.com>
Date: Tue, 28 May 2019 08:15:13 +0200
In-Reply-To: <20190524075848.23781-1-sgarzare@redhat.com> (Stefano
	Garzarella's message of "Fri, 24 May 2019 09:58:45 +0200")
Message-ID: <87ftozds0e.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.49]);
	Tue, 28 May 2019 06:15:21 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v2 0/3] Update documentation and help
 related to the preallocation parameter
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
Cc: integration@gluster.org, qemu-devel@nongnu.org, qemu-block@nongnu.org,
	Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Kevin, Max, this series looks ready to me.  Feel free to ask me to take
it through my tree.

