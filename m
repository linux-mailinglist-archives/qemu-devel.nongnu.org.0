Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [IPv6:2001:470:142::17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3031B1BD3D1
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Apr 2020 06:54:04 +0200 (CEST)
Received: from localhost ([::1]:56524 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jTejS-0001fj-Nl
	for lists+qemu-devel@lfdr.de; Wed, 29 Apr 2020 00:54:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34086)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <armbru@redhat.com>) id 1jTeij-0001F2-Ho
 for qemu-devel@nongnu.org; Wed, 29 Apr 2020 00:53:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <armbru@redhat.com>) id 1jTeii-00074e-9l
 for qemu-devel@nongnu.org; Wed, 29 Apr 2020 00:53:16 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:48664
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jTeih-00073y-Nf
 for qemu-devel@nongnu.org; Wed, 29 Apr 2020 00:53:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588135993;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Vl4RNxaeLHGhKBcxMhvuZcdXcX6cJcc47UaGJ1PExIY=;
 b=V5eplJZwqmKyR778HNvTfrUhgKcTs1cy1OdjQTfWlqmuC+SDk+P5/DBfHO5UfR/Fq/VVxz
 TekOHTti6QhZtWavRu2AvuNpx+zAx73vxtRe+zgECkkwwJ99QwHaKEcrbQ8VG0xNQPdk+N
 NDFqgAj1SB1XfpalhE/Ejf9t/Dhho9o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-2-1x3RpkP8Np6hD9QUxXh3fg-1; Wed, 29 Apr 2020 00:53:11 -0400
X-MC-Unique: 1x3RpkP8Np6hD9QUxXh3fg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 53DDE107ACF4;
 Wed, 29 Apr 2020 04:53:10 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-113-6.ams2.redhat.com [10.36.113.6])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3B2C460638;
 Wed, 29 Apr 2020 04:53:08 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id B728C11358BC; Wed, 29 Apr 2020 06:53:06 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Masahiro Yamada <masahiroy@kernel.org>
Subject: Re: [PATCH] qemu-option: pass NULL rather than 0 to the id of
 qemu_opts_set()
References: <20200427005704.2475782-1-masahiroy@kernel.org>
Date: Wed, 29 Apr 2020 06:53:06 +0200
In-Reply-To: <20200427005704.2475782-1-masahiroy@kernel.org> (Masahiro
 Yamada's message of "Mon, 27 Apr 2020 09:57:04 +0900")
Message-ID: <87zhaux58t.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=205.139.110.61; envelope-from=armbru@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/04/29 00:53:13
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Masahiro Yamada <masahiroy@kernel.org> writes:

> The second argument 'id' is a pointer. Pass NULL rather than 0.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

Reviewed-by: Markus Armbruster <armbru@redhat.com>

and queued, thanks!


