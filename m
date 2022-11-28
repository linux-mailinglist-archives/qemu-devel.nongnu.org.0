Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 84D9B63B17F
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Nov 2022 19:40:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ozj2P-0007yQ-KO; Mon, 28 Nov 2022 13:39:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1ozj2N-0007yE-2j
 for qemu-devel@nongnu.org; Mon, 28 Nov 2022 13:39:27 -0500
Received: from mail-yw1-x112e.google.com ([2607:f8b0:4864:20::112e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1ozj2L-00010Q-B8
 for qemu-devel@nongnu.org; Mon, 28 Nov 2022 13:39:26 -0500
Received: by mail-yw1-x112e.google.com with SMTP id
 00721157ae682-3b10392c064so115394517b3.0
 for <qemu-devel@nongnu.org>; Mon, 28 Nov 2022 10:39:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xt+iU2hwR+FlYP11lT2sDbSD3xxvppEI9EJkLm1QN14=;
 b=OzqVDRJ20dVkArTKynjXiYbX6u/UbKwZx1vmuyBw7RklcXfZaFJUqUbKitRjh9E8w2
 Szft04Qx/1o07RWf8zVe15AAbJ+mIC9derO/Z33ga3I7lr6FyIgMhgzAMSrnakYGoZnE
 PRcPl3MRR5Bf7GPPN+Cb+ruzW+S1YAl8jpFylyzGwMga56BfAH7oeeUKjgXWXmgTLNzZ
 JeDpIYKNdidVYepkTnApX2XjsTCIzaBm205F6iwgXDKW6nlivUuxFE1zPDJM6AP1icse
 yjcULCCSZIpXdzx6cF1XbxsBEH7/b4hUtDuSalVjHKzL+zlLOYaKEKurGt5oEt/F51Qa
 4afg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xt+iU2hwR+FlYP11lT2sDbSD3xxvppEI9EJkLm1QN14=;
 b=Mp1E3UiDJmRfSTwXmZPd8MupiZ+58bhGZEh1/AJm/DmFMUKdQfHxOwkVAKhKi/95xB
 iFwIc/Xi+kvEbG318DHm6WP64cB1vuEMK8ig+OBIjcDOCLTq0ggISQ90yNzfb3XqARK9
 jYFw/gstCfToHN9iqFBytWuVvwu5yBmDk8AyK5mJaJuz7lBl00+7TeHN3ZvEiGoxIM9X
 AKlf5JUdnVauhUsjZw7mXVETPZdShrc03OBIhmdMjhkt03Ec8zwpEobMScz3cEDl+Ho0
 X4A0JahkoC2ETIT8IsxAsEmoq2STj91nSF2DDndhxXlGUYyzvveUItQbzMIqn3dOQ4tv
 WPpA==
X-Gm-Message-State: ANoB5pkB6UnxXfzUfihIaSa2+R8uePeEKA1cEuV5XQ9Aln0xS+xIJngf
 NgXVoA47XQAquMKcZpI+op5zI2I4oMtuihtVvGQ=
X-Google-Smtp-Source: AA0mqf6qk7/CGiRdNtF/EgUIxgooCImGAEjmTfXFm8Tf+rdJiBser4nBsMcmcCDLupgF4KFo/UdIEUpH2uJdfGT0B2I=
X-Received: by 2002:a81:5309:0:b0:38f:80d5:f22d with SMTP id
 h9-20020a815309000000b0038f80d5f22dmr32519383ywb.296.1669660763879; Mon, 28
 Nov 2022 10:39:23 -0800 (PST)
MIME-Version: 1.0
References: <20221128164105.1191058-1-alex.bennee@linaro.org>
 <20221128164105.1191058-5-alex.bennee@linaro.org>
In-Reply-To: <20221128164105.1191058-5-alex.bennee@linaro.org>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Mon, 28 Nov 2022 13:39:12 -0500
Message-ID: <CAJSP0QX1R4Z+AC3591MpwzBAG1Tz3rDTe4+o2rbe0v-q6sSKMw@mail.gmail.com>
Subject: Re: [PATCH v3 4/7] hw/virtio: ensure a valid host_feature set for
 virtio-user-gpio
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, slp@redhat.com, mst@redhat.com, 
 marcandre.lureau@redhat.com, stefanha@redhat.com, mathieu.poirier@linaro.org, 
 viresh.kumar@linaro.org, sgarzare@redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::112e;
 envelope-from=stefanha@gmail.com; helo=mail-yw1-x112e.google.com
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

On Mon, 28 Nov 2022 at 11:42, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
> There was a disconnect here because vdev->host_features was set to
> random rubbish. This caused a weird negotiation between the driver and
> device that took no account of the features provided by the backend.
> To fix this we must set vdev->host_features once we have initialised
> the vhost backend.
>
> [AJB: however this is confusing because AFAICT none of the other
> vhost-user devices do this.]
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> ---
>  hw/virtio/vhost-user-gpio.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/hw/virtio/vhost-user-gpio.c b/hw/virtio/vhost-user-gpio.c
> index 5851cb3bc9..b2496c824c 100644
> --- a/hw/virtio/vhost-user-gpio.c
> +++ b/hw/virtio/vhost-user-gpio.c
> @@ -228,6 +228,12 @@ static int vu_gpio_connect(DeviceState *dev, Error *=
*errp)
>          return ret;
>      }
>
> +    /*
> +     * Once we have initialised the vhost backend we can finally set
> +     * the what host features are available for this device.
> +     */
> +    vdev->host_features =3D vhost_dev->features;

vdev->host_feature is already set by virtio_bus_device_plugged ->
vu_gpio_get_features.

Something is still wrong.

My understanding is: ->realize() performs a blocking connect so when
it returns and virtio_bus_device_plugged() runs, we'll be able to
fetch the backend features from ->get_features(). The assumption is
that the backend features don't change across reconnection (I think).

vhost-user-gpio seems to follow the same flow as the other vhost-user
devices (vhost-user-net is special, so let's ignore it), so I don't
understand why it's necessary to manually assign ->host_features here?

Stefan

