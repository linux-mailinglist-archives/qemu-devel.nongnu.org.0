Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EE5E358740
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Apr 2021 16:36:16 +0200 (CEST)
Received: from localhost ([::1]:56766 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUVlW-0008S0-NF
	for lists+qemu-devel@lfdr.de; Thu, 08 Apr 2021 10:36:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lUVjh-0007tH-7Q
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 10:34:21 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:43606)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lUVjf-0005t0-Jd
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 10:34:20 -0400
Received: by mail-wr1-x42d.google.com with SMTP id x7so2376776wrw.10
 for <qemu-devel@nongnu.org>; Thu, 08 Apr 2021 07:34:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=9QU6GyZBYbcEi4MqhTg4sm3sD+ozrc8+kC4uqvLLtMY=;
 b=d3cH1GmX3PcoXyZkxzObyNHViasRHFDMHEqRix/KDoqWKDRIEG6Noic/2LRU9XNlV7
 0ChpHU3EyqtFUFcxgI6u7rChal3cz9uIR4/tUsGcBaGxyD5O91qvkvRxvf62KprkQvII
 1/S9jVJ0FlrJK9laxdjnhvUDT9bgjNCm746d9ZDn3ZLJ9TuiFkbv1Mk6J6PxzUvX3FoH
 l9cK2iBdzm2RM7tRIGWye9rVXQJjuGJdNsUc4sG8pqv+LKazT+ONmpPr0IIECjWtTL/W
 HjGtgvr/0JTfE3jkffG00iR1MvveVBYORH+Iolz73TpT9f75b48XWVbSA9vOvI6sppBG
 dY/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=9QU6GyZBYbcEi4MqhTg4sm3sD+ozrc8+kC4uqvLLtMY=;
 b=UDlkJaHnZbumemqsSBirPJ+MbVWTy5Ew0YLLp6oudal3bNfRYFG1jlEiiKojSrhh3z
 apolbOM3sr6XTTkTviNgfGMuNldjnlA3JnBrkrcLUYzHA98HL+Pwu8H7AWxaEs2/19yo
 CXgPEbbchFqvbVRbWwwt9+ACHbSpbD4/cVpODz1LxV82h/v2qOwjtT/vplFXvlpMd5ml
 mQuvorWJV+jOSOShURRO2YAcuwfpohKniLfDN3RJ8opLrjdsIsrxGdpl7C6h+XJO3BQH
 IuZRjJrMLAkNySitB4NWwmlFzo6s48cnGtpJ36Nm+h86rswRWwsge7YqAl+wWvCkBV29
 FBDQ==
X-Gm-Message-State: AOAM532ietZ6llriuGm49zgbQLhkxSD0RZe4/tXOb9rX68pti+A1fUaM
 Q+DGcqP0Bfwp6GHpG6OCB119/w==
X-Google-Smtp-Source: ABdhPJx6UW9qdrCx/FD4uvlFbGN79Uu+f7m05xhd01uLVXXFh7UQY2VNdFVBFY45VYC6yq7iTLzdjA==
X-Received: by 2002:a5d:61c7:: with SMTP id q7mr11881852wrv.215.1617892457452; 
 Thu, 08 Apr 2021 07:34:17 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id d2sm9083795wrq.26.2021.04.08.07.34.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Apr 2021 07:34:16 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 191581FF7E;
 Thu,  8 Apr 2021 15:34:16 +0100 (BST)
References: <20210326193701.5981-1-cfontana@suse.de>
 <20210326193701.5981-8-cfontana@suse.de>
User-agent: mu4e 1.5.11; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Claudio Fontana <cfontana@suse.de>
Subject: Re: [RFC v12 07/65] target/arm: tcg: split tlb_helper user-only and
 sysemu-only parts
Date: Thu, 08 Apr 2021 15:20:05 +0100
In-reply-to: <20210326193701.5981-8-cfontana@suse.de>
Message-ID: <8735w0u9p3.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42d.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Roman Bolshakov <r.bolshakov@yadro.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-D?= =?utf-8?Q?aud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Claudio Fontana <cfontana@suse.de> writes:

> Signed-off-by: Claudio Fontana <cfontana@suse.de>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
<snip>
> +#include "qemu/osdep.h"
> +#include "cpu.h"
> +#include "internals.h"
> +#include "exec/exec-all.h"
> +#include "tcg/tlb_helper.h"
> +
> +bool arm_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
> +                      MMUAccessType access_type, int mmu_idx,
> +                      bool probe, uintptr_t retaddr)
> +{
> +    ARMCPU *cpu =3D ARM_CPU(cs);
> +    ARMMMUFaultInfo fi =3D {};
> +
> +    int flags =3D page_get_flags(useronly_clean_ptr(address));
> +    if (flags & PAGE_VALID) {
> +        fi.type =3D ARMFault_Permission;
> +    } else {
> +        fi.type =3D ARMFault_Translation;
> +    }

Minor merge conflict caused by dad90de78e (target/arm: Set
ARMMMUFaultInfo.level in user-only arm_cpu_tlb_fill)

Otherwise:

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>


--=20
Alex Benn=C3=A9e

