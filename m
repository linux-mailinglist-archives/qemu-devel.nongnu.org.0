Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C3AF8337F9C
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 22:26:30 +0100 (CET)
Received: from localhost ([::1]:41270 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKSpB-0000Ad-Sq
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 16:26:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1lKSnz-0007mi-QQ
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 16:25:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21776)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1lKSnw-0003aL-JI
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 16:25:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615497910;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=SI9Cd+F/EoZ6JbOVOMbCkIAvXnFvdA7omopBRBlkjtg=;
 b=DtauHmuz/nlHMKFeBdfT/YjTVSOYbOwDSIPFxp35XcnSPktIuPzWQs8mjjVKYLUhyEX2h8
 pUjGQZ+upQ6rKtZ0ffyq7q+GIk1r8VGtkNFuK3QnkOGVe03XiT/81wU6ytdimrSQy9m5b8
 pujxl/Hf9yaEKrd3lMUDic8Tm5SmKWw=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-170-tTpmMo-BPJazURVS7jWxug-1; Thu, 11 Mar 2021 16:25:09 -0500
X-MC-Unique: tTpmMo-BPJazURVS7jWxug-1
Received: by mail-qk1-f197.google.com with SMTP id b78so16658825qkg.13
 for <qemu-devel@nongnu.org>; Thu, 11 Mar 2021 13:25:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=SI9Cd+F/EoZ6JbOVOMbCkIAvXnFvdA7omopBRBlkjtg=;
 b=dg3SQ/ja6pEcwQOfxzsgcxlwsOBQ+5M5LdPDdJqg54UCfgk9tjQKxNG3oJ9VSLAFl6
 /mJOilUwmX+Wcx70+PUWZl6auccR7JJLSNOBagQydtu2kJQV+nNKY7lsxFW6Iczorr1w
 VizZu3tOMYYonjAwRz+jSmG5ewRz///am74ywu5AmqPMoSYs2SQ+DssHTu5Xk5Y4JTwX
 T8xxYvm0KjiJOHmeyNfDGPnjJG1yqVm+XoS+qUPhnscy+6dd5G86ncbOAru2VVbF5uei
 ZVpsgj23C8Z/O1YBBotGucpUYJbyttDRwjGEtebnQ8/gum8suTP+sDofMCK7DrJTQddF
 JxFQ==
X-Gm-Message-State: AOAM5336ouv6eawSEY2PHsxDWwkbY5d6rqB7L/tyaxBQOJAgivefmphx
 sk8EwYcgMi+ohClCMAQ3SXKWVV4Qhvf4hlFuLVyBJVNXq5M/hW456CamnvKDBkopOzmv0pzL/2h
 ed3TdiUIR7SsK4OU=
X-Received: by 2002:ac8:7281:: with SMTP id v1mr1626263qto.302.1615497908773; 
 Thu, 11 Mar 2021 13:25:08 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwoEkJJ0ZACUEQEKnxUE67lnlmb2xAEhk3N6n/rcaLS9W6OEdtCTH/pbjV13y8kR5HcMIMwNw==
X-Received: by 2002:ac8:7281:: with SMTP id v1mr1626251qto.302.1615497908537; 
 Thu, 11 Mar 2021 13:25:08 -0800 (PST)
Received: from xz-x1 ([142.126.89.138])
 by smtp.gmail.com with ESMTPSA id e190sm2859925qkd.122.2021.03.11.13.25.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Mar 2021 13:25:07 -0800 (PST)
Date: Thu, 11 Mar 2021 16:25:05 -0500
From: Peter Xu <peterx@redhat.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v3 02/12] softmmu/physmem: Fix ram_block_discard_range()
 to handle shared anonymous memory
Message-ID: <20210311212505.GJ194839@xz-x1>
References: <20210308150600.14440-1-david@redhat.com>
 <20210308150600.14440-3-david@redhat.com>
 <YEpH1FAabcILd38K@work-vm>
 <df216a57-d45a-9563-5e88-0f2ebf6b0a7e@redhat.com>
 <20210311171153.GF194839@xz-x1>
 <26d2c57a-971d-3abd-6ec3-1a38fb47a398@redhat.com>
 <20210311172236.GG194839@xz-x1>
 <d0a57921-61ab-82a5-ed58-061961dfa6a3@redhat.com>
MIME-Version: 1.0
In-Reply-To: <d0a57921-61ab-82a5-ed58-061961dfa6a3@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
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
Cc: Marcel Apfelbaum <mapfelba@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Stefan Weil <sw@weilnetz.de>, Murilo Opsfelder Araujo <muriloo@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Greg Kurz <groug@kaod.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Igor Kotrasinski <i.kotrasinsk@partner.samsung.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Mar 11, 2021 at 06:41:29PM +0100, David Hildenbrand wrote:
> It zaps the page tables but the shmem pages are still referenced (in the
> pagecache AFAIU). On next user space access, you would fill the page tables
> with the previous content.
> 
> That's why MADV_DONTNEED works properly on private anonymous memory, but not
> on shared anonymous memory - the only valid references are in the page
> tables in case of private mappings (well, unless we have other references
> like GUP etc.).

For some reason I thought anonymous shared memory could do auto-recycle, but
after a second thought what you said makes perfect sense.

> 
> 
> I did wonder, however, if there is benefit in doing both:
> 
> MADV_REMOVE followed by MADV_DONTNEED or the other way around. Like, will
> the extra MADV_DONTNEED also remove page tables and not just invalidate/zap
> the entries. Doesn't make a difference functionality-wise, but
> memory-consumption-wise.
> 
> I'll still have to have a look.

I saw your other email - that'll be another topic of course.  For now I believe
it's not necessary, and your current patch looks valid.

I just hope when qemu decides to disgard the range, we're sure the rdma
mremap() region have been unmaped - iiuc that's the only use case of that.
Otherwise data would corrupt.

-- 
Peter Xu


