Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BF72D2443
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Oct 2019 10:51:27 +0200 (CEST)
Received: from localhost ([::1]:35194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iIUAP-0002CH-TB
	for lists+qemu-devel@lfdr.de; Thu, 10 Oct 2019 04:51:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60198)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <armbru@redhat.com>) id 1iIU8f-0001az-OW
 for qemu-devel@nongnu.org; Thu, 10 Oct 2019 04:49:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <armbru@redhat.com>) id 1iIU8e-0006Y1-R1
 for qemu-devel@nongnu.org; Thu, 10 Oct 2019 04:49:37 -0400
Received: from mx1.redhat.com ([209.132.183.28]:49902)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <armbru@redhat.com>)
 id 1iIU8b-0006W6-C5; Thu, 10 Oct 2019 04:49:33 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 2AB292D6A10;
 Thu, 10 Oct 2019 08:49:32 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.118.123])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1D4083CCA;
 Thu, 10 Oct 2019 08:49:27 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 7D9EE1138619; Thu, 10 Oct 2019 10:49:25 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH v2 1/1] IDE: deprecate ide-drive
References: <20191009224303.10232-1-jsnow@redhat.com>
 <20191009224303.10232-2-jsnow@redhat.com>
Date: Thu, 10 Oct 2019 10:49:25 +0200
In-Reply-To: <20191009224303.10232-2-jsnow@redhat.com> (John Snow's message of
 "Wed, 9 Oct 2019 18:43:03 -0400")
Message-ID: <87r23lrnmy.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.29]); Thu, 10 Oct 2019 08:49:32 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Krempa <pkrempa@redhat.com>,
 qemu-block@nongnu.org, libvir-list@redhat.com, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

John Snow <jsnow@redhat.com> writes:

> It's an old compatibility shim that just delegates to ide-cd or ide-hd.
> I'd like to refactor these some day, and getting rid of the super-object
> will make that easier.
>
> Either way, we don't need this.
>
> Libvirt-checked-by: Peter Krempa <pkrempa@redhat.com>
> Signed-off-by: John Snow <jsnow@redhat.com>

Reviewed-by: Markus Armbruster <armbru@redhat.com>

