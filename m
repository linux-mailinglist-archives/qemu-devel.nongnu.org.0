Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1422B5EC783
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 17:21:35 +0200 (CEST)
Received: from localhost ([::1]:51832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odCOr-0004lM-Hd
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 11:21:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52900)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1odBZE-0000In-Ql
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 10:28:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46745)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1odBZA-00086y-7J
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 10:28:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664288887;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gSHIHV/cgYGy8ujjKaJqi3IGzLcV8Yma/yMCciG06LA=;
 b=hcrNj/T/u9G6kALWV3Sfpdj9VuxYwhurTMWxGIspO3Ef0RTFCfG1cTQzhtDHF8yCCO++rz
 2btjLbVwj05yHgdUkD7hAIXSEQe9GEQwhqGlvigHJYCg+8vGWosWz7/dP5IdLxmQkXxomB
 bg13I0yccqFrUUhOFXPeL/kDNlgHRQs=
Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com
 [209.85.160.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-624-IO1e_VAKPSe2GSQcysT_cg-1; Tue, 27 Sep 2022 10:28:05 -0400
X-MC-Unique: IO1e_VAKPSe2GSQcysT_cg-1
Received: by mail-oa1-f70.google.com with SMTP id
 586e51a60fabf-13193fb45b9so248354fac.1
 for <qemu-devel@nongnu.org>; Tue, 27 Sep 2022 07:28:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date;
 bh=gSHIHV/cgYGy8ujjKaJqi3IGzLcV8Yma/yMCciG06LA=;
 b=ZHrVZRmdpvW3XBu4VJ6oQj+Pr7fwPOP1CLBX949Noa4yzVDPVtIgPdQPzHydOLAXRZ
 i4NAqh9lIkuKYYmaNqF3nFD2qr6kykLqGbu65mJ+M/bCCpjMaNssOj7E+ndwM0cLDxN9
 iSBadwLOzsqYZw5wmEPbfogKP0YCsf3nHNrGcRIChwr8AD9sciQXDR+jBEW2BvTtcq0q
 Luj5sp6ytg6F1OLzyruOVkDlTqbApkJrFW94LWGTCIr04hru+16Gj3MY7jjElC2ypOuQ
 POEPehoIc+za75LaDsAkEQbZTU7RirSsQn6jEYZgdgSzoajH0ivrEKJ011UTuxEJM9O0
 LBVA==
X-Gm-Message-State: ACrzQf3B7uDaUsjzdvbG6qzn10Hjkt5t7j14t6PjUK8OkYvNyhXQjJah
 Nvxty74WcxCzJ0QhyylZTvEcTjNlRugXoc7oQyP/EzcSZR0rij1/3CPDXOfDWFsLytosoIfJhUv
 5tc5XZ8rqOW+uU/ujJP9cRzNR2F6Icag=
X-Received: by 2002:a9d:125:0:b0:655:ced1:254b with SMTP id
 34-20020a9d0125000000b00655ced1254bmr12578209otu.378.1664288884745; 
 Tue, 27 Sep 2022 07:28:04 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7EKtJcndohpXZW+fpxzWtbzQ2giCrwtevgJE2P0HgGbLGaiLtDvre3U2cFg2DOF1NCh+ctjY/0/EQNYIQzbGE=
X-Received: by 2002:a9d:125:0:b0:655:ced1:254b with SMTP id
 34-20020a9d0125000000b00655ced1254bmr12578201otu.378.1664288884561; Tue, 27
 Sep 2022 07:28:04 -0700 (PDT)
MIME-Version: 1.0
References: <20220927110632.1973965-1-bmeng.cn@gmail.com>
 <20220927110632.1973965-17-bmeng.cn@gmail.com>
In-Reply-To: <20220927110632.1973965-17-bmeng.cn@gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Tue, 27 Sep 2022 18:27:53 +0400
Message-ID: <CAMxuvaxuFiWz_2Km=xC-jzh6+DeLn21NgNkTKMRYzkBpEB=A7w@mail.gmail.com>
Subject: Re: [PATCH v4 16/54] tests/qtest: qmp-test: Avoid using hardcoded /tmp
To: Bin Meng <bmeng.cn@gmail.com>
Cc: qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>, 
 Bin Meng <bin.meng@windriver.com>, Laurent Vivier <lvivier@redhat.com>, 
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
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
> files. Update to use g_dir_make_tmp() for a portable implementation.
>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

> ---
>
> Changes in v4:
> - Replace the error reporting with g_assert_no_error()
>
> Changes in v3:
> - Split to a separate patch
>
>  tests/qtest/qmp-test.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
>
> diff --git a/tests/qtest/qmp-test.c b/tests/qtest/qmp-test.c
> index bf7304c7dc..d2070cb683 100644
> --- a/tests/qtest/qmp-test.c
> +++ b/tests/qtest/qmp-test.c
> @@ -161,14 +161,15 @@ static void test_qmp_protocol(void)
>
>  /* Out-of-band tests */
>
> -char tmpdir[] =3D "/tmp/qmp-test-XXXXXX";
> +char *tmpdir;
>  char *fifo_name;
>
>  static void setup_blocking_cmd(void)
>  {
> -    if (!g_mkdtemp(tmpdir)) {
> -        g_error("g_mkdtemp: %s", strerror(errno));
> -    }
> +    GError *err =3D NULL;
> +    tmpdir =3D g_dir_make_tmp("qmp-test-XXXXXX", &err);
> +    g_assert_no_error(err);
> +
>      fifo_name =3D g_strdup_printf("%s/fifo", tmpdir);
>      if (mkfifo(fifo_name, 0666)) {
>          g_error("mkfifo: %s", strerror(errno));
> @@ -179,6 +180,7 @@ static void cleanup_blocking_cmd(void)
>  {
>      unlink(fifo_name);
>      rmdir(tmpdir);
> +    g_free(tmpdir);
>  }
>
>  static void send_cmd_that_blocks(QTestState *s, const char *id)
> --
> 2.34.1
>


