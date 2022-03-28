Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 162ED4E99EB
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Mar 2022 16:41:25 +0200 (CEST)
Received: from localhost ([::1]:49448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nYqYe-0004dy-4w
	for lists+qemu-devel@lfdr.de; Mon, 28 Mar 2022 10:41:24 -0400
Received: from eggs.gnu.org ([209.51.188.92]:45942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nYqJE-0000dJ-TO
 for qemu-devel@nongnu.org; Mon, 28 Mar 2022 10:25:31 -0400
Received: from [2607:f8b0:4864:20::b30] (port=40512
 helo=mail-yb1-xb30.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nYqIz-00009A-P7
 for qemu-devel@nongnu.org; Mon, 28 Mar 2022 10:25:18 -0400
Received: by mail-yb1-xb30.google.com with SMTP id z8so26274675ybh.7
 for <qemu-devel@nongnu.org>; Mon, 28 Mar 2022 07:25:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=A90GOz9VWOZemmr8AtLPImqfn9k8SmAdgUQmnP6iML0=;
 b=IQp7IggpBrRArgG3WLOL/Od85TWApPHNdtfVmEUP7PdWP1Ii/UDqFjfvBQIEA1tDuR
 ItyR3nN1ZtgKzdQCCHj0nT0uZ8oQDkcigST5RB6/9pL0rjz4+abrsmomQTu+FgyFwXFy
 EDfn35XEIfp6hn2AYW4hnNdtE9PyfW3mrGpKWv2+t3i7gHEcLdtH53ppccFFLD6jyXZE
 1J/cC6XKCI+GVYmPhehasViXly7Q3tD5DTW9Dov6SoCVmdOjf9vyC7qt6suKI/mNrcul
 Ye6HRt0kQfvV/aZpEcCTM2XIsJ5n3jOsXR0OpKHDKzylmADYTS0JKNkcGtKZZy7rmiRS
 Bx3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=A90GOz9VWOZemmr8AtLPImqfn9k8SmAdgUQmnP6iML0=;
 b=wwFN67XBGAp9+BYF5iGpiP7gxlu6V2PzP9V75RdwWfisLkP80SacE90c0gGnLAqBtB
 XaJZzfwoT4Z3WmnVQS0QF8URWU6EioDcPoj8pFMnZ8gpOFt17XGV+2EmPmkfMm1TNOui
 wjNt+ur9m+rW3GismkZgxhPwaLJupCqUvPcNfK/9cknyVo6t2+XNPFpfqnxONzujGOHq
 725q3UeWM7XEgO9nnJAy+meItMTGtwIdU3tOuMzQULsIz/AOz1zC73dWqGaGM441S1Sc
 4MZ/+6XEm0iNjatXSatgAErp+PCSKKNonpKiKEbcRfbVbJKrkjBSiOvYVvJqAYhq+fUb
 L0Wg==
X-Gm-Message-State: AOAM533P5w92kQdiQqU77kVZakCMkYvLmtyAqE35yFqXCZ5yj52OdGrK
 gdvHMQ0bHflKS/VvhMsR6nR7uei6CmPu6xxUuyyX0A==
X-Google-Smtp-Source: ABdhPJxfVzuRIhe5cRPQeUUPp32XX3SpmxJABObAa/ODB1DFn1EyofIYJeNoxHwjj/duoXqA6+skuSVOQ6yeal5uNII=
X-Received: by 2002:a05:6902:1147:b0:634:6e83:70b4 with SMTP id
 p7-20020a056902114700b006346e8370b4mr23795864ybu.85.1648477512665; Mon, 28
 Mar 2022 07:25:12 -0700 (PDT)
MIME-Version: 1.0
References: <20220328073239.281464-1-clg@kaod.org>
In-Reply-To: <20220328073239.281464-1-clg@kaod.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 28 Mar 2022 14:24:58 +0000
Message-ID: <CAFEAcA8tQjp_ZnS5tOBe+8y1D3zn163j_txQTX9tR0M8pxe=dw@mail.gmail.com>
Subject: Re: [PULL 0/1] ppc queue
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b30
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b30;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb30.google.com
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 28 Mar 2022 at 08:32, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> The following changes since commit 3d31fe4d662f13c70eb7e87f29513623ccd763=
22:
>
>   Merge tag 'pull-target-arm-20220325' of https://git.linaro.org/people/p=
maydell/qemu-arm into staging (2022-03-25 15:02:39 +0000)
>
> are available in the Git repository at:
>
>   https://github.com/legoater/qemu/ tags/pull-ppc-20220326
>
> for you to fetch changes up to bc504838ff88b505421dd28841ee298d9cff31d0:
>
>   target/ppc: fix helper_xvmadd* argument order (2022-03-26 13:52:37 +010=
0)
>
> ----------------------------------------------------------------
> ppc-7.0 queue:
>
> * target/ppc: fix helper_xvmadd* argument order
>
> ----------------------------------------------------------------


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/7.0
for any user-visible changes.

-- PMM

