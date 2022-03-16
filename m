Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 84CAC4DB357
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Mar 2022 15:33:38 +0100 (CET)
Received: from localhost ([::1]:59656 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUUiX-0001Kn-4r
	for lists+qemu-devel@lfdr.de; Wed, 16 Mar 2022 10:33:37 -0400
Received: from eggs.gnu.org ([209.51.188.92]:55680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nUUbm-0000mB-BC
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 10:26:38 -0400
Received: from [2a00:1450:4864:20::634] (port=38487
 helo=mail-ej1-x634.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nUUbk-0006ps-VB
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 10:26:38 -0400
Received: by mail-ej1-x634.google.com with SMTP id r13so4561279ejd.5
 for <qemu-devel@nongnu.org>; Wed, 16 Mar 2022 07:26:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=wsXXIm05VyKPqQf2SBm8SVuEVh7vMWbrJ31kihUNURc=;
 b=Mw958nEfLrFZlOJQ/A7ncCP3XqYhH1VR2WX3GNgJK5LnvHWXuswFbOcKYInwKYUNWk
 0r2ssTGWHnRhZqwFKYiQw+wLjZcjm+DAaS0Yu9fSTO6m8NTvmrb0whuE4Nq6ddQt3z01
 xO6VZMSW2Kye4Nu2Z1wWyEJqbZOIyeHa5JJhx4F2um/i5KP+3diCg/UAB7RT6U22W/W+
 Osi8qZiAyU0H86h5/dihrQeJXYflqM8CwfztyhsVK+rOuFsd5xaq2xcFtbB4W5MwsgyL
 MxrQH/lwZ6LFCAUFwbYX6EXjArTN2zPv/kL+Y56tkiTsAtebQcpSoQ7KRMrUysA6RcmF
 faEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=wsXXIm05VyKPqQf2SBm8SVuEVh7vMWbrJ31kihUNURc=;
 b=ATHRybYbVVxL3rGPSwJ2fNAkKqxjOrawazzaqojcTQ6tY3sIYF66NTMoblhBlfSDrp
 02Q4SlV/7lWeiUVnKZpU3OChX+lcuBVIEUf/cZNVXRTENZE1VaR7hSOj4T65FLC045yQ
 m8xsIRKtutbCaEk/gg7b+CBaNDkdXdnm4Qwk5QwPsdoaiHlcMxtAhFIiUTG+qQ1vqRnM
 PXn4NgyiW7We09Fy+itINhZkRIdxX3J2PWQtXFIIzdPsfGQZVu3UfcQDus65TR6qAV+X
 vYbYyz2cPItG5zVxtBHsrwUXOoCjzRG2roCkHVu68bauXmm99tWcN5kVsvr33aBiDg5i
 NIrw==
X-Gm-Message-State: AOAM530NiIl9k4+pyx+kBqHnohbrZlWVN+LhSYX+uhx4t5m45qaX+qZx
 8JxWktYH//HBq7CB+nbpxo4=
X-Google-Smtp-Source: ABdhPJyGNF3kLPUkMykBZgm8cbzV9B1zcibTRgvccE+4OFIrYaml0AdDXNH/Os1T9D7FHv5dEWFTOQ==
X-Received: by 2002:a17:906:2bd7:b0:6ce:698b:7531 with SMTP id
 n23-20020a1709062bd700b006ce698b7531mr240115ejg.146.1647440795429; 
 Wed, 16 Mar 2022 07:26:35 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id
 u5-20020aa7d985000000b004024027e7dasm1022122eds.28.2022.03.16.07.26.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Mar 2022 07:26:34 -0700 (PDT)
Message-ID: <7e13e06b-f57e-8948-a897-5c05436846d3@redhat.com>
Date: Wed, 16 Mar 2022 15:26:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PULL 0/8] s390x and misc fixes
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
References: <20220315112052.515467-1-thuth@redhat.com>
 <CAFEAcA8u8G3=V=OVM6v_BaOwfeDu1RJmnwrW+4PXqbnPrAAr_w@mail.gmail.com>
 <de2b3a0b-5c1e-1cb3-ca97-c67f7272036c@redhat.com>
 <CAFEAcA-yACeWzRVSZYbOrxWK8g7mss4YjU=mzsX16k5VoF3=rA@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <CAFEAcA-yACeWzRVSZYbOrxWK8g7mss4YjU=mzsX16k5VoF3=rA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::634
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x634.google.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/16/22 14:19, Peter Maydell wrote:
> I'm not sure why we're passing this explicitly to the linker anyway,
> though.

According to the commit message the idea is to add libc++ automatically 
when you have C++ sources, libgfortran when you have Fortran sources 
etc. independent of the language that you're using for the final link.

In other words it removes the need to specify a linker driver for 
mixed-language programs (and allows some other combinations such as C++ 
and Fortran together).

It would be better if it worked though...

Paolo

