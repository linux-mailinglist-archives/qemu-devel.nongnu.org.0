Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DAB962F835D
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 19:12:28 +0100 (CET)
Received: from localhost ([::1]:38118 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0TaF-0001wx-K0
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 13:12:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51690)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l0TYZ-00015n-Mz
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 13:10:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27081)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l0TYX-0002fD-S3
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 13:10:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610734240;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=bS2I7Xu/shcBG7A3Td+51IYLGWfr5T4THPQD2+0iG4I=;
 b=MUkbj7580Am0DB1ehAfUOh9WDvCOa6SU5BGARJUKH+TP7uX9UNXxxbqcl475ggSq1mQBUB
 6K4ugI+rxfwU+4rilcwi3c2CbzCJzmaFIVR5D+kc9tRLvKhx7XiLhhvkSNZpgc8mf2/b8s
 E6OJ1AHoiXVp1nhPsPYhA1qXud6FCxA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-35-JEvzODPlMEuE_woK-xIoTA-1; Fri, 15 Jan 2021 13:10:34 -0500
X-MC-Unique: JEvzODPlMEuE_woK-xIoTA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C859B9CC09
 for <qemu-devel@nongnu.org>; Fri, 15 Jan 2021 18:10:33 +0000 (UTC)
Received: from redhat.com (ovpn-115-76.ams2.redhat.com [10.36.115.76])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6BC24648A1;
 Fri, 15 Jan 2021 18:10:32 +0000 (UTC)
Date: Fri, 15 Jan 2021 18:10:29 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: P J P <ppandit@redhat.com>
Subject: Re: About 'qemu-security' list subscription process
Message-ID: <20210115181029.GY1692978@redhat.com>
References: <r95p856o-o5r3-1r88-p675-2111r17p7794@erqung.pbz>
MIME-Version: 1.0
In-Reply-To: <r95p856o-o5r3-1r88-p675-2111r17p7794@erqung.pbz>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Michael Tsirkin <mtsirkin@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jan 14, 2021 at 07:33:32PM +0530, P J P wrote:
>   Hello,
> 
> * We have received quite a few subscription requests for the 'qemu-security'
>   list in the last few weeks. Majority of them are rejected because we could
>   not identify the user from merely their email-id.
> 
> * I have requested them to send a subscription request email with a 'Self
>   Introduction' to the list.
> 
> * However, some of the subscribers are familiar from the
>   qemu-devel/oss-security mailing lists. And some are corporate emails like
>   <secalert@rh.c>
> 
> * One of the request is pending (3+) votes/acks for OR against member
>   subscription.
> 
> How do we handle these requests?

I believe we want to keep the membership of qemu-security reasonably
small. Primarily people who can commit to helping with the initial
triage to identify which specific subsystem maintainers to pull in.
In addition major consumers of QEMU with whom we need to coordinate
choice of disclosure date for embargoed images.

There is obviously a danger to the project if we mistakenly allow
membership from someone who is not acting in interests in the QEMU
project, so I think the bar needs to be reasonably high. IOW ideally
there should be some web of trust whereby some existing member(s)
knows the person/entity who is requesting acces. Other cases would
have to be evaluated case-by-case basis.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


