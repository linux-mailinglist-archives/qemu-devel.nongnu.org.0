Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3653F6BE9DB
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Mar 2023 14:12:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pd9rp-000559-BX; Fri, 17 Mar 2023 09:11:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pd9rn-00054K-4d
 for qemu-devel@nongnu.org; Fri, 17 Mar 2023 09:11:31 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pd9rl-0001Vk-CP
 for qemu-devel@nongnu.org; Fri, 17 Mar 2023 09:11:30 -0400
Received: by mail-pj1-x1034.google.com with SMTP id j13so5045871pjd.1
 for <qemu-devel@nongnu.org>; Fri, 17 Mar 2023 06:11:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679058688;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=PNhLBCtZ65LPMcPDSHrce/Lmen19PA5glVxY2XUETbA=;
 b=x9NLN+6wabolgN/8reMkxNeo/cECxlrEdcz2PRpnJ8M1YxTsLVe2Z8UtDG+Sh10BQm
 WUobO5sxl/lbMuC/vb3TVeLIaw0T5vVoVrAGMIVKcLlOCtpHhCUfCErPz/3YU0QL6pPg
 SeE00Uo/7x3AiBZZFElWIRzvx6UxRF7qwTpX/ahEOuiYqY14STBeqbyp/NJ+/KN9TZbo
 2vqQkIbgHg+gf7gzrNmyUTipkdtKPWfd8JEqORyK9XUqeJSXT96lKY96WBAAyuMlHvu1
 8maThvU6wgPEjCasYqTJK98K3sD6Hlz2V0/XR0flOiFLKk4nYqd+qvD8p2DqGslhR9mY
 Cz0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679058688;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=PNhLBCtZ65LPMcPDSHrce/Lmen19PA5glVxY2XUETbA=;
 b=QXMxduxqWQrXwmp+hmjRi62VOlRpDVPnco/A8/74owcg+H4E4UAKIAGyiZ0Ciywox5
 eMZTdl/0wt66yXsp2323b8FU0RBSeWHjibibzMQtdWn9xBmMA18z+IHzLUWUkMeRXd3d
 u1Mc3INTPBcuYMaE4SMnbx+0W3+WkwfijGriZm+3r9KgCYmFLsgSmCIHpsim2FBtqgRv
 Ahife4nuVHqvW+UV7mhqREQuWUZgwL7OdGotZJI10yk/9bYM/CTMAYz4yfL3qIEaa/ML
 B3uzfZuXviG9XuI9nzmANkoL4HmRAoVn0wwZ59xZ+FpUwABbH6QmH0GqXs47bXDvwfRm
 z+8g==
X-Gm-Message-State: AO0yUKVez9uVmS3QTnulgAjySvIPFt6kuWpnQ5Bd3qPoQpxUdehj3CnS
 qWMcNKxjkb48Hzv0TZkzTVK3B2eLauTi2jKq7TXgFA==
X-Google-Smtp-Source: AK7set/+lcdtswjvr070LLy4vN6GdQ8GqXCTgbaSfZCiGhMGYRm9WQCqA/2RcW4JqVMFUSkxApSP0FJsK39Ar2/AzhU=
X-Received: by 2002:a17:902:d490:b0:19f:36ab:c2a with SMTP id
 c16-20020a170902d49000b0019f36ab0c2amr3016039plg.9.1679058687854; Fri, 17 Mar
 2023 06:11:27 -0700 (PDT)
MIME-Version: 1.0
References: <20230316103957.1665713-1-kraxel@redhat.com>
In-Reply-To: <20230316103957.1665713-1-kraxel@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 17 Mar 2023 13:11:16 +0000
Message-ID: <CAFEAcA8CN7pCcOqjEYnhSNe1MeqinUysMOLmRYtezx_T+MTZEg@mail.gmail.com>
Subject: Re: [PULL 0/2] Seabios 1.16.2 20230316 patches
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: qemu-devel@nongnu.org
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

On Thu, 16 Mar 2023 at 10:41, Gerd Hoffmann <kraxel@redhat.com> wrote:
>
> The following changes since commit 652737c8090eb3792f8b4c4b22ab12d7cc32073f:
>
>   Update version for v8.0.0-rc0 release (2023-03-14 19:25:05 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/kraxel/qemu.git tags/seabios-1.16.2-20230316-pull-request
>
> for you to fetch changes up to d80d761daa1674cfe86b79e1b2043fa21f010f8e:
>
>   update seabios binaries to 1.16.2 (2023-03-16 11:04:18 +0100)
>
> ----------------------------------------------------------------
> update seabios to 1.16.2
>
> ----------------------------------------------------------------


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/8.0
for any user-visible changes.

-- PMM

