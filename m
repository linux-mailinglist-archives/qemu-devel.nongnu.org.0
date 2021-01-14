Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9F702F6905
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 19:15:09 +0100 (CET)
Received: from localhost ([::1]:45796 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l079I-0000Q8-Nc
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 13:15:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55326)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kchamart@redhat.com>)
 id 1l06AF-0007JF-8p
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 12:12:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58208)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kchamart@redhat.com>)
 id 1l06AC-0001Pg-QN
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 12:12:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610644318;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RBYGooISf2pz7lbJXbO7abF4uKrMvtBKgargaMsdlrE=;
 b=akfqAk4VrSdmGXOwA9PnSFKMZyxf/VqFRbWRE1KBu8m4J6LpKm8JvASR7C0KfKE7VcQ4p5
 WXWJbaDtwmLeMaI1xZk8qbmB5aqRx1mB9svdvR6qS6Ma/gNWSXHunsZkrPmxhwq5g6KCmL
 9KhGO7IbOe0huYu23a7PNWoZEHr+TCA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-455-cboUdFj-Mf-ypHVmJCYE5w-1; Thu, 14 Jan 2021 12:11:54 -0500
X-MC-Unique: cboUdFj-Mf-ypHVmJCYE5w-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0F6658030A8;
 Thu, 14 Jan 2021 17:11:53 +0000 (UTC)
Received: from paraplu.localdomain (ovpn-113-252.ams2.redhat.com
 [10.36.113.252])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 286615C1BD;
 Thu, 14 Jan 2021 17:11:52 +0000 (UTC)
Received: by paraplu.localdomain (Postfix, from userid 1001)
 id 942003E0497; Thu, 14 Jan 2021 18:11:50 +0100 (CET)
Date: Thu, 14 Jan 2021 18:11:50 +0100
From: Kashyap Chamarthy <kchamart@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Subject: Re: About creating machines on the command line
Message-ID: <20210114171150.GA94798@paraplu.home>
References: <13ecc030-f42b-5a27-a0b3-b07921426ce9@greensocs.com>
 <20210114113706.GF1643043@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210114113706.GF1643043@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kchamart@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kchamart@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.248,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Damien Hedde <damien.hedde@greensocs.com>, peter.maydell@linaro.org,
 richard.fuhler@sifive.com, sam.grove@sifive.com,
 Mark Burton <mark.burton@greensocs.com>, armbru@redhat.com,
 qemu-devel@nongnu.org, edgar.iglesias@gmail.com,
 Luc Michel <luc.michel@greensocs.com>, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jan 14, 2021 at 11:37:06AM +0000, Daniel P. Berrangé wrote:
> On Mon, Jan 11, 2021 at 03:50:58PM +0100, Luc Michel wrote:

[...]

> > This would hopefully allow for simple machines creation. We would then be
> > able to use either the command line or the `-readconfig` option to create
> > the machine.
> > 
> > Note that we are not planning to use QMP/HMP for now. From our
> > understanding, a `device_add` request is always considered as hot-plug,
> > which is not what we want here.
> > 
> > Please tell us what do you think about this plan. Any feedback is
> > appreciated.  Then we can discuss the details of how to do this properly.
> 
> There's a general desire amongst QEMU maintainers to move to a world
> where QAPI is used for describing everything. In this vision, eventually
> all current command line options would be replaced with QMP commands
> and QAPI objects specs.
> 
> In this world -readconfig is likely to be deleted. 

In that case, I hope the above intention / direction will be documented
somewhere more clearly.  In the past I ran into at least a couple of
companies that use QEMU in production and heavily rely on '-readconfig',
despite knowing some of its shortcomings.  There might be others out
there.

> Also this means we have a bias against adding new command line options
> to current QEMU.

[...]

-- 
/kashyap


