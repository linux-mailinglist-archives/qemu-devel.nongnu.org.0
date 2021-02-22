Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C1A23219A6
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 15:04:15 +0100 (CET)
Received: from localhost ([::1]:37994 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEBos-00087K-9K
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 09:04:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40858)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lEBmy-0006qK-5H
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 09:02:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22800)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lEBmw-000419-F4
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 09:02:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614002533;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=op+9JKQx7do30T0+Ulbk4XiryqIhJ1lVIQ79ucXXWzQ=;
 b=ZcEYiuQnJUONMFBwYWvhQPVcKZ+9jIfXR7VgiWAB897hPxMK6auwqyD6T52KpsodmnMK4F
 PZPblLeIHtDDRD8o4wlLFb9j5M4kxvOSJwA7nIk0KE/FDdMRZKfj58zaXMC29H412EbhpH
 vNFdoMDOkVWvU8mIeTKoPNLTUd1Rbr4=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-213-r8aBvDDVOW2QoAKxso6sLA-1; Mon, 22 Feb 2021 09:02:11 -0500
X-MC-Unique: r8aBvDDVOW2QoAKxso6sLA-1
Received: by mail-wr1-f72.google.com with SMTP id e13so6136364wrg.4
 for <qemu-devel@nongnu.org>; Mon, 22 Feb 2021 06:02:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:subject:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=op+9JKQx7do30T0+Ulbk4XiryqIhJ1lVIQ79ucXXWzQ=;
 b=L7mlutocWAS6mi5vsUM5K7rRUat6Wzmto47gyxPrM2N0It8m6G5qFzfNMDHCxpsWw0
 hqoUwcg+q+rs2qo4cVXWMYyXrPe7KdfvgEpUT+GEFdToX+9XcVb4Lc3WyBYDgP5YKjcS
 SQunZnGM5gzwnBSERVZemGKKhBnCFcBVnYm7KVbtUzlYx53eYkr0GlPkoesnlbszCOwW
 x5hayfXMNXICCIglYQC8eKzllCsn/NJBNjXuX/H/p0gL+g4z0jFuo8yGyJVpNkEiQGi7
 JxeBxLbGHGrLz7PR8gUP5XlkNU4XjE6GIQm44zkRfRR1hPAT/YXI24yzNRRXswkFFewV
 /nBA==
X-Gm-Message-State: AOAM533Hfaw1m3LhdJMrEg3IEiUjOn5rfcY71THo6kijWy7p2b1x/+2R
 45Dk/jR1+jDcKt13gmCn24lwKQe8NClpWP27iOjU5gQ8IdklMQgfb95Ch3LCWtuzjY09aF0jGGh
 XEMLECPezwElljQY=
X-Received: by 2002:a05:600c:3588:: with SMTP id
 p8mr20126440wmq.71.1614002530304; 
 Mon, 22 Feb 2021 06:02:10 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyJRSFZiG8kRR0EztngZmI15w4YinkZjUs/eTDjHRthJfDUWvh6077C5SFkXEN44Q164e3omA==
X-Received: by 2002:a05:600c:3588:: with SMTP id
 p8mr20126408wmq.71.1614002530074; 
 Mon, 22 Feb 2021 06:02:10 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id t198sm26726742wmt.7.2021.02.22.06.02.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Feb 2021 06:02:09 -0800 (PST)
To: David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org
References: <20210222115708.7623-1-david@redhat.com>
 <20210222115708.7623-10-david@redhat.com>
 <b5be291b-5864-4852-50bd-e75352ba8876@redhat.com>
 <d64fdd53-6868-15fd-ea81-fa26e153eced@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v6 09/12] softmmu/physmem: Don't use atomic operations in
 ram_block_discard_(disable|require)
Message-ID: <61237335-b03f-cb89-c0be-03fc3058c13b@redhat.com>
Date: Mon, 22 Feb 2021 15:02:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <d64fdd53-6868-15fd-ea81-fa26e153eced@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Pankaj Gupta <pankaj.gupta.linux@gmail.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Wei Yang <richard.weiyang@linux.alibaba.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 Auger Eric <eric.auger@redhat.com>,
 Pankaj Gupta <pankaj.gupta@cloud.ionos.com>,
 teawater <teawaterz@linux.alibaba.com>, Igor Mammedov <imammedo@redhat.com>,
 Marek Kedzierski <mkedzier@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 22/02/21 14:33, David Hildenbrand wrote:
>> Also, uncoordinated require is unused, and therefore uncoordinated
>> disable is also never going to block anything.  Does it make sense to
>> keep it in the API?
> 
> Right, "ram_block_discard_require()" is not used yet. I am planning on 
> using it in virtio-balloon context at some point, but can remove it for 
> now to simplify.
> 
> ram_block_uncoordinated_discard_disable(), however, will block 
> virtio-balloon already via ram_block_discard_is_disabled(). (yes, 
> virtio-balloon is ugly)

Oops, I missed that API.

Does it make sense to turn the API inside out, with the 
coordinated/uncoordinated choice as an argument and the start/finish 
choice in the name?

enum {
     RAM_DISCARD_ALLOW_COORDINATED = 1,
};

bool ram_discard_disable(int flags, Error **errp);
void ram_discard_enable(int flags);
int ram_discard_start(bool coordinated, Error **errp);
void ram_discard_finish(bool coordinated);

Paolo


