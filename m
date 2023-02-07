Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6560B68D9A1
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 14:47:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPOJW-0004iS-9R; Tue, 07 Feb 2023 08:47:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pPOJ6-0004fy-R9
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 08:47:09 -0500
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pPOJ2-0007Tn-V2
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 08:46:48 -0500
Received: by mail-pj1-x1036.google.com with SMTP id
 c10-20020a17090a1d0a00b0022e63a94799so18634859pjd.2
 for <qemu-devel@nongnu.org>; Tue, 07 Feb 2023 05:46:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=5EMvSoeay9akvOyR0N0jSBVfjo3q1vZQIHCdPJaO4Uo=;
 b=GpOVZQQDp8mHNdolFRh7v8uNLaGzzo/PVs1MGFqKoqO1mAlmXCt3sUmXbamojNBoK0
 vBuGYYZC/EHwqIlbLPFjEFXbWRuP8TtYh5pBjOaA4GWNAwoSN6nIEmRFi4POrgCb6fis
 3F09HpoWbRpm6EQ6i3migTS4vLouGd26fFVn409rD3H2ykv0JV+Tz1c5jF6EwlFR/rR6
 SYQWvgSXifdXgxoBshGjRoVz7GRM52kzcLlBs9HhkMFo4Wqv+tCb1fRdWQJvBPFo7d/R
 qqMnoHKWmLHwgiftkUs9UvCRduQskoKtIwzhoQqd94/LVEHFslHdKNunk/fTFDLnxlEc
 ZWfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5EMvSoeay9akvOyR0N0jSBVfjo3q1vZQIHCdPJaO4Uo=;
 b=YbTMyz9Czg8kld/IPurkhbMwWCQYbXtV5ktUVsu0zHv6V8RjNfL8KFOuWRNdhbRrvA
 ht92CyExDM7GWmcrylNUYtJzDD3df00XFAUV1/+l5tDC2H+Za42IBtKuYjHlB29qs1P5
 Hs/HRWaCz2i8VOwJOnVqKI7NebW7zXWl24LqapsOl6qTj5GaZNV34a1MD3uyiDu1tAC6
 YlnW2IhjIgCd+jBRBIASisROXTtdOpWS+7HwF4ebRmol0scCV0DYhAcrkCoLjzs+RuIa
 nWVNDNxWTJmpSMWA0mFYLZVP0fbQYBWb4Mch3DqztGRNIDu0+NxTLj+4vZNSxQJg1uQ3
 i2ag==
X-Gm-Message-State: AO0yUKUOEdl5R1l5jLWKoiJGjvf9kUBb+F/oDZojDJ9K9yCjRcoR8CZD
 P0JjHDCpxxBsIwlECpi7at1MPX7AugiT7B17rx4IkQ==
X-Google-Smtp-Source: AK7set/Qpf2hwca/hwht4WynroCNjPN7Bloia6cWOYKzdzl82P69C2uvTwjdPaxSLcgUu0O/aSurcH2wedooyX5totc=
X-Received: by 2002:a17:902:dac3:b0:199:f31:49fc with SMTP id
 q3-20020a170902dac300b001990f3149fcmr799277plx.9.1675777603198; Tue, 07 Feb
 2023 05:46:43 -0800 (PST)
MIME-Version: 1.0
References: <167547085745.18032.9674021893886143814-0@git.sr.ht>
In-Reply-To: <167547085745.18032.9674021893886143814-0@git.sr.ht>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 7 Feb 2023 13:46:31 +0000
Message-ID: <CAFEAcA-gftmFa9H1Q2g3TkLdwh4e=G8jYXmVou81Jy0+x98ODw@mail.gmail.com>
Subject: Re: [PATCH qemu v3 0/2] ARM: Add support for V8M special registers in
 GDB stub
To: "~dreiss-meta" <dreiss@meta.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Sat, 4 Feb 2023 at 00:34, ~dreiss-meta <dreiss-meta@git.sr.ht> wrote:
>
> Rebased and updated to use NULL as a sentinel.
>
> David Reiss (2):
>   target/arm/gdbstub: Support reading M system registers from GDB
>   target/arm/gdbstub: Support reading M security extension registers
>     from GDB
>
>  target/arm/cpu.h         |  25 +++-
>  target/arm/gdbstub.c     | 241 +++++++++++++++++++++++++++++++++++++++
>  target/arm/m_helper.c    |  29 ++---
>  tests/lcitool/libvirt-ci |   2 +-

You have an accidental submodule change in here. (It probably crept
in on a rebase -- git's terrible submodule handling makes that very
easy to do by accident.)

I've removed that and applied these changes to target-arm.next;
thanks.

-- PMM

