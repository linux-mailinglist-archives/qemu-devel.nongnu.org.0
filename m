Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65BFF307AF5
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 17:28:19 +0100 (CET)
Received: from localhost ([::1]:53868 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5A9a-0002lB-GG
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 11:28:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58322)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l5A2O-0003Zo-PN
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 11:20:53 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:36747)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l5A2L-0003g9-RJ
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 11:20:52 -0500
Received: by mail-wm1-x330.google.com with SMTP id i9so5054500wmq.1
 for <qemu-devel@nongnu.org>; Thu, 28 Jan 2021 08:20:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=PhuciOTxGzyt42NozTpQG7KL1ETjDSYk2QrBi6IxQio=;
 b=uDgaN0LzsNeT2Lav56ZuxZHrqASRBvQp2MtAVYpoDlKNC2vmiUdDTOfGGck6zqhRMN
 oTashGcxf6HQN+G7MTIG/JNbcVJjt3yI5AkLeVP20f1kZnYTHGVmeuvKNa75YBUtBB1T
 FCiVUfZxOXKsHM2C0IyyuTV5Szs56LpuqU0yfCnG3jeH3EsGav0HBfxUeazEwcs9zNTd
 EozNGq0lGTn1v4+yoF8IgmlwEuBzFYQW/EFOIbCVAwpji3anpYkeO6tOBjGafTedrshD
 nGeRAUS4eYoz32imNvQLh7j+0DMpKQpVKbxghAg9R5+QzmbU7E3gXbw7gOgUqSoQItGF
 AWrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=PhuciOTxGzyt42NozTpQG7KL1ETjDSYk2QrBi6IxQio=;
 b=Uyc2HjCuFZ/QBVB/nuraoebMfiP7qzF1MbuLOifLGprKx4V7pU9liOYcC8oxGEeDtp
 Lc6gzOcO/L2rKxYWep1oZt9/5cWO20uTZOns1Pp5/TkSmCBriE/aIg+GgrAn+0xfaq0t
 gjgD7b/dEAjkOP+42Rlua4MiQ1aU3kIwy38sDHjIu5eplf63xV9m3PyOYX93QwnN1QyT
 +pPy0K0e4Z9/oooyW9H3kHAmCj2uAOwFXloA6rDLbZGirqcHHXK7jElX/C4YM5u0Z2Wg
 UYKSB1iPfYTKJFrnZ/W9wH7sD4nG1X50Joikjo01f5Z6qjI123+0FHOey/sQlaSRIl5j
 n+Zg==
X-Gm-Message-State: AOAM531zb2I7Pi4cAOSQCP/B52wrroa3qNsC4JEu5ZOQElc/FnsW0Lvg
 EcjCSj8+rPbpdsmsl2KEMnWLRrTQ4Qd0JDAp
X-Google-Smtp-Source: ABdhPJySIN2KbeeqvZ9VV3HbUZqDnspHwwcLb3g0SPZngN7Gu445Q72UpKJSw3HOMZiQOjzdZ9r6sA==
X-Received: by 2002:a05:600c:2281:: with SMTP id 1mr29633wmf.150.1611850848519; 
 Thu, 28 Jan 2021 08:20:48 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id i8sm7875741wry.90.2021.01.28.08.20.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jan 2021 08:20:47 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 3E4791FF7E;
 Thu, 28 Jan 2021 16:20:46 +0000 (GMT)
References: <20210128082331.196801-1-richard.henderson@linaro.org>
 <20210128082331.196801-17-richard.henderson@linaro.org>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH 16/23] tcg/tci: Merge INDEX_op_st8_{i32,i64}
Date: Thu, 28 Jan 2021 16:20:42 +0000
In-reply-to: <20210128082331.196801-17-richard.henderson@linaro.org>
Message-ID: <87r1m5t4m9.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x330.google.com
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
Cc: sw@weilnetz.de, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

