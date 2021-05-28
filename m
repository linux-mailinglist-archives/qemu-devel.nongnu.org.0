Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B4979394162
	for <lists+qemu-devel@lfdr.de>; Fri, 28 May 2021 12:54:42 +0200 (CEST)
Received: from localhost ([::1]:56806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lma8X-000566-7o
	for lists+qemu-devel@lfdr.de; Fri, 28 May 2021 06:54:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48156)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lma77-0004Hp-2V
 for qemu-devel@nongnu.org; Fri, 28 May 2021 06:53:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39042)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lma72-0005Eh-Hz
 for qemu-devel@nongnu.org; Fri, 28 May 2021 06:53:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622199187;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=c67XRsBY2izUBlBUT9sdVLs55TOhGw7rNS7ISQ02+iM=;
 b=c7GxUahQ/ZWzs/4RV9BI7lIESck4qWbt/pTp1rrpTr2VVPcZWTJHAI7m+7JnL8DowYnnQU
 bluAzNigFNNPYHiAz6SAuSZjfTvZdTzB/k7CRivdRjs+3QjvTWV5ix9Uuyt7Gv3Rd7IpAc
 tjSJpr4oYKaSsCT0vd9vgkXjSSgfCHY=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-38-QlCq6iCjO1a6zwc_1b5yQg-1; Fri, 28 May 2021 06:53:06 -0400
X-MC-Unique: QlCq6iCjO1a6zwc_1b5yQg-1
Received: by mail-ej1-f70.google.com with SMTP id
 p5-20020a17090653c5b02903db1cfa514dso980237ejo.13
 for <qemu-devel@nongnu.org>; Fri, 28 May 2021 03:53:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=c67XRsBY2izUBlBUT9sdVLs55TOhGw7rNS7ISQ02+iM=;
 b=JcIcxFbuXhJg4K+H+moMM6MZ3ctLJ5GlEWU8fYzXYiQGlvIVNxlQifj2zMCfQ6RlSf
 5ClnbB5P+FF1jStz627KBDIh3oHUrDwj2oMTlFZro8ozeQyLrBmL5CYv0UE5Sv9aKe9t
 6eweJSQ8/KnnzmsP20vgTHpRiKEXWGvoKKyliFL7gaqvECZg4kYrZxI+Xgp8vYOj+lTF
 FLkLEQWk7Qk6YsQbGDjrmfE3tBFlGWXemZQ64G33NRQJH9XagRGuArbABq0JZSmfFMIq
 hOn0vLZB2ibgtWyda9NJzfjrpqtYDqEbk9b4U9VCPykhxqYb1gamYAOP5YfkJAxyvHN0
 Yq3Q==
X-Gm-Message-State: AOAM532KNUZyOIyu7KCYw3WsYenkLlyucWBUNqxYk1KcxryAD/lyva+G
 dCHTeqSrT4covqPeTdbf7JAYK15u9uXahpv4jHIVry5IucCWsmHodMfvMfjZM7DK2GzEPgQzedn
 MAsA8QYQUlNGj/KLOD6RDkm0WKaSEVAOH1IMFfeRVkTSrOjJRx5rym6iArIAGrX+IoiE=
X-Received: by 2002:a05:6402:946:: with SMTP id
 h6mr1926256edz.261.1622199184549; 
 Fri, 28 May 2021 03:53:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyne+2smp9qHaQhpylejN8qdjkgGVS938Zu0nEAlWY4D5JG2o1BWe0z/7/uXj0BJPCrxg7Rpw==
X-Received: by 2002:a05:6402:946:: with SMTP id
 h6mr1926240edz.261.1622199184370; 
 Fri, 28 May 2021 03:53:04 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e?
 ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id a22sm2490522edu.39.2021.05.28.03.53.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 May 2021 03:53:03 -0700 (PDT)
Subject: Re: [PATCH v2 5/7] block-copy: add QemuMutex lock for
 BlockCopyCallState list
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
References: <20210518100757.31243-1-eesposit@redhat.com>
 <20210518100757.31243-6-eesposit@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <5a7c6375-2309-1d5b-57b2-4ebe780b6753@redhat.com>
Date: Fri, 28 May 2021 12:53:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210518100757.31243-6-eesposit@redhat.com>
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 18/05/21 12:07, Emanuele Giuseppe Esposito wrote:
> +    qemu_mutex_lock(&call_state->s->calls_lock);
>       QLIST_INSERT_HEAD(&call_state->s->calls, call_state, list);
> +    qemu_mutex_unlock(&call_state->s->calls_lock);

Let's just use tasks_lock here (maybe even rename it to just "lock").

Paolo


