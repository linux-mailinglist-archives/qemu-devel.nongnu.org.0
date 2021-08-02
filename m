Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47ABB3DD5AB
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Aug 2021 14:32:17 +0200 (CEST)
Received: from localhost ([::1]:36044 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAX7A-0005Rl-C6
	for lists+qemu-devel@lfdr.de; Mon, 02 Aug 2021 08:32:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55696)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mAX3J-0002ay-45
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 08:28:17 -0400
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530]:43697)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mAX3G-0005fY-Nd
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 08:28:15 -0400
Received: by mail-ed1-x530.google.com with SMTP id n2so24175337eda.10
 for <qemu-devel@nongnu.org>; Mon, 02 Aug 2021 05:28:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5NvdzuHgb4ffFMiYWxPTip5iZMm95ZJH/7V6e4QW/q0=;
 b=Dd1L/zTaqYKiZYAPwR1p6BmbEbRmNM0T9oo7WAv2LbQJsJ5tt0DEDlEFruQyeUGFzw
 YeM00FEZfQD7O2TWlWB44rNbSCAD+YdYz2S8O6LuPCcL3spfc2KTr4rkp+3MCnUUWca0
 N41N0AfIGd3Z0XKV3yaklaUMajIHfakRqaU+V16sVpY/GxIvfdNkULeS0AIV79uxtiV+
 qRJ7vavQbkwuvMQBOXG+ftW1OmO8iLJuQOR0A7SyWfJyaW3vzb1jtYRyU6p6XVCd2+C8
 rcnuLJbVnTpzvoB55uAvm3+MyZlyJHqvTR5Rl82fenbH76zaWtY5Kv3j4/QoVR1OaPFn
 OLHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5NvdzuHgb4ffFMiYWxPTip5iZMm95ZJH/7V6e4QW/q0=;
 b=JjZREvJ7eivq4tmpCZl6AufXNJrCOIrgsGtL0NhWD/fPikm17oHHrISfxyZsKgiWNU
 aEqp/HW50XDhYvxZZCt4ukGRY3+9q4XNrwazmdok0QtPtk/LLS/oidnVOeyptZEHqEGk
 Z1cRGFGW+w6NcilYi3MBoh/3AM1o2Lw0R/86Ekxs7sGc/nsLtnED+V0VgZ/x2bOVudg+
 9pJ72yAXLkMJgprN/c8TfUWRxdQWXkTNagp+YvGifJcs8mFTWqPkgMKN+FbiIvq3Hjct
 g3OSUOJMONvpcKGqZYHUxcE2xaCglCOXavWfAIsNWddNNuY5g8AiUWpETtbhtAoYe5hD
 bWEQ==
X-Gm-Message-State: AOAM531On2io7yTh7PuPbKTFuxlepIuQzf96Ip8ME6Ozo2YrekMqvHCy
 xGrcmec3ZDLnJoAjIsXdmsUI8wNv3JLEzEm9vxTawA==
X-Google-Smtp-Source: ABdhPJwoxrONaGU16Jn3mFbMnqF0fODGXHP4HDuMK7MRK/ojKaONrouKBwDcVcUzIG9eau+9aQDUel0E8B6DYi5AMXY=
X-Received: by 2002:aa7:c857:: with SMTP id g23mr18639255edt.100.1627907293155; 
 Mon, 02 Aug 2021 05:28:13 -0700 (PDT)
MIME-Version: 1.0
References: <20210729175554.686474-1-ehabkost@redhat.com>
 <20210729175554.686474-10-ehabkost@redhat.com>
In-Reply-To: <20210729175554.686474-10-ehabkost@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 2 Aug 2021 13:27:29 +0100
Message-ID: <CAFEAcA-ptzXRqVin9d37RkcFyj8CKnWr2kcbu_0WS4-=6aP7sg@mail.gmail.com>
Subject: Re: [PATCH for-6.2 09/10] docs: qom: Remove OBJECT_CHECK macro
 examples
To: Eduardo Habkost <ehabkost@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x530.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 29 Jul 2021 at 19:05, Eduardo Habkost <ehabkost@redhat.com> wrote:
>
> We shouldn't encourage people to keep defining typecast macros
> manually, when we have the OBJECT_DECLARE* macros.  Remove the
> section showing how to define them, and replace with a section
> explaining how typecasting works.
>
> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>

other than all the `...` (cf patch 1):

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

