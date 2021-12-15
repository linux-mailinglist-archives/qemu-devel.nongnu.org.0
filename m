Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A69C4758DE
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 13:30:39 +0100 (CET)
Received: from localhost ([::1]:34902 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxTQc-0004ug-El
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 07:30:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39478)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mxTAk-0003kD-AY; Wed, 15 Dec 2021 07:14:14 -0500
Received: from [2a00:1450:4864:20::430] (port=42683
 helo=mail-wr1-x430.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mxTAh-0008Mq-LS; Wed, 15 Dec 2021 07:14:12 -0500
Received: by mail-wr1-x430.google.com with SMTP id c4so37819035wrd.9;
 Wed, 15 Dec 2021 04:14:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=/IvLzldl/9I0VzsA4E0OQR4g40fS6hEazyAAnmnCRqI=;
 b=H65ookVM89a62A/GErbDFau3DSZCUYZiV6h7n3Zda3bqSCb4BATqBPmHpa3P2s1uXw
 jbOeICj17nl6zI6Wd+OkqMsO1Th+UTMy+8ddWnWVjTUwozV7dliS3VZlgTd8WR+Rqd7k
 KgL8QUB+3Oi0gWn1wounRC0knaxlrDmCR8LvBlkWcBr84apC6wez4ZtF1tBhti84DHcu
 JitSI57TpP80fiJ0bNySiPsgl19Sxtic9sf8jZUhZlVwMbqVxdVJkDVaVMCN1CCppK5Q
 X5ZaBu0dKl0vhGtKyivq7dEWvYdAwzd2IQIM4i2fclegSys2Ay6/fZoMFs0pSUjvrwqy
 YNCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=/IvLzldl/9I0VzsA4E0OQR4g40fS6hEazyAAnmnCRqI=;
 b=rnA3m0NBao1krF4KcRDNrRJXGOETwUKfdXXFOuTCsE1/WyXUQ5zIgD3R+01l6EagrR
 8PuCIUBck/m8LscerRl302DZT13WlvuXydcgDDITpQbO5dfKnAJhUtZo/zqMS2abD5my
 9rKdSr3EVK+LqVA0OplGoBeeqlS25qitfqQ6OajneEnxRH/mSWP15xl4ddd4S2Gh2bxx
 cPNrvR5TzAIJzrundjoyMNkbwhwJ2P1OOm70LqmJ4FFW6ywrDwQ62BkdmskUH8plJqcN
 enSzgjE60Xl2VT8uPw1QHI2PPH+oIyPCrJzUcskmXWBOuTiYjuoLlbRoIaiOFZXafokh
 tfVw==
X-Gm-Message-State: AOAM531bQG902ffw7dO0d84wLNltgSOXwz4sjkRmtImf2/X9haLtQbNe
 une3hyRiZyO0+yUi9OJaaLI=
X-Google-Smtp-Source: ABdhPJxgWaubv7V+augDHRHAcJmnyRo2qm4pmsp6WA45/x+wbx3XGGIxXtNp5EGaQPTcWHEbDGtRZg==
X-Received: by 2002:adf:f489:: with SMTP id l9mr4111054wro.268.1639570449903; 
 Wed, 15 Dec 2021 04:14:09 -0800 (PST)
Received: from [192.168.1.36] (174.red-83-50-185.dynamicip.rima-tde.net.
 [83.50.185.174])
 by smtp.gmail.com with ESMTPSA id q24sm4616586wmj.21.2021.12.15.04.14.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Dec 2021 04:14:09 -0800 (PST)
Message-ID: <5c3931ca-e2dc-f5f2-cc16-ebcd8af81589@amsat.org>
Date: Wed, 15 Dec 2021 13:14:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH] linux-user: Remove the deprecated ppc64abi32 target
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20211215084958.185214-1-thuth@redhat.com>
 <fb033cf6-ab9b-3f85-e95d-0093715de48f@amsat.org> <878rwmgkpw.fsf@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <878rwmgkpw.fsf@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::430
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x430.google.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-1.64,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Cc: Laurent Vivier <laurent@vivier.eu>, Thomas Huth <thuth@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, Greg Kurz <groug@kaod.org>,
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/15/21 12:39, Alex Bennée wrote:
> Philippe Mathieu-Daudé <f4bug@amsat.org> writes:
> 
>> On 12/15/21 09:49, Thomas Huth wrote:
>>> It's likely broken, and nobody cared for picking it up again
>>> during the deprecation phase, so let's remove this now.
>>>
>>> Since this is the last entry in deprecated_targets_list, remove
>>> the related code in the configure script, too.
>>
>> Can we keep that part to keep the gate open to deprecate more
>> targets / features?
> 
> I'm agnostic about it because it is essentially dead code so can
> silently bit-rot. We can always resurrect the code from CI later if we
> need to but I suspect future deprecation should be handled in meson?

OK, fair enough.

> Acked-by: Alex Bennée <alex.bennee@linaro.org>
> 

