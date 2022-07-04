Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B2DC565798
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jul 2022 15:43:54 +0200 (CEST)
Received: from localhost ([::1]:33904 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8MMj-0007EQ-Ea
	for lists+qemu-devel@lfdr.de; Mon, 04 Jul 2022 09:43:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35248)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o8Lx9-0001rv-J4
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 09:17:32 -0400
Received: from mail-yw1-x1135.google.com ([2607:f8b0:4864:20::1135]:46808)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o8Lx8-0002Hl-3h
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 09:17:27 -0400
Received: by mail-yw1-x1135.google.com with SMTP id
 00721157ae682-31c89653790so30909767b3.13
 for <qemu-devel@nongnu.org>; Mon, 04 Jul 2022 06:17:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=564pBxtI/Qs8v5G7yARGXclhYm5LNcwfbvu45yPeV+8=;
 b=wrFlLWERErlDk/emRgb1GVpkwx+pRoa1wt6kZA8YhG/e9E1HekaROKeIKdcGKvB6gJ
 OPMDPjd0g4j1j5/U2+DbWiKTwSlbrhx9cKvMKD2gyaJ3Bp868vN49csfxLulgbMnHuCq
 h2HQEjkPtiWB0tROKBh3n/Oq1tkbEHwRkrQbCYgPgP+W6/3bpKBprYUR+7z57geUHxTn
 aurn7Dof/f92s5Z0P+ZljZ8FwdXRWDL4vt7TD70AzViY72zak6OqznEWIPFK25NAwR5n
 /im91KbLPHuvx0g+OZvqCXiUYTz7ajAgrpGeM9nNx/4UGAQJzULMsdW2bNEDXeoXaQlT
 Q0KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=564pBxtI/Qs8v5G7yARGXclhYm5LNcwfbvu45yPeV+8=;
 b=FFSbstnhmIsMuFrQ3vjuYYPDIlVYcncTaUY7JDZI8SBfCKvTfPLtM3Zt41OIeM1D/R
 /0EWNEeOhYN5ddEZ13kL9tX8LkuGUcAV2XfhV2q6rZWc7j6Eq9yXGycssjJA/DA4L4xn
 CwJL3a36arjO4outxmxb6Mvt3fh8fki0mOo3ZkXoe32JDkmPYHX6w8PmihuR4ilNh0ph
 vMjDdNCUVoJyZQyykVcNqkZQwaMjzETeNRHEs6y3Iz35ISua975qy8WA0wu5WCC+x/hH
 XxWLM6OhGPZzDeXxor7v8wyF+ZzyuQ9Zr6uC1UpFHT+kuBKjw3Uf1jiSfNfneAKu6b+T
 yR1g==
X-Gm-Message-State: AJIora+Nv+JiV+OJ19ZxyfuNP5UBnoD2n6A1JpbByuskJA8ZgsHSIz3M
 KvUDRIW2wMVDglqDuPwObnbfQEihrBmMZD8PjKN18w==
X-Google-Smtp-Source: AGRyM1vNb9BLFv+Ycn29IjzhAnGjuNEqHhxuPbJbpl/S1Ut8qgtLhJ4gbj7iEqZ/VJGd57+pJRrnG6iH2rrpX3KhZ0k=
X-Received: by 2002:a81:6585:0:b0:31c:b55b:dd36 with SMTP id
 z127-20020a816585000000b0031cb55bdd36mr797772ywb.469.1656940644339; Mon, 04
 Jul 2022 06:17:24 -0700 (PDT)
MIME-Version: 1.0
References: <20220629124026.1077021-1-mark.cave-ayland@ilande.co.uk>
 <20220629124026.1077021-8-mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20220629124026.1077021-8-mark.cave-ayland@ilande.co.uk>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 4 Jul 2022 14:17:13 +0100
Message-ID: <CAFEAcA9=6ueOAC9FkuYuPcke2ph5SbdAJjpeq79vT6E9rVDbJw@mail.gmail.com>
Subject: Re: [PATCH 07/40] pl050: introduce PL050DeviceClass for the PL050
 device
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc: richard.henderson@linaro.org, deller@gmx.de, svens@stackframe.org, 
 mst@redhat.com, pbonzini@redhat.com, hpoussin@reactos.org, 
 aleksandar.rikalo@syrmia.com, f4bug@amsat.org, qemu-devel@nongnu.org, 
 qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1135;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1135.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Wed, 29 Jun 2022 at 13:40, Mark Cave-Ayland
<mark.cave-ayland@ilande.co.uk> wrote:
>
> This will soon be used to store the reference to the PL050 parent device
> for PL050_KBD_DEVICE and PL050_MOUSE_DEVICE.
>
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

