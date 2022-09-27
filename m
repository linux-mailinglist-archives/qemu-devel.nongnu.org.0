Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB9D85EC925
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 18:12:19 +0200 (CEST)
Received: from localhost ([::1]:49170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odDBy-0001BQ-QR
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 12:12:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46274)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1odBYE-0006fr-3R
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 10:27:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31829)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1odBY9-0007yQ-Gx
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 10:27:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664288823;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NezChzvMGRnr+BeY818eZqTO8zRghATTrTwE1945+Bo=;
 b=aDNebBmPgRv8i8UQWgPCTn3OawyrLtQkseq5EaWFZ4dJ8qlw1YpZ3/sZ8xag3O9McgoXdc
 oIqdoBkfaBPLjoMdlQ3uhLCGj4tRQnx6+SkwPpEVToinboRR86QcR8W+KTJ+qxS4ubJEWP
 0GJtzUar5GvMJpP/DJ6MmxDH9ntHiJc=
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com
 [209.85.210.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-662-g7k2r8RMMdGQyDwj-QeVzg-1; Tue, 27 Sep 2022 10:27:02 -0400
X-MC-Unique: g7k2r8RMMdGQyDwj-QeVzg-1
Received: by mail-ot1-f69.google.com with SMTP id
 y25-20020a9d6359000000b00655ffb2ca00so4705175otk.4
 for <qemu-devel@nongnu.org>; Tue, 27 Sep 2022 07:27:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date;
 bh=NezChzvMGRnr+BeY818eZqTO8zRghATTrTwE1945+Bo=;
 b=PPOOjvwbDntGLD4GHsPUg0BNXs1ENMCBxZNHoTIRPcuEsrcwajLN4bIw8heZRx7Eil
 9bA2Vx9If/KZ+JVJm4rCYM1XBRPLo2pVwCwB5crRePQ5Pez6362Zo6tzxb7dUmH5v4wX
 9o0tuREoghfp9WfST8PwvImDfIU85sM0cvWKK1U/wV7Nos+aNjGo7rdy3R2AOOIk1McX
 4mhsVvzKRy4jqNG0MNlfW0ym9BUsnEwTbH/JAJiqVNFnGAWvQgGPK0duVq5BjrXMIOUl
 eBhS1PU+wgSDdZQLGtQBH7qNh7UyAMP7/GKoI0NiLqFqjDJbO0/fNLiN4d1yGz2nUMb1
 tNsw==
X-Gm-Message-State: ACrzQf0CD8FV1kgJd+UOfIUbtA1sOY8lnKHkKz6/cMMXRGXxhgwPhbZW
 cTh+oImE1XOJWpXCuI6hWlej8oiBHt71JMtmiJbvrQsOvYGSbyXp3fjwrd5O7u6RHwQ2+IWxhGg
 SwA9J01ZtsNJAYEEJwztLQsFo/0ySLFE=
X-Received: by 2002:a05:6808:21a3:b0:350:cca1:9f40 with SMTP id
 be35-20020a05680821a300b00350cca19f40mr1975597oib.205.1664288821424; 
 Tue, 27 Sep 2022 07:27:01 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7+b3sVUythNW8p8meyJQrUROneF4lfjAGeeFO8razwVoKg85WU+seRV5dHwbGcgXNTAiCjVBOxIz+Ofqe4IQE=
X-Received: by 2002:a05:6808:21a3:b0:350:cca1:9f40 with SMTP id
 be35-20020a05680821a300b00350cca19f40mr1975586oib.205.1664288821252; Tue, 27
 Sep 2022 07:27:01 -0700 (PDT)
MIME-Version: 1.0
References: <20220927110632.1973965-1-bmeng.cn@gmail.com>
 <20220927110632.1973965-15-bmeng.cn@gmail.com>
In-Reply-To: <20220927110632.1973965-15-bmeng.cn@gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Tue, 27 Sep 2022 18:26:49 +0400
Message-ID: <CAMxuvaygYvLDDb+w-HLW0RXmZbY8HoQb5=Ck2g=C3=QtLiLCuQ@mail.gmail.com>
Subject: Re: [PATCH v4 14/54] tests/qtest: migration-test: Avoid using
 hardcoded /tmp
To: Bin Meng <bmeng.cn@gmail.com>
Cc: qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>, 
 Bin Meng <bin.meng@windriver.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, 
 Juan Quintela <quintela@redhat.com>, Laurent Vivier <lvivier@redhat.com>, 
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

Hi

On Tue, Sep 27, 2022 at 3:07 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> From: Bin Meng <bin.meng@windriver.com>
>
> This case was written to use hardcoded /tmp directory for temporary
> files. Update to use g_dir_make_tmp() for a portable implementation.
>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> ---
>
> Changes in v4:
> - Update the error reporting by using the GError "error" argument
>   of g_dir_make_tmp()
> - Remove the const from tmpfs declaration
>
> Changes in v3:
> - Split to a separate patch
>
>  tests/qtest/migration-test.c | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)
>
> diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
> index 4728d528bb..f57e07fe2d 100644
> --- a/tests/qtest/migration-test.c
> +++ b/tests/qtest/migration-test.c
> @@ -102,7 +102,7 @@ static bool ufd_version_check(void)
>
>  #endif
>
> -static const char *tmpfs;
> +static char *tmpfs;
>
>  /* The boot file modifies memory area in [start_address, end_address)
>   * repeatedly. It outputs a 'B' at a fixed rate while it's still running=
.
> @@ -2434,10 +2434,10 @@ static bool kvm_dirty_ring_supported(void)
>
>  int main(int argc, char **argv)
>  {
> -    char template[] =3D "/tmp/migration-test-XXXXXX";
>      const bool has_kvm =3D qtest_has_accel("kvm");
>      const bool has_uffd =3D ufd_version_check();
>      const char *arch =3D qtest_get_arch();
> +    GError *err =3D NULL;
>      int ret;
>
>      g_test_init(&argc, &argv, NULL);
> @@ -2462,9 +2462,11 @@ int main(int argc, char **argv)
>          return g_test_run();
>      }
>
> -    tmpfs =3D g_mkdtemp(template);
> +    tmpfs =3D g_dir_make_tmp("migration-test-XXXXXX", &err);
>      if (!tmpfs) {
> -        g_test_message("g_mkdtemp on path (%s): %s", template, strerror(=
errno));
> +        g_test_message("g_dir_make_tmp on path (%s): %s", tmpfs,
> +                       err->message);
> +        g_error_free(err);

You missed the opportunity to use g_autoptr(GError), ok anyway
Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>


>      }
>      g_assert(tmpfs);
>
> @@ -2589,6 +2591,7 @@ int main(int argc, char **argv)
>          g_test_message("unable to rmdir: path (%s): %s",
>                         tmpfs, strerror(errno));
>      }
> +    g_free(tmpfs);
>
>      return ret;
>  }
> --
> 2.34.1
>


