Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9017E196CF2
	for <lists+qemu-devel@lfdr.de>; Sun, 29 Mar 2020 13:30:30 +0200 (CEST)
Received: from localhost ([::1]:36444 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jIW97-0006UH-6r
	for lists+qemu-devel@lfdr.de; Sun, 29 Mar 2020 07:30:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44831)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mst@redhat.com>) id 1jIW8K-0005r6-6D
 for qemu-devel@nongnu.org; Sun, 29 Mar 2020 07:29:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mst@redhat.com>) id 1jIW8H-0008CC-4Y
 for qemu-devel@nongnu.org; Sun, 29 Mar 2020 07:29:38 -0400
Received: from us-smtp-delivery-74.mimecast.com ([216.205.24.74]:27142)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mst@redhat.com>) id 1jIW8G-0008AG-VZ
 for qemu-devel@nongnu.org; Sun, 29 Mar 2020 07:29:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1585481375;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=E1l21f/d65p8xh2G7DJxhgm90ss/5zVKEfAbG/GWoKc=;
 b=JrYgAq6h5+5FcG7yIh1D+1vWzc9L6SxLiSEHavwZpj+PUkbU3ksInDDPSxQ6o2Hi8enNdK
 9/MYnYdqcb7YZWDK+6ZMXCPPKnp1agh+yrN+2Kc9P+UQmfMe7R0V3E1io/fsepVz+nVDvF
 DD8JaA0WmovlypYQ4h2a22oqyuVMb20=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-77-SpNFPdvdMkmJU1qdv0YPYg-1; Sun, 29 Mar 2020 07:29:33 -0400
X-MC-Unique: SpNFPdvdMkmJU1qdv0YPYg-1
Received: by mail-wr1-f70.google.com with SMTP id f8so8347805wrp.1
 for <qemu-devel@nongnu.org>; Sun, 29 Mar 2020 04:29:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=4t6zn157Rsi3X0Qs0+oQekOjIh2UfKw4khmtCeybC6I=;
 b=M3EKmmV3QlpTAz6Hnk1lUUxrmMs/ma09llvYInde7LzypgXJaCyLwEH3dL3IZLd1vc
 TrKdHBMI4ahU/DmPODKArjcdLl4PEDgONIg1uZqD8tCCz7PrRTnM2oEZTElFdRZ2R8dq
 wCI9Zf7I3FMCIMW96Lk35r6kHZlFNRaPM5CskfCq0EZ21WtYKFToDU59aE5ldmS8rKlM
 RO5Kymgf4+V8bmv389M+ji6hREdAFbDMDJ8tKUbAlkm6rJr+hcwjdR01w9Ni3WM8PVRN
 oj38C/p24bQrj+AqOo8yapwMLFf5BID7uoK7NUdwXs2/GrdJ+dRChh6ZCMSuyXsNR7D+
 hkdw==
X-Gm-Message-State: ANhLgQ01OMxjE0sNyKdzxq13WG6C+lx+/IcerGQT02Mwg5TFJ7sjaroA
 6Qvw8cvlndh4cbuS5yxxeEAk9salJdHdd1D5lux50DAMOVxzgDkqmKZTUkxsjJWRVfSlfg7Tr+5
 eO4SS7nbyJOjKwzM=
X-Received: by 2002:a1c:1dcf:: with SMTP id d198mr8136977wmd.121.1585481372791; 
 Sun, 29 Mar 2020 04:29:32 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vv+udqrXOxz+V9q1yOr+fEf6AIi6KfsbovhjDmdgZ0c8DRqKnj+7+gtYUCx4JdvpzTuUEKw4g==
X-Received: by 2002:a1c:1dcf:: with SMTP id d198mr8136955wmd.121.1585481372566; 
 Sun, 29 Mar 2020 04:29:32 -0700 (PDT)
Received: from redhat.com (bzq-79-183-139-129.red.bezeqint.net.
 [79.183.139.129])
 by smtp.gmail.com with ESMTPSA id j5sm16242633wrr.47.2020.03.29.04.29.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Mar 2020 04:29:32 -0700 (PDT)
Date: Sun, 29 Mar 2020 07:29:29 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Liran Alon <liran.alon@oracle.com>
Subject: Re: [PATCH v2 2/3] acpi: Add Windows ACPI Emulated Device Table (WAET)
Message-ID: <20200329072047-mutt-send-email-mst@kernel.org>
References: <20200313145009.144820-1-liran.alon@oracle.com>
 <20200313145009.144820-3-liran.alon@oracle.com>
 <20200316112851.2364eb46@redhat.com>
 <14ca89b0-b272-9efd-42f3-18d1224c679b@oracle.com>
MIME-Version: 1.0
In-Reply-To: <14ca89b0-b272-9efd-42f3-18d1224c679b@oracle.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 216.205.24.74
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
Cc: ehabkost@redhat.com, qemu-devel@nongnu.org, pbonzini@redhat.com,
 Elad Gabay <elad.gabay@oracle.com>, Igor Mammedov <imammedo@redhat.com>,
 rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On Fri, Mar 27, 2020 at 06:14:26PM +0300, Liran Alon wrote:
> As almost two weeks have passed since this Reviewed-By comment, can I ass=
ume
> this series is done from my perspective and ready to be merged?
> As I haven't seen a Reviewed-By for the rest of the patches of this serie=
s.
>=20
> Thanks,
> -Liran

I'll queue it for merge after the release. If possible please ping me
after the release to help make sure it didn't get dropped.

Thanks!

--=20
MST


