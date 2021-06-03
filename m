Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70E4D39A345
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 16:33:28 +0200 (CEST)
Received: from localhost ([::1]:43046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1looPX-0001Re-Dp
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 10:33:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34838)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1looH0-0001hE-AP
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 10:24:38 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:40574)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1looGy-0006xR-NK
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 10:24:38 -0400
Received: by mail-wr1-x434.google.com with SMTP id y7so1418669wrh.7
 for <qemu-devel@nongnu.org>; Thu, 03 Jun 2021 07:24:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=PhuciOTxGzyt42NozTpQG7KL1ETjDSYk2QrBi6IxQio=;
 b=nNNBqmmwahyBxahwjL2isJsGJJnYVmMpwSl0Qz2GAEOQCn/yzzchpFssmIeTnmXFPG
 eDDRCBLk/46AmRxcY5dwc4n/LlBdttQGGz6hHstySmDRAk6jQWcuqGuZAl33qwr4RnCW
 jTcJ1q1DLrecNMHx9WRdMSfGF4QzkOz/1XQoT0YI957UtdJyu8dzJhu/IeZbCn9dJqvm
 ZuUIlmIhxxACPg91I3m3PmaNFrz0O9nl7Urt2zDDyAjXEkiszrbj66CFafVuGg8qA9eq
 PF+PlCdmQN4YhuHeDsf98tHq6vSjQQUepP4dSNOAG0Plwi8nk4YquqRrwedFn5szUZrG
 dEyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=PhuciOTxGzyt42NozTpQG7KL1ETjDSYk2QrBi6IxQio=;
 b=lJU8zDVHGWXaSrQVIfAcKFHIcOfwQGOf4dUFbOfv8FbpoCY3ukP/ovmW5iEuTN7Dsj
 SAGPaDyih9AVQ973kGYhF7jNp1azWCfRkV+kpPZa+6nIUaijdUAqIJyO8HJQkXKroxUX
 9DgWg3p69ehPs9y5h1q44Vwk+t07yC4c81JxN+ua66/ieGFZjwvE3MVjidXaAHu2kdMg
 R/K+dBMLZ556fkKjYhDMXK3t9hN2HGsL9c4wBvZqqMDqhkPOpQ5c2p++aXddYsaHLHEC
 q0exE1JHH3TP7ZzR/gSBToneN9NNwCGU3C+FkD0qK+fdZu+pcAiXldAqxker2WjiGRo5
 WOPw==
X-Gm-Message-State: AOAM531W4z51pJNprHeUuUWCoiOTbdNMzagAIkYLuk6SvgvXYOV0GQaN
 uPMWzucOo7HPgjrmupRfz4rfTQ==
X-Google-Smtp-Source: ABdhPJwhROAIkK4PXsFHoeudK6qfew9dmXmjRDEqFrSkm+mulbYN4LWYk2U6wbJZ35s5QuNN3eiaEQ==
X-Received: by 2002:adf:a15c:: with SMTP id r28mr261986wrr.224.1622730274831; 
 Thu, 03 Jun 2021 07:24:34 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id p1sm3029219wmc.11.2021.06.03.07.24.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Jun 2021 07:24:33 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id C18AC1FF7E;
 Thu,  3 Jun 2021 15:24:32 +0100 (BST)
References: <20210525150706.294968-1-richard.henderson@linaro.org>
 <20210525150706.294968-17-richard.henderson@linaro.org>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v2 16/28] softfloat: Convert floatx80_sqrt to FloatParts
Date: Thu, 03 Jun 2021 15:24:27 +0100
In-reply-to: <20210525150706.294968-17-richard.henderson@linaro.org>
Message-ID: <87y2br81r3.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x434.google.com
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

