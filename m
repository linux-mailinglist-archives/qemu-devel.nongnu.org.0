Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C325339D993
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Jun 2021 12:25:01 +0200 (CEST)
Received: from localhost ([::1]:37306 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqCRI-00064c-Rl
	for lists+qemu-devel@lfdr.de; Mon, 07 Jun 2021 06:25:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40810)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lqCQM-0005B6-BT
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 06:24:02 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:35360)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lqCQJ-0003w3-Um
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 06:24:02 -0400
Received: by mail-wr1-x436.google.com with SMTP id m18so16968119wrv.2
 for <qemu-devel@nongnu.org>; Mon, 07 Jun 2021 03:23:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=uIb9EOVEOm8sEW6CzTqfMZILH0pThvg+5cYVQ85PA+E=;
 b=IsS6c7kVjD4VdBZZdbMwWc6tQvPye4l8CODsIh5BMHTfAeC9dJuSSVzKj44r/anr/t
 PhBSxTM31/KTMs/1PFSIgZN0boviJ2ABidvoAhrynErY6Iac7+vaqnmrmPqT5nuUExC7
 MZ6pyoRXJy0r/yMbo2pgu6aPavP6vWF1P+XoNdYLYT5B5cherY9j6iYdwTmepFt1E7/c
 6YJQPoZ11B9yfXPFiremscEht/9c8hebxhgg/C/NaiPzcCtkurA/TiRqzwpTcAalMmy4
 jr4i+Eq51pKgujwXvu5MP+45nw2qFFqzKGxfdpFlTgifutN1VQ3YgVOfnRGvZkigoSAt
 eqAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=uIb9EOVEOm8sEW6CzTqfMZILH0pThvg+5cYVQ85PA+E=;
 b=YBmy+EIsw6lnV4GgV2fcGUVUqxr5zQue4VcuomodbqU9H1QADb+/Ja5Wm01E+mEGBO
 IEbdlNAh3ZGDzjoa1WpCundSzhGPIs3JW0RjuZhdiBtgIG7mehpA6JbcGCW5mg0TRM1e
 BWTw0vxULRpjaXz6oHaSn1+fE5py3bYnnYhkfKP3FmmCO+KgFInMMPG71d3UXzmhV5GG
 OfkU7WqEWoQsgQYTHzAHz3j/wtsMTFHp1ukvVUxcRsg5sULptYWs6T/u28YeEUv/l1lY
 GcbuDcHAoTanrIxsFgI9VeWPXOOZmA6bFLX+yHivYrfYXCmkLXY3TEJ1Eb72y4vpgoI6
 L8iw==
X-Gm-Message-State: AOAM530lv5nK/HrlwYDC7kAK55CwQ0q9cAElv2OMmDqxLoSqdfxZLZ43
 29q7aSAokYkDsyQUwdbg1srIXA==
X-Google-Smtp-Source: ABdhPJzco9TQyuJtVHd8isa78omk1ISq00gV+TI3soLzTPqAckpv57E3du7LlhpOTfYa/CIAvE0asQ==
X-Received: by 2002:a5d:6b43:: with SMTP id x3mr16601547wrw.263.1623061438120; 
 Mon, 07 Jun 2021 03:23:58 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id z5sm7260894wrv.67.2021.06.07.03.23.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Jun 2021 03:23:57 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 67D591FF7E;
 Mon,  7 Jun 2021 11:23:56 +0100 (BST)
References: <20210604130352.1887560-1-jean-philippe@linaro.org>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: Re: [PATCH v2] hw/intc/arm_gicv3_cpuif: Tolerate spurious EOIR writes
Date: Mon, 07 Jun 2021 11:23:31 +0100
In-reply-to: <20210604130352.1887560-1-jean-philippe@linaro.org>
Message-ID: <87lf7mnfb7.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: peter.maydell@linaro.org, shashi.mallela@linaro.org, qemu-arm@nongnu.org,
 philmd@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Jean-Philippe Brucker <jean-philippe@linaro.org> writes:

> Commit 382c7160d1cd ("hw/intc/arm_gicv3_cpuif: Fix EOIR write access
> check logic") added an assert_not_reached() if the guest writes the EOIR
> register while no interrupt is active.
>
> It turns out some software does this: EDK2, in
> GicV3ExitBootServicesEvent(), unconditionally write EOIR for all
> interrupts that it manages. This now causes QEMU to abort when running
> UEFI on a VM with GICv3. Although it is UNPREDICTABLE behavior and EDK2
> does need fixing, the punishment seems a little harsh, especially since
> icc_eoir_write() already tolerates writes of nonexistent interrupt
> numbers. Display a guest error and tolerate spurious EOIR writes.
>
> Fixes: 382c7160d1cd ("hw/intc/arm_gicv3_cpuif: Fix EOIR write access chec=
k logic")
> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>

Xen seems good at triggering this as well...

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
Tested-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

