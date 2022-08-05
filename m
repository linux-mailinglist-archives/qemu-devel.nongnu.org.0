Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3381058A834
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Aug 2022 10:39:45 +0200 (CEST)
Received: from localhost ([::1]:39596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJsrw-0004KO-AC
	for lists+qemu-devel@lfdr.de; Fri, 05 Aug 2022 04:39:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35046)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oJsVr-0002VT-8e
 for qemu-devel@nongnu.org; Fri, 05 Aug 2022 04:16:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:25742)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oJsVk-0004gC-Qp
 for qemu-devel@nongnu.org; Fri, 05 Aug 2022 04:16:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659687403;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=J1HL7Ep3a1jDfho1cL60H6oF03ReQ9stGcIW14ksC/0=;
 b=Pt4+aBbqfWqii5+xlNGYB0iRo2PIJa10cRM7ic0PDUSDnBUzsw+n4yoglfWRr8/IqQyoFi
 lJoUyNi/AOO5dhl7L49wJFnruI18BTdfCq9b08eV2a2/VKtQqa6bWiMoMrruR1zxUo46u8
 cg6TuWtZVv+24hnevCEkL9xmNX95uDU=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-437-XaMgwkzyPpmWeSOlCQeDHg-1; Fri, 05 Aug 2022 04:16:41 -0400
X-MC-Unique: XaMgwkzyPpmWeSOlCQeDHg-1
Received: by mail-ed1-f70.google.com with SMTP id
 z6-20020a05640240c600b0043e1d52fd98so1145835edb.22
 for <qemu-devel@nongnu.org>; Fri, 05 Aug 2022 01:16:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
 :content-language:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=J1HL7Ep3a1jDfho1cL60H6oF03ReQ9stGcIW14ksC/0=;
 b=P/IoH+jQ7It9TtcT4MvmXKGgv9hGV3JlcmDvaI/HyNkZl3+koql3YDDiEouD26Cv+f
 0P7ZNhV6w7NxNWpGSw027t1DK4VHidWEyWze+IguXhyNey6xXJB/fwGjWOXg6z3HrfZw
 dIqSjSZMs7kpPdKbyRhHCMuauBVCepVa+Ejvo7HsKmrDPxyGnJR59H0Df8NflRi115RQ
 Y527wLSvxtRn+fUCP0V1XWiXay6ZYGVCyTwo8NiltPiAfXgjJL/knUzuNgCl8oRJ2WE1
 oyDkD2pXOzeGii1kSlYjZPm1L3SmBTM0XfXd/4cpajVsX/8uHAL/F05h3bwnqqJ+y6EZ
 5O3A==
X-Gm-Message-State: ACgBeo3ZzYMrFveWF9k0xKKFo5/V713SYsGG+1380WKseKdI9hTasQ8L
 jw+xpgKQaCOtn3IoTpKpyj0tc66Vy9fJ4bKQj3DEBlr1T7Pjpps3Q2erzPG9OvHYVkWntWmmrJ+
 WWWo6PowAknNgkSY=
X-Received: by 2002:a17:907:c0d:b0:730:a85d:8300 with SMTP id
 ga13-20020a1709070c0d00b00730a85d8300mr4484966ejc.558.1659687400479; 
 Fri, 05 Aug 2022 01:16:40 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5xggVnyfdrDNL0s6Heb70nUcChWJ3RWxbUBPXpSV3VS4Y+HsOOTO0G68tsAEnh+gj+Uo+hRw==
X-Received: by 2002:a17:907:c0d:b0:730:a85d:8300 with SMTP id
 ga13-20020a1709070c0d00b00730a85d8300mr4484950ejc.558.1659687400243; 
 Fri, 05 Aug 2022 01:16:40 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:63a7:c72e:ea0e:6045?
 ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.googlemail.com with ESMTPSA id
 b22-20020a1709064d5600b0073075122af2sm1284532ejv.225.2022.08.05.01.16.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Aug 2022 01:16:39 -0700 (PDT)
Message-ID: <9a54556f-9a9e-f9cd-9e77-c46fc781c0f4@redhat.com>
Date: Fri, 5 Aug 2022 10:16:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: qemu-devel@nongnu.org, berrange@redhat.com,
 "Jason A . Donenfeld" <Jason@zx2c4.com>
References: <20220804212441.458478-1-pbonzini@redhat.com>
 <20220805025107-mutt-send-email-mst@kernel.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v2] pc: add property for Linux setup_data random number
 seed
In-Reply-To: <20220805025107-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 8/5/22 09:01, Michael S. Tsirkin wrote:
>> -    if (!legacy_no_rng_seed) {
>> +    if (x86ms->linuxboot_randomness != ON_OFF_AUTO_OFF &&
>> +        (protocol >= 0x209 || x86ms->linuxboot_randomness == ON_OFF_AUTO_ON)) {
> Hmm so if user requested "on" but protocol is too old then we just
> ignore it silently? I'd rather we failed initialization.
> So:
> 
> if (x86ms->linuxboot_randomness == ON_OFF_AUTO_ON &&
>      protocol < 0x209) {
> 	fprintf(stderr, "qemu: Linux kernel too old to load a dtb\n");
> 	exit(1);
> }

It doesn't ignore the "on" setting; it passes the seed anyway even if 
the protocol is too old.  Basically, a kernel that is too old to support 
setup data is treated the same as a kernel that supports setup data but 
doesn't know about the seed datum.

It seemed the more sensible implementation because anyway you cannot 
know if the kernel will use the datum.

Paolo


