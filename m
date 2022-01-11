Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AD7B48AFA7
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Jan 2022 15:36:31 +0100 (CET)
Received: from localhost ([::1]:55984 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7IGE-0005mi-4G
	for lists+qemu-devel@lfdr.de; Tue, 11 Jan 2022 09:36:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33152)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1n7HOB-0007MW-Ef
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 08:40:44 -0500
Received: from [2a00:1450:4864:20::52d] (port=35705
 helo=mail-ed1-x52d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1n7HO9-0003zA-Sd
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 08:40:39 -0500
Received: by mail-ed1-x52d.google.com with SMTP id q25so58712079edb.2
 for <qemu-devel@nongnu.org>; Tue, 11 Jan 2022 05:40:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=22a2QyxY7kChYqFUFAhmyl7SAlAZ34DZIHso1B+WuX0=;
 b=ni0j3n8GCdsHJUGeLDUnNMNvIwmc6m5EPeBZ75ySbfob4eGz3jubcpB0yDRWQzyoGn
 GyRlS66zNQ222ItVL/dKjv9bq2JIn5i1KC25oTBy3BhcQDRegNZDX2/pwdqKO5qS1fCT
 rG38RHSi4yQVNVPgQLC2jWzAQP9UNrN8cJkufhMIhKPoacJ1QFYePZIHEAoCyGkwpgUN
 B8h9YbtSGjVSrdYIquhSBNVcvoG+GmSAGhvD4atkjoJ7dKgLpnSQY8imj/PZ6/7/nUSO
 Ovs6HVkX7ktjxBprSGfokDyF3NErq4tn8UTrXpkr6T5it3d713rBIPTc9TM+xMcQ0uM0
 DMpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=22a2QyxY7kChYqFUFAhmyl7SAlAZ34DZIHso1B+WuX0=;
 b=JL1buAqiSdamiX2bT5OQZd56TAt9y1CPg5HlkaJxRrg1LTXTEdQdJpEH+DlsAUn9ad
 PGbsd5sxBUKzzcTV70lifojywCDtDSzDWyaWICKRd1K1mEXcJzdpJkvN/rTDPbgtoU6L
 4m3P1EVmDgmWi3bCzUWqcTv8A3qvcMr4ofPE9cdJ1UNskT3wlTaEM+PE5RwbYdAVRfGO
 paWzsvwQ8gNxiHYwV6lAF+Zvsq6RuvglETzs8ZE0fzsu9V8RmBQz8KeuxOSgKvmJ6m24
 Ybt6T9wqHL3dCMvezpDXoIWxI4O4ZZNtKTawWq8n/9gtuTVzADlagYpLg4WcfKOSKvwb
 GQFg==
X-Gm-Message-State: AOAM533CPnJuQtjeOGSd1qkWBKtSpPl6sziwIVSlO7VtoCZT0fWyI1cv
 J4rUV1pMMhiXCYSU8iaa36iR9ObTFyUD+Q==
X-Google-Smtp-Source: ABdhPJyFeuc6T1XXQKxeqra3UaYzHLzwyhyqR/VpbrzcVm/o2YXjHTWlFqj+2U0sjzlCVN737I9kdQ==
X-Received: by 2002:a05:6402:2549:: with SMTP id
 l9mr136956edb.230.1641908435703; 
 Tue, 11 Jan 2022 05:40:35 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id y2sm767658eda.45.2022.01.11.05.40.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Jan 2022 05:40:34 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 86C6F1FFB7;
 Tue, 11 Jan 2022 13:40:33 +0000 (GMT)
References: <20220111101934.115028-1-dgilbert@redhat.com>
User-agent: mu4e 1.7.5; emacs 28.0.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
Subject: Re: [PATCH] clock-vmstate: Add missing END_OF_LIST
Date: Tue, 11 Jan 2022 13:40:28 +0000
In-reply-to: <20220111101934.115028-1-dgilbert@redhat.com>
Message-ID: <87czkycrvy.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::52d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x52d.google.com
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
Cc: damien.hedde@greensocs.com, peter.maydell@linaro.org, luc@lmichel.fr,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


"Dr. David Alan Gilbert (git)" <dgilbert@redhat.com> writes:

> From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
>
> Add the missing VMSTATE_END_OF_LIST to vmstate_muldiv
>
> Fixes: 99abcbc7600 ("clock: Provide builtin multiplier/divider")
> Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

