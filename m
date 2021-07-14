Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B13D3C8747
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 17:23:40 +0200 (CEST)
Received: from localhost ([::1]:37082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3gjb-00087w-9L
	for lists+qemu-devel@lfdr.de; Wed, 14 Jul 2021 11:23:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50924)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1m3gSn-0001n7-8H
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 11:06:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40750)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1m3gSh-0002Yd-Lt
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 11:06:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626275170;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HFpMa/jESk4BgFHv2McqEBboIW5Op2BgaEAn6Vh8PaQ=;
 b=VOseV5roTlW529XQs/yv/wfhAd9FvlTmjThJ0jMt3Cf7cyApAx8ZadV0KcBCm3LQPdZJ0S
 yQbry75Ss1loYsjWSSB7t5ZpjC2QwVQuiFSXxNzPsLOHqc//H2oJ7/FJpwjE7KAdaTpqHN
 9w74gzpiRMXGtsXxoMf8o3UNu1CDEU0=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-160-X4Yk1v8TOMOptIit7taf0w-1; Wed, 14 Jul 2021 11:06:09 -0400
X-MC-Unique: X4Yk1v8TOMOptIit7taf0w-1
Received: by mail-wm1-f69.google.com with SMTP id
 y6-20020a7bc1860000b0290227b53c7cefso908819wmi.1
 for <qemu-devel@nongnu.org>; Wed, 14 Jul 2021 08:06:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=HFpMa/jESk4BgFHv2McqEBboIW5Op2BgaEAn6Vh8PaQ=;
 b=CifEZYyuXa13VS5/ss0jiOWuSR3XVQc9U0cqeixeReK0HRLAcjH/hu9QxPiY6KWPDG
 R2jTZfzulCqaJpEmNP846RjFvz4rEg2YvrywygF1+wmQpuLI4RPYh30p0nE5hygK5imd
 VwXIWEjIzn9ktFpFb476HldCjv8nMv5jtw3ny/W9d9wgRJwbphTOaLeogsf4OOssoZf5
 JOCCEw/cj5V6U2d09Rs6/pP8f8B5yrdFMp9z5SGaR5K7Wt1Cf2PUkXsN6EIZ4Jib5CXT
 wWQYX12u66JMi8bjNu8uhjASLtjH2IFjr0QQMN1EE3w4MZp8svLtWNMmwwi97ks5zXvr
 IWCw==
X-Gm-Message-State: AOAM532vNfywbx2V3UXd8B7pGPb5qDy/PAaqLDGfUkMqEnd+ba/zb6Yr
 TS3QokR7HBBvh2khcMpdN16+oYP5sZ5wnFK69p1yR490K3m5msXzmkkVLCfA8JsHFga5wVfmvXT
 GbgyRIwePsZGnq/6/rZHYBoOeOqz2lKTz8GpslRxWJnAQYwefyBpl5QMRGqjeL+v/ops=
X-Received: by 2002:a05:600c:4fc7:: with SMTP id
 o7mr11583615wmq.16.1626275167859; 
 Wed, 14 Jul 2021 08:06:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxdXxDeceR6h6ZKWZnDx+g/cMCPhpgSlmXHljEXrZUoxowPciG0ZJKb9qq4nt8Mc77hU4SU2g==
X-Received: by 2002:a05:600c:4fc7:: with SMTP id
 o7mr11583567wmq.16.1626275167409; 
 Wed, 14 Jul 2021 08:06:07 -0700 (PDT)
Received: from ?IPv6:2001:b07:add:ec09:c399:bc87:7b6c:fb2a?
 ([2001:b07:add:ec09:c399:bc87:7b6c:fb2a])
 by smtp.gmail.com with ESMTPSA id m6sm3825868wrw.9.2021.07.14.08.06.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Jul 2021 08:06:06 -0700 (PDT)
Subject: Re: [PATCH 0/4] Fixes for the --without-default-features configure
 switch
To: Cole Robinson <crobinso@redhat.com>, Thomas Huth <thuth@redhat.com>,
 qemu-devel@nongnu.org
References: <20210713093155.677589-1-thuth@redhat.com>
 <c7ac9cb5-3a39-a72a-6c4e-06c059a67cd2@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <1a26cd56-172c-4878-5d3a-4112b132f8d5@redhat.com>
Date: Wed, 14 Jul 2021 17:06:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <c7ac9cb5-3a39-a72a-6c4e-06c059a67cd2@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 13/07/21 16:54, Cole Robinson wrote:
> Patches look fine and fix some issues but others persist
> (--disable-system isn't triggered).

I wouldn't say --disable-system counts as a feature, since it's really a 
shortcut for choosing a subset of the targets.  Likewise for linux_user 
and bsd_user.

> IMO this needs an audit, but more
> importantly 'configure' should be rearranged a bit to make this less
> likely to regress:
> 
> * move all the --enable/--disable variable init into one section with
> nothing else mixed in
> 
> * convert the values to all use
> $default_yes/no/auto/enabled/disabled/... variable syntax so visually
> it's consistent, and if a default is ever changed like $default_no ->
> $default_yes then we behave correctly (as opposed to 'no' -> 'yes').

This is a nice idea.  We should only have default_yes/no/auto, plus 
"auto" for Meson options.

Also there's the idea of parsing --enable/--disable options for Meson 
options automatically from the introspection data.  This has the 
advantage that you get the default automatically from meson_options.txt 
and -Dauto_features, without any code in configure.

Paolo


