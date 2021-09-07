Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 735234029B6
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Sep 2021 15:29:41 +0200 (CEST)
Received: from localhost ([::1]:34704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNbAS-00085P-Hk
	for lists+qemu-devel@lfdr.de; Tue, 07 Sep 2021 09:29:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35412)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mNasw-0000uP-6G
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 09:11:34 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:45044)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mNasu-00010U-Pw
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 09:11:33 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 l7-20020a1c2507000000b002e6be5d86b3so2194175wml.3
 for <qemu-devel@nongnu.org>; Tue, 07 Sep 2021 06:11:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nmeCPw5p8/uJXCvYkdMx31b+5cnEI/MVBuGDsa42jjo=;
 b=eyVhZrEJjCzhjJ7XYWLBfGbi4ebFUJW2MNCodhl10XilMBcksA8JKaWGT78l131lUD
 26GOxn5EOGAunMubiBC2bSbHby6QIh0qBqeZtZfi9iAYRM7wYToWJms2SpxWMYMLbMnW
 0uQ8S+f4NyAtKELNI9oPP5lcP/7/QEoIwYwAq5G8EV8Yc8OaQfDPoe4a0+JvvgXa7v7x
 I9Teg8h4TIFYatq5rIVnIwODtvczHFh+Fgm+Yzfey1m8a8msVqZFMavTPh4nSZXe8SMD
 e3tYMVHeQ5cqUD4RHxy4iSwGcUN2uSrvKRQXBo6MeJui3fHJ4b/GiCsRStzxpwtrHcWI
 mhUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nmeCPw5p8/uJXCvYkdMx31b+5cnEI/MVBuGDsa42jjo=;
 b=Ik8v3qraWCivFJNaf5tnxvBXBsQVF0MATxfzRGvjWPR1iAqb6QNcgrefYM4LB9te+n
 9FyZ0eZ0OD07QgPZXNJnp/xcvftozqz12Li43oz3yNkp35xXQT1a54oAnu2gb5WMJKIe
 Zuqv/GLYEe53St5X5LeeQjIUcNj6LRi36VLGHnq/x1273J+UsCj7n0+rm5x8PqsdJJzP
 ofXUGf5Gl/j7R9zhQPbytG841tCP7dFtOtaQ6YT2MPiG64lf0mR3qRMQvF4OeDkhBikM
 cpvzPWPvgJfwegGko+6I2hHHn9WGlDCqby58HWvh/PrrXI9mxtOgpL3+WJAQhAt7Va2t
 2Lpw==
X-Gm-Message-State: AOAM533vXGh04/TZtCBElE69VT8XaJVUJv3dNGIVWJknlZqlMvOauQ6X
 FFtK2BesYvRhlfjCLKc2ghkRu1h2E6XWrQZymGhdAA==
X-Google-Smtp-Source: ABdhPJxLix+T1HSIWPLN2Z51bZK5SWIVpdJ/EqQhwfh8SSTR3JRAHxHyvPGl9UTT1Z41b4FXeF8hA2yMEdjxrZvk+TI=
X-Received: by 2002:a05:600c:4fcd:: with SMTP id
 o13mr3948478wmq.32.1631020291248; 
 Tue, 07 Sep 2021 06:11:31 -0700 (PDT)
MIME-Version: 1.0
References: <20210903113223.19551-1-mark.cave-ayland@ilande.co.uk>
 <20210903113223.19551-9-mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20210903113223.19551-9-mark.cave-ayland@ilande.co.uk>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 7 Sep 2021 14:10:41 +0100
Message-ID: <CAFEAcA9+=Rv0QJFj6m2ijTD9bTS-4CoBNu3wDmVXZ_-Z8mpFiQ@mail.gmail.com>
Subject: Re: [PATCH v3 8/9] escc: re-use escc_reset_chn() for soft reset
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x334.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 3 Sept 2021 at 12:54, Mark Cave-Ayland
<mark.cave-ayland@ilande.co.uk> wrote:
>
> This removes duplication of the internal device state initialisation between
> device reset and soft reset.
>
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

