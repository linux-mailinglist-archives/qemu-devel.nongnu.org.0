Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BDE5542DA8A
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Oct 2021 15:35:01 +0200 (CEST)
Received: from localhost ([::1]:53904 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mb0su-0000oS-TV
	for lists+qemu-devel@lfdr.de; Thu, 14 Oct 2021 09:35:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36356)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mb0md-0001AO-HN
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 09:28:31 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:33662)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mb0mc-0005SW-2O
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 09:28:31 -0400
Received: by mail-wr1-x42c.google.com with SMTP id m22so19685006wrb.0
 for <qemu-devel@nongnu.org>; Thu, 14 Oct 2021 06:28:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=kpZuBQNnmgWAvq84AMzVmQjgnlIq0f2M3fd+P2yo4hI=;
 b=U2zDgv8aFM5IDpYmxMbShP3GXuiDZeqOjQDVePKrW2O+pTLx0Ho+cOTR5efjiXitx5
 3TMBahUuoe9Ej9hCc3WiwtsnSFMV96trgfmqnFl3GJ9Q7hbqeSkW4ohx3cJjBdqurzfa
 acR3w0A5sztENFbnBqyIpDklByOHAvenIDXM1Yf/2wuz63uBJKTocQuBBsQasAP44Plg
 e/wT33M5bdRIYhnoW7CQ7Vc4MHZhhdkZUhktLoVihk8zTMWkxK4L6pNzRR3YtvUgFTZj
 Hknyvb9GME6nDqA+7beFLbWZN1yrnmvoRxzzcjANpbs+T5J1Q7lQlMSh9d1Sm5mm/XSD
 9ZEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=kpZuBQNnmgWAvq84AMzVmQjgnlIq0f2M3fd+P2yo4hI=;
 b=N/aW8KijePWNXH05l9RjldydJr0gGuAbKU/mHWFUuY30csLt/1tNdoLdG40X4yO8wa
 6FbQ/i0RSwFKbKbGwmcGAh8hj+BSwNdvDEdyjPym2Wj69yauDWLNnfiUHJ9Nvz9t/51x
 sh7gr2HxMK6bUhP1A2UAs87bcME2kNIe+3vPq4Cvb+96qS45+merPRVOl0RdmE9YICcL
 +0Bxt+jU2/ZMsdZfZ5Y5bhPsd92SpaOk7jR+ktsBE5LSKVTvg+ZcDqmMrAHFRDc1l7Xr
 846o2LbFst8ccraFdWZiOznBLX40k15Qg9DIsFqcZ24DzQ2F3xRkmvjwC43yj428sK6a
 uWUw==
X-Gm-Message-State: AOAM532nh/njlAWqVep5zL/dCc73dmMZ2H/vn4o3o19OoC/by59U1flE
 GQNAoSHyriDd35mrIG4r3ZM=
X-Google-Smtp-Source: ABdhPJzPxuBGceEhpP9FAVCrrMICq5L4eqhQtdbFqtOlNe5hv7ElqCQEpKmZLBNHx/mfhekRRkexCA==
X-Received: by 2002:adf:8b06:: with SMTP id n6mr6700380wra.5.1634218108133;
 Thu, 14 Oct 2021 06:28:28 -0700 (PDT)
Received: from [192.168.1.36] (213.red-81-36-146.dynamicip.rima-tde.net.
 [81.36.146.213])
 by smtp.gmail.com with ESMTPSA id z6sm2989194wmp.1.2021.10.14.06.28.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Oct 2021 06:28:27 -0700 (PDT)
Message-ID: <52cc5278-5ad0-5cbd-ca2d-5fbf383c3a99@amsat.org>
Date: Thu, 14 Oct 2021 15:28:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v3] hw/usb/vt82c686-uhci-pci: Use ISA instead of PCI
 interrupts
Content-Language: en-US
To: Gerd Hoffmann <kraxel@redhat.com>
References: <20211013121929.9E835746333@zero.eik.bme.hu>
 <189eeccd-36fd-d033-7900-30e89fc662df@amsat.org>
 <20211014091240.vif3nqeveddc6ru2@sirius.home.kraxel.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20211014091240.vif3nqeveddc6ru2@sirius.home.kraxel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Huacai Chen <chenhuacai@kernel.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/14/21 11:12, Gerd Hoffmann wrote:
>   Hi,
> 
>>>      if (s->masterbus) {
>>>          USBPort *ports[NB_PORTS];
>>
>> usb_uhci_common_realize() should be refactored making it PCI-agnostic.
> 
> Not sure this is needed here.  This seems to be more a platform-specific
> oddity in IRQ routing than a non-pci UHCI device.

OK, fine then.

