Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B5994CF093
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 05:14:31 +0100 (CET)
Received: from localhost ([::1]:38912 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nR4lS-0002yr-4N
	for lists+qemu-devel@lfdr.de; Sun, 06 Mar 2022 23:14:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56940)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nR4kP-0001tV-SF; Sun, 06 Mar 2022 23:13:25 -0500
Received: from [2607:f8b0:4864:20::232] (port=45665
 helo=mail-oi1-x232.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nR4kO-0007eX-Cg; Sun, 06 Mar 2022 23:13:25 -0500
Received: by mail-oi1-x232.google.com with SMTP id 12so13924821oix.12;
 Sun, 06 Mar 2022 20:13:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=uTiuz8QEg3vlI5deMNAk1aSM+SWJuWDeBB1BUE6kjXM=;
 b=AQTiv0u8WyeJrwo7jUuLrrgEPL79wRvJ6eRY+4XSqWLZl/OS8iBXCmnVNknwjbwL6x
 wQNpCkKTTATfiq9EUrS4DrXinHkXGQsSC/sHz/RbYINkGpwUinSrWtLW4I2KiAvjosKF
 OQWMDfJsKDcYfnzf3UCUv5Kq5gzQDZSUI5Sm+Ht6xHF6YLQu76Q8DoarzoRC56boOp1W
 xuwg2yd7QNIHEPVpshxFmjyj+4gucAp3/qmLD93vpc99Hf/66I6iCKs8eBUEQsu2dZeC
 s+ITVP3PxpSkB5xsQTMnuli57SN8Tx6RfqnIrntHwKDNyJu+A92+UYnfXDRdUmfV3gxW
 JCXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=uTiuz8QEg3vlI5deMNAk1aSM+SWJuWDeBB1BUE6kjXM=;
 b=FvdvlwFpG27+ELQJS1Q396Di3dTZ24TuqU6pyECdiKKkzOecdfinLACghCBacVO89C
 BaewtV81xZ5uAJaNJwPxPmGnk3+yk8ctbHClSG8bkk5ohgwXepWbcs1K0Y90fFAma1y9
 h2krXcZR5AaQqPwavM2SME6EAqfGthAs49CwfWa4wiN2ADEgUZdd+X2Nu7kgd9XfI0jJ
 IIdZxyJGMU62mJ1/7IG03McBhFiccUS/z+uNr1SsK7ejCrcDgkkGW7JKBO+5rRW23xBk
 +kONElW+e+WAllBJ51iBjkKGUs2187Pp/hdFsaUUwrXMqSeITwzRI7gP1Y8mOuezKmnr
 brjw==
X-Gm-Message-State: AOAM530ucFGciepnCvH1SYrFGPfeagy+1/wjarKHUYk8clK0S2AeGU+f
 JyTkmpLxzNdQFIg+Ibq/uFLubMpb/UraNXYaoyU=
X-Google-Smtp-Source: ABdhPJy9pvRoK7W1nyO1Jlx+k/1rGrsDVvCHHVSrtHIzMgAfIOWAcRro/w+cxvNwhe2lq+bvxnU0+ouAw+ifp9DoiLY=
X-Received: by 2002:a05:6808:3020:b0:2d9:b433:ddbf with SMTP id
 ay32-20020a056808302000b002d9b433ddbfmr4459839oib.172.1646626402874; Sun, 06
 Mar 2022 20:13:22 -0800 (PST)
MIME-Version: 1.0
References: <20220306231753.50277-1-philippe.mathieu.daude@gmail.com>
 <20220306231753.50277-15-philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220306231753.50277-15-philippe.mathieu.daude@gmail.com>
From: Akihiko Odaki <akihiko.odaki@gmail.com>
Date: Mon, 7 Mar 2022 13:13:11 +0900
Message-ID: <CAMVc7JU15400rZtO8BWjy8OF0HbufFi4r2LM2DwXhzA2+eUHoQ@mail.gmail.com>
Subject: Re: [PATCH v7 14/22] meson: Resolve the entitlement.sh script once
 for good
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::232
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::232;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-oi1-x232.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 qemu-block@nongnu.org, Christian Schoenebeck <qemu_oss@crudebyte.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Cameron Esfahani <dirty@apple.com>, qemu Developers <qemu-devel@nongnu.org>,
 Roman Bolshakov <r.bolshakov@yadro.com>, Will Cohen <wwcohen@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Akihiko Odaki <akihiko.odaki@gmail.com>
Tested-by: Akihiko Odaki <akihiko.odaki@gmail.com>

On Mon, Mar 7, 2022 at 8:19 AM Philippe Mathieu-Daud=C3=A9
<philippe.mathieu.daude@gmail.com> wrote:
>
> From: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>
> Commit 235b523dba ("meson: Use find_program() to resolve the
> entitlement.sh script") didn't correctly fixed the issue, as
> the script is still resolved for each target. Move the check
> earlier, before processing each target.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  meson.build | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/meson.build b/meson.build
> index b6e30d7463..8ca2b7c8c2 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -3063,6 +3063,10 @@ common_all =3D static_library('common',
>
>  feature_to_c =3D find_program('scripts/feature_to_c.sh')
>
> +if targetos =3D=3D 'darwin'
> +  entitlement =3D find_program('scripts/entitlement.sh')
> +endif
> +
>  emulators =3D {}
>  foreach target : target_dirs
>    config_target =3D config_target_mak[target]
> @@ -3220,7 +3224,6 @@ foreach target : target_dirs
>          install_input +=3D meson.current_source_dir() / entitlements
>        endif
>
> -      entitlement =3D find_program('scripts/entitlement.sh')
>        emulators +=3D {exe['name'] : custom_target(exe['name'],
>                     input: build_input,
>                     output: exe['name'],
> --
> 2.34.1
>

