Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC2B6C2D92
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Oct 2019 08:41:22 +0200 (CEST)
Received: from localhost ([::1]:59308 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iFBqb-0006YG-8W
	for lists+qemu-devel@lfdr.de; Tue, 01 Oct 2019 02:41:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45831)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <armbru@redhat.com>) id 1iFBpi-00069F-MI
 for qemu-devel@nongnu.org; Tue, 01 Oct 2019 02:40:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <armbru@redhat.com>) id 1iFBpg-0002hH-6n
 for qemu-devel@nongnu.org; Tue, 01 Oct 2019 02:40:25 -0400
Received: from mx1.redhat.com ([209.132.183.28]:37692)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <armbru@redhat.com>) id 1iFBpg-0002gx-0I
 for qemu-devel@nongnu.org; Tue, 01 Oct 2019 02:40:24 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 2BC78C049E36;
 Tue,  1 Oct 2019 06:40:23 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.118.123])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D54BD5D9C9;
 Tue,  1 Oct 2019 06:40:22 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 4B2041138648; Tue,  1 Oct 2019 08:40:21 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Peter Krempa <pkrempa@redhat.com>
Subject: Re: [PATCH v2 1/2] qapi: Add feature flags to commands in qapi
 introspection
References: <cover.1568989362.git.pkrempa@redhat.com>
 <96cc954e1cba111a4565123badb42c36e534a5d3.1568989362.git.pkrempa@redhat.com>
Date: Tue, 01 Oct 2019 08:40:21 +0200
In-Reply-To: <96cc954e1cba111a4565123badb42c36e534a5d3.1568989362.git.pkrempa@redhat.com>
 (Peter Krempa's message of "Fri, 20 Sep 2019 16:26:44 +0200")
Message-ID: <87r23x55pm.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.31]); Tue, 01 Oct 2019 06:40:23 +0000 (UTC)
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org,
 Michael Roth <mdroth@linux.vnet.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Peter Krempa <pkrempa@redhat.com> writes:

> Similarly to features for struct types introduce the feature flags also
> for commands. This will allow notifying management layers of fixes and
> compatible changes in the behaviour of a command which may not be
> detectable any other way.
>
> The changes were heavily inspired by commit 6a8c0b51025.
>
> Signed-off-by: Peter Krempa <pkrempa@redhat.com>

+1 on adding features to commands.

Patch conflicts with the technical debt payback work I posted before and
after this series, although not nearly as badly as I expected.  It'll
conflict some more with the parts I haven't flushed.  The funny bit: I
went on that rampage in preparation of QAPI language extensions
including "features everywhere, not just structs".

I'll look into how to best fit your work into mine.

