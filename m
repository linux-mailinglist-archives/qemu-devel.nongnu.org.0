Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 729134D4807
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Mar 2022 14:27:28 +0100 (CET)
Received: from localhost ([::1]:48460 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSIpD-0002Mq-9i
	for lists+qemu-devel@lfdr.de; Thu, 10 Mar 2022 08:27:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48374)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nSIhs-0003W5-Bh
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 08:19:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:45692)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nSIhp-0002tV-0a
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 08:19:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646918387;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gT5ZGm+IS3mgtSwmwC8azqhlOMZeUc0EYZitkm4HrKA=;
 b=M+vyIPqohVNtX+C99l5oJQN/r88/d8I5kRCymc6xisOaDXk7QR51lLR/Fyjf0p3QNensma
 U5CuQ5CpprLjOdtnZ4TE1pnwDa1hH3hAhNNOSztX7sB5q4I6SdZhkg2PoCJJS26X5gr416
 YikqDbY3D7mIcPommOP1A6eV0jBz9bE=
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-663-wCQaUR0gM4aFom0pZQJTNA-1; Thu, 10 Mar 2022 08:19:46 -0500
X-MC-Unique: wCQaUR0gM4aFom0pZQJTNA-1
Received: by mail-pg1-f200.google.com with SMTP id
 z10-20020a634c0a000000b0036c5eb39076so2928813pga.18
 for <qemu-devel@nongnu.org>; Thu, 10 Mar 2022 05:19:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=gT5ZGm+IS3mgtSwmwC8azqhlOMZeUc0EYZitkm4HrKA=;
 b=eRpMfFQmFdWcKyIxubq74mY7rpzXnmvK+6VyU3yhXSvUzX1xkw4xcU85/bqeL6VKhD
 tH0rHdILQbAFRaS3c9eHO3JpqYSvCLkEeUBqBIUC/b6PHd4sXacRmZG63u6bGWCm9Q4M
 Mk2IZxMgc0fHwH4Aoeygs6U7uMlR5V0iaRtyx2h6pZn5Z+PQVDbjZPfm5hbHzglBQdf+
 xNp4JJQmDu2niTfOqtJlu/2BiAmBOnnHRJt8sjuJjUKdBeyji3zGgDblnZ9BNFXOieOP
 RogeSivgVikmzDtmLA1h2dOSkZeTxXjOSZM7ph5vk2UmX+gZfdyaQ4hR3owax7tUl8fS
 PUJw==
X-Gm-Message-State: AOAM530qdmNEtm/qidG/Ny358pa1AKXjpCzKLgfH9M59XaIivOu3K6Zt
 +uPyxPVNzQydKkgYOuEAOoKl82WQRTTDoWbE6cQMnt2K0V1DWgqvQq6NW47Fs3p0m0eu8NtPTsk
 iCE10mEwQy/hPb7w=
X-Received: by 2002:a05:6a00:301c:b0:4f6:f04e:ca34 with SMTP id
 ay28-20020a056a00301c00b004f6f04eca34mr4631302pfb.19.1646918385559; 
 Thu, 10 Mar 2022 05:19:45 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwCxYT3EI/SAD6NlvIRU6jzdbHNHwpllY3jDxBZ/cCu/Zln17BJQxX8DCXpranvzvVTmHo/XA==
X-Received: by 2002:a05:6a00:301c:b0:4f6:f04e:ca34 with SMTP id
 ay28-20020a056a00301c00b004f6f04eca34mr4631279pfb.19.1646918385271; 
 Thu, 10 Mar 2022 05:19:45 -0800 (PST)
Received: from xz-m1.local ([191.101.132.224])
 by smtp.gmail.com with ESMTPSA id
 h18-20020a056a00231200b004f72b290994sm7064327pfh.180.2022.03.10.05.19.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Mar 2022 05:19:44 -0800 (PST)
Date: Thu, 10 Mar 2022 21:19:40 +0800
From: Peter Xu <peterx@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philippe.mathieu.daude@gmail.com>
Subject: Re: QEMU device refcounting when device creates a container MR
Message-ID: <Yin67GyJWDn5N1ov@xz-m1.local>
References: <CAFEAcA87VaeHzW4qbHn+UKjh9gMQbKNcN5ytXBS1MUPSapdhYw@mail.gmail.com>
 <c7f6ffef-8ce1-6ee1-9ad7-a90ed1b54122@gmail.com>
MIME-Version: 1.0
In-Reply-To: <c7f6ffef-8ce1-6ee1-9ad7-a90ed1b54122@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 David Hildenbrand <david@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Mar 09, 2022 at 11:40:15AM +0100, Philippe Mathieu-Daudé wrote:
> Cc'ing David / Peter
> 
> On 9/3/22 11:33, Peter Maydell wrote:
> > Hi; does anybody know how device reference counting is supposed
> > to work when the device creates a "container" MemoryRegion which
> > it then puts some of its own subregions in to?
> > 
> > As far as I can see when you do memory_region_add_subregion it
> > increases the refcount on the owner of the subregion. So if a
> > device creates a container MR in its own init or realize method
> > and adds sub-MRs that it owns to that container, this increases
> > the refcount on the device permanently, and so the device won't
> > ever be deinited.
> > 
> > As a specific example, the usb-chipidea device does this in its
> > init method, so if you run the arm device-introspect-test under
> > leak-sanitizer it complains about a memory leak that happens
> > when the device is put through the "init-introspect-deref" cycle.

I'm not extremely sure about this, but.. does it mean that the device may
better put any of the add-subregion operations into realize() rather than
instance_init()?  Then in the unrealize() of the devices we should do
proper del-subregion to release these refcounts.

Otherwise indeed I don't see a good way to destroy the device anymore,
because the assumption is after device initialized, only with that will the
object_unref() continue to work on the device..

That means, perhaps in object_init_with_type() we should make sure the
object refcount==1 after the ->instance_init() call?

-- 
Peter Xu


