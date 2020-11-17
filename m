Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F4852B5BBC
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Nov 2020 10:23:40 +0100 (CET)
Received: from localhost ([::1]:55202 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kexD8-0001jF-Ex
	for lists+qemu-devel@lfdr.de; Tue, 17 Nov 2020 04:23:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45886)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kexAV-0005iU-Nc
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 04:20:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:49689)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kexAU-000735-0d
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 04:20:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605604853;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=UesqJkCXcr59gYV0TmQKoYIyvYZDdzJQV4sLE1Z3k30=;
 b=YSmQYfl94bS6TgJHVjscdciS0a70ihAP2PkAdgTjzbLuDGxrZYOEMhnQ1Bau7OSoJCO6w3
 rHN6L0Pf9xICjKZpzWv2gCNemu6PE7VJ1JyJe1xjys8tRYRLmjneaVHoW8+yXZtOZ5/Tht
 f0oKE+1NTbli7kbAGdB/VX7Kc/iLq3o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-344-1Il33oNpO-GyFECct6wcLw-1; Tue, 17 Nov 2020 04:20:50 -0500
X-MC-Unique: 1Il33oNpO-GyFECct6wcLw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A14BF80F044
 for <qemu-devel@nongnu.org>; Tue, 17 Nov 2020 09:20:49 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-103.ams2.redhat.com
 [10.36.112.103])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 728AE10013D0;
 Tue, 17 Nov 2020 09:20:49 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id DED5611358BA; Tue, 17 Nov 2020 10:20:47 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH] python, tests: do not use short-form boolean options
References: <20201113152035.1459107-1-pbonzini@redhat.com>
Date: Tue, 17 Nov 2020 10:20:47 +0100
In-Reply-To: <20201113152035.1459107-1-pbonzini@redhat.com> (Paolo Bonzini's
 message of "Fri, 13 Nov 2020 10:20:35 -0500")
Message-ID: <87v9e49w5s.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=63.128.21.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/17 00:41:22
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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

Paolo Bonzini <pbonzini@redhat.com> writes:

> They are going to be deprecated, avoid warnings on stdout while the
> tests run.
>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  python/qemu/machine.py               | 2 +-
>  tests/qtest/pflash-cfi02-test.c      | 4 ++--
>  tests/qtest/test-filter-redirector.c | 8 ++++----
>  tests/qtest/vhost-user-test.c        | 8 ++++----
>  tests/test-char.c                    | 8 ++++----
>  5 files changed, 15 insertions(+), 15 deletions(-)
>
> diff --git a/python/qemu/machine.py b/python/qemu/machine.py
> index 6420f01bed..06e3e22935 100644
> --- a/python/qemu/machine.py
> +++ b/python/qemu/machine.py
> @@ -292,7 +292,7 @@ class QEMUMachine:
>          for _ in range(self._console_index):
>              args.extend(['-serial', 'null'])
>          if self._console_set:
> -            chardev = ('socket,id=console,path=%s,server,nowait' %
> +            chardev = ('socket,id=console,path=%s,server=yes,wait=no' %

Let's stick to the canonical 'on' and 'off'.

>                         self._console_address)
>              args.extend(['-chardev', chardev])
>              if self._console_device_type is None:
[More of the same...]


