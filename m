Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CBC363A2DD
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Nov 2022 09:26:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ozZSa-0002Wh-Ri; Mon, 28 Nov 2022 03:25:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1ozZS7-0002MF-1A
 for qemu-devel@nongnu.org; Mon, 28 Nov 2022 03:25:25 -0500
Received: from mail-lj1-x22a.google.com ([2a00:1450:4864:20::22a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1ozZS5-0003Ki-CJ
 for qemu-devel@nongnu.org; Mon, 28 Nov 2022 03:25:22 -0500
Received: by mail-lj1-x22a.google.com with SMTP id d3so12271531ljl.1
 for <qemu-devel@nongnu.org>; Mon, 28 Nov 2022 00:25:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EUwzYjT2SdvgunbOyfw9q1yfntATAWke7ZObNeVF52k=;
 b=hwfKTEwtKvqLdWEUDCp/kFlKVrocW7pAV04QnC2oSb5KXMWafK7brUvDqyFyIHY+c0
 T5JqC191DjrnyvnULTs94Ouy1NHmNZE/CTllTiGfYpSNBm/2gvYNxAYPHPqInjaSnxy1
 KljJuvi3YsbymlX4DVzYOlt0sEjiyabXOPj8Wky/JOmx2Fq5ZAuvAnlwgsWzjKIOZO8G
 rWRMtM8YNXpRgiTd5qqJ4gWm/j1dQpiNC2a/Ra1jLVcW3rj3PJDFHXfzAgx3H8yuYjxw
 LybXNZRq0uB95OsNfhw7Jszs5VchIiFkI2f/Vs+TzPITqIZhzRRHGahlzvCl5lK4fbF+
 NCag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EUwzYjT2SdvgunbOyfw9q1yfntATAWke7ZObNeVF52k=;
 b=2CbCURnU95eQ4oxJD/R50b3Pw162ZKq9MiYJJ32dLSAbkn4a/47xmnpOrYONKqcvm4
 v/QY61/sEAuKUnNq/xuZ8yKYgi+PvXI4Fq4jVh1tYbUxg6xCEs3WdMSzAJ2HBLDN2sCP
 JxTJ2yLLXiTm0DVxDkFXaDF588FbkT4fh842OandcUcLsP46B5aS70qKpH32hotgxkdG
 CNZAmsociIJpg64FkWyxUvRieJpZemVy7KBTwEM2Fc1dxTfKRoPuPE+hsXn5/RcT9ZnN
 zDq5R+i/07kFsbWCFa+W0zP9XunJ+5zbuOkS4qwfu+RtM8G3Zk8W7sM3zA7Y/DoX2GH2
 eFxg==
X-Gm-Message-State: ANoB5pm0EDuc5CFPso7W3ZUODeJDrOuFTYzKX8gSc38l+jUikcMk+5hJ
 eTE50S0IMNwNhXWqRkhL+vcdJSzkm5OFhFmVeBU=
X-Google-Smtp-Source: AA0mqf4jfcFoWP5mlcrUVqEV17EwWHUhb9SiLRrcXLTg2P4SS+bihMQuc+E4bGW9BoTa0WWRxLltlV8gMwlVXxqb5lc=
X-Received: by 2002:a2e:9d90:0:b0:279:83e4:b9b2 with SMTP id
 c16-20020a2e9d90000000b0027983e4b9b2mr6563706ljj.452.1669623919645; Mon, 28
 Nov 2022 00:25:19 -0800 (PST)
MIME-Version: 1.0
References: <20221125154030.42108-1-philmd@linaro.org>
 <20221125154030.42108-3-philmd@linaro.org>
In-Reply-To: <20221125154030.42108-3-philmd@linaro.org>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Mon, 28 Nov 2022 12:25:07 +0400
Message-ID: <CAJ+F1C+GxHCx=FuBQvPNhAHVAt94XT0xS_Be9VRziOa8v88pcw@mail.gmail.com>
Subject: Re: [RFC PATCH-for-7.2 2/4] hw/display/qxl: Document qxl_phys2virt()
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Mauro Matteo Cascella <mcascell@redhat.com>, 
 Gerd Hoffmann <kraxel@redhat.com>, Peter Maydell <peter.maydell@linaro.org>, 
 Alexander Bulekov <alxndr@bu.edu>, Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::22a;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lj1-x22a.google.com
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

On Fri, Nov 25, 2022 at 7:41 PM Philippe Mathieu-Daud=C3=A9
<philmd@linaro.org> wrote:
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>


> ---
>  hw/display/qxl.h | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
>
> diff --git a/hw/display/qxl.h b/hw/display/qxl.h
> index e74de9579d..78b3a6c9ba 100644
> --- a/hw/display/qxl.h
> +++ b/hw/display/qxl.h
> @@ -147,6 +147,25 @@ OBJECT_DECLARE_SIMPLE_TYPE(PCIQXLDevice, PCI_QXL)
>  #define QXL_DEFAULT_REVISION (QXL_REVISION_STABLE_V12 + 1)
>
>  /* qxl.c */
> +/**
> + * qxl_phys2virt: Get a pointer within a PCI VRAM memory region.
> + *
> + * @qxl: QXL device
> + * @phys: physical offset of buffer within the VRAM
> + * @group_id: memory slot group
> + *
> + * Returns a host pointer to a buffer placed at offset @phys within the
> + * active slot @group_id of the PCI VGA RAM memory region associated wit=
h
> + * the @qxl device. If the slot is inactive, or the offset is out
> + * of the memory region, returns NULL.
> + *
> + * Use with care; by the time this function returns, the returned pointe=
r is
> + * not protected by RCU anymore.  If the caller is not within an RCU cri=
tical
> + * section and does not hold the iothread lock, it must have other means=
 of
> + * protecting the pointer, such as a reference to the region that includ=
es
> + * the incoming ram_addr_t.
> + *
> + */
>  void *qxl_phys2virt(PCIQXLDevice *qxl, QXLPHYSICAL phys, int group_id);
>  void qxl_set_guest_bug(PCIQXLDevice *qxl, const char *msg, ...)
>      G_GNUC_PRINTF(2, 3);
> --
> 2.38.1
>
>


--
Marc-Andr=C3=A9 Lureau

