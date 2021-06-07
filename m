Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 978EC39E018
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Jun 2021 17:17:56 +0200 (CEST)
Received: from localhost ([::1]:48668 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqH0k-00083K-G1
	for lists+qemu-devel@lfdr.de; Mon, 07 Jun 2021 11:17:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39782)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lqGzU-0006HB-6D
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 11:16:36 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:42843)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lqGzQ-00031e-8j
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 11:16:35 -0400
Received: by mail-wr1-x436.google.com with SMTP id c5so18025335wrq.9
 for <qemu-devel@nongnu.org>; Mon, 07 Jun 2021 08:16:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=9PNMNbpDdNpbnhii2SZ+ricstKm0zfrYkBJ68lIXzVQ=;
 b=eQOWjWCAF4d71LfZYUqgpseKSCWFxRXUs4F3Myt9LwWIYRpdBsMwiVP/wMRqg8EBmP
 IdWbOnmJHo2rGJDbUNPMjd0M9pbFuRMo96oIX/TU67MU9YHoGpNndAtrR5/ooVpNz0Ao
 kIHc/MFGrBTGRPUkSxSx3mPEERcJeTRVWr8nnqLJ+a1yaNQHFw2L3OomROoSepMCrXg0
 OOAWS+a1wHoTPuNpYPvV15aKZhSnDUuH8NjLliBFwdg3TpGo6EhAfavfse44sZREeldx
 VG1VNRo5aPF7n+wy3zm014DOjhBl1w35IjrNuJhmZB0qyxEUi/qJmeBrbebRXzid0Rmn
 18UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=9PNMNbpDdNpbnhii2SZ+ricstKm0zfrYkBJ68lIXzVQ=;
 b=OTF6WS5tmSV3CHUnZPSdsgwYHkBrJ+lB/ath7zg0Apz8zHszcCJAGivWZUWNpGuF6q
 mzrlUDnUW1mT0KtxFg5VdzKnbJPkxH2zV2NYeN8Xx82y/sVCFYxFpe41t0DqcsxjY9zk
 9RCTA3lug2icWuabgZRMR8aloh51XHdxEXRnZkJ2iKZf2x9AkCpttWTo51jjLX/Jfv9W
 dlwqYJlVZiolKxjABV/E3Ha5M4DT5DFDPY4cuzJ/4UayPiFR4Os4VxUzRoXB/Kn7ETKm
 h5dDV11TLKtkR8UPRfwOcU2z74/2rD0nWEwyLjqYBNMEa5hyA1xqPdmXl3c2+MtuWaj1
 H1DA==
X-Gm-Message-State: AOAM530tSDLw60eBvMKv/KFfIoalzsX7vWWJMqkGH6wFaUNjVAwSIse5
 QJfF12IavI9PxaXWX6EurlDHOw==
X-Google-Smtp-Source: ABdhPJy/piSRwSLOBVmTW1sddCwvC/Y3GGBXeB0isaq9j0pyaAmmju/2eeGNexsBuxgYytQRAeSjnA==
X-Received: by 2002:adf:fd4f:: with SMTP id h15mr17616915wrs.245.1623078989636; 
 Mon, 07 Jun 2021 08:16:29 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id d3sm15897365wrs.41.2021.06.07.08.16.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Jun 2021 08:16:28 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id EC3AC1FF7E;
 Mon,  7 Jun 2021 16:16:27 +0100 (BST)
References: <20210527041405.391567-1-richard.henderson@linaro.org>
 <20210527041405.391567-2-richard.henderson@linaro.org>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH 01/11] softfloat: Rename float_flag_input_denormal to
 float_flag_iflush_denormal
Date: Mon, 07 Jun 2021 16:16:23 +0100
In-reply-to: <20210527041405.391567-2-richard.henderson@linaro.org>
Message-ID: <87a6o1ogc4.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x436.google.com
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
Cc: mmorrell@tachyum.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> The new name emphasizes that the input denormal has been flushed to zero.
>
> Patch created mechanically using:
>   sed -i s,float_flag_input_denormal,float_flag_iflush_denormal,g \
>     $(git grep -l float_flag_input_denormal)
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

