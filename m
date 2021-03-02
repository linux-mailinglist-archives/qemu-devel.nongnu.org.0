Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B9D532AA13
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 20:12:35 +0100 (CET)
Received: from localhost ([::1]:60750 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHARe-0001OO-3e
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 14:12:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41548)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lH9oZ-0002KD-IX
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 13:32:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37664)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lH9oY-0004Ra-17
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 13:32:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614709929;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=f77FZTSQmzYR0jBQNFhATOSqI6799/D2nwBx+S/lpOw=;
 b=N2PjeZW8Olo+OIXV1B3p8LOANK0a09uns8cgXOC6I7CDuSszFmls8vXAwHCfq/fdIlRRvi
 oaUFfKnEfUqTndC0OBb50wDI7orehLeZKMiEgduHhfKiELXl4YkH6y1yCpOTbdL8FDeaYI
 xSnkEdff8KaLxuNjeP93HPZTs26QOsA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-5-K0VvQsNGO2SXSTbz4T86zw-1; Tue, 02 Mar 2021 13:32:05 -0500
X-MC-Unique: K0VvQsNGO2SXSTbz4T86zw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 802C2107ACE3;
 Tue,  2 Mar 2021 18:32:04 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-113-197.ams2.redhat.com [10.36.113.197])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C62AA6F996;
 Tue,  2 Mar 2021 18:32:01 +0000 (UTC)
Date: Tue, 2 Mar 2021 19:32:00 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Eric Blake <eblake@redhat.com>
Subject: Re: [PATCH v2 12/31] qapi/qom: Add ObjectOptions for can-*
Message-ID: <20210302183200.GI5527@merkur.fritz.box>
References: <20210224135255.253837-1-kwolf@redhat.com>
 <20210224135255.253837-13-kwolf@redhat.com>
 <0250da61-515d-cd41-d680-25431da87373@redhat.com>
MIME-Version: 1.0
In-Reply-To: <0250da61-515d-cd41-d680-25431da87373@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: lvivier@redhat.com, thuth@redhat.com, pkrempa@redhat.com,
 berrange@redhat.com, ehabkost@redhat.com, qemu-block@nongnu.org,
 libvir-list@redhat.com, armbru@redhat.com, jasowang@redhat.com,
 qemu-devel@nongnu.org, mreitz@redhat.com, kraxel@redhat.com,
 pbonzini@redhat.com, dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 26.02.2021 um 20:42 hat Eric Blake geschrieben:
> On 2/24/21 7:52 AM, Kevin Wolf wrote:
> > This adds a QAPI schema for the properties of the can-* objects.
> > 
> > can-bus doesn't have any properties, so it only needs to be added to the
> > ObjectType enum without adding a new branch to ObjectOptions.
> 
> I somewhat prefer
> 
> 'can-bus': {},
> 
> to make it explicit that we thought about it, but since we allow
> defaulted union branches, your approach works too.

The QAPI generator disagrees:

../qapi/qom.json: In union 'ObjectOptions':
../qapi/qom.json:492: 'data' member 'can-bus' misses key 'type'

It seems we can't use inline definitions of struct types because we
already use that for the extended description of branch types. And
adding a whole named struct without content is probably a bit too much?

Kevin


