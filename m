Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E597831525C
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 16:07:41 +0100 (CET)
Received: from localhost ([::1]:38624 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9Uc8-0002d0-Vh
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 10:07:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60944)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1l9UZJ-0001Fh-8d
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 10:04:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29217)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1l9UZD-0002Lg-Ch
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 10:04:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612883078;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Sx+ycVewHnpilQyDSHUPAKNMZOHzS/Kc532RYF+bC0E=;
 b=CU8m0Z+7yYZxHn7GGohCohpUnoz+5NGiVNxQ6PF6j0Zh5hA3pzlSP1VZexgwFs5eJ6nxTx
 c33LauYR/NlKlFI/5vDODZc5+lJ/ZDhQ7dESrWMwJY06OOP2wrjOmoyDcv3zhdGpeVyK9M
 XAvL19IJLKpVj87NKkPEY1qZMiDXffI=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-105-IBWN8xmFOTWdVb4PORzzYw-1; Tue, 09 Feb 2021 10:04:34 -0500
X-MC-Unique: IBWN8xmFOTWdVb4PORzzYw-1
Received: by mail-wr1-f70.google.com with SMTP id l10so17599625wry.16
 for <qemu-devel@nongnu.org>; Tue, 09 Feb 2021 07:04:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=Sx+ycVewHnpilQyDSHUPAKNMZOHzS/Kc532RYF+bC0E=;
 b=SblLbq+PgjmRY6dx3s9ARvGVEhOYct37tojROWBiEbTb/tXHe1I7BFzzhzN2kE0x96
 trwwegjLNs1gpuobTr2K6Q7wBCo99//wrzPhypB8ZHbaWG2g7yQmt5DeRHo+ORqzSJu7
 Tt0iqH96KWOsuUDHjlp7hhsVYdfSG8IbY/r4sGmBnWXDh7M022aP7eltSCJfjkEvo1sA
 MlBWxwZ+RUxim+nSy6rA+Uz6iOg6sAv5zEjg5pq5ihZEMwsMVtHApjvRTJglyvAubpPH
 KJ9ekY2RPsbDxghciF2t/SzWaPv0pR5aH0J4dMCtW4mTQRYizOf4VS4azZEsou3PMzaa
 DKqw==
X-Gm-Message-State: AOAM5315aeT6T+Q1B5lEgM5DthFjJJkPd1Wn46iGfCUZRoO95H/KQVma
 XkC5/raNTTNgG3p2BVXagJ5kipz80+T4lh3PpAyUU7Rd3C7W6w8+pIgB1ZhyI+dEwKFpWIZj5VD
 5Qr3GeBPY3776HzU=
X-Received: by 2002:a05:600c:4857:: with SMTP id
 j23mr3907839wmo.31.1612883073423; 
 Tue, 09 Feb 2021 07:04:33 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyQ4AlC9a/K5tK6acVjk0gZb05g5z6uKU/ZT07hvhe3+yR7ShrySzIr56JKksks42k7rn3jRw==
X-Received: by 2002:a05:600c:4857:: with SMTP id
 j23mr3907809wmo.31.1612883073178; 
 Tue, 09 Feb 2021 07:04:33 -0800 (PST)
Received: from redhat.com (bzq-79-180-2-31.red.bezeqint.net. [79.180.2.31])
 by smtp.gmail.com with ESMTPSA id x18sm5123538wmi.8.2021.02.09.07.04.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Feb 2021 07:04:32 -0800 (PST)
Date: Tue, 9 Feb 2021 10:04:30 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Subject: Re: [PATCH 0/3] virtio-net: graceful drop of vhost for TAP
Message-ID: <20210209095553-mutt-send-email-mst@kernel.org>
References: <20210204202915.15925-1-yuri.benditovich@daynix.com>
 <20210209093201-mutt-send-email-mst@kernel.org>
 <20210209145105.GP1166421@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210209145105.GP1166421@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.57,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: yan@daynix.com, Yuri Benditovich <yuri.benditovich@daynix.com>,
 jasowang@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Feb 09, 2021 at 02:51:05PM +0000, Daniel P. Berrangé wrote:
> On Tue, Feb 09, 2021 at 09:34:20AM -0500, Michael S. Tsirkin wrote:
> > On Thu, Feb 04, 2021 at 10:29:12PM +0200, Yuri Benditovich wrote:
> > > This set of patches introduces graceful switch from tap-vhost to
> > > tap-no-vhost depending on guest features. Before that the features
> > > that vhost does not support were silently cleared in get_features.
> > > This creates potential problem of migration from the machine where
> > > some of virtio-net features are supported by the vhost kernel to the
> > > machine where they are not supported (packed ring as an example).
> > 
> > I still worry that adding new features will silently disable vhost for people.
> > Can we limit the change to when a VM is migrated in?
> 
> Some management applications expect bi-directional live migration to
> work, so taking specific actions on incoming migration only feels
> dangerous. 

Could you be more specific?

Bi-directional migration is currently broken
when migrating new kernel->old kernel.

This seems to be the motivation for this patch, though I wish
it was spelled out more explicitly.

People don't complain much, but I'm fine with fixing that
with a userspace fallback.


I'd rather not force the fallback on others though: vhost is generally
specified explicitly by user while features are generally set
automatically, so this patch will make us override what user specified,
not nice.


> IMHO if the features we're adding cannot be expected to exist in
> host kernels in general, then the feature should defualt to off
> and require explicit user config to enable.
> Downstream distros which can guarantee newer kernels can flip the
> default in their custom machine types if they desire.
> 
> Regards,
> Daniel

Unfortunately that will basically mean we are stuck with no new features
for years. We did what this patch is trying to change for years now, in
particular KVM also seems to happily disable CPU features not supported
by kernel so I wonder why we can't keep doing it, with tweaks for some
corner cases.

userspace and kernel not being in 100% sync wrt features is not
a corner case though, and switching backends seems like too big
a hammer.

> -- 
> |: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
> |: https://libvirt.org         -o-            https://fstop138.berrange.com :|
> |: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


