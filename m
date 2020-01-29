Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1426914CBAC
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Jan 2020 14:47:58 +0100 (CET)
Received: from localhost ([::1]:46758 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iwnhF-0002Ma-66
	for lists+qemu-devel@lfdr.de; Wed, 29 Jan 2020 08:47:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33784)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <thuth@redhat.com>) id 1iwngW-0001uU-EV
 for qemu-devel@nongnu.org; Wed, 29 Jan 2020 08:47:13 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <thuth@redhat.com>) id 1iwngU-0001Ir-V8
 for qemu-devel@nongnu.org; Wed, 29 Jan 2020 08:47:11 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:33515
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <thuth@redhat.com>) id 1iwngU-0001Hs-Ro
 for qemu-devel@nongnu.org; Wed, 29 Jan 2020 08:47:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580305629;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:openpgp:openpgp;
 bh=QoNmuR8rS1RBuyQpIFLh80hUnXpIwcjTLltc9pG/1vc=;
 b=NtVo5HwBBJ4wcastDGWdRGtTXRxsOTNm8bpo1RyLWjzbse3u5h06I0Gaj2VeBP0++LdnY0
 KKHUJMjOBTsPKBqP1xt69LrKsvoxTgTx9ssXeGK1dBr+xMvkUTMKMzM5gmSJicqGkBlgnf
 yNbVlfP6rLJX/urNfvXCp1Re/FDBnFs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-57-3zrNf25mN6y9hYPUJKNQgw-1; Wed, 29 Jan 2020 08:47:07 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C7E1F1005510
 for <qemu-devel@nongnu.org>; Wed, 29 Jan 2020 13:47:06 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-116-210.ams2.redhat.com [10.36.116.210])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 95F065C54A;
 Wed, 29 Jan 2020 13:47:03 +0000 (UTC)
Subject: Re: [PATCH 001/142] minikconf: accept alnum identifiers
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>
References: <20200128175342.9066-1-pbonzini@redhat.com>
 <20200128175342.9066-2-pbonzini@redhat.com>
 <81393799-e936-d5dc-1681-4317bfae510e@redhat.com>
 <CAMxuvayx55=JaVCgtZew70jeoRSzpzuLDSe2sth91yiLb_kAXA@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <f076136b-d118-b502-25fb-d72cbd194833@redhat.com>
Date: Wed, 29 Jan 2020 14:47:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CAMxuvayx55=JaVCgtZew70jeoRSzpzuLDSe2sth91yiLb_kAXA@mail.gmail.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: 3zrNf25mN6y9hYPUJKNQgw-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 29/01/2020 14.41, Marc-Andr=C3=A9 Lureau wrote:
> Hi
>=20
> On Wed, Jan 29, 2020 at 1:09 PM Thomas Huth <thuth@redhat.com> wrote:
>>
>>
>> -EMISSINGPATCHDESCRIPTION
>>
>> Why is this required? Bug fix? New feature? ... please add some words he=
re.
>=20
> This is required for later patch "meson: convert hw/9pfs", which adds
> config 9PFS.
>=20
> You are right, several patches could use some comments. It's still
> PoC. Otoh, a lot of them are quite mechanical or just what they are in
> meson, there isn't much to say about it. We'll have to improve this
> somehow.

Sure, but with a proper patch description, this patch here could even be
merged today already, shrinking this huge patch series by one at least...

 Thomas


