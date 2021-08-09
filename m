Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A56AD3E474B
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Aug 2021 16:15:33 +0200 (CEST)
Received: from localhost ([::1]:48078 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mD63w-0003Mz-Ez
	for lists+qemu-devel@lfdr.de; Mon, 09 Aug 2021 10:15:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34206)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mD5pQ-0006iF-Fs
 for qemu-devel@nongnu.org; Mon, 09 Aug 2021 10:00:33 -0400
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e]:37774)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mD5pM-0002MH-PZ
 for qemu-devel@nongnu.org; Mon, 09 Aug 2021 10:00:31 -0400
Received: by mail-ej1-x62e.google.com with SMTP id h9so8305816ejs.4
 for <qemu-devel@nongnu.org>; Mon, 09 Aug 2021 07:00:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zbsFVvj5AXr2jJ6MMv4wFnBfuFF4ZVxBj93FAViEuVY=;
 b=j4rFitS4SEjaWcl9tXL2m6HhvMafBBYDMGpLJkjBVREDPjJ3vShRR6LZRgoSCnCU/Z
 WVvb7Lo0aWLtjVaO6zGX52NxEPLGOienxqsNdTWO1AuoEFhir/COQDnKJg7P2o5LbT+b
 2nKCoSTeLLO6sJ/DjHod2vUxi/iqDyvihYEI0H47qkhFYO1G1ivp1+5xft+g59DSGMYv
 d9i24LhAMlSRX3qTGLn0yGSAS523V8IYPH2wfrBck7/4Wwfrmq9iqKftqhD0soMcT0a6
 cjnz5d5RTrFdZbHCPhyjMdu/7Y9SMnN+ueuAJdu0NIlAR96AP5XgMOp/toD7ArMrpWGN
 Innw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zbsFVvj5AXr2jJ6MMv4wFnBfuFF4ZVxBj93FAViEuVY=;
 b=BgIBN+pe5UoLN+a7zJrRRVzNsHv0/ZoVX6b1kI4r0cgSl1o59trDlzccDfv4m79MxZ
 jdphGcomZ/wbGTsFHx9ops0TvNg+EGfWPrVyU6WxHLkpN3s0nGi/40d906PJPMJysmTj
 OpeAI9UB5qzBHdrn56lpn6rzQivBOeh5O8yZ/lLr6MMOBmdwlDNhmu0Lk1Nfb/Lri1SR
 G9tenENLabo6+Bo6G05STtEhupD/4EdatDqHEcfoIQBy5lA+FWjxDvHYawXXyREEvZ4T
 kNd04y9xns7gIe39w9Ox7MGP3a2jNOH+7lXh5LrHLE2xSDhofl9KB/cO+ataThme2C1K
 s4XA==
X-Gm-Message-State: AOAM533jNpubiIFheJDpF3DsQsct1B0fpTj/bOKugeMUrEWXfofCKQ4+
 e8l5jGu/ZHbm1VoVhmF0VwWpqlx8IzCUlkGlIAAwDQ==
X-Google-Smtp-Source: ABdhPJw7bf5gRqsZ0QLtZO7hp3AE+p4IoM/VTaB2MPSXkTjqtjJoCmNIU7+ZGM8AOeIEYUWt4hIAah458l4ecGzkhqk=
X-Received: by 2002:a17:906:aac7:: with SMTP id
 kt7mr4001431ejb.4.1628517626779; 
 Mon, 09 Aug 2021 07:00:26 -0700 (PDT)
MIME-Version: 1.0
References: <20210809094530.230065-1-pbonzini@redhat.com>
In-Reply-To: <20210809094530.230065-1-pbonzini@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 9 Aug 2021 14:59:42 +0100
Message-ID: <CAFEAcA_7h1eynFBTR7ogciSZWNO7qh7JQkfj-AVKfTUhGr0O0g@mail.gmail.com>
Subject: Re: [PULL 0/1] Build system patch for 6.1-rc3
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62e.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 9 Aug 2021 at 10:48, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> The following changes since commit dee64246ded3aa7dbada68b96ce1c64e5bea327d:
>
>   Merge remote-tracking branch 'remotes/vivier2/tags/linux-user-for-6.1-pull-request' into staging (2021-08-06 10:28:33 +0100)
>
> are available in the Git repository at:
>
>   https://gitlab.com/bonzini/qemu.git tags/for-upstream
>
> for you to fetch changes up to abc14fd05606274d8350f1f90d1ec7bc9e51aa21:
>
>   meson: fix logic for gnutls check (2021-08-06 15:36:11 +0000)
>
> ----------------------------------------------------------------
> Fix for gnutls-crypto detection
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.1
for any user-visible changes.

-- PMM

