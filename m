Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 43FE52F2EA8
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 13:09:02 +0100 (CET)
Received: from localhost ([::1]:41258 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzITt-0003Ur-AD
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 07:09:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43928)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kzIL7-0005qg-AW
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 06:59:57 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:40440)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kzIL5-0003Zk-OY
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 06:59:57 -0500
Received: by mail-wr1-x42d.google.com with SMTP id 91so2205893wrj.7
 for <qemu-devel@nongnu.org>; Tue, 12 Jan 2021 03:59:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=Q6GYS5j6id5ce/SIQMJRWM/yrTpaOccrsWVz7BHYOfo=;
 b=fgeoVUyeLb0MMieZInjaoLkIk3ICHivfxKiBvlwRLaN+6nCTlxC/bVC8ekloHTTmcq
 WYuTCFbmyOZixASuVv/PUGtWCmELuWkirAeaNxF++Dn7G+zCAaEepOz12R4Lp/NRnkah
 v5KUGcH1Rs7zh46BB4RWxAW8gDDbQa8g5eTquKhASwkeKQDiKt2X+IYXT6dxaDZtD9Yh
 DgBnGtGpuSeG3n/ci4XbnUMWvEGUAP50ovInIV1gl2nn05fVsa9KNmojMvigV/jfRRNF
 EYb94h6TDTZ7S3LUIPrww/xGHKCcrbqBZ/OPMpHrieR+XHgrnttEtwZA5zNa0s5XdZlC
 QkEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=Q6GYS5j6id5ce/SIQMJRWM/yrTpaOccrsWVz7BHYOfo=;
 b=JT+uiKcVbxNBlEpvs7F1dgT6AgNpb0Lr/0nAZ0d6S6ozmXdbW9SXnPdB929JPKsd2g
 BoJ1sJE5iwJ5nKe4WVbSpyQupeNTlEoJ9pteECDTX7G/q7S+c4Q0wARDhvCl0i7Zq8g9
 Y/E6mo6W3sghRa6daXfvhjw50mofUZPcubIpZ9ab8al6tCwm1Bnec/iUms6+CedjDdJI
 P+tpkm+A4VVM/r23hAPoFegEF4EUfUY1i/IBhWaxPKHANuuhGcZnUNUducq4rt/zP3/q
 yfPOf/5revyeSm58AHO17D0SOVgmMZM83xROiCMousWofgX2Ps4IleWeHAWlnE9B1nIs
 bHLw==
X-Gm-Message-State: AOAM531/wZ0/JEmrOL9Jz4vBt54njs0+KvoIvmbm7NVeWPiYT2qFt+QS
 kwmgV57eqZ0nfH4PzgCsRTEPZA==
X-Google-Smtp-Source: ABdhPJyfSaxbiOMr8eqaGC4h2vPsBAMFxlKR3HVkVEup8DxZAGcaMSnCJvJwgUoBj9EK9TgsInCnDQ==
X-Received: by 2002:a5d:4905:: with SMTP id x5mr3932243wrq.75.1610452794385;
 Tue, 12 Jan 2021 03:59:54 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id a25sm3491213wmb.25.2021.01.12.03.59.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jan 2021 03:59:53 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id D7BF91FF7E;
 Tue, 12 Jan 2021 11:59:52 +0000 (GMT)
References: <1610080146-14968-1-git-send-email-tsimpson@quicinc.com>
 <1610080146-14968-36-git-send-email-tsimpson@quicinc.com>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Taylor Simpson <tsimpson@quicinc.com>
Subject: Re: [PATCH v6 35/35] Add newline when generating Dockerfile
Date: Tue, 12 Jan 2021 11:59:44 +0000
In-reply-to: <1610080146-14968-36-git-send-email-tsimpson@quicinc.com>
Message-ID: <871reqnz5z.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42d.google.com
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
Cc: ale@rev.ng, bcain@quicinc.com, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, laurent@vivier.eu, Fam Zheng <fam@euphon.net>,
 philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Taylor Simpson <tsimpson@quicinc.com> writes:

> From: Alessandro Di Federico <ale@rev.ng>
>
> Signed-off-by: Alessandro Di Federico <ale@rev.ng>

Queued to testing/next, thanks.

--=20
Alex Benn=C3=A9e

