Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E497D24D0F5
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Aug 2020 10:56:42 +0200 (CEST)
Received: from localhost ([::1]:54250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k92qn-0006R4-Gn
	for lists+qemu-devel@lfdr.de; Fri, 21 Aug 2020 04:56:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1k92pz-0005Pw-3x
 for qemu-devel@nongnu.org; Fri, 21 Aug 2020 04:55:51 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:25094
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1k92pw-00081i-KX
 for qemu-devel@nongnu.org; Fri, 21 Aug 2020 04:55:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598000147;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6RezNiE61y0l0GSmP6hX3ychcKgyBTYk0r1l3uJ6p+w=;
 b=Lin2CwsypvAfQ1MYDgINFguQWXoUsMEkvWTwyIQhJj8O0SSZDRKxjzBwN+taq80cDbyvxi
 3mEgiMpV+stvx4RlGuf+WuahsR9m4vIET13m4QM6ZDzQrfa2TFwIIrNWQIg24lZEv2d1KZ
 HG/iJvurR96NkVeGXeOAho/b9ct5I/I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-187-x-KVcU3PNCmp8XAosIwOKA-1; Fri, 21 Aug 2020 04:55:43 -0400
X-MC-Unique: x-KVcU3PNCmp8XAosIwOKA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5C8B581CBEB;
 Fri, 21 Aug 2020 08:55:42 +0000 (UTC)
Received: from localhost (unknown [10.43.2.114])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5C1585DE81;
 Fri, 21 Aug 2020 08:55:40 +0000 (UTC)
Date: Fri, 21 Aug 2020 10:55:38 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Subject: Re: [PATCH 02/10] numa: introduce
 MachineClass::forbid_asymmetrical_numa
Message-ID: <20200821105538.6f6b46c8@redhat.com>
In-Reply-To: <20200820165103.GD642093@habkost.net>
References: <20200814205424.543857-1-danielhb413@gmail.com>
 <20200814205424.543857-3-danielhb413@gmail.com>
 <20200820011726.GF271315@yekko.fritz.box>
 <20200820021128.GC642093@habkost.net>
 <20200820041504.GN271315@yekko.fritz.box>
 <20200820165103.GD642093@habkost.net>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=imammedo@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/21 04:55:47
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-ppc@nongnu.org, Daniel Henrique Barboza <danielhb413@gmail.com>,
 John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 20 Aug 2020 12:51:03 -0400
Eduardo Habkost <ehabkost@redhat.com> wrote:

> On Thu, Aug 20, 2020 at 02:15:04PM +1000, David Gibson wrote:
> > On Wed, Aug 19, 2020 at 10:11:28PM -0400, Eduardo Habkost wrote:  
> > > On Thu, Aug 20, 2020 at 11:17:26AM +1000, David Gibson wrote:  
> > > > On Fri, Aug 14, 2020 at 05:54:16PM -0300, Daniel Henrique Barboza wrote:  
> > > > > The pSeries machine does not support asymmetrical NUMA
> > > > > configurations.  
> > > > 
> > > > This seems a bit oddly specific to have as a global machine class
> > > > property.
> > > > 
> > > > Would it make more sense for machines with specific NUMA constraints
> > > > to just verify those during their initialization?  
> > > 
> > > This would be much simpler.  However, I like the idea of
> > > representing machine-specific configuration validation rules as
> > > data that can eventually be exported to management software.  
> > 
> > Ah, ok, so basically the usual tradeoff between flexibility and
> > advertisability.
> > 
> > So, in that case, I guess the question is whether we envisage "no
> > assymmetry" as a constraint common enough that it's worth creating an
> > advertisable rule or not.  If we only ever have one user, then we
> > haven't really done any better than hard coding the constraint in the
> > manageent software.
> > 
> > Of course to complicate matters, in the longer term we're looking at
> > removing that constraint from pseries - but doing so will be dependent
> > on the guest kernel understanding a new format for the NUMA
> > information in the device tree.  So qemu alone won't have enough
> > information to tell if such a configuration is possible or not.  
> 
> Requiring both QEMU (and possibly management software) to be
> patched again after the guest kernel is fixed sounds undesirable.
If we drop this restriction, then we don't need to touch QEMU when
guest kernel is ready.

Btw, what spapr spec says about the matter?

> Perhaps a warning would be better in this case?
> 
> In either case, it sounds like this won't be a common constraint
> and I now agree with your original suggestion of doing this in
> machine initialization code.
Agreed, if it goes to spapr specific machine code I will not object much.
(it will burden just spapr maintainers, so it's about convincing
David in the end)


