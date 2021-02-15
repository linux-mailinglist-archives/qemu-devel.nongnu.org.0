Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 027EB31B81B
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Feb 2021 12:38:42 +0100 (CET)
Received: from localhost ([::1]:34788 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBcDB-0004Oy-0S
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 06:38:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35852)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lBcBj-0003Zd-3C
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 06:37:11 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:44378)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lBcBh-0005Ki-MW
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 06:37:10 -0500
Received: by mail-wr1-x434.google.com with SMTP id g6so8423375wrs.11
 for <qemu-devel@nongnu.org>; Mon, 15 Feb 2021 03:37:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=B0sy0eqZaOV1fo8O9YB1HVWm6JRjtkyNdRGCMfL+3c8=;
 b=w04o29Km2vwikYq3srneriGoO5td8FwiakRh/vQe/8/YwZcg5cEI0x+/446ZexbeTW
 WKqqKpYyxg72w5VoaMbqBGlxJo8H1fcUSRigFtkMMoeoTkUWuZhV/9Gcuh3RhqlA3gTx
 Jp1mlr3xWpNcWebTuK1Wf5QPTHQtVgZGVB/oM8azMHTvD4FCsIGs60ui7tyR6RB7B8Ig
 dRWGczIr47NF/DxHgvzrp6e27e56Kr2al8pGPCWYFcHYTbCFX6BaoDU1BpPDIY/yQk4G
 AqGUeluG8Gbwi9EYgv0a0C9R+JfSQ9f1iUcEf3mfbYTL5oNnJPH0C9lFXKjl9iJq7wxD
 o5hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=B0sy0eqZaOV1fo8O9YB1HVWm6JRjtkyNdRGCMfL+3c8=;
 b=GYIJoQKwWEyFdCqtQHQs0xN0qeQg1tgdIJq7nE0saavoqFIa13lWRxY7CCL4UdHVtn
 dF6MMxH4YVJ3QQtY47ZhqcQh9PW7lR1oKwXuwew/Lbr0YQfd0HQSh0lbCE5iAkWJO78D
 ldJa2Ywt4sArZdOcqbqGQjb03ZhZrK5Rekm60edz5yuy7Nl5lThWAk48GNvUWytgF0oe
 x+bzLZ4l5kNytKsF7iaT7vjtLparFCH/K+E5cTbH54soUhnq8DefOB4gktmaizxXCnA8
 uMtg4147GNEuuL7Z/KKEb2S9gH917u6EOGfyIxmauzn1QluxFPD0RZOaTWDNW7NzOxH2
 oykw==
X-Gm-Message-State: AOAM533npcH9LlHki/KmdV/gjHJFvBWRl82LlzUBPoOQDSn/9WFEIIVq
 EKroFrEBpKYwyuQLPCkgK820Gg==
X-Google-Smtp-Source: ABdhPJwbfCVQo5GIYbdtgWmgmdcgu99cJtwiRVGJXEwxuhO66UQmcn/dSpNo+vb8EFh4bgp2Yj6XPg==
X-Received: by 2002:adf:f6d0:: with SMTP id y16mr18623375wrp.351.1613389027643; 
 Mon, 15 Feb 2021 03:37:07 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id f17sm2472938wru.31.2021.02.15.03.37.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Feb 2021 03:37:06 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 0F90C1FF7E;
 Mon, 15 Feb 2021 11:37:06 +0000 (GMT)
References: <20210212123622.15834-1-cfontana@suse.de>
 <20210212123622.15834-7-cfontana@suse.de>
User-agent: mu4e 1.5.8; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Claudio Fontana <cfontana@suse.de>
Subject: Re: [RFC v18 06/15] meson: add target_user_arch
Date: Mon, 15 Feb 2021 11:37:00 +0000
In-reply-to: <20210212123622.15834-7-cfontana@suse.de>
Message-ID: <87a6s5v9y5.fsf@linaro.org>
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Roman Bolshakov <r.bolshakov@yadro.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Claudio Fontana <cfontana@suse.de> writes:

> the lack of target_user_arch makes it hard to fully leverage the
> build system in order to separate user code from softmmu code.
>
> Provide it, so that we can avoid the proliferation of #ifdef
> in target code.
>
> Signed-off-by: Claudio Fontana <cfontana@suse.de>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

