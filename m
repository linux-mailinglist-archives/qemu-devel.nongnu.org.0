Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB0EB638C4F
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Nov 2022 15:36:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oyZnl-0006ST-Ud; Fri, 25 Nov 2022 09:35:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oyZnj-0006O0-HY
 for qemu-devel@nongnu.org; Fri, 25 Nov 2022 09:35:35 -0500
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oyZng-0001vE-V8
 for qemu-devel@nongnu.org; Fri, 25 Nov 2022 09:35:34 -0500
Received: by mail-pj1-x102c.google.com with SMTP id
 k2-20020a17090a4c8200b002187cce2f92so7900761pjh.2
 for <qemu-devel@nongnu.org>; Fri, 25 Nov 2022 06:35:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=JefJMFBSFmkP17GXwDa79v4m3sINYqXoUGa8ZeKNzHI=;
 b=TdKD9/DPujGdPF/Cj2oA+ReZrY1zCxZb0anCWG4rLENqxDIgUOZYzjvNyzrlxLrPCv
 YAHMpTCCaYpxT2KVd1Wm066TfwtsmSnAar4SNFAVCxyoztIdYiRJ/DN+nFYES4sVo/HN
 8IPDpWP12gOl8G9Ab1+YK2ibN/n/aO20SukVQX/wtt8aMD9iYigymGhkGR6lmd44ClSZ
 Hdu6i/qUPIw+ep0gzJmk3k6WwN+fKgznNns1U/Y3jxDSYzzvk4Ci9rfW1uKqiN6MMMyw
 vUGmyQEpvoGymgWVx7ygpeb6DwzRfaZ3KcUTnJubJ8dAEBbybR7XbbuEk1bigo4OcKO9
 69dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=JefJMFBSFmkP17GXwDa79v4m3sINYqXoUGa8ZeKNzHI=;
 b=5RAgztHF6GwTx4OQKl55iu9OCMjnMimatInznsVtCngJ4iElfZOzet6+EnqhOSg1ln
 3FXEwI3E3NBfXgz1W2l6HEhDFO1Sqn7UGWIA9vEmPmyPH1tbQ1cy8vooKZdCnZ96OvZ3
 QYH1r/Iv5lVhe0IP/eiIPFU71OMcdC0g7gzczeveuCEzWN+bqFCCacbCpyLgfhzXgK65
 YVxw9Vf5wLZMY45Ksax7vYsOwQW30dVF1MZ0y/xtLsjBoef8QmzB4iRWw1JpLL8H5GKu
 HBGLJiSQJafgpc1j37BTmfPEd85uhr8MyaoUjSYrxiyz0wGbSjmbT9HQZzFwCvqp+ma/
 2nfA==
X-Gm-Message-State: ANoB5pnHw+ulYjLk9qgU+Bz8nMDxkc33hbPGYXknjUJARtybxWfhDa6I
 6ew8wCyZMz1hDriZMM6g9loDcPYW7BMJyaJny8SlPA==
X-Google-Smtp-Source: AA0mqf565c65gz4LGXQUDmS7s5ZmR+4ZgXVwPDMsKCsPskvkPYstMJhTSj7kENDsS/60ljILmydoUiZxLBy8mpeZT5I=
X-Received: by 2002:a17:90a:7003:b0:212:f169:140e with SMTP id
 f3-20020a17090a700300b00212f169140emr39837760pjk.215.1669386931410; Fri, 25
 Nov 2022 06:35:31 -0800 (PST)
MIME-Version: 1.0
References: <20221125143233.60372-1-akihiko.odaki@daynix.com>
In-Reply-To: <20221125143233.60372-1-akihiko.odaki@daynix.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 25 Nov 2022 14:35:20 +0000
Message-ID: <CAFEAcA-uYPHcY2PmezGh190eqHQSaWCgicWonYCj8MbH3-ikQw@mail.gmail.com>
Subject: Re: [PATCH v2] e1000: Configure ResettableClass
To: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: qemu-devel@nongnu.org, Dmitry Fleytman <dmitry.fleytman@gmail.com>, 
 Jason Wang <jasowang@redhat.com>, Yan Vugenfirer <yan@daynix.com>, 
 Yuri Benditovich <yuri.benditovich@daynix.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x102c.google.com
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

On Fri, 25 Nov 2022 at 14:33, Akihiko Odaki <akihiko.odaki@daynix.com> wrote:
>
> This is part of recent efforts of refactoring e1000 and e1000e.
>
> DeviceClass's reset member is deprecated so migrate to ResettableClass.
> Thre is no behavioral difference.
>
> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

