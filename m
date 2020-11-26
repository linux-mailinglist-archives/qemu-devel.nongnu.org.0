Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CE002C53F2
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Nov 2020 13:27:01 +0100 (CET)
Received: from localhost ([::1]:46306 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kiGMW-00077c-1c
	for lists+qemu-devel@lfdr.de; Thu, 26 Nov 2020 07:27:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50612)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kiG93-00052m-Rb
 for qemu-devel@nongnu.org; Thu, 26 Nov 2020 07:13:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:21450)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kiG8w-00040F-3K
 for qemu-devel@nongnu.org; Thu, 26 Nov 2020 07:13:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606392777;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Oz7sPqWTnYeFwXJuGLA/AOlhhEjOYCnYlwyc7+gzVTA=;
 b=bG3J2RuwVFxmTh9tIQnAjhqYUFpcAJPzuc/ozW9as3NjXx3JBB+7LPRgKDsQrhe9Z4TIp7
 MaEKur+O0VL1RXGISvrQjtwu+LF87YNTic0bnbTikymRGKliJ0krvmZ/DgRSFgCqAm26ZE
 xa3+cAB85eFfZATrfLIrCr7ck0AKCiA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-36-reUfkIHoPbuJiPRILaQ42Q-1; Thu, 26 Nov 2020 07:12:53 -0500
X-MC-Unique: reUfkIHoPbuJiPRILaQ42Q-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2F316804759;
 Thu, 26 Nov 2020 12:12:52 +0000 (UTC)
Received: from redhat.com (ovpn-115-34.ams2.redhat.com [10.36.115.34])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1ADB0100164C;
 Thu, 26 Nov 2020 12:12:46 +0000 (UTC)
Date: Thu, 26 Nov 2020 12:12:43 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH v2 05/13] qemu-plugin.h: remove GCC < 4
Message-ID: <20201126121243.GF1122957@redhat.com>
References: <20201126112915.525285-1-marcandre.lureau@redhat.com>
 <20201126112915.525285-6-marcandre.lureau@redhat.com>
 <CAFEAcA9+hV2L9qjCj8naNX1GuPgGenE2CLBuKR+LHa415jrmRw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9+hV2L9qjCj8naNX1GuPgGenE2CLBuKR+LHa415jrmRw@mail.gmail.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Nov 26, 2020 at 11:57:14AM +0000, Peter Maydell wrote:
> On Thu, 26 Nov 2020 at 11:30, <marcandre.lureau@redhat.com> wrote:
> >
> > From: Marc-André Lureau <marcandre.lureau@redhat.com>
> >
> > Since commit efc6c07 ("configure: Add a test for the minimum compiler
> > version"), QEMU explicitely depends on GCC >= 4.8.
> >
> > (clang >= 3.8 advertizes itself as GCC >= 4.2 compatible)
> >
> > Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> > ---
> >  include/qemu/qemu-plugin.h | 9 ++-------
> >  1 file changed, 2 insertions(+), 7 deletions(-)
> 
> This is an interesting case, because it's a header intended
> for external use (people compiling plugins), not part of
> QEMU proper. I don't know whether we want to impose the
> same clang/gcc requirements on plugin builders, though it's
> probably not a bad idea to do so. Alex ?

IIUC, we expect that the plugins are built specifically to go with
the QEMU you have built. With that in mind, it looks reasonable to
assume the same compiler toolchain versions for both.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


