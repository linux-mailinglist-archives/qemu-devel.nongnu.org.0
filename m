Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B81AE48FF45
	for <lists+qemu-devel@lfdr.de>; Sun, 16 Jan 2022 22:47:35 +0100 (CET)
Received: from localhost ([::1]:54888 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9DN8-0004Ir-SB
	for lists+qemu-devel@lfdr.de; Sun, 16 Jan 2022 16:47:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n9DLM-0002up-05
 for qemu-devel@nongnu.org; Sun, 16 Jan 2022 16:45:44 -0500
Received: from [2a00:1450:4864:20::32a] (port=42629
 helo=mail-wm1-x32a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n9DLK-00081p-8K
 for qemu-devel@nongnu.org; Sun, 16 Jan 2022 16:45:43 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 ay4-20020a05600c1e0400b0034a81a94607so17434850wmb.1
 for <qemu-devel@nongnu.org>; Sun, 16 Jan 2022 13:45:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rS/5E5Lb2l8jEZlqA3tDBWH4b3MWSumuWG5T2NCtlx8=;
 b=LU6goTbjdqGGVIcrZIu0+Gm82G5iFl8VtPT69yKP7BdjQSnuv90CsCCGk92OVccWFc
 lVlxLls88W5bSCrar0wfTekAdXZXMMUEPiCgeTzqjrEkJowiFWhCZJNzQycJRLtKwv4z
 bNH3+NRdrdSBBclw6e/lnjjdwOcgkNgUgR6nYGoV+56cpzf9vqwIk6P+bdQMlgjDefCy
 qteSDH31q+17vqeZtvrv4nmcwzkgKd4HDCL6A90w5Dc3VCBYkNeJpcCPMv/AXe1sWtFi
 9J1m3Kc15e/F7UECnOLbQSpEVneKUREzBqNxs1qMeB4WTvtDfa86t69YuDXV+ffFdIwh
 NXRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rS/5E5Lb2l8jEZlqA3tDBWH4b3MWSumuWG5T2NCtlx8=;
 b=4big4nmDUSSaxYtxyEIRk/CR8I17l1w8Psg1mF/F9JC6vnUkY//wuLz99dYvBsaOYe
 DwyAcEEsGWGec9uAAi3YM/vwK+DK6NXiL2KOV0K/D5BBvHHTA+V0v4xsJ5+T68JJ3JiW
 4Rhr4HU/H4V4JASQoH57PRFunRcfDQi9uaxo9ouuIbGksdzFsYWHZF+8bTS1Aj5e5HlJ
 cjKAlc2cOzpZcKkeO+VsgujMUevenuZsxbex/d0X/V95JXIDe6Juht0TPrmxrgpGPJ16
 fQwVWMTPRV2TClFJgGCAsY/v0XuDLQuroBigjsa9I3kDbMwMhn3R5lX6Y27VJR3nI9R/
 2Isw==
X-Gm-Message-State: AOAM530kn7722Nuhts9fTuoNCYwJQHd5SJWMPdai1rqiGpDwDdKDN6T2
 r1jhJoV+2QzeN1BSi583Iip+/U3Lz4tL6Wr2v66wKg==
X-Google-Smtp-Source: ABdhPJw5rmFRkWxdc5J2XhuGjhk6aY9l5N+ySGqRhoaeh+iQUyTEW7Z2nSfypMqQ4w2PJp1LW2ELH9ZJVjzd0pXMVRo=
X-Received: by 2002:a5d:64aa:: with SMTP id m10mr5928524wrp.295.1642369540792; 
 Sun, 16 Jan 2022 13:45:40 -0800 (PST)
MIME-Version: 1.0
References: <20220116204423.16133-1-imp@bsdimp.com>
 <20220116204423.16133-2-imp@bsdimp.com>
In-Reply-To: <20220116204423.16133-2-imp@bsdimp.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 16 Jan 2022 21:45:29 +0000
Message-ID: <CAFEAcA8vMgXRoNfZvAJrCE43Ojazs_DBV7Z52KHyq6MroDoJCA@mail.gmail.com>
Subject: Re: [PATCH 1/2] linx-user: Remove MAX_SIGQUEUE_SIZE
To: Warner Losh <imp@bsdimp.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32a
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Laurent Vivier <Laurent@vivier.eu>, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 16 Jan 2022 at 20:44, Warner Losh <imp@bsdimp.com> wrote:
>
> It's been unused for 7 years since 907f5fddaa67 when linux-user stopped
> queueing any signals.
>
> Signed-off-by: Warner Losh <imp@bsdimp.com>
> ---

Typo in subject (should be 'linux-user'); otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

