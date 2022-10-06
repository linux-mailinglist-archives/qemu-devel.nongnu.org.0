Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F25D5F6CEF
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Oct 2022 19:30:31 +0200 (CEST)
Received: from localhost ([::1]:50564 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogUhV-0000uf-Rd
	for lists+qemu-devel@lfdr.de; Thu, 06 Oct 2022 13:30:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51784)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ogTJ7-0005kI-LH
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 12:01:09 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429]:45707)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ogTJ2-0004LJ-MY
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 12:01:08 -0400
Received: by mail-pf1-x429.google.com with SMTP id 67so2410157pfz.12
 for <qemu-devel@nongnu.org>; Thu, 06 Oct 2022 09:01:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=zOMpRL+h7F9zGuHIDhDBvr/gm1SKgFYGmEHdgRf9kC0=;
 b=NgAtzsjxoqUwOV2fM/EGV3QnHYTZTsEFuWoTazVzpT9XBPMeo0TtklTaJYtOTdE/+H
 0qUqJIFVLN0hSjBNJVs/rQw9+1UEB/tNcuUKi9RIh88OUc09vNUk8xJnOMuJ27SHElin
 MPyCO41hlRjpfOClP1YuNQ4QsDH28woL5V2AOEj4o8rZitwIbA/K6tkhSO9/4HRj+2gk
 HJRmbdXETxVpMFngtwyxvxyQAMk9N7tnIgqepbsP4vfAP10y2BDgQ6zPBaF11N/rIVmF
 jkjdJCmI6aysHFUIv6IC4LtXiiVj51PQnlhdjP8YVFv/Vkn851kU2BhV8TmrWBp9S27E
 8cNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zOMpRL+h7F9zGuHIDhDBvr/gm1SKgFYGmEHdgRf9kC0=;
 b=HZ1Ckinmz21fzHltc/smYdcG3o80lyby/mcn0FdV9ygkwUUi92T0x/HOJrhf25PQGs
 9mO/+2Dmq5De6OGuFzbd9/s7RlqEy+vxzAoH22XgA8xKSFdqjG4G5xUli2MfYLccUpYF
 7Rk/6DfzfqqNQAY1/IZ6UFb666URfM6qDZMY9vyBGNaHrTyf/31DquylLGcMdd/cUX/n
 62wboVV6smQTw9cbWIi+BS3WFav0RsKIZXZbVwKv1WMXnJqaY4ULnGGbYxoM2l8taxAM
 3W4OCrrvR0e2Da0rRtYTgnnnAubmBEDpEHJYdW+9F4R2OYoba+PZhqrg3S8A3RqfgbG9
 XKZA==
X-Gm-Message-State: ACrzQf3xA9gE4HvYdKx1kGwK2eebgyFeBTAy5z5oo0p2vkPIS8T4BR5J
 eAI9kh4aCX5wC0REEEmAv+2KIwUB41gEIuVNvpsQ6w==
X-Google-Smtp-Source: AMsMyM7Pdw/0jGQrccmUyFaYBOTfxvDTY5Necr7VjDFMGr3rx50wIDqf3KD5SdmYWFcNeUwYKJ6agyWtY7BuihVrKKs=
X-Received: by 2002:a05:6a00:181f:b0:562:8e02:ec29 with SMTP id
 y31-20020a056a00181f00b005628e02ec29mr567465pfa.3.1665072063037; Thu, 06 Oct
 2022 09:01:03 -0700 (PDT)
MIME-Version: 1.0
References: <20221001162318.153420-1-richard.henderson@linaro.org>
 <20221001162318.153420-29-richard.henderson@linaro.org>
In-Reply-To: <20221001162318.153420-29-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 6 Oct 2022 17:00:51 +0100
Message-ID: <CAFEAcA88G9GdQK3ZW_MbGW2=1sdHcwqp_sOpbjbG45Cwmgviow@mail.gmail.com>
Subject: Re: [PATCH v3 28/42] target/arm: Split out get_phys_addr_twostage
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x429.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Sat, 1 Oct 2022 at 17:39, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/ptw.c | 196 +++++++++++++++++++++++++----------------------
>  1 file changed, 106 insertions(+), 90 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

