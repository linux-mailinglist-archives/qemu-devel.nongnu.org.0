Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 18C2410EE12
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Dec 2019 18:19:47 +0100 (CET)
Received: from localhost ([::1]:40662 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ibpMP-0005sk-Un
	for lists+qemu-devel@lfdr.de; Mon, 02 Dec 2019 12:19:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43299)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dinechin@redhat.com>) id 1ibpJU-0004hQ-Tm
 for qemu-devel@nongnu.org; Mon, 02 Dec 2019 12:16:48 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dinechin@redhat.com>) id 1ibpJQ-0000xR-Tw
 for qemu-devel@nongnu.org; Mon, 02 Dec 2019 12:16:43 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:46702
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dinechin@redhat.com>) id 1ibpJP-0000Zu-K6
 for qemu-devel@nongnu.org; Mon, 02 Dec 2019 12:16:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1575306980;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=L12ECLkdm91LCX9QCzp4XoaCF03EEhf5AqaJSgB45zE=;
 b=LiVPHB0vFYMSZvvTdWGeusUVjYz13owkUeqXERESsKhmwkdVkR34SxWMIcuKCRhOXxQ6AQ
 6Yca/cLqIDAec7hqUEsTIzxaooSNzpgO99oOjTsjZcJPbOLoGLny03qf37O8yrjUKQ+DCu
 ePedraoGGF4rO02YKdRLo63qFt4ebBA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-384-KHhaXdNuP_KmXy8xcgl3_g-1; Mon, 02 Dec 2019 12:16:17 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 36484477
 for <qemu-devel@nongnu.org>; Mon,  2 Dec 2019 17:16:16 +0000 (UTC)
Received: from ptitpuce (ovpn-116-85.ams2.redhat.com [10.36.116.85])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C41415D9E5;
 Mon,  2 Dec 2019 17:16:08 +0000 (UTC)
References: <20191125185021.GB3767@work-vm>
User-agent: mu4e 1.3.5; emacs 26.2
From: Christophe de Dinechin <dinechin@redhat.com>
To: qemu-devel@nongnu.org
Subject: Re: virtiofsd: Where should it live?
In-reply-to: <20191125185021.GB3767@work-vm>
Message-ID: <m1d0d6veb1.fsf@redhat.com>
Date: Mon, 02 Dec 2019 18:16:02 +0100
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: KHhaXdNuP_KmXy8xcgl3_g-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
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
Cc: mszeredi@redhat.com, berrange@redhat.com, stefanha@redhat.com,
 vgoyal@redhat.com, marcandre.lureau@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Dr. David Alan Gilbert writes:

> Hi,
>   There's been quite a bit of discussion about where virtiofsd, our
> implemenation of a virtiofs daemon, should live.  I'd like to get
> this settled now, because I'd like to tidy it up for the next
> qemu cycle.
>
> For reference it's based on qemu's livhost-user+chunks of libfuse.
> It can't live in libfuse because we change enough of the library
> to break their ABI.  It's C, and we've got ~100 patches - which
> we can split into about 3 chunks.
>
> Some suggestions so far:
>   a) In contrib
>      This is my current working assumption; the main objection is it's
>      a bit big and pulls in a chunk of libfuse.
>
>   b) In a submodule
>
>   c) Just separate

In so far as there is much discussion of "multi-process qemu", I wonder
if it would not be time to create a "processes" subdirectory, and have
virtiofsd be the first entry there. Thomas Huth suggested "tools", but I
tend to read "tools" as things that are used during the build process.


>
> Your suggestions/ideas please.  My preference is (a).
>
> Dave


--
Cheers,
Christophe de Dinechin (IRC c3d)


