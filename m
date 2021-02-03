Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB8E930DAC1
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 14:14:11 +0100 (CET)
Received: from localhost ([::1]:35716 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7Hz0-0002Lk-Ou
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 08:14:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54744)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l7Hx2-0001V5-UR
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 08:12:11 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:37233)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l7Hwz-0001Dw-Uc
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 08:12:08 -0500
Received: by mail-wm1-x32a.google.com with SMTP id m1so5183637wml.2
 for <qemu-devel@nongnu.org>; Wed, 03 Feb 2021 05:12:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=LL735gNFGfB7GUsHjVgynTjMwKSxqil0hGrfmu2dE30=;
 b=UOVKN7QfE115KRxsgSjR2Uxqexuq1lu9w7jWckGnhHZTqcQFimCrktHKSzne3dOq6G
 3v+ESF8BPL3oVqaUFH1BC3lN3IKPkKWenehSi+OayWShUo2Z4GrRHdU8i9eHFAfg+Df7
 UqlIxxczLpqJvln4R60ZkRxeuST32xQQ6Nu8tiMUnc2Y+oeE7kg21bURbN4T5sW74yqX
 ZyQVFbOTrcQfSLooqXnxYMq0eGm8KsuhKYmCKhC/NXws/nqlWnaewSmv5PSFExJa791a
 pGbz5XUAgt/SwMVWTq4CepYoC0jXzy8MF0IfQGA+h5KCCM9FlBYUrUgPJQ5M/HugNdse
 87Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=LL735gNFGfB7GUsHjVgynTjMwKSxqil0hGrfmu2dE30=;
 b=I2o9KFkPDp44I21jVvyMzfezIG74TAGCUsysDzul4A0Jl/YEmKnlupV5B5DcXAIBso
 /43NsYVNS3wxbJEFlvet1AyiCRhBsFTq7aHhB0Kr7Yg9CHWgT2u3WAdd97CCfKtcMcgh
 dcodEJ29iulIUkubFjLI5u7C8sZqxYXpJeCIF0ab2+eNkqKok+fhVXqMQrxZr+aWPIdv
 LLFiUYxo+5UIFpLN3Y04ldztm+IL3styzx95l1G4wp+LcOI0JSl49pybT71WRes981Jl
 brmgIjirRCQ8X/AjAGgMeYCZzxOqXjbj+sNMBeBUk6ubX6+vfiDXLMXw5OT5+K47w5nP
 C04g==
X-Gm-Message-State: AOAM533j6wqIHayA4rd1rOj+GhQsLKe8mJAzaUmcvSd+rkAV+PWgA5w0
 LQNNM/p/EM23kY1z4pHcaGqoIw==
X-Google-Smtp-Source: ABdhPJzkUvyT6P1UnhK6takoP8iyupA5TQ0zo1+bIAvtO/qnTdrv6xZh6F3HSSIzg9f7rqh5cXOP2A==
X-Received: by 2002:a1c:ba44:: with SMTP id k65mr2690623wmf.25.1612357918267; 
 Wed, 03 Feb 2021 05:11:58 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id u142sm2865049wmu.3.2021.02.03.05.11.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Feb 2021 05:11:57 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 675191FF7E;
 Wed,  3 Feb 2021 13:11:56 +0000 (GMT)
References: <20210201100903.17309-1-cfontana@suse.de>
 <20210201100903.17309-15-cfontana@suse.de>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Claudio Fontana <cfontana@suse.de>
Subject: Re: [PATCH v15 14/23] cpu: move debug_check_watchpoint to tcg_ops
Date: Wed, 03 Feb 2021 13:11:51 +0000
In-reply-to: <20210201100903.17309-15-cfontana@suse.de>
Message-ID: <87lfc5s3c3.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32a.google.com
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

> commit 568496c0c0f1 ("cpu: Add callback to check architectural") and
> commit 3826121d9298 ("target-arm: Implement checking of fired")
> introduced an ARM-specific hack for cpu_check_watchpoint.
>
> Make debug_check_watchpoint optional, and move it to tcg_ops.
>
> Signed-off-by: Claudio Fontana <cfontana@suse.de>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

