Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 323C5332F12
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 20:35:32 +0100 (CET)
Received: from localhost ([::1]:54356 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJi8h-00017o-6J
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 14:35:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lJfyS-0007y1-B9
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 12:16:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33627)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lJfyM-0003B8-N8
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 12:16:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615310200;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=081mHxXEB2/kEWumPR3pxhQ/etdM6BrrtA+i5TkxjX0=;
 b=SbIJ0ydywUaAZHEZyk9FaHzELUH5GdCTAVeSDK/fcd4j32M61UASWyJAjvhMHgUxQHEe+U
 yJTdG0rfD8mN8qzJ4Cxg24YW7CLIZOYefvLEaAOHR69AxogqNEsLOzz3FRkHpz9j0W/cwO
 QbgRz6zf9LgXXdDXpEtoP1jqyiTZcIc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-83-aKGELpffOhG4HQ9jRMA_bg-1; Tue, 09 Mar 2021 12:16:36 -0500
X-MC-Unique: aKGELpffOhG4HQ9jRMA_bg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 45ADC83DD36;
 Tue,  9 Mar 2021 17:16:35 +0000 (UTC)
Received: from redhat.com (ovpn-114-154.ams2.redhat.com [10.36.114.154])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1CA771F473;
 Tue,  9 Mar 2021 17:16:32 +0000 (UTC)
Date: Tue, 9 Mar 2021 17:16:29 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH v2] usb: Un-deprecate -usbdevice (except for -usbdevice
 audio which gets removed)
Message-ID: <YEetbR063NjfBPSV@redhat.com>
References: <20210309165035.967853-1-thuth@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210309165035.967853-1-thuth@redhat.com>
User-Agent: Mutt/2.0.5 (2021-01-21)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Mar 09, 2021 at 05:50:35PM +0100, Thomas Huth wrote:
> When trying to remove the -usbdevice option, there were complaints that
> "-usbdevice braille" is still a very useful shortcut for some people.
> Thus we never remove this option. Since it's not such a big burden to
> keep it around, and it's also convenient in the sense that you don't
> have to worry to enable a host controller explicitly with this option,
> we should remove it from he deprecation list again, and rather properly
> document the possible device for this option instead.
> 
> However, there is one exception: "-usbdevice audio" should go away, since
> audio devices without "audiodev=..." parameter are also on the deprecation
> list and you cannot use "-usbdevice audio" with "audiodev".
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  v2: Add an entry to removed-features.rst
> 
>  docs/system/deprecated.rst       |  9 --------
>  docs/system/removed-features.rst |  8 +++++++
>  hw/usb/dev-audio.c               |  1 -
>  qemu-options.hx                  | 38 +++++++++++++++++++++++++++-----
>  softmmu/vl.c                     |  2 --
>  5 files changed, 40 insertions(+), 18 deletions(-)

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


