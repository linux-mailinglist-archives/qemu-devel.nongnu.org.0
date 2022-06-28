Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 836B155C01E
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 12:17:54 +0200 (CEST)
Received: from localhost ([::1]:39586 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o68I5-0007dI-Ba
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 06:17:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47896)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1o6880-0003ed-UO
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 06:07:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54437)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1o687v-0005z6-AM
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 06:07:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656410841;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6cQfWuHqX0TL3axxpAYMJZu1xvqH7GkcdvBUE6HiAYs=;
 b=IdXJIzQlRSAZPnPRilWyWFBkM/3lRR4QYcKl+OFl4eOzK97GB8PVIKIGqv7sqp/vd8DtSu
 panpOVvcur9BRmcn6jbgKQq9jsCkWAF42MBH2kW9Wc6Uo4Ova3XtEqcxsIHkxynKX+pylR
 eTafQsHsSUxQwFjhs+2g5a7lNqDkLHE=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-218-oJUAA0wRMJuj9jUG86sWig-1; Tue, 28 Jun 2022 06:07:19 -0400
X-MC-Unique: oJUAA0wRMJuj9jUG86sWig-1
Received: by mail-wm1-f69.google.com with SMTP id
 6-20020a1c0206000000b003a02cd754d1so4876093wmc.9
 for <qemu-devel@nongnu.org>; Tue, 28 Jun 2022 03:07:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=6cQfWuHqX0TL3axxpAYMJZu1xvqH7GkcdvBUE6HiAYs=;
 b=MhlI9bnocvBKxQKvzQ5pROddQxdyaXQUZp9CGSsFftkil0SZrOwIvZNX4qEXJlvfo+
 kpb5vIL2Vb0n+ytjKseKG0MxTpdWRH/x4B/Y+9RxmYJG0J8iea+97EkaspOKgymqrIhf
 zfv4NVXvHGMV9Pzr2Z8fTAzMbT+pUxqImtc8nL+S53bVQlypvTqOunSj6t3vOt2zWvi0
 3iCouU/JKxKxsQS7yqVQMLIxe+N1wRDJbvGqC+7QEXYkZ5J+A2NBLPhivOHs1NgsIOd0
 A4KMvGS96f/mVg8fmjiXarLel66jRNHqjjS9JNjlR9vkVCBrJAerlhOqtwIqhA8BTkIt
 wHAg==
X-Gm-Message-State: AJIora9katMtDiz2zMmmjkBahlSzzjdiDF5v7psCBhRCfZpC8AJfnjth
 DvD4lgj9J+S76pucizZTTN8tEU9Ne5vCFS5IVGA6wX3/QQP8kE4r0bVvC13wJDcqFsNZI1voOSu
 3yGfnpJUVi2rIMuU=
X-Received: by 2002:adf:fb49:0:b0:21a:3ccc:fb77 with SMTP id
 c9-20020adffb49000000b0021a3cccfb77mr16488915wrs.280.1656410838544; 
 Tue, 28 Jun 2022 03:07:18 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uoQqJoRhY1MxjPZffKwY2wkWAUr4FO1tkeyyiM+ZyDXTYbmrPT9u3jK4hDiw8gOze2OGGScA==
X-Received: by 2002:adf:fb49:0:b0:21a:3ccc:fb77 with SMTP id
 c9-20020adffb49000000b0021a3cccfb77mr16488897wrs.280.1656410838322; 
 Tue, 28 Jun 2022 03:07:18 -0700 (PDT)
Received: from redhat.com ([2.52.23.204]) by smtp.gmail.com with ESMTPSA id
 d9-20020a05600c3ac900b003a03be22f9fsm17739737wms.18.2022.06.28.03.07.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jun 2022 03:07:17 -0700 (PDT)
Date: Tue, 28 Jun 2022 06:07:13 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Cc: Ani Sinha <ani@anisinha.ca>, Thomas Huth <thuth@redhat.com>,
 John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org,
 Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, imammedo@redhat.com
Subject: Re: venv for python qtest bits? (was: Re: [PATCH 11/12]
 acpi/tests/bits: add README file for bits qtests)
Message-ID: <20220628060510-mutt-send-email-mst@kernel.org>
References: <CAARzgww9KKx7fTw7WMMTb3PCQgdwJwS34X0jHhQ+41OrMWZazg@mail.gmail.com>
 <4e1c2a45-eb53-e210-1ce1-05837bf1e7c3@redhat.com>
 <20220628030749-mutt-send-email-mst@kernel.org>
 <7bf5976e-8277-7c78-f412-44f7be8754f4@redhat.com>
 <YrqyWhu8ThAcUGI4@redhat.com>
 <CAARzgwyZNAYK3p16wjeykoCB9C+tmznY+OZAM-vw+Pn_4CdMqQ@mail.gmail.com>
 <Yrq6anPW60FkjmK6@redhat.com>
 <59150265-44ed-0b14-df1c-42e3f2e97b7e@redhat.com>
 <CAARzgwzST+3PjEomfbweeB0KYnmO0yoxVJWiV9+9A_h32swnyw@mail.gmail.com>
 <YrrSFig7Qo/PKqNx@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YrrSFig7Qo/PKqNx@redhat.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jun 28, 2022 at 11:04:30AM +0100, Daniel P. Berrangé wrote:
> If it is actually booting a real guest image (from biosbits) and interacting
> with it, then it does feel like the scope of this testing is more appropriate
> to QEMU's avocado framework than qtest, especially given the desire to use
> python for it all.
> 
> With regards,
> Daniel

I feel avocado is directed towards booting full fledged guest OS.
It makes it much easier to figure out guest issues but it also
prone to false positives and is harder to debug as a result.
Booting a minimal image like this shouldn't require that.

-- 
MST


