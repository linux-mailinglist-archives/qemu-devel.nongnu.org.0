Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 479D9361365
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Apr 2021 22:22:42 +0200 (CEST)
Received: from localhost ([::1]:59770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lX8Vd-0005tx-2N
	for lists+qemu-devel@lfdr.de; Thu, 15 Apr 2021 16:22:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53016)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jcmvbkbc@gmail.com>)
 id 1lX8U2-0004va-Kw; Thu, 15 Apr 2021 16:21:02 -0400
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d]:35642)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jcmvbkbc@gmail.com>)
 id 1lX8U1-0006zZ-4c; Thu, 15 Apr 2021 16:21:02 -0400
Received: by mail-ej1-x62d.google.com with SMTP id u17so38809099ejk.2;
 Thu, 15 Apr 2021 13:20:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=J8pC7HKfTeD3osEEwN4uKMqbccfJ+STepsEwfZ8BHoc=;
 b=OhjiT8ScruXOnr72Nyn18vGS2qPzUkLRx8I7z2OTay2LO7EjpXDbKFgNdqb+tfZgVz
 3GQqmnOB37pu+sMaZ/Nh9BhxpZI8Zv0d+jdVYHxBPRV7oaXIodUvarCbKBvN6fxDLUC/
 pHoht7yqw2NBgpnSSMx3DcshUyK9se8mvfyFTgtt/ZLRUSMlOpAOI7pK8j78bAL5i23W
 Yls75qrT6fKl/Kg7rGfelMnE0tNykZfHTBX8HJNsB5HdCqQBeXPKwU547U73DY45SkPF
 bWJWsXKiN6QUeK/7WLF+Ez8nPb7HHw6cX3eBbpGbxfkZF41B+Z44L+loZauDllKkc6nG
 VkNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=J8pC7HKfTeD3osEEwN4uKMqbccfJ+STepsEwfZ8BHoc=;
 b=EHVHOf79SVPnFZKFof5cufiI5i0LieVx4AwZ+UD4m2NseGIJMO4VYeIkOqCK+NydoQ
 4Q5Og1HqJmZHREaVTjrJx2AKtfbJXdHoWtN//3iYg8Zclupevz+I5dJeMcC9WD4LRaXn
 jNVER10TWMgMJV2dS/ZwBDILZ/STd9YQvqNNZ8zAgKyXb/rKXCIb7Vf4hE1f1GYz+xfd
 g/g4MtnZIo4kpQ/pTf5+FtqlmazBqGA7h+0D10CZaKcdwfHqeMG/5R+zXaxpqnoiuV0p
 p9GAB8chpQHKS2fS5oUuDfB5haavBSmlfhTJxXguVyPJNOcbfMK+QP08VfKQq1F+QVS3
 Nd2Q==
X-Gm-Message-State: AOAM533dAkbTRryfj1r2ygFx8Kb9qAWs4/wMHbilDpWUIR5Ku8KTQjGY
 MeZuUoiaWdje9clMSlgK+/vdfPChOOpx1CJqsX5bw/AO
X-Google-Smtp-Source: ABdhPJynOpiNuOVIcBob6EFYuX06oORU0/jk7cR+shqJSfyL5m7zh5SUc3hGcpvbjPMeRxjREoMPCeU1d+36zaGdt9o=
X-Received: by 2002:a17:906:a10e:: with SMTP id
 t14mr5132166ejy.103.1618518058833; 
 Thu, 15 Apr 2021 13:20:58 -0700 (PDT)
MIME-Version: 1.0
References: <20210414134112.25620-1-iii@linux.ibm.com>
 <20210414134112.25620-4-iii@linux.ibm.com>
 <d3d690a0-c322-5fbb-26ae-dcbf08173b0a@redhat.com>
 <28224ba9d61d0d805a162c00903559f3b99bc722.camel@linux.ibm.com>
 <CAMo8Bf+s4OqYJLTkvyPvfnmH=FwxDSFn60TryKfgErxFyB+2yQ@mail.gmail.com>
 <cfae4bbd-3068-41f6-ec38-a27cf7381fee@linaro.org>
 <CAMo8BfJNcfAp_tJWHQziUQXxR8WykLcBGTKnHeWS=TtLYwTC=g@mail.gmail.com>
 <CAFEAcA-k_wguyTDttUVxdxrdAjBotGRV8+drhcJ49nrWEVYFjQ@mail.gmail.com>
In-Reply-To: <CAFEAcA-k_wguyTDttUVxdxrdAjBotGRV8+drhcJ49nrWEVYFjQ@mail.gmail.com>
From: Max Filippov <jcmvbkbc@gmail.com>
Date: Thu, 15 Apr 2021 13:20:47 -0700
Message-ID: <CAMo8Bf+_OQY7n0UKLFqq89HiyijH6ifN40eRiXmi5y+tsdmpwA@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] accel/tcg: Assert that tb->size != 0 after
 translation
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=jcmvbkbc@gmail.com; helo=mail-ej1-x62d.google.com
X-Spam_score_int: -5
X-Spam_score: -0.6
X-Spam_bar: /
X-Spam_report: (-0.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 FROM_LOCAL_NOVOWEL=0.5, HK_RANDOM_ENVFROM=0.001, HK_RANDOM_FROM=0.999,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 David Hildenbrand <david@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 qemu-s390x <qemu-s390x@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Apr 15, 2021 at 8:03 AM Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Thu, 15 Apr 2021 at 02:24, Max Filippov <jcmvbkbc@gmail.com> wrote:
> > I see a few places where target/xtensa may do that. E.g. it does that on entry
> > to an exception handler to allow for debugging its first instruction.
>
> That should now be handled by the common code, I think (see commits
> a7ba744f4082ab and ba3c35d9c402636) -- does xtensa still need to
> special case this ?

Thanks for letting me know. It now stops there twice, so no, special casing
is no longer needed. I'll send a patch.

-- 
Thanks.
-- Max

