Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98BBD3D2B8C
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Jul 2021 19:56:18 +0200 (CEST)
Received: from localhost ([::1]:37590 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6cvh-0004xh-IK
	for lists+qemu-devel@lfdr.de; Thu, 22 Jul 2021 13:56:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60098)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ckuehl@redhat.com>) id 1m6csK-00050c-EL
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 13:52:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57168)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ckuehl@redhat.com>) id 1m6csI-00029j-Qo
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 13:52:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626976366;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=raFWkEmfEsnXA+zlkTsH/h7na1SeJw58CnlfHE/P3Ws=;
 b=gnVvuK8fqaIZG7AlrSswYZfYKicFKpztwpCe6yBY46ppedYykjBdcohQp96pQZtseHxNox
 63t8nJqQ8sH9DEMO5HUZEaPAk3UzIB4Ssle4fHMqetWqm0lkoIFCpnavEgzJxJkXMKzY0N
 c7aJRzTX5cD+5VINxuHbeGRgtXuXTuM=
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com
 [209.85.167.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-170-LZGx1R6PNnurXGJmAg3e2g-1; Thu, 22 Jul 2021 13:52:44 -0400
X-MC-Unique: LZGx1R6PNnurXGJmAg3e2g-1
Received: by mail-oi1-f199.google.com with SMTP id
 u34-20020a0568081522b029025cd3c0e2bdso480730oiw.1
 for <qemu-devel@nongnu.org>; Thu, 22 Jul 2021 10:52:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:subject:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=raFWkEmfEsnXA+zlkTsH/h7na1SeJw58CnlfHE/P3Ws=;
 b=EL732YImqW23ZlzWMbyIaMzFFEQN9FuraeDTTTdhEhiwXjiDtUeTFrUoLbJgZgiO1T
 uS1Shejo9/L3cUhCGigmM2vrUyL6koQvKoJiLiFFsydL6eLec80OwDaLaNFcYVQGfafm
 2HTrFvj3BoGlVCfyzR7wb0IQ84dIrBWKQAe5PJT058uctBMo2S1vVg5MgD48piufjLUV
 0CdSuBL5RS8kBjpekI+SHnM8TtPppGxIMGjL4x1d8sTxVo2EotcrldZR1zMtiszy7IX9
 XqaSfROcuayfKDoHyn/c+wJa8RClnLtQKvvHW7bM2Y/mjJJVvNZb6GZPtig+WoOnlQ2w
 q/qA==
X-Gm-Message-State: AOAM532xzaomK9rTxsdV3+GmQpLXW6y1GKfFNsW3Zudp18AQt4gt9fkT
 yWBevdWnTdqQlPx8DdHmZ2y6kDwtmAu7CIhAj4XBE2/7+WwVvKj4+WzRlGdCrUhCZugcaLjwK8p
 Hj6mMZbdN8JbR1Y8=
X-Received: by 2002:a05:6830:438b:: with SMTP id
 s11mr636068otv.133.1626976364232; 
 Thu, 22 Jul 2021 10:52:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwYxdgdIkzUJlEvp1X0rIRGzY1SrQ7Xzkw/4Mpg1l/IcSoHndZi3iNwTfJV7xrpAXc4vqTTRA==
X-Received: by 2002:a05:6830:438b:: with SMTP id
 s11mr636051otv.133.1626976364091; 
 Thu, 22 Jul 2021 10:52:44 -0700 (PDT)
Received: from [192.168.0.173] (ip68-102-25-176.ks.ok.cox.net. [68.102.25.176])
 by smtp.gmail.com with ESMTPSA id b2sm2175904otf.40.2021.07.22.10.52.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Jul 2021 10:52:43 -0700 (PDT)
From: Connor Kuehl <ckuehl@redhat.com>
Subject: Re: [RFC PATCH v2 04/44] vl: Introduce machine_init_done_late notifier
To: isaku.yamahata@gmail.com, qemu-devel@nongnu.org, pbonzini@redhat.com,
 alistair@alistair23.me, ehabkost@redhat.com, marcel.apfelbaum@gmail.com,
 mst@redhat.com, cohuck@redhat.com, mtosatti@redhat.com,
 xiaoyao.li@intel.com, seanjc@google.com, erdemaktas@google.com
References: <cover.1625704980.git.isaku.yamahata@intel.com>
 <80ac3e382a248bac13662d4052d17c41f1c21e3a.1625704980.git.isaku.yamahata@intel.com>
Message-ID: <e85e1aa1-0171-3236-4ce8-54b97b59b49b@redhat.com>
Date: Thu, 22 Jul 2021 12:52:42 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <80ac3e382a248bac13662d4052d17c41f1c21e3a.1625704980.git.isaku.yamahata@intel.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ckuehl@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=ckuehl@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.472,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.203, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: isaku.yamahata@intel.com, kvm@vger.kernel.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/7/21 7:54 PM, isaku.yamahata@gmail.com wrote:
> From: Isaku Yamahata <isaku.yamahata@intel.com>
> 
> Introduce a new notifier, machine_init_done_late, that is notified after
> machine_init_done.  This will be used by TDX to generate the HOB for its
> virtual firmware, which needs to be done after all guest memory has been
> added, i.e. after machine_init_done notifiers have run.  Some code
> registers memory by machine_init_done().
> 
> Signed-off-by: Isaku Yamahata <isaku.yamahata@intel.com>
> ---
>   hw/core/machine.c       | 26 ++++++++++++++++++++++++++
>   include/sysemu/sysemu.h |  2 ++
>   2 files changed, 28 insertions(+)
> 
> diff --git a/hw/core/machine.c b/hw/core/machine.c
> index ffc076ae84..66c39cf72a 100644
> --- a/hw/core/machine.c
> +++ b/hw/core/machine.c
> @@ -1278,6 +1278,31 @@ void qemu_remove_machine_init_done_notifier(Notifier *notify)
>       notifier_remove(notify);
>   }
>   
> +static NotifierList machine_init_done_late_notifiers =
> +    NOTIFIER_LIST_INITIALIZER(machine_init_done_late_notifiers);

I think a comment here describing the difference between
machine_init_done and machine_init_done_late would go a
long way for other developers so they don't have to hunt
through the git log.

Connor


