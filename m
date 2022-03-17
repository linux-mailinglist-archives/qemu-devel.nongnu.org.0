Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 240B24DC255
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Mar 2022 10:08:28 +0100 (CET)
Received: from localhost ([::1]:56114 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUm7P-0008Iu-5z
	for lists+qemu-devel@lfdr.de; Thu, 17 Mar 2022 05:08:27 -0400
Received: from eggs.gnu.org ([209.51.188.92]:35408)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1nUm5h-0006PV-0r
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 05:06:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50016)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1nUm5f-0003dV-FT
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 05:06:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647507998;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=x0kOORHTXKuV09GU6UffKIbD+rDx8XVwCJEt+t5TDak=;
 b=UGOAPp4alM7eiIGqIyDPg8duB0apXIVdlJl8m96b/GIUBzqHa6bxSrgCoXgU+puj706Mly
 R9CK708uR93CcTd4tpFOvyWLJIGvkpvLveig0Alpu2PqMqrwfaSZ35tphExcouUT6OicRz
 QNDYKc1hH2EFIfdDZWvbSLSajBB/qhM=
Received: from mail-yb1-f200.google.com (mail-yb1-f200.google.com
 [209.85.219.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-652-f1hjltFtNg-pgbcoINS59Q-1; Thu, 17 Mar 2022 05:06:37 -0400
X-MC-Unique: f1hjltFtNg-pgbcoINS59Q-1
Received: by mail-yb1-f200.google.com with SMTP id
 e4-20020a056902034400b00633691534d5so4012341ybs.7
 for <qemu-devel@nongnu.org>; Thu, 17 Mar 2022 02:06:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=x0kOORHTXKuV09GU6UffKIbD+rDx8XVwCJEt+t5TDak=;
 b=zhx6UF0vFMgPqdUXF+HKFpuoY7+OA6yXS7Pxbs4SZTFOmSisZ2HIrrH1J4wTFYy5xN
 HnkdTR9l2NulCkkJqUg+zbM4wNBRkHszTtk1zd2S+wBYp6ftN2TrOc8e3mIXTQeNpZm1
 GZIefFokp7W9WfFGgOCGBIyX4q+7gQNBVvWXn0ZjpUsxyezJwZVHUQgkiihProyczVwx
 nUQfniO2apMA9g6blWqL/K7gb3bqNIicAVs416HKMPEhV6bddETW9fIo5rjKU5KtjGpV
 pp3sEA29vPULzPdjstC7AT/Onj/rKteq3IL45P4Cztx/8iiFpySe92U38QMunJGToAso
 Cfrg==
X-Gm-Message-State: AOAM533j0DeEjUP06NW9s/LqOkSdLnXyup8hR1RVUqo9D0+/+guu9FHD
 HGr9dtM4YSKIm29tju8iJ2H03lCNgX+Rqaq9B3nqPG35qBxICuEvQ40Y55NxWm46XmiOUV5NM4x
 8EykJJrNMSQBfVbo8GXQcH9tRD/xZbE8=
X-Received: by 2002:a81:6dce:0:b0:2e5:b48c:f83 with SMTP id
 i197-20020a816dce000000b002e5b48c0f83mr4646949ywc.15.1647507997180; 
 Thu, 17 Mar 2022 02:06:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwd90/Im8ursZ2gJ6nfgMtBshcm+ofd56/P76wAodWfiABj1xMDRs4S1MI9muPrh9DNcUMBGtyHg7+7NubRS9U=
X-Received: by 2002:a81:6dce:0:b0:2e5:b48c:f83 with SMTP id
 i197-20020a816dce000000b002e5b48c0f83mr4646930ywc.15.1647507996933; Thu, 17
 Mar 2022 02:06:36 -0700 (PDT)
MIME-Version: 1.0
References: <20220316095231.2613560-1-marcandre.lureau@redhat.com>
In-Reply-To: <20220316095231.2613560-1-marcandre.lureau@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Thu, 17 Mar 2022 13:06:25 +0400
Message-ID: <CAMxuvaxmU5EMYxAhVhU3VCObLWi8WG81wzzMekzsf=3J1O+eAA@mail.gmail.com>
Subject: Re: [PATCH 04/27] meson: add util dependency for oslib-posix on
 freebsd
To: qemu-devel <qemu-devel@nongnu.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mlureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mlureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
> kinfo_getproc() requires it.

This is required for correctness and for the next patch, which moves
qemu-openpty and its "util" dependency away from util_ss.

Please review

>
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> ---
>  util/meson.build | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/util/meson.build b/util/meson.build
> index f6ee74ad0c85..bb0b010662d7 100644
> --- a/util/meson.build
> +++ b/util/meson.build
> @@ -11,7 +11,11 @@ util_ss.add(when: linux_io_uring, if_true: files('fdmo=
n-io_uring.c'))
>  util_ss.add(when: 'CONFIG_POSIX', if_true: files('compatfd.c'))
>  util_ss.add(when: 'CONFIG_POSIX', if_true: files('event_notifier-posix.c=
'))
>  util_ss.add(when: 'CONFIG_POSIX', if_true: files('mmap-alloc.c'))
> -util_ss.add(when: 'CONFIG_POSIX', if_true: files('oslib-posix.c'))
> +freebsd_dep =3D []
> +if targetos =3D=3D 'freebsd'
> +  freebsd_dep =3D util
> +endif
> +util_ss.add(when: 'CONFIG_POSIX', if_true: [files('oslib-posix.c'), free=
bsd_dep])
>  util_ss.add(when: 'CONFIG_POSIX', if_true: [files('qemu-openpty.c'), uti=
l])
>  util_ss.add(when: 'CONFIG_POSIX', if_true: files('qemu-thread-posix.c'))
>  util_ss.add(when: 'CONFIG_POSIX', if_true: files('memfd.c'))
> --
> 2.35.1.273.ge6ebfd0e8cbb
>


