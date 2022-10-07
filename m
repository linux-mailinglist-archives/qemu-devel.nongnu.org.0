Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 939465F7A89
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Oct 2022 17:29:09 +0200 (CEST)
Received: from localhost ([::1]:50654 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogpHe-0003av-DY
	for lists+qemu-devel@lfdr.de; Fri, 07 Oct 2022 11:29:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54038)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ogney-0000ev-D5
 for qemu-devel@nongnu.org; Fri, 07 Oct 2022 09:45:04 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:41723)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ognew-0006i1-JZ
 for qemu-devel@nongnu.org; Fri, 07 Oct 2022 09:45:04 -0400
Received: by mail-wr1-x42f.google.com with SMTP id bu30so7362057wrb.8
 for <qemu-devel@nongnu.org>; Fri, 07 Oct 2022 06:45:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7qYRJtrJLjzmBVoNiWl95ssE0Z+o9iqE2SKt6mBGqBo=;
 b=G0Suqt5WlWTqC7j28JPiMxWkDGsOf1QCSeGHTtAdZwJoMtEaxBMvuo5qk/ofrqskpp
 ZRlSZIJj6j4Go/4aI9W1oCtbvWILXNVRs31AMQe5BBV2/SSogjkgmvXOPnMrHzHlhYlN
 x/Lnlns+PXBrdHCRIGIPndeuSpa0l70cjFPDwx9DJWNCBBzIFntHhfZ7I8MSUKpGSlQx
 iSVv/etzinToc8rR6G0PNEpqoZiExP8hwOBWL+fjgUYBUBoSjgmF/WQAuXTM7VDs2o6m
 j3NeNVB5BOTEGXh/joiJNnXUkCL2kEhEg9qMpLzhHXG0crKTtV0j3kM1TO4B5Khc1//+
 eXeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=7qYRJtrJLjzmBVoNiWl95ssE0Z+o9iqE2SKt6mBGqBo=;
 b=RS3UFnh/yAlMurIL/ugIFOHZ0+Satm33Zi5e4IE8/b+zFjCQlf8N+/1di6DitSiwZb
 N1cWrpS5PNlwDuD9AS5ZuEHGMx7kAYA7HESuV6/R6lceUgiSz0UxyHL6gN6H7QBuqqS2
 K2U4nS/y9ad0Wo+yyDnknSZPoVlB6TFejbSr1Zb45gAut3t4FK480J78Y4kxd2S2gVQK
 IlpVu4RcaJber8PsyqaoWTf93lw0FPzjrrQ981b2kcM+/f1AuXgNR/7c/nCUWIekRUrH
 z54E9bLKXcSDRgP/q6AqykM+aOGP7VzNf7Tp8SAlS0VEsX2P5o42a789hX/Z66U5RhFb
 6nAQ==
X-Gm-Message-State: ACrzQf2eSRBedrzWWOwMe03OXH63nGEJOHXpmCEEcABjbsoi4sfT2E5J
 0cXf1LNVQfSHSIWz3+aWEONGTSMFQeMa9Q==
X-Google-Smtp-Source: AMsMyM6joDYlXVKXX2gOEVduKmhie1aZcNjSlWqyoQTOYcOlmpKqy68TSMPZMx44gOdyKzOjTEdKBA==
X-Received: by 2002:a5d:58d3:0:b0:22c:e8e4:1461 with SMTP id
 o19-20020a5d58d3000000b0022ce8e41461mr3295413wrf.227.1665150301152; 
 Fri, 07 Oct 2022 06:45:01 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 r11-20020a05600c2c4b00b003bf3fe1d0c4sm2301631wmg.22.2022.10.07.06.45.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Oct 2022 06:45:00 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id D02F61FFB7;
 Fri,  7 Oct 2022 14:44:59 +0100 (BST)
References: <20221005143719.65241-1-victor.colombo@eldorado.org.br>
 <f78ab23d-6cab-9b60-37c4-7486546c6a0e@linaro.org>
User-agent: mu4e 1.9.0; emacs 28.2.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: =?utf-8?Q?V=C3=ADctor?= Colombo <victor.colombo@eldorado.org.br>,
 qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org, clg@kaod.org, danielhb413@gmail.com,
 david@gibson.dropbear.id.au, groug@kaod.org, aurelien@aurel32.net,
 peter.maydell@linaro.org, balaton@eik.bme.hu,
 matheus.ferst@eldorado.org.br, lucas.araujo@eldorado.org.br,
 leandro.lupori@eldorado.org.br, lucas.coutinho@eldorado.org.br
Subject: Re: [RFC PATCH 0/4] Idea for using hardfloat in PPC
Date: Fri, 07 Oct 2022 14:42:55 +0100
In-reply-to: <f78ab23d-6cab-9b60-37c4-7486546c6a0e@linaro.org>
Message-ID: <87a667iw84.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> On 10/5/22 07:37, V=C3=ADctor Colombo wrote:
>> However, the impact in performance was not the expected. In x86_64 I
>> had a small 3% improvement, while in a Power9 machine there was a small
>> performance loss, as can be seem below (100 executions).
>> |        | min [s] | max [s] | avg [s] |
>> | before | 122.309 | 123.459 | 122.747 |
>> | after  | 123.906 | 125.016 | 124.373 |
>
> I hope this is because you didn't handle the most common cases: add, sub,=
 mul, div.
>
> The logic seems plausible, as far as it goes, and would work for the
> FR bit as well which afair isn't handled at all at the moment.  I'll
> review properly in a little while.

I wonder if this is something that could be generalised and pushed up
into the fpu stuff itself. We could after all cache the op and
decomposed parameters here in a generic way. The trick would be working
out how to do that without slowing down the current common case.

Is ppc unique in not persisting the inexact flag from previous
operations?

>
>
> r~


--=20
Alex Benn=C3=A9e

