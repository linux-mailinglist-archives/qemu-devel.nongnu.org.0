Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 681D86623D2
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 12:07:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEpz5-0002UK-Rc; Mon, 09 Jan 2023 06:06:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pEpz0-0002Tu-RX
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 06:06:27 -0500
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pEpyy-0001CW-6v
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 06:06:26 -0500
Received: by mail-pj1-x102c.google.com with SMTP id
 o1-20020a17090a678100b00219cf69e5f0so12405452pjj.2
 for <qemu-devel@nongnu.org>; Mon, 09 Jan 2023 03:06:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=k5s4idfe83F5vogJLuR3WncBIoZZmGepM5no3pwxFcI=;
 b=UZ65M9RtnJoPiNi8VJ5/Ir1X/57+eDVXJculIGBJvEHQ4p71vefS4RnfurLfRTNcOY
 2cMuCshJJ57hhsu9Op/t7kXH4TcwlbhvuN4mP1Ys0+3RZs5N2aBRFRlTD34utyN7ibXp
 RwWUdBnGKK8kfaUFuEC/VlLKGCeGNhxJNPf/QEkJZ8T8vaHY1kiDaJaRIJou+pIZZGBB
 CItiPh9gsSKQ5SHu12Z1t0uh34ewFdEWy+hK2GcKvh1DR9sKgCNtRTAUgYB+JfhfuZD5
 gxwot7CVa+JsCZ1L/De0tyRvKhiO2Zjen+LY8tBrTelS/O1keFBrV94zkpja7Ok3QvWr
 7lvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=k5s4idfe83F5vogJLuR3WncBIoZZmGepM5no3pwxFcI=;
 b=pAfHooHfeSdKtRJE3aUocQ2vNVdUxiq6qXsN1EK7KjevRZmXtXGJLJm5EiQXOLAa88
 puojGRc3ZgohHk6E90ScCaXuh6J6Vmodl+EMY0xmZELvR/whYM6BIrFuV676k9rqveOG
 hCP36InejHKB3N/9gMEONJ/dbB6kUu43SCQas5HywRJlI9OXdbRxLR022e/WJZmplGdV
 DzlPWXj9VFLnDcsJWM53VxFai1sMdjehVCU6xOoxPK/bxpVLMBc4/qDe/jj4BLnM/r31
 0Jtxtn7/mCR/RFFvLH6xqrupnO8Jc4hxZyRnvsqfyzVumD/yVmn20/yhzstgc93nU1IR
 SMAg==
X-Gm-Message-State: AFqh2kqGkCr7fkIqOTcwTeYUPcz9BCOuE8sLCjXKRpuN0GwINEHI+vlJ
 ZgXwsccPhf8u/cXmqiMB45AaoDvgVnIqZBQ9RAlVLg==
X-Google-Smtp-Source: AMrXdXtCKFM+g2LhjG7EfjC4efaNrIz47gMBL9VmlS0XmoyGN2yeN9kloiu6Gdo1Dskog1UuWmIEqmPE4KdguGw8aEo=
X-Received: by 2002:a17:902:efcf:b0:192:ea33:5092 with SMTP id
 ja15-20020a170902efcf00b00192ea335092mr1562678plb.19.1673262382510; Mon, 09
 Jan 2023 03:06:22 -0800 (PST)
MIME-Version: 1.0
References: <20230109092617.80224-1-philmd@linaro.org>
In-Reply-To: <20230109092617.80224-1-philmd@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 9 Jan 2023 11:06:11 +0000
Message-ID: <CAFEAcA-OZ6E5GdibDH=Fzb6dDBG4bSRU6Cx92HJKiXAcTxcqZA@mail.gmail.com>
Subject: Re: [PATCH 0/9] hw: Convert simple devices from SysBus to QDev
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Jan Kiszka <jan.kiszka@web.de>, 
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-arm@nongnu.org,
 Eduardo Habkost <eduardo@habkost.net>, 
 Markus Armbruster <armbru@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, 
 Thomas Huth <thuth@redhat.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, 
 Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Mon, 9 Jan 2023 at 09:26, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org=
> wrote:
>
> Various simple devices (usually GPIO related) don't access
> the 'system bus': no IRQ lines / memory regions exposed via
> the SysBus API, no memory region mapped.
>
> To reduce complexity, remove the sysbus onion layer from
> these devices.

This will break reset for all these devices. We can't
do this until we've sorted out reset first, I'm afraid.

thanks
-- PMM

