Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 861E26BE9DE
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Mar 2023 14:12:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pd9s6-0005BD-Bt; Fri, 17 Mar 2023 09:11:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pd9s3-000580-7z
 for qemu-devel@nongnu.org; Fri, 17 Mar 2023 09:11:48 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pd9s0-0001aN-H5
 for qemu-devel@nongnu.org; Fri, 17 Mar 2023 09:11:46 -0400
Received: by mail-pl1-x631.google.com with SMTP id v21so5219268ple.9
 for <qemu-devel@nongnu.org>; Fri, 17 Mar 2023 06:11:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679058702;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=AhYAB7O+IMkakaxctTanNpAosRaUAatcuWdrwxF4m/Q=;
 b=nRCdfGIvYXYlEv9aCaeEkJ2UF/L7QBezAJnUnot7S+kOkRzNIXP98r7DH2eCJCUySB
 tx2/Bk1fAqPBoX0UXapHjorr7isN8iDuIPNOeGDoCml0IOsUZHtjKW0jJ0/HGSZ8NLUM
 62R3R39zFhHfi+mE6Z51tzXmnOGjb6z/a1Fly0bkjvsqOoNiNB8OAveUz0cCck+07L31
 LmG+PFhgOuBW8YN0RN4RsfBxIU+C9eEmzFlixIdxIPifNGdbJX4OUdNaBDTYbeok5njb
 SfYVA8p6iJpl3ED5Ohx1AIYc+sWjsHMpK8DhqUol9hc/SmED9IZIu1ofUvbhQiOzps1X
 8fXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679058702;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=AhYAB7O+IMkakaxctTanNpAosRaUAatcuWdrwxF4m/Q=;
 b=l07qvr2MyDg9XepQG2POqUwhfGW/nZMxv+CpWPUFvlid0X3jEW5vi9anqOVWywH5ng
 P82OorvuDzLdtOwOVtBaomtbzvo52Sl31qx83Quzon/uo6t6PpR5hEbLLt3AaFjztI1P
 S+kjVrIBRVyDyIxlHisA3rsD2CYEKa0x2i/HSrMNBf9ApRYb5a8g8/CzNpbRBz9PJiYv
 CQKkJ4hKEhCpRaoi9c/WVmDYiOB46Lh2UOvbRATDVKHTn5s5N7RgLyQo8Iyf+yJ3gV2G
 EOF6G0W+TeazTm5VzO3Z/LEBESs7YqAiAmJc5MDSkHXcUbUbwah81TLw3CtPZSC5dkb1
 hZdA==
X-Gm-Message-State: AO0yUKVhti3e7UztoOBJachoz0JOvtlpCRQQnvWcsbCCSnq1zWAohVrN
 kOnAXNOuybJkfsuEPs3dKwsUm2KDvVpFESJw8S/iqqzXwP5lVSza
X-Google-Smtp-Source: AK7set+KvO94gwSfZHkU/KJoSFN1hEAcd3Pd9D1VOXaf1R2nvDY+tpf8kvt9i7WmoEc4PbI9nOhHKutXSSwu28WP2l8=
X-Received: by 2002:a17:902:db09:b0:1a0:4be5:ccea with SMTP id
 m9-20020a170902db0900b001a04be5cceamr2865755plx.9.1679058702546; Fri, 17 Mar
 2023 06:11:42 -0700 (PDT)
MIME-Version: 1.0
References: <20230316151225.11362-1-quintela@redhat.com>
In-Reply-To: <20230316151225.11362-1-quintela@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 17 Mar 2023 13:11:31 +0000
Message-ID: <CAFEAcA_G6uqDfk6hFKYzk3QbA4Kge4t7bf5SLF8+peCdVVRaCw@mail.gmail.com>
Subject: Re: [PULL 0/7] Migration 20230316 patches
To: Juan Quintela <quintela@redhat.com>
Cc: qemu-devel@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x631.google.com
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

On Thu, 16 Mar 2023 at 15:13, Juan Quintela <quintela@redhat.com> wrote:
>
> The following changes since commit 9636e513255362c4a329e3e5fb2c97dab3c5ce47:
>
>   Merge tag 'misc-next-pull-request' of https://gitlab.com/berrange/qemu into staging (2023-03-15 17:20:04 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/juan.quintela/qemu.git tags/migration-20230316-pull-request
>
> for you to fetch changes up to fa76c854ae837328187bef41d80af5d1ad36681f:
>
>   migration: fix populate_vfio_info (2023-03-16 16:07:07 +0100)
>
> ----------------------------------------------------------------
> Migration Pull request
>
> Hi
>
> This is just fixes for migration.
> - Fix rdma (dave)
> - Remove unused variable (Zhijian)
> - Fix AVX512 and XBZRLE (Matheus)
> - Fix migration preempt (Peter)
> - Fix populate_vfio_info (Steve)
> - Fix multifd send trace (Wei)
>
> Please apply.
>
> Later, Juan.


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/8.0
for any user-visible changes.

-- PMM

