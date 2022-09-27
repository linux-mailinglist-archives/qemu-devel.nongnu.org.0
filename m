Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B2A975EC93C
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 18:16:38 +0200 (CEST)
Received: from localhost ([::1]:48232 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odDG9-0007J0-8G
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 12:16:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1odBYl-00084e-K9
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 10:27:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53868)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1odBYj-00084h-WF
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 10:27:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664288857;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YnEJxhs2rzxD4CEJnSS+RjdQD8uWYxmXnMUFhqE+8l8=;
 b=SY6JuBd2AKRgtlmv27P0Qq5UYnahNFnsKxwzC1RG3U0KX/j0FaQ4bh+Ik0tDiDsMfhHrvw
 pxdDwl/zP4pgntdyOE35mdZgdv1/xQbVZxndLpzwFObvna9LkcSm4OAF+ITpK9ogQKymcd
 c2HTTr4iRwA5MBzokDudF4xp9zCeKlg=
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com
 [209.85.161.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-562-VB3euh3CPkKiuS4f6uww-g-1; Tue, 27 Sep 2022 10:27:36 -0400
X-MC-Unique: VB3euh3CPkKiuS4f6uww-g-1
Received: by mail-oo1-f70.google.com with SMTP id
 y3-20020a4a86c3000000b004761b39fee7so4116722ooh.1
 for <qemu-devel@nongnu.org>; Tue, 27 Sep 2022 07:27:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date;
 bh=YnEJxhs2rzxD4CEJnSS+RjdQD8uWYxmXnMUFhqE+8l8=;
 b=T2rg/JTY+XGjCLTSlKo0JHhh9IdVVdxmax52/b8DP+gNwuWp3zja65y+YN2QHWT4dp
 f+UQ/ijAya1KDCHJ+4m7ktQgu/wcaYdlv2DND5v9Dc0UQoqdZyQmKUCnAwghydgAT40j
 dxeM/Oz20Ae+aS+owQtXX55UhmyDX3dLj/46gIvTxqjqCfKH3NgHgTorTjQQuyuLcFGw
 k2JcL9x4XS6dVhWkdHrnYkd6h7V6lyrVtUSf35zqMc0NSw0/Dm0jxAP7US7/1x7YzBs5
 TvTMQHRnn9eIbWbUS92Pdd7MINNdh821SDPU5/ltuKRMB6vQrfrZUh95VbzH5mLlFx2d
 NcDg==
X-Gm-Message-State: ACrzQf1C/PkCTEpDrZngvfS//jHd0pL2Zy+tYNo+Ur3CeLshp/GW7YSc
 KfqcW05mfYI09DXZQ44dVNVIPQ42OqsK+z1jiHql6TEgwXs1oh5cP2NuE7/Dyogka6PJxui/QRd
 dVg/HR1zsYqYAqJ894YhiDAmeAUKR240=
X-Received: by 2002:a05:6870:e98c:b0:131:8940:e7b with SMTP id
 r12-20020a056870e98c00b0013189400e7bmr1361901oao.53.1664288854849; 
 Tue, 27 Sep 2022 07:27:34 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM48AdPu36H8Z2qykU19+2Qfs8oF8FnpS6feEEByA0o/9KYcfXmscmGw0hPS4gRXpgn+3NgkWXLZ4QlThqo+nPg=
X-Received: by 2002:a05:6870:e98c:b0:131:8940:e7b with SMTP id
 r12-20020a056870e98c00b0013189400e7bmr1361887oao.53.1664288854639; Tue, 27
 Sep 2022 07:27:34 -0700 (PDT)
MIME-Version: 1.0
References: <20220927110632.1973965-1-bmeng.cn@gmail.com>
 <20220927110632.1973965-16-bmeng.cn@gmail.com>
In-Reply-To: <20220927110632.1973965-16-bmeng.cn@gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Tue, 27 Sep 2022 18:27:23 +0400
Message-ID: <CAMxuvazK2ic2ccM+STEhFRAKuFr8mQFXNO4SSdN7NwQpFN1eKQ@mail.gmail.com>
Subject: Re: [PATCH v4 15/54] tests/qtest: pflash-cfi02-test: Avoid using
 hardcoded /tmp
To: Bin Meng <bmeng.cn@gmail.com>
Cc: qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>, 
 Bin Meng <bin.meng@windriver.com>, Laurent Vivier <lvivier@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mlureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Sep 27, 2022 at 3:07 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> From: Bin Meng <bin.meng@windriver.com>
>
> This case was written to use hardcoded /tmp directory for temporary
> files. Update to use g_file_open_tmp() for a portable implementation.
>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> ---
>
> Changes in v4:
> - Replace the whole block with a g_assert_no_error()
>
> Changes in v3:
> - Split to a separate patch
>
>  tests/qtest/pflash-cfi02-test.c | 15 +++++++--------
>  1 file changed, 7 insertions(+), 8 deletions(-)
>
> diff --git a/tests/qtest/pflash-cfi02-test.c b/tests/qtest/pflash-cfi02-t=
est.c
> index 7fce614b64..0b52c2ca5c 100644
> --- a/tests/qtest/pflash-cfi02-test.c
> +++ b/tests/qtest/pflash-cfi02-test.c
> @@ -56,7 +56,7 @@ typedef struct {
>      QTestState *qtest;
>  } FlashConfig;
>
> -static char image_path[] =3D "/tmp/qtest.XXXXXX";
> +static char *image_path;
>
>  /*
>   * The pflash implementation allows some parameters to be unspecified. W=
e want
> @@ -608,6 +608,7 @@ static void test_cfi_in_autoselect(const void *opaque=
)
>  static void cleanup(void *opaque)
>  {
>      unlink(image_path);
> +    g_free(image_path);
>  }
>
>  /*
> @@ -635,16 +636,14 @@ static const FlashConfig configuration[] =3D {
>
>  int main(int argc, char **argv)
>  {
> -    int fd =3D mkstemp(image_path);
> -    if (fd =3D=3D -1) {
> -        g_printerr("Failed to create temporary file %s: %s\n", image_pat=
h,
> -                   strerror(errno));
> -        exit(EXIT_FAILURE);
> -    }
> +    GError *err =3D NULL;
> +    int fd =3D g_file_open_tmp("qtest.XXXXXX", &image_path, &err);
> +    g_assert_no_error(err);
> +
>      if (ftruncate(fd, UNIFORM_FLASH_SIZE) < 0) {
>          int error_code =3D errno;
>          close(fd);
> -        unlink(image_path);
> +        cleanup(NULL);
>          g_printerr("Failed to truncate file %s to %u MB: %s\n", image_pa=
th,
>                     UNIFORM_FLASH_SIZE, strerror(error_code));
>          exit(EXIT_FAILURE);
> --
> 2.34.1
>


