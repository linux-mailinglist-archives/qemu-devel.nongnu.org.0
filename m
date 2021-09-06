Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CBBE440197D
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Sep 2021 12:09:37 +0200 (CEST)
Received: from localhost ([::1]:44174 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNBZH-00021Z-So
	for lists+qemu-devel@lfdr.de; Mon, 06 Sep 2021 06:09:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43314)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mNBTq-0003qr-2F
 for qemu-devel@nongnu.org; Mon, 06 Sep 2021 06:03:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26168)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mNBTf-0005Ol-1z
 for qemu-devel@nongnu.org; Mon, 06 Sep 2021 06:03:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630922625;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=V482k8OqPjRKbo9P9vChyp0G7RCL2po0g5rVv5/FATQ=;
 b=jU1Hd9vM1/XPMvf8zS73ujE9JzOJyKWZXIuFhzajapyVlyofb2w8I2t+965XrfLgIBYsL9
 7S5dFjcvQzZK4R1/WiJ/WsPr+HdutgXKmN0G5Mf5IAmPpg7sV7LZqZmaXUufPXKhJnb++6
 6EqiuqpBiIP/iNqJzY9ZhkmSDCI9KE8=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-416-nDwPRAIFOTG_tg5GSGzJyw-1; Mon, 06 Sep 2021 06:03:44 -0400
X-MC-Unique: nDwPRAIFOTG_tg5GSGzJyw-1
Received: by mail-wm1-f69.google.com with SMTP id
 o20-20020a05600c379400b002e755735eedso3058314wmr.0
 for <qemu-devel@nongnu.org>; Mon, 06 Sep 2021 03:03:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=V482k8OqPjRKbo9P9vChyp0G7RCL2po0g5rVv5/FATQ=;
 b=dn+qCKP+63riuoiJ23eXr1of7Q9QjQp1ItzlZKszyqwLHjWM2q8TviBhxXx6qo8lYx
 bktqdYMwGoCDvqKukJU9xOP5W0ObJcA+4OU+ritUetUqmBKqfiYXJzu9+3b/RggUoFbb
 xzQUZrJQgmJVddr5ge/hGN53MrnQz1oDqOeRdltfWQALV0gHKBWsoiidSw3LBqHwNcti
 WDokcu0AbgKsM1t1WHghxnWV2oTMfRFd7MgUZDkFBaI4goKdqnv+Hy8d7JMdn8sxXpSk
 +froFBhHhw/vS7zpzaJ8qOL8gdumDasRZA+RncZYZxOZOAxeejZqSyoHLtgWvT6aBq47
 Ieqg==
X-Gm-Message-State: AOAM532A9V9v5Sveb+RI2JPGZ0rpZlYAC7eTtyWPXQV29RCi1XUlQZX3
 C10rVLEmEHb/4cpwrDKMRJCAFoT7lfDbDpF5OtLnxK2+JAzWqTPF3vInNo/PhSWNUed+fnDOdFS
 0wwSfKLFDDZQebwU=
X-Received: by 2002:a5d:6707:: with SMTP id o7mr12762427wru.307.1630922623620; 
 Mon, 06 Sep 2021 03:03:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz1SSIuoaFZs42/pmCYU1L+4YRudwpLq8xu5hCDKzwGeDAgQyYYGTyLm/krtMc6RLV+ANZejA==
X-Received: by 2002:a5d:6707:: with SMTP id o7mr12762396wru.307.1630922623360; 
 Mon, 06 Sep 2021 03:03:43 -0700 (PDT)
Received: from thuth.remote.csb (pd9e831a0.dip0.t-ipconnect.de.
 [217.232.49.160])
 by smtp.gmail.com with ESMTPSA id f17sm8612498wrt.63.2021.09.06.03.03.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Sep 2021 03:03:42 -0700 (PDT)
Subject: Re: [PATCH v3 12/13] hw/s390x/s390-skeys: rename skeys_enabled to
 skeys_are_enabled
To: David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org
References: <20210903155514.44772-1-david@redhat.com>
 <20210903155514.44772-13-david@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <91390584-7889-cc79-a193-c7a5ce7f3066@redhat.com>
Date: Mon, 6 Sep 2021 12:03:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210903155514.44772-13-david@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -69
X-Spam_score: -7.0
X-Spam_bar: -------
X-Spam_report: (-7.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.832, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: "Jason J . Herne" <jjherne@linux.ibm.com>,
 Janosch Frank <frankja@linux.ibm.com>, Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Claudio Imbrenda <imbrenda@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 03/09/2021 17.55, David Hildenbrand wrote:
> ... and make it return a bool instead.
> 
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>   hw/s390x/s390-skeys-kvm.c       |  4 ++--
>   hw/s390x/s390-skeys.c           | 12 ++++++------
>   include/hw/s390x/storage-keys.h |  2 +-
>   3 files changed, 9 insertions(+), 9 deletions(-)

Reviewed-by: Thomas Huth <thuth@redhat.com>


