Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CAC23CE657
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Jul 2021 18:48:56 +0200 (CEST)
Received: from localhost ([::1]:46944 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5WRr-0002l8-AO
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 12:48:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36086)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m5WQW-0001Ak-MV
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 12:47:34 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:44014)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m5WQU-0002Bv-Uw
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 12:47:32 -0400
Received: by mail-wr1-x42a.google.com with SMTP id a13so22827914wrf.10
 for <qemu-devel@nongnu.org>; Mon, 19 Jul 2021 09:47:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=w2lKLdPTVXJGxLMG0zHLDc8A1ptpqoLzz4Aw2jpQUTk=;
 b=XbaVd8EXrmMYZBJtz9k2KvK2JXAZjRiMn+9V8L+ZNOfHfV9GP/HIWriV5knU+Ws+V6
 PttKtFOTRnuwMLOwrTJNBhofUskIleVIj5qDfF8yT8sALHpvwqXG+uodaPpb495vB6Cx
 i7issZhsR/YwiSJdZn5PwQLk9yO9C0NTYrVMiEjdPU4VixGvzCRmMMkZ9ySKErwPmFYa
 N5jlKRxRmPpSlcvg2e0as8aWsQMUvCPYD6zTo6C5slgBuAZhAOvAyc1GMSVJcG3nnof2
 2grQV7amsRh8gkmww4uZDivVg/2Q+p/NbMxHnEKmqeBuHpU+9ycVCGOd1COlLOF+2ABl
 JaCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=w2lKLdPTVXJGxLMG0zHLDc8A1ptpqoLzz4Aw2jpQUTk=;
 b=nTvIj/cbot4btxw1znRi7W00j7ZY5oaqA5DmgYRBSdebJTn9AYvRtlYeJTmtzg0Pv8
 OuV7oIDYv3ZFiRSaBcnb3AAprZ59W7fRAk2WiRD3Xe/QhMCeTd3YwcQDOZ+VT+oQCuRg
 m7INask6YXHNMZOR3B8gTJ0PJbY0COFOIzlj1WB87Yofv/vbwQgQFu4WXletz2TYz+VG
 0VWG0aAw/NVi8Pvetb0wBykMNQ68mqgiwpMud9+AwqHjtDjtziwz3V/KPj7ivo7N2ekG
 92pADU6YicCo+joD7ton7czCVTzDmLryW6OBIlhYpFTtAz7KdhB+B7upqI9XEEmGF9aJ
 Aitw==
X-Gm-Message-State: AOAM5328CepakGTZd2NKi6igc5qh5oQP0QU4rzS8fhRDD+pPG+TbJ1Az
 ead7QxrACvijsZ9vtQHWtjwpYQ==
X-Google-Smtp-Source: ABdhPJw9sAyrh2aQ02NHu3nIenqkmtRliB58ZDysJisvGCtqOJGkc2iaeBnRnjsiLbviOsGuHxqQNg==
X-Received: by 2002:a5d:6b86:: with SMTP id n6mr31130323wrx.298.1626713249246; 
 Mon, 19 Jul 2021 09:47:29 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id b15sm24429078wrr.27.2021.07.19.09.47.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Jul 2021 09:47:28 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 7EF6C1FF7E;
 Mon, 19 Jul 2021 17:47:27 +0100 (BST)
References: <20210717221851.2124573-1-richard.henderson@linaro.org>
 <20210717221851.2124573-8-richard.henderson@linaro.org>
User-agent: mu4e 1.5.14; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v3 07/13] accel/tcg: Move cflags lookup into tb_find
Date: Mon, 19 Jul 2021 17:47:22 +0100
In-reply-to: <20210717221851.2124573-8-richard.henderson@linaro.org>
Message-ID: <87h7gqntcw.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, mark.cave-ayland@ilande.co.uk,
 qemu-devel@nongnu.org, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> We will shortly require the guest pc for computing cflags,
> so move the choice just after cpu_get_tb_cpu_state.
>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

