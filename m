Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D0CB76D30B4
	for <lists+qemu-devel@lfdr.de>; Sat,  1 Apr 2023 14:19:10 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1piaBc-0007Uu-Eb; Sat, 01 Apr 2023 08:18:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1piaBa-0007Um-IC
 for qemu-devel@nongnu.org; Sat, 01 Apr 2023 08:18:22 -0400
Received: from mail-yb1-xb35.google.com ([2607:f8b0:4864:20::b35])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1piaBZ-0005Nu-2c
 for qemu-devel@nongnu.org; Sat, 01 Apr 2023 08:18:22 -0400
Received: by mail-yb1-xb35.google.com with SMTP id p204so30105588ybc.12
 for <qemu-devel@nongnu.org>; Sat, 01 Apr 2023 05:18:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680351499;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=CIxL/zt4eXWyXZCeqK8QtgbHpl2ONNRo9zkehBKaApk=;
 b=fG5TfOu9uIFQvPcaf0F0PBCHQTTeXVpKal0S1/ixf1yJCJXXQ4XntsqNrWkIsSruAB
 BXjRBmUYHEmWDjIbGUt61qMFX1KBV2rAJy8lCX3YbbBIPCybEDh7DGAMjyjOEkDyiC9n
 hr1b0uE0koOaBUJRxqHVFb55fbGxmCrucugjreiYJGW/GG1Bl+MI7NhKMK89b1621DT2
 d7dVkIMYUcIimTei8dYdHp9PPCVB9GtLZjyoEoaToE0z9pwOWgcwtHpS6i96yrAybI6R
 yH8UPIcSIwZhRHpDJveyS8O/kXObSTltS/+o9BsPzv1W8ZAwHFRDBWajWPruFsPlhHO2
 2OMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680351499;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=CIxL/zt4eXWyXZCeqK8QtgbHpl2ONNRo9zkehBKaApk=;
 b=duYPJeTuHCEu55jiW3X/zAW7qDAIvLePn3e/F0pSz4DK1ay1bMGDa9t94kVupVtMh9
 lmw/9MNPO6Muus7msi2ixYLBxu7S4Vi0x1kugXi3CPkXY4XL/CZXdiFXJbL7igPpkNDK
 XzwM/KOafZUmD/bdgDnSza/8P1PWkV3stcJH4WW0KtaDET/04TOgLBiRHZ3owBh35egz
 Z1TjwnJ0ZZlJRwDqimIe3SGzOHHXzcrDfiRWqhF51GttGCIDS3eaNA7zXkXynzCPrbZ1
 LvpwRf4WeDlkxljxJXHcbpsZaDX8fD17LEWKlLbvz9iGUK/9hsIAWRgBuomSRuIS+XF7
 mfwg==
X-Gm-Message-State: AAQBX9e8Thj9YKAZlWSQaA+YNoKIYuS55sS5OBWjkNs0XYXKNlL9+Cb8
 9SWM1ymIzJRK+c+eOatuk+Rl4HTIXXOGnarg/l0=
X-Google-Smtp-Source: AKy350bKDXWdF7Nqj5w8QNWLdy0qANjRaDnWtW6xiSSInBYXB29+n3AqiJfFF/T4vznDcNVYqzg7bUR8RrcUm8savqY=
X-Received: by 2002:a05:6902:1545:b0:b75:8ac3:d5dc with SMTP id
 r5-20020a056902154500b00b758ac3d5dcmr19739694ybu.2.1680351499332; Sat, 01 Apr
 2023 05:18:19 -0700 (PDT)
MIME-Version: 1.0
References: <20230401121316.2025-1-graf@amazon.com>
In-Reply-To: <20230401121316.2025-1-graf@amazon.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Sat, 1 Apr 2023 08:18:07 -0400
Message-ID: <CAJSP0QUTN6Jp5go=_j_6F14mxs0=4pdfTGmcVyedMJo3YELYOw@mail.gmail.com>
Subject: Re: [PATCH v2] hostmem-file: add offset option
To: Alexander Graf <graf@amazon.com>
Cc: qemu-devel@nongnu.org, David Hildenbrand <david@redhat.com>, 
 Markus Armbruster <armbru@redhat.com>, Eduardo Habkost <eduardo@habkost.net>, 
 "Daniel P . Berrange" <berrange@redhat.com>, Eric Blake <eblake@redhat.com>, 
 Philippe Mathieu-Daude <philmd@linaro.org>, Peter Xu <peterx@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>, 
 Stefan Hajnoczi <stefanha@redhat.com>, Ashish Kalra <ashish.kalra@amd.com>, 
 Tom Lendacky <thomas.lendacky@amd.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b35;
 envelope-from=stefanha@gmail.com; helo=mail-yb1-xb35.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

On Sat, 1 Apr 2023 at 08:14, Alexander Graf <graf@amazon.com> wrote:
> diff --git a/qapi/qom.json b/qapi/qom.json
> index a877b879b9..8f5eaa8415 100644
> --- a/qapi/qom.json
> +++ b/qapi/qom.json
> @@ -635,6 +635,10 @@
>  #         specify the required alignment via this option.
>  #         0 selects a default alignment (currently the page size). (default: 0)
>  #
> +# @offset: the offset into the target file that the region starts at. You can
> +#          use this option to overload multiple regions into a single fils.

s/fils/file/

Other than that:
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

