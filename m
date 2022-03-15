Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD5B34DA015
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Mar 2022 17:30:08 +0100 (CET)
Received: from localhost ([::1]:53434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUA3j-0001oN-GP
	for lists+qemu-devel@lfdr.de; Tue, 15 Mar 2022 12:30:07 -0400
Received: from eggs.gnu.org ([209.51.188.92]:53724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nUA2X-00016I-1X
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 12:28:53 -0400
Received: from [2607:f8b0:4864:20::b2e] (port=42703
 helo=mail-yb1-xb2e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nUA2V-0001nG-Hb
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 12:28:52 -0400
Received: by mail-yb1-xb2e.google.com with SMTP id u103so2997295ybi.9
 for <qemu-devel@nongnu.org>; Tue, 15 Mar 2022 09:28:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=pFla6fwlp6bIgcIU9OqTq/8hx6uol18Hdboh+9k6GFA=;
 b=H1sDDPFUChdC7imhgMszo8Yix1ZSY6BO6e58CdIqF2CPMcV+DhImZmbso7UJ523/Ns
 e65mTxngH7tBUlpTzgt63AjhZtXnzvCWi4+fFyjWq/BH3yrsmFlaLaBWjuP17/FkaQWe
 eB5tNO+NbM74S3SdEzyX6XaWMPv2VK8A9lR38aqEeoY4d6L1Gn928n9GKVuevyY3qzxY
 VpxfJKGv0nM264W1CUH3RunwuRGShCO/Be+n2X8oj8u1r84SCNS7v/hEdjgGeBgchFfL
 f5EXleuSg3wQ2Hx67j6XHD4m7I4Tfr8MMGT8FtwbQCADLMZsF4GtTsTTMwtwEZEGCKtm
 yx8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=pFla6fwlp6bIgcIU9OqTq/8hx6uol18Hdboh+9k6GFA=;
 b=Hbyc4oNNSfJRBtmEBxxO/thQe/t6OoPNRCuqLBlp5GtJVhH/uZe1p0GPWw4KNs/LSR
 sFfNFOxq1iwZVfrpd+9Y8ItQDJxzhvIiVCY6H+JTtBEFMxVI4fRP4VE1DHavEGB63yqR
 mnutTnTE/P/S9y/dBTivHIZ1yQPbhxaHjLDoTj7YtlAGzV8GX9E0nbiB170CsjdFWb01
 OpzHoQ08Z3B528CglF8CRcOTqi9ncLBzZuimJLjYi5cQpZZowCnp9jyX4twKsVY7MjCo
 ZOlua1XvxWtd4hlLuKe1yhc8Zoc1XCE/adXTymZ3rcEgdugPIoB2TqnKTBDaELJTUmvu
 XCLw==
X-Gm-Message-State: AOAM533ztCn5GH8+awMoSoRp2c1LdQODj+eTBGmIJaiqXvOdEfxhbUr2
 bgLoNmKh0MVdwM3O8fhO2/Ljj0C9x2sFCEkpndakqg==
X-Google-Smtp-Source: ABdhPJwpFS5skhhUN50lv3XKzMGkLUYdgTEC3EYIUzi2DRG4n/URD5gNOnHAMap7d2ItC/KolCSYmOK5Jc9pJmIldCo=
X-Received: by 2002:a5b:350:0:b0:628:86b8:6e09 with SMTP id
 q16-20020a5b0350000000b0062886b86e09mr23607151ybp.39.1647361729382; Tue, 15
 Mar 2022 09:28:49 -0700 (PDT)
MIME-Version: 1.0
References: <20220315105450.1587293-1-pbonzini@redhat.com>
In-Reply-To: <20220315105450.1587293-1-pbonzini@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 15 Mar 2022 16:28:38 +0000
Message-ID: <CAFEAcA8uhfweD0ZkJuoZeFeNvLt8oxRdS+-zK578JeV_v2_yzA@mail.gmail.com>
Subject: Re: [PULL v3 00/22] QEMU changes for 7.0 soft freeze
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b2e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2e;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2e.google.com
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 15 Mar 2022 at 11:04, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> The following changes since commit 6f4fe14b46f0a161f94e3f6e98690ac38184b0=
be:
>
>   Merge tag 'pull-tcg-20220314' of https://gitlab.com/rth7680/qemu into s=
taging (2022-03-14 18:11:36 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/bonzini/qemu.git tags/for-upstream
>
> for you to fetch changes up to 8a5606f6449c90a0731790ed03eebedcf7045070:
>
>   gitlab-ci: do not run tests with address sanitizer (2022-03-15 11:50:50=
 +0100)
>
> ----------------------------------------------------------------
> * whpx fixes in preparation for GDB support (Ivan)
> * VSS header fixes (Marc-Andr=C3=A9)
> * 5-level EPT support (Vitaly)
> * AMX support (Jing Liu & Yang Zhong)
> * Bundle changes to MSI routes (Longpeng)
> * More precise emulation of #SS
> * Disable ASAN testing
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/7.0
for any user-visible changes.

-- PMM

