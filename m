Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D25F65B127
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Jan 2023 12:30:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pCJ0Y-00075l-Pz; Mon, 02 Jan 2023 06:29:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1pCJ0V-00075E-Ei
 for qemu-devel@nongnu.org; Mon, 02 Jan 2023 06:29:32 -0500
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1pCJ0T-0007zE-Vu
 for qemu-devel@nongnu.org; Mon, 02 Jan 2023 06:29:31 -0500
Received: by mail-lf1-x135.google.com with SMTP id bt23so24555654lfb.5
 for <qemu-devel@nongnu.org>; Mon, 02 Jan 2023 03:29:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zRtIpWZfhRzRI+iQvElGsgx1Rt4UXO4cD59b1fwL5l0=;
 b=LUzsalhl1HwRq+v6BVkkkny/AhzHh7dUHbUW6Fg2y/QvY/0L35Lw5isITZ8+AY5H4v
 mn8Zrq3APKJEkG8mYFna1GA10iNJxsHvlJCzKJ0pqgkS0aV3NCZw/az5VFyUB9JEW3oU
 NZArWpoMBGircEUjx6hsr0WqwVNiRwOVyYLRv6J2o8S/BjAgaOSuqDjXy548ap6G49SE
 18HGE0CSyZquTIjQbGTapqLhshnBhZ0x61siekhFZz4RikcrIn14cLX9fpvhdxugYlN3
 cMaUs8Q0Kj91jy9SemfgpfIibqpftDVQf+p5bBoYfXhzDUG96t9LWrEkxFty+YnsEfiX
 eL5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zRtIpWZfhRzRI+iQvElGsgx1Rt4UXO4cD59b1fwL5l0=;
 b=7WdMarRtV2BEqUT+RsKm66+MIwTp0euNjR+4h2sUhYtvDpJhmlRzjmP4frn0T3R7ko
 LfhrhtSx+A0gs5Tr7KHUUZ3+PXYJX8ZHoZKV8Fr6xQZ9sbM6KciDp0ZRoM2pGwjIsT7B
 d6SkinEKSPwvd9wAL4p66PWRMbYIf1zqnvVS4MfCdCFGmuqgqUmcSgkz8up5OJXNOk79
 1O3kCf3w2W5N7YhcCztbw6vrQIDveDmXuJU16q/tyWFqgxxstZl+aH3A0gFeYOdmrzlx
 45rda5Dq8jz7QalIOdQ0TuCq+59li8DJKuzoqbiCrhp048S8U9MvJAYldprMGwXlViIx
 rsBw==
X-Gm-Message-State: AFqh2kqZkGKrn/YGQ+/cVIQBiBQxPF491NRZJbF5Me2nwEx7sTQvA84r
 HbZCwOE5odpQyR6yNgx6auLystxkYVH4JYF6A80=
X-Google-Smtp-Source: AMrXdXtLnyXsd7Tmmz/3sodQGDB3pgSbVcDDPHsO9H55uUYCJm8mceq9gxqr9LmfD+bWIX2VNPC+g8Q0Wq1h7QlD0Kk=
X-Received: by 2002:a05:6512:169d:b0:4cb:269:dfed with SMTP id
 bu29-20020a056512169d00b004cb0269dfedmr2112414lfb.329.1672658966899; Mon, 02
 Jan 2023 03:29:26 -0800 (PST)
MIME-Version: 1.0
References: <20221230092758.281805-1-dengpc12@chinatelecom.cn>
 <20221230092758.281805-2-dengpc12@chinatelecom.cn>
In-Reply-To: <20221230092758.281805-2-dengpc12@chinatelecom.cn>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Mon, 2 Jan 2023 15:29:15 +0400
Message-ID: <CAJ+F1CK67MOErmoHEpV-Zv514afYs5J6X7fe26K=sXobx992eg@mail.gmail.com>
Subject: Re: [PATCH RFC 1/4] vdagent: fix memory leak when vdagent_disconnect
 is called
To: dengpc12@chinatelecom.cn, kraxel@redhat.com
Cc: qemu-devel@nongnu.org, huangy81@chinatelecom.cn, liuym16@chinatelecom.cn
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::135;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lf1-x135.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hi

On Fri, Dec 30, 2022 at 6:48 PM <dengpc12@chinatelecom.cn> wrote:
>
> From: "dengpc12@chinatelecom.cn" <dengpc12@chinatelecom.cn>
>
> Memory free should be done in vdagent_disconnect using
> qemu_input_handler_unregister, replace qemu_input_handler_deactivate
> with that.
>
> Signed-off-by: dengpc12@chinatelecom.cn <dengpc12@chinatelecom.cn>
> Signed-off-by: liuym16@chinatelecom.cn <liuym16@chinatelecom.cn>
> ---
>  ui/vdagent.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/ui/vdagent.c b/ui/vdagent.c
> index 4bf50f0c4d..645383b4ec 100644
> --- a/ui/vdagent.c
> +++ b/ui/vdagent.c
> @@ -863,7 +863,7 @@ static void vdagent_disconnect(VDAgentChardev *vd)
>      vdagent_reset_bufs(vd);
>      vd->caps =3D 0;
>      if (vd->mouse_hs) {
> -        qemu_input_handler_deactivate(vd->mouse_hs);
> +        qemu_input_handler_unregister(vd->mouse_hs);

It looks like vdagent_disconnect() was meant to be called when the
agent connection is lost, vdagent_chr_set_fe_open(fe_open=3Dfalse), so
it can later be initialized again during vdagent_chr_recv_caps(). Not
sure why this isn't done.

Imho, you should instead add qemu_input_handler_unregister() call to
vdagent_chr_fini() for now


--=20
Marc-Andr=C3=A9 Lureau

