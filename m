Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 314EA11FFAB
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Dec 2019 09:28:16 +0100 (CET)
Received: from localhost ([::1]:48556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iglji-0003lL-OG
	for lists+qemu-devel@lfdr.de; Mon, 16 Dec 2019 03:28:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39751)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <thuth@redhat.com>) id 1igliy-0003Ea-A5
 for qemu-devel@nongnu.org; Mon, 16 Dec 2019 03:27:29 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <thuth@redhat.com>) id 1igliv-0006qm-KS
 for qemu-devel@nongnu.org; Mon, 16 Dec 2019 03:27:26 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:56052
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <thuth@redhat.com>) id 1igliv-0006q8-74
 for qemu-devel@nongnu.org; Mon, 16 Dec 2019 03:27:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576484844;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:openpgp:openpgp;
 bh=7TgsHHnQOdZdWreCKxFtkRY4b+D60YI+/bW28wyfBks=;
 b=KZqduc0F76LUA+D9NRdkUCNw0/Au9iEION5pAG5oZBX+8HvBDoHFZCjhc8Ku/lT2pTUvk6
 B0R2HI3iuFTPGWxRQ/hKt1RqEK4QcFSMUbCbhjQw6n4eXojxJCHgF9HOKpWwVkRlMfecPY
 ON37eAo3ZGyqp2HWM9yFvLGzHoGEjfc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-334-sLoJet4YNDmCXWJ9p5OOeQ-1; Mon, 16 Dec 2019 03:27:22 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 34838DB24;
 Mon, 16 Dec 2019 08:27:21 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-117-164.ams2.redhat.com [10.36.117.164])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 514A61001938;
 Mon, 16 Dec 2019 08:27:15 +0000 (UTC)
Subject: Re: [PATCH] ppc: remove excessive logging
To: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>,
 "balaton@eik.bme.hu" <balaton@eik.bme.hu>,
 "philmd@redhat.com" <philmd@redhat.com>
References: <20191214121347.17071-1-joakim.tjernlund@infinera.com>
 <4a608af2-62a2-3ffb-0c02-8e0ca699d586@redhat.com>
 <alpine.BSF.2.21.99999.352.1912151147300.3618@zero.eik.bme.hu>
 <d975fe075db9db4266437e1575987fe0f2d82ca4.camel@infinera.com>
From: Thomas Huth <thuth@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <ec67a070-77e2-08dc-9cc5-05907bbcbe79@redhat.com>
Date: Mon, 16 Dec 2019 09:27:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <d975fe075db9db4266437e1575987fe0f2d82ca4.camel@infinera.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: sLoJet4YNDmCXWJ9p5OOeQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
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
Cc: "qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "david@gibson.dropbear.id.au" <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 15/12/2019 22.15, Joakim Tjernlund wrote:
[...]
>> LOG_EXCP() is not enabled by default, you have to edit source to enable it
> 
> LOG_EXCP is enabled on Gentoo, what about other distros?

I don't think that this is enabled by any other distro. Why is this
enabled on Gentoo at all? It really should not be enabled in builds that
are supposed to be used by normal users. Have you tried to contact the
package maintainers of the QEMU Gentoo package and asked them to disable
it there again?

 Thomas


