Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A323303A0C
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jan 2021 11:19:01 +0100 (CET)
Received: from localhost ([::1]:41996 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4LR6-0001b8-Mj
	for lists+qemu-devel@lfdr.de; Tue, 26 Jan 2021 05:19:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51096)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l4LPU-0000aH-49
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 05:17:20 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:46083)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l4LPR-0004MG-KF
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 05:17:19 -0500
Received: by mail-wr1-x434.google.com with SMTP id q7so15802619wre.13
 for <qemu-devel@nongnu.org>; Tue, 26 Jan 2021 02:17:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=dHFseCNwab2bfparxR6t31k0kDcV/qCcGicg1Cc4dM4=;
 b=e5VSJrZ95yDeEI9mrq2bCjA9Up2p+PtUvV+BLywaP5A7ICiIBBXTyn5RgI2oXK1ysk
 UlpqKmJ8PCu/9C7GWVfYbua95oOR5SnQArZZUyCxJSNasALhsu4ZJ2WqIIgGoKn3Yj8X
 OxE0mwhAetJkVjpp915NgeCr5pm0R+/SCpV4f30157bK/RHgwHiJ1tFzMJ/s9hD+d0IR
 aAorjjEMPDnLJFrRUNXsrJXzg+KhFp+ALnJ7mFZrZ4IywZX96Q2gFfVKFA3tozJGJpsq
 v2NjeHVDfrLkYHI21hi0cTArGNOXTUIor65AC5BNA1Q2xwW7r+0glPF9hlmuFs7hCaEo
 KyEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=dHFseCNwab2bfparxR6t31k0kDcV/qCcGicg1Cc4dM4=;
 b=BkofrsG6oRj7AtggA8DAPTuIpR3LqzrOizAgGsCjSp7Q7h2C+SJq3y2X2alGiiGtyt
 2x7MPS+uYTq8fSEdX71RwPvuyGgFj+u+JPVjdb35DKVoVzb//QDTJOb9o8nj9GpmB3LF
 Xn8geI/SAFs0aOZD8DGsjSj0xO+VdX+0G3AwMBISEnwD+SJwiiQO9iyNGgWhzA/gSQGQ
 GLB8HRm/on7l6UlcAfJ4DqoK3f8Kln7qn9qiA4yQ2l+6p5h+FvpFX26TbhrpBXh6MCrc
 MEpaznWH4N0lc0ZMjqqNjysrVNYsROVjVvWFHOdhvBEmbhROlNqbhJ8fUXXL+OO1k9Dt
 S+9Q==
X-Gm-Message-State: AOAM531LA0Y8MOyaR2IwHKvy7anhWI+6N986ncveEe+PDvnYbFmWnvWB
 det7k29mfRLFPxPurRPSzH7GIw==
X-Google-Smtp-Source: ABdhPJxmK943OfqXueGmiE/+e4FT0sLXuMyQDSSjQNflx3ifiTcGIhe7ZppBZZgvTiYF8w9Qat+K8w==
X-Received: by 2002:a05:6000:1201:: with SMTP id
 e1mr5227652wrx.112.1611656230162; 
 Tue, 26 Jan 2021 02:17:10 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id z130sm2487260wmb.33.2021.01.26.02.17.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Jan 2021 02:17:08 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id C2B251FF7E;
 Tue, 26 Jan 2021 10:17:07 +0000 (GMT)
References: <20210125105818.2707067-1-f4bug@amsat.org>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PATCH v2] target/mips: fetch code with translator_ld
Date: Tue, 26 Jan 2021 10:17:03 +0000
In-reply-to: <20210125105818.2707067-1-f4bug@amsat.org>
Message-ID: <87h7n4xasc.fsf@linaro.org>
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 "Emilio G . Cota" <cota@braap.org>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> writes:

> Similarly to commits ae82adc8e29..7f93879e444, use the
> translator_ld*() API introduced in commit 409c1a0bf0f
> to fetch the code on the MIPS target.
>
> Reviewed-by: Jiaxun Yang  <jiaxun.yang@flygoat.com>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

