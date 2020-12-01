Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A50352CAA6F
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Dec 2020 19:04:46 +0100 (CET)
Received: from localhost ([::1]:36056 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkA17-00014W-GX
	for lists+qemu-devel@lfdr.de; Tue, 01 Dec 2020 13:04:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45436)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kchamart@redhat.com>)
 id 1kk9q8-0007mP-Jo
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 12:53:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29973)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kchamart@redhat.com>)
 id 1kk9q5-0007Kd-2h
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 12:53:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606845199;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=B/v5CnwFqSLCf8o45IvZU6vgSdzxCIcIcamKgC+cyrU=;
 b=Nkw+c3EIbd8T6z9aAjAwkfEq+XBmet093xfmAIRYa0IxJed0BY9hiJ/d9EaZ9VU36Fzl7x
 K41w/Cmybe4bbHEASQz4kX1xljFpe1IWCW1RCdIIdxxo87a6tWoqpsTRPtoUPdq1XUizLC
 ASyP+k/n+jG+DGdYZ5HFNwvTR5NXrPA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-363-zvkEA75LO1KSGFbRCOM3Vw-1; Tue, 01 Dec 2020 12:53:17 -0500
X-MC-Unique: zvkEA75LO1KSGFbRCOM3Vw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CD271185E480;
 Tue,  1 Dec 2020 17:53:15 +0000 (UTC)
Received: from paraplu.localdomain (ovpn-115-42.ams2.redhat.com [10.36.115.42])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 955925D9CA;
 Tue,  1 Dec 2020 17:53:15 +0000 (UTC)
Received: by paraplu.localdomain (Postfix, from userid 1001)
 id 25E103E0495; Tue,  1 Dec 2020 18:53:14 +0100 (CET)
Date: Tue, 1 Dec 2020 18:53:14 +0100
From: Kashyap Chamarthy <kchamart@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Subject: Re: [PATCH 00/23] tests/docker: start using libvirt-ci's "lcitool"
 for dockerfiles
Message-ID: <20201201175314.GA171937@paraplu.home>
References: <20201201171825.2243775-1-berrange@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201201171825.2243775-1-berrange@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kchamart@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kchamart@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.497,
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
Cc: Fam Zheng <fam@euphon.net>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Dec 01, 2020 at 05:18:02PM +0000, Daniel P. Berrangé wrote:
 
> The same applies to package lists for VMs, Cirrus CI / Travis CI, and
> probably more.
> 
> This problem is not unique to QEMU, libvirt faced the exact same issues
> and developed a program called "lcitool" which is part of the libvirt-ci
> git repository to reduce the burden in this area.
> 
>    https://gitlab.com/libvirt-ci/libvirt-ci/

The above URL doesn't resolve for me; perhaps due to a typo.  This works
for me:

    https://gitlab.com/libvirt/libvirt-ci

> Despite its name, this repository is not tied to libvirt, and so as well
> as the 40+ libvirt git repos, it is also used by the libosinfo and
> virt-viewer projects for their CI needs. The idea is that all these
> projects can share the burden of libvirt-ci.

[...]

-- 
/kashyap


