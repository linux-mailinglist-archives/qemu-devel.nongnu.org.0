Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9CC630C2F0
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 16:07:55 +0100 (CET)
Received: from localhost ([::1]:60314 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6xHW-0007sa-RM
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 10:07:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47986)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l6wuq-0005Zi-2c
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 09:44:28 -0500
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630]:38574)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l6wuo-0002Ac-Gu
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 09:44:27 -0500
Received: by mail-ej1-x630.google.com with SMTP id bl23so30351677ejb.5
 for <qemu-devel@nongnu.org>; Tue, 02 Feb 2021 06:44:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=AGdE23kxnG8oVtrwvvoJyRrj0ViisTaIiWaDd79tTYY=;
 b=zexwnsEM/ZPxYnQUmo/9t4V4OU0Czctskb18NjPHVgGH/GYENZIFgjQd31BD5FgdK1
 PZ2AcUtn+3Fuxq577w31SeCNoH+/kQybwjczOLjsM2zvWpE07mbnlUHRpJx1fi7p/bxW
 okScuitP5gdhXGFHpLR1xLWmVoTOnXEgkcdVpXYeYH4J/hxavUniQ0bgR8j4cxi+Elbu
 lf+LqzKlOp6wjrksI4gFpfclbCdeqkrshd/sC/L99mFsZgl/WMyEVoT1Kxo5eGnGc9J/
 gKB86kiusXo5CPnNY3Cm8zNgXg3qp1KXweyQw9wiyXYS2LvfRmUO1WVb+ZMe7DSrXBTX
 US9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AGdE23kxnG8oVtrwvvoJyRrj0ViisTaIiWaDd79tTYY=;
 b=YVuiY3z/xvlsXGR2nlOlg9mnkCHIz+s/lQwiEGIwnxqkSzLVMWMDlbBtqXR55CaHsf
 4C/1yBCBVAbbpkry8GEnBIpKAPmwFKiQqFOlFN1rkECtTOpf+gTWmK8BfNbsZi71L4iR
 oowzhE8iaBPIofkknkSTuKNwXCzRMoXrqPYrTZaMM9fHBO4HXHe28ZsRxwxGaih6CkwI
 201+NnF6+pDdSGriwIMcboMX72g4PnYG5emdGSsHOtxXaP/QEC8qCON9QAk89TqYr+bx
 gmwZ/33QQ0dad93PaK5Y5UzVjfv5hMV1WVYP9CuNKNh1/UjwSVbblvXhHkn6gYsuIRJx
 1d7A==
X-Gm-Message-State: AOAM5303KhZzPhdv9Qdpe8Sx8OJ4kx6OqxBHpABO96kgHq16us+RUf+j
 UoalUjgtmoB+tbwtKOEGHqZe/FDxnMM1SWsE61xsMw==
X-Google-Smtp-Source: ABdhPJzLemMw8cEF36VB+qL4Rsb5sSMh5uFfPiiTj5ZzHQqlF1hbhqNOXQ45+kipaeue/yonlzkg7LVx6i7N9dtX4uU=
X-Received: by 2002:a17:906:494c:: with SMTP id
 f12mr22981846ejt.56.1612277065284; 
 Tue, 02 Feb 2021 06:44:25 -0800 (PST)
MIME-Version: 1.0
References: <20210128224141.638790-1-richard.henderson@linaro.org>
 <20210128224141.638790-18-richard.henderson@linaro.org>
In-Reply-To: <20210128224141.638790-18-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 2 Feb 2021 14:44:14 +0000
Message-ID: <CAFEAcA81humuSWJeWDzgqoyw9MqwrwCYJfu-HVOtzTXnet3iUQ@mail.gmail.com>
Subject: Re: [PATCH v4 17/23] target/arm: Split out syndrome.h from internals.h
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x630.google.com
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 28 Jan 2021 at 22:42, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Move everything related to syndromes to a new file,
> which can be shared with linux-user.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
(another dropped tag from v3)

thanks
-- PMM

