Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6CAD5F19A9
	for <lists+qemu-devel@lfdr.de>; Sat,  1 Oct 2022 05:43:53 +0200 (CEST)
Received: from localhost ([::1]:37350 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oeTPs-0003no-TV
	for lists+qemu-devel@lfdr.de; Fri, 30 Sep 2022 23:43:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39940)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oeTOb-0002CJ-Nd
 for qemu-devel@nongnu.org; Fri, 30 Sep 2022 23:42:34 -0400
Received: from mail-yb1-xb32.google.com ([2607:f8b0:4864:20::b32]:41552)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oeTOa-0000S1-DH
 for qemu-devel@nongnu.org; Fri, 30 Sep 2022 23:42:33 -0400
Received: by mail-yb1-xb32.google.com with SMTP id j7so7360386ybb.8
 for <qemu-devel@nongnu.org>; Fri, 30 Sep 2022 20:42:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date;
 bh=dvVCB7KmVp1nNKnUrk5d7d11vfvfdSgyW5f29ysma/g=;
 b=Zfom34sSmtwRiyla+2B64sNpGfR/9UClNsTi9tsbSvHzeENT1PfT1fxDEg/FyrtnBW
 u2XvoHrd5jEzZZS3zkdnBc50m5ja8HiF1kK883aRw4TxeArOxPG0lN+L/MK2N5scJ1ZR
 M92PXFIYuT1Fv2FSm6VqCko8wCR+15XuRlgksK8kckL0wXS4X1dli4jb1gJSjM6yM8Gy
 zh/EVz0fUhUzv8FqW2CtBwcKRiHE3IFfJkVInk/qzPVfC1k+E+o3YNgW98jh+qDzMRaW
 3AH/18WE2lMKZPE9dhA2zsSuesUwtpNFb/AknINZJJwsYpi4LoWXBx+/KQ/+gwFEazpU
 OF2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date;
 bh=dvVCB7KmVp1nNKnUrk5d7d11vfvfdSgyW5f29ysma/g=;
 b=DJYkogYLQUzx86BXF2n9Bw7fAxxldKDLrl2VVxYynKPUrGBEh6RPo/MNdqv+MhVNzb
 VJz/Tqn6kf/DEGJ5/yhkznp/E+L2SugijuRunJ1VxOLx2aEdorcue8yMnV0b9t8MZPkQ
 vZEJ+N3WLzJ1xk2OcmXqV9cOcj+rPpdUd2+FDZQbc5v0KaZjz+9RQ/YXsf383epf6ssI
 qsywj4k0AvUceXhgtz+lsxf/wl2Uf9eC/V61PXg6IpAB9PTS2fzKsw+XQ6PHjJ6FxZ/I
 qsE8hDWKt1XwfJBrFIuynBaBvlAaNbaElJPx2MHM30Bw4wYtx5mdOjEX3XPif/HluBPm
 7h0w==
X-Gm-Message-State: ACrzQf2x9cs1gb8+24P/TPnnsPf7m1PoHKsWMlbr6Fd8tD3kmw3mJcxi
 91G1qVX2pawr1+EgKKBaKsw/0TEygYy1jbJs+IZ/RTPK
X-Google-Smtp-Source: AMsMyM67RHJc58attpiWptWdmqHJfGA/OnGSe1PcM8ODb3dVosqXWdl254Vj3pByaqb3oGhV+FfA2ZT5+6C6tLZQC0A=
X-Received: by 2002:a25:3b04:0:b0:695:dc29:c206 with SMTP id
 i4-20020a253b04000000b00695dc29c206mr10459238yba.523.1664595751139; Fri, 30
 Sep 2022 20:42:31 -0700 (PDT)
MIME-Version: 1.0
References: <20220927110632.1973965-1-bmeng.cn@gmail.com>
 <20220927110632.1973965-4-bmeng.cn@gmail.com>
In-Reply-To: <20220927110632.1973965-4-bmeng.cn@gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Sat, 1 Oct 2022 11:42:19 +0800
Message-ID: <CAEUhbmVt+tbWexF1A08-p5XiZ3yZFNEMTMEOmPVAX86jVpj7rw@mail.gmail.com>
Subject: Re: [PATCH v4 03/54] tcg: Avoid using hardcoded /tmp
To: qemu-devel@nongnu.org,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Richard Henderson <richard.henderson@linaro.org>
Cc: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b32;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb32.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Alex, Richard,

On Tue, Sep 27, 2022 at 7:06 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> From: Bin Meng <bin.meng@windriver.com>
>
> Use g_get_tmp_dir() to get the directory to use for temporary files.
>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> ---
>
> (no changes since v2)
>
> Changes in v2:
> - Use g_autofree to declare the variable
>
>  tcg/tcg.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>

Would you pick up this patch in your queue?

Regards,
Bin

