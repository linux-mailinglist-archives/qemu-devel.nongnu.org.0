Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 078214EAA1B
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Mar 2022 11:07:02 +0200 (CEST)
Received: from localhost ([::1]:42118 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZ7oa-00045H-Ky
	for lists+qemu-devel@lfdr.de; Tue, 29 Mar 2022 05:07:00 -0400
Received: from eggs.gnu.org ([209.51.188.92]:53430)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nZ7kA-0000ib-0n
 for qemu-devel@nongnu.org; Tue, 29 Mar 2022 05:02:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37460)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nZ7k4-0003C8-VT
 for qemu-devel@nongnu.org; Tue, 29 Mar 2022 05:02:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648544540;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=OoMJvwTDXknY2ET0RoOU/4BbjmHrPDepWmWfPYLGFEE=;
 b=E95r/V50SCYQEeHUNRzgaFDT781FcAuvfRCsx1nTDEEFxA1XWGlH+YRPU5kB0fu7NmAWZB
 qGG0ZrB3VhhndIjR2Ghxx/9PwsCiuoRZ8pVunFgiX6jFMAPII53uEay39vF8AXS1LcaA2n
 3M/n36z77Q8rt0Go/YUuipP5XA0VnRE=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-76-fU5f488rPSav1rJShnAHaA-1; Tue, 29 Mar 2022 05:02:11 -0400
X-MC-Unique: fU5f488rPSav1rJShnAHaA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 043AF3817480;
 Tue, 29 Mar 2022 09:02:11 +0000 (UTC)
Received: from redhat.com (unknown [10.33.37.18])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 27B95401E97;
 Tue, 29 Mar 2022 09:02:04 +0000 (UTC)
Date: Tue, 29 Mar 2022 10:01:59 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: On patch series version tags, and also cover letters (was:
 [PATCH v2 2/2] Added parameter to take screenshot with screendump as PNG)
Message-ID: <YkLLBymd9kCr9sLN@redhat.com>
References: <20220328165415.2102-1-kshitij.suri@nutanix.com>
 <20220328165415.2102-2-kshitij.suri@nutanix.com>
 <87bkxp5kfo.fsf@pond.sub.org>
 <0705b49a-d4f6-f670-e26e-84d637c8071e@nutanix.com>
 <87a6d9429w.fsf_-_@pond.sub.org>
MIME-Version: 1.0
In-Reply-To: <87a6d9429w.fsf_-_@pond.sub.org>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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
Cc: soham.ghosh@nutanix.com, thuth@redhat.com, prerna.saxena@nutanix.com,
 qemu-devel@nongnu.org, dgilbert@redhat.com,
 Kshitij Suri <kshitij.suri@nutanix.com>, philippe.mathieu.daude@gmail.com,
 kraxel@redhat.com, prachatos.mitra@nutanix.com, eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Mar 29, 2022 at 09:59:55AM +0200, Markus Armbruster wrote:
> Kshitij Suri <kshitij.suri@nutanix.com> writes:
> 
> > On 29/03/22 12:12 pm, Markus Armbruster wrote:
> >> If I count correctly, this is the fifth posting tagged "v2".  Don't do
> >> that, please, as it's quite confusing.
> >>
> > Thank you for your review and I apologise for that since I am fairly
> > new to upstreaming. As per what I read version updates should be done
> > only when there are significant design changes to the patch which
> > didn't happen in the v2 version. Will update it to v3 and send the
> > patch.
> 
> We all make mistakes :)
> 
> The purpose of the version tag in the subject is to help humans with
> keeping track of patch submissions.  Increment it for every submission.
> 
> If you need to resend a submission completely unchanged for some reason,
> you may want to keep the tag and add "RESEND".
> 
> A cover letter (git format-patch --cover-letter) lets you write an
> introduction to the whole series.  Simple series may not need an
> introduction, but complex ones do.  I always use one except when the
> "series" is a single patch.
> 
> Keeping a change log in the cover letter helps people who already
> reviewed previous iterations.

FYI, using the 'git-publish' tool instead of 'git send-email' or
'git format-patch' helps you do all these things. It automatically
sets & increments the version number, it prompts for a cover letter
and remembers what you wrote next time. 

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


