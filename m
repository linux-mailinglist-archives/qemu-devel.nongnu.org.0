Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 793E741DDEF
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Sep 2021 17:47:11 +0200 (CEST)
Received: from localhost ([::1]:49048 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVyH8-0005lq-Ce
	for lists+qemu-devel@lfdr.de; Thu, 30 Sep 2021 11:47:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34054)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mVxnH-0006Gj-H1
 for qemu-devel@nongnu.org; Thu, 30 Sep 2021 11:16:20 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:44868)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mVxnF-0007Ch-QA
 for qemu-devel@nongnu.org; Thu, 30 Sep 2021 11:16:19 -0400
Received: by mail-wr1-x433.google.com with SMTP id d6so10638458wrc.11
 for <qemu-devel@nongnu.org>; Thu, 30 Sep 2021 08:16:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ugdsnvs3S9SYzwxvBRg06+xJxPBcDgJjE3NKoagXT48=;
 b=xC7hfPpnQrdoIfForHHjbMpD7sC0imYwDsa6Z+CsQlqMTMzPgQhpETIGUu/3w4Wh/W
 a1PFDfex3q6/j2jShAM/8bGPfWGsC7MJuLSwYRc11/JKRMrjl/C03g9mSCGr8+r5J6X+
 i39UH1mFkL/WfGjRWfhrsFUNP2fTlOXkvGdaSUjRuBWAZ5hOtrJ8dCNlfu7SpxA0pSBi
 ZOeDOWKoUQnD7FziDjte9iIeC9YQSjXCQ/i1kdHG/mSukIXQYGc32lWCIDJWzrm6prg1
 Hu6ty7oY6KSG3dXuVF/Z9M6ndrfEfTJClRtY7dnz1r0pSGKzoySnzQ10Qw8buzKFuTgt
 NdVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ugdsnvs3S9SYzwxvBRg06+xJxPBcDgJjE3NKoagXT48=;
 b=yADgfMixD540liGD3XhdtOmFixsh0ez4vVtOzvEw9yD2wxPG8brHuDOz7Red73XHbm
 p7pG1W5/cMAhIG+N8DAs7QPshNYDwI+RBiv/MjUcmJ7SBbHUvYtQYpf/29s1k00q6B4m
 FgWb/xMEzkGOqzn5dOxeVI5gEe/aYQswmKY2uzaLZ0TWHIYtsIjN+UROTND66OeLmpm1
 13wP9NU9C8N/ixKkeY4KE0UfMs8Q3jPKBe3eOWsu/xW2nsT3busIc6KWR9w8lFatGni+
 jX79JdYQYM2PGITduSEEfekw/yVcXEmmIBjfXgGUrt0LR2A5U7t972RbFmeJ0m8XQGno
 pyOA==
X-Gm-Message-State: AOAM533Ttco9JhEmtm5iOgwBXpzkfUVITuGfaudIIpqsgb+B78bM1xGR
 T0wLHEHFZWQ40Jkez9AwQV4dWemxsWFQTLRgcTfsllHG5xU=
X-Google-Smtp-Source: ABdhPJwNstxjTg8G89sszG3hp5XqNRXp6B/TLV3s4CLmSzkjzByvg1x3eeThJQo/CdfgjyKc2B55D5RPsTdmczuITYQ=
X-Received: by 2002:a5d:59a4:: with SMTP id p4mr6919754wrr.149.1633014976376; 
 Thu, 30 Sep 2021 08:16:16 -0700 (PDT)
MIME-Version: 1.0
References: <20210930133250.181156-1-pbonzini@redhat.com>
 <20210930133250.181156-3-pbonzini@redhat.com>
In-Reply-To: <20210930133250.181156-3-pbonzini@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 30 Sep 2021 16:15:22 +0100
Message-ID: <CAFEAcA8fYfsHgOWi3-DzPxjmnVzHfcWevF3m+z2cfKx_zj5hUw@mail.gmail.com>
Subject: Re: [PATCH 2/7] docs: move notes inside the body of the document
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x433.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 30 Sept 2021 at 14:33, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> Make all documents start with a heading.
>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  docs/devel/multi-process.rst | 20 +++++++++++---------
>  1 file changed, 11 insertions(+), 9 deletions(-)
>
> diff --git a/docs/devel/multi-process.rst b/docs/devel/multi-process.rst
> index 69699329d6..e5758a79ab 100644
> --- a/docs/devel/multi-process.rst
> +++ b/docs/devel/multi-process.rst
> @@ -1,15 +1,17 @@
> -This is the design document for multi-process QEMU. It does not
> -necessarily reflect the status of the current implementation, which
> -may lack features or be considerably different from what is described
> -in this document. This document is still useful as a description of
> -the goals and general direction of this feature.
> -
> -Please refer to the following wiki for latest details:
> -https://wiki.qemu.org/Features/MultiProcessQEMU
> -
>  Multi-process QEMU
>  ===================
>
> +.. note::
> +
> +  This is the design document for multi-process QEMU. It does not
> +  necessarily reflect the status of the current implementation, which
> +  may lack features or be considerably different from what is described
> +  in this document. This document is still useful as a description of
> +  the goals and general direction of this feature.
> +
> +  Please refer to the following wiki for latest details:
> +  https://wiki.qemu.org/Features/MultiProcessQEMU
> +
>  QEMU is often used as the hypervisor for virtual machines running in the
>  Oracle cloud. Since one of the advantages of cloud computing is the
>  ability to run many VMs from different tenants in the same cloud

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

(side note, the wiki page was last updated in August 2020, which
suggests maybe it's not that useful to refer people to it.)

thanks
-- PMM

