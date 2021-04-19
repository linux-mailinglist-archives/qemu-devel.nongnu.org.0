Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F6F336483F
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Apr 2021 18:31:22 +0200 (CEST)
Received: from localhost ([::1]:55370 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYWnx-0000dA-8J
	for lists+qemu-devel@lfdr.de; Mon, 19 Apr 2021 12:31:21 -0400
Received: from eggs.gnu.org ([209.51.188.92]:39718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1lYWlB-0007W0-BV
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 12:28:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50153)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1lYWl6-0004G3-M9
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 12:28:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618849703;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=OZ3IPSZAwNbgoqHGqDjFX7BXxDtqQb9MB1oZEKbzacA=;
 b=Nsx2pWH4wlTOEnKkDnTmgZved7GltXDTagSiDnMhxUtJTM/TnIlx79cclDrCebVT006QEi
 mBU7CyA6/XVcgO9QAK6/n1Mj0GklWxSDcSkN8cWSlP4i4RXfltnwx3ByP9WHMZwJQ/Uoc3
 fNHS0iIngz/BCnkYPe3VTIJaX9+QMPk=
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com
 [209.85.208.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-38-qZeEOYBHM56ROJg0Z7VwjQ-1; Mon, 19 Apr 2021 12:28:21 -0400
X-MC-Unique: qZeEOYBHM56ROJg0Z7VwjQ-1
Received: by mail-lj1-f198.google.com with SMTP id
 a14-20020a2e7f0e0000b02900b9011db00cso6420730ljd.8
 for <qemu-devel@nongnu.org>; Mon, 19 Apr 2021 09:28:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OZ3IPSZAwNbgoqHGqDjFX7BXxDtqQb9MB1oZEKbzacA=;
 b=BrBn8bmd2/vq2s189hm+bUwWPSKx6mTnsOm6UuomCh+TM2xZN1OdkaWVFDZ1EOumsz
 IJaNNFmocslkvernLJFuwvBKX/Z2NVKHCis8+ldOGNVmgfh3W1oFEWsPwZBemHhN+CxR
 P9PrU6aCiIkPUDvFRCy7X4czI85vtKELUxECYnLxx0ArmiLBfuNtxX7AqtC8OuPy6R9A
 BN/ooOCFsKvrsOayoDz9c+hx316ni61uyJu5EdG9FXZzDfpJ9A1a3KmW3SCwQC404u3e
 d1sf8vl2XLbt0XFQZt/4udZvVAE7cRqGbj9VW9WD35WuXhxWYtedbO+JBMyz0hb/MfmI
 2K+g==
X-Gm-Message-State: AOAM532s0q8ZRaugQnWvqNjIOQxPOdn3sY/oHnfFKsEVUxQm5qOPI4oH
 N1YSOKRFSap9mK7iN7zLzxd2xVcRbY++IC30L/fEY1TRKnQaQcbo77daqiA+ZiSrrs4iiwInLb+
 xcWF4N6BgaEl3pE9pDZ8b1pqffFpWYeU=
X-Received: by 2002:a05:6512:3618:: with SMTP id
 f24mr13188341lfs.34.1618849700290; 
 Mon, 19 Apr 2021 09:28:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx9VIpyjAH9G6ljTHY8jOTydTxkeVRFEMZ+1h+W5HthPSfYsSDBtIU4BQfbEIM7ISWfwjYXedfChIjv09pmMMY=
X-Received: by 2002:a05:6512:3618:: with SMTP id
 f24mr13188327lfs.34.1618849700077; 
 Mon, 19 Apr 2021 09:28:20 -0700 (PDT)
MIME-Version: 1.0
References: <20210415154402.28424-1-vkuznets@redhat.com>
 <CAFEAcA-u0XDFBuTaw2AcoP1NLSYNCSAEutXi+gfhb-qU=_UBGg@mail.gmail.com>
In-Reply-To: <CAFEAcA-u0XDFBuTaw2AcoP1NLSYNCSAEutXi+gfhb-qU=_UBGg@mail.gmail.com>
From: Eduardo Habkost <ehabkost@redhat.com>
Date: Mon, 19 Apr 2021 12:28:04 -0400
Message-ID: <CAOpTY_oCNcPjB6aHn6kp6Pb=TJSYKLuTOWyLD+1LP24w3F_c=A@mail.gmail.com>
Subject: Re: [PATCH RFC] migration: warn about non-migratable configurations
 unless '--no-migration' was specified
To: Peter Maydell <peter.maydell@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Juan Quintela <quintela@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Vitaly Kuznetsov <vkuznets@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, Apr 18, 2021 at 11:54 AM Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Thu, 15 Apr 2021 at 16:46, Vitaly Kuznetsov <vkuznets@redhat.com> wrote:
> > When a migration blocker is added nothing is reported to the user,
> > inability to migrate such guest may come as a late surprise. As a bare
> > minimum, we can print a warning. To not pollute the output for those, who
> > have no intention to migrate their guests, introduce '--no-migration'
> > option which both block the migration and eliminates warning from
>
> I'm not a fan. For a lot of people and configurations this
> is going to be "add an extra complaint from QEMU to a previously
> working configuration". We add too many of those already.

I agree that warning with machine types that never supported live
migration would be useless noise, but warning if using an explicit
versioned machine type sounds like a reasonable default (as long as
the warnings includes clear instructions on how to silence them).

--
Eduardo


