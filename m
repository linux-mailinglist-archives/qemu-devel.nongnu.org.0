Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CEEC4DC24E
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Mar 2022 10:07:02 +0100 (CET)
Received: from localhost ([::1]:52480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUm60-0005iH-RW
	for lists+qemu-devel@lfdr.de; Thu, 17 Mar 2022 05:07:00 -0400
Received: from eggs.gnu.org ([209.51.188.92]:34856)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1nUm3R-0004iS-4r
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 05:04:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:28580)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1nUm3L-0003BE-QA
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 05:04:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647507854;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1t81Is6VE3fukKKM8vOUvsQa9uoyfcfbMpcx4cqrSKY=;
 b=MjO2PnYB5kDqv+7s+xNIYHdggOkf0oO+uVJCdxbvc76VmJz6+9ySjMVY/q/twTMUmox4lC
 ETp4j3mndU0t8f76YSkObLadkV50D+LWfDXSSN7k6xSjBrF7t2lFsLk7aDdICeLI2pTRaR
 WJ5AYxbJyYs5gHB2cxJQXbzZXWftDEM=
Received: from mail-yb1-f197.google.com (mail-yb1-f197.google.com
 [209.85.219.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-161-R2qK-qjJMqGFcZhetkqClQ-1; Thu, 17 Mar 2022 05:04:10 -0400
X-MC-Unique: R2qK-qjJMqGFcZhetkqClQ-1
Received: by mail-yb1-f197.google.com with SMTP id
 a3-20020a5b0ac3000000b006288f395b25so3984176ybr.18
 for <qemu-devel@nongnu.org>; Thu, 17 Mar 2022 02:04:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=1t81Is6VE3fukKKM8vOUvsQa9uoyfcfbMpcx4cqrSKY=;
 b=GPWOiNOx2g76QqP5Na+KNTkjLjyZX6pPeRpql43UsJ01n1e+rvcZHo4Rbn/gW5eLQ7
 LRSCG2i+Gh9NQfqy9+WYsbmPFsnpnPykmYfD31wAAPFhVgWMzS6S3dlSNuzLbCKGML+S
 X1dQ18eobqhFlYClMYtMBGBQI5BUFAlXAbG9midcVo4pVrYcJEiR8rqSq31Fl8pXXyTy
 9mdtU+Yo0+3a13Uyic6Er/ft8dBzpK93U5DE+NzOpCivHPDZlmESsYJKzmn6NiYeGAbS
 g2KsLT9O1HpicRUqxgn/aRpkal2UCj59RsaFw5oNAyq3in+Srue8Zi+pPsHq7LO0Xlfp
 cAoA==
X-Gm-Message-State: AOAM533uLmYiDYAJIxma/MWlr3ZWDLVSd/YSgTEN7owp3LVW61lO25Rt
 hs3D9K6ADBzQNzOvwm8h9qhjHBNF1XEXDYtFrk/SD0CWIRjBr5FimZCs3xSzmNLXIr6Tspun9ac
 3TO3T3c4VuUXW/2eZDY0hhbxCwh+/zQ0=
X-Received: by 2002:a81:53c2:0:b0:2dc:3600:7db3 with SMTP id
 h185-20020a8153c2000000b002dc36007db3mr4344859ywb.23.1647507850241; 
 Thu, 17 Mar 2022 02:04:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyxIBhAOqizUL797Crga9so65xc7fiy1rmHYFyLUgQn6BELyLFZkchzOwIPQj1E8lZYyF9D0xuMFp3VSqsv8nU=
X-Received: by 2002:a81:53c2:0:b0:2dc:3600:7db3 with SMTP id
 h185-20020a8153c2000000b002dc36007db3mr4344846ywb.23.1647507850047; Thu, 17
 Mar 2022 02:04:10 -0700 (PDT)
MIME-Version: 1.0
References: <20220316095226.2613545-1-marcandre.lureau@redhat.com>
In-Reply-To: <20220316095226.2613545-1-marcandre.lureau@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Thu, 17 Mar 2022 13:03:59 +0400
Message-ID: <CAMxuvawAcRNP+ZYhKNUUm8dYRiO0BKxhrLkRAPAo3o6Dc0JRHQ@mail.gmail.com>
Subject: Re: [PATCH 03/27] meson: use chardev_ss dependencies
To: qemu-devel <qemu-devel@nongnu.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mlureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mlureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: "Bonzini, Paolo" <pbonzini@redhat.com>, "P. Berrange,
 Daniel" <berrange@redhat.com>,
 =?UTF-8?B?TWF0aGlldS1EYXVkw6ksIFBoaWxpcHBl?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi

On Wed, Mar 16, 2022 at 1:52 PM <marcandre.lureau@redhat.com> wrote:
>
> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
> chardev subsystem/library doesn't use gnutls. Use the dedicated
> chardev_ss.dependencies() instead.
>
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> ---
>  meson.build | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meson.build b/meson.build
> index 784e91753630..f20712cb93d7 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -3035,7 +3035,7 @@ qmp =3D declare_dependency(link_whole: [libqmp])
>
>  libchardev =3D static_library('chardev', chardev_ss.sources() + genh,
>                              name_suffix: 'fa',
> -                            dependencies: [gnutls],
> +                            dependencies: chardev_ss.dependencies(),

Looking at history, it was added in commit 3eacf70bb5a83e ("meson:
Propagate gnutls dependency") because crypto/tlscreds.h included
GnuTLS. This was cleaned-up later by commit 678bcc3c2cf222 ("crypto:
Make QCryptoTLSCreds* structures private").

Please ack

>                              build_by_default: false)
>
>  chardev =3D declare_dependency(link_whole: libchardev)
> --
> 2.35.1.273.ge6ebfd0e8cbb
>


