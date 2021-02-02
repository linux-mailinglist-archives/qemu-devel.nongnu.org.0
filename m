Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C3B730C04C
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 14:54:54 +0100 (CET)
Received: from localhost ([::1]:46528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6w8r-0003wy-Kb
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 08:54:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58928)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l6w1E-0002nw-Vp
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 08:47:02 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:51491)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l6w16-0001jO-Tg
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 08:46:59 -0500
Received: by mail-wm1-x332.google.com with SMTP id m2so2531437wmm.1
 for <qemu-devel@nongnu.org>; Tue, 02 Feb 2021 05:46:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=6XvyNr+MDJL/R2sLBeBRGcdQ3npEFo2X3tL6IULfIyw=;
 b=L0Mx5b0fCNgLufrQDv74aC1SQHUtJyMuX8lO7RlQT3grp/YWKKtaDsS6Fv3YrLC+Ah
 /1ldUlzCWFNqu2KkwXCtxRnq+TbbX0f9GbkIm6DvMSA8SWYcvhcsMiC+TQXzRkhxY5lj
 RfGNcKNadRLj3OJLEvq4vhgI2jXrZ6ti9RDJ4vzpIAC6oBnDpILvuczyPXtQIVp27JVl
 +et9Tv1iRSoVdTYj2+BXZbC7Nn3qTT9VrN2ODFE3U8L0ZYI3Awn3OzGNiwgEQ6Yr6OGZ
 hSVhQkK52uuqpoH7izyGiEF4CD05S9/0wLWdwP/KrGVMvhp+vJdzeauwC27pw8KIEYRX
 TEfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=6XvyNr+MDJL/R2sLBeBRGcdQ3npEFo2X3tL6IULfIyw=;
 b=m3xuQs6Bo7Rs8UGgp2Texw1h+sQSPFfp/B7sbzk7BxqYL9xX5/Lr5nQDoyi01nnsHM
 LublNtkHMj2m4dxOBELF76quvcvfziX65mpOcsxmXcs5jZJuVJp2D7UcmuJI0vow2Drt
 JSzsuQaTM+NiVzOzKjCPY82Kq/Sqw+Smoh/gYrhfgzqZKtsHi5dKvF6KXBJosYBbS2n4
 e7iye0JJV70fJ5wdEMPPhCT/mpS37rl/Q9CrIK5ElBHuNd23sGIh3uDEXAJg57rRJDzj
 OWrs1tird10AhA/OVHPfWK3dugY09hUznOdcwyMw8OsFi9h5AbjS8Bt6IAmj+jcGBScu
 +Iqw==
X-Gm-Message-State: AOAM532K+qJfwxG+tvjvQYzcvsZk++mVVRp/GYII2FnLqvVeh4wKqsbb
 xqeAQVnWTOhXOIczBtGuFpdUcg==
X-Google-Smtp-Source: ABdhPJw4Il4o72zusSXmvCaDhfqqyP2lpSR0fA4pks/qUG+/umrRMQ8SlKjTVtPFZEzJdlojJ7quKQ==
X-Received: by 2002:a1c:e255:: with SMTP id z82mr3639680wmg.93.1612273611169; 
 Tue, 02 Feb 2021 05:46:51 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id y83sm2975370wmc.12.2021.02.02.05.46.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Feb 2021 05:46:50 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 7E04E1FF87;
 Tue,  2 Feb 2021 13:46:49 +0000 (GMT)
References: <20210201100903.17309-1-cfontana@suse.de>
 <20210201100903.17309-2-cfontana@suse.de>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Claudio Fontana <cfontana@suse.de>
Subject: Re: [PATCH v15 01/23] cpu: Introduce TCGCpuOperations struct
Date: Tue, 02 Feb 2021 13:46:43 +0000
In-reply-to: <20210201100903.17309-2-cfontana@suse.de>
Message-ID: <87h7mutwdy.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x332.google.com
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Roman Bolshakov <r.bolshakov@yadro.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Claudio Fontana <cfontana@suse.de> writes:

> From: Eduardo Habkost <ehabkost@redhat.com>
>
> The TCG-specific CPU methods will be moved to a separate struct,
> to make it easier to move accel-specific code outside generic CPU
> code in the future.  Start by moving tcg_initialize().
>
> The new CPUClass.tcg_opts field may eventually become a pointer,
> but keep it an embedded struct for now, to make code conversion
> easier.
>
> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
>
> [claudio: move TCGCpuOperations inside include/hw/core/cpu.h]

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

