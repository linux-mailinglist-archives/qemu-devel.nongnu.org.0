Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E8912CEB4C
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Dec 2020 10:47:46 +0100 (CET)
Received: from localhost ([::1]:38626 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kl7gm-00036z-HS
	for lists+qemu-devel@lfdr.de; Fri, 04 Dec 2020 04:47:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kl7fc-0002ea-4i
 for qemu-devel@nongnu.org; Fri, 04 Dec 2020 04:46:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51304)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kl7fZ-00065j-42
 for qemu-devel@nongnu.org; Fri, 04 Dec 2020 04:46:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607075187;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=N3yqmm8FrXi8KZHAB5mI5wzm5XZE3crSEzrBJGWecF0=;
 b=i9e7cecS7XFGTA6qrIlXOoObx1M0mjKYsgeQcr3WepnQJxtM6/bvrFe0HM7t44EE9zodRL
 eHbb4Qs2+/GrQn9O6/veSBfAq1GWbyqLRcVRGLygTrTbMtg/VJBQFB3yU6A5PzUIuyVptj
 fVFTDvy2IHMtPhdO1EFf73wUCZ8ygs4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-17-AZIRqVroNHKWgmVESg1Gkg-1; Fri, 04 Dec 2020 04:46:23 -0500
X-MC-Unique: AZIRqVroNHKWgmVESg1Gkg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9D10A107ACF6
 for <qemu-devel@nongnu.org>; Fri,  4 Dec 2020 09:46:22 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-114-112.ams2.redhat.com [10.36.114.112])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CE8BD5C1D1;
 Fri,  4 Dec 2020 09:46:21 +0000 (UTC)
Date: Fri, 4 Dec 2020 10:46:20 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-devel@nongnu.org
Subject: Re: [PATCH 0/6] qapi: Add support for aliases
Message-ID: <20201204094620.GB4833@merkur.fritz.box>
References: <20201112172850.401925-1-kwolf@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201112172850.401925-1-kwolf@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.495,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: jsnow@redhat.com, armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 12.11.2020 um 18:28 hat Kevin Wolf geschrieben:
> This series introduces alias definitions for QAPI object types (structs
> and unions).
> 
> This allows using the same QAPI type and visitor even when the syntax
> has some variations between different external interfaces such as QMP
> and the command line.
> 
> It also provides a new tool for evolving the schema while maintaining
> backwards compatibility (possibly during a deprecation period).
> 
> The first user is intended to be a QAPIfied -chardev command line
> option, for which I'll send a separate series. A git tag is available
> that contains both this series and the chardev changes that make use of
> it:
> 
>     https://repo.or.cz/qemu/kevin.git qapi-alias-chardev-v1
> 
> Kevin Wolf (6):
>   qapi: Add interfaces for alias support to Visitor
>   qapi: Remember alias definitions in qobject-input-visitor
>   qapi: Simplify full_name_nth() in qobject-input-visitor
>   qapi: Apply aliases in qobject-input-visitor
>   qapi: Add support for aliases
>   tests/qapi-schema: Test cases for aliases

Ping.


