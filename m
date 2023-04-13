Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 07A5D6E0DEC
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Apr 2023 15:03:56 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmwav-0000vM-6H; Thu, 13 Apr 2023 09:02:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pmwaq-0000tz-Lo
 for qemu-devel@nongnu.org; Thu, 13 Apr 2023 09:02:29 -0400
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pmwao-000842-VJ
 for qemu-devel@nongnu.org; Thu, 13 Apr 2023 09:02:28 -0400
Received: by mail-ej1-x631.google.com with SMTP id ud9so37029215ejc.7
 for <qemu-devel@nongnu.org>; Thu, 13 Apr 2023 06:02:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681390944; x=1683982944;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=KhZwMJhXYhz9Fp+tcKUjxVfIUgLd9SVLQid78O49A00=;
 b=dqpVZJIaMBWXOxbx4cUyyU70cRvAJsw8pHKDlHNxzeRx7TUtuOW6s+9kiLVYELzLb3
 bAceoVRTxPM4rOcMtySBXyUsl8Qe29bNYVElbVVj/voMe0q6qOEPQmvjO79olahtd2il
 zH694i4mMXQMXErckUuqG0g5WILQ78nL9GP4ExwRndSCCM9U2gFrXP5evcY5vM0RoCEv
 i21mNR4H5UF44+c71OeAj6aU1kOhKQiDS4h44am6cTsPKoqvCwgh/7t1t5vkCIxPq3+P
 dYAFeHZLat+rTDSOUZ8g/pdcngemXUsMwqdpoeMfP1Q5smLtEwwBYw3QSVI4jjRXVkzY
 fNlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681390944; x=1683982944;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=KhZwMJhXYhz9Fp+tcKUjxVfIUgLd9SVLQid78O49A00=;
 b=jPJJG/WJdRlCfIU97l96Ubic1DwVPI4FKZ6NHU7StSRnan+yyT6rvV1kgNJBlzVm4U
 YVFetMOunDTIYnEOGZgzKBF1Do6Am1OXQAKKyPxobcstd46sP5kVj8r9leejCFuyqc7r
 9Q0kEF4jIi4MHmVfF/Y6HFGV06NctBy2XvSCip3NUs0cjxXHmgec2Jp2P7txcFE5wErk
 0z+m2oUpP+yneyzqJEH5InbQ65vjWOfr+8M3VK7Oh0e3Cuu2qgQwSmo+AlM976zT0Ivo
 /xstEWbeWfY5oRTMmai6tLleDndLRf1jZ/N8eiNDdkYNEN1+cnkJnvX9SQtgys/kK8wo
 T4RA==
X-Gm-Message-State: AAQBX9cz1wykZTale1CvkUw4rb9tvUUbK+vCgudM+skYiPC+Xy6XlnIi
 TQFpoAaKE2BKOHe/Fjy1EOEbNVaWpLq6f0ofXpXnig==
X-Google-Smtp-Source: AKy350Yt8YXof0pndyDFSc//1j56PGbKZEgoAeesPwj4Dqqu3K8LxHEa0sgnDmodntfGwWV1w9ftSn9J4odxWan5dmg=
X-Received: by 2002:a17:906:d970:b0:94a:972c:c28d with SMTP id
 rp16-20020a170906d97000b0094a972cc28dmr1310959ejb.6.1681390944528; Thu, 13
 Apr 2023 06:02:24 -0700 (PDT)
MIME-Version: 1.0
References: <20230412214507.19816-1-quintela@redhat.com>
In-Reply-To: <20230412214507.19816-1-quintela@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 13 Apr 2023 14:02:13 +0100
Message-ID: <CAFEAcA86Vj7K_9WvgxNzON07a4WdUDiWPtkZwdSeNSfnTEMgCA@mail.gmail.com>
Subject: Re: [PULL 0/5] Migration 20230412 patches
To: Juan Quintela <quintela@redhat.com>
Cc: qemu-devel@nongnu.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Yanan Wang <wangyanan55@huawei.com>, Eduardo Habkost <eduardo@habkost.net>, 
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x631.google.com
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

On Wed, 12 Apr 2023 at 22:46, Juan Quintela <quintela@redhat.com> wrote:
>
> The following changes since commit abb02ce0e76a8e00026699a863ab2d11d88f56d4:
>
>   Merge tag 'for-upstream' of https://repo.or.cz/qemu/kevin into staging (2023-04-11 16:19:06 +0100)
>
> are available in the Git repository at:
>
>   https://gitlab.com/juan.quintela/qemu.git tags/migration-20230412-pull-request
>
> for you to fetch changes up to 28ef5339c37f1f78c2fa4df2295bc0cd73a0abfd:
>
>   migration: fix ram_state_pending_exact() (2023-04-12 22:47:50 +0200)
>
> ----------------------------------------------------------------
> Migration Pull request for 8.0
>
> Last patches found:
> - peter xu preempt channel fixes.
>   needed for backward compatibility with old machine types.
> - lukas fix to get compress working again.
>
> - fix ram on s390x.  Get back to the old code, even when it shouldn't
>   be needed, but as it fails on s390x, just revert.
>
> Later, Juan.


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/8.0
for any user-visible changes.

-- PMM

