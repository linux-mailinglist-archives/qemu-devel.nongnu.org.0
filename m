Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B2A815B0E6
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Feb 2020 20:21:52 +0100 (CET)
Received: from localhost ([::1]:42306 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j1xa2-0003SN-Jk
	for lists+qemu-devel@lfdr.de; Wed, 12 Feb 2020 14:21:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60366)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <ehabkost@redhat.com>) id 1j1xZ7-0002yr-Oj
 for qemu-devel@nongnu.org; Wed, 12 Feb 2020 14:20:54 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <ehabkost@redhat.com>) id 1j1xZ5-0005Ih-Io
 for qemu-devel@nongnu.org; Wed, 12 Feb 2020 14:20:52 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:49356
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <ehabkost@redhat.com>) id 1j1xZ5-0005I4-AH
 for qemu-devel@nongnu.org; Wed, 12 Feb 2020 14:20:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581535250;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=s0lXdHMdVKA2lMjrl9KywbEwQU1cAXTI72xDOQukghM=;
 b=dT8aLuaaEvyPK2I5aZV5Ccao0JlAFlDbGvuCPoklJf+aI8gxH0kMTMGFpSxRDcINe1Vb/2
 T3vZkLQuhPEcfsn1gEEIa8VJBevunpB57OKNK2/4MDrICJfYYKtFtHc0Cc80X4UxVICwap
 z1nWCoiajm5uujGlLgmJ2BozzQqAaF4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-14-iXHHlpguOIiyJaHHuuYTyA-1; Wed, 12 Feb 2020 14:20:47 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C23948017CC
 for <qemu-devel@nongnu.org>; Wed, 12 Feb 2020 19:20:46 +0000 (UTC)
Received: from localhost (ovpn-126-54.rdu2.redhat.com [10.10.126.54])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 881D15C10D;
 Wed, 12 Feb 2020 19:20:46 +0000 (UTC)
Date: Wed, 12 Feb 2020 14:20:45 -0500
From: Eduardo Habkost <ehabkost@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH] target/i386: enable monitor and ucode revision with -cpu
 max
Message-ID: <20200212192045.GD30675@habkost.net>
References: <1581521009-44121-1-git-send-email-pbonzini@redhat.com>
MIME-Version: 1.0
In-Reply-To: <1581521009-44121-1-git-send-email-pbonzini@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: iXHHlpguOIiyJaHHuuYTyA-1
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Feb 12, 2020 at 04:23:29PM +0100, Paolo Bonzini wrote:
> These two features were incorrectly tied to host_cpuid_required rather th=
an
> cpu->max_features.  As a result, -cpu max was not enabling either MONITOR
> features or ucode revision.
>=20
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>

--=20
Eduardo


