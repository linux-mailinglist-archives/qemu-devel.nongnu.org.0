Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 96F4C586656
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Aug 2022 10:27:49 +0200 (CEST)
Received: from localhost ([::1]:36432 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oIQm4-0002ik-HX
	for lists+qemu-devel@lfdr.de; Mon, 01 Aug 2022 04:27:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56530)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oIQjb-0001Ji-Dm
 for qemu-devel@nongnu.org; Mon, 01 Aug 2022 04:25:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:27966)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oIQjX-0000cf-EQ
 for qemu-devel@nongnu.org; Mon, 01 Aug 2022 04:25:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659342302;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=G+jBZ0arHAh/SAXCKFBk5jHtgchVu45WDaDiLUlaUoY=;
 b=dKqj8+Qr5Ghv4U2KzEyrVdmF2wJDJkiQIbaJwR6rTaQWKCRfmWLwQw2cf4/fXHCTAmrr41
 DghfL5ZSIDOoqxvmEAqInM8FiIAFKuIHwTPwLPdioTzoHVhzjFd/68FYDKuQ3MD8L+5CN+
 dR0v/cVq5EInUVr5+9hJdw57lrKAYSM=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-282-hrDbm-dDPlmOAsjBBCsptQ-1; Mon, 01 Aug 2022 04:24:13 -0400
X-MC-Unique: hrDbm-dDPlmOAsjBBCsptQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 v11-20020a1cf70b000000b003a318238826so1397772wmh.2
 for <qemu-devel@nongnu.org>; Mon, 01 Aug 2022 01:24:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=G+jBZ0arHAh/SAXCKFBk5jHtgchVu45WDaDiLUlaUoY=;
 b=gL1Jl3JnlG+YL9BWttC+JxMEz5PrNEyEUJWayXodCeYfgJJPB7d96qEIVSusM1zzp/
 gmdFJpbFjIoo2NO+IE9OqqGVM+DWfv5SAA8m97YOGajSIwrwn+/RV1+1gf1HT/TgDNKZ
 Ed6zhQd5pY69TlOHe5DCxp9MIir0hgucuFeE4wSctz8UYR3ghAjDYwVVKGZbrQHNyq+S
 vgzzGsGyG0ZPfqU94cq0GssvgwO7UA4Uy+Gu9/3Y+9NzJI/7DOYn3zHDz1j+waGmLgpP
 w45lKUClyalmuYDX0+hpVjE0Q9+6uxm+0js7slVY2p/Mzm+mIEj5xD770fnb8FQs/aDf
 P2SQ==
X-Gm-Message-State: AJIora+ObsNqJ5DpGVwVzV8GLjk7k50ndntjquEJ4fNlPB8v2oE8KD83
 oIYy7N2xrTrEXEOSnrhjoqfm4YUFcwkhF3Vo1kLZ+MIqwKN1aI/6ns7wfbCJgNNtlUm5Dj2h9HL
 X+voSubHh+VIyg7c=
X-Received: by 2002:a05:600c:4113:b0:3a3:4b67:d086 with SMTP id
 j19-20020a05600c411300b003a34b67d086mr10309892wmi.20.1659342252829; 
 Mon, 01 Aug 2022 01:24:12 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1s9fP8apxbq9Sl/LIluSY2kIw7uIGvWzz6noSookj88XcO3lCguzen+1leR9jdU6VLtGQrQEA==
X-Received: by 2002:a05:600c:4113:b0:3a3:4b67:d086 with SMTP id
 j19-20020a05600c411300b003a34b67d086mr10309873wmi.20.1659342252566; 
 Mon, 01 Aug 2022 01:24:12 -0700 (PDT)
Received: from [192.168.8.104] (tmo-096-80.customers.d1-online.com.
 [80.187.96.80]) by smtp.gmail.com with ESMTPSA id
 o26-20020adf8b9a000000b0021f87e8945asm6869145wra.12.2022.08.01.01.24.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Aug 2022 01:24:12 -0700 (PDT)
Message-ID: <be188f5b-6e05-79b2-34fc-b220c0dea779@redhat.com>
Date: Mon, 1 Aug 2022 10:24:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3 0/2] migration-test: Allow test to run without uffd
Content-Language: en-US
To: Peter Xu <peterx@redhat.com>, qemu-devel@nongnu.org
Cc: "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>
References: <20220728133516.92061-1-peterx@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220728133516.92061-1-peterx@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_SORBS_WEB=1.5,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 28/07/2022 15.35, Peter Xu wrote:
> v2:
> - Fix warning in patch 1 [Thomas]
> - Collected R-b for Daniel
> 
> Compare to v1, this added a new patch as reported by Thomas to (hopefully)
> allow auto-converge test to pass on some MacOS testbeds.
> 
> Please review, thanks.
> 
> Peter Xu (2):
>    migration-test: Use migrate_ensure_converge() for auto-converge
>    migration-test: Allow test to run without uffd
> 
>   tests/qtest/migration-test.c | 67 +++++++++++++++---------------------
>   1 file changed, 27 insertions(+), 40 deletions(-)

Thanks, I've queued this to my testing-next branch now:

  https://gitlab.com/thuth/qemu/-/commits/testing-next/

  Thomas



