Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ACAB82CBE5F
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Dec 2020 14:33:13 +0100 (CET)
Received: from localhost ([::1]:48986 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkSFs-0001FH-MQ
	for lists+qemu-devel@lfdr.de; Wed, 02 Dec 2020 08:33:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49666)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kkSC3-00006j-HB
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 08:29:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:36873)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kkSC1-00052n-Rl
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 08:29:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606915753;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qAeVI97LByg3mF6jDFFWq0oBiAZBt8KvpfPilKEnbAs=;
 b=LXWxoXe22JPKdeRm00VWuLhSqftBsnUnQ0Nx6skLoFk6tL3X5hLf0LBvV2ycE/Qi9WEeOj
 +7FGpIY0+kVUdac5HUJ62iUgKQ3WNXYT+WY3Sxy4tr9y9ZxNAhZlqe7tsDjzPpO/KmM/3m
 2ot9HM0/hw1BkXBFeJy+tBtnL7oX9Qg=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-488-Y97Twxy8MRyQfvnNmn7SMQ-1; Wed, 02 Dec 2020 08:29:11 -0500
X-MC-Unique: Y97Twxy8MRyQfvnNmn7SMQ-1
Received: by mail-ed1-f69.google.com with SMTP id bc27so2986218edb.18
 for <qemu-devel@nongnu.org>; Wed, 02 Dec 2020 05:29:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=qAeVI97LByg3mF6jDFFWq0oBiAZBt8KvpfPilKEnbAs=;
 b=oXsMePXRDz05oLyJDh5OQl+MAtqQqwliB2saXad3qxQ2g161NHZrbcQnb/NSB8ezDS
 474c/7iJO3JWHVfC1/ySIDsYpem9xryYq9qbDqeAMKCNM0YaJhRfK37aZLIZ7ujwBVc/
 tXBrsywtD+XeyRi20N3MBysqYYUUbF2pn9QYV+Pzs+Ei27PLUAnFLGps75lGc94jNCDu
 vnoHOUGLNK7N29D6AQ/qooqdybx/Ah0bJdC2VaAhsAvPirO/QGwdy3TrvAInV0+KbsM5
 bWNB16am99/RfKQaKyDfqCkrQZzMXpsqTIzZkgV7FSW1X7CGwHJ5N3NfB+Q9TuuJRWNz
 h64Q==
X-Gm-Message-State: AOAM533HjVgAmrc/HfkT/gFo+lC06yld27myjtU52BfYt0FMOXhoRqI4
 6n1QETzQEN1p7RKSKvMKFT3jNYMup92e+uns63iIc7h2piF4xlbUvQ+YBDmJCdFBiv1LQ1rHu1M
 /G6kkCXhRn0Rn0S+jjkh+Gz6w6vBbww6oYQo4Sapo55vKM3zHjuBt7wkpz8PCHmQvAVk=
X-Received: by 2002:a17:906:56ca:: with SMTP id
 an10mr2318091ejc.498.1606915749914; 
 Wed, 02 Dec 2020 05:29:09 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxySFR/8rGRpP2pj78Yptl8XsVZuDe9hSqXJpgrJwiXE/zUc4GrNONEes9kOAFDkmQPzjOQJQ==
X-Received: by 2002:a17:906:56ca:: with SMTP id
 an10mr2318069ejc.498.1606915749685; 
 Wed, 02 Dec 2020 05:29:09 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id c5sm1198666edm.35.2020.12.02.05.29.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Dec 2020 05:29:08 -0800 (PST)
Subject: Re: [PATCH 24/29] migration, vl: start migration via
 qmp_migrate_incoming
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
References: <20201027182144.3315885-1-pbonzini@redhat.com>
 <20201027182144.3315885-25-pbonzini@redhat.com>
 <20201120163408.7740a92f@redhat.com>
 <0562d6fa-b619-7dc3-ef94-242a39436cfa@redhat.com>
 <20201202131037.GF3226@work-vm> <20201202131531.GI2360260@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <10972b53-3559-b341-4f06-9bfc673cc271@redhat.com>
Date: Wed, 2 Dec 2020 14:29:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201202131531.GI2360260@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.495,
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
Cc: Igor Mammedov <imammedo@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 02/12/20 14:15, Daniel P. Berrangé wrote:
> Can someone remind me why we need to have an -incoming arg at all ?
> 
> With snapshots, we can just start QEMU normally, using -S if desired,
> and then invoke "loadvm" to restore from a snapshot at any time.
> 
> What is different thet means we can't just run "migrate_incoming" on
> any QEMU at any time, ignoring -incoming entirely ?

There are some parts of QEMU that operate differently based on 
RUN_STATE_INCOMING.  Removing those is one of the things that these 
patches should enable, though there are also some uses in Xen that I'm 
more worried about.

Paolo


