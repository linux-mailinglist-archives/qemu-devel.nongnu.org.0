Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ADD691D9FAB
	for <lists+qemu-devel@lfdr.de>; Tue, 19 May 2020 20:40:29 +0200 (CEST)
Received: from localhost ([::1]:35472 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jb7AC-0005Gk-Or
	for lists+qemu-devel@lfdr.de; Tue, 19 May 2020 14:40:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46152)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1jb78x-0004Jl-2R
 for qemu-devel@nongnu.org; Tue, 19 May 2020 14:39:11 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:41510)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1jb78w-0004FD-Ca
 for qemu-devel@nongnu.org; Tue, 19 May 2020 14:39:10 -0400
Received: by mail-wr1-x42e.google.com with SMTP id h17so515319wrc.8
 for <qemu-devel@nongnu.org>; Tue, 19 May 2020 11:39:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version:content-transfer-encoding;
 bh=6JIdOcjBBHWP7ttIp7TsBs6GhKs1bUA/YXAeqJL9Lnw=;
 b=C3udAG8QJo2f35t19J9p1rrIMdDSY4iT/A5Slb/B6dPc49FVgMC9BvzpmJ0Cex7rMn
 8a6oyF5dLVa9aoq1bV9wOHLMucGP4m3hUYMYG8QnzbCFm+wasRo2Nq1Io1tTukw+uKOT
 LVKTPHJgBGGR59onxHP2FdgIyjK1Gr/6g2RNhQhUP7aUPTKTbbexK4OmGuWiOEm5yEXD
 40gUZDdnwxxCPFka+O7osUEA7WeZEgLG4hVCgB/L6suUzosKfOHpweAakqnn0XK8xpkp
 Tmr6gGd5wjelF+VO/X9EErUA9fIwnetahgARjV4LBJiHSMgv7+lp75EehXd84mQQ5Pmo
 geJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version:content-transfer-encoding;
 bh=6JIdOcjBBHWP7ttIp7TsBs6GhKs1bUA/YXAeqJL9Lnw=;
 b=dfOsl4m8PsuZ4P76BguMlcW+ajt+arqcaIGKpRq/bEBSu2VtdSyzTkmQwHN6vdLH/3
 KVyvPPA2UvvmNlt5r68qBNbqrdS52TIJPOwhuCXiTJL8Ad2H9EMZ8gf7GKSOTrBK9Jrs
 SN32JrgeQx/kEz5LS8wsiHIIffNnWbSWmjCU0pCPILa5UJDSG9ZM+ELrmxOp/NzLXTzW
 QFkfR+pmQg9pAwe9DkcrisBTPIboyan3T8XzndYpZgKMw5ZmAg5V2Vuz2rfoPgeTfp61
 02gniASVaPo6jDKgiguEdl5SKN7cV7zEuE+aEdSSLdsa7NncY6prHOLROvIFl3EnR1mx
 pIxA==
X-Gm-Message-State: AOAM532fMfuVR3FadWNjmPdxFR8clEBaP81r+qKb6a3VXf1s42eBrenh
 xcBrICCSJMx0qsomj7tHCs66lQ==
X-Google-Smtp-Source: ABdhPJztAs9ssOafzDm/yny8NmAK6STXe+migWnLcND96VAYIqgfa+d67VkuEF9hz0sGhmXPGO5g8A==
X-Received: by 2002:adf:fb0f:: with SMTP id c15mr279435wrr.410.1589913548534; 
 Tue, 19 May 2020 11:39:08 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id z10sm558447wmi.2.2020.05.19.11.39.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 May 2020 11:39:07 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 655F31FF7E;
 Tue, 19 May 2020 19:39:06 +0100 (BST)
References: <20200519025355.4420-1-richard.henderson@linaro.org>
 <20200519025355.4420-8-richard.henderson@linaro.org>
User-agent: mu4e 1.4.6; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [RISU v2 07/17] Add enum RisuOp
In-reply-to: <20200519025355.4420-8-richard.henderson@linaro.org>
Date: Tue, 19 May 2020 19:39:06 +0100
Message-ID: <87o8qjhir9.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42e.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> Formalize the set of defines, plus -1, into an enum.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

