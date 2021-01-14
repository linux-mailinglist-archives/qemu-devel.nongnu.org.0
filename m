Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C18622F5F89
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 12:12:49 +0100 (CET)
Received: from localhost ([::1]:33852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l00Ya-0006Lp-S1
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 06:12:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45926)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <abologna@redhat.com>)
 id 1l00Wx-00054n-Op
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 06:11:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23259)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <abologna@redhat.com>)
 id 1l00Wu-0007ty-QJ
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 06:11:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610622662;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gmVhRbQsZIXrmNDsA8zHdQeOdDRfuZZy23lf7PgOLiI=;
 b=GaiupwgxJjfYvdVqhfQntoKjpHjLYbECECQ/kDgXpOKzKbjiIrrbIiRpkhzwPWuRb6iFbP
 ks23QxVPUUZ0H/7pCSFHt63XkkzmilmzPXm36y/+UYJ8jDQpGoJxMqbu0vrAxb+xRJKXey
 yezvkm+JuUcpFmFMYgXmNxwjPN2IVyk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-577-x2grOtg3O1i91koXAfgHRw-1; Thu, 14 Jan 2021 06:10:59 -0500
X-MC-Unique: x2grOtg3O1i91koXAfgHRw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 27C45100F341;
 Thu, 14 Jan 2021 11:10:58 +0000 (UTC)
Received: from harajuku.usersys.redhat.com (unknown [10.40.195.137])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A8F0A60C47;
 Thu, 14 Jan 2021 11:10:52 +0000 (UTC)
Message-ID: <a232018c476425641f8dbf2f8edfcb37a3313054.camel@redhat.com>
Subject: Re: minimal "zero conf" build dockerfiles for fedora:latest and
 alpine:latest
From: Andrea Bolognani <abologna@redhat.com>
To: John Snow <jsnow@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>, Paolo
 Bonzini <pbonzini@redhat.com>
Date: Thu, 14 Jan 2021 12:10:50 +0100
In-Reply-To: <88f80fb6-62ad-77ca-4047-b1c79fd6a006@redhat.com>
References: <a2f5077b-ae74-2b39-4fb8-70d29dd549eb@redhat.com>
 <a56f2df6-867e-2542-734c-95c1ae3acf88@redhat.com>
 <6a08e9f5-7cd7-c2c8-4b61-5466a4ffb2ec@redhat.com>
 <20210113100956.xuyvmxayh5xytja3@sirius.home.kraxel.org>
 <88f80fb6-62ad-77ca-4047-b1c79fd6a006@redhat.com>
User-Agent: Evolution 3.36.5 (3.36.5-2.fc32)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=abologna@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=abologna@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
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
Cc: Alex =?ISO-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Philippe =?ISO-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 2021-01-13 at 13:31 -0500, John Snow wrote:
> On 1/13/21 5:09 AM, Gerd Hoffmann wrote:
> > > I don't like Perl really, but there's a chicken-and-egg problem between
> > > detecting Python and using it to print the configure help script.  For
> > > configure-time tasks, Perl has the advantage that "#! /usr/bin/env perl"
> > > just works.
> > 
> > Assuming perl is actually installed, the world seems to shift to python.
> > On a minimal fedora install python is present but perl is not ...
> > 
> > On the other hand git depends on perl, so it is probably pretty hard to
> > find a developer workstation without perl installed, so maybe that
> > doesn't matter much for the time being.
> 
> I agree that it doesn't matter much right now, Though I don't always 
> have git installed in containers when I am doing builds. It will become 
> more common to encounter environments that are missing "obvious" 
> dependencies.

Note that Fedora has a git-core package that doesn't depend on Perl
while still providing more than enough git for something like a CI
build job.

As a data point, the libvirt project has made it an explicit goal[1]
to remove all usage of Perl in favor of Python. We're not quite there
yet, but at this point there are only a very tiny handful of Perl
scripts remaining in the repository.


[1] https://libvirt.org/strategy.html
-- 
Andrea Bolognani / Red Hat / Virtualization


