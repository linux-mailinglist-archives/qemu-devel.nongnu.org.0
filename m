Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5747E9AF10
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Aug 2019 14:19:04 +0200 (CEST)
Received: from localhost ([::1]:54994 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i18X0-0005ov-CZ
	for lists+qemu-devel@lfdr.de; Fri, 23 Aug 2019 08:19:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56679)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1i18UN-0005D8-9m
 for qemu-devel@nongnu.org; Fri, 23 Aug 2019 08:16:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1i18UM-0000uB-9F
 for qemu-devel@nongnu.org; Fri, 23 Aug 2019 08:16:19 -0400
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:46911)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1i18UM-0000tt-4j
 for qemu-devel@nongnu.org; Fri, 23 Aug 2019 08:16:18 -0400
Received: by mail-ot1-x341.google.com with SMTP id z17so8498867otk.13
 for <qemu-devel@nongnu.org>; Fri, 23 Aug 2019 05:16:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=f/Vekl7Joky49QK00944xfqovEQ1LgsQ9EZ1x5MtykI=;
 b=TTfw8hiSKFJBAd1AoZfwrql6+bvB0drBIQNBtFpVn4VMrvNaC7fWqR+H/A+f6EEySi
 kUQcYMHFyQamJShWnO/hK3zlHlm2Zsnk9SJY7L5euyHLKI52HD9GacnDq4IVWcn7hB65
 huFhYJGcejALQG/oX0dgJt9D5Vxne+vnFeiZ9jaCIP6+4x2/Bm5LNVFU/MjwZgjH9IM/
 ViwPEvR0N7Q9myKfKP97V6GuPA3vqP8UmUX6Nbc/jCqW8ITb1yZi8H+HJWve4S5Pdiof
 NClx4WOtDlMfSEFk7PMl4mmINo78VN0J7FgQkL/bUNMzAJD+IwMAuWB3yMcJakzEPGrg
 C1CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=f/Vekl7Joky49QK00944xfqovEQ1LgsQ9EZ1x5MtykI=;
 b=a0g/HnDKSdSTdK9Rtk4s0nyjxndj9CMaRQsdjZtRKZKQ3RGjysRm3ApGjlwju7+lcR
 dy9Ovvxb2WHc3KieGQKRTnVNIGMTwpVZuTGQl6s4eOl7msl0//yRXgfFCeYTbMdgo0II
 FdyuD30mg3DFcb9orZb/euZg8s50WFEic1KKmRLMfebWndBUWB7BlW7B/QGQKpiOb7IN
 BcfyVnIkwP7ZAO4U9aDLlptSCWCtS2NRrrAO2wa38vyltRbXLJxvfkwD/XIwV++ZhaC2
 QoBqjlUNoVB7UTSHlxuDBRjK0c8DFFxlb4WxQ2lhi29KFQXd/WsFyk1eTL0xfwK+Y8sm
 HMAw==
X-Gm-Message-State: APjAAAW4Xs98fNNzkqIPW98d1DLhHdgxAtVDM/g8ktuZPL0MvToFuKzs
 JapqiwCzo1lajIpggsWME5cnxNuqgI3W6DjPl+yykg==
X-Google-Smtp-Source: APXvYqx1RPVVeA+PSjJF8ah7vZvO3RHHHAIBMRrrDUCbNYNp7saky7FC38VyfZWYti4R4pb3jrk8rAs9YxRrGvn7eo0=
X-Received: by 2002:a05:6830:1015:: with SMTP id
 a21mr4039728otp.232.1566562577292; 
 Fri, 23 Aug 2019 05:16:17 -0700 (PDT)
MIME-Version: 1.0
References: <20190819213755.26175-1-richard.henderson@linaro.org>
 <20190819213755.26175-3-richard.henderson@linaro.org>
In-Reply-To: <20190819213755.26175-3-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 23 Aug 2019 13:16:06 +0100
Message-ID: <CAFEAcA-Tn9D6Eobe6L2JChKy+4yOqAQBUzzV0mvjr4wZUGhp5g@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::341
Subject: Re: [Qemu-devel] [PATCH v2 02/68] target/arm: Add stubs for aa32
 decodetree
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

On Mon, 19 Aug 2019 at 22:38, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Add the infrastructure that will become the new decoder.
> No instructions adjusted so far.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

