Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50BB56330B
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Jul 2019 10:49:04 +0200 (CEST)
Received: from localhost ([::1]:47886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hklo7-0004Dx-Hu
	for lists+qemu-devel@lfdr.de; Tue, 09 Jul 2019 04:49:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35736)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <sgarzare@redhat.com>) id 1hkln9-0003ew-R0
 for qemu-devel@nongnu.org; Tue, 09 Jul 2019 04:48:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <sgarzare@redhat.com>) id 1hkln4-0005KR-7h
 for qemu-devel@nongnu.org; Tue, 09 Jul 2019 04:48:03 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:36460)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <sgarzare@redhat.com>) id 1hkln4-0005Ej-0p
 for qemu-devel@nongnu.org; Tue, 09 Jul 2019 04:47:58 -0400
Received: by mail-wm1-f65.google.com with SMTP id g67so2301642wme.1
 for <qemu-devel@nongnu.org>; Tue, 09 Jul 2019 01:47:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=h68BLrIpyAASaOncqPQjEEnTJbFxmymd6x/i3q39ZoE=;
 b=IdxB6Hgu8RExMV//N/1Mh4jXMb0rbpvZT+2lgpdUbiZkNobyKNMEdq0A4Q8OanrjJ1
 sXqlQl2t0TPLctQroSBXqKYI16wo/VDcC7z6PKi/Cq4De8ztF3T8im0RFTF8IsxZrtgA
 yxnQxEuFLIuKBRW/U3YwBqdDeyADRN31JmZxMYS6ajkw7xff/QBAEa6OeIoxBywdWHGf
 pAtKZTzOKoyhbpcEbMpWXutomzLEraWlfz3aNH722ErO3QD2sEm7nS3WLzy7RIg812ae
 jr6Xb9yqGeMaYbJndXjmU/gVJG9tiTKeNwJjZGcfxcczB6b8ZAXfdWxm5JGCa357ERwG
 fXUw==
X-Gm-Message-State: APjAAAWFqLyn17/velR86qUPYArhQeoJHww/17YnyAUPEjSBPVW6pvMg
 XzJHdOIbRLuFa1W/2Ndv/Ba4IA==
X-Google-Smtp-Source: APXvYqwPTcTJ+Ne9KZcXM6UlKDRU4t8mOMKE4/Ma6cQp/aaam93fqv/vjbAID9cxyYbTosqkMYKy7Q==
X-Received: by 2002:a05:600c:206:: with SMTP id
 6mr19807431wmi.91.1562662068658; 
 Tue, 09 Jul 2019 01:47:48 -0700 (PDT)
Received: from steredhat (host122-201-dynamic.13-79-r.retail.telecomitalia.it.
 [79.13.201.122])
 by smtp.gmail.com with ESMTPSA id w23sm2475241wmi.45.2019.07.09.01.47.47
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 09 Jul 2019 01:47:48 -0700 (PDT)
Date: Tue, 9 Jul 2019 10:47:45 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>
Message-ID: <20190709084745.yly57xxtwktasfjv@steredhat>
References: <20190708204909.10891-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190708204909.10891-1-marcandre.lureau@redhat.com>
User-Agent: NeoMutt/20180716
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.128.65
Subject: Re: [Qemu-devel] [PATCH] misc: fix naming scheme of compatiblity
 arrays
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
Cc: peter.maydell@linaro.org, Eduardo Habkost <ehabkost@redhat.com>,
 Juan Quintela <quintela@redhat.com>, qemu-trivial@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jul 09, 2019 at 12:49:09AM +0400, Marc-André Lureau wrote:
> Since merge 31ed41889e6e13699871040fe089a2884dca46cb ("Merge
> remote-tracking branch
> 'remotes/elmarco/tags/machine-props-pull-request' into staging"), the
> compat arrays are in lowercase.
> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
>  docs/devel/migration.rst | 2 +-
>  hw/i386/pc_piix.c        | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>

