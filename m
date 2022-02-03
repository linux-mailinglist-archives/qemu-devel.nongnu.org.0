Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 06C614A8305
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Feb 2022 12:18:33 +0100 (CET)
Received: from localhost ([::1]:43330 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFa8G-00038k-5o
	for lists+qemu-devel@lfdr.de; Thu, 03 Feb 2022 06:18:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42168)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eterrell@redhat.com>)
 id 1nFa5d-0001Qd-54
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 06:15:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37881)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eterrell@redhat.com>)
 id 1nFa5X-00052c-0S
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 06:15:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643886922;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qMbXuK6Ie1nsNFXBDKAV74v6CpdoYYU+a6xup0+8820=;
 b=QHBAFc5S/lHJhWVnmwBnrb9tjq+TyOxI1pNBJ/6N5t3GFCz4qouP83x2qfxSBR8zO4sQs4
 VeiCKAexQe4kJriCqirCqh1/5n8Nyror81VN4WlLbSNpdMl3Wp4GjWoHeiBXgcse17eDsp
 38kNO544G7OcPKlID7wTiH12aqXAOoc=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-10-756UkJVLN_SKqB5xyp0B3Q-1; Thu, 03 Feb 2022 06:15:21 -0500
X-MC-Unique: 756UkJVLN_SKqB5xyp0B3Q-1
Received: by mail-wm1-f72.google.com with SMTP id
 w5-20020a1cf605000000b00354d2d83490so626530wmc.4
 for <qemu-devel@nongnu.org>; Thu, 03 Feb 2022 03:15:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
 :from:date:message-id:subject:to:cc:content-transfer-encoding;
 bh=qMbXuK6Ie1nsNFXBDKAV74v6CpdoYYU+a6xup0+8820=;
 b=CD8Uv5pUrYJKK7H31hCk/ys4fIkliocoxapi/ylykElsB4xxXMY0bMcISqtuy2yDku
 VnzwLeO1w7XcauZlz9K2Ul6ff1mHNJQH1doT13oLyncJZHYc3vGpAlADgIWp9JNBPRjt
 /KCzoB4MErSjbA3ayg3YbwHDZFIk+nbT/5U0DF89k/jFYnSUVQEJ38GbvICceavP+q3U
 kdvLzjVXgSbq1KcuxGxnee/MtPjCGPKnaDsLUUBGI2vPp4oklljJl0v7hnBJktezRxCE
 W4SuikM3pwKD2/9PaMd+j6tU+/dSYtZPNQ0pzQqupBReu2Pl1uLz0jLiYY5AaIbmWLtN
 FMTw==
X-Gm-Message-State: AOAM532IxX9kLwROGxGAyOgIybeN9DinsjAdrzYk13pKt4AV2cTEOa+6
 6BQaP1Yrslt5qg/hoDZmE/j6v6YPZ2oJfOCzXR+UnfVEMoS/s6WFGWwpnJO6Qm1dVVOv9/1afZp
 HLzWUmXRRGcehkX/LcSa2fjT/CbythoE=
X-Received: by 2002:a5d:64e6:: with SMTP id g6mr20421879wri.184.1643886920483; 
 Thu, 03 Feb 2022 03:15:20 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzMV7a3tj6eVRCHehu4kIC+mdKIjWutkothUCvkJQBqd7KeT2Um49fagiHrH+jBMDPqmxWDsdfsOFVZRluKxNA=
X-Received: by 2002:a5d:64e6:: with SMTP id g6mr20421864wri.184.1643886920279; 
 Thu, 03 Feb 2022 03:15:20 -0800 (PST)
MIME-Version: 1.0
References: <20220203105118.520687-1-berrange@redhat.com>
In-Reply-To: <20220203105118.520687-1-berrange@redhat.com>
From: Eduardo Otubo <eterrell@redhat.com>
Date: Thu, 3 Feb 2022 12:15:09 +0100
Message-ID: <CAGMDDkc3cR4zUHLm6BxAnDcadVEZaRhdxP7ZRihLuMotgNPaDw@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: take over seccomp from Eduardo Otubo
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eterrell@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eterrell@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.086,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Reply-To: otubo@redhat.com
Cc: Eduardo Otubo <otubo@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Feb 3, 2022 at 11:51 AM Daniel P. Berrang=C3=A9 <berrange@redhat.co=
m> wrote:
>
> Eduardo has indicated that he no longer has time to be involved in
> a QEMU aintainership role. As one of the more frequent contributors
> of patches and design ideas to seccomp, I'll take over.
>
> Signed-off-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> ---
>  MAINTAINERS | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index bdb55924f4..2b0b400709 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2973,8 +2973,8 @@ F: docs/sphinx/fakedbusdoc.py
>  F: tests/qtest/dbus*
>
>  Seccomp
> -M: Eduardo Otubo <otubo@redhat.com>
> -S: Supported
> +M: Daniel P. Berrange <berrange@redhat.com>
> +S: Odd Fixes
>  F: softmmu/qemu-seccomp.c
>  F: include/sysemu/seccomp.h
>  F: tests/unit/test-seccomp.c
> --
> 2.34.1
>

Acked-by: Eduardo Otubo <otubo@redhat.com>


