Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6306712615C
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Dec 2019 12:57:53 +0100 (CET)
Received: from localhost ([::1]:39702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ihuRE-0001EU-G8
	for lists+qemu-devel@lfdr.de; Thu, 19 Dec 2019 06:57:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44698)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kwolf@redhat.com>) id 1ihuQK-0000g9-Vp
 for qemu-devel@nongnu.org; Thu, 19 Dec 2019 06:56:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kwolf@redhat.com>) id 1ihuQG-00025J-Po
 for qemu-devel@nongnu.org; Thu, 19 Dec 2019 06:56:54 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:50773
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kwolf@redhat.com>) id 1ihuQE-00022Z-2I
 for qemu-devel@nongnu.org; Thu, 19 Dec 2019 06:56:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576756608;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CmnyBQmGiYHU5hdvCl/m5bfRTtguboGsN/tme1ELZ40=;
 b=Si5CXZbGuC6Ay78BtPPMNhPzqMbzZ8bJj7D63cyhfxgY6PSapC++9PmGJeLGjDBMYF93gk
 tPyhZ+GcHxOoG56Vq4XM/D5jKPIprWd6DxXMc/JSiPX37lvwyA+EYwwrHPh4u3dA2FOBkj
 JCCHIDo+yNH3OQ0tZ2cLJn5IQTjCMMw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-411-FWzBtSAEMR6-EMQ0GLuL9Q-1; Thu, 19 Dec 2019 06:56:46 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 655DB107ACC9;
 Thu, 19 Dec 2019 11:56:45 +0000 (UTC)
Received: from linux.fritz.box (ovpn-117-53.ams2.redhat.com [10.36.117.53])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 54E5B1000329;
 Thu, 19 Dec 2019 11:56:44 +0000 (UTC)
Date: Thu, 19 Dec 2019 12:56:42 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH] iotests: Add more "_require_drivers" checks to the
 shell-based tests
Message-ID: <20191219115642.GG5230@linux.fritz.box>
References: <20191218161541.30769-1-thuth@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20191218161541.30769-1-thuth@redhat.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: FWzBtSAEMR6-EMQ0GLuL9Q-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 18.12.2019 um 17:15 hat Thomas Huth geschrieben:
> Test 051 should be skipped if nbd is not available, and 267 should
> be skipped if copy-on-read is not enabled.
>=20
> Signed-off-by: Thomas Huth <thuth@redhat.com>

Thanks, applied to the block branch.

Kevin


