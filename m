Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7663032A429
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 16:37:17 +0100 (CET)
Received: from localhost ([::1]:42624 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lH75I-0003mK-Ii
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 10:37:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51914)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kchamart@redhat.com>)
 id 1lH74Q-0003A3-Vo
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 10:36:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:22139)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kchamart@redhat.com>)
 id 1lH74P-0001eP-BK
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 10:36:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614699380;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8nbFW0zlxrn04jHy7Vnydeteq0b4dfL1aifdLA9onp0=;
 b=UgNCPFTrgyq+nDlfh73mDkyIZW3nUUjFGYjUim8b8B6/g6290o95tDzJEgkasdLyo22f/p
 tgcltLdLDEf7axe7xqeWGltxLUdkBFanu2cZWX6QAsKB3thhPIPSWZf9ucnZREeiBFjUtv
 MrNVRjMVy2PJPV6t/5707/0yu3eDGeY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-496-Mid1Ld7gPM6XZzxYvYTAYw-1; Tue, 02 Mar 2021 10:36:18 -0500
X-MC-Unique: Mid1Ld7gPM6XZzxYvYTAYw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 48A9510CE783
 for <qemu-devel@nongnu.org>; Tue,  2 Mar 2021 15:36:17 +0000 (UTC)
Received: from paraplu.localdomain (ovpn-115-89.ams2.redhat.com [10.36.115.89])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 19DC419D6C;
 Tue,  2 Mar 2021 15:36:17 +0000 (UTC)
Received: by paraplu.localdomain (Postfix, from userid 1001)
 id 73EBE3E0499; Tue,  2 Mar 2021 16:36:15 +0100 (CET)
Date: Tue, 2 Mar 2021 16:36:15 +0100
From: Kashyap Chamarthy <kchamart@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: About '-readconfig' [Was: Re: [PULL 27/29] vl: deprecate
 -writeconfig]
Message-ID: <20210302153615.GJ1344925@paraplu>
References: <20210226080526.651705-1-pbonzini@redhat.com>
 <20210226080526.651705-28-pbonzini@redhat.com>
 <20210301160335.GA86420@paraplu.home>
 <1294a3c2-352b-c9ba-7b29-71cc48227091@redhat.com>
MIME-Version: 1.0
In-Reply-To: <1294a3c2-352b-c9ba-7b29-71cc48227091@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kchamart@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kchamart@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Mar 01, 2021 at 05:24:10PM +0100, Paolo Bonzini wrote:
> On 01/03/21 17:03, Kashyap Chamarthy wrote:
> > On Fri, Feb 26, 2021 at 09:05:24AM +0100, Paolo Bonzini wrote:
> > > The functionality of -writeconfig is limited and the code
> > > does not even try to detect cases where it prints incorrect
> > > syntax (for example if values have a quote in them, since
> > > qemu_config_parse does not support any kind of escaping)
> > > so remove it.
> > > 
> > > Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> > > ---
> > >   docs/system/deprecated.rst | 7 +++++++
> > >   qemu-options.hx            | 7 +------
> > >   softmmu/vl.c               | 1 +
> > >   3 files changed, 9 insertions(+), 6 deletions(-)
> > 
> > [...]
> > 
> > Hi,
> > 
> > Sorry, I'm coming very late[1] to the discussion.  Will there be a
> > replacement for '-readconfig'?
> 
> -readconfig is not being deprecated, there will be some code new to
> integrate it with the changes I'm planning to option parsing.

I see; thanks for the clarification.  (I wasn't quite sure from the
2020 discussion thread.)

[...]

-- 
/kashyap


