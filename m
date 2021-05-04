Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 19F9B372860
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 12:00:03 +0200 (CEST)
Received: from localhost ([::1]:57144 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldrqT-0008NV-Co
	for lists+qemu-devel@lfdr.de; Tue, 04 May 2021 06:00:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53928)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1ldrop-0007aA-Uk
 for qemu-devel@nongnu.org; Tue, 04 May 2021 05:58:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38221)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1ldrom-0000hd-R1
 for qemu-devel@nongnu.org; Tue, 04 May 2021 05:58:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620122295;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5C5bZjDVWvBs0UJpbXOvc6miY5DRy39ZrmW2vLUmEzc=;
 b=VUZwYUdERR39Trd+XZL2wsUcN8cAYkmFRvkdHfvZ9KYD5dSZDRVG0bJj5l5FUB6Y7oi5xO
 b5KiUgitvbb34ruv9uXZbmlWWCVxR5p8oj+EmlPL5vxytslcFiiXpYxL0GdaCKhBPOT7n9
 NIozwbHm7PLOr+/eigc81/RzcFkhDEU=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-161-up-Fi1-uOb2V9HzTRPGPBw-1; Tue, 04 May 2021 05:58:11 -0400
X-MC-Unique: up-Fi1-uOb2V9HzTRPGPBw-1
Received: by mail-ej1-f69.google.com with SMTP id
 z13-20020a1709067e4db02903a28208c9bdso2914177ejr.0
 for <qemu-devel@nongnu.org>; Tue, 04 May 2021 02:58:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=5C5bZjDVWvBs0UJpbXOvc6miY5DRy39ZrmW2vLUmEzc=;
 b=mJBKzpMXrmiS9TE3sI9BRmMSbDc8McGiouSeJ3+GReCd8haKPbpsYE7rOZYNOvI/tX
 gVfpk2MdDd04DeXytqDO/O9T9NWo6SpuA83a11Gz5o+SKwYpa273bhfOpja5EG2zG5NH
 xJB6cUhmU+SXyC1Ywpath4kxJO9T4gdbzkwIIdxnACw4SzI+K5b6kk0DZpcq9qXwVXo1
 u9dcOxrwBVVrVF9blYDyHUMVrgxYp9h0aXpSd8T15qqz9iBYi3383F+c3FMkzquQ6AB2
 u5O9p9a/WcmG0xGZJ7lSKQiu0NAd6FrIZAs5OZb5ofQRJVchp5sugzaOsQlrPJgJpv5G
 TZVg==
X-Gm-Message-State: AOAM532UsLNao9Lk3wEGatQMFj+r9gMBwmEyqPJyNolCWVRxjqPg83Ht
 w4bcbu1TsiCt/zJ6LE7uNm/DxXLh+HcPSoRRFcfPwoQzABbX8r8LUMja96xpFmqOC4eDFPWayzv
 Q109nV15r5k7jdY4=
X-Received: by 2002:a17:906:6544:: with SMTP id
 u4mr21007192ejn.455.1620122290389; 
 Tue, 04 May 2021 02:58:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxSrCpQAoXi49OI9AMpo1NU5P9hR7Oww3QZuML7uOE4wRVriFGeqen/qw69/vYJttstNRzXiQ==
X-Received: by 2002:a17:906:6544:: with SMTP id
 u4mr21007181ejn.455.1620122290245; 
 Tue, 04 May 2021 02:58:10 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id r18sm1119585ejd.106.2021.05.04.02.58.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 May 2021 02:58:09 -0700 (PDT)
Subject: Re: [PATCH v7 10/15] hostmem: Wire up RAM_NORESERVE via "reserve"
 property
To: David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org
References: <20210428133754.10713-1-david@redhat.com>
 <20210428133754.10713-11-david@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <039b34c2-07e1-49da-d325-ae1b67636374@redhat.com>
Date: Tue, 4 May 2021 11:58:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210428133754.10713-11-david@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
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
Cc: Marcel Apfelbaum <mapfelba@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, Peter Xu <peterx@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Greg Kurz <groug@kaod.org>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Murilo Opsfelder Araujo <muriloo@linux.ibm.com>,
 Igor Mammedov <imammedo@redhat.com>, Nitesh Lal <nilal@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 28/04/21 15:37, David Hildenbrand wrote:
> @@ -545,6 +545,9 @@
>   # @share: if false, the memory is private to QEMU; if true, it is shared
>   #         (default: false)
>   #
> +# @reserve: if true, reserve swap space (or huge pages) if applicable
> +#           default: true)

Missing open parenthesis and "since 6.1", otherwise the whole series 
looks good, thanks!

Paolo

> +#


