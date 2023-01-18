Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 58BDC6727E1
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Jan 2023 20:11:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIDoo-0000eZ-RW; Wed, 18 Jan 2023 14:09:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pIDo9-0000cs-MB
 for qemu-devel@nongnu.org; Wed, 18 Jan 2023 14:09:16 -0500
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pIDo8-0002Yp-19
 for qemu-devel@nongnu.org; Wed, 18 Jan 2023 14:09:13 -0500
Received: by mail-pg1-x52e.google.com with SMTP id 78so25245300pgb.8
 for <qemu-devel@nongnu.org>; Wed, 18 Jan 2023 11:09:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=nHskjAxk7KkQKg88heeYcA92lGhDCr2HZBCyGRm4HkY=;
 b=R9CE4HSyh9PgZxstATPsOewrSamh+UaS8Cg3OSHz0HsTSEzzz7vYFD1qggfrrn+JkN
 FIQusf/sAOpczThmQ4+4NgZ+dVvvaEOZcsNUxgZitdOE9Xn4uEtyrCtUtkFp3Ga7FZnz
 Nbl4Kpc3WFc3GwdbbQTDaCUNBgNI0/0flFXWJA/uMWATO+GuRdwTD8gtt1b7JUeNqwqG
 E5ztjMbAvFgShDlRRlvbwwtT+Vq6GxMRjBJnDTVSimY77mG2bdsA28IDHPm6hjpLVy6Z
 pBHPwr72mvyRohXjnFiX1zTSgQRPV6FF79F1VZzd84XqKnfQ8a26OhdmiEdWgG6Mg1QL
 8IhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nHskjAxk7KkQKg88heeYcA92lGhDCr2HZBCyGRm4HkY=;
 b=p06x2Gr+5E0CBSV+74YYaIgu2+sT9LRiNm9vWh6HUG6fj3uqJZOWId73gkyYo/poGW
 HM+UYVMnI/cGeEdN4Fub+3Ci1RLowbPXI5K6mM20xZq3nBV3AuHOz0JCgohjLveajuIV
 3h2W/azpiAQTv5mpc7XUeSI4G3+9Z3CAZvvi1nIQA8UNc+YO1o8//4l9KoLpd6Yxct1m
 WDQazZrq/Xfn5xZRei/ynBU5XRfVHcxqkB8bU+U6CP3TWcG9/UPdJX1HKqNCWysf3unq
 cxxrfMzy+9TkRJLr0iHx/42qyaXhDA7kETCInBlJ03r4QGXTCFARh6MPPUwxdX61XpTp
 LzNw==
X-Gm-Message-State: AFqh2kr8wEb8YosxeSP8HeJBtxv/gsC6BFM1SfidQViCWUb+8qLX+gu3
 f38bMwZBcLid16dxZYIbQKhT/NfVqByqb4IhvodfHg==
X-Google-Smtp-Source: AMrXdXt1AXeikNFcMaIR7n7LGttpkBw/V1UFAsf4MSqK9uFFQoVUxJ4LjJ/TFTnh0YHqqtCPDGVdRDoeuLMKGu0TyGA=
X-Received: by 2002:a63:33c6:0:b0:4cf:9903:faea with SMTP id
 z189-20020a6333c6000000b004cf9903faeamr474666pgz.458.1674068950083; Wed, 18
 Jan 2023 11:09:10 -0800 (PST)
MIME-Version: 1.0
References: <20230117120915.2362119-1-stefanb@linux.ibm.com>
In-Reply-To: <20230117120915.2362119-1-stefanb@linux.ibm.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 18 Jan 2023 19:08:58 +0000
Message-ID: <CAFEAcA8ROAJKXnsCnTz0m0tLQPbhwq4bxfueskOT1kenOD=0Ww@mail.gmail.com>
Subject: Re: [PULL v1 0/2] Merge tpm 2023/01/17 v1
To: Stefan Berger <stefanb@linux.ibm.com>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x52e.google.com
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

On Tue, 17 Jan 2023 at 12:09, Stefan Berger <stefanb@linux.ibm.com> wrote:
>
> Hello,
>
>  this PR addresses issues where QEMU may hang during test runs.
>
> Regards,
>    Stefan
>
> The following changes since commit fb7e7990342e59cf67dbd895c1a1e3fb1741df7a:
>
>   tests/qtest/qom-test: Do not print tested properties by default (2023-01-16 15:00:57 +0000)
>
> are available in the Git repository at:
>
>   https://github.com/stefanberger/qemu-tpm.git pull-tpm-2023-01-17-1
>
> for you to fetch changes up to 255b00b4def7bac1fd313adca931426f4eb10b05:
>
>   tests/qtest/tpm-emu: Avoid hangs using abort handlers closing channels (2023-01-16 17:19:52 -0500)
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/8.0
for any user-visible changes.

-- PMM

