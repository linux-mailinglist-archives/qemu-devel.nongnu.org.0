Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E6CF86FB364
	for <lists+qemu-devel@lfdr.de>; Mon,  8 May 2023 17:04:57 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pw2Pd-0008FA-GC; Mon, 08 May 2023 11:04:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1pw2PW-0008Ec-8z
 for qemu-devel@nongnu.org; Mon, 08 May 2023 11:04:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1pw2PU-0006ly-9z
 for qemu-devel@nongnu.org; Mon, 08 May 2023 11:04:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683558258;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mosSgfk0RxWT5FMfDKPccTgr2ayEUJ27bmI9PHvK5Bc=;
 b=SwqleBP5ngCM+EIkAVOYaNwYOqXCfk1ov4FAfsSi63dis1PwNeDh4g86x4+eEgsF6bw9Ow
 zJFYMYlYayNYm/2RK6z/N700v7QHzxKwF26js+Kg+ZAFPUyfF4aVXJoiebGaay95tSGSkp
 LziAwxTHoHD+wF+B1P9O+t8jBJybMGw=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-303-tcZ_eEJ4M92H3YBZ-C_B2w-1; Mon, 08 May 2023 11:04:17 -0400
X-MC-Unique: tcZ_eEJ4M92H3YBZ-C_B2w-1
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-306311a2b99so1814772f8f.1
 for <qemu-devel@nongnu.org>; Mon, 08 May 2023 08:04:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683558255; x=1686150255;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=mosSgfk0RxWT5FMfDKPccTgr2ayEUJ27bmI9PHvK5Bc=;
 b=QZgCQDSUzfaJVgTrrcKQnSkBv4MOZNpwn4Hf70tt1x7dP2VjmfwMGIeBDWpe8u5gBB
 0AKBUUe/GJpCt14Z9LyfIUD32gFA49pXxN8jQ/M8TOmi6oQJ4xqst0OHlmeYL9N9Y6b6
 AAtcA/FbWgZCwJNfpk7gi+JLplR+wqQprcga9Xu4lROhQbUFReq6sWe4Oby2dEb91vKi
 K64R7tu3gyZkoRSGjVhE0NnDjS2/8ljhZzhuUadAYpIlJ/hlS0WkmS/yIspkMBr3DGVg
 u5dP0gSbBxjrMbbG9iJwNQRWYU0XsuLMlm/omJi3h6TptNOmqkY7xl/U8O/UPp2KzvTc
 6ePQ==
X-Gm-Message-State: AC+VfDzKCMDUVaDHmrBqq9PCieF/Nuc0TMLvaRWPGmsdEir5AD9KpZUf
 NmRByrEWJYYk0alX+I73GGK1jLsbp3dZkntEOM9BUJH5krFIoRj3IuuDg3OKw9pdx1d3F/nRCaH
 0PmK7kNUt7jDihk81ZAEXqUkvetoCX+M3G2irqj5bCvahrcQIhyd3R8p079rBaJe1dJPj4CaFDx
 U=
X-Received: by 2002:a5d:560a:0:b0:304:6d32:d589 with SMTP id
 l10-20020a5d560a000000b003046d32d589mr6990070wrv.18.1683558255051; 
 Mon, 08 May 2023 08:04:15 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6athQdRAk7ORErhtMofWbJY4oFkvhjOOJYgQOUz7c/w2U/za6I98Pdx8Y09UTnfFuKkiGqDw==
X-Received: by 2002:a5d:560a:0:b0:304:6d32:d589 with SMTP id
 l10-20020a5d560a000000b003046d32d589mr6990051wrv.18.1683558254707; 
 Mon, 08 May 2023 08:04:14 -0700 (PDT)
Received: from [192.168.149.17]
 (58.254.164.109.static.wline.lns.sme.cust.swisscom.ch. [109.164.254.58])
 by smtp.gmail.com with ESMTPSA id
 k9-20020adfe8c9000000b0030642f5da27sm11556609wrn.37.2023.05.08.08.04.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 May 2023 08:04:14 -0700 (PDT)
Message-ID: <54d6c865-d518-e68c-63d6-0175c715556f@redhat.com>
Date: Mon, 8 May 2023 17:04:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 0/2] target/i386: add support for cpu FLUSH_L1D feature
 and FB_CLEAR capability
Content-Language: de-CH
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Maxim Levitsky <mlevitsk@redhat.com>, Yang Zhong
 <yang.zhong@linux.intel.com>, Vitaly Kuznetsov <vkuznets@redhat.com>,
 Jing Liu <jing2.liu@intel.com>
References: <20230201135759.555607-1-eesposit@redhat.com>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
In-Reply-To: <20230201135759.555607-1-eesposit@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.802, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Ping?

Am 01/02/2023 um 14:57 schrieb Emanuele Giuseppe Esposito:
> QEMU should be able to show the guest the above feature/capability,
> otherwise we risk to have false vulnerability reports in the guest like in
> /sys/devices/system/cpu/vulnerabilities/mmio_stale_data
> because the mitigation is present only if the guest supports
> (FLUSH_L1D and MD_CLEAR) or FB_CLEAR.
> 
> Emanuele
> 
> Emanuele Giuseppe Esposito (2):
>   target/i386: add support for FLUSH_L1D feature
>   target/i386: add support for FB_CLEAR feature
> 
>  target/i386/cpu.h | 3 +++
>  target/i386/cpu.c | 4 ++--
>  2 files changed, 5 insertions(+), 2 deletions(-)
> 


