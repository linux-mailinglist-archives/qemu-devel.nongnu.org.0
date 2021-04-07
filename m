Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE60335771E
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Apr 2021 23:46:42 +0200 (CEST)
Received: from localhost ([::1]:45342 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUG0X-0003E5-Bl
	for lists+qemu-devel@lfdr.de; Wed, 07 Apr 2021 17:46:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49262)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lUFzS-0002i0-2G
 for qemu-devel@nongnu.org; Wed, 07 Apr 2021 17:45:34 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:42943)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lUFzN-0004Ve-QW
 for qemu-devel@nongnu.org; Wed, 07 Apr 2021 17:45:33 -0400
Received: by mail-wr1-x434.google.com with SMTP id q26so13795715wrz.9
 for <qemu-devel@nongnu.org>; Wed, 07 Apr 2021 14:45:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=v8f/9c3GpvPxTWX4xWD0idwa7RrNsuUHI53yfF1vLL4=;
 b=UgaskKDQVectrbZkXRdUbakav8AY9W6jVPOXKQpwzVCYC6Mz5lGgIVIgDgO41Wu9Bv
 dAR3qtRiD/QQCLMKvhCls1Y6nJ/ilmCGF6z5B/uy+jVNHPM8zS/gQErpletsQVz/ofw5
 kPnsM9huNAex4SxES0lyZORS4QP84SQFRxBnstdFQexwbS40R6xDV9KW2daehuoNNUeg
 ebVTnOzdPmrrkIN7C311rbzp9lheWWYMfKF+UBNmvZ8snugUbxOGnQ6krnE6SHu7cdUe
 9hZJhfUvM9OiTZ8X33rTNS8fjHdN1DsJcZscvWd/VY5UrIi/ZIo1QmB2EBKroThG+PT0
 md3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=v8f/9c3GpvPxTWX4xWD0idwa7RrNsuUHI53yfF1vLL4=;
 b=DPY5y5pJmtKVYz+0Y/GIiDXwu+6EmsOOaf9912iOWA1jyttANTltCG0ugavqLHLfv0
 0ds3p1cyGGmmZwDyomSTJ18cYFW8LYyEsxbTY8Ynaf80i/Y+jACANlZg44mVmyDKbf72
 XkSavekT6niZ5T7s4TX7TVi2tEY/HXgFgFW9pI+HH8faIzr5/+8DDnY3I630RpKD2GKF
 RW1eUIh273kIXiFlgkuH5VirS/CbDzuKrd/Ik1dfnBZPV7XefnecW7jZXXc/U2J/hZNH
 t1o6BZcVS2v92jFNZqIZZImiHlrobS6c0SDmcrB/7N6cfcq6VepKyT1L+O4XS6T3GD8Y
 ViwA==
X-Gm-Message-State: AOAM531Y3sCxaJiLRXIbLfdadoB/wpEPbyuAKlDISYsLH2spIjNE6M/7
 JGhFu7XbnF18zwzydxZ6UgqLCg==
X-Google-Smtp-Source: ABdhPJxLBu2xu/CwMOPuQtHjBPFn6Uf6VQpHieNU1FqumBn2RuQZN3gNPnga/onDKe8yQryxnWDgEQ==
X-Received: by 2002:adf:d208:: with SMTP id j8mr6953343wrh.115.1617831927467; 
 Wed, 07 Apr 2021 14:45:27 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id a65sm11088418wme.17.2021.04.07.14.45.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Apr 2021 14:45:26 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id B9E4A1FF7E;
 Wed,  7 Apr 2021 22:45:25 +0100 (BST)
References: <161713286145.25906.15042270704525675392.malonedeb@wampee.canonical.com>
 <161782908442.29743.17585290508436200821.malone@gac.canonical.com>
 <874kghvl2s.fsf@linaro.org>
User-agent: mu4e 1.5.11; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Bug 1921948 <1921948@bugs.launchpad.net>
Subject: Re: [Bug 1921948] Re: MTE tags not checked properly for unaligned
 accesses at EL1
Date: Wed, 07 Apr 2021 22:45:06 +0100
In-reply-to: <874kghvl2s.fsf@linaro.org>
Message-ID: <871rblvkei.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x434.google.com
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Alex Benn=C3=A9e <alex.bennee@linaro.org> writes:

> Andrey Konovalov <1921948@bugs.launchpad.net> writes:
>
>> Is this with QEMU master without the patches mentioned in this bug?
>
> This is with Richard's latest series.
>
>>
>> Which kernel version do you use?
>
> v5.11
>
>> Could you share your kernel config?
>
> We are just testing with Richard's config and eliminating compiler
> shenanigans now.

OK with v5.12-rc5 and Richard's config I get a clean pass.


--=20
Alex Benn=C3=A9e

