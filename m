Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E529843132A
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Oct 2021 11:19:24 +0200 (CEST)
Received: from localhost ([::1]:44278 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcOnk-0004oh-1J
	for lists+qemu-devel@lfdr.de; Mon, 18 Oct 2021 05:19:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45306)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mcOlc-0001xy-5T
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 05:17:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59701)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mcOla-0004h0-Ix
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 05:17:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634548629;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OhHmILqave/8BQVpxH/OpZL/xbyLRkKESw4dselXY6c=;
 b=UffZZH8I7ERweemSy7PF0543OkTlkCEw87Bo3RMKjOAazL2EtChQ6tVg4DCDeNDGPbpoVE
 AFAKen7EUx7WIwloyAMquiTYvat/7GF53lo77RUQKBt6Jday6S6S4ITlL54WwI3HLVEkiQ
 YZRDVLZrec/BMEwYk+RYXKXaE0yKn0A=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-442-SSAMQ5DkMCamC1kmvOeVaA-1; Mon, 18 Oct 2021 05:17:06 -0400
X-MC-Unique: SSAMQ5DkMCamC1kmvOeVaA-1
Received: by mail-wr1-f71.google.com with SMTP id
 v15-20020adfa1cf000000b00160940b17a2so8573982wrv.19
 for <qemu-devel@nongnu.org>; Mon, 18 Oct 2021 02:17:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=OhHmILqave/8BQVpxH/OpZL/xbyLRkKESw4dselXY6c=;
 b=I3cB/p8mdAuWW3C4iRlC9VFG8JdFP1o3qsjAcce63OW+zCauWfXih3b5neY3vSZpt7
 sjYekyspo3ng1m8snznyFUJ9JJ3c2j+nk4GxoRO7LUnLdHcJ6BWsYbKuH4uvudaZP/qL
 x4SYxltnWJQ+iQF5o58Uge1inbxQ5gY3dIUS993mTS6O8LRdtYtM0xwJy/Tw1LY7G12Y
 JQMOhJF0Hq3QVVSxN1Ago3qng2H/4eiPz+ZZdr0f1aCPUiz88aRScY6ZgYRAjvMwUpFz
 Tl9ITqQZrKHpdeFXhLfgn0zRZIYOENiNMLlB/6Hp2JrnORtt/dCUKI1kZmfvv/WSKxHx
 hGjg==
X-Gm-Message-State: AOAM532r1vinQvNrCdISN2+QmHhFao26Tw2ehNxuUTvT+ALi0B0Q3Dfp
 mvCfNFx1VZbZBjnM20wgQ6GP6sxheWJfg78YEwdS6d0zht9FtFA20Sle/Lt4SNmAN0uvF4OIEvQ
 ADGC81dURkzWq85s=
X-Received: by 2002:a05:600c:1d19:: with SMTP id
 l25mr44161wms.119.1634548625433; 
 Mon, 18 Oct 2021 02:17:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw06r8/yFd0onfmqPorAj9rczyf4FwvM84oqwuMrkmEnSFRw/UC/U6ryoai6OxUyr9Vh/qa9Q==
X-Received: by 2002:a05:600c:1d19:: with SMTP id
 l25mr44143wms.119.1634548625236; 
 Mon, 18 Oct 2021 02:17:05 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id v18sm13247908wrm.63.2021.10.18.02.17.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Oct 2021 02:17:04 -0700 (PDT)
Message-ID: <0bb60a5a-3d13-1c9b-a8ca-76f298c725f0@redhat.com>
Date: Mon, 18 Oct 2021 11:17:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH 1/2] rcu: Introduce force_rcu notifier
To: Greg Kurz <groug@kaod.org>, qemu-devel@nongnu.org
References: <20211015161218.1231920-1-groug@kaod.org>
 <20211015161218.1231920-2-groug@kaod.org>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20211015161218.1231920-2-groug@kaod.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-stable@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 15/10/21 18:12, Greg Kurz wrote:
> +/*
> + * NotifierList used to force an RCU grace period.  Accessed under
> + * rcu_registry_lock.
> + */
> +static NotifierList force_rcu_notifiers =
> +    NOTIFIER_LIST_INITIALIZER(force_rcu_notifiers);
> +
>   /*
>    * Check whether a quiescent state was crossed between the beginning of
>    * update_counter_and_wait and now.
> @@ -107,6 +115,8 @@ static void wait_for_readers(void)
>                    * get some extra futex wakeups.
>                    */
>                   qatomic_set(&index->waiting, false);
> +            } else if (qatomic_read(&in_drain_call_rcu)) {
> +                notifier_list_notify(&force_rcu_notifiers, NULL);
>               }
>           }
>   

You can put the notifier in struct rcu_reader_data---this way it doesn't 
call all the notifiers but only those that are necessary to make progress.

While at it, I have a slight preference for a separate 
rcu_add_force_rcu_notifier API, but I can be convinced otherwise. :)

Paolo


