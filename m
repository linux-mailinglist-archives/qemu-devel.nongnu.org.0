Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0802D28F290
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Oct 2020 14:44:57 +0200 (CEST)
Received: from localhost ([::1]:42724 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kT2cq-0001Oz-4Z
	for lists+qemu-devel@lfdr.de; Thu, 15 Oct 2020 08:44:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kT2bh-0000r3-RI
 for qemu-devel@nongnu.org; Thu, 15 Oct 2020 08:43:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34631)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kT2bc-0001Sw-1Q
 for qemu-devel@nongnu.org; Thu, 15 Oct 2020 08:43:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1602765817;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xMQfFc8NIKkCFByaUR5rsTWvP+obW+2EQpIkdFC0Vsw=;
 b=Vep3uoaj/ZOJwBPYUxPSCxweC1xHO8C/Op5VFqqYB8saAGlNJYD51Zi0FIvqsW1ibPdd1L
 QPwXzUxXksckcGkbqL8fG46Q1TSj/krnEd3uyq6T7nyGWsb5l8mneTiItrmBcyJ6SCQr9Z
 VKw48m+vYQRapCrormsJ4V/fwxS5VRg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-89-Wot00Oq-PauvkNbhX6fjMA-1; Thu, 15 Oct 2020 08:43:35 -0400
X-MC-Unique: Wot00Oq-PauvkNbhX6fjMA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 710A818FE861;
 Thu, 15 Oct 2020 12:43:33 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-114-163.ams2.redhat.com [10.36.114.163])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3554660E1C;
 Thu, 15 Oct 2020 12:43:31 +0000 (UTC)
Date: Thu, 15 Oct 2020 14:43:29 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Subject: Re: [PATCH v3 0/2] block: deprecate the sheepdog driver
Message-ID: <20201015124329.GI4610@merkur.fritz.box>
References: <20201002113243.2347710-1-berrange@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201002113243.2347710-1-berrange@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/15 02:38:26
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Thomas Huth <thuth@redhat.com>, sheepdog@lists.wpkg.org,
 qemu-block@nongnu.org, libvir-list@redhat.com,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Liu Yuan <namei.unix@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 02.10.2020 um 13:32 hat Daniel P. Berrangé geschrieben:
> 2 years back I proposed dropping the sheepdog mailing list from the
> MAINTAINERS file, but somehow the patch never got picked up:
> 
>   https://lists.gnu.org/archive/html/qemu-block/2018-03/msg01048.html
> 
> So here I am with the same patch again.
> 
> This time I go further and deprecate the sheepdog driver entirely.
> See the rationale in the second patch commit message.

Thanks, applied to the block branch.

Kevin


