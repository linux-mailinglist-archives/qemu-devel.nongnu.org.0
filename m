Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE5344D57A0
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Mar 2022 02:52:08 +0100 (CET)
Received: from localhost ([::1]:58646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSURr-0005vQ-GK
	for lists+qemu-devel@lfdr.de; Thu, 10 Mar 2022 20:52:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35688)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nSUOW-0003xJ-OA
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 20:48:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:30519)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nSUOV-0003kB-As
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 20:48:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646963318;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KUBhCRf0UbKeMnOHsHWyvp+P5+9TjYONQuXeBh4Jow8=;
 b=PJdcx00OQ0gxiDa7P7WyS31w7t7043l3k5SVtDfIWKvGWgwsvxkbyxWLQPQ4RKHIoPV5Vw
 6TSUr6IIePgMlW8rBvaWNoBgQ9lXDbWzJpAvmn/c2+LeTK6+d9E4W29DJW5nrewX91JtO+
 U7AnM9xf57tMI24C4XIQ95Oig+pUksc=
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-407-f2igaSi6OzCEt7qpgUOPUQ-1; Thu, 10 Mar 2022 20:48:37 -0500
X-MC-Unique: f2igaSi6OzCEt7qpgUOPUQ-1
Received: by mail-pg1-f198.google.com with SMTP id
 u4-20020a63b544000000b0037c62d8b0ecso3895803pgo.13
 for <qemu-devel@nongnu.org>; Thu, 10 Mar 2022 17:48:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=KUBhCRf0UbKeMnOHsHWyvp+P5+9TjYONQuXeBh4Jow8=;
 b=XDHFkS07cXqUVRAMuLzokfX8parlGdpFEGe/tT6uoQXSKzUUjIPM8/fjP7mn9vlXdH
 hXvnMS3tFo2dL4be+UjpanfIZqkdEUciEIneRP/g2QYYYKFEHIB1rH7o1rxkrMUQkPdM
 nKCc7PbuvFqSY6QM5LTK4ucCpma879f05aIz5jubEPnBgRGV74w/xn1Maq+ErolQkQ1b
 /jbwl7SzpnHsl9EIewyK3eWUWNXWzRzJZbOaKng+FfGOx2HWLscY85gpsTqdEOJV+sqv
 BmfI7z4AOo6gw+Dqwbyb4600+4oNVh4u4SwNW4RwOw+5jjoW9UBiaY2r6jhF5OTvw8s1
 feag==
X-Gm-Message-State: AOAM532lmtthhnVN53R2XdpuBDhCeqZiCWuPqlK2cOZFPi9K4M9x4JqH
 TbnWgoY9Bw5Wc0bT1BW6dqKLwVDFdPdpogT9AdiwN+lBVmpUDqRtA2Mj/hxzle1ADPiY1pAw3hm
 qXt/VEGE8/IltczM=
X-Received: by 2002:a17:90a:ba07:b0:1bc:a0fd:faf with SMTP id
 s7-20020a17090aba0700b001bca0fd0fafmr8250114pjr.194.1646963316668; 
 Thu, 10 Mar 2022 17:48:36 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxRZp31G1F//+/9R7eYkhWcKn/IZ9ch/vYUorvZ6NZj0CZyk0jlQWRvtAbM2yy4Pa8f4yFnRA==
X-Received: by 2002:a17:90a:ba07:b0:1bc:a0fd:faf with SMTP id
 s7-20020a17090aba0700b001bca0fd0fafmr8250099pjr.194.1646963316458; 
 Thu, 10 Mar 2022 17:48:36 -0800 (PST)
Received: from xz-m1.local ([191.101.132.227])
 by smtp.gmail.com with ESMTPSA id
 z13-20020a63e10d000000b003733d6c90e4sm6407233pgh.82.2022.03.10.17.48.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Mar 2022 17:48:36 -0800 (PST)
Date: Fri, 11 Mar 2022 09:48:30 +0800
From: Peter Xu <peterx@redhat.com>
To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Subject: Re: [PATCH v2 04/18] tests: print newline after QMP response in
 qtest logs
Message-ID: <YiqqbgnspD69xJb6@xz-m1.local>
References: <20220310171821.3724080-1-berrange@redhat.com>
 <20220310171821.3724080-5-berrange@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220310171821.3724080-5-berrange@redhat.com>
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Mar 10, 2022 at 05:18:07PM +0000, Daniel P. Berrangé wrote:
> The QMP commands have a trailing newline, but the response does not.
> This makes the qtest logs hard to follow as the next QMP command
> appears in the same line as the previous QMP response.
> 
> Reviewed-by: Thomas Huth <thuth@redhat.com>
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>

Reviewed-by: Peter Xu <peterx@redhat.com>

-- 
Peter Xu


