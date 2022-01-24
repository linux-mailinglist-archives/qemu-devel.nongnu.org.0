Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 436DB497CDC
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Jan 2022 11:19:20 +0100 (CET)
Received: from localhost ([::1]:41620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nBwRT-00042D-2x
	for lists+qemu-devel@lfdr.de; Mon, 24 Jan 2022 05:19:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42746)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nBwO1-0001tg-3b
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 05:15:45 -0500
Received: from [2a00:1450:4864:20::534] (port=43824
 helo=mail-ed1-x534.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nBwNz-0006Gm-CA
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 05:15:44 -0500
Received: by mail-ed1-x534.google.com with SMTP id w14so2732187edd.10
 for <qemu-devel@nongnu.org>; Mon, 24 Jan 2022 02:15:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=yhzjjajCU6FHgqNrUEWirwMRDCoy1VTya0yDGOaqpVc=;
 b=GLmX3iL/TBqhTk1GTR16U9jSOyaLq97M3S8BpehUIekcp+UMrsdkjpzVJbL/vSCWdo
 KDNEsONwQTN/USU2A9nWiMmSncNOVB4iHdsT2/fRBxZ6h/GI9+uiWEWbHfv/fLXHN3Rv
 IPrmDaI5TW4v9P+wV1x8OWhPCuU6BiXcaWASQstpJ0HjFkPhO/Cz06To6geUFctpDe0T
 EL/EQvur5dNQwKhz0i+Oc+5qERn1vFuJUKN7yy/UWGd0016+hjZHzIj8FKqRZDzl5OlL
 ILS4A3REcEPStBF+8ucUamdR+onCRCi4I2DNZPqMPTt9sE2lrS5rt76bO7H0+NmbP88n
 Fmyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=yhzjjajCU6FHgqNrUEWirwMRDCoy1VTya0yDGOaqpVc=;
 b=Uud7Fz8qHFNVOdfteELzo4J/wnYntdLjwB74QZvVgonzTCDFA9oqgDMIDPIN/PmnS5
 V8NDo5A03C+zXbbULzisJxuB+D52rb4T2ZqCZ9XTj2ypWduPMfLM0fe9o3mdV/klDB/O
 v+n34paEXmaYabct1jLN/+EDvoFaWZYZOLuQ5DrajpyiFNujIi4GoblNmwhWHNgpZ/p8
 csN3LjNfAfbgNQX7mU4Sl6mUq/07zoYhNnL0lc5H+zK2LYeahc6v09t7ta8qQpsbULzE
 ET0CIH0oQ4DQzfDrYaiA0h1HqwHc0tW3CaoDvfl5McpdnEGL2Xx479mI1Yf/D6HGiDyJ
 FxUA==
X-Gm-Message-State: AOAM533ssOYKqAmL37zXBuco2nmKK8X15mxQ+6sxKeUdAg9KwcYnWRAO
 2p7HKaUtEuK4a4kBIEyX0bw=
X-Google-Smtp-Source: ABdhPJxyG1bFxtejjc/sYVpdqAUnHBwv1WTjUb17oSsrT2qarIyvEBmmp3RXWH70EA/wRO3Yewc5Lw==
X-Received: by 2002:a50:cc47:: with SMTP id n7mr15432684edi.12.1643019326795; 
 Mon, 24 Jan 2022 02:15:26 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id a17sm6296642edt.19.2022.01.24.02.15.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Jan 2022 02:15:26 -0800 (PST)
Message-ID: <e4ee8710-acdb-62ad-0273-f7ad44ac0c5c@redhat.com>
Date: Mon, 24 Jan 2022 11:15:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH 6/7] x86: add support for KVM_CAP_XSAVE2 and AMX state
 migration
Content-Language: en-US
To: Yang Zhong <yang.zhong@intel.com>, qemu-devel@nongnu.org
References: <20220124075523.108875-1-yang.zhong@intel.com>
 <20220124075523.108875-7-yang.zhong@intel.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20220124075523.108875-7-yang.zhong@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::534
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x534.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: seanjc@google.com, kevin.tian@intel.com, jing2.liu@linux.intel.com,
 wei.w.wang@intel.com, guang.zeng@intel.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/24/22 08:55, Yang Zhong wrote:
> 
> +    if (buflen > sizeof(struct kvm_xsave)) {
> +        e = &x86_ext_save_areas[XSTATE_XTILE_DATA_BIT];
> +
> +        if (e->size && e->offset) {
> +            const XSaveXTILEDATA *tiledata = buf + e->offset;
> +
> +            memcpy(&env->xtiledata, tiledata, sizeof(env->xtiledata));
> +        }
> +    }

Slightly nicer:

     e = &x86_ext_save_areas[XSTATE_XTILE_DATA_BIT];
     if (e->size && e->offset && buflen >= e->size + e->offset) {
         ...
     }

Same for xsave.

Paolo

