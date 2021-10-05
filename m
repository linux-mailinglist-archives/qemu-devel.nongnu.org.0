Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8493A422F7E
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Oct 2021 19:58:22 +0200 (CEST)
Received: from localhost ([::1]:55206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXohp-00060U-Gc
	for lists+qemu-devel@lfdr.de; Tue, 05 Oct 2021 13:58:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51128)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mXn6X-0005ui-58; Tue, 05 Oct 2021 12:15:45 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:33607)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mXn6S-00086P-5P; Tue, 05 Oct 2021 12:15:44 -0400
Received: by mail-wr1-x430.google.com with SMTP id m22so32899035wrb.0;
 Tue, 05 Oct 2021 09:15:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Anz86dZRuWbyavou8a5ZQ+vOWf81urDAW4kE3m7+6Rg=;
 b=Lht99D2MjxOtZRGi3C8dWPmqGxSIBeA7oVV9Gimeh3MWGUCGjVFLPp5CoAoQsUeyTr
 KrbEZygIETa0ffHnAkue6v5LhdRBBQ43ofYELtwsbWqW5khQ77uaCIIVa15n4v7Fqx/8
 DWv079ZdOuzQ9IsjmvByVHRrohDAM35bC7ZeHrX5H60oA6ZbNnXrULwtzpCoAzsGKOAN
 0WjxkWW9xsO/XdGLRfLuaZUQYT6rJMy7q8s5+/d96ZzUMMJH0Avf+ovauumyDoiPdMg+
 sUqmfC95xefU+3CiUbTGSl0I1CxWvtRwkcKu0MsfjpdzYLu6k7LxWRwJ25QKdCR8Ar7J
 7u7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Anz86dZRuWbyavou8a5ZQ+vOWf81urDAW4kE3m7+6Rg=;
 b=T+TRIHaAxH+nPubHrwflMhsojRrc8eIAOXpXLTjmwqTqJ7hMfrAcJwO6bhei9b7F4v
 1paKbpcNeXW2CGaMQVu3QorM7jp7hvo8TyDNFeefggTuHsFGnbALaNEwTXiFrktYBulM
 7EewacsKZOH2l1uJDxRCq05g5epx0ub2Sg5n3baXoB/Qh5TdJK0+SBVXGufohuXfSOr2
 HPtRpOcODuzMbYHGxlQpd6CBPlUtNdaZEjOtb+KNlspUsfoIOU2zvVJ5oalhiNM90ugs
 L+ypNiTn4vtBZa5fg7jb+HMn/b2zRDs70pQ9M3/n82m+DqLb0VWwM6NSB/6W0n1s+6xL
 MtaQ==
X-Gm-Message-State: AOAM530Dr/2iFYGd8D0GURBtg+TyXGeU5eCumKnCScdilTYDllX5sdH/
 m7OSBa7i+CToWqKo8arefsI=
X-Google-Smtp-Source: ABdhPJw9hAVxAtnybX9DidYotpUUghUlcg/h4i4j1guL2FIsIGmIqXx5VQD3LCS2zbKRX9UkIpxJTw==
X-Received: by 2002:a5d:42c2:: with SMTP id t2mr22942782wrr.409.1633450537849; 
 Tue, 05 Oct 2021 09:15:37 -0700 (PDT)
Received: from [192.168.1.36] (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id l11sm3144741wms.45.2021.10.05.09.15.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Oct 2021 09:15:36 -0700 (PDT)
Message-ID: <268ffea6-9a3e-fcba-6722-7d1f24cf5794@amsat.org>
Date: Tue, 5 Oct 2021 18:15:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: Deprecate the ppc405 boards in QEMU? (was: [PATCH v3 4/7]
 MAINTAINERS: Orphan obscure ppc platforms)
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>
References: <20210927044808.73391-5-david@gibson.dropbear.id.au>
 <18fa56ee-956e-ee2f-9270-82aa96dfde09@redhat.com>
 <df767942-be5f-c920-2924-a5221e9db2b3@csgroup.eu>
 <40cdb137-60c9-43fd-7b48-4858cbd9307c@redhat.com>
 <CAFEAcA82L5JiHXUmc0vt7EgiiyrYHyJ+qQ7pFHp+CsvJCPyKqA@mail.gmail.com>
 <6c2ff4e6-4bf4-d310-5e26-c8d2741177bc@redhat.com>
 <42e5a8c2-b8fa-b9e2-71f1-c8e5cd7f5cef@csgroup.eu>
 <1397f18f-f187-6f48-ed6c-13c0b77abed9@redhat.com> <YVug7l8LWl3e+DN5@yekko>
 <9aeb7010-0a17-864a-cfac-ea5d90356085@csgroup.eu>
 <YVwRfETMFxFKuXO1@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <YVwRfETMFxFKuXO1@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x430.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Christophe Leroy <christophe.leroy@c-s.fr>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 dbarboza@redhat.com, Alexey Kardashevskiy <aik@ozlabs.ru>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, Greg Kurz <groug@kaod.org>,
 Alexander Graf <agraf@csgraf.de>, qemu-ppc <qemu-ppc@nongnu.org>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/5/21 10:49, Daniel P. Berrangé wrote:
> On Tue, Oct 05, 2021 at 06:44:23AM +0200, Christophe Leroy wrote:

>> I will look at it, please allow me a few weeks though.
> 
> Once something is deprecated, it remains in QEMU for a minimum of two
> release cycles, before being deleted. At any time in that deprecation
> period it can be returned to supported status, if someone provides a
> good enough justification to keep it.

My understanding is once being in deprecated state for 2 releases, it
can be removed, but it doesn't have to be removed (assuming it is
functional and nobody complains). Am I incorrect?

I am raising this because the nanoMIPS support is in deprecated state
since more than 2 releases, but it is still in-tree and I try to keep
it functional. However, since no toolchain reached mainstream GCC/LLVM
it is not easy to maintain. By keeping it in that state we give some
time to other communities to have their toolchain upstreamed / merged.

> IOW, we can deprecate this now, and you still have plenty of time to
> investigate more.

Yes, almost 8 months :)


