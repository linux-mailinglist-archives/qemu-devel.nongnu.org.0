Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F1BAA17FBE5
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Mar 2020 14:17:35 +0100 (CET)
Received: from localhost ([::1]:60794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jBelK-0004d2-VC
	for lists+qemu-devel@lfdr.de; Tue, 10 Mar 2020 09:17:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58362)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pkrempa@redhat.com>) id 1jBejx-0003Tq-3O
 for qemu-devel@nongnu.org; Tue, 10 Mar 2020 09:16:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pkrempa@redhat.com>) id 1jBejw-0005jF-2L
 for qemu-devel@nongnu.org; Tue, 10 Mar 2020 09:16:09 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:30480
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <pkrempa@redhat.com>) id 1jBejv-0005hp-Ur
 for qemu-devel@nongnu.org; Tue, 10 Mar 2020 09:16:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583846167;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iNBX0O7o1EsBQOqJLWAi7m5UVLHzRC/BS3NVK3XZbTI=;
 b=DwaI2ndySDQPNHnpbR8u0yIrUh37rN1qIk1L5AlZZlvyNwCT7gYTaoDJg6MZqnzZKJE1Bg
 ElgJRqRcn9lCO7rpO+I1UKOlHfA+SsEkzRYNtgta5BU/Le8RE/6ZUZ2n7q8OV4B1TSe85/
 bo4NQ6q6XoGvlRLSd6NH+y9ZzPbrQ7I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-234-7qnlotmNPP--hEg14mY1cw-1; Tue, 10 Mar 2020 09:16:05 -0400
X-MC-Unique: 7qnlotmNPP--hEg14mY1cw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7BD6D100550D;
 Tue, 10 Mar 2020 13:16:04 +0000 (UTC)
Received: from angien.pipo.sk (unknown [10.43.2.48])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 79955100164D;
 Tue, 10 Mar 2020 13:16:03 +0000 (UTC)
Date: Tue, 10 Mar 2020 14:16:00 +0100
From: Peter Krempa <pkrempa@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Subject: Re: [PATCH v2 3/7] iotests: Fix run_job() with use_log=False
Message-ID: <20200310131600.GA1320660@angien.pipo.sk>
References: <20200310113831.27293-1-kwolf@redhat.com>
 <20200310113831.27293-4-kwolf@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200310113831.27293-4-kwolf@redhat.com>
X-PGP-Key-ID: 0xD018682B
X-PGP-Key-Fingerprint: D294 FF38 A6A2 BF40 6C75  5DEF 36EC 16AC D018 682B
User-Agent: Mutt/1.13.3 (2020-01-12)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.61
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
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Mar 10, 2020 at 12:38:27 +0100, Kevin Wolf wrote:
> The 'job-complete' QMP command should be run with qmp() rather than
> qmp_log() if use_log=3DFalse is passed.
>=20
> Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> ---
>  tests/qemu-iotests/iotests.py | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)

Reviewed-by: Peter Krempa <pkrempa@redhat.com>


