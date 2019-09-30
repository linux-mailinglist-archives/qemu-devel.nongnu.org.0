Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21C8CC2175
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Sep 2019 15:07:08 +0200 (CEST)
Received: from localhost ([::1]:52124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iEvON-0006Cm-6Z
	for lists+qemu-devel@lfdr.de; Mon, 30 Sep 2019 09:07:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40059)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pkrempa@redhat.com>) id 1iEvLf-0004an-LS
 for qemu-devel@nongnu.org; Mon, 30 Sep 2019 09:04:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pkrempa@redhat.com>) id 1iEvLe-0002iV-Kh
 for qemu-devel@nongnu.org; Mon, 30 Sep 2019 09:04:19 -0400
Received: from mx1.redhat.com ([209.132.183.28]:55732)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <pkrempa@redhat.com>) id 1iEvLe-0002hA-Et
 for qemu-devel@nongnu.org; Mon, 30 Sep 2019 09:04:18 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id D01B83086246;
 Mon, 30 Sep 2019 13:04:16 +0000 (UTC)
Received: from angien.pipo.sk (unknown [10.43.2.229])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AFC135C223;
 Mon, 30 Sep 2019 13:04:14 +0000 (UTC)
Date: Mon, 30 Sep 2019 15:04:12 +0200
From: Peter Krempa <pkrempa@redhat.com>
To: qemu-devel@nongnu.org
Subject: Re: [PATCH v2 0/2] qapi: Add detection for the 'savevm' fix for
 blockdev
Message-ID: <20190930130412.GT9210@angien.pipo.sk>
References: <cover.1568989362.git.pkrempa@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <cover.1568989362.git.pkrempa@redhat.com>
X-PGP-Key-ID: 0xD018682B
X-PGP-Key-Fingerprint: D294 FF38 A6A2 BF40 6C75  5DEF 36EC 16AC D018 682B
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.49]); Mon, 30 Sep 2019 13:04:16 +0000 (UTC)
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
Cc: Kevin Wolf <kwolf@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Michael Roth <mdroth@linux.vnet.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Sep 20, 2019 at 16:26:43 +0200, Peter Krempa wrote:
> Add 'features' field in the schema for commands and add a feature flag
> to advertise that the fix for savevm [1] is present.
>=20
> [1] https://lists.gnu.org/archive/html/qemu-devel/2019-09/msg03487.html
>=20
> v2:
>  - fixed typos pointed out by Eric
>  - added 'since' tag
>  - reworded to describe the fix this allows to detect properly (Kevin)
>  - verified that this can be rebased on top of Markus' series
>    automatically

Ping

