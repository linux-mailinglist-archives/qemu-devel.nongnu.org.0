Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE689168638
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Feb 2020 19:16:43 +0100 (CET)
Received: from localhost ([::1]:34758 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j5Cqw-0007ls-Vd
	for lists+qemu-devel@lfdr.de; Fri, 21 Feb 2020 13:16:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47600)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pbonzini@redhat.com>) id 1j5Cpn-0007B2-OI
 for qemu-devel@nongnu.org; Fri, 21 Feb 2020 13:15:33 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pbonzini@redhat.com>) id 1j5Cpm-0001XC-Lx
 for qemu-devel@nongnu.org; Fri, 21 Feb 2020 13:15:31 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:37353
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1j5Cpm-0001Ub-Bv
 for qemu-devel@nongnu.org; Fri, 21 Feb 2020 13:15:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582308929;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3srUmliW9AlMGi/4LAcEMKWwu1twTFDFmKWjMsm2Q8Q=;
 b=QCuDmValxrWucisQO2RCMYCHA0RF18SpFRY2AGgoeH5KVgsPDs8/Ht7CBGgUvJuvxF0LAe
 7AHMJxLzCVCADigrdotGticMhD1GlOVYDQ/B6wPDJnAKzaow+pYKQJnvHAOd4p3x6Y51xl
 GUjUH5oK4NuZBp8EhwCB0Ex2iFo8Szk=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-8-RbtN-GTnPfOEqxrp8cab1Q-1; Fri, 21 Feb 2020 13:15:27 -0500
X-MC-Unique: RbtN-GTnPfOEqxrp8cab1Q-1
Received: by mail-wr1-f69.google.com with SMTP id v17so1352796wrm.17
 for <qemu-devel@nongnu.org>; Fri, 21 Feb 2020 10:15:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=3srUmliW9AlMGi/4LAcEMKWwu1twTFDFmKWjMsm2Q8Q=;
 b=GbEag0zm9IxeR5MyH5hmFFe8hY6bHJJgrbbXkE8gzwU2Lptj236vRJo7OQ1oVr33uJ
 ZWdTSgVbFxQQzM/oG3Vne8gAjwptsGcaqciWRPQ/onbWcPmAH8qVWits3goGxQEGPa/R
 zZGw2UOjP7S2yIXLSF4lv/mIkf9r0UvPp7bS9Sk0jvXBfNx1BEXf5jOVp+E6FiWH1ULA
 ynj4tHF06bvUa1qD46zXJaWS3lUIKQXf2qlEDUAz6mdA/9AbMdcIuebCo8/Zks5lzc5Q
 PDNc3d7St8JljfWkyFo7oCDEgZS89mhYZMVdEoc8VTNMwcmuBNU1WLPASTLBan0BhtIN
 wJAQ==
X-Gm-Message-State: APjAAAXoeOBXcHvMcGmTHeoJbme9UJmlwnUGY5fYclhsx1qorqdNIb1g
 9+BWVd2DLwxsK935YpwwM/dBA6H+rsdNsbl78DvmVvN1AOPSxxB3rqELWwMA837POXmrcUZ7NSu
 4eTFcS4aSwqBKdaY=
X-Received: by 2002:a7b:c4c3:: with SMTP id g3mr4935530wmk.131.1582308926252; 
 Fri, 21 Feb 2020 10:15:26 -0800 (PST)
X-Google-Smtp-Source: APXvYqyhOAUYrNeGkfN5QxyQPqfxJmPYadjw+99i9T2GhNhClK1SEbR+X90rKJm8+B+l7LTodHh+0A==
X-Received: by 2002:a7b:c4c3:: with SMTP id g3mr4935505wmk.131.1582308925933; 
 Fri, 21 Feb 2020 10:15:25 -0800 (PST)
Received: from [192.168.178.40] ([151.20.135.128])
 by smtp.gmail.com with ESMTPSA id w15sm4957300wrs.80.2020.02.21.10.15.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Feb 2020 10:15:25 -0800 (PST)
Subject: Re: [PATCH] hw/char/pl011: Output characters using best-effort mode
To: Peter Maydell <peter.maydell@linaro.org>
References: <20200220060108.143668-1-gshan@redhat.com>
 <f3c8adba729d050ba2144cc9c834fe82@kernel.org>
 <CAFEAcA8inLO75XOcCO3bUiiJQyZT+nqmp1be+z6ZtQx2a=68+g@mail.gmail.com>
 <fda602ae-43d5-728c-a5bb-f607f0acd3df@redhat.com>
 <CAFEAcA-VB1t2XDuAHgq_p2Fz8NQ+3HFgyNOzRjk8BjixNJb0qg@mail.gmail.com>
 <eedbac05-5a17-82e6-3cdc-c3b21983545b@redhat.com>
 <CAFEAcA-bHCLQGkFucY5RAY-mw9wFdDeOqCkcv0xgSRg-EYh9ew@mail.gmail.com>
 <fe7f3a60-5d90-ea3c-44d1-119f8b45b15c@redhat.com>
 <CAFEAcA-1UWOfbvhEOhOvozT8RwGoPgRwn2+Lh-UzP3WH8Vw+Kg@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <1ae86c0b-d4ab-8063-747b-ebea4950e76d@redhat.com>
Date: Fri, 21 Feb 2020 19:15:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-1UWOfbvhEOhOvozT8RwGoPgRwn2+Lh-UzP3WH8Vw+Kg@mail.gmail.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.61
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
Cc: Gavin Shan <gshan@redhat.com>, Marc Zyngier <maz@kernel.org>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@gmail.com>,
 Shan Gavin <shan.gavin@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 21/02/20 14:14, Peter Maydell wrote:
> The initial case reported by Gavin in this thread is
> "-serial tcp:127.0.0.1:50900" with the other end being a program which
> listens on TCP port 50900 and then sleeps without accepting any incoming
> connections, which blocks the serial port output and effectively blocks
> the guest bootup. If you want to insulate the guest from badly
> behaved consumers like that (or the related consumer who accepts
> the connection and then just doesn't read data from it) you probably
> need to deal with more than just POLLHUP. But I'm not sure how much
> we should care about these cases as opposed to just telling users
> not to do that...

No, I think we don't do anything (on purpose; that is, it was considered
the lesser evil) for x86 in that case.

Paolo


