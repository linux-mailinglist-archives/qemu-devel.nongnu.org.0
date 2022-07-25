Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D0F655800F1
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jul 2022 16:48:16 +0200 (CEST)
Received: from localhost ([::1]:40072 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oFzNX-0000gm-Vj
	for lists+qemu-devel@lfdr.de; Mon, 25 Jul 2022 10:48:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57200)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oFzJr-00066L-Nl
 for qemu-devel@nongnu.org; Mon, 25 Jul 2022 10:44:27 -0400
Received: from mail-yb1-xb2d.google.com ([2607:f8b0:4864:20::b2d]:46999)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oFzJq-0006MC-7X
 for qemu-devel@nongnu.org; Mon, 25 Jul 2022 10:44:27 -0400
Received: by mail-yb1-xb2d.google.com with SMTP id 65so5630463ybd.13
 for <qemu-devel@nongnu.org>; Mon, 25 Jul 2022 07:44:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4BpkxqXWTLDh8n31fd0wlZ9m6jDX10RZboaLgk2hdaE=;
 b=Q3srinXrSOu2S4CWOoa/+NcO4ncxVqBYCeHVHUBcr2MARBStyU5e7VXBhgjY2BeuTV
 WCn1ivE3bcP7zWq70EKxEOfBo4eD8lgRPOoGvHZq9Fit6VEbF15eAfUIGC6IzE2FkzYc
 nnPUT55suVwFaNZdfGiZC9rdM1nXA6/o1ZGeiP5KAo1IrkR1edZz/BqusA9CEk6tWAlc
 BuZuOLWRHxHvhHBkE3ZhR4DYhZ5c7mXNbFsBCw9YR4RfFV7YiIy3uL8Y7tii7GeZNiqA
 D4+KHcM/uimuqyzeHAcsu93NaQYmkH1SBeDg4NejFqd3IIhBZbzL6VPDvVXKDJkgLCf9
 2evg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4BpkxqXWTLDh8n31fd0wlZ9m6jDX10RZboaLgk2hdaE=;
 b=k/7zUODjmpIpbwaNKvyc/UYTZl3cU9TqmrMZrHZ2voHfodtTt/WgskxncS8uBBBNHa
 qT9i+n/z4leaq9zXvC5o/7csKyv4ekCF7Fzdrhv7S5GSeGxaxOJWTlZgkrlqTOXk8+z2
 nfg/i93t3Mcg7FW+EP00Rl4O3aD/LpQDAEfbhtKB2bUyU6mpY2PU9VLNal/FTQCTIwXe
 ve1pWxj5VpRrB2PhbF71kug2KQK1UKhkDrjVTAynOz79IrxPxPf7OVRY3eMOls9Vhd35
 fIx06uG0f7c4LQ5Ao7phz/95tpgViVz+84KacWq5oEnFgzbi7x/6dgzMOOPEy09hVb46
 kakQ==
X-Gm-Message-State: AJIora9CjFxQHzqbuf3+oW4RfwE8CNJ3R/cMm/m2K5KwjpRqo/sJsesg
 +vCfJZRm2Y/cM2w8LVMTsTPhPbU1JzX5tpArIKJ9Gg==
X-Google-Smtp-Source: AGRyM1vSJhFgrTmqUGvm/h+w88mSLDAiWFRPoSq1DFHO3lHvYCBNmIebau+l5N06yGumsx3aTxX9MLeW7SbWntrBFEM=
X-Received: by 2002:a25:928b:0:b0:671:548f:fabd with SMTP id
 y11-20020a25928b000000b00671548ffabdmr2123407ybl.39.1658760265251; Mon, 25
 Jul 2022 07:44:25 -0700 (PDT)
MIME-Version: 1.0
References: <20220725142854.177451-1-iii@linux.ibm.com>
In-Reply-To: <20220725142854.177451-1-iii@linux.ibm.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 25 Jul 2022 15:43:45 +0100
Message-ID: <CAFEAcA8d0A8ns1uMtOTaKr+QvYB+XunGNtOuGTbhRFqmPHh7Gw@mail.gmail.com>
Subject: Re: [PATCH] target/sh4: Honor QEMU_LOG_FILENAME with QEMU_LOG=cpu
To: Ilya Leoshkevich <iii@linux.ibm.com>
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>, qemu-devel@nongnu.org, 
 Markus Armbruster <armbru@redhat.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2d;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2d.google.com
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

On Mon, 25 Jul 2022 at 15:32, Ilya Leoshkevich <iii@linux.ibm.com> wrote:
>
> When using QEMU_LOG=cpu on sh4, QEMU_LOG_FILENAME is partially ignored.
> Fix by using qemu_fprintf() instead of qemu_printf() in the respective
> places.
>
> Fixes: 90c84c560067 ("qom/cpu: Simplify how CPUClass:cpu_dump_state() prints")
> Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

Looks like sh4 was the only target where 90c84c560067 introduced this bug.

thanks
-- PMM

