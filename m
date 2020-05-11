Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AAF261CDD15
	for <lists+qemu-devel@lfdr.de>; Mon, 11 May 2020 16:26:12 +0200 (CEST)
Received: from localhost ([::1]:36534 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jY9Ni-000436-5D
	for lists+qemu-devel@lfdr.de; Mon, 11 May 2020 10:26:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57836)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jY9MH-0002SC-LU
 for qemu-devel@nongnu.org; Mon, 11 May 2020 10:24:41 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:24758
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jY9ME-0000DS-Ts
 for qemu-devel@nongnu.org; Mon, 11 May 2020 10:24:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589207077;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aN8Pu9t+QaXRZUJqFXsydhyvkyWjMzawV1OGGeVJCI0=;
 b=MQxsNL5T/FPvdo2siv2t5JOnYOjKE6KAz517LU3FRJm43fuXBAVp7SJ8Et7eA6VPoonQTv
 lscmh6fAg7cvwJ+L4udvwrU/US2gzgHNMFmfjLSDx/TeXv/R2lDbGXJ7ais74axmyFHj+1
 kkoMbNGGITatJeH+3PItdU2YV7Sw7i4=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-430-4kqUm5zRPoSHJQuTog-t-w-1; Mon, 11 May 2020 10:24:36 -0400
X-MC-Unique: 4kqUm5zRPoSHJQuTog-t-w-1
Received: by mail-wm1-f72.google.com with SMTP id w189so4725639wmg.1
 for <qemu-devel@nongnu.org>; Mon, 11 May 2020 07:24:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=aN8Pu9t+QaXRZUJqFXsydhyvkyWjMzawV1OGGeVJCI0=;
 b=jOo+XzqULa3LDJKc8uua7cjbrzsrGko3te/dLN/S/p7gcvO7F5M4nj5cLRMkpo9bHx
 l4U0fH0dcpJSokRQCxyLBm7sGxJ5Np4MbCgkAxP1RHyqHU7IEvShablW9dj5M5Tkl6q1
 ynBbcRsXVqhEy3HdNwi9emXgco2jz2Abn/i6PIT2JygtWQdXYB8baXWaXaIIb0GQBbzI
 Rlg7Kpwbyfkv4iXmbTj+b/VcfgAYFGA0xdL/z0uXyFbhxyQV9LLd95c7UXYynlX8OphZ
 jQwqI05cKLhViDCU5WnXGJlAR+eINfopAnOf7Lvv99uFP1iCk4iWcdn4jUGL7kCLENGe
 O49Q==
X-Gm-Message-State: AGi0PuYnYl09ciVwCLIoeGNviZ8+8hIDsSpMfRhPWaSC/CtHadG/rBR9
 vbgQbZuMMmeB/VFiaj7j/TerK4VVUNwf64ZWs7uZ6odtN/j6CsQ1gIuBGS7lj6FDy9blbeaYsZu
 755AwKZulfgoaYlI=
X-Received: by 2002:adf:97d9:: with SMTP id t25mr10678509wrb.176.1589207074612; 
 Mon, 11 May 2020 07:24:34 -0700 (PDT)
X-Google-Smtp-Source: APiQypIY8qhCWdmbKE1tSvMUG4Itb6sb5Pt/IfOX4Wv8HU7lR/HX4E0G63bhImE+LKUv3JrDoGFKcg==
X-Received: by 2002:adf:97d9:: with SMTP id t25mr10678488wrb.176.1589207074352; 
 Mon, 11 May 2020 07:24:34 -0700 (PDT)
Received: from [192.168.1.38] (17.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.17])
 by smtp.gmail.com with ESMTPSA id h188sm29378176wme.8.2020.05.11.07.24.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 May 2020 07:24:33 -0700 (PDT)
Subject: Re: Qemu, VNC and non-US keymaps
To: B3r3n <B3r3n@argosnet.com>, qemu-discuss@nongnu.org,
 "Daniel P . Berrange" <berrange@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, qemu-devel <qemu-devel@nongnu.org>
References: <E1jY9FF-0000Po-2c@lists.gnu.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <af732fbf-fd70-97bc-3ea8-25d66f5895de@redhat.com>
Date: Mon, 11 May 2020 16:24:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <E1jY9FF-0000Po-2c@lists.gnu.org>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/11 03:10:56
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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

Cc'ing more developers.

On 5/11/20 4:17 PM, B3r3n wrote:
> Dear all,
> 
> I am struggling for days/weeks with Qemu and its VNC accesses...with 
> non-US keymaps.
> 
> Let me summ the facts:
> - I am using a french keyboard over a Ubuntu 18.04.
> - I installed a simple Debian in a Qemu VM, configured with FR keyboard 
> (AZERTY).
> - I am launching the Qemu VM with the '-k fr' keymaping (original)
> - I tested with Qemu 3.1.1, 4.2.0 & 5.0.0.
> 
> I fail to have the AltGr keys, critical to frenches (pipe, backslash, 
> dash etc).
> checking with showkey, I see the keys arriving properly (29+56, 29+100, 
> etc).
> 
> Considering it might be a debian issue as well, I updated the 
> qemu/keymaps/fr file to have bar directly with the 6 key (normally bar 
> is AltGr + 6).
> For an unknown reason, the '6' then no longer works (showkey shows 
> nothing as well).
> 
> There might be something I miss, and the might also be some bug 
> somewhere, or some missings.
> For example, maybe X11 must be installed, even it unused (VNC client 
> connects to Qemu VNC port directly), or whatever.
> 
> Any help appreciated :-)
> 
> Thanks
> 
> Brgrds
> 
> 


