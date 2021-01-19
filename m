Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E28A2FB662
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 14:34:24 +0100 (CET)
Received: from localhost ([::1]:55856 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1r9L-0007Yy-7Q
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 08:34:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51342)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l1r52-0005Bo-Rj
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 08:29:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31270)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l1r50-0001g0-8M
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 08:29:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611062990;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bWDqIMdWMdtVAV7Js14K213ikZUf6Kg1ONzL+2SnUFI=;
 b=KG+IjlLbxgrUkPo692wbwNGR1Vfkybv0e8afcT3BieGSylfgZuYFxwLm+y9lkFXVHGwTvq
 X3obGORHvbkEyAXH3tFKj6RJ1u1RaRtvhl5Epl+NXkfSeLkGDMg8ilt3hQQE3dzOy2ES+o
 U2WJ6Q4q8lKschJShMzejZtdVGssAIE=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-313-zJ1uvRzeOcCQjNWN5zgAqg-1; Tue, 19 Jan 2021 08:29:48 -0500
X-MC-Unique: zJ1uvRzeOcCQjNWN5zgAqg-1
Received: by mail-ed1-f72.google.com with SMTP id y6so7487488edc.17
 for <qemu-devel@nongnu.org>; Tue, 19 Jan 2021 05:29:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=bWDqIMdWMdtVAV7Js14K213ikZUf6Kg1ONzL+2SnUFI=;
 b=iVsvJEYxrCfSoeh3goSfP2wKekir3qjNLzl/MuUD4tttgtkBkQPxUshpaky9kHBNZ9
 dn72HsbGTBfgS49LzzpkbaRskZNmDrVFWwNkLFB0mPvfJuNl1lmJY7laIdrt6DZR1NYx
 DYk7kM38a71i1xMTo1WUFdBfFjr/HimxylZFAnFpbTYRXNhyAxc0xFyyz0zxhYYXho18
 eTTvKlRBlTdCgsvw9s8OnD/T1qLr724/dBZruETJ3854sW/0azh1oY61GQ6J9tkBk9Ph
 4+6hyYxbHhqdMmumR3w/KfyDaHmxNtc6Nr9mo8oeGXRpWw8sRgjKqfknjxKLkEF00I6p
 FkGA==
X-Gm-Message-State: AOAM530RVA36+qFaY9FoPmYu3NHN8HUWydFSBiydqRtlCFBb1WGqlh0k
 KzQmP8X10nVCyjR4hnyrCi8SEHXtIsgsLzfm17OElvKqE+74lU6IJ+S7YQPjZ/EnxhcvOJJi+93
 5wB9vfzf2TvieWos9Ij5W6BcOW3gqbJYKMLPrAWjuyNIII2BHVC6hC96XB595EwQKQrI=
X-Received: by 2002:a17:907:a82:: with SMTP id
 by2mr2996131ejc.200.1611062987409; 
 Tue, 19 Jan 2021 05:29:47 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzdi+7bwKWstPXUoj5+v8BxDydeWf/41qXWH5FTpGFSGH9qD+eoceJ/6F6aL3s/TV9ndjJO4A==
X-Received: by 2002:a17:907:a82:: with SMTP id
 by2mr2996119ejc.200.1611062987238; 
 Tue, 19 Jan 2021 05:29:47 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id u17sm12457364edr.0.2021.01.19.05.29.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Jan 2021 05:29:46 -0800 (PST)
Subject: Re: git://git.qemu.org/qemu.git now pulls from gitlab
To: Bin Meng <bmeng.cn@gmail.com>
References: <93d438bc-4e41-5d97-9759-bfbf455fcf83@redhat.com>
 <CAEUhbmWrp_GfZbH9fUZw_in2FuxD-Azmaoy7ytP87XvU+zpA-g@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <9b6cc15d-f44b-0f32-c5f3-7fc8fcf05695@redhat.com>
Date: Tue, 19 Jan 2021 14:29:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <CAEUhbmWrp_GfZbH9fUZw_in2FuxD-Azmaoy7ytP87XvU+zpA-g@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.195,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 19/01/21 13:25, Bin Meng wrote:
> I see the following error in a previously cloned repo:
> 
> $ git fetch origin
> fatal: remote error: access denied or repository not exported: /qemu.git
> 
> $ git remote -v
> origin  git://git.qemu.org/qemu.git (fetch)
> origin  git://git.qemu.org/qemu.git (push)
> 
> Is this expected?

You were very unlucky, that error lasted the time of a single restorecon 
command. :)


