Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F0C2E5C49E
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Jul 2019 22:57:14 +0200 (CEST)
Received: from localhost ([::1]:45446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hi3MO-00062H-JN
	for lists+qemu-devel@lfdr.de; Mon, 01 Jul 2019 16:57:12 -0400
Received: from eggs.gnu.org ([209.51.188.92]:52291)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <alex.bennee@linaro.org>) id 1hhyk9-000254-Sj
 for qemu-devel@nongnu.org; Mon, 01 Jul 2019 12:01:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1hhyk7-0007po-VW
 for qemu-devel@nongnu.org; Mon, 01 Jul 2019 12:01:25 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:45841)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1hhyk6-0007my-4c
 for qemu-devel@nongnu.org; Mon, 01 Jul 2019 12:01:22 -0400
Received: by mail-wr1-f66.google.com with SMTP id f9so14415151wre.12
 for <qemu-devel@nongnu.org>; Mon, 01 Jul 2019 09:01:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version:content-transfer-encoding;
 bh=eWiC6JwpUO66e0AhOuc7SOzs9DzL8V3iUCw7M4ksbSs=;
 b=J305tz6C3izWMrmRbttYOep0ooGUBJOHIAsdFsVquAHtXCZwW41RQgGqRvtqYztbtU
 j/Ijz5QAV8y4IkWfDVHdC/VvOn8sERnwpAZNpAisSIHgRwphT7YlFFfbGePXPIFJfiBa
 La+P1dJG39pr303JKOT4o+7d+a0KST+JfTaSUDBOPDLzjR6+RiatvZGL9qyTzw6FadVT
 JA0qGqhEGwYvIInkuviCfAL16Almion5cbjp+IazdNbL0NuP194lgc3+amO72XHb0JGD
 /g4s2v1Zu+ytE1Vp7DMxoJJjK07pEZFLi89/XSh5tChzs7OA6gnxEl3vDSVCQ8CLsDSP
 s93g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version:content-transfer-encoding;
 bh=eWiC6JwpUO66e0AhOuc7SOzs9DzL8V3iUCw7M4ksbSs=;
 b=gPr15zlgGG9R+2xIgkNP2L4oaPfnTZZdCnCsdDnqJHJceaqL/3s96BlwNR5lLrEHc3
 zj8jrjMrqy5rV1VysPIcZq0BgZlnS6JatHDd/oBPU0Rs0ac+gM0reWdWxM51l49BaDk/
 8v+dwZaaJLFF/Q5dp8/Hv4qnoIazjvpgypZvIT6AfRZXbF2lxcwxDkoJK7RB/NuR/twL
 biOqqpN2cSbU9gk1TTa2r4bmlA58qPuNKQb5tkcn9IA6lf5H8xcT6gEbbYAy7ReHJBmO
 IgQhKMK08NoISwG1KgTKNr5LUwl01QnL9+jdWzDlSH+5sKVwDOgczIg5f3RwkpGnkZkH
 UZEA==
X-Gm-Message-State: APjAAAW94x2CVie1mcQK35mXAJUgFGrPicHit2tlMThvslNc9s4PVpqW
 RqNjq2GlBwrKcAPHiBu/rRjdKw==
X-Google-Smtp-Source: APXvYqwlX7wiMAisAN0V02EmRX0UzTXQ8Kf9Q0GaM0xu1MnWKj0/iwQyLuqlKian+Cv0KtMBl9Fe4g==
X-Received: by 2002:a5d:5386:: with SMTP id d6mr11605336wrv.207.1561996879518; 
 Mon, 01 Jul 2019 09:01:19 -0700 (PDT)
Received: from zen.linaroharston ([81.128.185.34])
 by smtp.gmail.com with ESMTPSA id o126sm24422wmo.1.2019.07.01.09.01.18
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 01 Jul 2019 09:01:18 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 2980F1FF87;
 Mon,  1 Jul 2019 17:01:18 +0100 (BST)
References: <20190614171200.21078-1-alex.bennee@linaro.org>
 <20190614171200.21078-38-alex.bennee@linaro.org>
 <53e14a5c-0689-17d7-2b62-1649398561a9@linaro.org>
User-agent: mu4e 1.3.2; emacs 26.1
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
In-reply-to: <53e14a5c-0689-17d7-2b62-1649398561a9@linaro.org>
Date: Mon, 01 Jul 2019 17:01:18 +0100
Message-ID: <8736jpsq0h.fsf@zen.linaroharston>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.221.66
Subject: Re: [Qemu-devel] [PATCH v3 37/50] translator: inject
 instrumentation from plugins
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, "Emilio G. Cota" <cota@braap.org>,
 qemu-devel@nongnu.org, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> On 6/14/19 10:11 AM, Alex Benn=C3=A9e wrote:
>> @@ -95,6 +103,10 @@ void translator_loop(const TranslatorOps *ops, Disas=
ContextBase *db,
>>              ops->translate_insn(db, cpu);
>>          }
>>
>> +        if (plugin_enabled) {
>> +            plugin_gen_insn_end();
>> +        }
>> +
>>          /* Stop translation if translate_insn so indicated.  */
>>          if (db->is_jmp !=3D DISAS_NEXT) {
>
> This will of course not be reachable if db->is_jmp =3D=3D DISAS_NORETURN.
> Do we want to not bother calling the plugin for this case?

Swap the order and add a comment?

--
Alex Benn=C3=A9e

