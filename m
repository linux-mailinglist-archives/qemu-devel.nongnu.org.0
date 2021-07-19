Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0729D3CD696
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Jul 2021 16:28:19 +0200 (CEST)
Received: from localhost ([::1]:42874 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5UFm-0005AM-43
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 10:28:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59024)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m5UEV-0003BZ-8G
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 10:26:59 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:37471)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m5UET-0007qs-Sw
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 10:26:59 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 y21-20020a7bc1950000b02902161fccabf1so12994148wmi.2
 for <qemu-devel@nongnu.org>; Mon, 19 Jul 2021 07:26:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=ArxRg9O/H0Ur0tT6Ee6HWr0R2zhrxnm5DbEFs3RMRKU=;
 b=EOh49NmdQ2AjHEVKrjWC6EIh44fg0OmRHHQbtDKvSR2aZ9Yg04f71f99oDTky/T8Nd
 uELJTX3uSamszFJhEOryd2bSz44EiYzu+1AQTY9GdZL+pa7N6BZakTYRf4zzpqr/y7Cn
 1svFZrhOTWVS555Jo9GDf/KHFjFVMYGnurPaEo9NV56FSPEI4gvZRAr6GCDwpNy1p53n
 o2gcQHc7QUdbbqigbp5Lt3woGWrDXp40md+mMokzgPODvJgsYmJlzdaoUfaG8yDB7KK3
 WDD/ZAFOqy3zdNjRQzLXjWk40QAyyCbkXJA0qmYe3p6iQpatOZn1+41+cZHx94Nb/6St
 VuLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=ArxRg9O/H0Ur0tT6Ee6HWr0R2zhrxnm5DbEFs3RMRKU=;
 b=K3zKT6KTAIFle/6xFgU3m1PnxVjNo7OlVOkVWn41TIH0diWZmopFs3X734MypYlLvZ
 BKUuIqPlLJIcZNg14LIdihHi5AoTvSMWAm8HhJYhgrTNZf9bs1A275S9rsBmGYvM3EVm
 HylBjW1I5jxPdOpo1nN3D0klZ5COr6IDzMoQxhy/RvmARyJ0hp60wGTXLSonELEyHvjx
 +aBwjUYuB5UVewFJionDzk99zINoXBf90r8PBPaCjpnk1j6UcgJ8f3XKt52ZOtrbJxSn
 bclJlsHSWWafzmKQ8BoA+AVFJREWJyQnJtlfhDULqMSaIbkPFOeIqPq+8XK5kKrNlg+y
 aNlg==
X-Gm-Message-State: AOAM530QNXS/+Dvr+7Rv3lY/r5RpGo5l8rPo7c5WwZmmFcv05Wq0aVed
 0axejLHal1DgmgpeilglW5e9NQ==
X-Google-Smtp-Source: ABdhPJyQsbCi5ErD2qHlv7EHkVN2qRmtYdyWEp2Jcr1a3Zt9yoKRsshUUvtJbpM7GXVzKXZ8JPQ/Sg==
X-Received: by 2002:a1c:741a:: with SMTP id p26mr26436975wmc.47.1626704816040; 
 Mon, 19 Jul 2021 07:26:56 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id r4sm20765915wre.84.2021.07.19.07.26.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Jul 2021 07:26:55 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 689071FF7E;
 Mon, 19 Jul 2021 15:26:54 +0100 (BST)
References: <20210717100920.240793-1-ma.mandourr@gmail.com>
 <20210717100920.240793-5-ma.mandourr@gmail.com>
User-agent: mu4e 1.5.14; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Mahmoud Mandour <ma.mandourr@gmail.com>
Subject: Re: [PATCH 04/13] plugins/hotblocks: Added correct boolean argument
 parsing
Date: Mon, 19 Jul 2021 15:26:48 +0100
In-reply-to: <20210717100920.240793-5-ma.mandourr@gmail.com>
Message-ID: <874kcqpefl.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x333.google.com
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

