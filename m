Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 29A3F3023CE
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jan 2021 11:45:04 +0100 (CET)
Received: from localhost ([::1]:60642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l3zMk-0001SM-Qi
	for lists+qemu-devel@lfdr.de; Mon, 25 Jan 2021 05:45:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1l3zJ7-0006cl-Oq
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 05:41:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22361)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1l3zJ5-0002nm-9C
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 05:41:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611571274;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=asw2s7cenFJ/uUgvZKMi20Le2mNtMJryXi3LC+iAH3c=;
 b=DcieaUroenv0GyziXm0Eoy7aADFQQkQaxVq8MDGC0PI/E+tdhJvsrA2tlk6q7oeHvoPp/4
 EoM19qC6598I5nfZ69nOegwWByqvRIDWcbcfGmHPOD9rObggCbqzuEpBKkoUxdmdpTZcmk
 oCaUSM/n4fZsAqyl5+U8IMb5qOi1pOY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-41-mu7L2VdbMAmOPZSb9VwoyA-1; Mon, 25 Jan 2021 05:41:11 -0500
X-MC-Unique: mu7L2VdbMAmOPZSb9VwoyA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5C8EF193579D;
 Mon, 25 Jan 2021 10:41:10 +0000 (UTC)
Received: from work-vm (ovpn-114-3.ams2.redhat.com [10.36.114.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BD8261A8A0;
 Mon, 25 Jan 2021 10:41:08 +0000 (UTC)
Date: Mon, 25 Jan 2021 10:41:06 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Bin Meng <bmeng.cn@gmail.com>
Subject: Re: [PATCH v2 18/25] hw/sd: ssi-sd: Bump up version ids of
 VMStateDescription
Message-ID: <20210125104106.GC2925@work-vm>
References: <20210123104016.17485-1-bmeng.cn@gmail.com>
 <20210123104016.17485-19-bmeng.cn@gmail.com>
 <634d629a-999d-b1e2-28dc-f9b49f9918a7@amsat.org>
 <CAEUhbmVaeMeOcACyKg7q6dHVn+Pue7eKzu0RW7mGx5PQyVWg=g@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAEUhbmVaeMeOcACyKg7q6dHVn+Pue7eKzu0RW7mGx5PQyVWg=g@mail.gmail.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Qemu-block <qemu-block@nongnu.org>, Bin Meng <bin.meng@windriver.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Bin Meng (bmeng.cn@gmail.com) wrote:
> On Mon, Jan 25, 2021 at 12:59 AM Philippe Mathieu-Daud� <f4bug@amsat.org> wrote:
> >
> > On 1/23/21 11:40 AM, Bin Meng wrote:
> > > From: Bin Meng <bin.meng@windriver.com>
> > >
> > > With all these fixes and improvements, there is no way for the
> > > VMStateDescription to keep backward compatibility. We will have
> > > to bump up version ids.
> >
> > Unfortunately this breaks bisectability (think about downstream
> > distributions cherry-picking patches individually).
> >
> > I don't think there is a problem increasing 2 -> 3 -> 4 -> 5
> > (Cc'ed David in case). Could you respin increasing the version
> > on each VMState change?
> >
> 
> I definitely could be wrong, the reason I posted a single patch to
> upreve the version is that, I was under an impression that in each big
> release (like here 5.2.0 -> 6.0.0), the incompatibility version id
> should be bumped up once.
> It does not look correct to me that in a big release we bump up the
> version id for 10 times.

I think I agree; I don't think we've ever done it incrementally like
that before.

It would only break bisectability if you were cross-version migrating
during the bisect which is rare.

> Since this is a series to fix issues in the ssi-sd, I don't think it's
> practical for downstream to just cherry-pick some commits while
> leaving some other commits there.

Never underestimate downstream :-)
However, please add a comment when you're doing incrimentals like this -
e.g. a TODO or something showing that it's unfinished and you need the
remaining patches so people don't do it accidentally.

Dave

> Regards,
> Bin
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


