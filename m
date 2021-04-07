Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69D57357736
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Apr 2021 23:55:11 +0200 (CEST)
Received: from localhost ([::1]:50064 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUG8k-0005YY-HN
	for lists+qemu-devel@lfdr.de; Wed, 07 Apr 2021 17:55:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50992)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1lUG7t-00055H-Qp
 for qemu-devel@nongnu.org; Wed, 07 Apr 2021 17:54:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32993)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1lUG7q-0001kI-Gr
 for qemu-devel@nongnu.org; Wed, 07 Apr 2021 17:54:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617832452;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iW3VnuKRObFsosxIZ8sy2FDiYKqsDt5jVEY/4SEP7oQ=;
 b=iHoCl2/dC85pJN9SwmppjN0lmPzx+j6ETcjr3ZZz951BOBH4ZcmqRx3X8kUg7NXqTv3NxM
 GNQP4LZLTu3Pc5iaTMcu5vHSXuXyZI+zrRXXJaWnbS+rdySela8S0JFiC/hApA63ZSEHdE
 NO/P/zTPOUVY8c1CoQifyPEEbScFPFU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-432-jfHu0PWNNiWu039KikJWeA-1; Wed, 07 Apr 2021 17:54:09 -0400
X-MC-Unique: jfHu0PWNNiWu039KikJWeA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7F8521883520;
 Wed,  7 Apr 2021 21:54:08 +0000 (UTC)
Received: from localhost (unknown [10.40.208.10])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5779319CAD;
 Wed,  7 Apr 2021 21:54:06 +0000 (UTC)
Date: Wed, 7 Apr 2021 23:54:05 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: David Ober <1915063@bugs.launchpad.net>
Subject: Re: [Bug 1915063] Re: Windows 10 wil not install using
 qemu-system-x86_64
Message-ID: <20210407235405.584ec68e@redhat.com>
In-Reply-To: <161780042380.29247.4415481924442945799.malone@gac.canonical.com>
References: <161281335451.16853.7070328699645987751.malonedeb@wampee.canonical.com>
 <161780042380.29247.4415481924442945799.malone@gac.canonical.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Babu Moger <babu.moger@amd.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 07 Apr 2021 13:00:23 -0000
David Ober <1915063@bugs.launchpad.net> wrote:

> I have not done any of what you are asking so not exactly sure how to
> change those values, been looking and reading but not finding what I
> want so thought it might be better to just ask how to do what yo are
> asking.

see https://libvirt.org/formatdomain.html#cpu-model-and-topology
for the way to describe topology in domain xml.
Pick a real AMD CPU for cpu model you're are having problem with,
and use its config to define topology.

> I did try CPU type EPYC and that did get past the error I am
> seeing on install
So it works with EPYC but not with ECPY-Rome, then probably topology
is not issue.

CCing Babu,
who added EPYC-Rome cpu model, maybe he can help



