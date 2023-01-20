Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D57F6755BD
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Jan 2023 14:25:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIrHI-0002Ah-DF; Fri, 20 Jan 2023 08:17:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pIrGv-00024C-20
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 08:17:33 -0500
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pIrGt-0001eb-BL
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 08:17:32 -0500
Received: by mail-pj1-x1030.google.com with SMTP id
 z4-20020a17090a170400b00226d331390cso4846010pjd.5
 for <qemu-devel@nongnu.org>; Fri, 20 Jan 2023 05:17:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=HBT+OLN8IlDrIm2y8D70zfRqpjRm6ATv3g3CGJjJZyI=;
 b=At4J6+uSlHAae0xSY8HB2FDCH0rmp5cvvnAH3bd3oTJIb0Ms9QYgvCN8tKD2/4ZXMT
 5zRFPrWnA32W29Ua7qNXRHD81ljuxq0z7pznBZSm+G6aBqKTrq50E0rfMtFtoCyD9gAP
 e+At/MAMAshpuM+vjnlsuWCnnqpNppPgbXTZiIRStb1HXIvrpeK7a60uokH4T2VZRDeJ
 yrSiOdBphqaLw95A8tyoSeX6qpk7RQtb5LWjmuODDItJ4+ULwHuqgNYWsGzEHSvKnMdC
 8axnD1hpVJd2EZLy+G7tpT/tZzq98aEmwd8AdYxYgKK1stVK2olWcnoMaeIL/CERJAsx
 1wWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=HBT+OLN8IlDrIm2y8D70zfRqpjRm6ATv3g3CGJjJZyI=;
 b=I9FttMMrAeQJMv5qRWn3IJqDXF9R1VtywSfuFtR3Q3kEB4V94LlQONvdHHgk9akh4x
 trHQMXHr0HAJU9qGuWbOubtd7HCjciYG0+DX3Wa172q4x7YosSFYiwoY3Z0fN5Hh581U
 tTp4ZxImJayYFFJIIydqhu9vLl+KW4Q6GnB1w1leMfknVXVpnlOpqkEfE0/ICSX1awRP
 yx7lh4nKVQIMsd2maSIkpvcKCZbHIecXnR/rZfeOz2BXBRd4VkgDxWZ1dRc00AU/RsiW
 9bxGHsEXyKhIQvrMAnlPZRpsVjfFDxTc1FjPyJ2EFuxPUeO5d+IaBhifT1wN2kme6H88
 CH6Q==
X-Gm-Message-State: AFqh2kp6Lb3NK/xX7GffxZvfDoV6W1FOhFUcOkMhTJ4Is7CswkrGrubg
 j9hPUncjbiGj3syyMs0RwHG/+GJ/lhT7IiS/xIutxg==
X-Google-Smtp-Source: AMrXdXu3p3PYBOKnfBpMcxJ+2vLyudtFS7olmTiOUX4K/HMzqfzazja89SZU+BQmRswp4z1pG8vzuawZlzrI9hVPEcs=
X-Received: by 2002:a17:902:f7d6:b0:189:7bfe:1eb5 with SMTP id
 h22-20020a170902f7d600b001897bfe1eb5mr1592246plw.9.1674220649697; Fri, 20 Jan
 2023 05:17:29 -0800 (PST)
MIME-Version: 1.0
References: <20230119132713.3493556-1-armbru@redhat.com>
In-Reply-To: <20230119132713.3493556-1-armbru@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 20 Jan 2023 13:17:18 +0000
Message-ID: <CAFEAcA-cWY7vtSYZ7k85FkeRn_bdA_aKb+nu_hf5eeMSp+CDiQ@mail.gmail.com>
Subject: Re: [PULL 00/17] Monitor patches for 2023-01-19
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org
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

On Thu, 19 Jan 2023 at 13:27, Markus Armbruster <armbru@redhat.com> wrote:
>
> The following changes since commit 7ec8aeb6048018680c06fb9205c01ca6bda08846:
>
>   Merge tag 'pull-tpm-2023-01-17-1' of https://github.com/stefanberger/qemu-tpm into staging (2023-01-17 15:47:53 +0000)
>
> are available in the Git repository at:
>
>   https://repo.or.cz/qemu/armbru.git tags/pull-monitor-2023-01-19
>
> for you to fetch changes up to a0506b7c8fc72f7bca272647f359d76cc40a02c1:
>
>   ui: Simplify control flow in qemu_mouse_set() (2023-01-19 13:30:01 +0100)
>
> ----------------------------------------------------------------
> Monitor patches for 2023-01-19
>
> ----------------------------------------------------------------


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/8.0
for any user-visible changes.

-- PMM

