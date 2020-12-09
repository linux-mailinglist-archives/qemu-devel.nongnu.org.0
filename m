Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98D222D3ED3
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 10:34:04 +0100 (CET)
Received: from localhost ([::1]:43634 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmvrH-0007OG-KY
	for lists+qemu-devel@lfdr.de; Wed, 09 Dec 2020 04:34:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57948)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kmvpQ-0006Xp-5y
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 04:32:08 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:37864)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kmvpO-0001SZ-8F
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 04:32:07 -0500
Received: by mail-wm1-x32b.google.com with SMTP id q75so906327wme.2
 for <qemu-devel@nongnu.org>; Wed, 09 Dec 2020 01:32:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=moRo1YMBxVuZ00bBemvfwZjn12AxqnAaIuI+WYZF6vg=;
 b=i6ZzcOL2wmsLoXstXFCy7tHNU/lJyukIRZZhujVh4dcSX0LBD/A6ZPqtmOuf0CoS2y
 DNB7oROrUftPLGhCVIwdP5rzRCPbKyR61YxdZ1QpVY3t6Ogp37BYL1eJK++vY+3olgtD
 6gQfJxt0VLtF4IKu905mSOPTjPkJCEklzBm/qVHt5dH9/+TkBv6gRJ4NcqoXkKmWj/lA
 iIjJYxfksJ3NYhT5/TVW6jq1/WezK+lybfuA253jnIeZPwK5JsV2sDZkBBzgfpYPyU+J
 fy2rFkH539ejK25A+TpD09qAlHggzAUuW8HAWL8kF5z3eDgFJ5Oh1EvbyYRW4qlwLJUB
 RH0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=moRo1YMBxVuZ00bBemvfwZjn12AxqnAaIuI+WYZF6vg=;
 b=XBCJXAMH1Ugb/GFCN+hwyws3fBSoPNc6wvhJWvRPit0W57LzVa2HVSpkCW8L3T1jje
 RRDMr7OHvocemx3bSDDiLOvfgd2COrSEeB1cx3GBNmgtz/bcv7vAr5A+TixHMl0gLnLJ
 lvIZ+Vv38HFb2qW9M+e4Q38VKy9wtETz01/sRb3LnE69yfUW1ikkRxDyrkoN17YKvuy6
 ps2nkIg3Sh8+XponWxT6bDhnI+N7pj7pyvpdcUtadJpQzF+v44mGDt4j+NkFOMhjiXaT
 ZO5M0y8/LBKbTBwfSm88RinBJUD9oBJOyzgmUz7M469S2j3ufiz2z/R1O0TDpk8PJllh
 uSAA==
X-Gm-Message-State: AOAM532U4PdQZr0/k9/+Vgoyf0RWFpRh+P2iJhkHT+36GrLhGnp37f/m
 A214AIdEdWrdTHEcEQg5/IX5Ow==
X-Google-Smtp-Source: ABdhPJyepRPwLAqrLaBj7h2+rWY9BUbQaPlp14QnXxtJLrZoUXeGkSJKJL5CWIiNF9Q1soA94KVEhA==
X-Received: by 2002:a1c:a185:: with SMTP id k127mr1833362wme.23.1607506319744; 
 Wed, 09 Dec 2020 01:31:59 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id z2sm2441480wml.23.2020.12.09.01.31.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Dec 2020 01:31:58 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 7AF871FF7E;
 Wed,  9 Dec 2020 09:31:57 +0000 (GMT)
References: <20201208194839.31305-1-cfontana@suse.de>
 <20201208194839.31305-9-cfontana@suse.de>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Claudio Fontana <cfontana@suse.de>
Subject: Re: [RFC v9 08/32] i386: move TCG accel files into tcg/
Date: Wed, 09 Dec 2020 09:30:56 +0000
In-reply-to: <20201208194839.31305-9-cfontana@suse.de>
Message-ID: <87blf3fhpu.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32b.google.com
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
Cc: Paul Durrant <paul@xen.org>, Jason Wang <jasowang@redhat.com>,
 qemu-devel@nongnu.org, Peter Xu <peterx@redhat.com>, haxm-team@intel.com,
 Colin Xu <colin.xu@intel.com>, Olaf Hering <ohering@suse.de>,
 Stefano Stabellini <sstabellini@kernel.org>, Bruce Rogers <brogers@suse.com>,
 "Emilio G . Cota" <cota@braap.org>, Anthony Perard <anthony.perard@citrix.com>,
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

> Signed-off-by: Claudio Fontana <cfontana@suse.de>
> ---
>  target/i386/meson.build             | 14 +-------------
>  target/i386/{ =3D> tcg}/bpt_helper.c  |  0
>  target/i386/{ =3D> tcg}/cc_helper.c   |  0
>  target/i386/{ =3D> tcg}/excp_helper.c |  0
>  target/i386/{ =3D> tcg}/fpu_helper.c  |  0
>  target/i386/{ =3D> tcg}/int_helper.c  |  0
>  target/i386/{ =3D> tcg}/mem_helper.c  |  0
>  target/i386/tcg/meson.build         | 13 +++++++++++++
>  target/i386/{ =3D> tcg}/misc_helper.c |  0
>  target/i386/{ =3D> tcg}/mpx_helper.c  |  0
>  target/i386/{ =3D> tcg}/seg_helper.c  |  0
>  target/i386/{ =3D> tcg}/smm_helper.c  |  0
>  target/i386/{ =3D> tcg}/svm_helper.c  |  0
>  target/i386/{ =3D> tcg}/tcg-stub.c    |  0
>  target/i386/{ =3D> tcg}/translate.c   |  0
>  15 files changed, 14 insertions(+), 13 deletions(-)
>  rename target/i386/{ =3D> tcg}/bpt_helper.c (100%)
>  rename target/i386/{ =3D> tcg}/cc_helper.c (100%)
>  rename target/i386/{ =3D> tcg}/excp_helper.c (100%)
>  rename target/i386/{ =3D> tcg}/fpu_helper.c (100%)
>  rename target/i386/{ =3D> tcg}/int_helper.c (100%)
>  rename target/i386/{ =3D> tcg}/mem_helper.c (100%)
>  create mode 100644 target/i386/tcg/meson.build
>  rename target/i386/{ =3D> tcg}/misc_helper.c (100%)
>  rename target/i386/{ =3D> tcg}/mpx_helper.c (100%)
>  rename target/i386/{ =3D> tcg}/seg_helper.c (100%)
>  rename target/i386/{ =3D> tcg}/smm_helper.c (100%)
>  rename target/i386/{ =3D> tcg}/svm_helper.c (100%)
>  rename target/i386/{ =3D> tcg}/tcg-stub.c (100%)
>  rename target/i386/{ =3D> tcg}/translate.c (100%)

I noticed target/i386/helper-tcg.h is still in the main directory. It
maybe be a straggler that is harder to separate - if so might be worth
mentioning in the commit message. Otherwise:

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

