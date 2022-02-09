Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 33C6D4AF00A
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Feb 2022 12:40:23 +0100 (CET)
Received: from localhost ([::1]:37254 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHlKg-0007dx-BZ
	for lists+qemu-devel@lfdr.de; Wed, 09 Feb 2022 06:40:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53360)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1nHlD8-0003Ez-RW
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 06:32:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:53978)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1nHlD5-00073g-4F
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 06:32:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644406349;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=32GIZ5YTh+Q/cB96MQrFU5f1KAH21GWn6uAP2AdhsAc=;
 b=G15OBtoXnNSuQk59MGaUe/b0fPlyV/O1jHEsUHgEna13itje/i/t8/SPvcr0IeTc6nW38m
 iMF8pi+/8W0RF5DcpsYdH6yBqihyZuvu/XSo3D5ryvsSwFFGarDIipeh+EDiQyA2AyXyTd
 RHouAOb/DPvqjoEjwgfFj2DnltsKH1g=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-403-44TyLR2RNwKQyOWkagYTJQ-1; Wed, 09 Feb 2022 06:32:28 -0500
X-MC-Unique: 44TyLR2RNwKQyOWkagYTJQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 j8-20020adfa548000000b001e33074ac51so993319wrb.11
 for <qemu-devel@nongnu.org>; Wed, 09 Feb 2022 03:32:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=32GIZ5YTh+Q/cB96MQrFU5f1KAH21GWn6uAP2AdhsAc=;
 b=DPFrhjNrA+Ok6qif3t+aSX0TaaupmEPFUJjXOtBtS2ScMZrxcJoKl4K38oJFsBGFra
 PAHxcYB8qtTOwOxUJAX8tb+sZ8YFBaa3oulkbcdR7QhH33ZMFmipSdLGFoyRoj4WHcfg
 o6O3rbtXLUoj1GPvO47tIvv9PM5MT52SaVcjffj1eKsT71ZBTmbrBJoWcPK+D7F2afHG
 8boK7cqALP77CfFAB7Dv8ow/fShsPcztJ5Q1hquLldLi99P2oBx27OcS8zZ6JeN8ePAl
 3sVE6HTwqC/yx9ILzHh4jGsddAIdnSefARs+lrt6hxYV/UM5EJQBqw/T5hCSXRGoaUr5
 FQyw==
X-Gm-Message-State: AOAM530ILtpN1gHhzNq6uTJPR1jUy+9dJ4nDuRe7YWWf1DhE6k6XbfNv
 i4pKNbBVh7lhDVXqVtkgfsvCHszZdVrB4fy9Vf74DZmo0/rjv7VYuqna4694y8zzdTLtJ29AtHl
 xC9a8sXTVVNh54VU=
X-Received: by 2002:a05:6000:4b:: with SMTP id
 k11mr1707209wrx.144.1644406346862; 
 Wed, 09 Feb 2022 03:32:26 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwqtLFjr8nzOQD6hTBSdfXr5jcqT/vBKK73yy5LwJB3Lvb6oHGZx7sEJxjhZRe6wdrc/gbYmw==
X-Received: by 2002:a05:6000:4b:: with SMTP id
 k11mr1707192wrx.144.1644406346666; 
 Wed, 09 Feb 2022 03:32:26 -0800 (PST)
Received: from ?IPv6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id az21sm4529849wmb.11.2022.02.09.03.32.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Feb 2022 03:32:26 -0800 (PST)
Subject: Re: [PATCH v2 2/4] virtio-iommu: Default to bypass during boot
To: Cornelia Huck <cohuck@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
References: <20220127142940.671333-1-jean-philippe@linaro.org>
 <20220127142940.671333-3-jean-philippe@linaro.org>
 <87wni5tftq.fsf@redhat.com> <20220208160642-mutt-send-email-mst@kernel.org>
 <87r18cthwd.fsf@redhat.com>
From: Eric Auger <eric.auger@redhat.com>
Message-ID: <6dbd9ef6-99da-850a-114d-53486c91a05f@redhat.com>
Date: Wed, 9 Feb 2022 12:32:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <87r18cthwd.fsf@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Reply-To: eric.auger@redhat.com
Cc: lvivier@redhat.com, Jean-Philippe Brucker <jean-philippe@linaro.org>,
 thuth@redhat.com, qemu-devel@nongnu.org, pasic@linux.ibm.com,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

On 2/9/22 12:10 PM, Cornelia Huck wrote:
> On Tue, Feb 08 2022, "Michael S. Tsirkin" <mst@redhat.com> wrote:
>
>> On Tue, Feb 08, 2022 at 06:42:57PM +0100, Cornelia Huck wrote:
>>> On Thu, Jan 27 2022, Jean-Philippe Brucker <jean-philippe@linaro.org> wrote:
>>>
>>>> @@ -988,9 +1025,9 @@ static void virtio_iommu_device_realize(DeviceState *dev, Error **errp)
>>>>      virtio_add_feature(&s->features, VIRTIO_IOMMU_F_INPUT_RANGE);
>>>>      virtio_add_feature(&s->features, VIRTIO_IOMMU_F_DOMAIN_RANGE);
>>>>      virtio_add_feature(&s->features, VIRTIO_IOMMU_F_MAP_UNMAP);
>>>> -    virtio_add_feature(&s->features, VIRTIO_IOMMU_F_BYPASS);
>>>>      virtio_add_feature(&s->features, VIRTIO_IOMMU_F_MMIO);
>>>>      virtio_add_feature(&s->features, VIRTIO_IOMMU_F_PROBE);
>>>> +    virtio_add_feature(&s->features, VIRTIO_IOMMU_F_BYPASS_CONFIG);
>>> Hm. In the other patch, you say that you don't support cross-version
>>> migration (I assume across QEMU versions?)
>> I missed that ... where does it say this?
> In bf447d9b-c039-ccdc-f24f-ab8b56c1b196@redhat.com and follow-ups
> (unless I misread that; maybe it's more about this concrete boundary and
> not generally?)

We were considering the virtio-iommu QEMU device currently isn't used
for production yet, as far as we know, because we were missing the ACPI
integration.
So we envisionned to not care about mig subsections and just add the new
field in the VMState.

would that make sense?

Thanks

Eric

>
>>> Because changing the feature
>>> set will be guest-visible, and would need some compat handling if you
>>> plan to support this.


