Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D5C59538E0C
	for <lists+qemu-devel@lfdr.de>; Tue, 31 May 2022 11:53:33 +0200 (CEST)
Received: from localhost ([::1]:38200 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvyZA-0007Z8-BE
	for lists+qemu-devel@lfdr.de; Tue, 31 May 2022 05:53:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33684)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nvyTd-00055v-TA
 for qemu-devel@nongnu.org; Tue, 31 May 2022 05:47:51 -0400
Received: from mail-yb1-xb2a.google.com ([2607:f8b0:4864:20::b2a]:36549)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nvyTc-00046s-0a
 for qemu-devel@nongnu.org; Tue, 31 May 2022 05:47:49 -0400
Received: by mail-yb1-xb2a.google.com with SMTP id z186so18703718ybz.3
 for <qemu-devel@nongnu.org>; Tue, 31 May 2022 02:47:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CDtP/tyVgBjM5do7RDzQ0jtvO/DZKSu3NcvevMrgYRw=;
 b=CveQXVeF1A0QtrjrmsAlV3n+4X85YiRf3TmO+42df+AHOPJ950tzJ9FdQN9xLHH6Ci
 sAKkM9PPWBbVLDWxqG2xYN2hlgV2pjV7IF1Na++z3PO2r+ZLFCi1KArp97eTz47ofNw+
 x8+kAhSolH12aEenGx6xFh2eZtT032qot3FGf2suQUDkGt5e7llhfWjfyoq3KK8kqtcB
 cqfmX+3Dom59lGep8UAlo5MKSQRxua5iszsrfS82xFSjrOCNKBwN0j69BWN4r1cXfa1x
 IMvhmUTnvjK/CHpaoObRlM96j/GJR1LEkrkl6VZQ+kibP7sDqw3wiOBfLWMWpTYKwyug
 BA1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CDtP/tyVgBjM5do7RDzQ0jtvO/DZKSu3NcvevMrgYRw=;
 b=ZX6QL1q32DIpGzjNLblsK/Oo4xMOAnUMtCGBCCHZTgC39Xqz7aBcFPh2Sap9/cLELF
 v5o7xBHXWVDX+YvbtQShiWePUKFwS8+UPN1dFkwPF5K4aDP2xFXkCTAHMpYVSLHHpMWX
 VsAMR+pyvmn96r46eB54aXCL5qh1bUSPs3Von0ZFtUjmtW3zMCHCyHdDsEjxZb12Ik6z
 Gvu7tlRTD4vqQULOkOlzAukBI2Fuh23UnFyKrC/u+GYpDqI+kTaY7eRlUMFovrIaW7aM
 dcAyvrt3vu/nfVzii8PZZ0rqtRB6V5jkwN7TgfmUcKBIKhx07qwEc6xykwkNnXAX+r59
 q/Ig==
X-Gm-Message-State: AOAM533hBa1h+dIQPlpsvYKu4udy+BWJuvQgQsduGNCfBcgBKnTdmWkV
 RqACBIq2+NCVSAwRDAuAs+EgHUQgSQO1ZVBMKffL2Q==
X-Google-Smtp-Source: ABdhPJwf17k8z44Va18+F1aLIi4MVrSa/ZKDNGjf8yFy31e4X5tLHrR486VTLshhqseRcD2czmrWgDYvgomN8zJtRqU=
X-Received: by 2002:a25:41ce:0:b0:65b:3723:f73f with SMTP id
 o197-20020a2541ce000000b0065b3723f73fmr19264711yba.288.1653990466342; Tue, 31
 May 2022 02:47:46 -0700 (PDT)
MIME-Version: 1.0
References: <20220531092540.10151-1-cfontana@suse.de>
 <20220531092540.10151-2-cfontana@suse.de>
In-Reply-To: <20220531092540.10151-2-cfontana@suse.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 31 May 2022 10:47:35 +0100
Message-ID: <CAFEAcA8ENs6P6WU8iaPty7-QfZrBAZrhm4DeegUUjGuL4f3UUQ@mail.gmail.com>
Subject: Re: [PATCH] pci: fix overflow in printf string formatting
To: Claudio Fontana <cfontana@suse.de>
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-devel@nongnu.org, 
 Dario Faggioli <dfaggioli@suse.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2a;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2a.google.com
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

On Tue, 31 May 2022 at 10:34, Claudio Fontana <cfontana@suse.de> wrote:
>
> Signed-off-by: Claudio Fontana <cfontana@suse.de>

It would be helpful to note in the commit message how
bad the overflow is, in what situations it can happen,
and how it was detected.

thanks
-- PMM

