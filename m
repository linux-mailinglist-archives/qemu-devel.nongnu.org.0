Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C1E7512687D
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Dec 2019 18:56:49 +0100 (CET)
Received: from localhost ([::1]:45784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ii02a-0003l5-Fi
	for lists+qemu-devel@lfdr.de; Thu, 19 Dec 2019 12:56:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56731)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <ehabkost@redhat.com>) id 1ihzrg-0006WC-Jx
 for qemu-devel@nongnu.org; Thu, 19 Dec 2019 12:45:34 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <ehabkost@redhat.com>) id 1ihzrc-00056z-SF
 for qemu-devel@nongnu.org; Thu, 19 Dec 2019 12:45:31 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:51466
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <ehabkost@redhat.com>) id 1ihzrc-00050q-NB
 for qemu-devel@nongnu.org; Thu, 19 Dec 2019 12:45:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576777527;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7PaYYI65QhR2whramNsUb87k9QQ1VsCHm4pnTd9plLM=;
 b=ZE7MXSZN2rjNWGUIpfC2VDsM3QdYyYeHEaMyf2eRB9tywFc+cT5t7zEOcR//uHovTPMBof
 wu8HUl+yQp8oJ+EzCvGZY1sJuGk5UteDe8zMGrUuODVm4QV4PM9Qe4+Fxw8uDHWVzORlXi
 /4hJK/hW7PJu7hLmQHCPN4P11Z2G6n8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-66-0myIbI9pO6KWpiIxWG2Zfw-1; Thu, 19 Dec 2019 12:45:23 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D07E5106F8E9;
 Thu, 19 Dec 2019 17:45:22 +0000 (UTC)
Received: from localhost (ovpn-116-90.gru2.redhat.com [10.97.116.90])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 604F41A7E3;
 Thu, 19 Dec 2019 17:45:22 +0000 (UTC)
Date: Thu, 19 Dec 2019 14:45:21 -0300
From: Eduardo Habkost <ehabkost@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Subject: Re: [PATCH 1/2] numa: remove not needed check
Message-ID: <20191219174521.GR498046@habkost.net>
References: <1576154936-178362-1-git-send-email-imammedo@redhat.com>
 <1576154936-178362-2-git-send-email-imammedo@redhat.com>
MIME-Version: 1.0
In-Reply-To: <1576154936-178362-2-git-send-email-imammedo@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: 0myIbI9pO6KWpiIxWG2Zfw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
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
Cc: Tao Xu <tao3.xu@intel.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Dec 12, 2019 at 01:48:55PM +0100, Igor Mammedov wrote:
> Currently parse_numa_node() is always called from already numa
> enabled context.
> Drop unnecessary check if numa is supported.
>=20
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>

Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>

I'm queueing and I plan to send a pull request before the holiday
break.

--=20
Eduardo


