Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 288D331B80B
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Feb 2021 12:33:27 +0100 (CET)
Received: from localhost ([::1]:52656 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBc86-00087C-79
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 06:33:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34590)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lBc5Z-00067Q-F0
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 06:30:49 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:40711)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lBc5T-0002MO-Jd
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 06:30:49 -0500
Received: by mail-wm1-x330.google.com with SMTP id o24so8964198wmh.5
 for <qemu-devel@nongnu.org>; Mon, 15 Feb 2021 03:30:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=DyiEMzohMwmhQ4jTxdMqg2wKx/CI3A7ZVHyBRXx9ga0=;
 b=IfFe55carfHPPFdTUckNeS1WnZGEQouFIwjRGx4L0JPxO28cQH0nVspwRKuvb4uaBm
 AJi5aS31Hkc58w5BISftzLA199a8fcGbRAu3TXN35Eqv+EF6AxV0ksCkinu93mvUHz7A
 LoNkqno7mfO/ItceuegnRyVbngCWqJezuFAMoaOrwSI1fp1yMJum+mOZmOdFCPn/gSeP
 TguGCmaxg8BM5kIsyKBRiPVhvR6pKGm3wtkznKKOVBcabFzOOkInWiTnF2Kq1r+/iAIA
 E5srSH5c1JypUKjDqKFsczAjPSCPDbz5GUKrQFRa+gC4fgq3raLimc94Fli8bC7PCvY9
 nzXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=DyiEMzohMwmhQ4jTxdMqg2wKx/CI3A7ZVHyBRXx9ga0=;
 b=DcdkMTao5eMb0eEKmUC8vogdrnI0lJzRRiw7S5tPU4+UOUK65SJH88SMjQGBW2eFIu
 ZCtY92IbQz4UvValfe4+cbmZI7VQnRdTjR9z7bVTNP2MTnlSsaj1LVdtPewnt7WQ5anz
 yHVA82yId3u0jNghYIxfIa/3x5Ty6gDcp/2Sw10Lyfqnb8+xs8LbDZcSlonRWjeMx6Ce
 X7g2E0mG565yVajGIFz5evZM78zeZjhM/pkTs501VmKES5Sl3aqtGD22S6q/xoyAsr6Q
 /ychZwP/4C6jzeI+4lvIHK4BQM7uUYZGZ9Wa13UM0Ri2DvlD3uUFZGC3kE4XiZsaGOGJ
 e+nw==
X-Gm-Message-State: AOAM531eUIlmlIIa6p+c7nyk5AUpKdJ4+al5HSh52eM58pqQvh8P1GW8
 RuBaaRDGB2I9/2GAc3N3p6LUUA==
X-Google-Smtp-Source: ABdhPJzpJGRxwllm39cSeui/5diTg9DsHQtaJ3igUwW35VL4JHskrdz2XwkBCv9DnlSxoWAjMuQxQQ==
X-Received: by 2002:a7b:c007:: with SMTP id c7mr2717969wmb.59.1613388642381;
 Mon, 15 Feb 2021 03:30:42 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id v204sm25385653wmg.38.2021.02.15.03.30.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Feb 2021 03:30:41 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 82B151FF7E;
 Mon, 15 Feb 2021 11:30:40 +0000 (GMT)
References: <20210212123622.15834-1-cfontana@suse.de>
 <20210212123622.15834-3-cfontana@suse.de>
User-agent: mu4e 1.5.8; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Claudio Fontana <cfontana@suse.de>
Subject: Re: [RFC v18 02/15] cpu: call AccelCPUClass::cpu_realizefn in
 cpu_exec_realizefn
Date: Mon, 15 Feb 2021 11:30:35 +0000
In-reply-to: <20210212123622.15834-3-cfontana@suse.de>
Message-ID: <87ft1xva8v.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x330.google.com
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
 Roman Bolshakov <r.bolshakov@yadro.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Claudio Fontana <cfontana@suse.de> writes:

> move the call to accel_cpu->cpu_realizefn to the general
> cpu_exec_realizefn from target/i386, so it does not need to be
> called for every target explicitly as we enable more targets.
>
> Signed-off-by: Claudio Fontana <cfontana@suse.de>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

