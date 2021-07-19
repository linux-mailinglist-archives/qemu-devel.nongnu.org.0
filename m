Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FE233CD4EE
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Jul 2021 14:40:20 +0200 (CEST)
Received: from localhost ([::1]:52920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5SZH-0005sB-9h
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 08:40:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39738)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m5SXx-0004ct-IC
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 08:38:57 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:37695)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m5SXv-0002kv-Ji
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 08:38:57 -0400
Received: by mail-wr1-x429.google.com with SMTP id i94so21853601wri.4
 for <qemu-devel@nongnu.org>; Mon, 19 Jul 2021 05:38:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=ArxRg9O/H0Ur0tT6Ee6HWr0R2zhrxnm5DbEFs3RMRKU=;
 b=rxVbo3Lwl6xaryQrMJGM0ObbLMmgAPHNaLRr6l31aQOCsITy1RkrcYEv9DsF6KJvDp
 5e6pRLCDMUpmueVYRMJfFX+RH8kz0rNV0wuD6ZAu1HQ1/k2ZwOqFZmtEdwDdFbSR2NgV
 aRc4hcmJbhOtc25CQA7p8iwcfgvOB0rQ4HviuPLFxgmqsp+nNNrJvXQn7FQhBcO85/In
 QLF5f9Z0bv2zi86cu1AW8Fxjj2O76JY2Eb20r8P4lUEibIytAX/WCeDClfjcX0honXae
 sQu4JxkindQVxY+WmMVoTzNaa6z/QNHobZkI4yKwTR25wYvacJAwBHyFW4Jyr0Xr6YlX
 Q9gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=ArxRg9O/H0Ur0tT6Ee6HWr0R2zhrxnm5DbEFs3RMRKU=;
 b=bAbb4tuokqpBUtssUamAfAIlEfNef1mmbG+96sw2yE3uw4C8eyjGQ2YlBJsW/6FfbI
 DlpFHg4/adVJY6W+vzIQ72IjFEklK9FX92ZN/W5lx3T36SWLQkJ9ydBBZ4P3CdpxtWFn
 R0HuOp5N/a+WbL3J4r9t/rgAyVYHN3LcQySErPp1eZoRmRfGctxP6+nlu8hXK28T80ag
 uW0oW1fidpm1dsLps3Aon+kcXG3dEShTLhcTJ1i5eCOSg/lMjNsMUC7zL4l+LttOKB9l
 K64b2qOSmptD6Aq9biNOv5INyUspLVlcQoSFAjvNDlEFmiWmeXqjEBKxgP7bT99Uu/0u
 pZJQ==
X-Gm-Message-State: AOAM531a+gdPFFTj3Lip4+64KbPxnx7RJ5Z3xuLVxDVcUF0PXKoQp1cp
 GOrNcVOsCjItNmDNdG+Z/LE73Q==
X-Google-Smtp-Source: ABdhPJyg5tLWFQojmdaf8mgBo37XiTfHzPwWCpk8C8yfvP1AiJEl7aXJMKYh0QaWbirPE7a1qXgSUA==
X-Received: by 2002:a5d:4e08:: with SMTP id p8mr29283311wrt.425.1626698334147; 
 Mon, 19 Jul 2021 05:38:54 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id z16sm21017048wrl.8.2021.07.19.05.38.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Jul 2021 05:38:53 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 7DC1F1FF7E;
 Mon, 19 Jul 2021 13:38:52 +0100 (BST)
References: <20210714172151.8494-1-ma.mandourr@gmail.com>
 <20210714172151.8494-7-ma.mandourr@gmail.com>
User-agent: mu4e 1.5.14; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Mahmoud Mandour <ma.mandourr@gmail.com>
Subject: Re: [PATCH 6/6] plugins/cache: Fixed "function decl. is not a
 prototype" warnings
Date: Mon, 19 Jul 2021 13:38:46 +0100
In-reply-to: <20210714172151.8494-7-ma.mandourr@gmail.com>
Message-ID: <87r1fupjfn.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x429.google.com
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
Cc: cota@braap.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Mahmoud Mandour <ma.mandourr@gmail.com> writes:

> Signed-off-by: Mahmoud Mandour <ma.mandourr@gmail.com>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

