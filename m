Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 424392223F6
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Jul 2020 15:35:18 +0200 (CEST)
Received: from localhost ([::1]:48302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jw42e-0000fl-U2
	for lists+qemu-devel@lfdr.de; Thu, 16 Jul 2020 09:35:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56766)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1jw41Y-000092-G4
 for qemu-devel@nongnu.org; Thu, 16 Jul 2020 09:34:08 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:22821
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1jw41V-0004ZZ-SF
 for qemu-devel@nongnu.org; Thu, 16 Jul 2020 09:34:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594906444;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Pmn7qVlI67KKOlLnu2KLDELk7sKlko/8Ozea213ETHA=;
 b=cbMzhzKz0igd1wG38zaCwl1Cfss1Otule/x7eIs+Od/TdNtp8DKhicSWuuGz57ePE7DlpI
 ZpCxQpVDDvXbo9nsQh/VwX7nhh0WleeXCaBBzUJ6npsSCExKcW/uCdgls1J1OLGvAbiert
 1UrS4nPacw00KAZeogvfEsaeU1lrx7E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-228-YtKCsuaBMHmNcBZt9qCXiQ-1; Thu, 16 Jul 2020 09:34:02 -0400
X-MC-Unique: YtKCsuaBMHmNcBZt9qCXiQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 837091DE2;
 Thu, 16 Jul 2020 13:34:00 +0000 (UTC)
Received: from linux.fritz.box (ovpn-114-172.ams2.redhat.com [10.36.114.172])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E3B2775575;
 Thu, 16 Jul 2020 13:33:50 +0000 (UTC)
Date: Thu, 16 Jul 2020 15:33:48 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Subject: Re: [PATCH v2] crypto: use a stronger private key for tests
Message-ID: <20200716133348.GB4498@linux.fritz.box>
References: <20200715154701.1041325-1-berrange@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200715154701.1041325-1-berrange@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Content-Disposition: inline
Received-SPF: pass client-ip=205.139.110.120; envelope-from=kwolf@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/15 19:36:06
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
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 15.07.2020 um 17:47 hat Daniel P. Berrangé geschrieben:
> The unit tests using the x509 crypto functionality have started
> failing in Fedora 33 rawhide with a message like
> 
>       The certificate uses an insecure algorithm
> 
> This is result of Fedora changes to support strong crypto [1]. RSA
> with 1024 bit key is viewed as legacy and thus insecure. Generate
> a new private key which is 3072 bits long and reasonable future
> proof.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>

Thanks, applied to the block branch.

Kevin


