Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 06241690CC0
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Feb 2023 16:19:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQ8gM-0005w8-9t; Thu, 09 Feb 2023 10:17:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pQ8gJ-0005vv-QP
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 10:17:51 -0500
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pQ8gH-0007eP-Lz
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 10:17:51 -0500
Received: by mail-pf1-x429.google.com with SMTP id n2so1537263pfo.3
 for <qemu-devel@nongnu.org>; Thu, 09 Feb 2023 07:17:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=dcO5jjEXQrWU4aupAIDgHuVo99C9hsYMH9llLfX5nsY=;
 b=kzUSDNzlXYu2jNhtXTfqwWn4Nb930IKh1W7t11Re0AaY3gLmWyXNWpBhmXFXROv6Sy
 FCbXmE7kDP8Pw1Xe2XmYyU3eQ66Q5Bf95QbTqgTPYSkRQx2YQieJCFq31QTOFsxUuzp2
 TSJ6512OCyjTfEt6GThBWdU+2I7T5ccU8yqAtSfrAhpDhTlha/8csVh29zDbVkL6iOBc
 8XlnReRVpuFKMw+GRrrOiPYTDSNIk4v7Lr1rSQ1tm/L1/gZHrNcwgVgl+rBd5moOkeBl
 3oMativKQ4QOotPubMlgOitnGqngOX4YD/h6uLJx9pUd58oXh3QZRJ8arsQjry5RZDl1
 a+HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dcO5jjEXQrWU4aupAIDgHuVo99C9hsYMH9llLfX5nsY=;
 b=lUNXM1fmbpfb86+M65czHwIld+vJivj5tRNOzbxHWPi8rcvX+hir47Y4TGPg/VhXkk
 46n8LhsKJxUOfz/tsZZUY72s4w9I17mh4//W5ByJquLAplq3KyAjJ6yWSHALiQVyg3y0
 SO1xE33uuXQlBNNr3vVk6cO7O6FpkHexE4B2Yjh4RpI0Q348P2t0VnQRITlPY2IkBQYg
 fqCdlgy6D3HyFU65HKZ9dGaECd0SsINOcK2Sm8NYCcNdyZR1+bOJ/zJjwEOybTbNYt7j
 1pxcFfuLFZTHXYvZSfu2RqOsMbA5rhXoYXL8YKAtqrvSce9H8yLDY+vG2HoGEIUDtbQF
 +pNQ==
X-Gm-Message-State: AO0yUKUblwjHX0lXJc4Z3O/5yrmwVCO70n8CV4P0tqAd2yIe7QtSc6d0
 WZFMLtDLxf4XHH8Qs42SIZH7t+Qqx4Ko4uAzLJCdRw==
X-Google-Smtp-Source: AK7set833//0XmBhLMfaeZH7sD6vcNTVgW3Q6/cl1kaqbJWJuW7FQV/MyCsuc9U3lba+sYZWiy9ctYkOdxs1QqYiAik=
X-Received: by 2002:a63:b944:0:b0:4da:e1c7:99be with SMTP id
 v4-20020a63b944000000b004dae1c799bemr2282918pgo.37.1675955867811; Thu, 09 Feb
 2023 07:17:47 -0800 (PST)
MIME-Version: 1.0
References: <20230209093514.177999-1-pbonzini@redhat.com>
In-Reply-To: <20230209093514.177999-1-pbonzini@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 9 Feb 2023 15:17:36 +0000
Message-ID: <CAFEAcA8YhD2j316m47VC8pcx9Wi94p+71iCgKRjgj_9yrvOFLw@mail.gmail.com>
Subject: Re: [PULL v2 00/11] Misc patches for 2023-02-08
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x429.google.com
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

On Thu, 9 Feb 2023 at 09:36, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> The following changes since commit ae2b5d8381a73b27f35f19c988d45c78bb4d5768:
>
>   Merge tag 'pull-include-2023-02-06-v2' of https://repo.or.cz/qemu/armbru into staging (2023-02-08 10:40:06 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/bonzini/qemu.git tags/for-upstream
>
> for you to fetch changes up to 92f5d4606bedf0e2af0169a32aff9443084c5d0a:
>
>   target/i386: fix ADOX followed by ADCX (2023-02-09 10:17:34 +0100)
>
> ----------------------------------------------------------------
> * block/iscsi: fix double-free on BUSY or similar statuses
> * catch [accel] entry without accelerator
> * target/i386: various fixes for BMI and ADX instructions
> * make the contents of meson-buildoptions.sh stable
>
> ----------------------------------------------------------------

This seems to consistently fail on the BSD jobs:
https://gitlab.com/qemu-project/qemu/-/jobs/3742560167
https://gitlab.com/qemu-project/qemu/-/jobs/3742560168
https://gitlab.com/qemu-project/qemu/-/jobs/3743330014
https://gitlab.com/qemu-project/qemu/-/jobs/3743330018
https://gitlab.com/qemu-project/qemu/-/jobs/3743909430

Unfortunately the logs don't seem very informative :-(

-- PMM

