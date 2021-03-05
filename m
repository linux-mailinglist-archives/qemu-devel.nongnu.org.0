Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 329F932F2A2
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 19:34:10 +0100 (CET)
Received: from localhost ([::1]:44882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lIFH7-0005Nt-88
	for lists+qemu-devel@lfdr.de; Fri, 05 Mar 2021 13:34:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47712)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lIEh0-0006rC-38
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 12:56:50 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:37440)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lIEgs-0003QP-PO
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 12:56:49 -0500
Received: by mail-wr1-x431.google.com with SMTP id v15so3031994wrx.4
 for <qemu-devel@nongnu.org>; Fri, 05 Mar 2021 09:56:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=R6DOPm4AovG46ViP+US/imgCPGsI6txLPCUl4KFS1fw=;
 b=OvAfJFmrxFLw/GYj9fmMgWwg8RR3kqixi+wweOFfwSs281ZozESLdDv54D9aVbTcHZ
 ScIgBg+rCIjrSW/j+TD0w1pNYQvRd318WaU/tXWnsGvdV/yxyfyrx15OF++dpqa40TrX
 Q5H1yCDujJHHYW8XRU48E1PZn4MKBIeP4SMepETCIcyIXSH6utZlmEPMFJ3OBEcmNKhv
 TCt3Y/L/62qao0v5uGWMskfWoGXHyBPNmTrTWpehfN7INffVMRvi6JFRb2s0w1ySdIPk
 1D2ksevYAmdHAmuadEngXQ6GxiY++q0p6z4ajJPUuXWMdzxaH5SjFIAXfgT5WSSfvkCL
 ffKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=R6DOPm4AovG46ViP+US/imgCPGsI6txLPCUl4KFS1fw=;
 b=DBqau71vStc4aDTzBfvEvFjGmzmXMoDBRCjMSTUedE2GULlklKoSzMhkuQIDyEW09s
 CfywiaHD4dlGKwyj7/GpT87OXp6g6KLxAuuf06lnOWpT7BDDh0Z4qFb4VTJAlfJnkH5T
 LXlf6w8KGWQOCz3mCowkb3MIp91195P7ZiGU9sYJMd9/OiWhwd/3MOLNg2Tghpu9Q2fU
 YKFwf0lz1Nz/bsXCYXBCoBWeRwqK99UbW8fSzUADXbfEBm0b1dUqEOU5mM04UnH9wNpR
 Z78eu5wgqY9lMaciIR0ClBagc86BjCe2DQwyzY5PtsmSOb/LxeO8NSJ9CerqsGsD/lgx
 vSbw==
X-Gm-Message-State: AOAM532Z0X9nbaexhrqlKTJh2lQwTmHF1W9HEy28/VkaOnRRosEvo9WN
 IzfIUSK4RZ/Y7O6KggS7rLf/TA==
X-Google-Smtp-Source: ABdhPJx3znmrJiQUtAAHhBXJEkenumjZJMvu3QvH1wjltdWFVKN7M04XY2MYYPFasZMsmLQj8nBX8g==
X-Received: by 2002:a5d:4e52:: with SMTP id r18mr11250349wrt.28.1614967001253; 
 Fri, 05 Mar 2021 09:56:41 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id h20sm5192205wmp.38.2021.03.05.09.56.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Mar 2021 09:56:39 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id BE3C71FF91;
 Fri,  5 Mar 2021 17:56:38 +0000 (GMT)
References: <20210302175741.1079851-1-richard.henderson@linaro.org>
 <20210302175741.1079851-21-richard.henderson@linaro.org>
User-agent: mu4e 1.5.8; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH 20/27] tcg/tci: Merge extension operations
Date: Fri, 05 Mar 2021 17:56:33 +0000
In-reply-to: <20210302175741.1079851-21-richard.henderson@linaro.org>
Message-ID: <87pn0dcwmh.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x431.google.com
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
Cc: qemu-devel@nongnu.org,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> This includes ext8s, ext8u, ext16s, ext16u.
>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

