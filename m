Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0531666658
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Jan 2023 23:45:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFjoz-0003qN-VQ; Wed, 11 Jan 2023 17:43:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fantasquex@gmail.com>)
 id 1pFjoy-0003q5-Pk; Wed, 11 Jan 2023 17:43:48 -0500
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <fantasquex@gmail.com>)
 id 1pFjow-0002yw-TZ; Wed, 11 Jan 2023 17:43:48 -0500
Received: by mail-pl1-x633.google.com with SMTP id s8so10018161plk.5;
 Wed, 11 Jan 2023 14:43:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=c4KWdzV+6EKc42uZjqIG0oUHJ+KSBV+jMnf5rUHFbX4=;
 b=decMigvlohdfEceDI6SCjc6u0lKUYhS9inEQ3tGUfibLa0xYYrf+ZC4k4/507b5KOF
 cmZww/xUgjPoz0AOkpN10tYzXOSvyk1q8SIruCm4Te2GsjPKvJqX+g94wwWalmp8UXxd
 nWA0jfjMiB0dMu6g97jXu+3VnvGCcfbaB1ea/wtO/+XfSdwvmw/FokwlKLVlZIbij9qb
 xny9E7cCsIfIjVCFJjjFoljnssLPDiXClhN3NlDPBe/eC2na9quKuJ2Ce/ACv6IKn+9Y
 mnozkGUvTFb4b1UsFTE/7zmEiuo2X7UHngQpiKWoW1CaOiol3atHtuyg0yWHItP0iP+V
 jijw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=c4KWdzV+6EKc42uZjqIG0oUHJ+KSBV+jMnf5rUHFbX4=;
 b=XWXVUvR2NifpB9aEXuJe1iGpon7AFaF0Uo0g7PJx/EVZs4AYKMmQX9rfdMezAIvlEJ
 tbXhWRtdriOv8U3OhrhBplyFeWfgZZLFq2tVzO8NGUBj5m24w/TOfreA/86Z3qIrXbb1
 bg0UUb3xpn/FC0KEvXd38gzLzWUgSUMj38qvYSoI+/TD8de+P0rxlzTQz2foIo5AqXaa
 mBMb3sECxjm94GQi+EacfGU4WRWH5LKLL2j4tEyKLYhc2Np9U2/fO7LFMgk3IgzcCZyI
 hgclAkvXwE8+ApMwnCl1cCI71sHVulweFTjVh5tHuczgYJbNRLs/iKy2oLlgKiwS7KlY
 fSFA==
X-Gm-Message-State: AFqh2kpFJAJSSriq2aoAgE3dXhcjbC8eQvQSRZw9//TvBx+1YBx/WOWM
 jqaH0hgvLd7tsaGCWskraj9cpFvlOQMXuD+6eqh7MtUxFdU=
X-Google-Smtp-Source: AMrXdXsEAgsoFH4f2Plmrux5fZ9586zWIkY1TWnAqJdy4Ykdj0q9LCS1Pcjmk63Dm95w5Q7E8fAehu2CVDO/b67tSTo=
X-Received: by 2002:a17:903:32c8:b0:189:e149:a1af with SMTP id
 i8-20020a17090332c800b00189e149a1afmr4243871plr.18.1673477023649; Wed, 11 Jan
 2023 14:43:43 -0800 (PST)
MIME-Version: 1.0
References: <20230101141105.12024-1-fantasquex@gmail.com>
In-Reply-To: <20230101141105.12024-1-fantasquex@gmail.com>
From: Letu Ren <fantasquex@gmail.com>
Date: Thu, 12 Jan 2023 06:43:32 +0800
Message-ID: <CAEUwDuD5iusV-=eLiVT9d-D4+xChPryYY2P=RoCXJH8QAy--Pg@mail.gmail.com>
Subject: Re: [PATCH] linux-user: add more netlink protocol constants
To: qemu-devel@nongnu.org
Cc: laurent@vivier.eu, qemu-trivial@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=fantasquex@gmail.com; helo=mail-pl1-x633.google.com
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

Ping! Hi, it's been more than a week since I submitted this patch. I
think it's a trivial patch. Maybe qemu trivial team could take a look.

Thanks,
Letu

