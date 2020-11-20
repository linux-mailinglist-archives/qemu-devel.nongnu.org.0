Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EF0E2BAF89
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Nov 2020 17:03:47 +0100 (CET)
Received: from localhost ([::1]:57602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kg8t0-0007Kt-ND
	for lists+qemu-devel@lfdr.de; Fri, 20 Nov 2020 11:03:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56536)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kg8rV-0006AN-Vh
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 11:02:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:35397)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kg8rS-0000kS-99
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 11:02:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605888126;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=StGh1+wv8VmP5u733qV/kiISonaIAOqsnkLB8e70bpY=;
 b=CvJcdQC4FLskDEcBic4iU3QhI+CR+pRZJW7jQA8WP2ior74jBC00D64OiKqOoDNG91tpoF
 9T0+LUYo+akB/EYBuyH/kSXCz7oG1GC/qfQIrTJrUPz1N0vfHya0MiFc0rDeDX2PVzikIb
 gizYdRlU68L0iqAJahBwR+hfm/dvo5c=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-296-vvScgkSqMZSDekbTYEImrA-1; Fri, 20 Nov 2020 11:02:04 -0500
X-MC-Unique: vvScgkSqMZSDekbTYEImrA-1
Received: by mail-ej1-f72.google.com with SMTP id a13so3264060ejv.17
 for <qemu-devel@nongnu.org>; Fri, 20 Nov 2020 08:02:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:subject:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=StGh1+wv8VmP5u733qV/kiISonaIAOqsnkLB8e70bpY=;
 b=ZzxQui3S36MAXQQnKx0GeZAiT/wxQGok6ka8oN8mOtcTblb/6oWMYOz4SGKr5inUYB
 cFg0QrTKyDiOXKUlJWmG3BImw+7yjeESY108K+d8wNFr1zHPhUPWEnCjjsVRs0NVbHL+
 FTcNgbGDalIcuJnI6mclA2hksNSZvchihpNugppwYpb45PaENDRTpOprShiuEIw/PG19
 PjIjKOWMlE5IkaMdMQ0n+NqKWAypEjgglX5Kz4EYg4wINa/cnnKRpbetSrtVMT3hFnWt
 1nhy6icPQCU4IqJbxgFEHNluL34FrQpbG5VpbtR/mEIyIT3KDrpjVtwz37LQ6Dvk/brf
 qohg==
X-Gm-Message-State: AOAM533zdYDmQlNZWksIeDSFKl7CCJ6PwWJvKBGhHkwfhkccYtaUwtiY
 tIIrotFAU3LQlX5zcCY/LE92iSy6mAqR/nmM/VL4uAUtS1AIuQkgsaqprOyHYQzGlRRpvFbDfUO
 rtODub3pdTvU2GvI=
X-Received: by 2002:a17:907:d1f:: with SMTP id
 gn31mr6321841ejc.192.1605888123158; 
 Fri, 20 Nov 2020 08:02:03 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxDwkqpvKzFmWwGo1WceIVrvqBfAr5OJsBmFkcVv3/+w69k0Qqwzci+0PZ15mRn5p+fNsD78A==
X-Received: by 2002:a17:907:d1f:: with SMTP id
 gn31mr6321817ejc.192.1605888122984; 
 Fri, 20 Nov 2020 08:02:02 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id 27sm735541ejy.19.2020.11.20.08.02.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 Nov 2020 08:02:02 -0800 (PST)
To: Igor Mammedov <imammedo@redhat.com>
References: <20201027182144.3315885-1-pbonzini@redhat.com>
 <20201027182144.3315885-25-pbonzini@redhat.com>
 <20201120163408.7740a92f@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 24/29] migration, vl: start migration via
 qmp_migrate_incoming
Message-ID: <0562d6fa-b619-7dc3-ef94-242a39436cfa@redhat.com>
Date: Fri, 20 Nov 2020 17:02:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201120163408.7740a92f@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: qemu-devel@nongnu.org, dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 20/11/20 16:34, Igor Mammedov wrote:
>>       qapi_event_send_migration(MIGRATION_STATUS_SETUP);
>> -    if (!strcmp(uri, "defer")) {
>> -        deferred_incoming_migration(errp);
>> -    } else if (strstart(uri, "tcp:", &p) ||
>> -               strstart(uri, "unix:", NULL) ||
>> -               strstart(uri, "vsock:", NULL)) {
> considering the last hunk does won't call qmp_migrate_incoming
> if 'defer' was used, wouldn't we will lose QAPI event here?
> not sure how important it to users,

Hmm yeah that's true.  That might even be considered a bugfix (no setup 
is done until the "real" migrate-incoming command), but I can also add 
the event manually in qemu_init.

(Libvirt doesn't use the SETUP case of the event but that's of course 
only part of the story).

Paolo


