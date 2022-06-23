Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A305558A68
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Jun 2022 22:55:46 +0200 (CEST)
Received: from localhost ([::1]:36308 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4Trc-00042X-UP
	for lists+qemu-devel@lfdr.de; Thu, 23 Jun 2022 16:55:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46708)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shorne@gmail.com>) id 1o4Tpv-00034I-0D
 for qemu-devel@nongnu.org; Thu, 23 Jun 2022 16:53:59 -0400
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536]:33664)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shorne@gmail.com>) id 1o4Tpt-0008Ix-JL
 for qemu-devel@nongnu.org; Thu, 23 Jun 2022 16:53:58 -0400
Received: by mail-pg1-x536.google.com with SMTP id z14so583034pgh.0
 for <qemu-devel@nongnu.org>; Thu, 23 Jun 2022 13:53:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=RkzWATpHOSCJk5c/Lw2XsExokuGokHQlbIGxQhIndUU=;
 b=Cs1qiWoUOf55vawigxLg0WF8gW7V6jTHpZvp1Vc/ssEDsygtHtplt0x3+FZW6YsPvu
 6j2U0tmx3k30AezIYBFbh6MzDAWb3RcJaAoQTiDlZncAF3TjWN89k4Gpm4xS8sbIxaFr
 sCWhzTxH2YpfhfEUuow3JHOp3lykme5qqwm5m1vC9ujSZpJRg/uhLXGG39c3VlUDePAP
 Wo3SgXWYgq/wJE3RmRcDTa3MQw6bbRXBqBGNKhGlJotpape+QCq0qhfjKNWsRObmOR5i
 NX/xP/SCDpjwU80VudQts/wr6AZShnuuvFbdRQpaBnqKtwITm/gVagQTo9NsiQcu6skj
 bOnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=RkzWATpHOSCJk5c/Lw2XsExokuGokHQlbIGxQhIndUU=;
 b=iEHY63Klp8oajl9GZNgnWvzRnn5OURRDj2dcftsp3adFgl8cILfjOAxdhvD3n8pTQG
 50SMcu7PCso0yxRLkzWpynZ1chtorlmrxPvin0jx1SuMyk051U1YM9Wwh3/niySj/K+H
 JX6Onm2W0KBYxd/gIf5fwWlZv9uUOxOZ0aOtgzZgGROEZigotAiSbe++h7+R4lSwcR0C
 kJu1C/LWFhgzM73Gi471jCZsEzI6RLoVyY6WyGqFgrHRs2MANohvi7BYtdHRUGcZMbNX
 hF8rKH87NEjzrsf4ofwEALRjb9jmB+b39gFCAOS4yYxu4CQCOx5ZJPhSkWtXL4a1scP1
 3vdw==
X-Gm-Message-State: AJIora/J5TZmudfKyjbU9NXzcV4KWJ5+TTDQUzZoOxSyKTqYBLmmoehn
 JNki2uzERANufhxAXOM5Obmp9gDVLTE=
X-Google-Smtp-Source: AGRyM1um3kL1G2b8vAnKaz6beUVMK474rj1d7tXYv95+fem37+J+KFkkz+pZ7y1xyaI/2C21bGA4OQ==
X-Received: by 2002:a63:84c8:0:b0:40c:7d4a:ac66 with SMTP id
 k191-20020a6384c8000000b0040c7d4aac66mr9101896pgd.424.1656017635343; 
 Thu, 23 Jun 2022 13:53:55 -0700 (PDT)
Received: from localhost ([2409:10:24a0:4700:e8ad:216a:2a9d:6d0c])
 by smtp.gmail.com with ESMTPSA id
 c12-20020a17090a1d0c00b001ec92575e83sm178330pjd.4.2022.06.23.13.53.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Jun 2022 13:53:54 -0700 (PDT)
Date: Fri, 24 Jun 2022 05:53:53 +0900
From: Stafford Horne <shorne@gmail.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: qemu-devel@nongnu.org
Subject: Re: [PATCH v2] hw/openrisc: virt: pass random seed to fdt
Message-ID: <YrTS4RuT9XlljAtc@antec>
References: <CAHmME9o_Oq7TKFXx-rxRxpVR-akE+gVCutK879Tp_ubVwEu=TA@mail.gmail.com>
 <20220622114513.293882-1-Jason@zx2c4.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220622114513.293882-1-Jason@zx2c4.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=shorne@gmail.com; helo=mail-pg1-x536.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jun 22, 2022 at 01:45:13PM +0200, Jason A. Donenfeld wrote:
> If the FDT contains /chosen/rng-seed, then the Linux RNG will use it to
> initialize early. Set this using the usual guest random number
> generation function. This is confirmed to successfully initialize the
> RNG on Linux 5.19-rc2.
> 
> Cc: Stafford Horne <shorne@gmail.com>
> Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
> ---
> Changes v1->v2:
> - This is rebased on top of your "or1k-virt-2" branch.
> - It makes the change to the new "virt" platform, since that's where it
>   makes most sense to have.

Thanks I have placed this on my or1k-virt-2 branch.

-Stafford

