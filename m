Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF551FE10F
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Nov 2019 16:20:43 +0100 (CET)
Received: from localhost ([::1]:40718 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iVdOs-0007n9-Tr
	for lists+qemu-devel@lfdr.de; Fri, 15 Nov 2019 10:20:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42197)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kchamart@redhat.com>) id 1iVdNq-0007GX-Dx
 for qemu-devel@nongnu.org; Fri, 15 Nov 2019 10:19:39 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kchamart@redhat.com>) id 1iVdNo-0004R8-VH
 for qemu-devel@nongnu.org; Fri, 15 Nov 2019 10:19:37 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:32923
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kchamart@redhat.com>) id 1iVdNo-0004Pt-LO
 for qemu-devel@nongnu.org; Fri, 15 Nov 2019 10:19:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1573831175;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=D6eB4aceYPL8WtMBk+6gy3izNmOfQiEzYmJ5VbMDoYw=;
 b=BIiiHWaA5ff75eYg0z/vXC1CjVOsCiBWpCynRtLrZuJi0ysIGWisVTFwRyr+sWO3x8Nuep
 Sqk2CRF1IC3b8nxtkZeUT5AUVyfiw1O/AmcBiXsxVenUK2VBb83rySsPjd5h9YOl4Z8RW8
 8Od8TWe7NTbCHO8e5N8tc0SJrRLA4gk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-22-5Tuhg7zbNw6Mkh_wNgsQdA-1; Fri, 15 Nov 2019 10:19:32 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C92ED130CA8
 for <qemu-devel@nongnu.org>; Fri, 15 Nov 2019 15:19:31 +0000 (UTC)
Received: from paraplu.localdomain (ovpn-117-60.ams2.redhat.com [10.36.117.60])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B4B7C10016E8;
 Fri, 15 Nov 2019 15:19:28 +0000 (UTC)
Received: by paraplu.localdomain (Postfix, from userid 1001)
 id D6A443E0483; Fri, 15 Nov 2019 16:19:26 +0100 (CET)
Date: Fri, 15 Nov 2019 16:19:26 +0100
From: Kashyap Chamarthy <kchamart@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH qemu-web] Add a blog post on "Micro-Optimizing KVM
 VM-Exits"
Message-ID: <20191115151926.GU7754@paraplu>
References: <20191108092247.16207-1-kchamart@redhat.com>
 <f8dce546-ea28-0619-a20a-62c762f99721@redhat.com>
 <20191115123754.GT7754@paraplu>
 <71a02677-7db7-0ee0-8529-ca59b6bd0ee6@redhat.com>
MIME-Version: 1.0
In-Reply-To: <71a02677-7db7-0ee0-8529-ca59b6bd0ee6@redhat.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: 5Tuhg7zbNw6Mkh_wNgsQdA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
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
Cc: aarcange@redhat.com, Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 dgilbert@redhat.com, stefanha@redhat.com, vkuznets@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Nov 15, 2019 at 01:41:01PM +0100, Paolo Bonzini wrote:
> On 15/11/19 13:37, Kashyap Chamarthy wrote:
> >> Opinions? Ideas?
> > Another _potential_ venue: Given the topic is kernel space-related, it
> > is likely to fit in with the LWN audience.  LWN itself says they
> > generally look for kernel-related articles.  Although, I'm aware that
> > there's already a few LWN articles being written on KVM Forum-based
> > talks.  (Perhaps once the "KVM Monolithic" patch series merges, this ca=
n
> > be reworked into a standalone LWN kernel article =E2=80=94 assuming LWN=
 is
> > amenable to it; need to check with LWN.)
>=20
> Yeah, perhaps later.  For now I guess qemu.org is the best.

Sure; others also seem to agree it's okay to be on qemu.org.

--=20
/kashyap


