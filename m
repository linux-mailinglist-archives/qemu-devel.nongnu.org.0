Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E49D2293A1B
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Oct 2020 13:37:45 +0200 (CEST)
Received: from localhost ([::1]:44178 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kUpxY-0004mF-UZ
	for lists+qemu-devel@lfdr.de; Tue, 20 Oct 2020 07:37:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56122)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1kUpvi-0003hu-8G
 for qemu-devel@nongnu.org; Tue, 20 Oct 2020 07:35:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:50078)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1kUpvg-0002c8-K5
 for qemu-devel@nongnu.org; Tue, 20 Oct 2020 07:35:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603193746;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=BTzXNG+eCv3k0kW90rLo6xeV82O4F6s43EFe6HQMVS0=;
 b=EdFhj0Q/sWbZXbvGyQ+n04NjYVXPwL9apL4OOpkqwjL3PnzHjTG5sCLfrmMBhqYOJTP+wJ
 f+JOWKgDpcehWvdX8Cx/8R8gDMx5LIA1/6U6v2Mn+jkX47lLdA9yosdczusfjsBOyRiQNF
 dWm8yv0mBXzrBeMwLCznXQsDHoak/HI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-560--Gjp4Xe7OQy4nR7YXE5bDQ-1; Tue, 20 Oct 2020 07:35:44 -0400
X-MC-Unique: -Gjp4Xe7OQy4nR7YXE5bDQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B5BAB57053
 for <qemu-devel@nongnu.org>; Tue, 20 Oct 2020 11:35:43 +0000 (UTC)
Received: from work-vm (ovpn-113-116.ams2.redhat.com [10.36.113.116])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2C2DA6266E;
 Tue, 20 Oct 2020 11:35:32 +0000 (UTC)
Date: Tue, 20 Oct 2020 12:35:30 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH v3 5/5] tools/virtiofsd: xattr name mappings: Simple 'map'
Message-ID: <20201020113530.GC2962@work-vm>
References: <20201014180209.49299-1-dgilbert@redhat.com>
 <20201014180209.49299-6-dgilbert@redhat.com>
 <20201020100922.GF140014@stefanha-x1.localdomain>
MIME-Version: 1.0
In-Reply-To: <20201020100922.GF140014@stefanha-x1.localdomain>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/20 01:15:43
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: dinechin@redhat.com, virtio-fs@redhat.com, qemu-devel@nongnu.org,
 vgoyal@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Stefan Hajnoczi (stefanha@redhat.com) wrote:
> On Wed, Oct 14, 2020 at 07:02:09PM +0100, Dr. David Alan Gilbert (git) wrote:
> > +static XattrMapEntry *parse_xattrmap_map(const char *rule,
> > +                                         XattrMapEntry *map,
> > +                                         size_t *nentries)
> > +{
> > +    char sep = *rule++;
> > +    const char *tmp;
> > +    char *key;
> > +    char *prefix;
> > +    XattrMapEntry tmp_entry;
> > +
> > +    /* At start of 'key' field */
> > +    tmp = strchr(rule, sep);
> 
> Missing sep == '\0' check. The strchr(3) man page says:
> 
>   The terminating null byte is considered part of the string, so that if
>   c is specified as '\0', these functions return a pointer to the
>   terminator.
> 
> So the code in this patch will eventually access beyond the end of the
> string:
> 
>   rule = tmp + 1; <-- tmp is already at the NUL terminator

Ah yes, I've got the check in the main routine but not in the _map case;
OK I'll fix that up.

Dave

-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


