Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 09F02629E63
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Nov 2022 17:03:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ouyOR-0000jX-Bq; Tue, 15 Nov 2022 11:02:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ouyON-0000gr-8i
 for qemu-devel@nongnu.org; Tue, 15 Nov 2022 11:02:31 -0500
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ouyOL-0004qc-Jn
 for qemu-devel@nongnu.org; Tue, 15 Nov 2022 11:02:30 -0500
Received: by mail-pj1-x1030.google.com with SMTP id gw22so13711026pjb.3
 for <qemu-devel@nongnu.org>; Tue, 15 Nov 2022 08:02:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=9ZxBXQSyuqkkxQIJknN3fHMFrPp1FRL5mhjUM6c3Qsg=;
 b=vtz3E5b8a1cWhSAbUrQXWXAVLltQV9Q1tjRHpTFHXQMxYKIFvEMZwucAN8s3HUKWVH
 ySX6Tq0Y8OtbgOI7QYGgkQAE3jcQ7+bSLdn8Z446lvlmVkKJGWqcUb6ehM1c4vXOub3r
 vZ/Lo08kKZNpN1NYar8B1FKNI0UuucrS1CIZduSDBVnt1zc6McIo5qT1tNV18/oYm1Qc
 0RI2+AHdxsQIbjNg2bOmvQ2ZcoUpu5b+2k6fJ3uXez33VuSefnsAWZNKVdAFTIRZOAQO
 zwPdxPeSaL7vnLkQtOUOQSIsST1mOP4Up2JRh3b2zQKLWn09zSU4Pj2ZribMrZc7429c
 Yyvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9ZxBXQSyuqkkxQIJknN3fHMFrPp1FRL5mhjUM6c3Qsg=;
 b=MuWRFwTMA6+f/jOmpwprG6x+2BH/J+2KIRjNSnGW3LbbKtjLdTNXVFMrWA/4BwbPXU
 FCIS6dr9hUwvI1+ajBwF6HBN7IUlSvbT8FGlv9ttZY4FvqY4tEG5YlzItBjIHDbnRali
 gtabcBvHXG8q9RGE8BfyitfDZCnPKhcgxH/Wxkx9s6J5CFRsFE0V0HbED7RL1Lmdw0TM
 +QIuN+/eHkP5downeI/M1oweoJhwwC/BfEc1mb4YRuGCNPmzvmZULfPMMIDIaT0n6Djc
 6D3+5h0R7WASDew3QPkE730yAtRtTBtUY6dW1F1dmxRtcrS4/zFwS1tIRYwWBxiKHgo6
 2lLg==
X-Gm-Message-State: ANoB5pkgKTo+Y+FBe6DviO2PlVdoL9KkAUzgXb+0HaLp9fdIl6Wvm1AX
 AjmKHYCP6mgTeMOzVGGSD4tj1kBB6ZX3t8Te5YxGTQ==
X-Google-Smtp-Source: AA0mqf7MmdiXBtVpucaEl7Maex5jI2tNUPgoMJWrfu5uhZxR+CFbtnGKscx0oHmtpBAn4ovTHfdjKJ4WzaW1q3Wnzo8=
X-Received: by 2002:a17:90a:bd0a:b0:212:f169:140e with SMTP id
 y10-20020a17090abd0a00b00212f169140emr2807659pjr.215.1668528148065; Tue, 15
 Nov 2022 08:02:28 -0800 (PST)
MIME-Version: 1.0
References: <20221112214900.24152-1-strahinja.p.jankovic@gmail.com>
 <CAFEAcA_F0jcjviRGjgmb4J_Kos22+UE0vPbcXoTbPCP7xz-nXA@mail.gmail.com>
 <CABtshVRnwQiTypOFaOqVE69+1wbVoVJEy_x7ELez8Mo6aXT=Yg@mail.gmail.com>
 <CAFEAcA-s9a2zCy6O0j6=OXZOcYbj=_mS=aa2vxbKbuSMKNjMoQ@mail.gmail.com>
 <CABtshVRjHMwoN+itKsty-==J8OpZFzuGUB5SsJ+UFPrZ97d6uw@mail.gmail.com>
In-Reply-To: <CABtshVRjHMwoN+itKsty-==J8OpZFzuGUB5SsJ+UFPrZ97d6uw@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 15 Nov 2022 16:02:16 +0000
Message-ID: <CAFEAcA9e+--A-8-1S-sgvEhCwhsMB3ALAN3XO5NTKs+B7R7fJw@mail.gmail.com>
Subject: Re: [PATCH] hw/sd: Fix sun4i allwinner-sdhost for U-Boot
To: Strahinja Jankovic <strahinjapjankovic@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 Beniamino Galvani <b.galvani@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x1030.google.com
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

On Mon, 14 Nov 2022 at 19:22, Strahinja Jankovic
<strahinjapjankovic@gmail.com> wrote:
> Ok, I will start preparing that separate patch for error logging for sun4i.
>
> Since this is my first time submitting a patch, is there anything else
> I need to do with this one? Thanks!

No, I'll take the patch from here. Since this is a bug fix
and we're not yet at rc2 I think we'll be able to get it
into the upcoming 7.2 release.

Thanks for submitting the patch!

-- PMM

