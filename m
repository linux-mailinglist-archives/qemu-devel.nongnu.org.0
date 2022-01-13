Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41F3248D75D
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Jan 2022 13:19:55 +0100 (CET)
Received: from localhost ([::1]:53988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7z58-00015A-Cl
	for lists+qemu-devel@lfdr.de; Thu, 13 Jan 2022 07:19:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34472)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n7yal-0004cG-7d
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 06:48:31 -0500
Received: from [2a00:1450:4864:20::42f] (port=37739
 helo=mail-wr1-x42f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n7yad-00043I-6G
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 06:48:25 -0500
Received: by mail-wr1-x42f.google.com with SMTP id t20so2121494wrb.4
 for <qemu-devel@nongnu.org>; Thu, 13 Jan 2022 03:48:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Kk4nWK932Tv05QBY+rCwX7MLSuKB7/Th5MoZ2BNkuI8=;
 b=NKf3dsCbITGbLG0Pbe6jmFbmmVRaDn8hR1CsPADzhnvHfbTM+Q6ngxIp39nYbxDPHY
 u7hRjA9SCSvDDp9AGKC4iibugGYqnzP110nDAXZZ0uY2Uh48LXn4HQiCIhkJOppLd2Ug
 Q/5WhJ8he5qT6q4Y4nAMcI6ATVp74wTwXQeAiAcCKEiIw5hXQ6ysDqgCQ/gSWJleR9gO
 4cvql0wQq4MS9ps5QbSgEeLUYNnPJLBSuvrnIs1ZK7anNtxvPdBQzTI7DmxyujHM5FcC
 9Xt5nZ64bd+/Per5QslLEWdQCBCwshagxkqv4Edst+6kAeMZFJoeDmzEknBG5eU5KFoD
 xuGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Kk4nWK932Tv05QBY+rCwX7MLSuKB7/Th5MoZ2BNkuI8=;
 b=CAB0w0PTfWYXdAFsgDZzSPzgq9zHz+YevpYyd0vn9u5jwDNvUPBlnPN7OH05C56i3U
 IwgtwJhU58H7JtMhK8CNjjHb4Hwol7m9CJMpe6doElkVqY79+rJgSQxK9FY36NzscT1i
 vyq5kOB5Fo3Fo3mJaZHNHm9hDTrQIlsfQHwhf3w0NGaLLvXzX4NQJC2x/h6lvk4Y6svU
 e3obqb/3KB8bqWeyjcj1UYdjwWXLN+JfAt9q1rIrWfum4sxnr+0DfxNbtiShdujcuCrX
 eXt864ppq5lR8oHiXP/s7ZCI72rGf5mlgumlr2+El+3LeTdBpXF8ZCpGWBLvC1I92Nm3
 7fMA==
X-Gm-Message-State: AOAM533iGgKrJflMf+5r6SCP2h5u1CF517EDdrEQLxKT7RrF9ETy3+AO
 OLmmdwtu3PKn1nUvn5DmyVifdSJMIc+htjE3vGJyJA==
X-Google-Smtp-Source: ABdhPJyklavDQ9uXmJC05oLUU5VFL2VFBGc2KVBMY6Yxdcm7Sgj86/L5OSL+0KuCR7JJfTqE01I+pUegJstQlcs41Cc=
X-Received: by 2002:adf:ee0e:: with SMTP id y14mr3794615wrn.172.1642074501247; 
 Thu, 13 Jan 2022 03:48:21 -0800 (PST)
MIME-Version: 1.0
References: <20220110214755.810343-1-venture@google.com>
In-Reply-To: <20220110214755.810343-1-venture@google.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 13 Jan 2022 11:48:10 +0000
Message-ID: <CAFEAcA8Bki2dpyptkSibz5=t9Fvy-PN8SjD=Z0PwcssX3MprRA@mail.gmail.com>
Subject: Re: [PATCH 0/2] Adds designware i2c module and adds it to virt arm
To: Patrick Venture <venture@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: mst@redhat.com, qemu-devel@nongnu.org, shannon.zhaosl@gmail.com,
 qemu-arm@nongnu.org, ani@anisinha.ca, imammedo@redhat.com, crauer@google.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 10 Jan 2022 at 21:47, Patrick Venture <venture@google.com> wrote:
>
> This patch series introduces a new i2c module, namely the designware one and further enables this (optionally) for the virt-arm machine.
>
> Chris Rauer (2):
>   hw/i2c: Add designware i2c controller.
>   hw/arm: Enable smbus on arm virt machine.

I need to see a pretty strong justification for why we
should be adding new kinds of devices to the virt machine,
given that it increases complexity and potential attack
surface for using it with KVM; this cover letter doesn't
seem to provide any...

thanks
-- PMM

