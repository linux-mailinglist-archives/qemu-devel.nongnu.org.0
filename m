Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B3EDD633FC
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Jul 2019 12:11:36 +0200 (CEST)
Received: from localhost ([::1]:48402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hkn5z-0005H9-VY
	for lists+qemu-devel@lfdr.de; Tue, 09 Jul 2019 06:11:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54382)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <alex.bennee@linaro.org>) id 1hkn3l-0003Kx-AJ
 for qemu-devel@nongnu.org; Tue, 09 Jul 2019 06:09:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1hkn3j-0005ik-Mb
 for qemu-devel@nongnu.org; Tue, 09 Jul 2019 06:09:16 -0400
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:35436)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1hkn3j-0005hk-9R
 for qemu-devel@nongnu.org; Tue, 09 Jul 2019 06:09:15 -0400
Received: by mail-wr1-x443.google.com with SMTP id y4so11749134wrm.2
 for <qemu-devel@nongnu.org>; Tue, 09 Jul 2019 03:09:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version:content-transfer-encoding;
 bh=IC+uL+2CKqfS4rIw0tqbdIPdBBiTwmWCMb0l2sJER/A=;
 b=Ix0FOgUwCmmfQdzdlHVqZA+iKPuTXHs9Q91BsnMmM7MgO7jR3xptje/In5EpHEsBL3
 Ya4wTLLUH4C4wJGTgzVZl6DHBk9SRAFDyGw5ENE3iB97J6rv3koWTxE6yJHGnuWoIdXw
 +M7KGp166eW+LanJJXvsPOisqNicdo/uK5rrwDDrHpV6KtT83+Ss8YrYMtDdKjWrPn/x
 5O6d7d2+Ee8Oa2Idk7fMwvwzDUasNGIrvyJtbl6gP4rd/dE4NgOM+4jNEu7hRUq5Mt8M
 PJKVUqEFFOsO2cbEII7u+/gVKIVv6+oCuqi+BOMFTUQUX3Dx7JGNvlKyZRUyjj8Qfs21
 idnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version:content-transfer-encoding;
 bh=IC+uL+2CKqfS4rIw0tqbdIPdBBiTwmWCMb0l2sJER/A=;
 b=IabLJLO1eD8mGbchgO9bI8DHX7bESt0ge/qQUNBxW8XKjL9tYJAiDE9Ac+DVR129M1
 YNoNtQD/fW2DpsAXEkWvF3ly5aDscA+RUHiPjpin6dzJ1Urv/B8g8crEwrYu42sqyjXC
 7yiqwF1U9O4y4ajbLKc/M+A3gSEdZQAFS6K0YknweRTn0+LEYWtEIx1EKOVKWdriLd5B
 lrS8VwErEt0SAaYjkumLwEdPynT5BJKoiaw0fhwgIMDQVkXg2EZ3YLDOOnZ/QkgA66zg
 i9RYWaZTHAvc0VHo/Z3QXQxPvGny3SFik/tKPME5LM2UlHWoinAA5reZBChz2IfXfcxK
 +Jxw==
X-Gm-Message-State: APjAAAUUG3LIvJG8WekJ1fNNekkDkcwc3Vz/QpJMxrQ+1evJRDvRULyc
 mmj9msmqT9fqazuhKC0XLeIlWQ==
X-Google-Smtp-Source: APXvYqyVTHJJBdqBZkJjPAJcAjrzfTuup6Lh9TQHWGssLiQgJaD6HZVbShWhTNxa9y1pE16Lh/YpPA==
X-Received: by 2002:a05:6000:1203:: with SMTP id
 e3mr23147588wrx.300.1562666953495; 
 Tue, 09 Jul 2019 03:09:13 -0700 (PDT)
Received: from zen.linaroharston ([81.128.185.34])
 by smtp.gmail.com with ESMTPSA id b8sm3000108wmh.46.2019.07.09.03.09.12
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 09 Jul 2019 03:09:12 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 613971FF87;
 Tue,  9 Jul 2019 11:09:12 +0100 (BST)
References: <20190709092049.13771-1-richard.henderson@linaro.org>
 <20190709092049.13771-4-richard.henderson@linaro.org>
User-agent: mu4e 1.3.2; emacs 26.1
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
In-reply-to: <20190709092049.13771-4-richard.henderson@linaro.org>
Date: Tue, 09 Jul 2019 11:09:12 +0100
Message-ID: <87y317eczb.fsf@zen.linaroharston>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::443
Subject: Re: [Qemu-devel] [PATCH 3/5] tcg: Remove cpu_ld*_code_ra
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
Cc: lvivier@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> These functions are not used, and are not usable in the
> context of code generation, because we never have a helper
> return address to pass in to them.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--
Alex Benn=C3=A9e

