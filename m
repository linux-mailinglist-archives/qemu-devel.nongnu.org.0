Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8486A5370A6
	for <lists+qemu-devel@lfdr.de>; Sun, 29 May 2022 12:57:35 +0200 (CEST)
Received: from localhost ([::1]:59746 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvGc2-0008Du-DC
	for lists+qemu-devel@lfdr.de; Sun, 29 May 2022 06:57:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51170)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nvGX2-0006lE-HJ
 for qemu-devel@nongnu.org; Sun, 29 May 2022 06:52:25 -0400
Received: from mail-yb1-xb36.google.com ([2607:f8b0:4864:20::b36]:42679)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nvGX0-0001ue-Uo
 for qemu-devel@nongnu.org; Sun, 29 May 2022 06:52:24 -0400
Received: by mail-yb1-xb36.google.com with SMTP id i11so14803602ybq.9
 for <qemu-devel@nongnu.org>; Sun, 29 May 2022 03:52:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Y+1AHTkeQaZXytjOrhFIQxWbhAdltRP0NRbkOPctln4=;
 b=ApqGPHnGEIlr2AiJBiF/BDvRJt+5B8Z8hAWwxu2FAE3vcifZ7UYMY9hlwiafKD2dVf
 fh51mRfJEWnlOlmsNYNFUZjEuaUUn692MU+ENWMdk51vD0AgBpalBJWlg/0SOEBKy0dE
 UoI5XlPBq35xxduM7l9lmmRB6EwufjYpr+aCzSvO3tn/q9jDsoIL9Q6Rq6aQzVa12T3s
 EiDdHHVfgJJ0gtd1Rx+Rsphy/3as16FXlvCL3K9q81pmWc//xSmxzF71QDq/zgUNLVhx
 BrzcXK5FsZO6Y+7MH+adpTUrTDVf7QPucCJoT+rZDu/axRrKnGZTx9TRitnKJEUCcICr
 ZBDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Y+1AHTkeQaZXytjOrhFIQxWbhAdltRP0NRbkOPctln4=;
 b=GbbTC1y5OBrezpogy22gfSj1H3djuMEVRyjFZ6nemT62ibO1gBTN8bvS1xpkqAF91g
 p7Kp9TBN9FGg7HG77uuRwA77EeUNDis37kuSyRdq7CdSbG89X+vuF4uzo/udPfKg56mX
 Zzmi4nyWwSzJ+ieVZUEXmACTAWMKtbq5SMcFJPj1hkB8LL39/nq1dnH2c98axfX0iqux
 ynMZgG48iv1VYPXc/9XxxivLmtF4xw7rBsYN4AQyEA1PAiMd+ugMnrw3tJ6KBFbLpvdg
 gnRE2iUhEcmtR8ZL1B1FXZ3Up7a7NT3QovdzhUHgtbqHSoUwBBfloh3PUir2mkPfdobZ
 jZCw==
X-Gm-Message-State: AOAM533+myR1Mq+3ZnEaEZ3y5GTYuGcVFOjyXEncDGDfb2f+5ugebxxp
 AuLbgMMAjJ44hGUAPMe8mOZkIOLtLfD6SeuUrNBAww==
X-Google-Smtp-Source: ABdhPJxq+CC8GY65/3WoneRHaKrKE4sIstY33ycvX4SPEkkTrUyCHpTHMtKbbNAIv6avC0s48TEafFG64lXui3ag+Ks=
X-Received: by 2002:a5b:d42:0:b0:65c:a0d7:4c6 with SMTP id
 f2-20020a5b0d42000000b0065ca0d704c6mr5156415ybr.193.1653821541056; 
 Sun, 29 May 2022 03:52:21 -0700 (PDT)
MIME-Version: 1.0
References: <20220529082709.89190-1-akihiko.odaki@gmail.com>
In-Reply-To: <20220529082709.89190-1-akihiko.odaki@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 29 May 2022 11:52:10 +0100
Message-ID: <CAFEAcA8PeWCTqXs2iNzEg=EqRVXQR9WWo1rapTtwtFogEpSG3g@mail.gmail.com>
Subject: Re: [PATCH] hvf: arm: Include target/arm/cpregs.h
To: Akihiko Odaki <akihiko.odaki@gmail.com>
Cc: Alexander Graf <agraf@csgraf.de>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b36;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb36.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On Sun, 29 May 2022 at 09:27, Akihiko Odaki <akihiko.odaki@gmail.com> wrote:
>
> hvf was missed when cpregs.h was split out.
>
> Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>

Thanks; there's already a patch on the list for this:
https://patchew.org/QEMU/20220525161926.34233-1-philmd@fungible.com/

-- PMM

