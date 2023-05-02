Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 938EC6F45D0
	for <lists+qemu-devel@lfdr.de>; Tue,  2 May 2023 16:12:18 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ptqj1-0004pH-RN; Tue, 02 May 2023 10:11:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jcmvbkbc@gmail.com>)
 id 1ptqiy-0004p8-S9
 for qemu-devel@nongnu.org; Tue, 02 May 2023 10:11:24 -0400
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jcmvbkbc@gmail.com>)
 id 1ptqix-0002Hz-F3
 for qemu-devel@nongnu.org; Tue, 02 May 2023 10:11:24 -0400
Received: by mail-pg1-x52f.google.com with SMTP id
 41be03b00d2f7-517bb01bac9so2574894a12.0
 for <qemu-devel@nongnu.org>; Tue, 02 May 2023 07:11:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683036681; x=1685628681;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=E4g7h8Y59sEhgNDoPnYr3WBYH2Xd4qmkRQBl2W/tneg=;
 b=L4Re9MObIXUiBXhvrQxV9NhaPdUk0sjXXRea/EgBaA5P3vrXWfeIMjXQ2nGz4t5AnS
 fFdP/N9jmWbLkyOOlAfXM9Nm3C1G08PYPxYBgkeFzJGVl0fKWRqDgUBtRc8TP+mOECTM
 sIJYiR8/ACBIAeuglUoUh0pIvrDj9K9pOOlbCByMN7SyE2Q+70SS92XWMeAaIlmVe3hD
 Wy1ubsRvJV1z/sQrB9wtpy+vAQcWo6AiUO8lNowa5m6DIFKTev/zZj/KsImUCsfESjiY
 eccUNXKK1jsO3ZCQl8bUwetGrM0e1csK7m5ZEEnDqT4VaaPL9wuf4RDLDcgcCcF3szdN
 B5vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683036681; x=1685628681;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=E4g7h8Y59sEhgNDoPnYr3WBYH2Xd4qmkRQBl2W/tneg=;
 b=SEu967WjANzlwT5fVWp8TrJYaMfQfaa5aG9xgMYPuh/YXfiBp1CvtASPKFSB5ZbpMc
 hbxJaOaZKj0fGRYrydwECigz8qQfva2vbivTy+Kbe19tPWFIIxkcr4zXquH4OVxoafUE
 7pmDN/wu2honGwMy8xm2tXjujukuRPPMvFxmBcigSwgpZz+ruHlppX88XwkYWTYM8Vdc
 jHIxBDtWDd7WmTjzaidJwdMWZ9eq0xi37eHzEyxPkPlGy3G3PVPT32M4ItZy/sP9ufjq
 XuaaFH+mssXo6XZImpCi9PXMV3OyDSeyHDLu2lhWjMcpuPpRU17fUbGyJye7QBslWheF
 BYDg==
X-Gm-Message-State: AC+VfDwB9iODg/iVjXL2EUcmmh0VVsmUPKd8fYB1sY6NlSJIHQwRX4Ps
 zDq8Z5Bl49VWWoKaMVhocTQL3AkElxP7MiSkrks=
X-Google-Smtp-Source: ACHHUZ6cu5f4q8HrOWdWbAWtWTLN/xcSIXo5y285OZeXZpBp50cPCqTIoJzm083BEhcarZkQL+KNtIHoie91YXO/RE4=
X-Received: by 2002:a17:90a:384b:b0:24e:e6c:794c with SMTP id
 l11-20020a17090a384b00b0024e0e6c794cmr5082468pjf.38.1683036681154; Tue, 02
 May 2023 07:11:21 -0700 (PDT)
MIME-Version: 1.0
References: <20230502135741.1158035-1-richard.henderson@linaro.org>
 <20230502135741.1158035-9-richard.henderson@linaro.org>
In-Reply-To: <20230502135741.1158035-9-richard.henderson@linaro.org>
From: Max Filippov <jcmvbkbc@gmail.com>
Date: Tue, 2 May 2023 07:11:09 -0700
Message-ID: <CAMo8BfK-4EoV4g=d+FaJcGTjaQ3xJpa5Fw6NTx-muSO4G8oSFg@mail.gmail.com>
Subject: Re: [PATCH 8/9] target/xtensa: Finish conversion to tcg_gen_qemu_{ld,
 st}_*
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, mrolnik@gmail.com, edgar.iglesias@gmail.com, 
 tsimpson@quicinc.com, ale@rev.ng, anjo@rev.ng, laurent@vivier.eu, 
 philmd@linaro.org, jiaxun.yang@flygoat.com, david@redhat.com, 
 iii@linux.ibm.com, thuth@redhat.com, mark.cave-ayland@ilande.co.uk, 
 atar4qemu@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=jcmvbkbc@gmail.com; helo=mail-pg1-x52f.google.com
X-Spam_score_int: -2
X-Spam_score: -0.3
X-Spam_bar: /
X-Spam_report: (-0.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 FROM_LOCAL_NOVOWEL=0.5, HK_RANDOM_ENVFROM=0.266, HK_RANDOM_FROM=0.999,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

On Tue, May 2, 2023 at 6:57=E2=80=AFAM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Convert away from the old interface with the implicit
> MemOp argument.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/xtensa/translate.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Max Filippov <jcmvbkbc@gmail.com>

--=20
Thanks.
-- Max

