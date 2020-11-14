Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AFD82B2C4C
	for <lists+qemu-devel@lfdr.de>; Sat, 14 Nov 2020 09:49:24 +0100 (CET)
Received: from localhost ([::1]:43954 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdrFK-0002wu-Ow
	for lists+qemu-devel@lfdr.de; Sat, 14 Nov 2020 03:49:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38504)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kdrE2-00024A-Cb
 for qemu-devel@nongnu.org; Sat, 14 Nov 2020 03:48:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:21128)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kdrDx-00045S-Cw
 for qemu-devel@nongnu.org; Sat, 14 Nov 2020 03:48:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605343674;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=X7j3+ES9llbBadPcfrLRda1Nrt7FqSunLwJTYCU+460=;
 b=Mlf2gE6yWMPDWDy+TFZsZYNDN9Lrt7m2MDTIx82gYSJX/gi1Run4O9/DNnClRmLzXHqLIO
 Y9WXGgspNVmk96rdObPh7IKB3c23LesEjUhiCb5n1dE138fP/TCZX5UPyYi1G5x1nEm3fM
 RhLOxSoWic1qIFtRiUznsqzJvw1UHtc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-444-cbYMvCtMMnCDPM_oV_cviQ-1; Sat, 14 Nov 2020 03:47:51 -0500
X-MC-Unique: cbYMvCtMMnCDPM_oV_cviQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E84E4107B46F;
 Sat, 14 Nov 2020 08:47:50 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-25.ams2.redhat.com [10.36.112.25])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 491921002C0E;
 Sat, 14 Nov 2020 08:47:49 +0000 (UTC)
Subject: Re: [PATCH 1/9] Enabling BSD symbols
To: David CARLIER <devnexen@gmail.com>
References: <CA+XhMqxuYwkJLbCRZpAM7pM14CbLzx3BZ=n6FW14cg344xsFJA@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <3a964985-cfda-a5ba-5412-f3ff31515383@redhat.com>
Date: Sat, 14 Nov 2020 09:47:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <CA+XhMqxuYwkJLbCRZpAM7pM14CbLzx3BZ=n6FW14cg344xsFJA@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/14 01:01:29
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 29/06/2020 23.48, David CARLIER wrote:
> From 5c6022f21289eb6e78e93d584c766db82165dced Mon Sep 17 00:00:00 2001
> From: David Carlier <devnexen@gmail.com>
> Date: Mon, 29 Jun 2020 22:13:35 +0000
> Subject: [PATCH 1/9] Enabling BSD symbols.
> 
> Signed-off-by: David Carlier <devnexen@gmail.com>
> ---
>  configure | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/configure b/configure
> index 4a22dcd563..d81931ba5e 100755
> --- a/configure
> +++ b/configure
> @@ -903,8 +903,8 @@ SunOS)
>  ;;
>  Haiku)
>    haiku="yes"
> -  QEMU_CFLAGS="-DB_USE_POSITIVE_POSIX_ERRORS $QEMU_CFLAGS"
> -  LIBS="-lposix_error_mapper -lnetwork $LIBS"
> +  QEMU_CFLAGS="-DB_USE_POSITIVE_POSIX_ERRORS -DBSD_SOURCE $QEMU_CFLAGS"

 Hi David!

In the version of Haiku that has recently been contributed as a VM for the
test/vm/ test suite, this is rather called _BSD_SOURCE, i.e. with an
underscore at the beginning. Has this been renamed in the course of time, or
was this a typo in your patch?

 Thomas


