Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54FDA6A1887
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Feb 2023 10:11:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVU6k-0002Wk-Ra; Fri, 24 Feb 2023 04:11:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1pVU6h-0002WF-T8
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 04:11:11 -0500
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1pVU6e-0004nT-IN
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 04:11:11 -0500
Received: by mail-pl1-x631.google.com with SMTP id z2so16180364plf.12
 for <qemu-devel@nongnu.org>; Fri, 24 Feb 2023 01:11:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=bJDIS7n8+TNO6w3AjSzHKLB/pQ/i53sp35cs/w8JcVo=;
 b=b78+jMIsVuXXq62k5rslkKaAUSkn6woCOkZuC7binM2zoD+QSkmY3AbrH7k1zjm/t0
 GHpTzz5LSG8ca+pZtpeo/by9tpN0rYzESKq0eqDZpUwretiINy81eZh4WdbhFzPoRZD1
 vms0l8RbwSGnvJTkZ5/a/JOebawTkNBcViTCBgXaBNs0bGrx6rAoxNHdz+mM/nh5lFBB
 hcIx2D8vWcrseWb+Z3ApRw8z//g8troBFmy2VM5lfq5LXzkuQJa/5JzjWYdCwAYBLG90
 +78AfOgJTCSFDsjVWp/bIcZ3P5kgNebEOsh1mWeR/lOjzFClb6GRtM0Rm8sITILs+haG
 zyIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bJDIS7n8+TNO6w3AjSzHKLB/pQ/i53sp35cs/w8JcVo=;
 b=0PJzYLhktIPLtzFlFd24lsEY/mkXc+YQewjHm0O4yXjFFhWmOVmzFsdrxw6MLA9Sts
 Z3LQDVRwf0yyoGACIobibGPNXNRNQTBFfFHtE9yjOuwTwJOwAJ3W3nkMF7h1VymUO2Tc
 gIKWXkq4WSfvoSBV+tAoY8ulZ5oZqirjMe3pJknTYJavYz0asV2/Fk1itAwVWg4AN4AQ
 lHheLlPTqT+f+CxE3Oh9YRk2eWTTHkjjfc4NdmhDYSM0go9s2AXcPRfaJ77Frgh5JFy0
 8T3biT7vq74ug2Ry8l6GyFoNNRrQHjeUG4NX44fMw6SvvkrpdOWFQYdV61FIfcuz3Gyi
 MY8A==
X-Gm-Message-State: AO0yUKVxEJbJyeEjX1s6skf9uQhg3F/AdcvLh2LTT3jpKOye7b2SpH+W
 i9NyhjAeUBwUuHcXmfCc87x27A==
X-Google-Smtp-Source: AK7set877/mzrYJs4nhS7DN8SeDAIx49EmGkrIH0uAi0OPuYF4SRHl/7+dXmTVndIPrxao0DfMoOVQ==
X-Received: by 2002:a17:90b:38ce:b0:236:704d:ab8c with SMTP id
 nn14-20020a17090b38ce00b00236704dab8cmr16394620pjb.26.1677229867015; 
 Fri, 24 Feb 2023 01:11:07 -0800 (PST)
Received: from sunil-laptop ([49.206.14.226]) by smtp.gmail.com with ESMTPSA id
 b19-20020a170902b61300b0019aa8fd9485sm6271587pls.145.2023.02.24.01.11.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Feb 2023 01:11:06 -0800 (PST)
Date: Fri, 24 Feb 2023 14:40:58 +0530
From: Sunil V L <sunilvl@ventanamicro.com>
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 libvir-list@redhat.com, Shannon Zhao <shannon.zhaosl@gmail.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>,
 Dongjiu Geng <gengdongjiu1@gmail.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Subject: Re: [PATCH v2] Deprecate the "-no-acpi" command line switch
Message-ID: <Y/h/IqRT8voOkQid@sunil-laptop>
References: <20230224090543.1129677-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230224090543.1129677-1-thuth@redhat.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-pl1-x631.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Fri, Feb 24, 2023 at 10:05:43AM +0100, Thomas Huth wrote:
> Similar to "-no-hpet", the "-no-acpi" switch is a legacy command
> line option that should be replaced with the "acpi" machine parameter
> nowadays.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  v2: Fixed stypid copy-n-paste bug (Thanks to Sunil for spotting it!)
> 
>  docs/about/deprecated.rst | 6 ++++++
>  softmmu/vl.c              | 1 +
>  2 files changed, 7 insertions(+)
> 
Reviewed-by: Sunil V L <sunilvl@ventanamicro.com>

