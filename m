Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AF5716503E
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Feb 2020 21:50:52 +0100 (CET)
Received: from localhost ([::1]:60214 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j4WJ1-0002zT-5A
	for lists+qemu-devel@lfdr.de; Wed, 19 Feb 2020 15:50:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52385)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peterx@redhat.com>) id 1j4WGv-0000xk-O3
 for qemu-devel@nongnu.org; Wed, 19 Feb 2020 15:48:42 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peterx@redhat.com>) id 1j4WGu-0008DE-PD
 for qemu-devel@nongnu.org; Wed, 19 Feb 2020 15:48:41 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:21715
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <peterx@redhat.com>) id 1j4WGu-0008Cn-KP
 for qemu-devel@nongnu.org; Wed, 19 Feb 2020 15:48:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582145320;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XFNX6tDRaXrgXgMMcKMRipZjjvCc04b6ac/Wo7nmVOc=;
 b=hUZxEbS5Skbv6hseV5CemJpfTIzoGzAeoG7XZ1M6Jej5+kenRvOChSWbeNjNQNSYNfXTl8
 m312z+4PS3zZ72zVxGwUDCobbbGIX5Zyv0zp1PgECdz8PUG/pPncrjitrmpGNTEKmMCDPd
 FII9trqJnHEMv9e7A95J02Szec7a0h8=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-395-nhfVsok0NNO61bFyJFPutA-1; Wed, 19 Feb 2020 15:48:38 -0500
Received: by mail-qk1-f199.google.com with SMTP id t186so1153703qkf.9
 for <qemu-devel@nongnu.org>; Wed, 19 Feb 2020 12:48:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=8nrw7VA0jkDJOVgmiF6p8w3mNhNpkky1q8ZRckBM8NM=;
 b=RRLRd/9+6Kj5ZEGTaZhi20bvM3bMESYdylljQL+Z/dWU7BtIzbaG38E9w3avb/rPQ7
 J2K/157VeaviZogenThyiClk0VO5veZWwb7lapCUvLdCHDt6JS8NABKYEk7NnvGOA/PO
 HV6fpz0Zq6FCcRE+tvWg7eQXh1DMejrNN0LXRs45PuVmNeKxUK+2yEGMybmTC/4jG9KO
 0l2UA5ldDfGgKezugZTS5dYCylGDdCVND+RBnsA0kEo9SymxWy86e95ocwcB6yIaX1uk
 psqCamh/jDhWbqaEeD65FJqRGbBZysRb15YTorYifo4A/7vLzNJSTxSzTSXXF8er9D33
 b22g==
X-Gm-Message-State: APjAAAWQ67C6LgE+0bWCYxMnQdVcHXfX7xqqjRsdveqIDzzpdF5EPOCe
 0IYMIBkAM/a5V/rdlUqCeQ22SShL6j6CIbTNXd/iivcj9oqJ6yulK+RJ6nzGQvP7mDbs2MkBjer
 dm4vhkAxt3Xr3WZo=
X-Received: by 2002:a37:2f07:: with SMTP id v7mr23628711qkh.261.1582145317839; 
 Wed, 19 Feb 2020 12:48:37 -0800 (PST)
X-Google-Smtp-Source: APXvYqzyZczgcUBm4B2xNGl/yyb9rLPjrWYpgjF3SlYlPfPe+nkKwqOd6Tdv/tHfzagq8cavfzZjeA==
X-Received: by 2002:a37:2f07:: with SMTP id v7mr23628699qkh.261.1582145317658; 
 Wed, 19 Feb 2020 12:48:37 -0800 (PST)
Received: from xz-x1 ([104.156.64.75])
 by smtp.gmail.com with ESMTPSA id i4sm445540qkf.111.2020.02.19.12.48.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Feb 2020 12:48:37 -0800 (PST)
Date: Wed, 19 Feb 2020 15:48:35 -0500
From: Peter Xu <peterx@redhat.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v1 02/13] stubs/ram-block: Remove stubs that are no
 longer needed
Message-ID: <20200219204835.GD37550@xz-x1>
References: <20200219161725.115218-1-david@redhat.com>
 <20200219161725.115218-3-david@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200219161725.115218-3-david@redhat.com>
X-MC-Unique: nhfVsok0NNO61bFyJFPutA-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 qemu-devel@nongnu.org, "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Feb 19, 2020 at 05:17:14PM +0100, David Hildenbrand wrote:
> Current code no longer needs these stubs to compile. Let's just remove
> them.
>=20
> Cc: Richard Henderson <rth@twiddle.net>
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: Eduardo Habkost <ehabkost@redhat.com>
> Cc: Peter Xu <peterx@redhat.com>
> Signed-off-by: David Hildenbrand <david@redhat.com>

Reviewed-by: Peter Xu <peterx@redhat.com>

--=20
Peter Xu


