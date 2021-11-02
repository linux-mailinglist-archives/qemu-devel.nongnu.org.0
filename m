Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B372442506
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 02:18:40 +0100 (CET)
Received: from localhost ([::1]:46326 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhiRj-0001A1-A7
	for lists+qemu-devel@lfdr.de; Mon, 01 Nov 2021 21:18:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39372)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mhiPV-00085M-P0
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 21:16:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56232)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mhiPQ-0006kE-2q
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 21:16:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635815772;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ukpNWPFjQu+RbOgrB0kKAd/ZDEuy1/Bhn7bQ6cpWi2M=;
 b=Jt4dAdeV/vDCjjf6LQ79Lkzz+gG8Kb3JDRSkBaURYt/sJZHZRh1Z0I0ZR4yd5L20W7s0mS
 0WlmvJciJOLkn2AFcF0NJTLqAJMMMpvLJZNpqYPiwYlFndlzeVSRFVQdJIn5Ju461hqN5J
 5P+45iyr23T20IR3K8vsoBTmmvY9+JI=
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-531-vO9q0hgyPHOnXxfEhMuz6Q-1; Mon, 01 Nov 2021 21:16:11 -0400
X-MC-Unique: vO9q0hgyPHOnXxfEhMuz6Q-1
Received: by mail-pf1-f200.google.com with SMTP id
 d7-20020a056a0010c700b0047e4c951cc0so7796061pfu.10
 for <qemu-devel@nongnu.org>; Mon, 01 Nov 2021 18:16:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ukpNWPFjQu+RbOgrB0kKAd/ZDEuy1/Bhn7bQ6cpWi2M=;
 b=x5wcp1hnkzyfMAoqpTPqBvLNXFFYR3ilh39y8qjc0Aev970ToMupMOdYGv533/TTe4
 2i6eOHhT4IZ3vAdo04/IXbWG7JS9RtMVNvIoJyduMFydJi2AYAyQ5tZCmIkjZp68CPzy
 WfHD76yFFUt19wu5oN8Fu8KT13Xj2bt2iT+cug7do8bsBn28cP1MLl5qJZ5Bx2myEGKx
 96GYAMqK1beUF9ANTngiqa+Mi0Fi3MPSBOdHHQETu0uYb4Akdfti1c58iXwdGhQ6Rvl0
 WNMvcTQUJJJWA2J3p8U4JybFFcWpBqo43t5937XAcQcZaIKjIETYZ5hA86EUDt2Pelik
 uUtQ==
X-Gm-Message-State: AOAM531PSOk+YpACSp0UsDRAhJzB78HVv/8Q4iyOWrvRJDyIwN2hYXfR
 My/cE6yjN2KqAyFcVg1LowSRNqX8c1Hb80iiA3Lg4pI1Il08GWDf6THaYHvw+hA3Id1GM3CLqE6
 zEHzLp5T0KtVx+Dc085riXcK6UtxzpE8T5mctS1CnNdOfvhEXXTsacM0CvjX++UXb
X-Received: by 2002:a17:902:a70e:b0:141:a01d:9d6c with SMTP id
 w14-20020a170902a70e00b00141a01d9d6cmr25437546plq.84.1635815769824; 
 Mon, 01 Nov 2021 18:16:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzP1pSPbD0p2hIpl0oHeedKwJqMkrEdH0dPD1C7X65xmcKG/h6xmtVueoy/SXVyNZErEIxENQ==
X-Received: by 2002:a17:902:a70e:b0:141:a01d:9d6c with SMTP id
 w14-20020a170902a70e00b00141a01d9d6cmr25437482plq.84.1635815769343; 
 Mon, 01 Nov 2021 18:16:09 -0700 (PDT)
Received: from xz-m1.local ([94.177.118.4])
 by smtp.gmail.com with ESMTPSA id md6sm560841pjb.22.2021.11.01.18.16.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Nov 2021 18:16:08 -0700 (PDT)
Date: Tue, 2 Nov 2021 09:15:59 +0800
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH v2 0/5] pci/iommu: Fail early if vfio-pci detected before
 vIOMMU
Message-ID: <YYCQuEJEST485pTp@xz-m1.local>
References: <20211028043129.38871-1-peterx@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211028043129.38871-1-peterx@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.734,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, David Hildenbrand <david@redhat.com>,
 Jason Wang <jasowang@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Eric Auger <eric.auger@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Oct 28, 2021 at 12:31:24PM +0800, Peter Xu wrote:
> Note that patch 1-4 are cleanups for pci subsystem, and patch 5 is a fix to
> fail early for mis-ordered qemu cmdline on vfio and vIOMMU.  Logically they
> should be posted separately and they're not directly related, however to make
> it still correlated to v1 I kept them in the same patchset.
> 
> In this version I used pre_plug() hook for q35 to detect the ordering issue as
> Igor suggested, meanwhile it's done via object_resolve_path_type() rather than
> scanning the pci bus as Michael suggested.
> 
> Please review, thanks.

Michael,

Would you consider review/pick patches 1-4 first?  The last patch needs further
discussion, and I would like to address it separately in the future.

Thanks,

-- 
Peter Xu


