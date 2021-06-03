Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1C0839A325
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 16:28:05 +0200 (CEST)
Received: from localhost ([::1]:53482 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1looKK-0005rm-7w
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 10:28:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1looIC-0003mH-V6
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 10:25:53 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:35658)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1looIA-0007oF-0o
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 10:25:52 -0400
Received: by mail-wr1-x42e.google.com with SMTP id m18so6070094wrv.2
 for <qemu-devel@nongnu.org>; Thu, 03 Jun 2021 07:25:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=PhuciOTxGzyt42NozTpQG7KL1ETjDSYk2QrBi6IxQio=;
 b=my3C2xgu6CBvnSO8eoBqZ2nBUmTxzkz1U8gk6fnovurWpB59YuHnq//BZmq8EQrXNP
 EJxTwTSRSU4IwP9X9LN7JgxB5SDOW6N+Qt6YPpj9tP6CkB/j6XZBg20/DvF3KIj2AHuj
 BlNu9CSmfjjzbRZwL6dEvb2YtfiVosPo8ufZ/OW9pkPJdve8bgJQl3ABP+eaZfzxfDO6
 LdHA82DaOcmRk6FufZZoZI7DjBzw94bosIgqu+yv6Swsvi3h/od/F/KByq3yN0eqvDUM
 deZPWpOLpX2Kb3J8H567DslNBnvV2oCXU88Rvz2XOdE9GEOCqJAiuuOnxIR6WnFNt5zh
 aR0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=PhuciOTxGzyt42NozTpQG7KL1ETjDSYk2QrBi6IxQio=;
 b=YmcQYuCdC6qRn8C70CqR3V3arZRifw05JfGHe5iKCvgs2iyJjSzFIM0aosiw9XQ5M3
 6BTJ1fFokm6llksCdqI/SelWE3eLY4pNFmL5sOTKZ/i689ykwvWAA8y4dwLrCTXP5S/F
 Wi91yZoIFfOFy6O1Qtqyew/bVUr2zbrXnk2C77BdEl3F87c3URtz90H7sXaYxNtsulCj
 FV8KMi0TX11iuE6/6UXtjLSwwVtpiOx7bZQuV60ud3b7CWJvLr8BHQNpYAkJgR3qcnRq
 a2sqmFdl0l8rfn8AqMD07P4441r8TBaW5+ZxeziWo7NVUtYhMA8tFQWf7OknzQ+Ih7Aw
 p8sg==
X-Gm-Message-State: AOAM532QPgwh59Z7WprPg2hzPhXo7vXo2bhiar8ntz/OaqNtmZWCjAzL
 7ckcOAw9NKVqPr7AJiu2KsIBkg==
X-Google-Smtp-Source: ABdhPJzYV6qlPXX0pPSq8Sc2rMgD642FVRPd7hGspEcHjKZU80fPjr4dK/Xys1djvUjMMIHVY+xQ4Q==
X-Received: by 2002:a5d:54c8:: with SMTP id x8mr245323wrv.109.1622730348610;
 Thu, 03 Jun 2021 07:25:48 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id f14sm3493238wry.40.2021.06.03.07.25.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Jun 2021 07:25:46 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 0D0E21FF7E;
 Thu,  3 Jun 2021 15:25:46 +0100 (BST)
References: <20210525150706.294968-1-richard.henderson@linaro.org>
 <20210525150706.294968-18-richard.henderson@linaro.org>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v2 17/28] softfloat: Convert floatx80_round to FloatParts
Date: Thu, 03 Jun 2021 15:25:41 +0100
In-reply-to: <20210525150706.294968-18-richard.henderson@linaro.org>
Message-ID: <87v96v81p1.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42e.google.com
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

