Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6686A388FBB
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 16:01:47 +0200 (CEST)
Received: from localhost ([::1]:49996 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljMld-00083L-7l
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 10:01:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48928)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1ljMj8-0005vr-CV
 for qemu-devel@nongnu.org; Wed, 19 May 2021 09:59:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56658)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1ljMj5-0006DM-4G
 for qemu-devel@nongnu.org; Wed, 19 May 2021 09:59:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621432745;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=t2DwkG1Ey9w1AP07+zYJyeJxeaEBnbdEULeM6/7g8mw=;
 b=a7KodluBHutCSLb5to8aAie+YQF5Dd0TxT+2rCdxBSqOrMjLU85wXireV89bcyulIMU2Re
 ejAb1iH5S4MI78omcB4GSJr4ZJ2ysfS6GGghwj2fnm88S5OsmPrczZgPy6cYHMiVBlqUZ/
 erp4mMWjN2mg8k56kVQnuU1oUjl0pqQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-81-AdC9R94OPg6UKBdjYmQ8tA-1; Wed, 19 May 2021 09:59:01 -0400
X-MC-Unique: AdC9R94OPg6UKBdjYmQ8tA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3D1721936B72;
 Wed, 19 May 2021 13:59:00 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-115-58.ams2.redhat.com [10.36.115.58])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4F2D85C1CF;
 Wed, 19 May 2021 13:58:59 +0000 (UTC)
Date: Wed, 19 May 2021 15:58:57 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 0/3] vl: add -object support back into -readconfig
Message-ID: <YKUZoU7EIBwhFasL@merkur.fritz.box>
References: <20210518154014.2999326-1-pbonzini@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210518154014.2999326-1-pbonzini@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
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
Cc: qemu-stable@nongnu.org, qemu-devel@nongnu.org, armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 18.05.2021 um 17:40 hat Paolo Bonzini geschrieben:
> LXD developers have reported that [object] stanzas have stopped
> working in configuration files.
> 
> The problem is that QEMU 6.0 switched the creation of objects from
> qemu_opts_foreach to a bespoke QTAILQ, in preparation for supporting
> JSON syntax in -object.  Entries from the configuration file however
> do not go through object_option_parse, and are thus lost.  Of the many
> fixes that are possible, I chose one that is slightly more invasive but
> more consistent with the plans for keyval-ification of options such as
> -M and -accel.
> 
> -set was also broken by the same change, but for simplicity I chose
> not to add it back yet.  However, this series will report the
> breakage instead of failing silently.
> 
> The first two patches of this series are thus a reduced version of
> https://patchew.org/QEMU/20210513162901.1310239-1-pbonzini@redhat.com/
> ([PATCH 00/14] vl: compound properties for machines and accelerators),
> with the -set infrastructure removed.  The third is very simple and
> uses the newly-provided hooks to parse objects from configuration files.

Looks like this is
Based-on: <20210518131542.2941207-1-pbonzini@redhat.com>

Kevin


