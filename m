Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [IPv6:2001:470:142::17])
	by mail.lfdr.de (Postfix) with ESMTPS id 639581C8610
	for <lists+qemu-devel@lfdr.de>; Thu,  7 May 2020 11:48:38 +0200 (CEST)
Received: from localhost ([::1]:34854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jWd8u-0001Yc-Tq
	for lists+qemu-devel@lfdr.de; Thu, 07 May 2020 05:48:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36568)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1jWd7u-00018Y-Nv
 for qemu-devel@nongnu.org; Thu, 07 May 2020 05:47:34 -0400
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:40449)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1jWd7t-0002TH-GM
 for qemu-devel@nongnu.org; Thu, 07 May 2020 05:47:34 -0400
Received: by mail-wr1-x442.google.com with SMTP id e16so5555601wra.7
 for <qemu-devel@nongnu.org>; Thu, 07 May 2020 02:47:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version:content-transfer-encoding;
 bh=0YtMi1fqEOW24Qru5X7zzkt6/l4cW7aAKxWOayl2kTY=;
 b=EIfFRUU4fNUyXmko4tN5cP2cHy7gP2h8S3fjrJiiuKj6d1ZLXyRUKNJ1F7O3tP3sGF
 4Lpv/61W482JjoyGIi9XZ0ATTOcw7Y8fd70Q9GVO/45NxxblZtylXZKqs+M5gdECMhUc
 hIckxhZKlPZjuMlEQr5w1eAgH+kebKdqwg4aLsNW6ustBce+Qt4f9zz6l/dI/mksp5Kd
 rcIxAJWzGubXfPz2YbKwyXh8WsWa7ufyQruIC2WG4mRut4Mhu88h8jbh0tikG/UHSsDl
 MkASFwORChxwbeI08FVcf7KhDuczwZo+cFGfGa/vS9vznWgfazuPDKV1ErJ/DFSYS2kQ
 w70g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version:content-transfer-encoding;
 bh=0YtMi1fqEOW24Qru5X7zzkt6/l4cW7aAKxWOayl2kTY=;
 b=ThTKj9UThN5wD2PVi7BWxxpvnh8gfbiXyh1vDgga5iZocbORFCMN14MSaXdLXh6yHL
 ePQD2R9oT8pVR1Ljj6477Tz2aMnFPXx8yv0PbqwatMWYm7azvq32tjzKT1xc+E+qasNo
 4X91cSaMJi1xmPxn/ch4kzMKkDcZNKlR7NGLRBahMT68+P0fuTe5Ges+rwVw6TUyCmLu
 GXbMVw8oD4IPFnMVuCyZNK3VyMn/plcEtDteHcS4bbLwYvOPG5eayih8xzWIealxOX5P
 KfsMLTFoVWkr0OH1CqurwmwV9Zf1PqyejOeO+xXk0rwKw1WmgCseIs1PSdmeUUOgYU7n
 Pmfw==
X-Gm-Message-State: AGi0PuZ0tXjvn7e8QxmMOwkeAFCbHelIRmwgEC6XRLYF1m1jXuzE1ej8
 2H4zWKiYmnRxQ5MIWml1RTWL+g==
X-Google-Smtp-Source: APiQypL3xcJDrdXuEbvMb/rTF0mRV177oa4CFxx419n0EPUSVe7erHruQknZEIw9X8OxVcWCu0jJ3Q==
X-Received: by 2002:adf:ed8d:: with SMTP id c13mr4027971wro.154.1588844851431; 
 Thu, 07 May 2020 02:47:31 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id j2sm770286wrp.47.2020.05.07.02.47.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 May 2020 02:47:30 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 7A2371FF7E;
 Thu,  7 May 2020 10:47:29 +0100 (BST)
References: <20200501145713.19822-1-alex.bennee@linaro.org>
 <20200501145713.19822-8-alex.bennee@linaro.org>
User-agent: mu4e 1.4.4; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: Re: [PATCH  v1 7/7] translate-all: include guest address in out_asm
 output
In-reply-to: <20200501145713.19822-8-alex.bennee@linaro.org>
Date: Thu, 07 May 2020 10:47:29 +0100
Message-ID: <87ftcc5b66.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::442;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x442.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: riku.voipio@iki.fi, richard.henderson@linaro.org, laurent@vivier.eu,
 Paolo Bonzini <pbonzini@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Alex Benn=C3=A9e <alex.bennee@linaro.org> writes:

<snip>
> diff --git a/tcg/tcg.c b/tcg/tcg.c
> index a2268d9db0..f5e4529df2 100644
> --- a/tcg/tcg.c
> +++ b/tcg/tcg.c
> @@ -4211,6 +4211,7 @@ int tcg_gen_code(TCGContext *s, TranslationBlock *t=
b)
>      }
>      tcg_debug_assert(num_insns >=3D 0);
>      s->gen_insn_end_off[num_insns] =3D tcg_current_code_size(s);
> +    s->gen_insn_end_off[num_insns + 1] =3D 0;

OK this was lazy of me and of course vulnerable to an overflow. Did you
know the sha1 test is quite capable of exceeding this?=20

--=20
Alex Benn=C3=A9e

