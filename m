Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 043822F27F9
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 06:47:57 +0100 (CET)
Received: from localhost ([::1]:45882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzCX5-00079R-EY
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 00:47:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39268)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <maahiuzeon@gmail.com>)
 id 1kzCUH-0006OV-Hk
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 00:45:03 -0500
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135]:41500)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <maahiuzeon@gmail.com>)
 id 1kzCUF-0004Jh-8r
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 00:45:01 -0500
Received: by mail-lf1-x135.google.com with SMTP id s26so1528855lfc.8
 for <qemu-devel@nongnu.org>; Mon, 11 Jan 2021 21:44:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4uYjy921OYQItoPjti5IXypGOqXWt59g9UsWq2bpuPo=;
 b=ZrgulDy8FY4xAef4X5GApNH6StV0l2LitAZUPkrAmAzabm4wz4n3JWhMH24tuLZUDP
 DOKXjb1xwS7ydLQ5JBa+mjA1yX9tnyuPrvtWGz5D7EhWoDd5ZNQGYKFQlJg3cxfkljAL
 Hqwzq0mSPJ8JhS1hqDQGkqeXBQK8NEw1Ec5ZENPYImyaGx34EEjV6ppQYjuX5WqsnNXQ
 8fspcXDJ/AH8KXbbrvSK1hUlaDyCJUQz73WMNiIPFiSjAXWaP26uCDNnvaFmDFw5pEsD
 7zgQFLL8wKgc6YgkYr3edj6Ktfa/f8E1YDQoxhUhezzkRe4IdrzIe4I7xKk+yNbdC7Z1
 EIOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4uYjy921OYQItoPjti5IXypGOqXWt59g9UsWq2bpuPo=;
 b=bOmEdujZZnGXsbwmWXzLv0xMwOqvbJJp1KY9dIUkGl7eliQEyF5jaHj1xWHBp4SPrR
 j0o+f3u/C27dxxeLv8zDiwqDHeAHat7LHXcUnx0E9OMQputxAmskzgLi73f2uQWJRMZH
 za0J7LUgInRroV+s6bZO/y+kyDEFCOAF/cDIa6xetz16efMXfpazrIaXgATVUmbsLTK+
 aVbikHO78/7gvhT3G29jBH8GnmI1VD6BwPMWZ5LXExGpDH4qRsQcfFbeMCSb4E5f6bqg
 lDqtIV79S3Pz6jdS0D4jSTSyAOtMhHYTZJGililgwh1kbPr/AN6fnSpb5ijeMFAdgTPi
 0Kvg==
X-Gm-Message-State: AOAM531/lh0Fa/1F+JRsh3f56UfqqWUPC90O96ug+ZGPRoGX29pygQif
 q1lFqMVYpky2oKcbZbFqI8kBL90F2Y4+pE3AeEc=
X-Google-Smtp-Source: ABdhPJxr1tDlos42Qq1QxpkUIqwkZghHNFiLW94vqVwcmI4bKkoS3Il9qVh437TZM/96sCnbDjce/pCZq8OA/zFeNsM=
X-Received: by 2002:a19:6459:: with SMTP id b25mr1315915lfj.635.1610430291041; 
 Mon, 11 Jan 2021 21:44:51 -0800 (PST)
MIME-Version: 1.0
References: <X/ts5kQD31VLIn0n@Hills-Mac-Pro.local>
 <X/vWU7/pPpXZfVOC@SPB-NB-133.local>
In-Reply-To: <X/vWU7/pPpXZfVOC@SPB-NB-133.local>
From: Hill Ma <maahiuzeon@gmail.com>
Date: Mon, 11 Jan 2021 21:44:40 -0800
Message-ID: <CABpQrUMmmo1RECW0qpROfZmFdPSFwG2HFwKiZiqkWxU+hqCvZw@mail.gmail.com>
Subject: Re: [PATCH v2] hvf: guard xgetbv call.
To: Roman Bolshakov <r.bolshakov@yadro.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::135;
 envelope-from=maahiuzeon@gmail.com; helo=mail-lf1-x135.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: richard.henderson@linaro.org, qemu-devel@nongnu.org, dirty@apple.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, Jan 10, 2021 at 8:38 PM Roman Bolshakov <r.bolshakov@yadro.com> wrote:
> I'm not sure if eax should be modified with mask because the mask has no
> value per se. I.e. eax &= supp_xcr0 from below should be placed inside
> the if. It'd express clearly that eax is not modified unless xgetbv is
> supported.

Like this?

-            uint64_t host_xcr0 = xgetbv(0);
-            uint64_t supp_xcr0 = host_xcr0 & (XSTATE_FP_MASK |
XSTATE_SSE_MASK |
+            uint64_t host_xcr0;
+            if (xgetbv(ecx, 0, &host_xcr0)) {
+                uint64_t supp_xcr0 = host_xcr0 & (XSTATE_FP_MASK |
XSTATE_SSE_MASK |
                                   XSTATE_YMM_MASK | XSTATE_BNDREGS_MASK |
                                   XSTATE_BNDCSR_MASK | XSTATE_OPMASK_MASK |
                                   XSTATE_ZMM_Hi256_MASK |
XSTATE_Hi16_ZMM_MASK);
-            eax &= supp_xcr0;
+                eax &= supp_xcr0;
+            }

