Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38D3D6C1E99
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Mar 2023 18:52:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1peJf8-0004jv-Pu; Mon, 20 Mar 2023 13:51:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1peJf7-0004jZ-49
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 13:51:13 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1peJf3-0001NB-W7
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 13:51:12 -0400
Received: by mail-pf1-x42f.google.com with SMTP id fd25so7465603pfb.1
 for <qemu-devel@nongnu.org>; Mon, 20 Mar 2023 10:51:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679334668;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=5T0QJBAB3StnkTQLYZ9bw5DoLVzXEGfPe7fP3cuFQfo=;
 b=IGxUPVi/NGNPl7RQhwqZNAbxsZ4YU+sWpxIcnztIKOPB4X9fVaClhbTmjMyqezFA0B
 ZytspiRXvQ4WgxBH+0pfPNvGd3R0kqBjlFP2FpTCCV4Q163mMOo1UIpAeFvz/E8Wvihe
 h+Th6fweECpuedo+qdzKPIMrKpcTBE/y4KkPWQXBhliffEmom2S/UAgNYAPWzJjA7MnM
 EzMtWjOecytaN1G/T2FqNRyBwsDiVXQmh6WdqUq+y51Iwd5J4gwNA/W2LJ4VCc8RL5Ds
 A8aXV7d+ZPeuTpEmqvTMRuqp515TepvxvIaKchzQnuOeWCgtzgTLTIf/znhvm2jSEELt
 LBCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679334668;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5T0QJBAB3StnkTQLYZ9bw5DoLVzXEGfPe7fP3cuFQfo=;
 b=He085JU4WlP+sCH/uIXg8DKsEctPIzx3iDQLapH3/s2U6Eh6pribtMaZ5yWHqrjmCT
 oewwwuyX7PlOpg2B6l5aW61nrxmRD0GxzA4NQ0nJknz3sUYMB1L45lMdwjK5WVcKKhsF
 o0z081ZiSh2rOA42o+wjhH9DcnEqED+UmMY8KE0dBDFwgIKphTA4fHV5jM0wtDVaadcA
 1aacPPagmgmW3xT3mNlqistwaOEDEkVQfHGUDvd/d6Dj5sUC5kgKeKr4fEcZ/duRIbGp
 P+97jhRwsZasDDZA9UyLfQYW4/sj9tVRZI9J94LGsarGgc5tGdYheBnh4gVQzDY+SLVh
 Zyjw==
X-Gm-Message-State: AO0yUKUMwN586du3nZKl0aXcvYIKiiCfOdCudHVIF+B2OweIzSXHsem5
 vn9ujkw3voN5j3ljohDWcCYsDERNz1qIJKGI0DOHEA==
X-Google-Smtp-Source: AK7set81Jx5mO/14juPOyFvyLusTP/yJN1qAMdIRsNecZVegoah/FPT/ZYdaE4bQZrmML1QASm9MpJkunN1Eaj1KlEs=
X-Received: by 2002:a05:6a00:2d8f:b0:624:1261:918f with SMTP id
 fb15-20020a056a002d8f00b006241261918fmr7608112pfb.1.1679334668139; Mon, 20
 Mar 2023 10:51:08 -0700 (PDT)
MIME-Version: 1.0
References: <20230320130330.406378-1-thuth@redhat.com>
In-Reply-To: <20230320130330.406378-1-thuth@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 20 Mar 2023 17:50:56 +0000
Message-ID: <CAFEAcA_pyT9NM5NFG0D6VRwC-_ZZRNwXBdtz2hxhGJYn0u1LMg@mail.gmail.com>
Subject: Re: [PULL 00/24] s390x and misc patches for 8.0-rc1
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x42f.google.com
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

On Mon, 20 Mar 2023 at 13:03, Thomas Huth <thuth@redhat.com> wrote:
>
>  Hi Peter!
>
> The following changes since commit 74c581b6452394e591f13beba9fea2ec0688e2f5:
>
>   Merge tag 'trivial-branch-for-8.0-pull-request' of https://gitlab.com/laurent_vivier/qemu into staging (2023-03-17 14:22:01 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/thuth/qemu.git tags/pull-request-2023-03-20
>
> for you to fetch changes up to 48805df9c22a0700fba4b3b548fafaa21726ca68:
>
>   replace TABs with spaces (2023-03-20 12:43:50 +0100)
>
> ----------------------------------------------------------------
> * Mark Nios II as orphan
> * Many s390x emulation fixes
> * Disable flaky complete_in_standby blockjob unit test
> * White space cleanups in various files
>
> ----------------------------------------------------------------


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/8.0
for any user-visible changes.

-- PMM

