Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DFDA366015B
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Jan 2023 14:36:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDms8-00049x-SR; Fri, 06 Jan 2023 08:35:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pDms6-00049T-33
 for qemu-devel@nongnu.org; Fri, 06 Jan 2023 08:34:58 -0500
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pDms4-0007m4-FW
 for qemu-devel@nongnu.org; Fri, 06 Jan 2023 08:34:57 -0500
Received: by mail-pj1-x1034.google.com with SMTP id
 m7-20020a17090a730700b00225ebb9cd01so5188082pjk.3
 for <qemu-devel@nongnu.org>; Fri, 06 Jan 2023 05:34:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ZAEZToV6dQN1Wfd7eigi/dQDdk2f8TwKYEhlS0tTawM=;
 b=m4hVCDmcqywUfquL6jor823g7hJTl6GFLOkpSQ/JX9NLgRaoYwzLr43JFWQmhChAIi
 gWu3SCcXmBcg42LYu3sV3HbSPY/Zo4Zq1WLxml3NLwrMjhvbnscBxqLyDCD9cz4gJlFf
 xhKCigk70x6/iDb/gIpn24SyvyG9o/CISkHNu3WJqnczDxcMgxVNEN5bJDFHCMDmUVo5
 EISkZfkl45Gk3nHxeSc7FmJ6WmTz7Eu9NYyuYqlYF+ZCKX9NxDgQsXbhxORq6Ku1IrTv
 GHaDxFjptUp1owHywQovsdoWSH/vluqFvkEA+9DLc+T1bk7LZ2EkFLiiROPoWhIaPfZN
 x2AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZAEZToV6dQN1Wfd7eigi/dQDdk2f8TwKYEhlS0tTawM=;
 b=vqTfaW6tNdO4FHzFnVMj3WTBmo+fni8YLWDeTSNSp4hxopiH7Fod+pzcAw5LMMRhuX
 AwNacvXxN9OSFrh+7W33226zpHNqVCvESGQQWZ5OfTxm1PdQ+vqwNOL/SAvqdOyrjQsf
 eiJES08vZ9zhsnWjpeu/0Y9AlzXHJf0Jx5X41zUTC2HTgw+JxmXLfgjxyBFxMt2FSmLm
 ioKd+duZ17EsYhY34bB8Wyrf5TwphJzjYNPOBOfcSXJoPmRA7HjZMYJuxqgHOPWeTJ8v
 Qur5xROUGrqN8bKuPgaq4B6VC5AXKoVfzIQZvqykR//yiGtQ2v6vb0KJbXPncsU4Got6
 15Aw==
X-Gm-Message-State: AFqh2krdyqavDfKrFGcb+M+VAXc0YHOHzC1bXgeZ8uMu5xjMDADYezQr
 d3F28aZD4+hhr4XMGCRIECOJZ4d4tbhF3CwfoDuzjA==
X-Google-Smtp-Source: AMrXdXv2bs/jxMxWjfLJuCMMUQvfOTs6x0vBbyC3dFb17SGDNLLEtWBlp21GbPYkJTXpmGEOjUEUKwyzHeVbpSx3EN4=
X-Received: by 2002:a17:902:efcf:b0:192:ea33:5092 with SMTP id
 ja15-20020a170902efcf00b00192ea335092mr772692plb.19.1673012094863; Fri, 06
 Jan 2023 05:34:54 -0800 (PST)
MIME-Version: 1.0
References: <20230105173826.21444-1-tsimpson@quicinc.com>
In-Reply-To: <20230105173826.21444-1-tsimpson@quicinc.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 6 Jan 2023 13:34:43 +0000
Message-ID: <CAFEAcA8R7TMJ48Zj_qqG_RrYsMLvy1JcziaPSQscpv-b0Aiezg@mail.gmail.com>
Subject: Re: [PULL 0/7] Hexagon update
To: Taylor Simpson <tsimpson@quicinc.com>
Cc: qemu-devel@nongnu.org, richard.henderson@linaro.org, philmd@linaro.org, 
 bcain@quicinc.com, quic_mathbern@quicinc.com, stefanha@redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x1034.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thu, 5 Jan 2023 at 17:38, Taylor Simpson <tsimpson@quicinc.com> wrote:
>
> The following changes since commit cb9c6a8e5ad6a1f0ce164d352e3102df46986e22:
>
>   .gitlab-ci.d/windows: Work-around timeout and OpenGL problems of the MSYS2 jobs (2023-01-04 18:58:33 +0000)
>
> are available in the Git repository at:
>
>   https://github.com/quic/qemu tags/pull-hex-20230105
>
> for you to fetch changes up to dc63b1492c2d8140d3b47093700bb9bb52c0d97b:
>
>   Update scripts/meson-buildoptions.sh (2023-01-05 09:19:02 -0800)
>
> ----------------------------------------------------------------
> Hexagon update: patches from several folks
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/8.0
for any user-visible changes.

-- PMM

