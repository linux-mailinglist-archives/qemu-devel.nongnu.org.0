Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FC42387962
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 14:59:25 +0200 (CEST)
Received: from localhost ([::1]:42728 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lizJk-0006fV-9z
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 08:59:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52802)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1liz9U-00052W-11
 for qemu-devel@nongnu.org; Tue, 18 May 2021 08:48:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37028)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1liz9S-000838-B1
 for qemu-devel@nongnu.org; Tue, 18 May 2021 08:48:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621342125;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6GTJBcI3iONvU60K7cb9e3nPU7V7FAmBQHf0lv/MBaM=;
 b=ACQiY+ArvDWvTR9HMZbmPdT1IWAGP8I/xsEbSBQ62HjryY2C5+4tmsUeWJw/On8IO/z4Ql
 iBg5qY+05KEJebOXrHGxiwL8xBgCqCE0BG8e6CuWhXKTynAiUi5Ntj7/JTFteAXPsk29v6
 3h2l0bBRXUoSDrWwZ7eUd7C6G5OLgoU=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-27-WCgRvaaZOLy5iQaNwdzO9g-1; Tue, 18 May 2021 08:48:41 -0400
X-MC-Unique: WCgRvaaZOLy5iQaNwdzO9g-1
Received: by mail-wr1-f70.google.com with SMTP id
 u20-20020a0560001614b02901115c8f2d89so5479619wrb.3
 for <qemu-devel@nongnu.org>; Tue, 18 May 2021 05:48:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=6GTJBcI3iONvU60K7cb9e3nPU7V7FAmBQHf0lv/MBaM=;
 b=iHy9eAS85+UjIelXe0b1k5bmLjti3l8mBze6zAZ1nWkQ0frvpGvc2tteG+jnX8FOrB
 Wgy13BzpPcf9mtnnbBjeXmB6HQOtyers4Y+s7FJ9giBCmmfCgiVED7VztklQJ5Ayj5Mx
 q6zzohqmpatbxjlriCbmrRFIX8wAyri59cCCEop8FgXGi1XlP+AEIOrzcOCx2nSd046d
 ZOS+Tl9OPfSiHNvCd66ShEW+OBjgEdjabaozZDV7dNsJL8jzsTRPjaAbEXLf8w2oDZOo
 3HMvb4aWHQKAyPOjDQ/67TRM5cra1u6R7DYUhROo6NbThg2yER7qehIUWHRghmWnND2v
 IaHA==
X-Gm-Message-State: AOAM5310oFSM1AaOmwUaxV/8Kk5JXaWtfJ1CBn+LYGj5cF1wIMdm5EEF
 FY7UBgTtUXI6yOgugzLmGkQE6QH3F1mfC4KG2nNWA1J53ywtp/eGVIre+Edn1/o3WZpiSxbsJO3
 cWDh6xB6Fby5l/WmnjMbWKQmrkrtJKlUhkFjXa3hAHZRy8NbIJK0Og4RyHAH3pe++xVQ=
X-Received: by 2002:adf:ea82:: with SMTP id s2mr6737553wrm.397.1621342120552; 
 Tue, 18 May 2021 05:48:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw/Lj+BYHFM6n5RfJR3GcHJP7cG8+jChvN44tfrL4GsjjLtoM44Vzkbaw5zBS1oALgC6jBpdg==
X-Received: by 2002:adf:ea82:: with SMTP id s2mr6737537wrm.397.1621342120342; 
 Tue, 18 May 2021 05:48:40 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id x13sm11330967wro.31.2021.05.18.05.48.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 May 2021 05:48:39 -0700 (PDT)
Subject: Re: [PATCH 2/3] ci: do not use #processors+1 jobs, #processors is
 enough
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20210518084139.97957-1-pbonzini@redhat.com>
 <20210518084139.97957-3-pbonzini@redhat.com>
 <40f9d46b-d234-c029-3ba2-f5dcac8b87fc@redhat.com>
 <7155c55a-1566-d7f0-d59e-ee48707302cf@redhat.com>
 <YKO2ZbDsphiXh/pE@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <885e30da-8d6d-7d58-7733-f66477633e65@redhat.com>
Date: Tue, 18 May 2021 14:48:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YKO2ZbDsphiXh/pE@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
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
Cc: Thomas Huth <thuth@redhat.com>, alex.bennee@linaro.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 18/05/21 14:43, Daniel P. Berrangé wrote:
> I'd be surprised if you can measure any statistically reliable difference
> at all wrt public CI. I've tried measuring CI performance for small changes
> and found it impossible in short time frames, as the deviation between runs
> is way too large. GitLab CI speeds tend to slow down as the day goes on and
> US wakes up, so by time you run QEMU CI a second time in the day, it will
> be slower. They clearly overcommit resources on the cloud host so you're
> at the mercy of whatever else is running.

Yeah, I was going to test it locally (using CPU offlining and hugetlbfs 
to simulate a 4-CPU machine with not that much memory).

Paolo


