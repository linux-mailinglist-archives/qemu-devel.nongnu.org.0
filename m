Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C13248D961
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Jan 2022 15:06:01 +0100 (CET)
Received: from localhost ([::1]:34548 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n80jo-0007Mk-0f
	for lists+qemu-devel@lfdr.de; Thu, 13 Jan 2022 09:06:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59906)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n80e9-0004Fw-3L
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 09:00:16 -0500
Received: from [2a00:1450:4864:20::433] (port=35362
 helo=mail-wr1-x433.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n80e4-00018V-9V
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 09:00:07 -0500
Received: by mail-wr1-x433.google.com with SMTP id e9so10299281wra.2
 for <qemu-devel@nongnu.org>; Thu, 13 Jan 2022 05:59:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=oVsivp6a6eJX1wFSXh67Hha3FngzheWYexomSXz9zCY=;
 b=Ol/JkRxDzbGyHPB5dT6G2gzsdiv6ykdVz+AC7O1muVuYwnAH3fS6MNyU3s0EMydfyW
 Gui6KA6hPJU+5BNyW6nSQVKrS1C61pUcJOWMr6YcDqUCaFWYnNlFiKBA6sn/vodPC8FB
 gJTTUAti/8aRw0meSpxvhQyTDX1b9bSCYv4wIPBcEoWJ5vUb4h80xCsTEZ4bRBUBKPg9
 seKBZLF4aODopWNQv0H6xxWotDTd07K6w28fDLM33OHRFClCcyP9jGMU0mhatoC9J48i
 QnDUTiBOqrqXc2oF6R1PMW1Ljz2pvV+M1LYANY53bP+iajfqs8deYX/Jxa66FL9c7Iu+
 SEJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=oVsivp6a6eJX1wFSXh67Hha3FngzheWYexomSXz9zCY=;
 b=HBP9FfodytD8VXvj/a+zeHVmP0C5VHcEEKR9oHBQ1f0S44b6ZYfq8RSwNzYtLKcPna
 7rpYOsbHSrdaQecGsUzZ+TLBK7GDmITD5Yeaa+IDn7lT3DjfZyYXnQFtC/5RYfIa13rJ
 7cRJna4G2DZ87EuoUSPJghozS5pG1OSBDNpK738JvEuRdh+rlKidHdnVVESVt8cSwhpB
 C3hOZ3vl8TS79338yBHWmrpK41QxaujJbYN/M+MMg0Qnxtz5lXa16m/iLtMF1zmZ/g/N
 Nu9reSI7WgKv/feO5j+InQVWlfu3DRljpCaDZW0+AljT/9uLjIZjmRhmR90mPU6uOOA7
 GLCA==
X-Gm-Message-State: AOAM530Es/bUim+mvWJpIJqMMnC+Si0IxR3NO8hXmTbWCY5BPDXODS1m
 DFUUI1x4obZQ042G8ZgO9XQKUymXchAKpqbEsqsHHg==
X-Google-Smtp-Source: ABdhPJzyX/Hm89ph4hSkuADqxjJitZ81ttz8epvtHwdbNJcn9RY30Lix/g7ivtlBfsLyyTDOjC+277qbFbDA7l/ZDKg=
X-Received: by 2002:a5d:6848:: with SMTP id o8mr4346839wrw.2.1642082396178;
 Thu, 13 Jan 2022 05:59:56 -0800 (PST)
MIME-Version: 1.0
References: <20220112115551.987666-1-clg@kaod.org>
In-Reply-To: <20220112115551.987666-1-clg@kaod.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 13 Jan 2022 13:59:44 +0000
Message-ID: <CAFEAcA8KTFvO0XVtUHk9DHmLtV+HWYdvTP=eDgebZaGQ+uRDFg@mail.gmail.com>
Subject: Re: [PULL 00/34] ppc queue
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::433
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 12 Jan 2022 at 11:56, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> The following changes since commit 7bb1272f40bdbdebcaec1737c412dcb52e4148=
42:
>
>   Merge remote-tracking branch 'remotes/jsnow-gitlab/tags/python-pull-req=
uest' into staging (2022-01-11 14:20:42 +0000)
>
> are available in the Git repository at:
>
>   https://github.com/legoater/qemu/ tags/pull-ppc-20220112
>
> for you to fetch changes up to f83460bb203a49dd1693bf8b664d2a935a5be621:
>
>   ppc/pnv: use stack->pci_regs[] in pnv_pec_stk_pci_xscom_write() (2022-0=
1-12 11:28:27 +0100)
>
> ----------------------------------------------------------------
> ppc 7.0 queue:
>
> * New SLOF for PPC970 and POWER5+ (Alexey)
> * Fixes for POWER5+ pseries (Cedric)
> * Updates of documentation (Leonardo and Thomas)
> * First step of exception model cleanup (Fabiano)
> * User created PHB3/PHB4 devices (Daniel and Cedric)
>
> ----------------------------------------------------------------


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/7.0
for any user-visible changes.

-- PMM

