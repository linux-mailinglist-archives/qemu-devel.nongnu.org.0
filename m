Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 446CBD69E5
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Oct 2019 21:09:32 +0200 (CEST)
Received: from localhost ([::1]:55992 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iK5il-0004jw-27
	for lists+qemu-devel@lfdr.de; Mon, 14 Oct 2019 15:09:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36002)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alex.bennee@linaro.org>) id 1iK5hc-0003z6-NB
 for qemu-devel@nongnu.org; Mon, 14 Oct 2019 15:08:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1iK5hb-00061W-JF
 for qemu-devel@nongnu.org; Mon, 14 Oct 2019 15:08:20 -0400
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:38751)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1iK5hb-000614-8n
 for qemu-devel@nongnu.org; Mon, 14 Oct 2019 15:08:19 -0400
Received: by mail-wr1-x444.google.com with SMTP id y18so11499530wrn.5
 for <qemu-devel@nongnu.org>; Mon, 14 Oct 2019 12:08:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version:content-transfer-encoding;
 bh=n/Jx++kHOCD2OSohYJ1bWfqnDHECBDUD3wdKhF8LqHE=;
 b=pvRH8e9qqDeBz9rMC34fHl3PVRTG1ZQ+6mNTZpB6H/XSwKJpgYGtV72C1sYx3aNZWw
 b4pTmcR0CDrHEE6NV3m4PyIyrlfQ2H+uCVht214lOv/Xykdi/DBO7jn8FjFWDKeWEbSW
 gEbq/raRrVrXHAC1+ev5xDzZ/ytFtNNwfPjdPqc1ttSEX5dJJJaSvOFfDvyHNwSk0InG
 3bn2rBFrXnf+PRPTgFWOINEd2ZquGz2NHcJLdBgf7MS7glOkM6vsr2h7oPTfy5396z8c
 wZm3ci4tlMegmJZm+4MnBDOiBEieo5F50PYlCS/S9OeLD8nMyAG4vVYVhd0Qggm2OeW8
 tGlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version:content-transfer-encoding;
 bh=n/Jx++kHOCD2OSohYJ1bWfqnDHECBDUD3wdKhF8LqHE=;
 b=WNwwyFuFunEB2qWi0ggKHOlQzNltgX1ZqK2MH0SKzYMCzucmm/G++GoGIujsbMpir0
 LjFLdf5+oBs74ayUN4N3nFe3pYCGLHWpjh2QDLk506YTTYGCPojjLseooCzQtMWO1Vhc
 CbJhEm6Z1P08ip+uWI3czklInCVIHjeDV5juFw2qrkHlcr2V5bmFpjskjd6ofjsaBENn
 T5pzTH39+NLKNytrnN/qLU7lWsguN5Zk2eNI6MPRcZY5JEoz7XsZoqzGt2KrnYmW7Y5N
 6yZsPsXlKkU/sgE5uyHykCdhs9gku9Ue26oGNT1wfkTfXjiF3e58I86PEnm1ixczORs2
 8vHg==
X-Gm-Message-State: APjAAAWO16ltoeskQh/aTXLHTCS4sCk7KG2latKiZi2Elsr6QOvMFfAG
 C9qBZsp+sSO0hpnWv8KXy96xLg==
X-Google-Smtp-Source: APXvYqz14U+jjG0ysDVoYGSlI82VlXET9D83Tc1bmeggE9l5wI6aJwrJOUsgfAEH+1mY9Fgn2/MPrw==
X-Received: by 2002:adf:e4c2:: with SMTP id v2mr26045941wrm.324.1571080097427; 
 Mon, 14 Oct 2019 12:08:17 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id q3sm17069429wru.33.2019.10.14.12.08.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Oct 2019 12:08:15 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 163181FF87;
 Mon, 14 Oct 2019 20:08:15 +0100 (BST)
References: <20191011155546.14342-1-richard.henderson@linaro.org>
 <20191011155546.14342-19-richard.henderson@linaro.org>
User-agent: mu4e 1.3.5; emacs 27.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-arm@nongnu.org
Subject: Re: [PATCH v6 18/20] target/arm: Rebuild hflags at CPSR writes
In-reply-to: <20191011155546.14342-19-richard.henderson@linaro.org>
Date: Mon, 14 Oct 2019 20:08:15 +0100
Message-ID: <875zkrm9gg.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::444
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
Cc: laurent.desnogues@gmail.com, peter.maydell@linaro.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> Continue setting, but not relying upon, env->hflags.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/op_helper.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/target/arm/op_helper.c b/target/arm/op_helper.c
> index ccc2cecb46..b529d6c1bf 100644
> --- a/target/arm/op_helper.c
> +++ b/target/arm/op_helper.c
> @@ -224,6 +224,7 @@ uint32_t HELPER(usat16)(CPUARMState *env, uint32_t x,=
 uint32_t shift)
>  void HELPER(setend)(CPUARMState *env)
>  {
>      env->uncached_cpsr ^=3D CPSR_E;
> +    arm_rebuild_hflags(env);
>  }
>
>  /* Function checks whether WFx (WFI/WFE) instructions are set up to be t=
rapped.
> @@ -387,6 +388,8 @@ uint32_t HELPER(cpsr_read)(CPUARMState *env)
>  void HELPER(cpsr_write)(CPUARMState *env, uint32_t val, uint32_t mask)
>  {
>      cpsr_write(env, val, mask, CPSRWriteByInstr);
> +    /* TODO: Not all cpsr bits are relevant to hflags.  */

Do you mean by this we could check which bits changed and avoid a
re-compute if we wanted to? Is it likely to be anything other than the
SS_ACTIVE bit?

> +    arm_rebuild_hflags(env);
>  }
>
>  /* Write the CPSR for a 32-bit exception return */

Anyway:

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>


--
Alex Benn=C3=A9e

