Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F05E5C67D
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Jul 2019 02:58:57 +0200 (CEST)
Received: from localhost ([::1]:46698 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hi78K-0000Qs-8x
	for lists+qemu-devel@lfdr.de; Mon, 01 Jul 2019 20:58:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35415)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <philmd@redhat.com>) id 1hi3dz-0005JU-5o
 for qemu-devel@nongnu.org; Mon, 01 Jul 2019 17:15:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1hi3dx-0002JV-Tk
 for qemu-devel@nongnu.org; Mon, 01 Jul 2019 17:15:23 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:37111)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1hi3dx-0002Iz-MM
 for qemu-devel@nongnu.org; Mon, 01 Jul 2019 17:15:21 -0400
Received: by mail-wm1-f67.google.com with SMTP id f17so1003025wme.2
 for <qemu-devel@nongnu.org>; Mon, 01 Jul 2019 14:15:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=We7df+jCm3xJqWt3qcPH7ou54aD4XsZ4I7ZDWEgdoPw=;
 b=JLd4zZquz4NsH8B5U3ioelJjp8K3Ooula6N1+yB2kb7BHAOZp9nsfGVJNGt8Umx3cF
 wJMyHQFA+tkrJYF7ZTgXoGUJ3A7QOYOdkgVvYk+Nu0rqu8w65eBOKpFBM7L3g5/yMb6n
 PhaSlRpBz6L39Mkh57v1qifrzWXZ9viAau1lBsrLzn+PEtY1wnYJKyAh6OM2XAaqCtN+
 JPQZb2w4ivujP4jtswZnhxTa8I/dcPy++Yn3A+TPEAcb+kAh9LViAMluG17s9vWSBE64
 ZAPJ+3DZFZIcklYGFE+8bmghwgeV4UOqaAonFU1cLXwvh8G63d1tg9XQqZNjegMbN/C9
 3Tcg==
X-Gm-Message-State: APjAAAVpjfZR7WePq+bizBZkkkgDxG5Gg00hyn5RJiU09q3qLVEzF5GG
 5DzD49+ZtpqYdGi9bVUUXqPpHw==
X-Google-Smtp-Source: APXvYqxNUiYOpDQjPUGtr2/0f+sZw7nHrBHXUh1oDJF2ndwT5kkViaXQqsJogbtvy0t2GR6C1Ld2wQ==
X-Received: by 2002:a7b:c310:: with SMTP id k16mr596354wmj.133.1562015720656; 
 Mon, 01 Jul 2019 14:15:20 -0700 (PDT)
Received: from [192.168.1.103] (183.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.183])
 by smtp.gmail.com with ESMTPSA id h21sm876343wmb.47.2019.07.01.14.15.19
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Mon, 01 Jul 2019 14:15:20 -0700 (PDT)
To: qemu-devel@nongnu.org
References: <156200651295.9862.9762213971590211209@c4a48874b076>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
 url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <d80d2840-51ca-bc24-5e79-ada9f7387553@redhat.com>
Date: Mon, 1 Jul 2019 23:15:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <156200651295.9862.9762213971590211209@c4a48874b076>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.128.67
Subject: Re: [Qemu-devel] [PATCH v3 00/27] Support disabling TCG on ARM
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
Cc: yang.zhong@intel.com, peter.maydell@linaro.org, drjones@redhat.com,
 sameo@linux.intel.com, robert.bradford@intel.com, qemu-arm@nongnu.org,
 pbonzini@redhat.com, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/1/19 8:41 PM, no-reply@patchew.org wrote:
> Patchew URL: https://patchew.org/QEMU/20190701132516.26392-1-philmd@redhat.com/
> 
> This series failed build test on s390x host. Please find the details below.
> 
[...]
> In file included from /var/tmp/patchew-tester-tmp-n6pztn1n/src/hw/intc/armv7m_nvic.c:15:
> ---
>       |                       ^~~~~~~~~~~~
> In file included from /var/tmp/patchew-tester-tmp-n6pztn1n/src/include/hw/intc/armv7m_nvic.h:13,
>                  from /var/tmp/patchew-tester-tmp-n6pztn1n/src/hw/intc/armv7m_nvic.c:18:
> /var/tmp/patchew-tester-tmp-n6pztn1n/src/target/arm/cpu.h:3129:16: error: conflicting types for ‘ArchCPU’
>  3129 | typedef ARMCPU ArchCPU;
>       |                ^~~~~~~
> In file included from /var/tmp/patchew-tester-tmp-n6pztn1n/src/hw/intc/armv7m_nvic.c:15:
> ---
>       |                  ^~~~~~~
> In file included from /var/tmp/patchew-tester-tmp-n6pztn1n/src/include/hw/intc/armv7m_nvic.h:13,
>                  from /var/tmp/patchew-tester-tmp-n6pztn1n/src/hw/intc/armv7m_nvic.c:18:
> /var/tmp/patchew-tester-tmp-n6pztn1n/src/target/arm/cpu.h:3216:6: error: conflicting types for ‘cpu_get_tb_cpu_state’
>  3216 | void cpu_get_tb_cpu_state(CPUARMState *env, target_ulong *pc,
>       |      ^~~~~~~~~~~~~~~~~~~~
> In file included from /var/tmp/patchew-tester-tmp-n6pztn1n/src/hw/intc/armv7m_nvic.c:15:
> ---
> /var/tmp/patchew-tester-tmp-n6pztn1n/src/target/arm/helper.h:67: undefined reference to `helper_v7m_bxns'
> /usr/bin/ld: target/arm/translate.o: in function `gen_helper_v7m_vlstm':
> /var/tmp/patchew-tester-tmp-n6pztn1n/src/target/arm/helper.h:74: undefined reference to `helper_v7m_vlstm'
> collect2: error: ld returned 1 exit status
>   CC      arm-softmmu/hw/arm/vexpress.o
> make[1]: *** [Makefile:205: qemu-system-aarch64] Error 1
> make: *** [Makefile:472: subdir-aarch64-softmmu] Error 2
> ---
> /var/tmp/patchew-tester-tmp-n6pztn1n/src/target/arm/helper.h:67: undefined reference to `helper_v7m_bxns'
> /usr/bin/ld: target/arm/translate.o: in function `gen_helper_v7m_vlstm':
> /var/tmp/patchew-tester-tmp-n6pztn1n/src/target/arm/helper.h:74: undefined reference to `helper_v7m_vlstm'
> collect2: error: ld returned 1 exit status
> make[1]: *** [Makefile:205: qemu-system-arm] Error 1
> make: *** [Makefile:472: subdir-arm-softmmu] Error 2
> === OUTPUT END ===

Expected failure from the RFC patches.

I should have been smarter and split the series in 2, so only the 2nd
(RFC) would fail.

