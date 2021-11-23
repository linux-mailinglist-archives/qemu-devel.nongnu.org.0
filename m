Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C957145AD9E
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Nov 2021 21:53:02 +0100 (CET)
Received: from localhost ([::1]:55894 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpcmj-000792-Hg
	for lists+qemu-devel@lfdr.de; Tue, 23 Nov 2021 15:53:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38074)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mpclc-0006TD-P9
 for qemu-devel@nongnu.org; Tue, 23 Nov 2021 15:51:52 -0500
Received: from [2a00:1450:4864:20::32a] (port=51059
 helo=mail-wm1-x32a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mpcla-0005L5-Vm
 for qemu-devel@nongnu.org; Tue, 23 Nov 2021 15:51:52 -0500
Received: by mail-wm1-x32a.google.com with SMTP id 133so232124wme.0
 for <qemu-devel@nongnu.org>; Tue, 23 Nov 2021 12:51:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=CdHPLDU6c3/D27vWQ2nkRmg/muPbHVo6jFkdiPG8jO8=;
 b=QCyj5kDLbhlH4cDkz+VIJup/O/P8B58ElTISNHh1JWVyL0MQfK0ttklWJmrHQXDsLs
 CmlkDcGRJhvbh98s2Jrk9ctoCKhYKxEfFCQP37lTiXgiTVUt99RuyxjWkZrT8NajKXoP
 qNYbnjIcbqx7y1GBPA8dRsl9JrF50btZGXakCP5HwL+0xUCpbFbF+41KfrY7F1FSzrCp
 QGuSM+x4Gaz7jmpmZA/l8cPuGLhSVGQzaLA33bF8+SMg6W98/UH7bTMQNCRvrQF+Sz/o
 CINhyqsgZBijFwNX7zLxLs2z12fivf/2zDzIazbmvaPemu0z2v40nlxP6oCd+qlpm6Iu
 xS7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=CdHPLDU6c3/D27vWQ2nkRmg/muPbHVo6jFkdiPG8jO8=;
 b=H7ON2XGC6TWAnWiO4aQm4rOwIje72vvnAaevTiMmAE5AdGjlV6L0qHLLmPlcVDPCFl
 S1Ln+/qiOuAF2EKsFCeSh1siUSwMDiLIUiUcV44T3hPtDwB0xmuX4zL77MVyavtFuEzo
 ZVqQpe7yx8vnUHtxpPWi5Z4RN7mGugkquJv5f8PgRRO865hAeW9VNdkvPs52KmR2CuW5
 D5+2ZIRXQVtEU6a3/wl/eOgW5faFH3a1oyock7o9z4vMZdmtI0rrJDUhC2jB061BanwB
 B/01IQKCbVkO85VaQbVBXyMDziG3JvQqc45MZjRIOuj6ihgYaHBb0dFRUpwgZIONAJYD
 dIaw==
X-Gm-Message-State: AOAM531zeSx48h9DHGpcb5Empmwj0TdlKfKdSq+sg1xzsyeMWgdriN3b
 V+olZ95cmLNevLdhsMyWBBkhYA==
X-Google-Smtp-Source: ABdhPJzB2YgLQBWvQL588g03NhCufzRTqwRcKHef2M6+zgJQKYWyPiHEhmCk/ozG0lLeVrkage/QxQ==
X-Received: by 2002:a05:600c:1d9b:: with SMTP id
 p27mr7141649wms.123.1637700709035; 
 Tue, 23 Nov 2021 12:51:49 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id e18sm12934609wrs.48.2021.11.23.12.51.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Nov 2021 12:51:48 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 482B71FF96;
 Tue, 23 Nov 2021 20:51:47 +0000 (GMT)
References: <20211116163226.2719320-1-f4bug@amsat.org>
User-agent: mu4e 1.7.5; emacs 28.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PATCH] MAINTAINERS: Add section for Aarch64 GitLab custom runner
Date: Tue, 23 Nov 2021 20:51:40 +0000
In-reply-to: <20211116163226.2719320-1-f4bug@amsat.org>
Message-ID: <87fsrmfvdo.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32a
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32a.google.com
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
Cc: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> writes:

> Add a MAINTAINERS section to cover the GitLab YAML config file
> containing the jobs run on the custom runner sponsored by the
> Works On Arm project [*].

Queued to for-6.2/tcg-gdb-plugin-fixes, thanks.

--=20
Alex Benn=C3=A9e

