Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D1E1B359D94
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Apr 2021 13:40:40 +0200 (CEST)
Received: from localhost ([::1]:37276 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUpV9-0004mr-Tt
	for lists+qemu-devel@lfdr.de; Fri, 09 Apr 2021 07:40:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36044)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lUpSH-0004DW-Ps
 for qemu-devel@nongnu.org; Fri, 09 Apr 2021 07:37:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34173)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lUpSE-0000VO-KD
 for qemu-devel@nongnu.org; Fri, 09 Apr 2021 07:37:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617968256;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yO3dK0oLP5BZmR+srJTogXPeFQlvFKiXnU6A6RKyb/Q=;
 b=HDBsOfTE0yakYjshr0iE4E5J3areImqWYmm9lSeDdXo8xQUSkk1uJ1jN8+q7MofsqhNbma
 ZS8IhFdlaMRPO6eChZpbUFY6o7r3lhFwDld8bZ0/5gHz2AJ6/rQWamIMecLU0KbgKFqxaI
 oPhIDmVoA95XA4XiStyChTZjpHFSDyU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-479-YDfQy7qJPw-yA6wNjALhRg-1; Fri, 09 Apr 2021 07:37:33 -0400
X-MC-Unique: YDfQy7qJPw-yA6wNjALhRg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 01478107ACC7;
 Fri,  9 Apr 2021 11:37:32 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-115-63.ams2.redhat.com [10.36.115.63])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B588060BE5;
 Fri,  9 Apr 2021 11:37:30 +0000 (UTC)
Date: Fri, 9 Apr 2021 13:37:29 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Subject: Re: iotests 041 intermittent failure (netbsd)
Message-ID: <YHA8eZwYOkeGjnY+@merkur.fritz.box>
References: <CAFEAcA_-ARyPM0gB2Y_FKdUp9DYRNbz1GFU1AzFE9UZgjWNazQ@mail.gmail.com>
 <6cf410f9-6566-5921-fecc-6adaafbce068@redhat.com>
 <YHAs/+BEnkuPgWkO@redhat.com>
MIME-Version: 1.0
In-Reply-To: <YHAs/+BEnkuPgWkO@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Qemu-block <qemu-block@nongnu.org>,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 09.04.2021 um 12:31 hat Daniel P. Berrangé geschrieben:
> On Fri, Apr 09, 2021 at 12:22:26PM +0200, Philippe Mathieu-Daudé wrote:
> > On 4/9/21 11:43 AM, Peter Maydell wrote:
> > > Just hit this (presumably intermittent) 041 failure running
> > > the build-and-test on the tests/vm netbsd setup. Does it look
> > > familiar to anybody?
> > 
> > This one is known as the mysterious failure:
> > https://www.mail-archive.com/qemu-block@nongnu.org/msg73321.html
> 
> If the test has been flakey with no confirmed fix since Sept 2020,
> then it is well overdue to be switched to disabled by default, at
> least on the platforms it is known to be flakey on.

Why do you think this is the same problem? It is a completely different
error message, happening in a different test function. The problems
reported in September were fixed in the next version of the pull
request.

What Peter is reporting here is probably unrelated to NetBSD, but to
overloaded test hosts. QMPTestCase.pause_wait() uses a timeout of
3 seconds until it decides that the job probably has just failed to
pause at all, so that the test case wouldn't hang indefinitely on
failure.

We can increase the timeout, but of course, that doesn't guarantee that
we'll never hit it again on very slow test hosts.

Kevin


