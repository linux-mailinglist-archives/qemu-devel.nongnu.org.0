Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 13D9537A862
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 16:03:59 +0200 (CEST)
Received: from localhost ([::1]:35094 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgSzO-0000e5-5s
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 10:03:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38966)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lgSxL-0007Fd-KD
 for qemu-devel@nongnu.org; Tue, 11 May 2021 10:01:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52718)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lgSxJ-00050Z-0d
 for qemu-devel@nongnu.org; Tue, 11 May 2021 10:01:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620741708;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uHzW8EUEZpp8bx+Uo1vzLAca/xyRXmblGZTZwBylu28=;
 b=FNEPUjp3Za1oajXBgvVpFH2v3oGIFXE4KATGFkRfw0+JjHPhwAXe4nSztZf23lUayOdN0N
 taBr0DROC+vQ8OmPn9MrP0kHU83Qny5rQFz4xXWnisfHD9gnw2iJH45KKgWEZoXxVyGS1R
 RNk65E5aiqo63OdDPnaeGEwGSddjwU4=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-394-tdqcjjeDM5eA5uFg67F02A-1; Tue, 11 May 2021 10:01:46 -0400
X-MC-Unique: tdqcjjeDM5eA5uFg67F02A-1
Received: by mail-wm1-f70.google.com with SMTP id
 j128-20020a1c55860000b02901384b712094so1104077wmb.2
 for <qemu-devel@nongnu.org>; Tue, 11 May 2021 07:01:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=uHzW8EUEZpp8bx+Uo1vzLAca/xyRXmblGZTZwBylu28=;
 b=FAxzFN8lX5CQosMUwmTnGQ832e3GbTAR2Qcd2LeOPe0XA7WgqwGJH6hVqmPPIut6cY
 WmMzkWhn2UyGojc7cYYXU+1AeBedlAqbpPH2hZ1mrYp2oXyWRwhirjm4M84AQ4aylbKJ
 ry7y+zKC5xqUOVuArJ/tSt7qmNHY94vl3Wp5RYyb9t7vTV/QU1xNqgoQ3wVvhAz6owiH
 6tdZcsbnmaQ7kmNY6rTjgc+zoblM11qkkVTZFccNX6KGtrVzlKFxoB9BiQPbVKsPOALP
 BQ87576QzrG73ZeI1RyGH3JwbLrDi0JhnPKRX5bZO3Wtq13/JYVFd3fpyVw6ZR3m+WSr
 xrtA==
X-Gm-Message-State: AOAM532iwpJum0ueBz9rfM3M44cHNNfdLEKQbyFGP3SmHSCgYyk0trmF
 Pvm0UdlI1h8X2pkUnxCImUUMgJzAUITPZsl501buA2yWBdfNJmklvAgAdgUKitQFbBAOAon11G8
 NjohzMJTy3Lzhrbg=
X-Received: by 2002:adf:8046:: with SMTP id 64mr37489928wrk.176.1620741705358; 
 Tue, 11 May 2021 07:01:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJweDklywb1Gh0kKrH13FGI6fWJgBPd+WVb7gsEkN4LvaobfThFVIyI4HwB6BS8AqfqaY4ih7A==
X-Received: by 2002:adf:8046:: with SMTP id 64mr37489895wrk.176.1620741705200; 
 Tue, 11 May 2021 07:01:45 -0700 (PDT)
Received: from thuth.remote.csb (pd9e835ac.dip0.t-ipconnect.de.
 [217.232.53.172])
 by smtp.gmail.com with ESMTPSA id c15sm12266200wrd.49.2021.05.11.07.01.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 May 2021 07:01:44 -0700 (PDT)
Subject: Re: [PATCH 03/12] crypto: bump min nettle to 3.3, dropping RHEL-7
 support
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
References: <20210511132641.1022161-1-berrange@redhat.com>
 <20210511132641.1022161-4-berrange@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <87dede9b-fa88-23f4-cc8b-4d695d405f31@redhat.com>
Date: Tue, 11 May 2021 16:01:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210511132641.1022161-4-berrange@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
Cc: Willian Rampazzo <willianr@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/05/2021 15.26, Daniel P. Berrangé wrote:
> It has been over two years since RHEL-8 was released, and thus per the
> platform build policy, we no longer need to support RHEL-7 as a build
> target. This lets us increment the minimum required nettle version and
> drop a lot of backwards compatibility code for 2.x series of nettle.
> 
> Per repology, current shipping versions are:
> 
>               RHEL-8: 3.4.1
>       Debian Stretch: 3.3
>        Debian Buster: 3.4.1
>   openSUSE Leap 15.2: 3.4.1
>     Ubuntu LTS 18.04: 3.4
>     Ubuntu LTS 20.04: 3.5.1
>              FreeBSD: 3.7.2
>            Fedora 33: 3.5.1
>            Fedora 34: 3.7.2
>              OpenBSD: 3.7.2
>       macOS HomeBrew: 3.7.2
> 
> Debian Stretch has the oldest version and so 3.3 is the new minimum.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>

Reviewed-by: Thomas Huth <thuth@redhat.com>


