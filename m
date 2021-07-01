Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 16D553B948A
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Jul 2021 18:13:15 +0200 (CEST)
Received: from localhost ([::1]:46742 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyzJR-0004WY-MP
	for lists+qemu-devel@lfdr.de; Thu, 01 Jul 2021 12:13:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36004)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lyzI2-0003qe-M4
 for qemu-devel@nongnu.org; Thu, 01 Jul 2021 12:11:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30693)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lyzHz-0004fQ-FB
 for qemu-devel@nongnu.org; Thu, 01 Jul 2021 12:11:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625155901;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QxCw7VWN0IOnWU5bt8llRo1IyCjbTjbaT6M96mCi60g=;
 b=eWbtNFq0vXJ4VQxWHYgx/Xkm7n+wTeskM/OqPFRw+5VW8F21ymdhj2/cT0orV3lYiFqNQo
 wAPotB08qAF9yJdNcklNaZM+tztS/OaZpeLiKySPUTAcR4u+gsQZlEd/hqX8tJCMx+rFJZ
 qA7FNNTsXEPOSnQEcGQu1VWiEQunFpQ=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-525-vFjlzS-_MI-iYy7jB7utyw-1; Thu, 01 Jul 2021 12:11:40 -0400
X-MC-Unique: vFjlzS-_MI-iYy7jB7utyw-1
Received: by mail-wr1-f69.google.com with SMTP id
 y5-20020adfe6c50000b02901258bf1d760so2770982wrm.14
 for <qemu-devel@nongnu.org>; Thu, 01 Jul 2021 09:11:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=QxCw7VWN0IOnWU5bt8llRo1IyCjbTjbaT6M96mCi60g=;
 b=KMFZUo81e3XGxE7liSd/7N6wt8dL6S5B8cCDg1RuO83vWmgDip8NHpgW8rEHCoOKmO
 ffmCiSIf8eBj7K2I1U8V9BUOJk5wyzFZITAUhCfjlIxPbrbfdwZR39Ly6NWQUZYfc67p
 t0YqrRjFiYfVjDPIdiK95gpyBWN3KTUN07LRYboWFQhqnkHh1KkunGowftB7DcskKVxB
 Pl5F/clM9gwCxWJeFOC6yOpCnIa57RlBtxS1CJDuSSJO0S/IAHTTECrGRJAMbfj346T7
 dxgwVrktm95vt6Kn11JWfEJGw5RX8BNCamrHeARKssw1lLl+ywUDEiZCYYwGcNGYvORi
 BJJQ==
X-Gm-Message-State: AOAM531EV6PcaYQ68jylwaPb7I/kKO3/WxsVnsgs7MWkIlSog0u5xKei
 ZuymZj3kW81faWvWuuVWlcYs92hm9zqI/o28RLCvVL9GfTAPs14UNaFnVndcz5l7jwpUaMWN/TG
 yUuYZDHwnN+JSQiI=
X-Received: by 2002:a1c:4d07:: with SMTP id o7mr494398wmh.97.1625155898994;
 Thu, 01 Jul 2021 09:11:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJymqEhPFMxFa9ElapeC1Jcoo5NU6iJiA29RIJUE04TEwxFklxVfJ0FTyuek/bzAsgqHFF7Swg==
X-Received: by 2002:a1c:4d07:: with SMTP id o7mr494380wmh.97.1625155898789;
 Thu, 01 Jul 2021 09:11:38 -0700 (PDT)
Received: from [192.168.11.95] (pop.92-184-108-151.mobile.abo.orange.fr.
 [92.184.108.151])
 by smtp.gmail.com with ESMTPSA id u15sm9879221wmq.48.2021.07.01.09.11.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Jul 2021 09:11:37 -0700 (PDT)
Subject: Re: [PATCH] migration: failover: emit a warning when the card is not
 fully unplugged
To: Laurent Vivier <lvivier@redhat.com>, qemu-devel@nongnu.org
References: <20210701131458.112036-1-lvivier@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <241d8a85-428f-1abf-fe32-38a88f73bfc7@redhat.com>
Date: Thu, 1 Jul 2021 18:11:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210701131458.112036-1-lvivier@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.402,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/1/21 3:14 PM, Laurent Vivier wrote:
> When the migration fails or is canceled we wait the end of the unplug
> operation to be able to plug it back. But if the unplug operation
> is never finished we stop to wait and QEMU emits a warning to inform
> the user.
> 
> Based-on: 20210629155007.629086-1-lvivier@redhat.com

FYI this ^ tag ...

> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
> ---

... goes here ;)

>  migration/migration.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/migration/migration.c b/migration/migration.c
> index 3b06d43a7f42..e065c62e5189 100644
> --- a/migration/migration.c
> +++ b/migration/migration.c
> @@ -3689,6 +3689,10 @@ static void qemu_savevm_wait_unplug(MigrationState *s, int old_state,
>              while (timeout-- && qemu_savevm_state_guest_unplug_pending()) {
>                  qemu_sem_timedwait(&s->wait_unplug_sem, 250);
>              }
> +            if (qemu_savevm_state_guest_unplug_pending()) {
> +                warn_report("migration: partially unplugged device on "
> +                            "failure");
> +            }
>          }
>  
>          migrate_set_state(&s->state, MIGRATION_STATUS_WAIT_UNPLUG, new_state);
> 


