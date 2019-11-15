Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 944E8FDE1F
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Nov 2019 13:43:29 +0100 (CET)
Received: from localhost ([::1]:38428 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iVawi-0000f7-M1
	for lists+qemu-devel@lfdr.de; Fri, 15 Nov 2019 07:43:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45854)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kchamart@redhat.com>) id 1iVarU-0005NL-LF
 for qemu-devel@nongnu.org; Fri, 15 Nov 2019 07:38:05 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kchamart@redhat.com>) id 1iVarT-0005Xt-2N
 for qemu-devel@nongnu.org; Fri, 15 Nov 2019 07:38:04 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:59021
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kchamart@redhat.com>) id 1iVarS-0005Xl-Ue
 for qemu-devel@nongnu.org; Fri, 15 Nov 2019 07:38:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1573821482;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=J+xU9O4D07OeJvTB/MKHLjjaJFT36XHcOvUi/1drsBw=;
 b=hq47ISKZR2gp2VLTH0cKf5tIcQY6x+F9YPle/Zy3PCaGngvivQ0LpTbONkQUJ4OQEbnXJe
 58CY2r/UNwE3/pKTPvd+6Y5TJNXJv27n2O0bXCAepCjRX6yMW26aRlLZKsVtb9N7eaEjdk
 z7OuqDqM8j/cmIj+nmENNENUYr6nmZs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-206-f_rXev5sOn28nS7kUfiEDg-1; Fri, 15 Nov 2019 07:38:00 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B38CD18B9FC1
 for <qemu-devel@nongnu.org>; Fri, 15 Nov 2019 12:37:59 +0000 (UTC)
Received: from paraplu.localdomain (unknown [10.36.117.0])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6520C60C18;
 Fri, 15 Nov 2019 12:37:56 +0000 (UTC)
Received: by paraplu.localdomain (Postfix, from userid 1001)
 id D4C3B3E0483; Fri, 15 Nov 2019 13:37:54 +0100 (CET)
Date: Fri, 15 Nov 2019 13:37:54 +0100
From: Kashyap Chamarthy <kchamart@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH qemu-web] Add a blog post on "Micro-Optimizing KVM
 VM-Exits"
Message-ID: <20191115123754.GT7754@paraplu>
References: <20191108092247.16207-1-kchamart@redhat.com>
 <f8dce546-ea28-0619-a20a-62c762f99721@redhat.com>
MIME-Version: 1.0
In-Reply-To: <f8dce546-ea28-0619-a20a-62c762f99721@redhat.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: f_rXev5sOn28nS7kUfiEDg-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
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
Cc: aarcange@redhat.com, qemu-devel@nongnu.org, dgilbert@redhat.com,
 stefanha@redhat.com, pbonzini@redhat.com, vkuznets@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Nov 15, 2019 at 01:08:53PM +0100, Thomas Huth wrote:
> On 08/11/2019 10.22, Kashyap Chamarthy wrote:
> > This blog post summarizes the talk "Micro-Optimizing KVM VM-Exits"[1],
> > given by Andrea Arcangeli at the recently concluded KVM Forum 2019.
> >=20
>=20
>  Hi Kashyap,
>=20
> first thanks for writing up this article! It's a really nice summary of
> the presentation, I think.

Hi Thomas,

Thanks!

> But before we include it, let me ask a meta-question: Is an article
> about the KVM *kernel* code suitable for the *QEMU* blog?=20

I had the same thought, and expressed it to Stefan as such, when he
suggested qemu.org :-).  I too found it odd to have a kernel-heavy
article on qemu.org.

> Or is there
> maybe a better place for this, like an article on www.linux-kvm.org ?

I thought about it; but I've never seen anyone write an "article" there;
as it's a WikiSpace.  And, like Paolo, I couldn't think of a better
place either. =20

FWIW, the qemu.org blog is indexed by a few blog "planet" aggregators;
and linux-kvm.org is largely a static site that is occasionally updated
by people if they happened to notice something (especially if it's
egregiously wrong).

> Opinions? Ideas?

Another _potential_ venue: Given the topic is kernel space-related, it
is likely to fit in with the LWN audience.  LWN itself says they
generally look for kernel-related articles.  Although, I'm aware that
there's already a few LWN articles being written on KVM Forum-based
talks.  (Perhaps once the "KVM Monolithic" patch series merges, this can
be reworked into a standalone LWN kernel article =E2=80=94 assuming LWN is
amenable to it; need to check with LWN.)

[...]

--=20
/kashyap


