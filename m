Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA2F11B4B06
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Apr 2020 18:55:41 +0200 (CEST)
Received: from localhost ([::1]:54398 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jRIey-00032h-Qg
	for lists+qemu-devel@lfdr.de; Wed, 22 Apr 2020 12:55:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52560)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <lersek@redhat.com>) id 1jRIdc-00020l-PP
 for qemu-devel@nongnu.org; Wed, 22 Apr 2020 12:54:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <lersek@redhat.com>) id 1jRIdc-0006NC-Bx
 for qemu-devel@nongnu.org; Wed, 22 Apr 2020 12:54:16 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:49801
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1jRIdb-0006N0-Uf
 for qemu-devel@nongnu.org; Wed, 22 Apr 2020 12:54:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587574455;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sTFS94XdqCwJvZEK/yIgEwtasKpQy2QsYtcDF9WqGFc=;
 b=DuAxqyMAmnoRET5aoOdTp/zKTuejY3/RtwHNGrrUMl7v9a7qSFwUkyiamyINYg5ExXJl4X
 oveg5+a8Op1zU4W4zEZKBJIShWTfzr+LhTB/nDgqW1HWsP1aWCEv6SgIPv3pWSqZzDWC7g
 6MQ6XpYkv9NexmX90iQLrZfRrFiyJ84=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-421-mfymiQtbOPan_EgXiXoEAw-1; Wed, 22 Apr 2020 12:54:13 -0400
X-MC-Unique: mfymiQtbOPan_EgXiXoEAw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7E6801137843;
 Wed, 22 Apr 2020 16:54:12 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-113-154.ams2.redhat.com
 [10.36.113.154])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 09947600DB;
 Wed, 22 Apr 2020 16:54:05 +0000 (UTC)
Subject: Re: [PATCH 5/5] ramfb: drop leftover debug message
To: Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org
References: <20200422100211.30614-1-kraxel@redhat.com>
 <20200422100211.30614-6-kraxel@redhat.com>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <43384ca2-5c06-3995-ff6d-48a632c4319f@redhat.com>
Date: Wed, 22 Apr 2020 18:54:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20200422100211.30614-6-kraxel@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=lersek@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/04/22 02:12:04
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>, hqm03ster@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 04/22/20 12:02, Gerd Hoffmann wrote:
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> ---
>  hw/display/ramfb.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/hw/display/ramfb.c b/hw/display/ramfb.c
> index d1b1cb9bb294..be884c9ea837 100644
> --- a/hw/display/ramfb.c
> +++ b/hw/display/ramfb.c
> @@ -88,8 +88,6 @@ static void ramfb_fw_cfg_write(void *dev, off_t offset, size_t len)
>      addr   = be64_to_cpu(s->cfg.addr);
>      format = qemu_drm_format_to_pixman(fourcc);
>  
> -    fprintf(stderr, "%s: %dx%d @ 0x%" PRIx64 "\n", __func__,
> -            s->width, s->height, addr);
>      surface = ramfb_create_display_surface(width, height,
>                                             format, stride, addr);
>      if (!surface)
> 

Reviewed-by: Laszlo Ersek <lersek@redhat.com>


