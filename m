Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 91C076A9CD3
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 18:11:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pY8vt-0000LX-NI; Fri, 03 Mar 2023 12:11:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pY8vD-0008SL-Ai
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 12:10:24 -0500
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pY8uz-0008PA-Tj
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 12:10:18 -0500
Received: by mail-pg1-x52c.google.com with SMTP id d6so1906782pgu.2
 for <qemu-devel@nongnu.org>; Fri, 03 Mar 2023 09:10:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677863400;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=HNgSyNQaGbSZPaia9axQEVarsvKMOEOrHvd/acA+K+k=;
 b=ISxcm3n4ecfs1BJBQ9HXAcGZ8Yq0p2FWnj7SPt9OSPbe2zXqSXFhOcnMQkV+t+L8wY
 0ZaJoptaFz9RstZtpZP6yhkN1OpsMw+eK2S1a59sMW8qEbAGv5kmCcgvKvVEcH7hgtMH
 4RPHcZJj7qVMu7AnZvBGhxrM+AOwSJW3AvH0bulrnmIr4vWntvqJyihg1hvM+9VpUgcE
 IQNeAQ5bwoIKTwILf6vmmeWJPpDEh19PimwIqqfoa/tsFmQIYwUz+DvHiBAF/cagI3Fm
 Bh42kb4JiH72eOS/8R+cObdXIPzfnuwyhbtgbSZi/1zPltadjPC+HVMSvKy2ceaylUgd
 5WfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677863400;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=HNgSyNQaGbSZPaia9axQEVarsvKMOEOrHvd/acA+K+k=;
 b=q7alWSHab8EKSjeDO/uDjaHEUy6MKQoxUKNWxEAxKeGOV9vUqLCZazMyDF3UB4nuK2
 FrPZU/c3LY0Ae6fHu2jIgJmjMdjycM/EF7zaMgqYF6J20MAEuZHozqx3haBgM+/7y+mn
 Zbl0J7z0uvbUrdQ6KbWACPCZwWHjEUmIJXOvGp34ZcIUQsywfhxLwORixLksCJ4pZr/K
 uBr+VrBSBGFtodc8tMs/4JlNhF+lYjzF+uUVbwNUSa0XLRWzioEC1zW80DcowSLcx0qC
 uMs9ZSCCEvx27XKg0ss7550Tr7F3V2mTH58+Is6X+w8PJ4GmjwR8qzyF8PHv93zvTvEx
 VYDg==
X-Gm-Message-State: AO0yUKWwmVW0KRoksRsMgffOM7ikOvhlWxkA2N1sZ5ivgoSNXdJjcVkD
 ZkaioDUyc+PZMqjSnnB1eLH5X9BbFrRRPzsl6Bot+Q==
X-Google-Smtp-Source: AK7set/YoyD5GB/AvFBrMLS9tAbYYYBZEQO0/nyZFmlttxzJgCv/dzfPq+SBkW1gNwUISPhktpXWnWZtar8d4AfGwnY=
X-Received: by 2002:a62:d041:0:b0:592:41a:1054 with SMTP id
 p62-20020a62d041000000b00592041a1054mr1179027pfg.5.1677863400050; Fri, 03 Mar
 2023 09:10:00 -0800 (PST)
MIME-Version: 1.0
References: <20230302082343.560446-1-mst@redhat.com>
 <20230302191427-mutt-send-email-mst@kernel.org>
In-Reply-To: <20230302191427-mutt-send-email-mst@kernel.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 3 Mar 2023 17:09:48 +0000
Message-ID: <CAFEAcA9F9q12sNdkstYNPrnrFhk67f9BNi_zewZu6Ye9fPBpkw@mail.gmail.com>
Subject: Re: [PULL 00/53] virtio,pc,pci: features, cleanups, fixes
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x52c.google.com
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

On Fri, 3 Mar 2023 at 00:15, Michael S. Tsirkin <mst@redhat.com> wrote:
>
> On Thu, Mar 02, 2023 at 03:24:28AM -0500, Michael S. Tsirkin wrote:
> > The following changes since commit 627634031092e1514f363fd8659a579398de0f0e:
> >
> >   Merge tag 'buildsys-qom-qdev-ui-20230227' of https://github.com/philmd/qemu into staging (2023-02-28 15:09:18 +0000)
> >
> > are available in the Git repository at:
> >
> >   https://git.kernel.org/pub/scm/virt/kvm/mst/qemu.git tags/for_upstream
> >
> > for you to fetch changes up to 65888be0d4da746e2f99930e21018d801bf8995e:
>
>
> I re-pushed after fixing two commit log (same files):
> commit ee92a56b08d0b59016a4a9bc1bf3a3de1fbe3956
> now.
>
> Thanks!


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/8.0
for any user-visible changes.

-- PMM

