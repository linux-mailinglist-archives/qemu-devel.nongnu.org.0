Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FF7632A83B
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 18:38:23 +0100 (CET)
Received: from localhost ([::1]:38290 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lH8yU-0002MY-HG
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 12:38:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53808)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lH8wk-00012q-5A
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 12:36:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40048)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lH8wi-0003xv-Mt
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 12:36:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614706592;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1YCecuRY/2OqXuk2jllZxrImpqR/dG60iUeweBFXk1Q=;
 b=DTzyUb/76UTDnetO5CXSPhChOAhgBvfXKAhiCE+sHWjIXCoD6p80H1aLRB2hya+ExfJzWP
 WTQljWqwnEAknYDsXHE4C5YuoKp912a/aJC5Up0Z7jG4WysCTE92YIsr5W6uBmKECgYYa5
 CRCfQX93oSeib+EAYoG8tChytrE28Pw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-27-ql9ko2EvOWS04-6aD7e0ug-1; Tue, 02 Mar 2021 12:36:30 -0500
X-MC-Unique: ql9ko2EvOWS04-6aD7e0ug-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 813531005501;
 Tue,  2 Mar 2021 17:36:29 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-113-197.ams2.redhat.com [10.36.113.197])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5E34110023B1;
 Tue,  2 Mar 2021 17:36:20 +0000 (UTC)
Date: Tue, 2 Mar 2021 18:36:18 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Eric Blake <eblake@redhat.com>
Subject: Re: [PATCH v2 06/31] qapi/qom: Add ObjectOptions for dbus-vmstate
Message-ID: <20210302173618.GD5527@merkur.fritz.box>
References: <20210224135255.253837-1-kwolf@redhat.com>
 <20210224135255.253837-7-kwolf@redhat.com>
 <11a6a75b-2e84-9033-d15c-f30b40c45c07@redhat.com>
MIME-Version: 1.0
In-Reply-To: <11a6a75b-2e84-9033-d15c-f30b40c45c07@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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

Am 26.02.2021 um 16:58 hat Eric Blake geschrieben:
> On 2/24/21 7:52 AM, Kevin Wolf wrote:
> > This adds a QAPI schema for the properties of the dbus-vmstate object.
> > 
> > A list represented as a comma separated string is clearly not very
> > QAPI-like, but for now just describe the existing interface.
> 
> Does your alias proposal give us a path forward for improving that down
> the road?  Or maybe it's not an alias we need, but a new field with
> better QAPI-like semantics, deprecate the old one, and wait out the 2
> release cycles?

Aliases can just give options an alternative name, they don't change
anything about the structure of the option. Splitting a string into
multiple values is certainly not one of the things they solve.

So if we care, adding a replacement and deprecating the old option is
probably what we would do.

Kevin


