Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C94E15BECEF
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Sep 2022 20:41:48 +0200 (CEST)
Received: from localhost ([::1]:55204 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oaiBn-0007U6-H5
	for lists+qemu-devel@lfdr.de; Tue, 20 Sep 2022 14:41:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52842)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oaeLz-0004Hn-HL
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 10:36:06 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c]:34601)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oaeLu-0007Rf-Pz
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 10:36:01 -0400
Received: by mail-ed1-x52c.google.com with SMTP id z2so4181244edi.1
 for <qemu-devel@nongnu.org>; Tue, 20 Sep 2022 07:35:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=1yl6NsWkEltT7mArFV4fkbae+190nteVaakYq1lciRA=;
 b=JVgTjo3vLiRTpsx8xDm4tWuHq6wCkfs1K71/M2nBp3Ve+1OeUU/CnSiH4sPuX/IBGN
 1APaO7mh7L7lFW2QPJDCvlhghs401hxoMk9UWU0qp+QUnpkp36tefLgJI1LG5L9xY6HZ
 VeaW71pK7TKJDk7u2Huf1rb9+KnnOR7xlWkdRse5TOQmBQadeVGuWQ6IbVfeRBVejw3q
 x/LUrWeLoOAgOLJNQLpV0fbo2bY0/wZzRr5qXL6v+AGmd3pWj0+pf7o1A8YBGXHI3QBP
 G0Qz8DkO9PyUP9rW7BfIpIfGvT40CslcyfG7GY9SMQUwZYUkmDQee/Dtt6j0mM//9wep
 dEbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=1yl6NsWkEltT7mArFV4fkbae+190nteVaakYq1lciRA=;
 b=tn4pweRmuY2sAIcgFBXQE6vHtaVRyUJ7iq88UkPztwgDaitAXSbPGm3543oioO2KoH
 p3dvRk9xph21fshCq2FeoB+3hwWk+jdKNYh96JsBTQZz3wpiNv5MJzNC/E7DU1Hbpny9
 tlOB3v0kbir0cBe7aSZbcRR0RocThyx5K1JmBxciwwuxOXNaxxOXcyMvPixoEqgc70qK
 FdUNZwFg1SqlRw0ilVdrzC3fT3o1DgDQdGPuLunyMeSpue+iowZXeiQGTyJkY6omthl4
 6+fr1wbhepJVoiWZwBqaHFaEX92KY5wE9IdrrTxRxfJIK+ltNRPkDdonEZHsxwhmEjGd
 aIyA==
X-Gm-Message-State: ACrzQf3u7S6V/0ebD+ZBCh5/2ZLH5inYgEqyjVblm9z1b+dnbAu/uu6L
 icS3OcCdvTslklvwifO7D/Tdwz3OlLq4z/3htcbIcg==
X-Google-Smtp-Source: AMsMyM4njUmFQkUciO7zAb9DdwVvAb5yD9kur4rbiL35J7rgrub7F/VUHXYK4wIfiMqa7adDYXIp9p/Pc3j8gXLvo58=
X-Received: by 2002:a05:6402:516f:b0:44e:9151:d54b with SMTP id
 d15-20020a056402516f00b0044e9151d54bmr20287414ede.241.1663684556933; Tue, 20
 Sep 2022 07:35:56 -0700 (PDT)
MIME-Version: 1.0
References: <20220822152741.1617527-1-richard.henderson@linaro.org>
 <20220822152741.1617527-11-richard.henderson@linaro.org>
In-Reply-To: <20220822152741.1617527-11-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 20 Sep 2022 15:35:45 +0100
Message-ID: <CAFEAcA9qjaFfByWGO_oh4GKtJGYG-OFx-3_9ypQNmBRBJxvSTQ@mail.gmail.com>
Subject: Re: [PATCH v2 10/66] target/arm: Remove is_subpage argument to
 pmsav8_mpu_lookup
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

On Mon, 22 Aug 2022 at 16:54, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> This can be made redundant with result->page_size, by moving the basic
> set of page_size from get_phys_addr_pmsav8.  We still need to overwrite
> page_size when v8m_security_lookup signals a subpage.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

> @@ -1722,7 +1722,7 @@ bool pmsav8_mpu_lookup(CPUARMState *env, uint32_t address,
>      uint32_t addr_page_base = address & TARGET_PAGE_MASK;
>      uint32_t addr_page_limit = addr_page_base + (TARGET_PAGE_SIZE - 1);
>
> -    *is_subpage = false;
> +    result->page_size = TARGET_PAGE_SIZE;
>      result->phys = address;
>      result->prot = 0;
>      if (mregion) {

There's a comment just above this that needs updating:

     * We set is_subpage to true if the region hit doesn't cover the
     * entire TARGET_PAGE the address is within.

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

