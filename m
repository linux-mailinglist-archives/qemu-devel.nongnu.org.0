Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B210C4CF099
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 05:18:02 +0100 (CET)
Received: from localhost ([::1]:45830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nR4or-0007iC-RJ
	for lists+qemu-devel@lfdr.de; Sun, 06 Mar 2022 23:18:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57284)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nR4nJ-00065l-3S; Sun, 06 Mar 2022 23:16:25 -0500
Received: from [2607:f8b0:4864:20::233] (port=33617
 helo=mail-oi1-x233.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nR4nH-0008Ce-H9; Sun, 06 Mar 2022 23:16:24 -0500
Received: by mail-oi1-x233.google.com with SMTP id x193so13978666oix.0;
 Sun, 06 Mar 2022 20:16:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=7rnBP0+l9YVXInF1UcwNeiU1mjVr8ejEc8f0cibJtTw=;
 b=LY5NGg1d0VeQpM4N+SChOGz5HgIh4pLefkPr+/RPZNq+GDNByaSGIQa6jF+1wmWUk1
 x5lYjUKYjSNjFLqyb2jgwItwJWaFxBXeNT/ufuIyTbPGYzWyPJwCRMWp5+CL6EeCT6au
 TXeKdSsWVb81AbnpnzXahmeJKOOHq+f5S3EUiEpEdQ4nnKvitCVygVF2zReJwC8zHtaJ
 EsrTNQWwMijK7WqR/4/jxQA0ODpJwHQjH04w2LOqGNwuzmfloLqXTbvVbybDkZlGxshQ
 y9QKOYrw7u8oVfsq06Cj+B+K+NXnkpYgmaqAvy95upMSDXiviiNAv3kC+q9nVJ80YQzz
 40vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=7rnBP0+l9YVXInF1UcwNeiU1mjVr8ejEc8f0cibJtTw=;
 b=P2TcrHnpFwk5MoXMMmSZI2jBp7X5HnY8fkpWeHYlGzLQZKRmki96GPiYdu6jCxup7U
 IwKXSD0tdDakVNKkmvZT7tC5WOR2ks31PeGfocNKtw8zcP4TXOQad6P/lVFarhlyz7W8
 KiDhN8oeck60fKGGmajrM7A0mpHrXFTgMYLHQuvPSxQ5rrd3CpLMpGj+hW7kN+ExecKR
 ha0m31r3tlJujr5SkvM0B7c9OdpkW2Iiz5DQdaEGRMaCdFy4/y62wuWogUT+Q2xkLNq1
 61IDBgDVP48HkDdWIJ5M7aX+BrrmXnUj7OESRnHHGaXD6GaAYYEcc6BQCSOtRb0x9jD1
 wRiw==
X-Gm-Message-State: AOAM530UcYzN8XdbB0zH200fIjByzn8GCJjP7KHV8HDEHkkqAkt0qY87
 9JfTeL++PUZKwMs1SWSOzVw3tOZOqVy68EQAH/Q=
X-Google-Smtp-Source: ABdhPJylFWSwklHsD8hW8MQ48mayqGWd3/6CAXB7umJ3bNqeJuaXcEGGYQ9mbKmhu97vfk6ODJWOEpr8Ufr7YvUYfQE=
X-Received: by 2002:a05:6808:3020:b0:2d9:b433:ddbf with SMTP id
 ay32-20020a056808302000b002d9b433ddbfmr4464210oib.172.1646626582207; Sun, 06
 Mar 2022 20:16:22 -0800 (PST)
MIME-Version: 1.0
References: <20220306231753.50277-1-philippe.mathieu.daude@gmail.com>
 <20220306231753.50277-18-philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220306231753.50277-18-philippe.mathieu.daude@gmail.com>
From: Akihiko Odaki <akihiko.odaki@gmail.com>
Date: Mon, 7 Mar 2022 13:16:11 +0900
Message-ID: <CAMVc7JViNKEAtk_qYNwee0__ctqgGQTnSpfkUzT=tcv2H8jk=Q@mail.gmail.com>
Subject: Re: [PATCH v7 17/22] ui/cocoa: Constify qkeycode translation arrays
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::233
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::233;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-oi1-x233.google.com
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
> Reported-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  ui/cocoa.m | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/ui/cocoa.m b/ui/cocoa.m
> index 8ab9ab5e84..a6db8ebfb6 100644
> --- a/ui/cocoa.m
> +++ b/ui/cocoa.m
> @@ -671,7 +671,7 @@ QemuCocoaView *cocoaView;
>
>      /* translates Macintosh keycodes to QEMU's keysym */
>
> -    int without_control_translation[] =3D {
> +    static const int without_control_translation[] =3D {
>          [0 ... 0xff] =3D 0,   // invalid key
>
>          [kVK_UpArrow]       =3D QEMU_KEY_UP,
> @@ -686,7 +686,7 @@ QemuCocoaView *cocoaView;
>          [kVK_Delete]        =3D QEMU_KEY_BACKSPACE,
>      };
>
> -    int with_control_translation[] =3D {
> +    static const int with_control_translation[] =3D {
>          [0 ... 0xff] =3D 0,   // invalid key
>
>          [kVK_UpArrow]       =3D QEMU_KEY_CTRL_UP,
> --
> 2.34.1
>

