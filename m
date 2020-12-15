Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BABD62DA5CA
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Dec 2020 02:50:13 +0100 (CET)
Received: from localhost ([::1]:54818 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kozTg-000159-Ng
	for lists+qemu-devel@lfdr.de; Mon, 14 Dec 2020 20:50:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34246)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <osy86dev@gmail.com>)
 id 1kozPq-00009Q-TE
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 20:46:16 -0500
Received: from mail-io1-f66.google.com ([209.85.166.66]:40353)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <osy86dev@gmail.com>)
 id 1kozPp-0004uF-05
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 20:46:14 -0500
Received: by mail-io1-f66.google.com with SMTP id r9so18919333ioo.7
 for <qemu-devel@nongnu.org>; Mon, 14 Dec 2020 17:46:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lbMph9H9udVvUiO6QGKD84i0SqcE29hZ+hhb8t/nLF4=;
 b=ML9n8QP8C8kmgngKlo9tG+q690Gmywj1K/ZhQgFTsyIHT/T5dgeVn7Sow+o/QrtBvO
 i8BPgUsE6UEUtRM1jNiLbo8DlmXK+mvdU71/k2NHz9KJFCn7/ZzASS6XE3SUYqwKUPS4
 hA0jXLCx9oi4CYZxEWgX5KFH+HPEydrA7jjFxJOesXBVvDdwMRqq1CmA+2uQx3+0u5DX
 qL/x3flhzOXGXGPO8iEqw3wNOruWkSGidMap2LMGi3sUhZfPBSxSkyDx/V9nuN4cl7av
 M5G5k9bDMz9Dg3Vib5hqSymuEhwoNFUPlHreBnsllne7ovEkJkn4EhjZ41K/1mPONtvT
 5Lfg==
X-Gm-Message-State: AOAM530VBCh6rNR9h7Xs7A8ngttnjp8xJ3Re2ukI1dFKAzgAbIlZiiL9
 W3gC+o4eUrZhBKRXNKZoOu28QCMNWRk=
X-Google-Smtp-Source: ABdhPJwWk1IqUM/7xRAVmf6oCOnPydTgH8TNICUZUdFC37+Mhi2O1xvBbgW/RfOyvZ2S1iGBzzMNNQ==
X-Received: by 2002:a02:2444:: with SMTP id q4mr23074046jae.43.1607996772042; 
 Mon, 14 Dec 2020 17:46:12 -0800 (PST)
Received: from mail-io1-f51.google.com (mail-io1-f51.google.com.
 [209.85.166.51])
 by smtp.gmail.com with ESMTPSA id y21sm10051229iot.12.2020.12.14.17.46.11
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Dec 2020 17:46:11 -0800 (PST)
Received: by mail-io1-f51.google.com with SMTP id m23so4110563ioy.2
 for <qemu-devel@nongnu.org>; Mon, 14 Dec 2020 17:46:11 -0800 (PST)
X-Received: by 2002:a05:6602:142:: with SMTP id v2mr809042iot.32.1607996771601; 
 Mon, 14 Dec 2020 17:46:11 -0800 (PST)
MIME-Version: 1.0
References: <20201214140314.18544-1-richard.henderson@linaro.org>
 <20201214140314.18544-5-richard.henderson@linaro.org>
In-Reply-To: <20201214140314.18544-5-richard.henderson@linaro.org>
From: Joelle van Dyne <j@getutm.app>
Date: Mon, 14 Dec 2020 17:46:01 -0800
X-Gmail-Original-Message-ID: <CA+E+eSC6=GkY=yESXebV=8GYN7p=OQ9E3DFtBdcGs_1MjJxK8g@mail.gmail.com>
Message-ID: <CA+E+eSC6=GkY=yESXebV=8GYN7p=OQ9E3DFtBdcGs_1MjJxK8g@mail.gmail.com>
Subject: Re: [PATCH v4 04/43] util: Specialize flush_idcache_range for aarch64
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=209.85.166.66; envelope-from=osy86dev@gmail.com;
 helo=mail-io1-f66.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: QEMU Developers <qemu-devel@nongnu.org>, Joelle van Dyne <j@getutm.app>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Dec 14, 2020 at 6:03 AM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> For darwin, the CTR_EL0 register is not accessible, but there
> are system routines that we can use.
>
> For other hosts, copy the single pointer implementation from
> libgcc and modify it to support the double pointer interface
> we require.  This halves the number of cache operations required
> when split-rwx is enabled.
>
> Cc: Joelle van Dyne <j@getutm.app>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Joelle van Dyne <j@getutm.app>

