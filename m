Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D571D552277
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jun 2022 18:45:03 +0200 (CEST)
Received: from localhost ([::1]:47136 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3KWM-0008Om-VC
	for lists+qemu-devel@lfdr.de; Mon, 20 Jun 2022 12:45:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56424)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o3KUh-000787-Sw
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 12:43:19 -0400
Received: from mail-yw1-x1131.google.com ([2607:f8b0:4864:20::1131]:44913)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o3KUg-0007wA-Ca
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 12:43:19 -0400
Received: by mail-yw1-x1131.google.com with SMTP id
 00721157ae682-3176b6ed923so106061347b3.11
 for <qemu-devel@nongnu.org>; Mon, 20 Jun 2022 09:43:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VsnTbMdEHmcoTQ6adslI+V2n/dboZlaGXQ4U64zov/o=;
 b=NluNerT5rZnpugZP9Cf0taekyRB5ACmIuFrAW0V1VEPqZIMLFmLefQ3igEVyAMlbrq
 9ndEQBumso8beQPlVYzjEU5lgJMxpmvr1AvT5Q5dV1rrO4Gx/zaWVC7FRir/bqAeySu0
 XLRBERwjmgTErCjhPEjiKPqWNZuttSESjw8v1057EgNnBL/ZhXmDML7aC4lC7hMnf6a0
 wsf1iUSUcXqw0VJ4gdQo3Aplua/e4qAr48KPlVXPm89qfguuwnC6LL47JTgEjMQfc8E0
 +DRIAUhAPRoyv7k5eL6ho+//4TZGf0a6JZkoV9WCXfS0Qo/pJe4DqNNK4DcopmXDFNhw
 LTvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VsnTbMdEHmcoTQ6adslI+V2n/dboZlaGXQ4U64zov/o=;
 b=3vEFvTqEDlGEUJBjL5TB3+TmzW00FChbfKj0aMoDZywbc/TT57jkEDNnllZwWpBvaU
 4+9u7MF5Ugp+ma5sG9VdG+yFTq0fA5WdX88Bg6bUiQZHBvSj0g8A1EAZYxbyUA7voLDE
 Nhn8iUDEIA4pPyr3JBQJVC5lKkuJ3iCwDq2rjTcGAF1UyHLCQFILEzKZSm9pib0nGRso
 pT6apI6UKyYPOSyAjRn6eWmSFeWF4A6WVBgriIBWEIduL4KIANZTil0pE4ptZN1eoRrQ
 QXpmObXRxGpoSj9BE50qqhxGYnxWG1jIk9fTgzdCmDJVXIlvbgwAD6jDMBZs96SoLqBA
 9EiQ==
X-Gm-Message-State: AJIora+gs7Po8hVuelsJyAqxu9v//xEV/K95QJ0jKPNf2GHeL1RfUwUP
 2pxm3ZTCnM84Sa1gXbwpziJQHQevN5+Acz5dTI8Bkg==
X-Google-Smtp-Source: AGRyM1tEPvXK1CvbewZSR7h0TUwOA3mdtsPfldTANMhY3eiw6Ai9nUrMZ0OuNw6efKbM6Xm8W3xpEuvWYxBVlHaqSTY=
X-Received: by 2002:a81:106:0:b0:2d0:e682:8a7a with SMTP id
 6-20020a810106000000b002d0e6828a7amr28101397ywb.257.1655743397321; Mon, 20
 Jun 2022 09:43:17 -0700 (PDT)
MIME-Version: 1.0
References: <20220620162825.19977-1-akihiko.odaki@gmail.com>
In-Reply-To: <20220620162825.19977-1-akihiko.odaki@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 20 Jun 2022 17:43:06 +0100
Message-ID: <CAFEAcA9KEZxv19FcV_Y8ZfOecY_aeNNWrQotZVpKK+=DikFMcw@mail.gmail.com>
Subject: Re: [PATCH v2] ui/cocoa: Take refresh rate into account
To: Akihiko Odaki <akihiko.odaki@gmail.com>
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1131;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1131.google.com
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

On Mon, 20 Jun 2022 at 17:28, Akihiko Odaki <akihiko.odaki@gmail.com> wrote:
>
> Retreieve the refresh rate of the display and reflect it with
> dpy_set_ui_info() and update_displaychangelistener().


This is still missing the "why" of the change, which is the
most important thing to state in a commit message.

thanks
-- PMM

