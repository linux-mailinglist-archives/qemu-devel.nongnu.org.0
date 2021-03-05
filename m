Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FDE632F2A7
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 19:35:39 +0100 (CET)
Received: from localhost ([::1]:53178 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lIFIY-0000LF-77
	for lists+qemu-devel@lfdr.de; Fri, 05 Mar 2021 13:35:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47882)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lIEhL-0007Vo-B6
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 12:57:11 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:46960)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lIEhJ-0003WK-KM
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 12:57:11 -0500
Received: by mail-wr1-x432.google.com with SMTP id a18so2993078wrc.13
 for <qemu-devel@nongnu.org>; Fri, 05 Mar 2021 09:57:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=9cBih3UVYZSSlmwNccR5mynVtl261xk7Jg16IXxXyEY=;
 b=T9QLqGRG1+KwFAD9FW2XOXYwxgR/WyGbjwPw08OZzbHitl8B9LT1FJDd9/x/FejOJz
 60N+12jpBwObyGF/2EBSWnt0l/jhPu5petgaa+DIkRRlWzVYgfAioTjjKF0gkwZ12O90
 /ggP/tmELSVUqONL1Lvq8tSV5UN8rr8pQ2KCpGIvEjoGBJYM+62Z3qtouErouQsN/oei
 BwgWY+bUUOVjEkpQSnEMKbim0RTv39Lar+nXWjicsxizzi7w+lvL/KNHjoBDyRUfsoyY
 7aetIhSPbfrDaNRaIQQpzkDgAPKFPtdx7pCrZIq0zaaXlgxXkzHPTTOTEZ/7M/K8hEDY
 4+FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=9cBih3UVYZSSlmwNccR5mynVtl261xk7Jg16IXxXyEY=;
 b=VK0NqaUC0qED0RshD22xn4A2SGszmYFrInal9ivF14wB5ZpWI9d3ul3jq1t/NkWvQB
 pL2kzkKY6zD8GQjq+KtHWg0U0NMaH20s4LQtvuajyOuUKf8s357gPRDl2KMSMVAL8ojT
 VjsjfqsYBkNX7RO8zZ/O8zHLwmjrrfoUd3PrFc0+7FvNjUgxW3PbSzrvagwQQZbAyekD
 Rf3YYJNhamIxVLJDWFqI0RZEDliVLeksra1/eIaBIPCK5ENKiJkDuCihSIbItXL9iqYp
 nEMdDdjJNoDwquStF7r+fg+8JBNWDPkmvV98PS9WklVoBYWCAZgRuBiTo5OoIax1x15t
 4YqQ==
X-Gm-Message-State: AOAM531QXCiUledx4ieXfWh9ntOTgyRk9PaoL8ju+SUbXYtrsOmkkPHw
 /fBXMatoDSWU6eoNqYOfC1kHaA==
X-Google-Smtp-Source: ABdhPJxGkacnyFWY/O/asD+paji+JwvRk1lIKtChsahJ1ZCRnZLDrXQWQxn9lHR0qXBsDkqp0HxqBQ==
X-Received: by 2002:a5d:4fc1:: with SMTP id h1mr10914242wrw.268.1614967027926; 
 Fri, 05 Mar 2021 09:57:07 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id 36sm5895700wrh.94.2021.03.05.09.57.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Mar 2021 09:57:06 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id D36D91FF8C;
 Fri,  5 Mar 2021 17:51:13 +0000 (GMT)
References: <20210302175741.1079851-1-richard.henderson@linaro.org>
 <20210302175741.1079851-15-richard.henderson@linaro.org>
User-agent: mu4e 1.5.8; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH 14/27] tcg/tci: Remove tci_read_r16
Date: Fri, 05 Mar 2021 17:51:09 +0000
In-reply-to: <20210302175741.1079851-15-richard.henderson@linaro.org>
Message-ID: <877dmlebfy.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x432.google.com
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

> Use explicit casts for ext16u opcodes, and allow truncation
> to happen with the store for st16 opcodes, and with the call
> for bswap16 opcodes.
>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

