Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A409325030
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Feb 2021 14:12:10 +0100 (CET)
Received: from localhost ([::1]:60456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFGR6-00056a-Bu
	for lists+qemu-devel@lfdr.de; Thu, 25 Feb 2021 08:12:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40670)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lFGQ2-0004bO-LV
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 08:11:02 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:41191)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lFGQ0-0001qC-I7
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 08:11:02 -0500
Received: by mail-wr1-x431.google.com with SMTP id f12so1388675wrx.8
 for <qemu-devel@nongnu.org>; Thu, 25 Feb 2021 05:10:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=mgnS54OEhG6StWQlfiBayFcuQ+35hFIjW41rG7EyOIg=;
 b=DULLN3DamYaBSd1mz/P66d69FaXKvQCld4aT8OhnoqB/9Zqk2X9jx/zMrHWzZZujrV
 Ot7gwsbN4PNyjfAHo0ToAx5XMnAbHveODLpa75mriUf1hB5SVMcfcu7MFNXO/jVpUloT
 kcyQ7QgMoAiVzKshAn8lYpN+LfRoubKgNmR9y/YHp0wfwYj/B2AUA4ddGMuttIV81mzS
 v04v5hZbeCoj/tSkdbwhn0qz7iCo2WhIz0A47i9EjMYZMmG7o1wBX/2vk2TJPVaHbh7g
 efE0qtqFVmusG/SS1v/sEbsBWOTLmQEaLIC5v+bITGtE+8GQIiL5aVKW00AOIHT6GuaW
 pobA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=mgnS54OEhG6StWQlfiBayFcuQ+35hFIjW41rG7EyOIg=;
 b=CV6nDHjEhi1d3oUHUXNBfZ9xmbyML4E29Ltq0tu/s3m6rULKPWptoaUapBvcEDKFrE
 tH9qXeKFpBHYS7KGQwjabu4PUjfSGUczsUa/hJqEw9qbcnRwrR4afmkbZBoUCBDcB7uT
 Eui5s9FFz1xVD65VrMivkKojQ7i5bVTwGu1o81+05/6f5EP3aS1fW48rVpdW3RakoH7U
 96t70ZQ9S9jPqD7KQ/QhSXsTKTaJDULJEAaUAjY1cENTyk+Lm/LAwb+Tjyifrbq5JKJy
 udAJSmVA7BgYPdhxrbjR1wamCP0Pq0IT2po9xjx+CnLL0Zw4a82VheybUpRihAg1dkRs
 xi3A==
X-Gm-Message-State: AOAM532LcRCQwgHcw/52MDmwnS73LjkMykIQiu/ntUDNMugkgNpWDwrg
 ex66f4A722wYYF7O1xZ1Xe9RPg==
X-Google-Smtp-Source: ABdhPJzbUAyxaW4v8GaYgwhteEyl4EmN5AQfIY3i3VygXCemdi8fb3flI6/NTDdme8q4XH5MGuvTSw==
X-Received: by 2002:adf:8b5c:: with SMTP id v28mr1751149wra.272.1614258658131; 
 Thu, 25 Feb 2021 05:10:58 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id u142sm7679305wmu.3.2021.02.25.05.10.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Feb 2021 05:10:56 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id A3BDF1FF7E;
 Thu, 25 Feb 2021 13:10:55 +0000 (GMT)
References: <20210211171945.18313-1-alex.bennee@linaro.org>
User-agent: mu4e 1.5.8; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: Re: [PATCH  v2 0/7] Xen guest loader (to boot Xen+Kernel under TCG)
Date: Thu, 25 Feb 2021 13:09:58 +0000
In-reply-to: <20210211171945.18313-1-alex.bennee@linaro.org>
Message-ID: <87y2fc9tsw.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: julien@xen.org, andre.przywara@arm.com, stefano.stabellini@linaro.org,
 xen-devel@lists.xenproject.org, stefano.stabellini@xilinx.com,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 stratos-dev@op-lists.linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Alex Benn=C3=A9e <alex.bennee@linaro.org> writes:

> Hi,
>
> These patches have been sitting around as part of a larger series to
> improve the support of Xen on AArch64. The second part of the work is
> currently awaiting other re-factoring and build work to go in to make
> the building of a pure-Xen capable QEMU easier. As that might take
> some time and these patches are essentially ready I thought I'd best
> push for merging them.
>
> There are no fundamental changes since the last revision. I've
> addressed most of the comments although I haven't expanded the use of
> the global *fdt to other device models. I figured that work could be
> done as and when models have support for type-1 hypervisors.
>
> I have added some documentation to describe the feature and added an
> acceptance tests which checks the various versions of Xen can boot.
> The only minor wrinkle is using a custom compiled Linux kernel due to
> missing support in the distro kernels. If anyone can suggest a distro
> which is currently well supported for Xen on AArch64 I can update the
> test.
>
> The following patches still need review:
>
>  - tests/avocado: add boot_xen tests
>  - docs: add some documentation for the guest-loader
>  - docs: move generic-loader documentation into the main manual
>  - hw/core: implement a guest-loader to support static hypervisor guests
>
> Alex Benn=C3=A9e (7):
>   hw/board: promote fdt from ARM VirtMachineState to MachineState
>   hw/riscv: migrate fdt field to generic MachineState
>   device_tree: add qemu_fdt_setprop_string_array helper
>   hw/core: implement a guest-loader to support static hypervisor
> guests

Gentle ping. They all have reviews apart from the core bit of loader
code and I'd like to merge this cycle ;-)

--=20
Alex Benn=C3=A9e

