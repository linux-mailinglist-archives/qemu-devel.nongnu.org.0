Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA05B38CB42
	for <lists+qemu-devel@lfdr.de>; Fri, 21 May 2021 18:46:08 +0200 (CEST)
Received: from localhost ([::1]:42604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lk8Ho-0000dh-0G
	for lists+qemu-devel@lfdr.de; Fri, 21 May 2021 12:46:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lk8Fl-0007Bi-6T
 for qemu-devel@nongnu.org; Fri, 21 May 2021 12:44:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56190)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lk8Fi-00044R-4o
 for qemu-devel@nongnu.org; Fri, 21 May 2021 12:44:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621615437;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YfgOkACB+7k8qbJIp3eQKYtGYOWz7VHeFuBg8Yu/Tss=;
 b=jTqh6bj2R+iqvdzSRdsPX4+QUfXp6A0z3e0UtwQnr/tvCbhhNC8SpSwNHeiq6o/Pb37olU
 H+6g7uN7UkLYAG0gYpOPwlOae9jYp4FXkhMpM9OVvYlt+sLnRsxKvh6UMsmsMsmW2ryNQZ
 FeRa967uEDG5UEdpTQMkaWLrG+5lR5Y=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-96-sNW3u0hHO8W4lPpcGybkxg-1; Fri, 21 May 2021 12:43:56 -0400
X-MC-Unique: sNW3u0hHO8W4lPpcGybkxg-1
Received: by mail-ej1-f70.google.com with SMTP id
 nd10-20020a170907628ab02903a324b229bfso6462500ejc.7
 for <qemu-devel@nongnu.org>; Fri, 21 May 2021 09:43:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=YfgOkACB+7k8qbJIp3eQKYtGYOWz7VHeFuBg8Yu/Tss=;
 b=krXvUwcdW8lo4rREwekFRxWTWZtTGav3n+ZQ0BbFJc3ON87T50Y3WhPA21qL/nYrxY
 M7odcdZm/qZHGzq3wflGJCWTEDpkRxT7noskCZm4qSKFuqGsqngdIdP27Bdwp/h9UnhM
 csXCrR5XhbKPOdpNvlYnm9yI599TNVbtMW1Q5JU816u+goz+oDm9u2y1PXAAlJ1IbdCE
 ZLAjVGTEkt8J2rnDtp+hT5wkX47fYkcGwLPKAIOniYiDS6r72Q8ZRQShDGHMJ/vUMlmR
 3TOZiwwJ2bxpFzlGGW4epExeMZYV+slvtGeejUfB2cj5ROCzpGn9NW/InG+7jKnFyA0r
 WwIA==
X-Gm-Message-State: AOAM530U5bl02b273KmZfbQOFllB5PfwXgBzBRAJrZNF9H/oY0zXri+l
 JFU0HBbvZm5HL3elItdYENo4DQKObCPSy0deVYGtM6XR6yDTaKunNmiHM29FfveR4LkAKJr9hq/
 r66Bla8bCW2uDLTqYYCYdTeE+dMgs+u65sRn5ZeVt7yeEpZcKXY17U8Pt+scoWIxHE4Y=
X-Received: by 2002:a17:906:6c96:: with SMTP id
 s22mr11396782ejr.468.1621615434776; 
 Fri, 21 May 2021 09:43:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxZ4FVmoOZgQC6Ysv5uIBbnJNdwgeKBwtLV85y9C2V9DHY8uygjpASg8uMoZeMP5VQAykE+kA==
X-Received: by 2002:a17:906:6c96:: with SMTP id
 s22mr11396752ejr.468.1621615434538; 
 Fri, 21 May 2021 09:43:54 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id gb26sm4127656ejc.25.2021.05.21.09.43.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 May 2021 09:43:53 -0700 (PDT)
Subject: Re: [PATCH v2 1/7] block-copy: streamline choice of copy_range vs.
 read/write
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
References: <20210518100757.31243-1-eesposit@redhat.com>
 <20210518100757.31243-2-eesposit@redhat.com>
 <f5069a9d-cd23-26cf-c1cb-6f4f5774e48d@virtuozzo.com>
 <5a4cc9ae-f419-ab40-cd7a-d30e39f91e54@redhat.com>
 <5f93d053-0370-a179-0c81-27434430fd43@virtuozzo.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <422ffd3a-32bd-1133-1d9b-f27833e46502@redhat.com>
Date: Fri, 21 May 2021 18:43:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <5f93d053-0370-a179-0c81-27434430fd43@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, John Snow <jsnow@redhat.com>,
 qemu-devel@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 21/05/21 17:48, Vladimir Sementsov-Ogievskiy wrote:
> I keep it thinking about further moving qemu-img convert to block-copy. 
> But I don't even have a plan when to start this work. So, if we want to 
> do something around copy_range here to prepare for thread-safety, let's 
> just drop it for now as unused on top of "[PATCH v2 00/33] block: 
> publish backup-top filter" (you can take one patch that drop copy_range 
> support in backup to your series to not make a dependency). It's not 
> difficult to reimplement it later.

Then we'll have this same conversation later.  I would hope that this 
series goes in before yours.

Paolo


