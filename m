Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E88D611BD15
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Dec 2019 20:33:40 +0100 (CET)
Received: from localhost ([::1]:48324 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1if7jv-00022Q-MK
	for lists+qemu-devel@lfdr.de; Wed, 11 Dec 2019 14:33:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36741)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <thuth@redhat.com>) id 1if7ii-0001Kp-40
 for qemu-devel@nongnu.org; Wed, 11 Dec 2019 14:32:24 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <thuth@redhat.com>) id 1if7ig-0003Ml-2j
 for qemu-devel@nongnu.org; Wed, 11 Dec 2019 14:32:23 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:56099
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <thuth@redhat.com>) id 1if7if-0003L2-Vi
 for qemu-devel@nongnu.org; Wed, 11 Dec 2019 14:32:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576092741;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:openpgp:openpgp;
 bh=yvo8n6RCTc2X2WRj2epWJdsDbQMPsAJanlqukKi8eDw=;
 b=a0fzfFbWAjmW/fF7Ys4gK4cjKOLvZaMHuUfLiFVwlLLT9FIvG6DeebA6nCsGMnV4dwxfQX
 5E12lXFQVmp/gZxKHL7ZsigB+oLt5By3D20Lm8UJx4JSbCzPfptoSoQ3ST37wG3dN5Juqt
 Qjrn8nxma03Sp7TdDGot85SOOAY6Oa4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-56-OuwC4UVpN_Cc01hJtnT7Pw-1; Wed, 11 Dec 2019 14:32:19 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A1112100550E;
 Wed, 11 Dec 2019 19:32:18 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-116-85.ams2.redhat.com [10.36.116.85])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A54D96293B;
 Wed, 11 Dec 2019 19:32:15 +0000 (UTC)
Subject: Re: [PATCH] glib: use portable g_setenv()
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <1576074210-52834-7-git-send-email-pbonzini@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <0e1b1e96-9780-7ee0-d463-2199ce66f840@redhat.com>
Date: Wed, 11 Dec 2019 20:32:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <1576074210-52834-7-git-send-email-pbonzini@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: OuwC4UVpN_Cc01hJtnT7Pw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.120
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
Cc: qemu-trivial@nongnu.org,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/12/2019 15.23, Paolo Bonzini wrote:
> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>=20
> We have a setenv() wrapper in os-win32.c that no one is actually using.
> Drop it and change to g_setenv() uniformly.
>=20
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  include/sysemu/os-win32.h        |  2 --
>  os-win32.c                       | 22 ----------------------
>  tests/libqtest.c                 |  2 +-
>  tests/test-crypto-tlscredsx509.c |  2 +-
>  tests/test-crypto-tlssession.c   |  2 +-
>  tests/test-io-channel-tls.c      |  2 +-
>  tests/test-vmstate.c             |  2 +-
>  ui/sdl2.c                        |  2 +-
>  8 files changed, 6 insertions(+), 30 deletions(-)

Reviewed-by: Thomas Huth <thuth@redhat.com>


