Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C29CB2D42D9
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 14:12:24 +0100 (CET)
Received: from localhost ([::1]:42266 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmzGZ-0003bb-8M
	for lists+qemu-devel@lfdr.de; Wed, 09 Dec 2020 08:12:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51332)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kmz6o-0000pu-Nu
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 08:02:18 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:50607)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kmz6k-0007Zr-Uv
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 08:02:18 -0500
Received: by mail-wm1-x330.google.com with SMTP id c198so1410473wmd.0
 for <qemu-devel@nongnu.org>; Wed, 09 Dec 2020 05:02:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=2XsExiL1VtyWhsgjypzTFGi5wG+IpMZO3q8YPancIO8=;
 b=jOISjl7uiRmKf+hYshFJyNzRzvqxfBSwjzBmNTsaC7ahyVGkU1pftgBLAcCUbomPli
 dkoA2JE8oijjP1bKPq7Qt/g1wYv4vbFs4do8/D01bi/7alhbsmG70a+8BPO5XUe2p5LT
 ZJZCTOXmMa08KihX9/zrO7lzK3ZN4++cKH39fZu2Mup56bR8uTTtlRLjFitrriMMiuNG
 vpRvv8Ljlux9mQkG7QmM/68g3UkgrgnHWV+yuefcFsf2ot7KO1ghqXXf3ogDsHzomL88
 iAgprs9yzRghAeYq5gKPHm9Lo1WWLPDqxHx8bEbM2GWMhKMliqlTBMqMWqQTGfwLe8Lh
 mRzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=2XsExiL1VtyWhsgjypzTFGi5wG+IpMZO3q8YPancIO8=;
 b=rGEYYNpddBhKWal0m1VfmWgJ1AaC1BJ4vS/37TB8iJKhELpa/n/+prOm/u3HXknMR3
 rDaiOdP2Qj48j6Ewc+G32L0HEj9Cbx0js2dU8R8UcrbVrLa38iKI6Tol21WMX+GBSyCb
 RXCZqqmqrwpOi2a/j6XJC2wNxWros7qui3Lt0f9rHW+xPLg+HdC5Me7Pp9QzG2zExMga
 tgk+uawZtujyPOlysPLeowo2uVLhdzipWWpNWe7l4dJkSjIGWY4oUAvws9z30HdoC26W
 ZjvMIAPTAjl+1LH7qXeVuL5TA3ZYGE6d/vE2gUQMrVUaIvTA5kqORAmmIEJ5EJ4QdlpB
 4iBg==
X-Gm-Message-State: AOAM530xuhADSJzuf9cyloWNR79IpQLRTaGde7H1ILxp2U5d7C9pBPS1
 KnFsRoqQkp2U1vZyRwB9Rhx75A==
X-Google-Smtp-Source: ABdhPJwEWy9bj9rofbmeU0FFHzJ1D4rZpd7i6kqpD5jLZrW27+Y/yS2Y9aVypaEKdkK0FabLt6jfOQ==
X-Received: by 2002:a05:600c:1483:: with SMTP id
 c3mr2676987wmh.87.1607518932966; 
 Wed, 09 Dec 2020 05:02:12 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id u66sm3567739wmg.2.2020.12.09.05.02.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Dec 2020 05:02:09 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id E95B41FF7E;
 Wed,  9 Dec 2020 13:02:07 +0000 (GMT)
References: <20201208194839.31305-1-cfontana@suse.de>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Claudio Fontana <cfontana@suse.de>
Subject: Re: [RFC v9 00/22] i386 cleanup
Date: Wed, 09 Dec 2020 12:58:54 +0000
In-reply-to: <20201208194839.31305-1-cfontana@suse.de>
Message-ID: <87pn3jceuo.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x330.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Paul Durrant <paul@xen.org>,
 Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org,
 Peter Xu <peterx@redhat.com>, haxm-team@intel.com,
 Colin Xu <colin.xu@intel.com>, Olaf Hering <ohering@suse.de>,
 Stefano Stabellini <sstabellini@kernel.org>, Bruce Rogers <brogers@suse.com>,
 "Emilio G .
 Cota" <cota@braap.org>, Anthony Perard <anthony.perard@citrix.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Cameron Esfahani <dirty@apple.com>, Dario Faggioli <dfaggioli@suse.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, Wenchao Wang <wenchao.wang@intel.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Claudio Fontana <cfontana@suse.de> writes:

<snip>
>
> Looking forward to your comments on this proposal,

OK I've completed my pass although I petered out a little just before
the changes that affect the explicit ordering which was a bit too much
for my brain to process after lunch. Some general thoughts...

I like the way this is going and having the much more modular concept
for both accelerators and target accelerator support. However to protect
the new build combinations I think we need to cover some TCG and HW
accelerator builds in the gitlab build matrix.

--=20
Alex Benn=C3=A9e

