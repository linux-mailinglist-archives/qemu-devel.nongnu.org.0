Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D0EB45BED5F
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Sep 2022 21:11:50 +0200 (CEST)
Received: from localhost ([::1]:38878 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oaier-0006oo-KS
	for lists+qemu-devel@lfdr.de; Tue, 20 Sep 2022 15:11:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oaeCe-0004Z9-76
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 10:26:24 -0400
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629]:44583)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oaeCc-0005gb-Sx
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 10:26:23 -0400
Received: by mail-ej1-x629.google.com with SMTP id r18so6530850eja.11
 for <qemu-devel@nongnu.org>; Tue, 20 Sep 2022 07:26:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date;
 bh=ArY7B3RL51SioJr2VWCBecJ96XNAdUeg1sJSFJih0vA=;
 b=eFW431fA+lpzjiBKgXXtPwYwseGXlpf1vPUgjRXTfZF56Z5SnZCOtpIoKsAYWc3Mfo
 HWwGcu7Z5w71585SIh1JVrIe+VHKTV/KEszbkobTFKLKCRo1z0IeTYA3Fsn5sXl1adR7
 2PfHaDIdIZ3xasnCjBuqXNAvt7wm0F+y2UzNSOyS7ggoB/AK8vNy8hHZfE7ZW/TFOwxP
 CXK891J5+XGpsUJSXEjHWc0lOH+9yzWTBa+ZMNlq/N0zCRZ9IO7IN8bVgCNVDmn7DYeW
 pjwZyDc07mmnlJs/KOpgq1byOXXvDEhyyrw1jLUjXgPXHkDBsoV8SJbzFYl15AXcpyeZ
 u1yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date;
 bh=ArY7B3RL51SioJr2VWCBecJ96XNAdUeg1sJSFJih0vA=;
 b=cl7jQxoOMPoKshB+L1/T/s5eaRKjRlVSMcaSqedHRC4i3FFqOwak0NJPjFSDVKw6pP
 4Z8kCDTyfC3RbsAcahc3jpDymv6Exj4K5Upxvh/cT6RxNHQk+z+MAXBX6azzNM1N9/kV
 fyedZPwE1rvXZi/UnvjKlk6r8GJ3cna/MaMEmp0G+NIXXSLcTD5OEzEA7BEw5cYFGjlq
 bp44sUpa10Exs4fFO1aU8Y6xfYqYxSpvlQSA6s7PCZEZXzn6LTHsOZBiKWhBxnpeRCN4
 leE/SUngTYBB98PJUnkDUWI89SmC/jpZojX2QWQJz5+68wS8Y7+wNf0EJiNvwe2mdrOU
 VQlg==
X-Gm-Message-State: ACrzQf1PyL/XUJV/1W2Lj/dvhkeFpIg9iz7Nd9bPUozqbFqX131g+Rfc
 vcRNlRAWgklTCLIGD9q+myRdn6ppzX9WgpQ0Ed0onA==
X-Google-Smtp-Source: AMsMyM4P4GCvdEToxujrdwjBMLXhGhhFlX686kAOm/uo5ZdT8PAk8N8hbzXZiJebu8mGbEivT1/F/vIarcfONNswpOE=
X-Received: by 2002:a17:906:db05:b0:741:5730:270e with SMTP id
 xj5-20020a170906db0500b007415730270emr16483472ejb.609.1663683981373; Tue, 20
 Sep 2022 07:26:21 -0700 (PDT)
MIME-Version: 1.0
References: <20220822152741.1617527-1-richard.henderson@linaro.org>
 <20220822152741.1617527-7-richard.henderson@linaro.org>
In-Reply-To: <20220822152741.1617527-7-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 20 Sep 2022 15:26:09 +0100
Message-ID: <CAFEAcA_znxG6hnE=DnPCN9k4VvK2n_TzKyodNwbD2-n84TP89g@mail.gmail.com>
Subject: Re: [PATCH v2 06/66] target/arm: Use GetPhysAddrResult in
 get_phys_addr_pmsav5
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x629.google.com
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

On Mon, 22 Aug 2022 at 16:42, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

