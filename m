Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 225EA39A359
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 16:35:01 +0200 (CEST)
Received: from localhost ([::1]:48228 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1looR2-0004zV-3g
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 10:35:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1looJt-0006Hn-Tz
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 10:27:37 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:41537)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1looJr-0000T0-9O
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 10:27:37 -0400
Received: by mail-wr1-x435.google.com with SMTP id h8so6031841wrz.8
 for <qemu-devel@nongnu.org>; Thu, 03 Jun 2021 07:27:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=PhuciOTxGzyt42NozTpQG7KL1ETjDSYk2QrBi6IxQio=;
 b=e+okjPgqMgYm7eX8jb7cgHNxes+OELAp2nBDgBijeQpyyMWhwggFi5VVEkV85+BJZ6
 zkBfGlsmLnIKthWdF5KsFoq0DjAt4mnj3/usLPlugaj+rrqxfKEzQGkHPU6Upm7XDZpq
 Bc1+Ekk2eJkkM4Zk/cFFGy8qlYfHWjfc+7pZ6rCT+Tse6eCfOLQg1YbyOYDKA69JpJNq
 SG2TkoYCLqrjlHuIdkivrtl25PKgQ+KjLMpRn0qEZ62modwc0mnLVfeFyRdef0FhJHtb
 Ed+O9BDB8tJhRBeE1+isrhWsO33L3JORjaflgCuRgbtWLR6JMvH638XVdFOw5CPZ7oMG
 JM4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=PhuciOTxGzyt42NozTpQG7KL1ETjDSYk2QrBi6IxQio=;
 b=QcAgN+LRnGGb36X480sLhcoiIDvrHxf0rMaAdkjLyDETd7PiJArIcYUfvu45QDMQMl
 2JuzzIS5Borgzw0U8oRwGJ1WT0WC3ge44RPJaZs+OyCys4MUwmsLz5KBCL8uqN529iJ1
 3lVjxo36NmTfami3cYoLaiDlEoijk87eBHWwvj32Fm5Kih1WQM0ojUuZ4s93lBZq28GG
 8ZVsG+SRV4klwI3limAafQOny1YreWK8erluWQltBma0QxnZ8ikAMfATtNoCkkFQOsNv
 OeUi6eG2CbmQR8qFzRWSjwAsWyyOfmc5hNdON8FJVu7qEWcdJeyPGC75sdKvFwx2IT5P
 jyAA==
X-Gm-Message-State: AOAM5321RtD6whjigqI7A9nquir484z/XUbT+SlA9srUp65klBHgRtvW
 GUI/WGbLfHMXYuZ4bY5jHnf6SQ==
X-Google-Smtp-Source: ABdhPJz0CGegPFUZL4ToZl9E2hzy/O7XkPw+BAdm1JOaA8ScEhxPhjBar6yedSPcS2waNgh43zuzBw==
X-Received: by 2002:adf:d23a:: with SMTP id k26mr294040wrh.68.1622730453731;
 Thu, 03 Jun 2021 07:27:33 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id h46sm4110383wrh.44.2021.06.03.07.27.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Jun 2021 07:27:32 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 1E7BD1FF7E;
 Thu,  3 Jun 2021 15:27:32 +0100 (BST)
References: <20210525150706.294968-1-richard.henderson@linaro.org>
 <20210525150706.294968-22-richard.henderson@linaro.org>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v2 21/28] softfloat: Convert floatx80 to integer to
 FloatParts
Date: Thu, 03 Jun 2021 15:27:26 +0100
In-reply-to: <20210525150706.294968-22-richard.henderson@linaro.org>
Message-ID: <87k0nb81m3.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x435.google.com
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
Cc: qemu-devel@nongnu.org, david@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

