Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B852B552D90
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Jun 2022 10:54:52 +0200 (CEST)
Received: from localhost ([::1]:36758 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3Zet-0001rM-Is
	for lists+qemu-devel@lfdr.de; Tue, 21 Jun 2022 04:54:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33732)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o3Zc3-0006er-CW
 for qemu-devel@nongnu.org; Tue, 21 Jun 2022 04:51:55 -0400
Received: from mail-yw1-x1130.google.com ([2607:f8b0:4864:20::1130]:36363)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o3Zbx-000887-Ha
 for qemu-devel@nongnu.org; Tue, 21 Jun 2022 04:51:54 -0400
Received: by mail-yw1-x1130.google.com with SMTP id
 00721157ae682-3176d94c236so123798557b3.3
 for <qemu-devel@nongnu.org>; Tue, 21 Jun 2022 01:51:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XsKSp1PBySNdkjvrcr0wzV81nO/dZzxKNhtu1ElnFFM=;
 b=oynQV4QcOnxJFgP7Q7mswt6uWz3/HCakEWKN1WSLQlAQWZPvKMuPHw6SdvzYLxM82Y
 Tg/tsKRkvIN6/v2Hknhyn/Z3Hzy4mAWUHF9jRQfQFbmDhuMgqc5bzs7ZYFX48GZPXSvD
 QKcO+ZdszNnK/pWfn/Y+yhXQWQrJtE2K2Pc+AkoLNACQ2fsz+QYp3Sp+3ginFmOY3s1Q
 qXnXoOFrOltSA4znlCTatw0AN/l/VyaFVMeOIfGcn4LSoy+GzKjFEOLgm0Zry2Km3O7U
 9WTONIc666dm0j2lvWefY5mxdzB0KAZDRsPpjoAhwVCorIC9IkD/njdONneWHk9S+sMU
 C8OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XsKSp1PBySNdkjvrcr0wzV81nO/dZzxKNhtu1ElnFFM=;
 b=6zzxCaOIEuF+CatDSoseMJuBckE9LAmEYxtkw1y+t49Zk6O55T1UbO6fWTn6WFy188
 UzST1piMjFmXwLnvcsRwXv4+h1RJr3f3pXJT8ucuGR10paM9YqOoPiiilc0sCp0qrgbE
 pTGDhf2maLZYAoma4YtQT/7dKyh9Gfp/LOjIonXQGuWGUfwuzmR4gEQaNnCMsXxLhuey
 1kBml8G7LlcCXtwZ7jxM9/+wK/a5RH31C5xo+J2bAtQ76rIwasNtTouNAO8rbyexCnby
 juqaD842sfCxLG2nKqz4vGJqppVf0y5I71d/5fv3/ql5CC4D9kXE0CovUm6CgEKCyQa0
 pTcw==
X-Gm-Message-State: AJIora/nMGCb8y3OTNeafZqfkqv/lYlqZZeet2zuHure0KVltDlCvmrE
 bg2R++c8xQBPCCS9iH2WGWdx+wqdh7zrBsb0amMsdw==
X-Google-Smtp-Source: AGRyM1vQZkma9AvDT6fJbXdooK1KlAow51d89s9ahJz69UyUF6Sr2j4N87PWmUs6PRq7frSE2CZN294nhuJd7SUlZAs=
X-Received: by 2002:a81:8d08:0:b0:317:a4cd:d65d with SMTP id
 d8-20020a818d08000000b00317a4cdd65dmr16248558ywg.329.1655801508690; Tue, 21
 Jun 2022 01:51:48 -0700 (PDT)
MIME-Version: 1.0
References: <20220620202921.21062-1-akihiko.odaki@gmail.com>
In-Reply-To: <20220620202921.21062-1-akihiko.odaki@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 21 Jun 2022 09:51:38 +0100
Message-ID: <CAFEAcA-xUnoM9NSuqdgx6i3n==fk+Uxr3_5dk3hqdWvucwZ6oQ@mail.gmail.com>
Subject: Re: [PATCH v3] ui/cocoa: Take refresh rate into account
To: Akihiko Odaki <akihiko.odaki@gmail.com>
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1130;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1130.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

On Mon, 20 Jun 2022 at 21:29, Akihiko Odaki <akihiko.odaki@gmail.com> wrote:
>
> Retreieve the refresh rate of the display and reflect it with
> dpy_set_ui_info() and update_displaychangelistener(), allowing the
> guest and DisplayChangeListener to consume the information.

But why? What goes wrong if we don't bother to do this?

thanks
-- PMM

