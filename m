Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 736EF4D1525
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Mar 2022 11:51:06 +0100 (CET)
Received: from localhost ([::1]:36760 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRXQm-0005Wh-SZ
	for lists+qemu-devel@lfdr.de; Tue, 08 Mar 2022 05:51:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60654)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nRXN9-0001mN-RR
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 05:47:20 -0500
Received: from [2607:f8b0:4864:20::112e] (port=43198
 helo=mail-yw1-x112e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nRXN8-0006Ao-Eo
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 05:47:19 -0500
Received: by mail-yw1-x112e.google.com with SMTP id
 00721157ae682-2d6d0cb5da4so196097277b3.10
 for <qemu-devel@nongnu.org>; Tue, 08 Mar 2022 02:47:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Yoj3/jZOjVX2cMcISu9iPLm1bwLFBjvi/3RUT6zLbtY=;
 b=QoPwFJGDBSGl5hnRtOPFze+OgfhvCVB9bWZVYLCITqM1mG5ZVliucsgi3TF9LHshbg
 JX0bupdKxiPh8t3jfUkpauhEv420adWzMNEnzilucnzcwyzP8IN00uYaL/v3tdQ0ywfS
 HmnJeEx2pgOp0ns/CAagUfybSbvCdGgybmDHJ52lLLt586pT4yp+5rFc1EWrskoK1ARW
 6zdJd/SxZqQNKtcB/OT8fjIL7Udg/NF3X1a5GDDLCilJEmHO56d0EIDur9KTHPSKXQpV
 Ri/WgQ06809KU01DQ2UWPzWAHoL/FkqNxWYgJ8feyUNqEbw5/wvVIX7mYq+S/iU3FKzR
 rpQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Yoj3/jZOjVX2cMcISu9iPLm1bwLFBjvi/3RUT6zLbtY=;
 b=Rd7VhrypmhfboKn32cgw4Ndl16XPc8hAV2nvN54Zhd/SG6GSOc/U7idZ2ymH70mDyr
 HLfiCiNF3EaDV6uF7KPypTytCeuqm37jqNWlilgsdS4rPIiHY+Of/3f+aT4zexF1yZ45
 UhK1WyYbrALYkLq+UqH7mArcReaGs/SvVLiibxz6dr2K6a2KbJ+OL2I0RPaIMIo3NvNM
 B0mrnnNSjLaWvrOnerIu5Gzfwk7k/EiV/m3kYFlIl9WtUKvhghNyhP/OICBUziaONkqb
 sqxpMeZFUHUUEuf5DKm5TvvP4znOBcr3DVImUgt7EzY+EGFgZkmHCNO+0BWVLswjR1rS
 KJDg==
X-Gm-Message-State: AOAM5323ZMlPxqgGCde2Au5P+pvKV64WrooEEUGEXp1dH2t1UBlGMEUY
 rze0q+k100wGggHj02daDHpo9NZhO5lCFkIDO/AOTg==
X-Google-Smtp-Source: ABdhPJzF5zmk1fvpplhbAbn1ZtrPkGR6wBur62kN/cPC9CEKxifuNMO2I2yCGovHq1RTUMxk8O1bYLqUhsa39a2M0no=
X-Received: by 2002:a81:164f:0:b0:2dc:3906:27c0 with SMTP id
 76-20020a81164f000000b002dc390627c0mr11924633yww.64.1646736437248; Tue, 08
 Mar 2022 02:47:17 -0800 (PST)
MIME-Version: 1.0
References: <20220308072005.307955-1-richard.henderson@linaro.org>
 <20220308072005.307955-17-richard.henderson@linaro.org>
In-Reply-To: <20220308072005.307955-17-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 8 Mar 2022 10:47:06 +0000
Message-ID: <CAFEAcA8o=x7y1KiSdevJppu9V4=oKAtMJjh7naiHe+-E_xjOBw@mail.gmail.com>
Subject: Re: [PATCH v4 16/33] target/nios2: Move R_FOO and CR_BAR into
 enumerations
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::112e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::112e;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112e.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: marex@denx.de, amir.gonnen@neuroblade.ai, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 8 Mar 2022 at 07:20, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> These symbols become available to the debugger.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

