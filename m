Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B67F4EA8F1
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Mar 2022 10:03:03 +0200 (CEST)
Received: from localhost ([::1]:59726 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZ6of-0007re-Hl
	for lists+qemu-devel@lfdr.de; Tue, 29 Mar 2022 04:03:01 -0400
Received: from eggs.gnu.org ([209.51.188.92]:38062)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nZ6lr-00071q-EH
 for qemu-devel@nongnu.org; Tue, 29 Mar 2022 04:00:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:56648)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nZ6ln-0000NW-Ka
 for qemu-devel@nongnu.org; Tue, 29 Mar 2022 04:00:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648540801;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=fxRWZIOBkwkt4r+l3hFTZz4b36Uc0erDGrexeP8as8s=;
 b=MRvqfDL1T2mqDfxDs0GB9WWox1CZfnx3iR53Rl2DRZDLwa7Hm49s2VWCVgksOZqNcnJDKg
 yXNQcT/3JbVVW0LIi+3S3fTc5HVJ7sH4Sqw0tzK1e+Hqt3DzQN2QHVSX3RbEhelvY71kVA
 1Y6fGSosH1xVS5zW2otIzYiD/7vVOLg=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-631-umQpEigsM9a6d_Au_fC0dg-1; Tue, 29 Mar 2022 03:59:57 -0400
X-MC-Unique: umQpEigsM9a6d_Au_fC0dg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7F161280094D;
 Tue, 29 Mar 2022 07:59:57 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.112.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 436B140D1B9A;
 Tue, 29 Mar 2022 07:59:57 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id E876921E691D; Tue, 29 Mar 2022 09:59:55 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Kshitij Suri <kshitij.suri@nutanix.com>
Subject: On patch series version tags, and also cover letters (was: [PATCH
 v2 2/2] Added parameter to take screenshot with screendump as PNG)
References: <20220328165415.2102-1-kshitij.suri@nutanix.com>
 <20220328165415.2102-2-kshitij.suri@nutanix.com>
 <87bkxp5kfo.fsf@pond.sub.org>
 <0705b49a-d4f6-f670-e26e-84d637c8071e@nutanix.com>
Date: Tue, 29 Mar 2022 09:59:55 +0200
In-Reply-To: <0705b49a-d4f6-f670-e26e-84d637c8071e@nutanix.com> (Kshitij
 Suri's message of "Tue, 29 Mar 2022 12:36:57 +0530")
Message-ID: <87a6d9429w.fsf_-_@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: soham.ghosh@nutanix.com, thuth@redhat.com, berrange@redhat.com,
 prerna.saxena@nutanix.com, qemu-devel@nongnu.org, dgilbert@redhat.com,
 philippe.mathieu.daude@gmail.com, kraxel@redhat.com,
 prachatos.mitra@nutanix.com, eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Kshitij Suri <kshitij.suri@nutanix.com> writes:

> On 29/03/22 12:12 pm, Markus Armbruster wrote:
>> If I count correctly, this is the fifth posting tagged "v2".  Don't do
>> that, please, as it's quite confusing.
>>
> Thank you for your review and I apologise for that since I am fairly
> new to upstreaming. As per what I read version updates should be done
> only when there are significant design changes to the patch which
> didn't happen in the v2 version. Will update it to v3 and send the
> patch.

We all make mistakes :)

The purpose of the version tag in the subject is to help humans with
keeping track of patch submissions.  Increment it for every submission.

If you need to resend a submission completely unchanged for some reason,
you may want to keep the tag and add "RESEND".

A cover letter (git format-patch --cover-letter) lets you write an
introduction to the whole series.  Simple series may not need an
introduction, but complex ones do.  I always use one except when the
"series" is a single patch.

Keeping a change log in the cover letter helps people who already
reviewed previous iterations.

Check out

    https://lists.gnu.org/archive/html/qemu-devel/2022-03/msg03977.html

for an example.  Not every cover letter needs to be that verbose, of
course.  Likewise, the level of detail in change logs varies.

A good way to get a feel for good cover letters and commit messages is
to review patches.  What kind of information helps you as a reviewer?
That's the kind of information you want to provide with your
submissions.

Hope this helps!


