Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CEB6B694AE4
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 16:18:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRaZq-0003a4-M7; Mon, 13 Feb 2023 10:17:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1pRaZp-0003Z3-2m
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 10:17:09 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1pRaZn-0003tB-Bc
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 10:17:08 -0500
Received: by mail-wr1-x429.google.com with SMTP id o18so12625194wrj.3
 for <qemu-devel@nongnu.org>; Mon, 13 Feb 2023 07:17:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:content-language
 :references:cc:to:subject:reply-to:user-agent:mime-version:date
 :message-id:from:from:to:cc:subject:date:message-id:reply-to;
 bh=bNe8vsSIfQxECl7ypwhbpvF12YH5UwGBOQwXbZY6A/I=;
 b=UXO9rle/Eq+v0KhCblmqq59Yq2O9kbmAvTdgy3Y4Ykx+gEI/++GXdy58p6jrCzgtnB
 v2aGJ82S96SBjKJzHWTBItMUMIdYzHv2XTMUq0DnouGD+wxAFuvTzwAuqlhMa0CQPYDm
 B5pozTRnae+TyF/vBtaSeltdbbMOIomZffdy3+rJeDTLsi+LKWRE6jK+9XAF1S1zgxE2
 SN1tdB8+WjNKjhZzzuRos4G08qfH3Jn0GneTuSFRHOZYzuzAHhHDBWRoRtNJ1AZHjMoU
 hFvZjJ3+2eWyGIcRYb/cghkR7kUnpy/kAFj1lig94AWGLSYILkm032QdWPRu/8nNmNh7
 E98A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:content-language
 :references:cc:to:subject:reply-to:user-agent:mime-version:date
 :message-id:from:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bNe8vsSIfQxECl7ypwhbpvF12YH5UwGBOQwXbZY6A/I=;
 b=cgrzex9lHtuBYQesQ6uP5bcfHS9VQzP4qI0yB1To7Pf06RZeSQwiO5sUj326ITk567
 Ebl7PrCAEJOtVHiKlPCaLFmrlNrFn31v/PuIiUiy6eJGXTgYGN3OVSY6CHtcwGwu5yEy
 kRbPvTAiplNkY0jy7FBMtyeEvCoxLM6jG2IEWNKcskMHgeKkRunDEKtHqyNAq284KXy1
 mX95ro/NDNRRrRpYMv8y+FddeyCf3sRQlGaXEejieF7y8ktWrQVfkZ1v/iMgA4EgCK/G
 qO7uZyVa9BoPiyxl0r17JPNhLUHecVnSl+tKs6RptjM3yGp4BvcvpdUn8Anr9tD+2in1
 Dbbw==
X-Gm-Message-State: AO0yUKX+1BIGkeoE8B8yHRZ1EIB67WVcP8ZKAARR34KjZ4P9gIrFYtbc
 vnjh64TpesbSdJFBKcrwSOI=
X-Google-Smtp-Source: AK7set/x0FCvh8xPmlAd354zyaJTEAsdcI3L3BnMOqF8VyIbasm0SbrtnHTYwocpg64qJoeTiNGR/g==
X-Received: by 2002:adf:b19b:0:b0:2c5:4f45:90b0 with SMTP id
 q27-20020adfb19b000000b002c54f4590b0mr5013216wra.3.1676301423602; 
 Mon, 13 Feb 2023 07:17:03 -0800 (PST)
Received: from [192.168.12.67] (54-240-197-231.amazon.com. [54.240.197.231])
 by smtp.gmail.com with ESMTPSA id
 g17-20020a056000119100b002c54e26bca5sm6295693wrx.49.2023.02.13.07.17.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Feb 2023 07:17:03 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <01d6eae0-e127-66bf-b0c3-54a2dc58adc3@xen.org>
Date: Mon, 13 Feb 2023 15:17:01 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v10 42/59] kvm/i386: Add xen-gnttab-max-frames property
To: David Woodhouse <dwmw2@infradead.org>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Joao Martins <joao.m.martins@oracle.com>,
 Ankur Arora <ankur.a.arora@oracle.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Claudio Fontana <cfontana@suse.de>, Julien Grall <julien@xen.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, armbru@redhat.com
References: <20230201143148.1744093-1-dwmw2@infradead.org>
 <20230201143148.1744093-43-dwmw2@infradead.org>
Content-Language: en-US
Organization: Xen Project
In-Reply-To: <20230201143148.1744093-43-dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=xadimgnik@gmail.com; helo=mail-wr1-x429.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.345, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On 01/02/2023 14:31, David Woodhouse wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
> 
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> ---
>   accel/kvm/kvm-all.c       |  1 +
>   include/sysemu/kvm_int.h  |  1 +
>   include/sysemu/kvm_xen.h  |  1 +
>   target/i386/kvm/kvm.c     | 34 ++++++++++++++++++++++++++++++++++
>   target/i386/kvm/xen-emu.c |  6 ++++++
>   5 files changed, 43 insertions(+)
> 

Reviewed-by: Paul Durrant <paul@xen.org>


