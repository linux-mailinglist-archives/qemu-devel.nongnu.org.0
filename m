Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1995D387631
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 12:11:51 +0200 (CEST)
Received: from localhost ([::1]:44418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liwha-00053O-4m
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 06:11:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41296)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1liwXz-0008NM-Jw
 for qemu-devel@nongnu.org; Tue, 18 May 2021 06:01:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59831)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1liwXx-0003tu-ST
 for qemu-devel@nongnu.org; Tue, 18 May 2021 06:01:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621332112;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EnKv1A27WTOiQ/rEqx2uO/s33W8+/+Cwn/kWGD/2lws=;
 b=VC1zhT2xtMMIbs99m/3DTfIbfHeK5lTciBd23AFE67LEvrogNetZtmR86dCIUi+wvZLwY6
 6dT0CwdqE+gHDKV2xoR/QXP+jjXu3DP+jqCzIA/fuj6D8FDxgKjrDNUr+axG4AwMwOwSNf
 A6xHsotU78XWIa2+5EVux05pWN1l7sU=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-162-Gamz0_GBPjOumU_GUdEjYw-1; Tue, 18 May 2021 06:01:51 -0400
X-MC-Unique: Gamz0_GBPjOumU_GUdEjYw-1
Received: by mail-ed1-f69.google.com with SMTP id
 i19-20020a05640242d3b0290388cea34ed3so5452547edc.15
 for <qemu-devel@nongnu.org>; Tue, 18 May 2021 03:01:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=EnKv1A27WTOiQ/rEqx2uO/s33W8+/+Cwn/kWGD/2lws=;
 b=kfTDWnTlYoN9Co1779ZFWgvJgXe68LH/kFi7gMNumFs97hW1z9Yl/FIHVQ8VcjGtNf
 ctf9DnFlxiHabg8c3vP0RwBn38f2lpkau5KHik7kHVEloRcNFCBgwTWGPl1Du9eqzSbE
 kEb4IFKCcgvLHtmtrDI1FU9HTjL7JEtAl1QCQGmD7nfdddxsgn+PQEKjyu+YRbXJgIjt
 7ypJ84zn7CH7F7duWMAGq4cuONd7zRdUB4bJSMN0QRyGE5qT46fSnFypArdBBletvyJx
 C/4nVTz9qUpCB3siv8KxFlJvUbXcqTaL4kP5JYpre5GcS/tGCiheVNkdP3USe5/I5Npv
 eYxQ==
X-Gm-Message-State: AOAM530mG5RzxOUpXrlrEGrI93KvwYOFqWHD3KNlvuCV61GcpPkx/0Q7
 Q8M6ZipL25/LM7lEkd0YJstesYyYNf3/nuzn8h4BrzUJtk03ptuLk7Q437tgH3MZE/w32ld9H3t
 5Do7gyAERruxE1RM=
X-Received: by 2002:a05:6402:cb0:: with SMTP id
 cn16mr5943588edb.15.1621332109921; 
 Tue, 18 May 2021 03:01:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzrH+8iCa7fXyf3RDL7aMhAdAn9OD8W7ylnl8vopCUFMyt9i5/2zl2SFG2oLf1wlDrCecn7Ug==
X-Received: by 2002:a05:6402:cb0:: with SMTP id
 cn16mr5943570edb.15.1621332109806; 
 Tue, 18 May 2021 03:01:49 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id p4sm10058114ejr.81.2021.05.18.03.01.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 May 2021 03:01:49 -0700 (PDT)
Subject: Re: [PATCH v2 44/50] target/i386: Eliminate user stubs for
 read/write_crN, rd/wrmsr
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210514151342.384376-1-richard.henderson@linaro.org>
 <20210514151342.384376-45-richard.henderson@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <29d5c9a5-e6f0-ac7d-40c6-33b974acf151@redhat.com>
Date: Tue, 18 May 2021 12:01:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210514151342.384376-45-richard.henderson@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: cfontana@suse.de, f4bug@amsat.org, ehabkost@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 14/05/21 17:13, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/i386/helper.h              |  8 ++++----
>   target/i386/tcg/translate.c       |  4 ++++
>   target/i386/tcg/user/misc_stubs.c | 20 --------------------
>   3 files changed, 8 insertions(+), 24 deletions(-)

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>


