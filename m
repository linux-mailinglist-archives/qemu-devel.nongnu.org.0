Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 897B26203EA
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Nov 2022 00:45:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osBnO-0007SO-OM; Mon, 07 Nov 2022 18:44:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1osBnM-0007Rz-Hk
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 18:44:48 -0500
Received: from mail-yb1-xb30.google.com ([2607:f8b0:4864:20::b30])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1osBnL-0000G6-1S
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 18:44:48 -0500
Received: by mail-yb1-xb30.google.com with SMTP id 131so11125594ybl.3
 for <qemu-devel@nongnu.org>; Mon, 07 Nov 2022 15:44:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=pE5iRmA2NZZP1wdxGFKAl86fvGafacQRVbf1FsQAvDo=;
 b=Um/BG+5s6DxtsHhrrxU1zvIrhPXT6BypViV92fivF3WGk19mrS25fr78ndWu6hUuSJ
 t8flTWXp0+Toj5jz5PwT0WzxwhVLKGwk/L/P/Q3W8va+32hVOpjpiaiTCGXZIDonLA2A
 cmvk7wZ4CuHP5WGIKZE2B0HuXlX/ZnMmo+FQ0vsbBczHmf0lb4Yi1MLfNoDQWVa/R2gz
 nawo/M9M7ORKzzr6lfwPMBV0HIGiiTv2zB6n6Piyn0rE60P7nNv8JHAQ+5JpTip0f/Nm
 rj+kKI2TrZrlDmDapkg6bg+7udeJ2Rrk/aHcD6EKnQOGJ8sv3d5BzIN9QCUurixlDHVc
 4t7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pE5iRmA2NZZP1wdxGFKAl86fvGafacQRVbf1FsQAvDo=;
 b=SDRHxFBIh2dESgo6sV53kVCIOCn8uKQRzuJN71/EGNeiUSMl5SI0U2xqhA1sK4NOgF
 YQaMNoaDfB3CKWW7m6Or3NH+uPvNw6hAD+CbOIV8zn1eEQDXHvXU8NeJKKPqkmwgsnN+
 F10YrLMKjf5M9gjRUwhg79mEIiw6wf9NAWg2q+YwDkiFFq97wjsRBySVwztEjmbNeGBw
 c9SSMl3tl/Q1FdZ9O4SU4BIeezIssslwt2fRMDQ/r7+0b6v4/omHDVWwa+ARjBjGdKDf
 frIo6w63N5ucuBU9+nUeC4nvqVNHP48IiFG+atw+/ZpNAlvYMT4SjTbKv3r8ui+eT1Qo
 5VPA==
X-Gm-Message-State: ANoB5pmgdyxpSYM3QIMLlZZiU2Ycm5pVAYCFNwbpNP6Jo5/8BEyH6oFA
 nQuAYOsGBylAHmLQLXr/e6GeV6dJ5tI+gYewYcI=
X-Google-Smtp-Source: AA0mqf59HXYB6CQc4flZx5ckNje0AUIyIZrhA2MlIGvhy1c2kiGVnXD24k8S3GxJX6w5HlUtZZkrw1dKg30w02xD9yM=
X-Received: by 2002:a05:6902:1147:b0:6d5:2608:9aa6 with SMTP id
 p7-20020a056902114700b006d526089aa6mr14582134ybu.118.1667864684827; Mon, 07
 Nov 2022 15:44:44 -0800 (PST)
MIME-Version: 1.0
References: <20221104120059.678470-1-groug@kaod.org>
 <136930a7-7e9d-8450-284a-17dba47f4e31@linaro.org>
 <20221107133412.49688989@bahia>
 <CAJSP0QUwhLintN+7rq9J0P3oeXh4-ftJsupz1uBwgULSHSm2-w@mail.gmail.com>
In-Reply-To: <CAJSP0QUwhLintN+7rq9J0P3oeXh4-ftJsupz1uBwgULSHSm2-w@mail.gmail.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Mon, 7 Nov 2022 18:44:32 -0500
Message-ID: <CAJSP0QW=ph=7OzRXLM83cHcGr-T9k9WS=zcw68rV2PxBs48oKQ@mail.gmail.com>
Subject: Re: [PATCH 0/2] util/log: Make the per-thread flag immutable
To: Greg Kurz <groug@kaod.org>
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Stefan Hajnoczi <stefanha@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b30;
 envelope-from=stefanha@gmail.com; helo=mail-yb1-xb30.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

Merged, thanks!

Stefan

