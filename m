Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EDEAD4029A4
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Sep 2021 15:22:35 +0200 (CEST)
Received: from localhost ([::1]:37028 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNb3b-0007D7-0Z
	for lists+qemu-devel@lfdr.de; Tue, 07 Sep 2021 09:22:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57180)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mNajG-0007vo-1X
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 09:01:34 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:39557)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mNaj3-0005Jy-68
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 09:01:33 -0400
Received: by mail-wr1-x435.google.com with SMTP id z4so14308798wrr.6
 for <qemu-devel@nongnu.org>; Tue, 07 Sep 2021 06:01:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=b5jEEzqd0bhK10FNist/D4ePXVJ3XwGaxELBu8WCqHA=;
 b=G5zMqCUuIXbn7jccCH7qhV90HQ9Y75SDEbN7fn4Y/ugrpZnCJChKLdE3qlbJgJi4xN
 BHZkAv/wPf9zcKh3GM0QxD7AGnoGnUOIqSW9DatFLpAR8fhvu0rXGmTLcMREZYzC+DTP
 MnMWDWHqvAHnUmp6/lVwUy99aMw8VFlWquYY54eT15SlPtQUZoiIIwbtv6i/5hBB0IW3
 IRJJPk2AKRCRIieOvuJ1zVb/QuzbJa8fPYnwQPBmigeiUDrRp0rIfeIMCVdlXaFgRPyl
 rvGaaqt65vjMm/PGYJ0uwa1SqzsUC1v853iZ+sP8V5GsQpHjp6XOAN4Q5HEqjzDDAt2F
 FdhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=b5jEEzqd0bhK10FNist/D4ePXVJ3XwGaxELBu8WCqHA=;
 b=NCbqvTdqL98bimbrIYQQw7eFLHaE3yo+gRlzwM8u3znZSH7Ki5E7UF7zmbb9cxA5RU
 LM8wZ0Msdj5WXJCnWTudRdgMe+f5j7JbK48qzbyHN/eAi2L48XuMYn+CsueHOOUi4JCT
 QU3cp+/iUVqGL7rqofqtsrx25ueLAKyyh5gDynbpdF+h6Dby1tUsv9AQOI+qfP6ytKy0
 pKPcT6arO9iQrUAjWBC3ACc29cWqUt/eSTwsiVvB6BocsVzMmEoV3qfWHg2l6Ct7NGSn
 U1sQYQE1skgzp3fl4Zz6StfhAAtN/hdz/EHJ/qjVQLZZh+x/BIVjOU0Hl5kbiAC1HdrU
 0Rtw==
X-Gm-Message-State: AOAM531qNsxFoU5SZtPaZvU3D4rZiIYoSYNIMWP1bnP6tRYXtkqEFTai
 bcJOv+uvjZEovwfQUrSKOdyPjBHZaoDbjvvAfqHiDw==
X-Google-Smtp-Source: ABdhPJzPEqiG2SssRqDA6ZKbtLGFXis2SdHIjSv4bYYz+p0TytEJMJAs1KHFaHTGFqAGef4FEzYeAhy5nximc6lJHRg=
X-Received: by 2002:a5d:4647:: with SMTP id j7mr18871080wrs.149.1631019679850; 
 Tue, 07 Sep 2021 06:01:19 -0700 (PDT)
MIME-Version: 1.0
References: <20210903113223.19551-1-mark.cave-ayland@ilande.co.uk>
 <20210903113223.19551-5-mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20210903113223.19551-5-mark.cave-ayland@ilande.co.uk>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 7 Sep 2021 14:00:30 +0100
Message-ID: <CAFEAcA-S_+ZoevK2JfG3AgwMM-bmG3tVezjLvhNzk+hst+UY9Q@mail.gmail.com>
Subject: Re: [PATCH v3 4/9] escc: introduce escc_hard_reset_chn() for hardware
 reset
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x435.google.com
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

On Fri, 3 Sept 2021 at 12:46, Mark Cave-Ayland
<mark.cave-ayland@ilande.co.uk> wrote:
>
> This new hardware reset function is to be called for both channels when the
> hardware reset bit is written to register WR9. Its initial implementation is
> the same as the existing escc_reset_chn() function used for device reset.
>
> Add a new trace event when the guest initiates a hard reset via the WR9 register
> to help diagnose guest reset issues.
>
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

