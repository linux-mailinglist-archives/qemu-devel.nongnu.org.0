Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF21D422C45
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Oct 2021 17:21:49 +0200 (CEST)
Received: from localhost ([::1]:60340 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXmGK-0001Ob-KD
	for lists+qemu-devel@lfdr.de; Tue, 05 Oct 2021 11:21:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54748)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kchamart@redhat.com>)
 id 1mXlbp-0002D2-HT
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 10:39:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35162)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kchamart@redhat.com>)
 id 1mXlbn-0000KB-SA
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 10:39:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633444795;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=VidIBuO1CTbySRXvSeuF1GATOcBGYfvYVfZhJU4ewP0=;
 b=CvqNn9V1V3avlH5bvU2+i8itVsiTurAoHZC/L+oYjWAzLdvpbnXmUAzELgtXlIC3Gk47k4
 TJizoEKuvg8FOhjjXcuNOu/tfYgDeTIAvn1p8AF7L6o/zFA/84MMwiIhrUGGqMZRRd1Dst
 WaFf8r53uX6XNq4tLXt5AeGU2qVTW9M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-510-PmL0CAqaMmObQndz8PKRAQ-1; Tue, 05 Oct 2021 10:39:51 -0400
X-MC-Unique: PmL0CAqaMmObQndz8PKRAQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 368FD19253C3;
 Tue,  5 Oct 2021 14:39:50 +0000 (UTC)
Received: from paraplu (unknown [10.39.195.76])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CCDBE5F4E7;
 Tue,  5 Oct 2021 14:39:47 +0000 (UTC)
Date: Tue, 5 Oct 2021 16:39:43 +0200
From: Kashyap Chamarthy <kchamart@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH 0/3] rSTify SubmitAPatch, TrivialPatches, and SpellCheck
 wiki pages
Message-ID: <YVxjr7Vn0SqjDWsg@paraplu>
References: <20210922121054.1458051-1-kchamart@redhat.com>
 <YVxarQkCtPkhRc4Z@stefanha-x1.localdomain>
 <YVxdKpks4ARkVHlj@paraplu>
 <YVxgBvQTwfnBgZXI@stefanha-x1.localdomain>
MIME-Version: 1.0
In-Reply-To: <YVxgBvQTwfnBgZXI@stefanha-x1.localdomain>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kchamart@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kchamart@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.066,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 John Snow <jsnow@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>,
 Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Oct 05, 2021 at 03:24:06PM +0100, Stefan Hajnoczi wrote:
> On Tue, Oct 05, 2021 at 04:11:54PM +0200, Kashyap Chamarthy wrote:

[...]

> > They were linked to from the SubmitAPatch page.  I thought having one
> > doc in qemu.git and the other two related docs on the Wiki was clunky.
> > I can leave them on the Wiki as-is.  But I thought upstream is wants to
> > move away from the Wiki to in-tree docs where it makes sense.
> 
> I meant SubmitAPatch too :). I may have forgotten or missed the IRC
> discussion so I wanted to understand the reason.

I converted it based on ththe following chat with Peter on #qemu, OFTC.
This was on 22Sep2021 (if you have the IRC log archives).  I agree with
Peter, SubmitAPatch doc should be in-tree:

  ...
  <pm215> (we absolutely do have stuff on the wiki that should be in
          the docs, eg the networking page)
  <pm215> the "how to contribute a patch" page ought to be in
          docs/devel/
  <danpb> all the platform specific build guides should be too
  ...

Then, Peter and DanPB pointed more sources of unmaintained docs: 

  - All the pages under https://wiki.qemu.org/Documentation - Peter
    suggests to incorporate them information into the actual
    documentation in docs/.  
  
  - The "Feature" pages:
    https://wiki.qemu.org/Special:AllPages.  DanPB asked how many of
    them are actually accurate.  As some of them go back to 10 years.

  - Then there are the "lonely pages (pointed out by Peter):
    https://wiki.qemu.org/Special:LonelyPages - these are
    unreachable.  DanPB noted that there are 151 "lonely pages".  This
    doesn't mean they're obsolete, though - some of them were written in
    2021.

-- 
/kashyap


