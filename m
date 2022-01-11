Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B906748B0C3
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Jan 2022 16:24:32 +0100 (CET)
Received: from localhost ([::1]:45500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7J0h-0000us-T6
	for lists+qemu-devel@lfdr.de; Tue, 11 Jan 2022 10:24:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34758)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1n7IzR-0007nq-FR
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 10:23:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:51073)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1n7IzO-00077e-KO
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 10:23:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641914588;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EFBMTcB7S5j7ydpNmNXSvCYPtfCc5BcD7a9M/xIvIAo=;
 b=Xc2RZQ8vi9D7mQA6DM9OmTLpUZBkB7+WDxwWTpnbTRGlFS+imd7UY20oMxDQeso8YAUXl2
 YRjgxNRK1cv38Ltt6dowC3okKneG3R/Q6WzmYk12pC/z+j0eygmQMpBRRLKmlxw1P/7ID2
 gzsqMOXDe6UFVIZ0OwQ3tSXGx7jFZXg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-517-EP_0A6uNNWm0KBuBTJejKQ-1; Tue, 11 Jan 2022 10:23:05 -0500
X-MC-Unique: EP_0A6uNNWm0KBuBTJejKQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7C0F18AF4F4;
 Tue, 11 Jan 2022 15:22:09 +0000 (UTC)
Received: from redhat.com (unknown [10.39.195.148])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D4E857F80D;
 Tue, 11 Jan 2022 15:21:20 +0000 (UTC)
Date: Tue, 11 Jan 2022 16:21:19 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Subject: Re: [PATCH 0/1] Fix -device JSON support wrt hotplug
Message-ID: <Yd2gb5GgKwIGBq1o@redhat.com>
References: <20220105123847.4047954-1-berrange@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220105123847.4047954-1-berrange@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.595,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Laurent Vivier <lvivier@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Thomas Huth <thuth@redhat.com>, Peter Krempa <pkrempa@redhat.com>,
 qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 05.01.2022 um 13:38 hat Daniel P. Berrangé geschrieben:
> Libvirt switched to using -device JSON support, but we discovered in
> testing that it is broken for hotplug, never sending DEVICE_DELETED
> events. This is caused by a subtle refcount leak.

Oops, so I fell again in the trap of this interface returning a strong
reference... Maybe it's just me, but I find it highly unintuitive.

Thanks, applied to the block branch.

Kevin


