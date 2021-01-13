Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C78DD2F49C1
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jan 2021 12:20:13 +0100 (CET)
Received: from localhost ([::1]:41930 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzeCC-0005ZD-DW
	for lists+qemu-devel@lfdr.de; Wed, 13 Jan 2021 06:20:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36324)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kzeAx-00054K-Ko
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 06:18:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30118)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kzeAu-0003tQ-RG
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 06:18:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610536731;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gdvYtv1xdlisbH3XjQt9HymOpxBIAjiVqxKPIYMYHpk=;
 b=TFPdv3fKkr/19lLCqYexI4xhtsCLrJzHYGCdHKILlWCGAKm42GljKrxRYt1CQFTL1uun1u
 9+PGs2IFiqGCX5SoU5O7Mn54NWoiXqD7ExUliJYq+Bs8+EwzZWTaI2afO0R+sfDPq58PUV
 tGuZI+2E3kwocH2dhHRlVtQk2N1Nx0I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-225-8bLqJYsVMjmIzmbVoHd-ZQ-1; Wed, 13 Jan 2021 06:18:49 -0500
X-MC-Unique: 8bLqJYsVMjmIzmbVoHd-ZQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E945C100C60C;
 Wed, 13 Jan 2021 11:18:47 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-114-55.ams2.redhat.com [10.36.114.55])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6858F5D9EF;
 Wed, 13 Jan 2021 11:18:45 +0000 (UTC)
Date: Wed, 13 Jan 2021 12:18:43 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH v6 07/11] iotests: add findtests.py
Message-ID: <20210113111843.GA5928@merkur.fritz.box>
References: <20210109122631.167314-1-vsementsov@virtuozzo.com>
 <20210109122631.167314-8-vsementsov@virtuozzo.com>
 <20210112164211.GB6075@merkur.fritz.box>
 <8f4a54a9-25d2-2b5e-dbda-a67696534cbd@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <8f4a54a9-25d2-2b5e-dbda-a67696534cbd@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org, mreitz@redhat.com,
 den@openvz.org, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 13.01.2021 um 11:37 hat Vladimir Sementsov-Ogievskiy geschrieben:
> 12.01.2021 19:42, Kevin Wolf wrote:
> > Am 09.01.2021 um 13:26 hat Vladimir Sementsov-Ogievskiy geschrieben:
> > > +    def __init__(self, test_dir: Optional[str] = None) -> None:
> > > +        self.groups = defaultdict(set)
> > > +
> > > +        with chdir(test_dir):
> > > +            self.all_tests = glob.glob('[0-9][0-9][0-9]')
> > > +            self.all_tests += [f for f in glob.iglob('tests/*')
> > > +                               if not f.endswith('.out') and
> > > +                               os.path.isfile(f + '.out')]
> > > +
> > > +            for t in self.all_tests:
> > > +                with open(t) as f:
> > > +                    for line in f:
> > > +                        if line.startswith('# group: '):
> > > +                            for g in line.split()[2:]:
> > > +                                self.groups[g].add(t)
> > 
> > Do we need to allow more than one group comment in a test or could we
> > return early here, avoiding to read the whole file?
> 
> Hmm, if we defined it's as a "convention", I think we can just check
> only the second line of the file.

I was actually just thinking of a break after finding the "# group: "
line. It would still be recognised as the third line, tenth line or
anywhere else, but only one line in the file would be recognised.

But if you think only looking at the second line is even easier, we can
do that. However, then I wouldn't call it "as a convention" any more in
the documentation because then it wouldn't work any other way any more.

Kevin


