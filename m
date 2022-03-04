Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 970404CDC3A
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 19:19:25 +0100 (CET)
Received: from localhost ([::1]:54584 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQCWS-0001oC-B2
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 13:19:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58042)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nQBWG-0003mf-Aj
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 12:15:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:54119)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nQBWD-0001JT-Gf
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 12:15:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646414103;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oeUqfr4B1bOtX7SnvJvEmo6FkdeOrle1po4z2uRi/DY=;
 b=bkFfXUxl6/IZYhEsAzBc+IIB8cLzZz925f0FCiI6bzE+xfU5ld+FKJjyfkiG4/W5KaVMz1
 jYPPEo09Yt+EB1jCABpuTKjn0Gy+CNc3PUkA5dI6AzkrjOXkd7UTh36f27oPkGHWk6ySWM
 lS0Ddv0Cj8CIVG6s/US4N58P04Yp3v4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-199-suhFMQq3PuC-15uhe2PYxw-1; Fri, 04 Mar 2022 12:15:00 -0500
X-MC-Unique: suhFMQq3PuC-15uhe2PYxw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B0E5E1006AA6;
 Fri,  4 Mar 2022 17:14:59 +0000 (UTC)
Received: from redhat.com (unknown [10.2.16.226])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BC8CE7F0DF;
 Fri,  4 Mar 2022 17:14:50 +0000 (UTC)
Date: Fri, 4 Mar 2022 11:14:48 -0600
From: Eric Blake <eblake@redhat.com>
To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Subject: Re: [PATCH 1/4] softmmu: remove deprecated --enable-fips option
Message-ID: <20220304171448.jv6mp4drsmgxqicv@redhat.com>
References: <20220304115657.3177925-1-berrange@redhat.com>
 <20220304115657.3177925-2-berrange@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220304115657.3177925-2-berrange@redhat.com>
User-Agent: NeoMutt/20211029-378-f757a4
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Kevin Wolf <kwolf@redhat.com>, libvir-list@redhat.com,
 Stefan Weil <sw@weilnetz.de>, qemu-devel@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Mar 04, 2022 at 11:56:54AM +0000, Daniel P. Berrangé wrote:
> Users requiring FIPS support must build QEMU with either the libgcrypt
> or gnutls libraries for as the crytography backend.

s/for //

> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>  docs/about/deprecated.rst       | 12 ------------
>  docs/about/removed-features.rst | 11 +++++++++++
>  include/qemu/osdep.h            |  3 ---
>  os-posix.c                      |  8 --------
>  qemu-options.hx                 | 10 ----------
>  ui/vnc.c                        |  7 -------
>  util/osdep.c                    | 28 ----------------------------
>  7 files changed, 11 insertions(+), 68 deletions(-)

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


