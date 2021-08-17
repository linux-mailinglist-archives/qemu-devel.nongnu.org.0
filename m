Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56E273EEC29
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Aug 2021 14:08:15 +0200 (CEST)
Received: from localhost ([::1]:58024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mFxt8-0006KH-EU
	for lists+qemu-devel@lfdr.de; Tue, 17 Aug 2021 08:08:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44822)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mFxs6-0005dt-Lg
 for qemu-devel@nongnu.org; Tue, 17 Aug 2021 08:07:10 -0400
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d]:42810)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mFxs2-0002Uh-Sq
 for qemu-devel@nongnu.org; Tue, 17 Aug 2021 08:07:10 -0400
Received: by mail-ej1-x62d.google.com with SMTP id b10so29640324eju.9
 for <qemu-devel@nongnu.org>; Tue, 17 Aug 2021 05:07:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nlu7aTE7e0kQShtthtNuJIV/3cdjng994sbbc6JxtsI=;
 b=RIMnXOIMSpkEgZtvgftS3RqPhgAlEq89oGQ2F5XlP9ngxtXyVFLK4RexDKPUGdHdAH
 e2PSSdApbcP9ANw3ZvcTCr8Ys4pBlVhSVOxkTvYrt021UhPRnGUjhHbz/YqlnjS8AHL3
 9AuStTiRpcj7QkI6hw1D+QttjShOCol1gnfr58i9zyQzezjNRtFQZBZ+FscZ9RAHzMXS
 PMHi9IvMUhukzMaV791inx+sMQNcJzYu/nIMN4TwLl8Tev/KHMZf3jkqsEb0XEQaz5K2
 /4EUmJftItq6aonDwOQzc5PYDQoeOc/QoavZ8qNpJ4+sDXEYrAj4Z3nbL3031C2rMD67
 Qo3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nlu7aTE7e0kQShtthtNuJIV/3cdjng994sbbc6JxtsI=;
 b=BsqRMZgBsqRdEqTYrM3twpdhN6kCmAx302MCT0uF1yLoqX2XqR1b+MuKiqWrIXjJBa
 L4hn7VwSI4OZ11MaJAuIsOXhAKCdynXT5z8fLQvaGVpF7JLyye4DpJvnVx2HyHAplWfZ
 NZKA34Ou/zG3HW5iHXaLShwuqn/rNF2759n4dbAhDDolPxvSld663sk59p5iHQBB7erz
 tdS2CRVWb/pXbl4Ons528d7UOr52iTv/Zo8AGHdFGkewlcPy7LgctbMlg0LCkdoeaKEa
 5GksuaMvFue2hn5x5liiZvhFDUrPeSNoFdPsYUNU9fNAdleCvhEzrpyKbRZ/ryQkuXYs
 fZ+A==
X-Gm-Message-State: AOAM531s8s9/dpbYT6XGey2Tty26gU8n3SvylnnixeQp5Y0qsEIrDqko
 vvjNA+f18YAPBlcY8dNVgvTAREVrgS8nqwceIqpjAQ==
X-Google-Smtp-Source: ABdhPJxbuAbsqg2ykgbyRQCI28EfwSrOiA0JHW9XK8w2suIt0OqSqiDEJBg07PvTM2n/MejoDXjgAsH9FXbNWxHDhbc=
X-Received: by 2002:a17:906:584:: with SMTP id 4mr3727132ejn.56.1629202025302; 
 Tue, 17 Aug 2021 05:07:05 -0700 (PDT)
MIME-Version: 1.0
References: <20210816210603.42337-1-ehabkost@redhat.com>
 <20210816210603.42337-2-ehabkost@redhat.com>
 <CABgObfaWxNsq2i8j6P+oZGFjxyR3MFE9FopHsnvuNAPXa4upYQ@mail.gmail.com>
 <20210817120250.fdpujloefaqtawwo@gator.home>
In-Reply-To: <20210817120250.fdpujloefaqtawwo@gator.home>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 17 Aug 2021 13:06:19 +0100
Message-ID: <CAFEAcA_fOa4uV3sA5kxJ1gKTGS3ASgvx2+FrG=5cr0wWaQ48-Q@mail.gmail.com>
Subject: Re: [PULL 1/1] machine: Disallow specifying topology parameters as
 zero
To: Andrew Jones <drjones@redhat.com>
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
Cc: "Daniel P . Berrange" <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Yanan Wang <wangyanan55@huawei.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 17 Aug 2021 at 13:02, Andrew Jones <drjones@redhat.com> wrote:
>
> On Mon, Aug 16, 2021 at 11:37:21PM +0200, Paolo Bonzini wrote:
> > How do we know that no one has ever used such configuration? The conversion
> > was meant to be bug-compatible.
>
> We don't. But we do know that a zero input value was never documented
> prior to 1e63fe68580, which has not yet been released. Can we claim
> that an undocumented input value has undefined behavior, giving us
> freedom to modify that behavior until it is documented?

Dunno; I definitely don't want a behaviour-change patch at this
point in the release-cycle, though...

-- PMM

