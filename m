Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 072304F7EF8
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Apr 2022 14:28:13 +0200 (CEST)
Received: from localhost ([::1]:33484 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ncRFD-0004Qj-Ju
	for lists+qemu-devel@lfdr.de; Thu, 07 Apr 2022 08:28:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37082)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ncRDt-0003d5-DK
 for qemu-devel@nongnu.org; Thu, 07 Apr 2022 08:26:49 -0400
Received: from mail-yw1-x1131.google.com ([2607:f8b0:4864:20::1131]:45843)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ncRDr-0005x0-Np
 for qemu-devel@nongnu.org; Thu, 07 Apr 2022 08:26:49 -0400
Received: by mail-yw1-x1131.google.com with SMTP id
 00721157ae682-2eb46d33db9so59337827b3.12
 for <qemu-devel@nongnu.org>; Thu, 07 Apr 2022 05:26:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mzZGWDaJsBDm7rIz+wfUIoPSZfOF1dUQrfqrnxU8BJw=;
 b=UjHYEkSnRcvAE1UrEb1ZpJzAnLu7N+rS+zstEDaI5252G2dnr0Z7TsDgnb1HeeTPud
 tEta+5ObYIgg0LQmB++UYlJC5JTZPeLdjN3cPISqU23ja7iprnbvGSP9sIYroUXymMs0
 UPoGyJfyw5CkjHzNDj51hmsAcx4fYagGgI535TxKzMlVWIjVfzmV9gs3yV/CGzXdz6cY
 fNRx9jRqqSCe6KCfl0p8Jo411e31tzDVIy6i8ZDLofbvBt1QK//lHHseIqAxyzXoIiMD
 P3aniWnhu+yVEWMhNFPDlGsxrPaFo0f6CdPnYkCVfW/DhB69tjJlHxeeLJB6sKwpzVbZ
 0v0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mzZGWDaJsBDm7rIz+wfUIoPSZfOF1dUQrfqrnxU8BJw=;
 b=YRUl6q8YPN1EDY4fxaHO16eD4WuBQneq4YQJV+feJTzeCKD9kuTDnVZ5KA6a378JEZ
 agea6T38SaarYFGtgcOYuk1/WF5CvPqOF6ygAkySm7L7jqXJMYa1Sw3xsE9uDxHZ3Uaw
 46Xyo9XY8UzdKZYA7lD9l+Dsti6FFoEA9touoR28dyWL18EKc/+a8oQknrd4sQHvJXZ4
 yzDbTEXoH9AFXPpzw1RQWMZb3aV756uwIQCgbqXouRXD99wFQuAv7ZigS6rBmkTgsCkU
 eWYdNNs6MDusRljlxjOyB4Wpqsyk5AM6CjhD7+p8H49fEwNlGbPREiWEqnBvRaRTgk1T
 4qEQ==
X-Gm-Message-State: AOAM530bOLpCbqlK4wxhFNPAgkREFNd66YfPWF9uFAuQ1UG88OoLtYuy
 lf28ySelIfHaBqRRinyJoLL7X0nQlSLdOskZCPigZw==
X-Google-Smtp-Source: ABdhPJwWqr9qputUHg+eSCvJV2Dn/Yy4fIUhALEPecEAxZOY4DwV5wDMgzGogKNDyo6xqp1gdYVjRIYqJgAeGSxWP+E=
X-Received: by 2002:a81:4655:0:b0:2eb:2e0e:9d47 with SMTP id
 t82-20020a814655000000b002eb2e0e9d47mr11063884ywa.455.1649334389772; Thu, 07
 Apr 2022 05:26:29 -0700 (PDT)
MIME-Version: 1.0
References: <1465913645-19346-1-git-send-email-peter.maydell@linaro.org>
 <1465913645-19346-29-git-send-email-peter.maydell@linaro.org>
 <CAFEAcA9z+BCgxa-M8EM3naC-3A4khLcS-MZCd-WjKg8JBddtTQ@mail.gmail.com>
 <19e26661-8fe9-0e77-d21d-91ab214af42c@yahoo.fr>
In-Reply-To: <19e26661-8fe9-0e77-d21d-91ab214af42c@yahoo.fr>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 7 Apr 2022 13:26:18 +0100
Message-ID: <CAFEAcA-3CiakOSZz20xr5J4S+ST-dm21-gWUug06NetXQwy93w@mail.gmail.com>
Subject: Re: [Qemu-devel] [PULL 28/30] introduce xlnx-dp
To: Frederic Konrad <konrad.frederic@yahoo.fr>
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
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 7 Apr 2022 at 12:28, Frederic Konrad <konrad.frederic@yahoo.fr> wrote:
> So I'm not totally sure.. do you need a patch for 7.0.0?

It's not a regression, so we can fix this for 7.1.

thanks
-- PMM

