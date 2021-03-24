Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 135FD347D9C
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Mar 2021 17:25:34 +0100 (CET)
Received: from localhost ([::1]:53782 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lP6K4-0004cq-HV
	for lists+qemu-devel@lfdr.de; Wed, 24 Mar 2021 12:25:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34544)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <isaku.yamahata@gmail.com>)
 id 1lP6GG-0002sM-M5
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 12:21:36 -0400
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434]:40590)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <isaku.yamahata@gmail.com>)
 id 1lP6GE-0005Sz-NX
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 12:21:36 -0400
Received: by mail-pf1-x434.google.com with SMTP id l3so17688199pfc.7
 for <qemu-devel@nongnu.org>; Wed, 24 Mar 2021 09:21:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=Sxy+rmgM4jCbiaMUdkhCCkmC8chQTVQRs8hhwyx7Dts=;
 b=GWF11cmP+yVmiYpe7xGB/9tIbVLtI5o7OhSmdnEP+WP2p6PpVr+tmnh1VwA28V67+i
 TjbADVjqCE24Dfv8DitBDurvOcq+/AX6Hj7TM1jpyoSlgyMapocZODFOBGM7pgWYjwZY
 qZ6H78I8wkfF+/98ZmMCoOkzCPyRRjYFkXF2ZW+QBA9V2rYdKVtIWRtUsyVCEbOvIo/g
 jvyAD/TztORHAHSU0Oh+31u4IV80sXp5pfVoNafLq545twPfYraJ2KX4rbUUSPIHltqN
 JM9m5SV0Uya5MUun3V+V/eS0dkOxSdmgwKh7fUuaGOMnKhU+gxYUcvy3EIu0RwaEhoSF
 dIgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Sxy+rmgM4jCbiaMUdkhCCkmC8chQTVQRs8hhwyx7Dts=;
 b=SNpqNXAqKfhOmTO/N8YTE8fu9KeUEFkr6zOVvOf1fZjbREnWzLdERWDdT3WI7G10cr
 6g6JNgfBG5Pj/uyvAULohYrkUC03BlYE7U0GPToevsnWU2cvHWoxvwaNY5NJ43s0T13x
 1OClbem2C0uJIL38hd0iEZZa7a8SV3fQ9G2iYPIVYCVY5r7BEj+aUtVYHBdKn96WJT4f
 6JEagktOoOjRZT3ku+C3ImKAG+7wHaFv1NOh74cs3oASZJChdZTCqWh6XwKLEAha+dYi
 UKbDA2tT9njwQ7w2GgNIpCXnkhP6khXqjpGLPmfbXCUSUPOxkBYw5kE8TDJ9u0eAfcK0
 0zVg==
X-Gm-Message-State: AOAM5319zRMjW+iAPoJXjHPaW1rY6LVdob4PimEmWL6F74pDXOgWCmcZ
 e/QwnwSy4aGzEr+VYlFrNKI=
X-Google-Smtp-Source: ABdhPJyYnSCQ3JskuMfcokjBFFWEWZpzoRHFSkLxfjNPt4sTliVLvKBN+gVT5ZAmGXNZ6cp/k7rSqg==
X-Received: by 2002:aa7:9471:0:b029:1f2:3e6c:69e3 with SMTP id
 t17-20020aa794710000b02901f23e6c69e3mr3863143pfq.69.1616602892362; 
 Wed, 24 Mar 2021 09:21:32 -0700 (PDT)
Received: from localhost ([2601:647:4600:11e1:d2fd:ba5d:619c:c25d])
 by smtp.gmail.com with ESMTPSA id v23sm2861577pfn.71.2021.03.24.09.21.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Mar 2021 09:21:31 -0700 (PDT)
Date: Wed, 24 Mar 2021 09:21:30 -0700
From: Isaku Yamahata <isaku.yamahata@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH] hw/pci/pci.c: Assert that pci_irq_handler() inputs are
 valid
Message-ID: <20210324162130.GA1374083@private.email.ne.jp>
References: <20210323164601.27200-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210323164601.27200-1-peter.maydell@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=isaku.yamahata@gmail.com; helo=mail-pf1-x434.google.com
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
Cc: qemu-devel@nongnu.org, isaku.yamahata@gmail.com,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I included (mostly) same patch into my patch series just for patch
completeness.
Please choose whichever you like.

Reviewed-by: Isaku Yamahata <isaku.yamahata@intel.com>

On Tue, Mar 23, 2021 at 04:46:01PM +0000,
Peter Maydell <peter.maydell@linaro.org> wrote:

> pci_irq_handler documents that it must be called with 0 <= irq_num <=
> 3 and level either 0 or 1.  Add assertions that the caller has passed
> us in valid arguments.
> 
> In particular, if a device model fails to set the PCI_INTERRUPT_PIN
> field in its config space correctly to indicate that it has an
> interrupt, and then tries to raise an interrupt (either by calling
> pci_set_irq(), or by getting a qemu_irq from pci_allocate_irq() and
> then calling qemu_set_irq() on that) we will now diagnose this device
> model bug with an assertion rather than engaging in the undefined
> behaviour of shifting by a negative number.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/pci/pci.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/hw/pci/pci.c b/hw/pci/pci.c
> index 0eadcdbc9ec..38aefe22ab3 100644
> --- a/hw/pci/pci.c
> +++ b/hw/pci/pci.c
> @@ -1449,6 +1449,9 @@ static void pci_irq_handler(void *opaque, int irq_num, int level)
>      PCIDevice *pci_dev = opaque;
>      int change;
>  
> +    assert(irq_num >= 0 && irq_num < PCI_NUM_PINS);
> +    assert(level == 0 || level == 1);
> +
>      change = level - pci_irq_state(pci_dev, irq_num);
>      if (!change)
>          return;
> -- 
> 2.20.1
> 
> 

-- 
Isaku Yamahata <isaku.yamahata@gmail.com>

