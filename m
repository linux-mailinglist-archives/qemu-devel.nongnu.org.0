Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C3EAA3DA941
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Jul 2021 18:41:50 +0200 (CEST)
Received: from localhost ([::1]:46938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m996T-0002d6-SO
	for lists+qemu-devel@lfdr.de; Thu, 29 Jul 2021 12:41:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1m995E-0001u7-Nr
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 12:40:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37974)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1m9959-00079s-NQ
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 12:40:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627576822;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UkWYNpQ0PeHVEliOPSv8w/UwCLFDJ0zSFOD8/QtagzY=;
 b=B4FyBE1Of/RPkCEYbVO5L1ASimcmFTw3RnypKyO3QuGSo77tG6hq4qliBq/afTFbHjTLpb
 N+TYv0JS2iRVfbdoECh+pi5UDb66dTQx/FMFVyCaoGXOpD9hlyBCHICgvXBN+g/NX6BBhs
 o9eo4Ifr66lM6O7LFbmgSFu8K4d8lDw=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-255-gCl7NVh4Nn-TywPnM4LRJA-1; Thu, 29 Jul 2021 12:40:21 -0400
X-MC-Unique: gCl7NVh4Nn-TywPnM4LRJA-1
Received: by mail-wr1-f69.google.com with SMTP id
 c5-20020a5d52850000b0290126f2836a61so2426194wrv.6
 for <qemu-devel@nongnu.org>; Thu, 29 Jul 2021 09:40:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:subject:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=UkWYNpQ0PeHVEliOPSv8w/UwCLFDJ0zSFOD8/QtagzY=;
 b=rDTd1SeHV+CATAiMbUfastcgDSS2SeB9y/2Jidn/L3rpdeKTxnTV/habDVVSYZWzfs
 awwkOqECc4FwxcadIC/1fb1SsfhvJHVrHshD297Un6+GVAov4rh5ymOmuy83OrYKVgXn
 vWCWi7Dxumm8yRcPipkeZuXg40In9b1FD20F3rLDBQqtYdATlcUlZwzK8gIHq7kchELK
 adJ/4Uog6l0POrIp9jT+8ryUFoXnV/KOiHLBqXmLXEhQCNQ8gRanUE0SkqD8tIFb3Z3B
 VDNdnoTeLQhZT6v0ZEStBtie80xF8dZwi8LHaqu3Xqcg/jMzTlxXryaV3KAbvuoMjeb+
 +lNA==
X-Gm-Message-State: AOAM532zvE9cmVKzew5nclV/wYtrcjUbnp9L2vGX/oKmMQZATSD3sKNR
 H8zzfgh/kOc95JeANpF6+AVXtXuzp/yz+2Yr4SWZKSLWW1DXB3+bs5pbq9nnd2Gt3qEN7xGw+vX
 cCqKNKnpU+p2EXfeFrfsnEFvV6icbRVmf9gmni2d4FEOFIXMtAOGbXkHU8jJMHQSVrQw=
X-Received: by 2002:a05:600c:1c09:: with SMTP id
 j9mr10210514wms.183.1627576819692; 
 Thu, 29 Jul 2021 09:40:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzXoFT/nAIKl/mkHmi/yD+ab2JJi9LAHEaxHteAVTJEo8WdyknNzP6vzEwOe62IP6sXsXfr6A==
X-Received: by 2002:a05:600c:1c09:: with SMTP id
 j9mr10210494wms.183.1627576819419; 
 Thu, 29 Jul 2021 09:40:19 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id b15sm3996227wrx.73.2021.07.29.09.40.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Jul 2021 09:40:18 -0700 (PDT)
To: Gerd Hoffmann <kraxel@redhat.com>, Claudio Fontana <cfontana@suse.de>
References: <20210722220952.17444-1-jziviani@suse.de>
 <20210722220952.17444-2-jziviani@suse.de>
 <c26fc6f4-341f-c66f-5384-c811e1342891@suse.de>
 <20210723095231.sfbkhdwdg43nedkk@sirius.home.kraxel.org>
 <4b5c010f-1365-e746-c269-9b9e48771f7b@suse.de>
 <6a3940a4-ca70-343b-5724-0f8f59d6fde4@suse.de>
 <20210723124858.rh63jh2esxahib4e@sirius.home.kraxel.org>
 <20210729091407.n7bdlyw5rsievdch@sirius.home.kraxel.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: modular tcg (was: Re: [PATCH v2 1/1] modules: Improve error
 message when module is not) found
Message-ID: <80e5ceaf-a425-2343-ef2e-d33b6ff87389@redhat.com>
Date: Thu, 29 Jul 2021 18:40:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210729091407.n7bdlyw5rsievdch@sirius.home.kraxel.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.125, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org, richard.henderson@linaro.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 "Jose R. Ziviani" <jziviani@suse.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 29/07/21 11:14, Gerd Hoffmann wrote:
> The common functions could be added TCGCPUOps to allow them being called via
> CPUClass->tcg_ops->$name instead of a direct symbol reference.  Not sure this
> is a good idea though.  Experimental patch covering tcg_exec_realizefn +
> tcg_exec_unrealizefn below.

A lot of these (though probably not all) are already stubbed out as 
"static inline" in include/exec/exec-all.h.  I think they can be changed 
to function pointers in the style of ui/spice-module.c 
(accel/tcg/tcg-module.c?).

> No idea yet how to handle arch-specific bits best.  Seems there is no existing
> infrastructure to untangle target-specific code and tcg, so this probably needs
> something new.

If they are few enough, I would just move them out of target/i386/tcg 
and into target/i386/cpu-sysemu.c.

> Noticed softmmu/physmem.c has lots of CONFIG_TCG #ifdefs, splitting this into
> softmmu/physmem-{common,tcg}.c is probably a good idea.

I only count one, and those function should be easily moved  to 
accel/tcg/cputlb.c (after all both physmem.c and cputlb.c used to be a 
single file, exec.c, so this is just an oversight).


Paolo


