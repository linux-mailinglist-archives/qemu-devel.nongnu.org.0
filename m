Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4295969D176
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Feb 2023 17:41:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pU9CE-0001gY-F3; Mon, 20 Feb 2023 11:39:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pU9CC-0001fQ-50
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 11:39:20 -0500
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pU9CA-0005ap-Je
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 11:39:19 -0500
Received: by mail-pg1-x531.google.com with SMTP id q189so821310pga.9
 for <qemu-devel@nongnu.org>; Mon, 20 Feb 2023 08:39:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1676911157;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=HDXMvHASq77DJBZWd/uBnhP5N1Mutw0f3xN+JB6m6VA=;
 b=sCOszksUzOAxDyH/0d1OeQyUB5XRRUpLho7w2GqALdDpi4Eh3Wuil+/BpSZDWfZXPm
 tHB6Umby/jfE3bg5WIQV9ZL7zvwV4Zpv4OctDx+C0aoh+5t6rFwUP2lNp6ZKOXIwyDf4
 IQV+FAGC9An8ckxQ9q4lV9wOYl+Bv1J6WuBTxvBeV+g1Aiv2jTz2XlExsLOTVLPsaids
 HH09TPSJTbbFCU8d8Aeq1tqjLJnr116ii6Tf31UipLhXHT6iKLXYJYDchArYosrSezxk
 o2LuyLjmZsVnNfceCkgvbaWNitX5wnnr7E2LyBrFzRhQL5q9W9m1A9GgiuyZaxZn09YG
 5Zpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1676911157;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=HDXMvHASq77DJBZWd/uBnhP5N1Mutw0f3xN+JB6m6VA=;
 b=wALEzx+KCqcclj+WPKE0YjgM7a1KfqZytB1+ZBAp9v1gjOaT6/NBDG7IP6BQA9VgX5
 uvVss7F3HC9b0kXNa3NTcAARCbyKVuLF2m4rRFrsLMCYS5JVWpdPKsmIQ2YVTWWRaBRM
 i3K4Dv0pUp0bqU9gnQHnGQv2KxXIL7Xp4VFBPeSmxp2ICivvWWVtPpjqIYtpn3OOHfRr
 4Mpl/a6oKCVqRi4BrOePHiKW/+kuRYmWsZ/kzuRUOOTuuhnDWa7k1aTQOnJZ9GFNFSd4
 ED9PAJOrV4O3M+i1oSjL/ygIWMxH4HkNR1VBR28vTIdIHVEsyuTuBnkpa+OxIYEFVa1R
 gGMg==
X-Gm-Message-State: AO0yUKXK3lWb01juFmaNRyGNE8tRtBr530U73NINn0pt8QWs237OqZUr
 wi1Ui1KU/X6Ou4crpsu2WhSGxREsB6CrkscjdkQgoQ==
X-Google-Smtp-Source: AK7set+IQANr2mi1bwgda1kuOEOY/PdH8zdjdHa9Wdj3P8CESWdKQA4IzEgQT36lswKuIAncpHVPrVH02WlqmxQNMuM=
X-Received: by 2002:a62:164f:0:b0:5a9:babe:6cb9 with SMTP id
 76-20020a62164f000000b005a9babe6cb9mr407548pfw.48.1676911157144; Mon, 20 Feb
 2023 08:39:17 -0800 (PST)
MIME-Version: 1.0
References: <20230214163048.903964-1-richard.henderson@linaro.org>
 <20230214163048.903964-11-richard.henderson@linaro.org>
In-Reply-To: <20230214163048.903964-11-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 20 Feb 2023 16:39:05 +0000
Message-ID: <CAFEAcA_9uk6yiNxF6XgmC-A1E9Lr6hUK-HN_YQGMRA3-BbqbVQ@mail.gmail.com>
Subject: Re: [PATCH 10/14] target/arm: Create pauth_ptr_mask
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x531.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, 14 Feb 2023 at 16:32, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Keep the logic for pauth within pauth_helper.c, and expose
> a helper function for use with the gdbstub pac extension.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

