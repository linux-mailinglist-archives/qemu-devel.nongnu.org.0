Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 86FFF32A278
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 15:29:10 +0100 (CET)
Received: from localhost ([::1]:36386 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lH61N-0000mj-Kb
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 09:29:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34940)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lH5z0-0008J6-4k
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 09:26:42 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:51339)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lH5yy-0000vu-FN
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 09:26:41 -0500
Received: by mail-wm1-x332.google.com with SMTP id l22so2388884wme.1
 for <qemu-devel@nongnu.org>; Tue, 02 Mar 2021 06:26:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=rjg0TvZY/YldyyAd7NfPKFNmFPSuPzH0DVPBsdeKDgI=;
 b=tmieX/KyIkyLlXTFNnckAftcwTduO52TqMA60WdufrwsCcEuK7sxnuLHjPhSvFQ2xk
 h8nbb1Y3MYQmjYe2zvepzdtTzbY5SMKZtWtClJyAk/mNzsWpBnxxyuDQ7FDanNFP++Iy
 J7dzxFg0dbbpjEHhEtHJof9CjYcr7q6aCRxlkDDa1DKi/O/jnUQcw3E3fA+DBrb4bQCV
 yA/h3n/3TDtrSlFdgjJaSDUOzsXM/r3cnXyCwcUglVzPcw7H4NlCrATAqwMiadT3f6zV
 o07FFHrO6l77xVCj8ASP3LQEsKmTUOOodd8RF7qV+EId4XoaUpq8ri3ZlY1oQL3qXA7Y
 Ln6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=rjg0TvZY/YldyyAd7NfPKFNmFPSuPzH0DVPBsdeKDgI=;
 b=Sq6l7F3f1ItQuByWoPRw1o6IOWHSr7znE7xUqApnvK2gIRv0Kp2krGqer1UV+Rtunk
 CPEsYQN5fNN2OhBXad/88RaOro2IhyzDLOTpqeMk7SnVvLrhiSIyCt9AhHDdbA/agUws
 bwJTQx62gqv3NAXYQBvdl7eh8Fr95t1ps7aViutbw1NyZMnprshjyp0a5wjlNry51W8a
 eGzyEcO/hhb2NCirCTauaiko6RLLYyX+Vsv4pgsLc4li5LAP3AsbUstaGD8f9OKcLRYT
 wqR/vDyVZYzw31368dvy8o0lt588nttzN+PJyONIKzE6fQeiE8Qpaev5zIle0HnL5IX2
 xOVQ==
X-Gm-Message-State: AOAM533giRirhBYFLufElKebKy+3oDP1IEbmc7/pqD/3NUh+i78Mzd4m
 udvfCWo22PnB1jrOIFA42m7usw==
X-Google-Smtp-Source: ABdhPJygCrhldfKvTaiB/2iFx/WdVBJM+LgemPqao7kNF1eB/iyMwrHM6fuDzM57L3H8YH0EXxvZXg==
X-Received: by 2002:a7b:c041:: with SMTP id u1mr4255592wmc.161.1614695198183; 
 Tue, 02 Mar 2021 06:26:38 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id c9sm2805833wmb.33.2021.03.02.06.26.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Mar 2021 06:26:37 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 5982B1FF7E;
 Tue,  2 Mar 2021 14:26:36 +0000 (GMT)
References: <20210302090315.3031492-1-david.edmondson@oracle.com>
 <20210302090315.3031492-2-david.edmondson@oracle.com>
User-agent: mu4e 1.5.8; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: David Edmondson <david.edmondson@oracle.com>
Subject: Re: [PATCH 1/2] elf_ops: correct loading of 32 bit PVH kernel
Date: Tue, 02 Mar 2021 14:26:31 +0000
In-reply-to: <20210302090315.3031492-2-david.edmondson@oracle.com>
Message-ID: <87v9a9iqcj.fsf@linaro.org>
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
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


David Edmondson <david.edmondson@oracle.com> writes:

> Because sizeof(struct elf64_note) =3D=3D sizeof(struct elf32_note),
> attempting to use the size of the currently defined struct elf_note as
> a discriminator for whether the object being loaded is 64 bit in
> load_elf() fails.
>
> Instead, take advantage of the existing glue parameter SZ, which is
> defined as 32 or 64 in the respective variants of load_elf().
>
> Fixes: 696aa04c84c6 ("elf-ops.h: Add get_elf_note_type()")
> Signed-off-by: David Edmondson <david.edmondson@oracle.com>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

