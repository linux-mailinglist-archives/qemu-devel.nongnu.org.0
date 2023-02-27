Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8712C6A46DE
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 17:19:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWgD8-0002ZN-Uu; Mon, 27 Feb 2023 11:18:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pWgD6-0002UR-Gi
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 11:18:44 -0500
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pWgD4-0001lj-Td
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 11:18:44 -0500
Received: by mail-pf1-x436.google.com with SMTP id cp12so3105677pfb.5
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 08:18:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :from:to:cc:subject:date:message-id:reply-to;
 bh=UskA3uCy8fREgppDGZ0c/eBa3833IwCy2ycyiANK1V8=;
 b=d+kP3v8lGxJi2v++9e7tYVvnCZ1y+ooAMsqN1FZjAyvDR5hKW+EE8kYUr4Cx8YNVoq
 Tp2rdUvYRyJaDRc3GdqUUzQZwtLLggVKLUvLYuHTMMthyocXORWVM4jQdKEGPyHMACqT
 MIUtWIE3CzDyUgC+r/zXoFRo7lQ0ft5GKeoyI6nXGqG0FwdGU0n8nHfqC4QGecGk0n+t
 xyH2TfQydjz5ksEECJTM/XYg1ZGQJSLWxDC7XXxnnmN1zwfZf8S6BHON8hKNynYdmPEl
 dO9FZ/mwMe9YwBWR1gY/Z7khCo6JQzKZCo+hC8erWwvCiB1tW/NiSbPtKfJ5nAp8jpO+
 FNww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=UskA3uCy8fREgppDGZ0c/eBa3833IwCy2ycyiANK1V8=;
 b=3QIGp0DubWA9aaHCk86QOCP39OVOmoAi4GTgd3UzwwAvdFNOxuSLfdnC5bjQH8+3/2
 SVexW8xz2Zu6LSRU8DZPygceMQFBNeseIJPHcSfe1qok2eNa5XxHcsx2Nt6djeH4nR5v
 OAQN2eWKQj44PyTQikFNhy/n3+oEmDLVKUDiss6zE7FbXYj9lI6S3hVbAebNG1YoHZNs
 8nt/dQ11bFAqekItEatXU+DQBds9f68Fi4Yic+1R6YqO2DfmawvhBm/f5ARG7T2IiBtc
 Vzzp/kdHJUV6VqBJ18gdFc9AN3AONc/PhWGqOLQJRWiaanbH9Sg1qsSF+AvtuwhCYBIF
 MH9Q==
X-Gm-Message-State: AO0yUKXpZta392hUp95Nyn01tGBinTi8pBY6LkzedERthyRSspO4OJil
 RTTIhnppBeAzH63GzQ5seBp4indYIRU2h/EP2q/uiyGWKiXkEw==
X-Google-Smtp-Source: AK7set+AuMp6uXOVgpwSIPYlS0o23bdDbjwcG0/KVIXebBPRYzPa2CcTBDCSu/kPCjDrikzMIuIcUQyy6/12HQfGprQ=
X-Received: by 2002:a63:3fc6:0:b0:503:2583:effb with SMTP id
 m189-20020a633fc6000000b005032583effbmr2620243pga.9.1677514721375; Mon, 27
 Feb 2023 08:18:41 -0800 (PST)
MIME-Version: 1.0
References: <20230227140102.3712344-1-peter.maydell@linaro.org>
In-Reply-To: <20230227140102.3712344-1-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 27 Feb 2023 16:18:30 +0000
Message-ID: <CAFEAcA-1AZaT7EqguzSLpVak6JMtMsohNtp6-uU-W03cz72Dcw@mail.gmail.com>
Subject: Re: [PULL 00/25] target-arm queue
To: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x436.google.com
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

On Mon, 27 Feb 2023 at 14:01, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> The following changes since commit b11728dc3ae67ddedf34b7a4f318170e7092803c:
>
>   Merge tag 'pull-riscv-to-apply-20230224' of github.com:palmer-dabbelt/qemu into staging (2023-02-26 20:14:46 +0000)
>
> are available in the Git repository at:
>
>   https://git.linaro.org/people/pmaydell/qemu-arm.git pull-target-arm-20230227
>
> for you to fetch changes up to e844f0c5d0bd2c4d8d3c1622eb2a88586c9c4677:
>
>   hw: Replace qemu_or_irq typedef by OrIRQState (2023-02-27 13:27:05 +0000)
>
> ----------------------------------------------------------------
> target-arm queue:
>  * Various code cleanups
>  * More refactoring working towards allowing a build
>    without CONFIG_TCG
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/8.0
for any user-visible changes.

-- PMM

