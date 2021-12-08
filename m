Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EDCE646CE8A
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Dec 2021 08:53:26 +0100 (CET)
Received: from localhost ([::1]:52520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1murlW-0002bW-1r
	for lists+qemu-devel@lfdr.de; Wed, 08 Dec 2021 02:53:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52268)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1murit-0000ep-B3
 for qemu-devel@nongnu.org; Wed, 08 Dec 2021 02:50:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:46644)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1murir-00040u-7U
 for qemu-devel@nongnu.org; Wed, 08 Dec 2021 02:50:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638949840;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LWVR/aQRZWiP9UpZpsnwx/8YnfFSRmBx5ZaiBk58Dzo=;
 b=hllx1hDO/yeGloW/1PusRzykMb9hkABQ7LAwuN5yT1fnOPN2IOdv6E2ucuBk9XzYJOKC4H
 gJWLqaWrQ1iPWqe4E829q/1TCkWKVZUOkv0APwOCr8cHqnI/c54DyoI3tl6DxdsBSa/H1q
 cBBZMfj3IpmO7u/YTEVcrBUgUFWLFA4=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-497-640d4w0eP6yOgJvzsrQZyg-1; Wed, 08 Dec 2021 02:50:37 -0500
X-MC-Unique: 640d4w0eP6yOgJvzsrQZyg-1
Received: by mail-wm1-f72.google.com with SMTP id
 i131-20020a1c3b89000000b00337f92384e0so2591222wma.5
 for <qemu-devel@nongnu.org>; Tue, 07 Dec 2021 23:50:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=LWVR/aQRZWiP9UpZpsnwx/8YnfFSRmBx5ZaiBk58Dzo=;
 b=EukLMVjTyyrRkaJbKgx1rL3PqZDyGF/XBz99k2IuIWt2MRpClvUnu+oD/Za4pz7yQd
 N7XPa2SQ+ynHnF7bBl3eq3lu64rBEGrQ5hH73iBcHBJCImgM78EcOM7iaqwgH6rmS0tP
 hIV25eGMvWD0nPOJ5Cq7DtAO6flox2yjP2ZIvR77fksWmrePeeN5RdXyBCGHVWwOZg7U
 pX6gUhK0bMCePv/hW+4jO4oRkeuFaJUULcKNnoiHQJNE4UIJexM5il0XVOrwECjOkKSL
 ByLxzEXoUHcAtTPoJpfpemH6bHbI8bhdOM4EJ0a6LI28tEHQirFG4MCofmtjsUmA8EWO
 N0eA==
X-Gm-Message-State: AOAM532sroP7uqKOcyGKK/+5aTINmFDsvNkDRARzuwb8q4WSD8OFUfI8
 h0lIpLoDr65a+xzAZGok/q4GgAswTDh/eEPxcxr9PBNRvo8GtLL/KWbNCAtnEh1wdflfEZuNlnU
 A/lSZd10KV6p9pcE=
X-Received: by 2002:a05:600c:1ca4:: with SMTP id
 k36mr14122266wms.169.1638949836094; 
 Tue, 07 Dec 2021 23:50:36 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxnUYYoPP3LuU05gWullLn8pp2oC6VPVlq7/9iqCRbyq52vd32jLIKmjCjPVg7NsxJdnljudg==
X-Received: by 2002:a05:600c:1ca4:: with SMTP id
 k36mr14122238wms.169.1638949835916; 
 Tue, 07 Dec 2021 23:50:35 -0800 (PST)
Received: from [10.33.192.183] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id h16sm2077153wrm.27.2021.12.07.23.50.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Dec 2021 23:50:35 -0800 (PST)
Message-ID: <6764b29d-3885-ec0e-0b90-f0c05a544571@redhat.com>
Date: Wed, 8 Dec 2021 08:50:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v5 3/4] failover: fix unplug pending detection
To: "Michael S. Tsirkin" <mst@redhat.com>, Laurent Vivier <lvivier@redhat.com>
References: <20211119090718.440793-1-lvivier@redhat.com>
 <20211119090718.440793-4-lvivier@redhat.com>
 <20211208023603-mutt-send-email-mst@kernel.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20211208023603-mutt-send-email-mst@kernel.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -58
X-Spam_score: -5.9
X-Spam_bar: -----
X-Spam_report: (-5.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.619,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.44, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Michael Roth <michael.roth@amd.com>,
 qemu-devel@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Paolo Bonzini <pbonzini@redhat.com>, Jens Freimann <jfreimann@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 08/12/2021 08.36, Michael S. Tsirkin wrote:
> On Fri, Nov 19, 2021 at 10:07:17AM +0100, Laurent Vivier wrote:
>> Failover needs to detect the end of the PCI unplug to start migration
>> after the VFIO card has been unplugged.
>>
>> To do that, a flag is set in pcie_cap_slot_unplug_request_cb() and reset in
>> pcie_unplug_device().
>>
>> But since
>>      17858a169508 ("hw/acpi/ich9: Set ACPI PCI hot-plug as default on Q35")
>> we have switched to ACPI unplug and these functions are not called anymore
>> and the flag not set. So failover migration is not able to detect if card
>> is really unplugged and acts as it's done as soon as it's started. So it
>> doesn't wait the end of the unplug to start the migration. We don't see any
>> problem when we test that because ACPI unplug is faster than PCIe native
>> hotplug and when the migration really starts the unplug operation is
>> already done.
>>
>> See c000a9bd06ea ("pci: mark device having guest unplug request pending")
>>      a99c4da9fc2a ("pci: mark devices partially unplugged")
>>
>> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
>> Reviewed-by: Ani Sinha <ani@anisinha.ca>
> 
> Hmm.  I think this one may be needed for this release actually.
> Isolate from testing changes and repost?

You merged it already here:

  https://gitlab.com/qemu-project/qemu/-/commit/9323f892b39d133eb6

so we should be fine :-)

  Thomas


