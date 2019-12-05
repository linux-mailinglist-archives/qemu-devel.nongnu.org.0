Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DE9F113FCA
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Dec 2019 11:58:14 +0100 (CET)
Received: from localhost ([::1]:52918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1icopp-0002pG-EY
	for lists+qemu-devel@lfdr.de; Thu, 05 Dec 2019 05:58:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57552)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1icooL-0001wS-Pc
 for qemu-devel@nongnu.org; Thu, 05 Dec 2019 05:56:42 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1icooK-0002jV-BC
 for qemu-devel@nongnu.org; Thu, 05 Dec 2019 05:56:41 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:36220
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1icooK-0002hD-5P
 for qemu-devel@nongnu.org; Thu, 05 Dec 2019 05:56:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1575543399;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FtpOB6Hu/HSFplWEyYTzLTEbYPIUSVcH8pAnQ/6R3ZE=;
 b=WHOODhTkakqfPcamaNTka8hLdyy2B4+fK4t1X2RkE3mfCX7vaKJnBK/Ms/ZdA0E2eX0hwW
 oeiaICI2ZJLdKd+XBgkR546wDx1PCBB49g0LjiRokqbRlw3k16DXgzl5FFQAr1yNWSdrWB
 lvw8To3eCuFLDLuXvJ/oKkUiZ/uijWw=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-199-SyjcyCC5MZifPwrAyqozag-1; Thu, 05 Dec 2019 05:56:36 -0500
Received: by mail-wr1-f71.google.com with SMTP id c6so1347356wrm.18
 for <qemu-devel@nongnu.org>; Thu, 05 Dec 2019 02:56:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=FtpOB6Hu/HSFplWEyYTzLTEbYPIUSVcH8pAnQ/6R3ZE=;
 b=F8+4MEl2zcKe+LsSWfpu8RHxsdeCeXaN7MYUY3Drv0fB5wdFV24tGNpXC6eT9yD0Tb
 GMI5i3LGWlDMQu+THox19Sp5Nvw0npnM5ktauC1WPeAoR8WBb+sgr18hR8BTlVKRGPh/
 qxNpfZxXUHWpjjSGQhcirG6PHJq/7SneJzUv/B1Vlzxs+HQOgq95a0VhiCG6qYnjzyus
 lXYTdqlW3aL8nNUpaNtRudSGb4f9/Tax026lLiggDAnVII95SOkCuFcdtspS+To1mKCX
 MKtDG5gxAqwgku0683wa35FPqVMTzf4w/1zKywy89wopUJNzoFTSktLlEiB+qXjrJKC0
 gVSA==
X-Gm-Message-State: APjAAAVhDLBHmPMVECO+VTmf1rTE6AKnsq0r/+9e8+9fXH+30ehQuGBV
 9YIVNTzelfvlAfkgErayprXHWEW2tG2q33As71Wi/d6A4qfPOqHE0/vFJ8oYvhC8tWUHRfPrdkh
 YMXp25Q3Lvu3dcys=
X-Received: by 2002:a1c:1f56:: with SMTP id f83mr4668999wmf.93.1575543395470; 
 Thu, 05 Dec 2019 02:56:35 -0800 (PST)
X-Google-Smtp-Source: APXvYqwHmsMxDJGuSVPrQae7u9NmDQYwxiqXmNx/JQLHwLfquHjfGQN7RbsNQpYnmiRf7d0rvFXXCw==
X-Received: by 2002:a1c:1f56:: with SMTP id f83mr4668973wmf.93.1575543395188; 
 Thu, 05 Dec 2019 02:56:35 -0800 (PST)
Received: from [192.168.1.35] (182.red-88-21-103.staticip.rima-tde.net.
 [88.21.103.182])
 by smtp.gmail.com with ESMTPSA id u18sm11780762wrt.26.2019.12.05.02.56.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Dec 2019 02:56:34 -0800 (PST)
Subject: Re: [PATCH] s390x/tcg: clear local interrupts on reset normal
To: Cornelia Huck <cohuck@redhat.com>, Richard Henderson <rth@twiddle.net>,
 David Hildenbrand <david@redhat.com>
References: <20191205103844.10404-1-cohuck@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <9e887988-652d-d325-3524-df5f3de5ce08@redhat.com>
Date: Thu, 5 Dec 2019 11:56:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191205103844.10404-1-cohuck@redhat.com>
Content-Language: en-US
X-MC-Unique: SyjcyCC5MZifPwrAyqozag-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: qemu-s390x@nongnu.org, qemu-devel@nongnu.org,
 Janosch Frank <frankja@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Cornelia,

On 12/5/19 11:38 AM, Cornelia Huck wrote:
> We neglected to clean up pending interrupts and emergency signals;
> fix that.
> 
> Signed-off-by: Cornelia Huck <cohuck@redhat.com>
> ---
> 
> Noted while looking at the fixes for the kvm reset handling.

IIUC we always neglected to clean these fields, but Janosh recent work 
[*] helped you to realize that?

[*] https://www.mail-archive.com/qemu-devel@nongnu.org/msg661541.html

> We now clear some fields twice in the paths for clear or initial reset;
> but (a) we already do that for other fields and (b) it does not really
> hurt. Maybe we should give the cpu structure some love in the future,
> as it's not always clear whether some fields are tcg only.
> 
> ---
>   target/s390x/cpu.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/target/s390x/cpu.c b/target/s390x/cpu.c
> index 829ce6ad5491..f2572961dc3a 100644
> --- a/target/s390x/cpu.c
> +++ b/target/s390x/cpu.c
> @@ -133,6 +133,9 @@ static void s390_cpu_reset(CPUState *s, cpu_reset_type type)
>       case S390_CPU_RESET_NORMAL:
>           env->pfault_token = -1UL;
>           env->bpbc = false;
> +        env->pending_int = 0;
> +        env->external_call_addr = 0;
> +        bitmap_zero(env->emergency_signals, S390_MAX_CPUS);
>           break;
>       default:
>           g_assert_not_reached();
> 


