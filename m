Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 332752528B8
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Aug 2020 09:57:05 +0200 (CEST)
Received: from localhost ([::1]:36650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kAqIq-0004SY-Am
	for lists+qemu-devel@lfdr.de; Wed, 26 Aug 2020 03:57:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56604)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kAqI9-0003q7-UO
 for qemu-devel@nongnu.org; Wed, 26 Aug 2020 03:56:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:32952)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kAqI8-0003Py-86
 for qemu-devel@nongnu.org; Wed, 26 Aug 2020 03:56:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598428579;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=DO1AwVIopD8FA7wu3biFZ5SqxyKf6YLqpALSW9wBjNo=;
 b=BTIY5g7nz+5fizKOBGOxrjPrAw/F5m5BPAzMFpEOJhaCpbHqhbs7KgTkGxLp0Vn8WSBYCQ
 V9FX/MsVwWy+M5XctSndb4kikLsxvHLIcMfx01j2gxESac3VgPODo3aYjiNqUzprdgva/l
 4UuH3laGu4IIKcEFcTodKjZ+FNrckYo=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-256-cgdfHdUDPAa4qGzpQybX-g-1; Wed, 26 Aug 2020 03:56:17 -0400
X-MC-Unique: cgdfHdUDPAa4qGzpQybX-g-1
Received: by mail-ej1-f71.google.com with SMTP id o18so578795ejr.14
 for <qemu-devel@nongnu.org>; Wed, 26 Aug 2020 00:56:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DO1AwVIopD8FA7wu3biFZ5SqxyKf6YLqpALSW9wBjNo=;
 b=V0WeRrs6F972imp9ha+NJKlk+UP45cZYr+OMiubIyjKMzPOZnvAkGyZKKYjnnq9vFb
 3GofwpdvNGqtIqetIVIIxAKB6wv4KSkmKD907oQi1CJPW66AKqOouMBcigi+ffF5c+pp
 pN9GAWFihZuSqPji2LUVbOB7TYh7OPXW9cMVSZPYU/gelVZlHwnw3wMT0QRCgF5U51Og
 5gd0Ef/TJkcghEAJsD/4sBZN3bMcn/95C45qFBQixzBpwtV0LFcQOn0a/1sZxSybEsty
 CEvSwN7wbnXbL8/ArVx2r0sVLv0jcY0f4IeEg//BHzsydOW3zhWc62OrFP9lOSeoXdUF
 uj+Q==
X-Gm-Message-State: AOAM5315sl2HJH5vU7ISQkALW9m2iSzHvTcdmLCNYt236Xjh1sP0KuYY
 VP/CFvVZsx1jYkDlNtvod+mLKMoOoyRCIwPmxrzGcTyqHDHuT2gIX71wLbaejxEQbO2eddPDtLD
 Xch5ns1o4pD8LloFTPX20BRAY6onAy7g=
X-Received: by 2002:a17:906:d9db:: with SMTP id
 qk27mr13660934ejb.230.1598428575872; 
 Wed, 26 Aug 2020 00:56:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwcSezMeBRiHxeztZut25hcGpbTWFSZmA485ouX3NXUFIYYCV5TMfk8sN++QJo65/0U4rdn4vq3Fc/9B7sqk/M=
X-Received: by 2002:a17:906:d9db:: with SMTP id
 qk27mr13660930ejb.230.1598428575690; 
 Wed, 26 Aug 2020 00:56:15 -0700 (PDT)
MIME-Version: 1.0
References: <20200825222310.27176-1-mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20200825222310.27176-1-mark.cave-ayland@ilande.co.uk>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Wed, 26 Aug 2020 09:56:04 +0200
Message-ID: <CABgObfa=qLwBVbusZ1G=xZcPAnsT4HK0DzEqho=vMyaB1yCuUA@mail.gmail.com>
Subject: Re: [PATCH] meson: don't require CONFIG_VTE for the GTK UI
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/26 02:45:17
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.958,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: qemu-devel <qemu-devel@nongnu.org>, "Hoffmann, Gerd" <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Queued, thanks.

Paolo

On Wed, Aug 26, 2020 at 12:23 AM Mark Cave-Ayland
<mark.cave-ayland@ilande.co.uk> wrote:
>
> Prevously CONFIG_VTE was not required to build QEMU with GTK UI support as not
> all platforms have VTE available (in particular Windows).
>
> Remove this requirement from the meson build system to enable QEMU to be built
> with GTK UI support for Windows once again.
>
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>  ui/meson.build | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/ui/meson.build b/ui/meson.build
> index 018c5698bf..a81d5c259c 100644
> --- a/ui/meson.build
> +++ b/ui/meson.build
> @@ -42,7 +42,7 @@ if config_host.has_key('CONFIG_CURSES')
>    ui_modules += {'curses' : curses_ss}
>  endif
>
> -if config_host.has_key('CONFIG_GTK') and config_host.has_key('CONFIG_VTE')
> +if config_host.has_key('CONFIG_GTK')
>    softmmu_ss.add(when: 'CONFIG_WIN32', if_true: files('win32-kbd-hook.c'))
>
>    gtk_ss = ss.source_set()
> --
> 2.20.1
>


