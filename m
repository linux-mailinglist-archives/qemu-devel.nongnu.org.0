Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA64E21F552
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Jul 2020 16:48:49 +0200 (CEST)
Received: from localhost ([::1]:58576 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jvMEi-0003Bd-NZ
	for lists+qemu-devel@lfdr.de; Tue, 14 Jul 2020 10:48:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1jvMDu-0002fc-T4
 for qemu-devel@nongnu.org; Tue, 14 Jul 2020 10:47:58 -0400
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:38257)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1jvMDr-0003nV-Ft
 for qemu-devel@nongnu.org; Tue, 14 Jul 2020 10:47:58 -0400
Received: by mail-wr1-x444.google.com with SMTP id z13so22155217wrw.5
 for <qemu-devel@nongnu.org>; Tue, 14 Jul 2020 07:47:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version:content-transfer-encoding;
 bh=BvOyi1JCtIe2fED893m8b59MPPa0YwmVACrEO06xnxU=;
 b=bBI62cpTUR8ew6OlDLQb9jkyYj4YmkPBOXEkUZgvMDgvon26H+TT4zmYFTrp3J8Qsp
 VCZ63Q+mikiR6gFmEpxN6LAV+CR/DBBKG3b55QvbMeMjByHQV26Xjl7Tq0S5raMbWHx4
 8Ti8FLzVQzaLlhSfv5ccPb6rmiOUvRCn+uYpQg7KAL9O0IcHS/QnSwXKBtfJn46Xx7b7
 49/6aRewnRimlEVyTiO9eQ7agxzXUDvwbhh5yPZ+LEmcI1+2yUFESz7V5dXUkoEHO7+e
 OhQBd5gT2o4/oQc6zvsrpjkfF7smEpWA76+ZxRcAJ1FvURC/oJb2UTg/ohquDB8KjXIg
 Q02Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version:content-transfer-encoding;
 bh=BvOyi1JCtIe2fED893m8b59MPPa0YwmVACrEO06xnxU=;
 b=iwp1FtTihA6yFxRoI49pUN0cJ46Dpot8Dt7G3Z+mqm31e4abOsP9GVE4cDAzFyzYEK
 +lTdAjzm1X4QenWw2yhk7aC9nET3UxtqYe72wS8CG/rAv1lmj55F6KNcccrBlHm02UJ/
 gdCavFPyDv0xPmSJvv5p31kACsHXo2uhLRO0hAHTp5vvFXEk4WMN9OB1Ctt9W1OFKA/k
 xkQ6vE1Sh83lKPxtRhee8K/iQGEDS4AUmONs63FhZC9xXYNUaUSfpj79Kb0wf/oA/liO
 TJasphzCQLXcp050JQzi95s82w7QQd8GdEZvgfW+mEajbfh9HfE/nMyKYuXoHphSSg/I
 19fA==
X-Gm-Message-State: AOAM532Ue/8q1VZ7makpQoARb9TXFIgEBexYK0VqaeWhM5MDLsf+cDgo
 bJNDpI4doWvOHBtApP6riSYNew==
X-Google-Smtp-Source: ABdhPJyz13XVkXX8nGLJ5vkTEttD++95tKTXrTKpaU3rGFdJpAisb69srnDbw9guQP0td4BPoU9KgA==
X-Received: by 2002:a5d:4bc4:: with SMTP id l4mr5797855wrt.97.1594738073429;
 Tue, 14 Jul 2020 07:47:53 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id q3sm4577872wmq.22.2020.07.14.07.47.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jul 2020 07:47:51 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 3C5721FF7E;
 Tue, 14 Jul 2020 15:47:51 +0100 (BST)
References: <20200713175746.5936-1-peter.maydell@linaro.org>
 <20200713175746.5936-4-peter.maydell@linaro.org>
User-agent: mu4e 1.5.4; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH for-5.1 3/4] docs/system: Briefly document gumstix boards
In-reply-to: <20200713175746.5936-4-peter.maydell@linaro.org>
Date: Tue, 14 Jul 2020 15:47:51 +0100
Message-ID: <874kqaywyw.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::444;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x444.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Peter Maydell <peter.maydell@linaro.org> writes:

> Add skeletal documentation of the gumstix boards
> ('connex' and 'verdex').
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

