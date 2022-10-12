Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C27E95FCBCD
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Oct 2022 22:07:17 +0200 (CEST)
Received: from localhost ([::1]:48170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oii0Z-0000yE-9C
	for lists+qemu-devel@lfdr.de; Wed, 12 Oct 2022 16:07:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44250)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1oihyF-0007OD-VU
 for qemu-devel@nongnu.org; Wed, 12 Oct 2022 16:04:52 -0400
Received: from mail-yb1-xb30.google.com ([2607:f8b0:4864:20::b30]:39884)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1oihy8-0008PG-Rg
 for qemu-devel@nongnu.org; Wed, 12 Oct 2022 16:04:50 -0400
Received: by mail-yb1-xb30.google.com with SMTP id e62so21224819yba.6
 for <qemu-devel@nongnu.org>; Wed, 12 Oct 2022 13:04:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Y1hKwAA9bHEHd/pKSKkTsykA9C2GFIUVsc8f+C5+P3k=;
 b=BLNqMirLVuCjJYS6CYTtbBlu4PLIUn55xfzJUdOaRA9RlumHZXpZgRNoAbVlNucCcL
 YhKUKKwMCtGcBUpNl3XVhcSrlialCRySaZz6RfECAHWaUpN+Av5uABF4c5wxJ7/cBCO4
 Qfyah+NFOnXGOFTOpCQdm9jFKoCakTOgElWIpYLUz131qn7mFnrhIdtq0rE0A0ct4HC8
 P6rJsjVAzC5zQRf1zRdqGGzkRPRQm1tG8AV1OOfFBQmvRJkGN7WW2suMkyLWVOjtOFHN
 o8S6Vo9RBejqWPbCnglP4O8v58iviU/mbiLGL9Gz+PCk5yFBDB4hpx0CkZbSc6M8tXhn
 qEWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Y1hKwAA9bHEHd/pKSKkTsykA9C2GFIUVsc8f+C5+P3k=;
 b=0z431nbE1/axW9HDkdk7Vc2i+48N+/p4mTY2SmLnBLHwgiiDQN01dA4h6v0Ll1Dm1U
 2L9JuoSrD2gIpJk7grBE/OceI/T4Bx/KM52buduQQWxFDqdGNzHk3yqM3PO4Kp6xXYRu
 ohgyAYwTdEQAI3iVwOEpwAZ4/UaKYgp0xcMWjLzIyzlzFRmc/DsD9ef9EP24GYs3vkk8
 veu9Lg2YXaA6RGRS6ASWI2WqCCg1Ery/0Y1MH6nyQ9yDrKd8tLGiRPsHMi+8/WmkZCrW
 Ju2ywyPIpjcmohawxPDNMXubDwNmCJpKGlbH96UenqoRCGxV1Jd8sueKRH3meEk+SXYk
 V66A==
X-Gm-Message-State: ACrzQf2Ge+99SMmyCJoJOGlGxEG/ZLmN3CduhohX55nSGdoK+RtzK9YI
 sVo3uR3t/r5bbNd2Mr5NPqM99uDOUZPYBoK+yCs=
X-Google-Smtp-Source: AMsMyM4J1cBcOMW+dq8bXwLLw2+OGDFJtvJ/MEnZdQBu5Rt/zlA99blID41i7EYB7ksPZ6oT3OEkX8jo9lJ+qS3eNg4=
X-Received: by 2002:a25:1e89:0:b0:6bf:9e55:5cb4 with SMTP id
 e131-20020a251e89000000b006bf9e555cb4mr26056331ybe.642.1665605083528; Wed, 12
 Oct 2022 13:04:43 -0700 (PDT)
MIME-Version: 1.0
References: <20221010172813.204597-1-mst@redhat.com>
In-Reply-To: <20221010172813.204597-1-mst@redhat.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Wed, 12 Oct 2022 16:04:31 -0400
Message-ID: <CAJSP0QX9S-VgT9ooinu=BTF6ysrsMOJ29wRJMrDVY5ZbizXTSg@mail.gmail.com>
Subject: Re: [PULL 00/55] pc,virtio: features, tests, fixes, cleanups
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b30;
 envelope-from=stefanha@gmail.com; helo=mail-yb1-xb30.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 10 Oct 2022 at 13:46, Michael S. Tsirkin <mst@redhat.com> wrote:
>
> The following changes since commit f1d33f55c47dfdaf8daacd618588ad3ae4c452d1:
>
>   Merge tag 'pull-testing-gdbstub-plugins-gitdm-061022-3' of https://github.com/stsquad/qemu into staging (2022-10-06 07:11:56 -0400)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/virt/kvm/mst/qemu.git tags/for_upstream

Hi Michael,
Please update your .git/config with the https URL for future pull requests:

  https://git.kernel.org/pub/scm/virt/kvm/mst/qemu.git

The pull request is signed with your GPG, so modifications should be
detected when verifying the signature. It still seems like a good idea
to use https:// when possible instead of unencrypted git://.

Stefan

