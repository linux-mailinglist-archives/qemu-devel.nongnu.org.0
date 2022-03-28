Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 575CB4E8B33
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Mar 2022 02:14:35 +0200 (CEST)
Received: from localhost ([::1]:33072 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nYd1l-0006ur-Uo
	for lists+qemu-devel@lfdr.de; Sun, 27 Mar 2022 20:14:33 -0400
Received: from eggs.gnu.org ([209.51.188.92]:39254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nYd0Y-0006EV-9S
 for qemu-devel@nongnu.org; Sun, 27 Mar 2022 20:13:18 -0400
Received: from [2607:f8b0:4864:20::d29] (port=36356
 helo=mail-io1-xd29.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nYd0W-0000L9-Pw
 for qemu-devel@nongnu.org; Sun, 27 Mar 2022 20:13:17 -0400
Received: by mail-io1-xd29.google.com with SMTP id b16so15251268ioz.3
 for <qemu-devel@nongnu.org>; Sun, 27 Mar 2022 17:13:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=5XBv1NftibjJ23WGTA9Gp0fWtS4rS2m3O2PBwQUyTLk=;
 b=JM/9mpPQQy8xzY7TduBQgtRDMGizlWnjXslVhn1bvxtHSZ/yJp/pulfzGLYOJ1jhUu
 gmyK3m+H/YX6ZQcFy74dVwHU0Y7D6JEclVoTL2dyt/01UOQ5mwg7Tvq8haZPnMR92JTj
 Az6rJfk58vRyd8V/2cHCKurouEz0waSBEyYJYk0B1m0F9Qcv/ED0tA4a34PX659VwfO1
 hiHrF6Eg4lcwCcr07+zG4Fs0UEztJBJ+piiCNOmbLN2+8cLZuJN5c2cDp7QHyWihk/+4
 3GGQHfK2wYmCjmLzjbkemGcZKCTAvjaZlu1u3G6aGhATNK9dI/jzYcX3q8J6DSo5LzKT
 1ipw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=5XBv1NftibjJ23WGTA9Gp0fWtS4rS2m3O2PBwQUyTLk=;
 b=pjqowGTEiA9ANceiE3UI8LHOJTPaP745SAXlH/xR1fVUO/u21EmWTov9JFP8U8YGtx
 +S6iUvkIzAvNo32IZX9Gn9QXBdNGfuzVjFkvAbSAGMyl8wF49+4VH0R0D5Q8VoEYwM+v
 OjyKp8yci29N2CjRxxmnmUFj09UIQCo3P9CUkAPEszd7vNwKUUDR8KluSfHoIPaD6jaH
 EWxEP5DFszrfthCef8IGUHnp2ywDfR1SnvgnU9neNC8b+StDzW5nVhXC5N8fqtjV/AJH
 VPr1VqCRcn8/b9WTsQF1cfdXKio/PT8dAtLcJZte80RinbGcr+sd97cYi+yU49zECG3M
 tOCw==
X-Gm-Message-State: AOAM531nfXSmrFQt97T25h1Z7Bu63rh2wB+QC9+L+ZlyNQzAauxVdoYh
 8dKB+UHiTg43p7SyRMKk57JA3ja6aSnXOr7TQNs=
X-Google-Smtp-Source: ABdhPJxm6axFGdNe5W4SuS8x6iGZvzx8+6UQrXgUNhCPSj2J0vRejIejLf1PvI+2iv5CTmNiJ5xonqhbFEyYWyMVaaU=
X-Received: by 2002:a5d:924e:0:b0:649:af51:9c1a with SMTP id
 e14-20020a5d924e000000b00649af519c1amr5156635iol.203.1648426395746; Sun, 27
 Mar 2022 17:13:15 -0700 (PDT)
MIME-Version: 1.0
References: <20220324134812.541274-1-bmeng.cn@gmail.com>
 <20220324134812.541274-2-bmeng.cn@gmail.com>
In-Reply-To: <20220324134812.541274-2-bmeng.cn@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 28 Mar 2022 10:12:49 +1000
Message-ID: <CAKmqyKMaXrkpSNxp8_cDH0TWMzmbf71-hUFCkENKyvijJ1LcBw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] hw/core: loader: Set is_linux to true for VxWorks
 uImage
To: Bin Meng <bmeng.cn@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d29
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::d29;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd29.google.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.659,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Bin Meng <bin.meng@windriver.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Mar 24, 2022 at 11:55 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> From: Bin Meng <bin.meng@windriver.com>
>
> VxWorks 7 uses the same boot interface as the Linux kernel on Arm
> (64-bit only), PowerPC and RISC-V architectures. Add logic to set
> is_linux to true for VxWorks uImage for these architectures in
> load_uboot_image().
>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>
> Changes in v2:
> - update commit message & comments regarding Arm64
>
>  hw/core/loader.c | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>
> diff --git a/hw/core/loader.c b/hw/core/loader.c
> index ca2f2431fb..94d045517f 100644
> --- a/hw/core/loader.c
> +++ b/hw/core/loader.c
> @@ -697,6 +697,21 @@ static int load_uboot_image(const char *filename, hw=
addr *ep, hwaddr *loadaddr,
>          if (is_linux) {
>              if (hdr->ih_os =3D=3D IH_OS_LINUX) {
>                  *is_linux =3D 1;
> +            } else if (hdr->ih_os =3D=3D IH_OS_VXWORKS) {
> +                /*
> +                 * VxWorks 7 uses the same boot interface as the Linux k=
ernel
> +                 * on Arm (64-bit only), PowerPC and RISC-V architecture=
s.
> +                 */
> +                switch (hdr->ih_arch) {
> +                case IH_ARCH_ARM64:
> +                case IH_ARCH_PPC:
> +                case IH_ARCH_RISCV:
> +                    *is_linux =3D 1;
> +                    break;
> +                default:
> +                    *is_linux =3D 0;
> +                    break;
> +                }
>              } else {
>                  *is_linux =3D 0;
>              }
> --
> 2.25.1
>
>

