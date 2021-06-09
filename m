Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7C363A1B63
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Jun 2021 18:59:24 +0200 (CEST)
Received: from localhost ([::1]:50962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lr1Y3-0001s2-Dx
	for lists+qemu-devel@lfdr.de; Wed, 09 Jun 2021 12:59:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42200)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lr1W2-00016m-Qp
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 12:57:18 -0400
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d]:33559)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lr1W1-00063X-3q
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 12:57:18 -0400
Received: by mail-ej1-x62d.google.com with SMTP id g20so39516807ejt.0
 for <qemu-devel@nongnu.org>; Wed, 09 Jun 2021 09:57:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nUjuP3xqO7HDRX1eE3ZM9w1Qqjzp0RHBtjUKrUZtETg=;
 b=bOG8mv1v35fPqSy7BPG2Hk7z2f3la+ZuayOVmb0eT3eQW/oTv+Xt1y7mJwWEA+pJ/N
 tEUcHTDxbvDPgyxJYQECjPYzW2/uQRZLpnjR50RUY4A/fYNXB5EqVhdNbQkjvcTbo7pT
 F1VMoAD4vuIzPV0iky7sxlFo7YRXdAJGn2P6ESzl0iB69UT8hYev+bjddP+Is7dtOD40
 mlo3wezyFQGlL/ao9ZioofQNIjxuSk45Bxt8sNkar65zNRfKvfrAYLqjceGcEQ1gVs0k
 H39kFI4bB2EZXKRMPUGoHBSbHwMN3WfwwUvj8yUTWWuBYH2ssgt191GgYLMTMGSV66IW
 RtLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nUjuP3xqO7HDRX1eE3ZM9w1Qqjzp0RHBtjUKrUZtETg=;
 b=jXknKZCHVP9OPk6BosNrW5/EQbe34ZalGWY1TdgzwGRUAbbuS5FBV6e5ihrRDJknzR
 9ABlC6ADQWlEZr0c080LEjXSqz5kzgDoSTBhGLqQu6UGjIilkfTTWOtvFxO7EhUfUBMx
 RjAPCLGx4CdgcoUEOtLBrB8wxyAFcKMfILYLKn6LnMM8gbrTrnUjOUHCWpbXcAkB6mKp
 MoW320vgfgqIqd7s5rSWakYuYbD0wyg15aGsZlO/WEoCIQx5QERrk4ipHWQPPe3Mcl4J
 Cm5wmh/XhgfkW2kxv3fNDLuwm35IGIoWO/KLE84N5jDnBsGRZXyud+6IVWVpKNDPo3zU
 aCbg==
X-Gm-Message-State: AOAM531LxLBroSYdUOJLl7HGP1TtUp6Vb1pMkyAYxP5MRGmRIMN0PjOH
 mgF/+kU6AftyqDhXw8nH9vHh5/wGduA3euMjSjwpqg==
X-Google-Smtp-Source: ABdhPJwUS5RCHmbDkc2U/lVwNoD3IchPs8CrgM2w1pBcETg41erYiY2CKVl36kguoQiOtTiTZGK+Qpv8q5xqG2t2W2U=
X-Received: by 2002:a17:906:5299:: with SMTP id
 c25mr803234ejm.85.1623257834503; 
 Wed, 09 Jun 2021 09:57:14 -0700 (PDT)
MIME-Version: 1.0
References: <20210609144512.211746-1-dgilbert@redhat.com>
In-Reply-To: <20210609144512.211746-1-dgilbert@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 9 Jun 2021 17:56:40 +0100
Message-ID: <CAFEAcA801yf-3ocAhQxTipp6+8AuMygbdeCHmkENHdjSHUUYoQ@mail.gmail.com>
Subject: Re: [PULL 0/9] migration queue
To: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62d.google.com
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
Cc: leobras.c@gmail.com, Li Zhijian <lizhijian@cn.fujitsu.com>,
 huangy81@chinatelecom.cn, QEMU Developers <qemu-devel@nongnu.org>,
 Peter Xu <peterx@redhat.com>, pabeni@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 9 Jun 2021 at 15:47, Dr. David Alan Gilbert (git)
<dgilbert@redhat.com> wrote:
>
> From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
>
> The following changes since commit a4716fd8d7c877185652f5f8e25032dc7699d51b:
>
>   Merge remote-tracking branch 'remotes/alistair/tags/pull-riscv-to-apply-20210608-1' into staging (2021-06-08 13:54:23 +0100)
>
> are available in the Git repository at:
>
>   https://gitlab.com/dagrh/qemu.git tags/pull-migration-20210609a
>
> for you to fetch changes up to a4a571d97866d056787d7a654be5792765be8a60:
>
>   hmp: Add "calc_dirty_rate" and "info dirty_rate" cmds (2021-06-08 20:18:26 +0100)
>
> ----------------------------------------------------------------
> Migration pull for 2021-06-09
>
> Yank crash fix from Leo
> RDMA fix from Li
> mptcp support from me
> dirty-rate changes from Hyman and Peter
>
> (Note I've switched to the gitlab I've been using for virtiofs pulls)
>
> Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.1
for any user-visible changes.

-- PMM

