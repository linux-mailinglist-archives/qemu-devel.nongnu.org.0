Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 877C110FC22
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Dec 2019 12:03:16 +0100 (CET)
Received: from localhost ([::1]:51594 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ic5xa-0005O1-H6
	for lists+qemu-devel@lfdr.de; Tue, 03 Dec 2019 06:03:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44335)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgilbert@redhat.com>) id 1ic5oi-0002bB-KS
 for qemu-devel@nongnu.org; Tue, 03 Dec 2019 05:54:05 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1ic5ob-000338-Ki
 for qemu-devel@nongnu.org; Tue, 03 Dec 2019 05:53:59 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:45495
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1ic5ob-000317-1O
 for qemu-devel@nongnu.org; Tue, 03 Dec 2019 05:53:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1575370435;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=M+XhWXtzgAHD83890r01RG1w45N1ChUn/mXqyManSr0=;
 b=ANkB/AT9nga7ouzyh+sxW/j94LeXUtLb5Ws0mpQ1AmcI+fDdIPj4PtBmW8RAhiWlqxgxZY
 SIuEiVA6o3pLu3xbvjSpplHzU6cSoG3cfJdqWZL59eOu+/0gUM4qHZlWqRA5RCdDdvgRCi
 5gLfxiea5gcp2gmbs/rXHmGfcHzjtik=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-381-UaKXs29MNLGRNhdZcXppbg-1; Tue, 03 Dec 2019 05:53:54 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 51363801E7B;
 Tue,  3 Dec 2019 10:53:53 +0000 (UTC)
Received: from work-vm (unknown [10.36.118.45])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2036060BFB;
 Tue,  3 Dec 2019 10:53:43 +0000 (UTC)
Date: Tue, 3 Dec 2019 10:53:41 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: virtiofsd: Where should it live?
Message-ID: <20191203105341.GB3078@work-vm>
References: <20191125185021.GB3767@work-vm>
 <20191126102600.GG556568@redhat.com>
 <20191126121416.GE2928@work-vm>
 <CAFEAcA9Ln2uwg4f4s8oS6VeQk83W3BErmH9cHeyDJy7v-4gNxw@mail.gmail.com>
 <87k17ekhs9.fsf@dusky.pond.sub.org>
 <fef0eaaf-149a-f8a8-02c5-821d2d42becd@redhat.com>
MIME-Version: 1.0
In-Reply-To: <fef0eaaf-149a-f8a8-02c5-821d2d42becd@redhat.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: UaKXs29MNLGRNhdZcXppbg-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 mszeredi@redhat.com, QEMU Developers <qemu-devel@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
 vgoyal@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We seem to be coming to the conclusion something that:

  a) It should live in the qemu tree
  b) It shouldn't live under contrib
  c) We'll create a new top level, i.e. 'daemons'
  d) virtiofsd will be daemons/virtiofsd

Now, somethings I'm less clear on:
  e) What else would move into daemons?  It was suggested
    that if we've got virtiofsd in there, then we should move
    libvhost-user - which I understand, but then it's not a
    'daemons'.
    Are there any otehr daemons that should move?

  f) Should virtiofsd always be built (if the deps are installed)?

Dave

--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


