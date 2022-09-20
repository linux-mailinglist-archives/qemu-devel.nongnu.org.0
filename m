Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 834275BEC12
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Sep 2022 19:33:14 +0200 (CEST)
Received: from localhost ([::1]:48594 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oah7R-0004Ny-3D
	for lists+qemu-devel@lfdr.de; Tue, 20 Sep 2022 13:33:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55470)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oadeF-0003gV-He
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 09:50:58 -0400
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633]:34475)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oadeD-0007iS-7x
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 09:50:50 -0400
Received: by mail-ej1-x633.google.com with SMTP id y3so6370354ejc.1
 for <qemu-devel@nongnu.org>; Tue, 20 Sep 2022 06:50:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=pyJ/nFjoPXO9wUYurMj3x/9Yvz0F7hKxeSMMyhvPSO8=;
 b=u9gse6kZtiz5FN9ayfIMzkcb6N8mX6abBSng7LWr0Mw1WazBS7a1fFQkvcXkBha/n/
 dphecKLFdQU3QHhKm/fQb9wclos2D4ywpB8SnTeJHo1X58ttkzvEOrAQHgNe42l3W4uJ
 Aknj6c+HPxbSeHWTDA7ENuYV6sZqgFq6Oih07RlSejrHubX0vQgP5XIDXfNaFtuS0uWa
 QsrlVKKcSlhbmPwZZx/mG8yEl/xrxRCNecaT2unsq1L2zBYeJLSg7GhhSIUTskuWJQKp
 LCDf10WECNmEbzyg30bnLyffb1XvwVQRgb8D//zUB28PrviYYrdFW4YPg9c1g61vK9g9
 5hJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=pyJ/nFjoPXO9wUYurMj3x/9Yvz0F7hKxeSMMyhvPSO8=;
 b=gcffuQTVqFz6xlSjT6e5bzNUVVex7XmYBNwuURQhKH7p1nZkab5k/iVtAE+nzg0dg7
 jQoS4cZZEBpF6DF8O9k44MItXwc7Qp+mqsuwnGQUK92MAXUgt1cl6Z9VYf8yijqAotgx
 UrIPoqx4h/ndP4PEIPLzvsNnsCmKjtaJNWn2I1NyL8JN00mgEumgnWNgCRj4f02R5edx
 mfmoA7Im8nQr/664IPPbl6L1xjBzZYgm9ChvbrPmV/Kcy7D+TNqlKqfpVYbfkk1By2q4
 eM5Inj0VzLwuhtVj9IaxEFsngj2YNvdj2CYlkJyCYS00UX906MCZpWeW10aWSNNNsK7z
 DDMA==
X-Gm-Message-State: ACrzQf1UjDhHeDB6ub9ULt++eZBtKYqO9tnyH7XHB/qeUzsKT1UBF3c5
 3wNfYvDqj78j/LNE27WkLbR7xLCzZ2pu+JheT3LR5Q==
X-Google-Smtp-Source: AMsMyM4GmTELlnvUYR0TbQ4kdnRP4HlUwxbM+Dd+NE8rS4xmUbE4ohHM7WiZO8t1cJRsryXQpGRqDmXs5JeFM3oa+lw=
X-Received: by 2002:a17:907:2bd5:b0:76f:591c:466b with SMTP id
 gv21-20020a1709072bd500b0076f591c466bmr16304619ejc.504.1663681847568; Tue, 20
 Sep 2022 06:50:47 -0700 (PDT)
MIME-Version: 1.0
References: <20220822152741.1617527-1-richard.henderson@linaro.org>
 <20220822152741.1617527-2-richard.henderson@linaro.org>
In-Reply-To: <20220822152741.1617527-2-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 20 Sep 2022 14:50:35 +0100
Message-ID: <CAFEAcA98oM19VbJmk-79cfq+05r_RwmAhkRQv9ANw=9nhEKK9g@mail.gmail.com>
Subject: Re: [PATCH v2 01/66] target/arm: Create GetPhysAddrResult
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: multipart/alternative; boundary="0000000000008b433605e91c1d43"
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x633.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000008b433605e91c1d43
Content-Type: text/plain; charset="UTF-8"

On Mon, 22 Aug 2022 at 16:42, Richard Henderson <
richard.henderson@linaro.org> wrote:
>
> Combine 5 output pointer arguments from get_phys_addr
> into a single struct.  Adjust all callers.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

--0000000000008b433605e91c1d43
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><br>On Mon, 22 Aug 2022 at 16:42, Richard Henderson &l=
t;<a href=3D"mailto:richard.henderson@linaro.org">richard.henderson@linaro.=
org</a>&gt; wrote:<br>&gt;<br>&gt; Combine 5 output pointer arguments from =
get_phys_addr<br>&gt; into a single struct.=C2=A0 Adjust all callers.<br>&g=
t;<br><div>&gt; Signed-off-by: Richard Henderson &lt;<a href=3D"mailto:rich=
ard.henderson@linaro.org">richard.henderson@linaro.org</a>&gt;</div><div><b=
r></div><div>Reviewed-by: Peter Maydell &lt;<a href=3D"mailto:peter.maydell=
@linaro.org">peter.maydell@linaro.org</a>&gt;<br><br>thanks<br>-- PMM</div>=
</div>

--0000000000008b433605e91c1d43--

