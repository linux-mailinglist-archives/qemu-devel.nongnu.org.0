Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C67C6D7A9F
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Apr 2023 13:04:30 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pk0uz-0002gV-6b; Wed, 05 Apr 2023 07:03:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pk0tm-0002Yy-Ed
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 07:01:57 -0400
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pk0tY-0001rn-P8
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 07:01:48 -0400
Received: by mail-ed1-x533.google.com with SMTP id ek18so140086517edb.6
 for <qemu-devel@nongnu.org>; Wed, 05 Apr 2023 04:01:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680692499;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=AzKNBFdzTq1xZJpSMQVazHJ3fmndy4BwcJCONUr3Dw8=;
 b=zRpbIM4NWNXE6l7xr2GUUPvaBm7ENW3gl2qnq1Nfhi0fipLVfbV44S5Qwm9QVBjk2b
 BHRKYgCOlZgxow3hDFuRlDsOdXGYqnPB36MJ6CNzwe943PIhh3YC82xXgxUtaqcxi+wN
 3SGpWC8/SWQ/itlkiKciWTV0YLXpnPSfi+JhD83o2Z4B2BDjR550PYEjaxEzk1+5xixO
 I3/01scLxOSfHUyfx88KZ3HTOrH/17gs4feMLab2NrzvYPTamieOqPCsstmzRxAJsXk2
 yH7Sd66IR+LeyFjTZapiEDVCAth3ipOCue29hKmK3RrpLg1wn2CmGUly/oISo7DR0kL3
 Ng7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680692499;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=AzKNBFdzTq1xZJpSMQVazHJ3fmndy4BwcJCONUr3Dw8=;
 b=qk2RxE33vYmLwR2hN3vfBQAim0Jcwqu0kBse8AvA+RK0OEqHXRGONU4H9bY50K53+Y
 mgXCq+yyPlrfg73uMsWSCde6EzYyz3jY221FuP+XYS6Vto96QBikCvCLWEllNmcGO9I2
 Qi2V6g0SPYo53YuXuNuS+mShONcvHvX5FpCQT9R+siBw6s+YwuvlvarCXV3eGb9cXoNk
 oTggSe1BNpzWW4b7BMltlhbVPBZ7uQRZT5Sx/W9GuVMEgXbRuBG20ANbRJDL4lk7REcD
 UG3VEiB9md4WIDFBJr1LTInCdOtbjunpNutJygfGuF5BR6k7N9gOmPoekkIbQwqEVo15
 rGyg==
X-Gm-Message-State: AAQBX9eW/EtFoVbIHf/6o7Nre6+lRU9UkCNevMjq266oFvB/4C0lLo+7
 +AUYq5/ZTyxTAODjBOKngQ25kAzikKk3uEtxR2osVg==
X-Google-Smtp-Source: AKy350bllHw8yN4LfJk8+r0wWkJqz0UIquQbRRkUGO+LkUwOWuizhuH3R162ogtDVmFMzRu2KtDi6Cm7B+x2CkIZHpU=
X-Received: by 2002:a17:906:5501:b0:932:446:b2f7 with SMTP id
 r1-20020a170906550100b009320446b2f7mr1426479ejp.6.1680692499022; Wed, 05 Apr
 2023 04:01:39 -0700 (PDT)
MIME-Version: 1.0
References: <20230404164839.455941-1-pbonzini@redhat.com>
In-Reply-To: <20230404164839.455941-1-pbonzini@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 5 Apr 2023 12:01:28 +0100
Message-ID: <CAFEAcA98wYJ-kxqMAt1J0WHkd7e-DTx3PnVGE8e3t7jn0kL-fw@mail.gmail.com>
Subject: Re: [PULL for-8.0? 0/1] Bug fix for QEMU 8.0-rc4
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x533.google.com
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

On Tue, 4 Apr 2023 at 17:49, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> The following changes since commit f00506aeca2f6d92318967693f8da8c713c163f3:
>
>   Merge tag 'pull-tcg-20230328' of https://gitlab.com/rth7680/qemu into staging (2023-03-29 11:19:19 +0100)
>
> are available in the Git repository at:
>
>   https://gitlab.com/bonzini/qemu.git tags/for-upstream
>
> for you to fetch changes up to 56adee407fc564da19e49cfe18e20e3da92320be:
>
>   kvm: dirty-ring: Fix race with vcpu creation (2023-04-04 18:46:46 +0200)
>
> ----------------------------------------------------------------
> Fix race condition that can cause a crash at startup.
>
> ----------------------------------------------------------------
> Peter Xu (1):
>       kvm: dirty-ring: Fix race with vcpu creation
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/8.0
for any user-visible changes.

-- PMM

