Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE71D140C6E
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Jan 2020 15:28:14 +0100 (CET)
Received: from localhost ([::1]:58268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1isSbd-0004pq-Kn
	for lists+qemu-devel@lfdr.de; Fri, 17 Jan 2020 09:28:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56124)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mst@redhat.com>) id 1isSZM-0003BJ-KO
 for qemu-devel@nongnu.org; Fri, 17 Jan 2020 09:25:56 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mst@redhat.com>) id 1isSZE-0005LD-Bv
 for qemu-devel@nongnu.org; Fri, 17 Jan 2020 09:25:48 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:24950
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mst@redhat.com>) id 1isSZE-0005Kr-7A
 for qemu-devel@nongnu.org; Fri, 17 Jan 2020 09:25:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579271143;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/Boh6ZzttXP3+L2xZkxgerI9MmxuMTIctfUEPU1y8L0=;
 b=JHlStdytaogL1Oeys5nQIjafOBJSJZuRaTvhmNHO/r13t1WJSy7QXWavvBoHfpdLOxxvZJ
 SEiVlnKuJ/bqr/VXdluzkS52rV71i8fF7Z/1Uf9W+TwJcXw/YASAo6ATq5YUmdgpvY39OK
 pwIVBH9KOfhtf1B/YqQuaKejJj+01ZU=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-270-gN1iYVdjNm6tz5T1GZ8Iiw-1; Fri, 17 Jan 2020 09:25:40 -0500
Received: by mail-qt1-f199.google.com with SMTP id d9so16011165qtq.13
 for <qemu-devel@nongnu.org>; Fri, 17 Jan 2020 06:25:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=7Mu2GJWts1/hqljDYThWaRGcxb7CYk/t2DJC8Vg+AvM=;
 b=UZXujT+HHO09d62BCl7/lOQI+SdZIdXotrv2qu6m0P6sTZri1X1ZeU8ixHr3RCurOh
 1htnPyhGlMrB0YM8DF0+jTRsj/seVj9qPJE1G0JQUvsS7uupB8KXlKiGp+VSrk7duKki
 LHS4j4QHQyftNbo55MVRt/qeOcIz3EoduBO0RZTPh6Yto7Xl+RURUywzn7xskwez4MEs
 6PzeeLK0Jqs5NnrrX8wRF3sRtGlT37bHjVqdmAs5HBuoma7t5aXwmjQ9AH31Vruacs4W
 gYYQKd5HKxsOf3Ut7sMcvg2s2w38UwHY5j05Dk5gaqD/CwzoHJinWIHkaPNm/Fxn3H4+
 rxyg==
X-Gm-Message-State: APjAAAVgtw+nUShwDxS5h4LSkvetsF2E7fKfQGv9WcJJU4sRZUnGV7gw
 Sdyiimhyn6UOuatBzF2BNmo+BaomXg/nwoA0lIOhzW9GOvu574Vck3jfLySzVpt9DMBHLfelx4l
 VZmTxzgEmzxArvQ4=
X-Received: by 2002:ad4:4d50:: with SMTP id m16mr7925572qvm.186.1579271139896; 
 Fri, 17 Jan 2020 06:25:39 -0800 (PST)
X-Google-Smtp-Source: APXvYqyj51us75PTe/hSzQYMhHneQCiAkwvh9JKhGX3IEUzxfee05PD4688Mzb/Z0HUGnpbS68ZKqA==
X-Received: by 2002:ad4:4d50:: with SMTP id m16mr7925557qvm.186.1579271139681; 
 Fri, 17 Jan 2020 06:25:39 -0800 (PST)
Received: from redhat.com (bzq-79-179-85-180.red.bezeqint.net. [79.179.85.180])
 by smtp.gmail.com with ESMTPSA id b35sm13099352qtc.9.2020.01.17.06.25.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jan 2020 06:25:38 -0800 (PST)
Date: Fri, 17 Jan 2020 09:25:34 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v3 2/2] vhost: Only align sections for vhost-user
Message-ID: <20200117092147-mutt-send-email-mst@kernel.org>
References: <20200116202414.157959-1-dgilbert@redhat.com>
 <20200116202414.157959-3-dgilbert@redhat.com>
 <4bf72509-3e60-0d78-c2ba-665a71a978e1@redhat.com>
 <20200117083232-mutt-send-email-mst@kernel.org>
 <ca54fc82-828b-158b-fadb-07abfbb9418f@redhat.com>
MIME-Version: 1.0
In-Reply-To: <ca54fc82-828b-158b-fadb-07abfbb9418f@redhat.com>
X-MC-Unique: gN1iYVdjNm6tz5T1GZ8Iiw-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.61
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
Cc: jasowang@redhat.com, vkuznets@redhat.com,
 "Dr. David Alan Gilbert \(git\)" <dgilbert@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jan 17, 2020 at 02:58:47PM +0100, Paolo Bonzini wrote:
> On 17/01/20 14:40, Michael S. Tsirkin wrote:
> > We don't really need v2 just to add a field. Compatibility is maintaine=
d
> > using feature bits. Adding that is a subject for another patch.
> > But I'm not sure I understand why does remote need to know about alignm=
ent.
> > This patch seems to handle it locally ...
>=20
> Because the remote vhost here will not be able to use the synic regions.
>  If it did, it would have the same overlap problem as vhost-kernel.
>=20
> The alignment is needed because, even if you are mapping only [768k,1M)
> of a 2M hugepage, you need to mmap [0,2M).  You can then discard the
> rest, but IIUC if you only mmap [768k,1M) then the kernel will fail the
> mmap.
>=20
> Paolo

So right now remote will query the fd passed to get the alignment.
You are basically saying it's not enough in some cases?

--=20
MST


