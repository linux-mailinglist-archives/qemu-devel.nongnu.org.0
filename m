Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7236F302A09
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jan 2021 19:22:30 +0100 (CET)
Received: from localhost ([::1]:46412 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l46VR-00011N-DI
	for lists+qemu-devel@lfdr.de; Mon, 25 Jan 2021 13:22:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <natechancellor@gmail.com>)
 id 1l46SN-0008AL-UO
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 13:19:27 -0500
Received: from mail-qt1-x834.google.com ([2607:f8b0:4864:20::834]:33601)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <natechancellor@gmail.com>)
 id 1l46SK-0000h8-UW
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 13:19:19 -0500
Received: by mail-qt1-x834.google.com with SMTP id z6so10409551qtn.0
 for <qemu-devel@nongnu.org>; Mon, 25 Jan 2021 10:19:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=Dji3zr7fVkZhW1p+dLRrq0vJWk4nRwjn/i3Axi1RQk8=;
 b=ASdE5G237gV39r1fxtbVVbgcJ0Wrtf6LtQdIaX6+DtIPp2wH+GCn6dIVArW9taIPB8
 Mssg9+2wZN1Mc9Y6WTnAL1J5HU2aYl/kbjxj8xzEclODO4FXf+XW5NlZfMbsLY6Ktzwb
 vI5G7D6z/F8bx7YWY1KWV9vwP2pw6eMjCoCYi2oaDeWjg6BB+75znja6bYq5kwEEcti9
 5I49pU0QEh7znaDWos9PgoSrdT3IKrkKKeGl3IyY87WjHhm9fmkLyTg7NI8BhQI103XO
 MEPOzhxnXPn0Gk0o7c8iRQTEkB5ZQJHfhSyGylxmEF3Gv0L5YRUo7O+lVUukCdKKT5wr
 FU0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=Dji3zr7fVkZhW1p+dLRrq0vJWk4nRwjn/i3Axi1RQk8=;
 b=fBcAUdJAFUDPTXl9DorPDr3sf41+r0JiTY0HNDTQYcOc6lI4sRcQc3M+0QnZn6JMHZ
 S3AOp53WSf5KKNharEabJ+wK+wDFQvY8RndVKDUau6np+S4NauUPCz+M9ZO+W7hGFO+P
 M4YOiF4qfwTVbgqxAAQFGG8cg76mN/LvopCNp9dokuvnAGb5VccIrbMGGgZNd3oYTMnz
 zEitlnZLuRWdI3OLs+lXHFK/a8k88DtofuWcRcq2EEO4NpAjSdmIR0YLB7jJWb6Eutf6
 eTHVWfcb6mKC+1fVcVx/DuH0bDpC2uMudqya6DKHZEQScN35Y4JeJCIRUpnhLTwwnW9Z
 kFqw==
X-Gm-Message-State: AOAM530tT5TUmJvILO/wsAdqqIfMOAG/wY4Q8uG9o0xhBeSnmR2vLDa6
 iTg79ufy0r3MSyyhO7bPq0U=
X-Google-Smtp-Source: ABdhPJwWrC1B+K4YXQR8Tu0fEKfq6/37EdEvwV76X1pWMZnr/ZWktQzD46CvKy5f9b75Xn3+oaVwnQ==
X-Received: by 2002:ac8:bc8:: with SMTP id p8mr1707500qti.135.1611598754972;
 Mon, 25 Jan 2021 10:19:14 -0800 (PST)
Received: from ubuntu-m3-large-x86 ([2604:1380:45f1:1d00::1])
 by smtp.gmail.com with ESMTPSA id j27sm11607671qtc.41.2021.01.25.10.19.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Jan 2021 10:19:14 -0800 (PST)
Date: Mon, 25 Jan 2021 11:19:12 -0700
From: Nathan Chancellor <natechancellor@gmail.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [Qemu-devel][PATCH] x86/cpu: Use max host physical address if
 -cpu max option is applied
Message-ID: <20210125181912.GA3779613@ubuntu-m3-large-x86>
References: <20210113090430.26394-1-weijiang.yang@intel.com>
 <20210124210829.GA2238365@ubuntu-m3-large-x86>
 <20210125054150.GA4969@local-michael-cet-test.sh.intel.com>
 <20210125071052.GA307708@ubuntu-m3-large-x86>
 <7a1d69e7-a3e0-e4e8-b09b-3e904466cd97@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7a1d69e7-a3e0-e4e8-b09b-3e904466cd97@redhat.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::834;
 envelope-from=natechancellor@gmail.com; helo=mail-qt1-x834.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Yang Weijiang <weijiang.yang@intel.com>, qemu-devel@nongnu.org,
 seanjc@google.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jan 25, 2021 at 11:42:43AM +0100, Paolo Bonzini wrote:
> On 25/01/21 08:10, Nathan Chancellor wrote:
> > > > This patch as commit 5a140b255d ("x86/cpu: Use max host physical address
> > > > if -cpu max option is applied") prevents me from using '-cpu host' while
> > > > booting an i386_defconfig kernel.
> > > > 
> > > > $ qemu-system-i386 \
> > > > -append console=ttyS0 \
> > > > -cpu host \
> > > > -display none \
> > > > -enable-kvm \
> > > > -initrd rootfs.cpio \
> > > > -kernel bzImage \
> > > > -serial mon:stdio
> > > > qemu-system-i386: phys-bits should be between 32 and 36  (but is 48)
> > > > 
> > > > Am I expected to pass "-cpu host,host-phys-bits=false" now or did this
> > > > do something unexpected?
> 
> Yes, it's setting the LM bit for a 32-bit guest.
> 
> Does this work for you?

Yes, it does!

Tested-by: Nathan Chancellor <natechancellor@gmail.com>

> diff --git a/target/i386/cpu.c b/target/i386/cpu.c
> index 72a79e6019..70df57337f 100644
> --- a/target/i386/cpu.c
> +++ b/target/i386/cpu.c
> @@ -5081,6 +5081,11 @@ static uint64_t
> x86_cpu_get_supported_feature_word(FeatureWord w,
>      } else {
>          return ~0;
>      }
> +#ifdef TARGET_I386
> +    if (wi->cpuid.eax = 0x80000001) {

This should be a '==':

../target/i386/cpu.c: In function ‘x86_cpu_get_supported_feature_word’:
../target/i386/cpu.c:5085:9: error: suggest parentheses around
assignment used as truth value [-Werror=parentheses]
 5085 |     if (wi->cpuid.eax = 0x80000001) {
      |         ^~
cc1: all warnings being treated as errors

> +        r &= ~CPUID_EXT2_LM;
> +    }
> +#endif
>      if (migratable_only) {
>          r &= x86_cpu_get_migratable_flags(w);
>      }
> 
> 
> Paolo
> 
> > > Hi, Nathan,
> > > Could you try Paolo's latest patch?
> > > 
> > > [PULL 03/31] x86/cpu: Use max host physical address if -cpu max option is applied
> > 
> > Hi Yang,
> > 
> > That is the version of the patch I tried, which has been pulled into the
> > master branch.
> > 
> > Cheers,
> > Nathan
> > 
V> 

