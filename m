Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EDA422C8D8B
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Nov 2020 20:00:50 +0100 (CET)
Received: from localhost ([::1]:44126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kjoPp-0004NF-I8
	for lists+qemu-devel@lfdr.de; Mon, 30 Nov 2020 14:00:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41690)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pkrempa@redhat.com>)
 id 1kjoNo-0003Mq-AT
 for qemu-devel@nongnu.org; Mon, 30 Nov 2020 13:58:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:45696)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pkrempa@redhat.com>)
 id 1kjoNm-0006Qx-EV
 for qemu-devel@nongnu.org; Mon, 30 Nov 2020 13:58:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606762721;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3vDlhyOwRE9EXyPt5FXLbocNpUySz5M+tS0NlaS06/I=;
 b=F9eRAoAWJ+0lK+qREEdPUBwoyxlyAFlObLr7UTM7Yv7ylcpVxTeGW7q+MbbTub95IDdoTY
 da3JwdW92P/gLL7zs2nNYe3jvP8ydxf/TvxwC2/MZGRsCv2EBEqvs/bOk5ArxPie5ZVR0T
 cejS5atGvFkOEgQuIv8kow1p37HOYX0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-42-u4vImRSsM9aARgfqGbvfng-1; Mon, 30 Nov 2020 13:58:39 -0500
X-MC-Unique: u4vImRSsM9aARgfqGbvfng-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A142AAFA81;
 Mon, 30 Nov 2020 18:58:38 +0000 (UTC)
Received: from angien.pipo.sk (unknown [10.40.208.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 898BA6086F;
 Mon, 30 Nov 2020 18:58:35 +0000 (UTC)
Date: Mon, 30 Nov 2020 19:58:32 +0100
From: Peter Krempa <pkrempa@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Subject: Re: [PATCH 00/18] qapi/qom: QAPIfy object-add
Message-ID: <20201130185832.GN105758@angien.pipo.sk>
References: <20201130122538.27674-1-kwolf@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201130122538.27674-1-kwolf@redhat.com>
X-PGP-Key-ID: 0xD018682B
X-PGP-Key-Fingerprint: D294 FF38 A6A2 BF40 6C75  5DEF 36EC 16AC D018 682B
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pkrempa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pkrempa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.496,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: lvivier@redhat.com, thuth@redhat.com, ehabkost@redhat.com,
 qemu-block@nongnu.org, libvir-list@redhat.com, jasowang@redhat.com,
 qemu-devel@nongnu.org, mreitz@redhat.com, kraxel@redhat.com,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Nov 30, 2020 at 13:25:20 +0100, Kevin Wolf wrote:
> This series adds a QAPI type for the properties of all user creatable
> QOM types and finally makes QMP object-add use the new ObjectOptions
> union so that QAPI introspection can be used for user creatable objects.

FYI, here's a libvirt patchset which (apart from refactors) adds
compatibility with the deprecated/removed 'props' sub-object and also
adds testing to see whether all objects used by libvirt conform to the
new schema:

https://www.redhat.com/archives/libvir-list/2020-November/msg01625.html

Spoiler alert: surprisingly they do match so no updates are necessary!


