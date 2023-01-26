Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 840E067D385
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Jan 2023 18:51:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pL6NV-0003WY-3Z; Thu, 26 Jan 2023 12:49:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1pL6NM-0003Vy-Cm
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 12:49:29 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1pL6NK-0008Pn-Ot
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 12:49:28 -0500
Received: by mail-wm1-x334.google.com with SMTP id k16so1676053wms.2
 for <qemu-devel@nongnu.org>; Thu, 26 Jan 2023 09:49:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:content-language
 :references:to:subject:reply-to:user-agent:mime-version:date
 :message-id:from:from:to:cc:subject:date:message-id:reply-to;
 bh=OK8D8R+tAQUoFtCWzoU1n8SQdUbAKXNoKJvtArjQYWo=;
 b=fsrSpnrqMY978vETifGGB5jJhFgGa9z1kwcWK6T2nOCu+2w+3q003EfrS2S3nto/9O
 lxe3tYcU8G4mfiFeNDwyeOtZ6IpN6OGNe5mvX2oCYaolr2h2fKwfDb+bxz95DcEGZcgt
 baW9SuyDs+IEAs4Fczqco/bSDXCuXJ9zw8fBxPmw1fsMHyYS/OnDg/d4M0REeUbUPJvJ
 RQv6LwyWhdbAqU2ztQFsLdrlFMGtDLdvlO64WYfr1H45JdhGSnTHa0NWmRYX1GMcLOq5
 lgctRAthj0M2xFVSiOFnZZWIfgJNNw6o+vkIeVJ+9yWcTvOSRYMwMeFWYUlgDljKCXEG
 ExkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:content-language
 :references:to:subject:reply-to:user-agent:mime-version:date
 :message-id:from:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OK8D8R+tAQUoFtCWzoU1n8SQdUbAKXNoKJvtArjQYWo=;
 b=fgNFgx7U4N72Y1GU+gziuVnd8S6PpL0fF22LFQ6KrUlK2NqSdnglM6FG/k+TS3VqcB
 OdGXbzTjWf/Iz7FnUXOtCf1QXYgcC3O6O9hjljahfmUQwADWWiYMf9Md4bzTKrYKSX4B
 P5UeVnnWJr/zKUoXhcYSucaz7136SQwEMMUpVsVdSQDiKmfj2fyDypaffTY7R8Khd/wO
 flPfPDVae0MSaaij/ra7kWo+BaBbHpbRUM8+soKPyV0kBn9sQuUG1oX2fZC2KGcM/E3h
 KFzB1M9HFonp5+IQIwuPxSSJPa7XeXklSPObHIhtQrICdA3UBRWCq7DY5Aj6QCCE5nGU
 A1SA==
X-Gm-Message-State: AFqh2kqNc04zn7m8X7VE9xz59tV/E+1vItRjIllhuriEoAw1cPjXlrAW
 cbD1BQrqGY9BgsTDXbABH8M=
X-Google-Smtp-Source: AMrXdXs5F4OCgvN3uEJ60IUaqKqHzXV14E3jUKorb3s+0tE+r6nmGLv0K7Ivj0ZpjpxRkHHOTPAUPQ==
X-Received: by 2002:a05:600c:3ac8:b0:3da:270b:ba6b with SMTP id
 d8-20020a05600c3ac800b003da270bba6bmr37704210wms.41.1674755364280; 
 Thu, 26 Jan 2023 09:49:24 -0800 (PST)
Received: from [192.168.16.153] (54-240-197-239.amazon.com. [54.240.197.239])
 by smtp.gmail.com with ESMTPSA id
 iz17-20020a05600c555100b003db07420d14sm2065074wmb.39.2023.01.26.09.49.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Jan 2023 09:49:23 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <46ea1f4e-2061-d5f8-2b44-5d24a3a3e7ca@xen.org>
Date: Thu, 26 Jan 2023 17:49:22 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [SeaBIOS PATCH] xen: require Xen info structure at 0x1000 to
 detect Xen
To: David Woodhouse <dwmw2@infradead.org>, seabios <seabios@seabios.org>,
 xen-devel <xen-devel@lists.xenproject.org>,
 qemu-devel <qemu-devel@nongnu.org>
References: <feef99dd2e1a5dce004d22baf07d716d6ea1344c.camel@infradead.org>
Content-Language: en-US
Organization: Xen Project
In-Reply-To: <feef99dd2e1a5dce004d22baf07d716d6ea1344c.camel@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=xadimgnik@gmail.com; helo=mail-wm1-x334.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-1.15, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: paul@xen.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 20/01/2023 11:33, David Woodhouse wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
> 
> When running under Xen, hvmloader places a table at 0x1000 with the e820
> information and BIOS tables. If this isn't present, SeaBIOS will
> currently panic.
> 
> We now have support for running Xen guests natively in QEMU/KVM, which
> boots SeaBIOS directly instead of via hvmloader, and does not provide
> the same structure.
> 
> As it happens, this doesn't matter on first boot. because although we
> set PlatformRunningOn to PF_QEMU|PF_XEN, reading it back again still
> gives zero. Presumably because in true Xen, this is all already RAM. But
> in QEMU with a faithfully-emulated PAM config in the host bridge, it's
> still in ROM mode at this point so we don't see what we've just written.
> 
> On reboot, however, the region *is* set to RAM mode and we do see the
> updated value of PlatformRunningOn, do manage to remember that we've
> detected Xen in CPUID, and hit the panic.
> 
> It's not trivial to detect QEMU vs. real Xen at the time xen_preinit()
> runs, because it's so early. We can't even make a XENVER_extraversion
> hypercall to look for hints, because we haven't set up the hypercall
> page (and don't have an allocator to give us a page in which to do so).
> 
> So just make Xen detection contingent on the info structure being
> present. If it wasn't, we were going to panic anyway. That leaves us
> taking the standard QEMU init path for Xen guests in native QEMU,
> which is just fine.
> 
> Untested on actual Xen but ObviouslyCorrect™.

Works for me...

Tested-by: Paul Durrant <paul@xen.org>

> 
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> ---
>   src/fw/xen.c | 45 ++++++++++++++++++++++++++++++++-------------
>   1 file changed, 32 insertions(+), 13 deletions(-)
> 

Also...

Reviewed-by: Paul Durrant <paul@xen.org>


