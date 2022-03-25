Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 352664E73F4
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Mar 2022 14:07:21 +0100 (CET)
Received: from localhost ([::1]:48522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nXjey-0001pB-A8
	for lists+qemu-devel@lfdr.de; Fri, 25 Mar 2022 09:07:20 -0400
Received: from eggs.gnu.org ([209.51.188.92]:32930)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nXjbH-0008TM-1P
 for qemu-devel@nongnu.org; Fri, 25 Mar 2022 09:03:31 -0400
Received: from [2607:f8b0:4864:20::112d] (port=46885
 helo=mail-yw1-x112d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nXjbF-0007cg-EL
 for qemu-devel@nongnu.org; Fri, 25 Mar 2022 09:03:30 -0400
Received: by mail-yw1-x112d.google.com with SMTP id
 00721157ae682-2e5e176e1b6so82095347b3.13
 for <qemu-devel@nongnu.org>; Fri, 25 Mar 2022 06:03:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fjtOiPDbB+JSHhQacHys44d8NJiCQ4lJlbZPPDf4qtA=;
 b=rTfQQJUL2U9tBMzX+4DqsYdmsAEeeK7RWria4HoXHJQidTAj3O2Fy2JQFbfxWsYOhX
 HU+ho6V4yhCIhtzKNMU9ts8gezO1hXQCuBdlW88YfHnohA1zbqzqRJrXUDg3DRKeV1qG
 mak+nXFwqMgMQK4nIPOkfjcZgnT8+1A+U++kE6E1O2j/9dadjmF8rSPxyplsYVJv7cBy
 sDqcRz1mE52ufNIRIjuzRFZYZvPCOfJFd8h2iBE5a7p//5fxIqb0p8BxHHqXVvAV/3pf
 PhIgS2W4zB25Xp6CbKbDUOEEhla71HDcXJzQvgKZdovmdgjy6C+2oaAzg3BFXt6oLQgL
 LgHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fjtOiPDbB+JSHhQacHys44d8NJiCQ4lJlbZPPDf4qtA=;
 b=eAlERZ15YyOQIfTDM6wiT8zXmNle3OZQe9fG6jaKw/utQOo3u+eQL5SRAXn8wIP5AO
 4gPUQxFZ41lfX/VwakatcJqOcPln4KlhJ21PdPv91zfrBGCq0JA/fJ1YmSRBc2rHyIpl
 fA/icbyPqqPPsnNjB1erPL9tVWQkH3DnXwFd4Z8L0NeV5+bjj1XhBfQz3lTeuN1E5y7I
 Y/qXO7Y7sRajruOFVVgnVz/qIiBhp/LKxMlLwJ8DF0pb8kUv0l5W3BHS2chayeXamthB
 O537SXF2KEdEwKLa8yeoohVSKCbjk63SS4bwY9Aj8Cm8L6sbkBjF07w7VKwqjZPxa+h0
 xaXA==
X-Gm-Message-State: AOAM532NSju9zawMWW01tno4M2EBSmacG04LA7EmuPAOMNC5AX6gWeeB
 nuwV9tmjIM7RBKgd21gTjq+HroQ5YsHoKGhdydG2KQ==
X-Google-Smtp-Source: ABdhPJzrrPP5yhq7B6RFBIkX/ho73Veem/HcslMUGhPjSuvjXrDK01nvcey01YAXAv4e17I38nU4/NN59gcx7m3IEUU=
X-Received: by 2002:a81:ac15:0:b0:2e6:d7e3:c4ba with SMTP id
 k21-20020a81ac15000000b002e6d7e3c4bamr6163771ywh.10.1648213406505; Fri, 25
 Mar 2022 06:03:26 -0700 (PDT)
MIME-Version: 1.0
References: <20220325070706.271291-1-pbonzini@redhat.com>
In-Reply-To: <20220325070706.271291-1-pbonzini@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 25 Mar 2022 13:03:13 +0000
Message-ID: <CAFEAcA_Vr4r=-ug7JS2u+oWtaNboe1rPcg=5v3vJ-phtwPy4wA@mail.gmail.com>
Subject: Re: [PULL 0/7] (Mostly) x86 fixes for QEMU 7.0.0-rc2
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::112d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::112d;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112d.google.com
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

On Fri, 25 Mar 2022 at 07:13, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> The following changes since commit 15ef89d2a1a7b93845a6b09c2ee8e1979f6eb30b:
>
>   Update version for v7.0.0-rc1 release (2022-03-22 22:58:44 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/bonzini/qemu.git tags/for-upstream
>
> for you to fetch changes up to 9584d3d00a454f47b0341465142bcf0735d734ae:
>
>   build: disable fcf-protection on -march=486 -m16 (2022-03-24 18:44:07 +0100)
>
> ----------------------------------------------------------------
> Bugfixes.
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/7.0
for any user-visible changes.

-- PMM

