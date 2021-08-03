Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB0A83DF21A
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Aug 2021 18:06:47 +0200 (CEST)
Received: from localhost ([::1]:51638 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAwwI-0005hp-VE
	for lists+qemu-devel@lfdr.de; Tue, 03 Aug 2021 12:06:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51226)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mAwrd-0007NC-7a
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 12:01:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35675)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mAwrT-00028M-7k
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 12:01:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628006504;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=occVS7jDdfEhu6JIgVDeRAsfxpsMn1CjsYBcQl4cbPM=;
 b=Sy5EDwvVDeEVZ798djpbUx3X/FXtZV4N4ortllR9F9TYhMNQL8C+T2nv0Ln8s658yqIaSK
 5qJwPDy/QJNGvcJEFgXtdlhU5WeQTdEVMVZL/nLEjM1AGPdAkoSXjOB80kmY7CoapAMSKN
 IeIhZ+txcuJEpxZK8m+qTcoZiEXkTaw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-29-Nt26qn9KMyuS5F1NMVVdRQ-1; Tue, 03 Aug 2021 12:01:41 -0400
X-MC-Unique: Nt26qn9KMyuS5F1NMVVdRQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6791F1009600;
 Tue,  3 Aug 2021 16:01:40 +0000 (UTC)
Received: from redhat.com (ovpn-114-4.phx2.redhat.com [10.3.114.4])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7AE7460C05;
 Tue,  3 Aug 2021 16:01:31 +0000 (UTC)
Date: Tue, 3 Aug 2021 11:01:29 -0500
From: Eric Blake <eblake@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH v2 02/24] python/aqmp: add error classes
Message-ID: <20210803160129.e63u5lylorivgjov@redhat.com>
References: <20210717003253.457418-1-jsnow@redhat.com>
 <20210717003253.457418-3-jsnow@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210717003253.457418-3-jsnow@redhat.com>
User-Agent: NeoMutt/20210205-687-0ed190
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-devel@nongnu.org,
 "Niteesh G . S ." <niteesh.gs@gmail.com>,
 Willian Rampazzo <wrampazz@redhat.com>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jul 16, 2021 at 08:32:31PM -0400, John Snow wrote:
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  python/qemu/aqmp/__init__.py |  4 +++
>  python/qemu/aqmp/error.py    | 50 ++++++++++++++++++++++++++++++++++++
>  2 files changed, 54 insertions(+)
>  create mode 100644 python/qemu/aqmp/error.py

> +++ b/python/qemu/aqmp/error.py
> @@ -0,0 +1,50 @@

> +
> +class ProtocolError(AQMPError):
> +    """
> +    Abstract error class for protocol failures.
> +
> +    Semantically, these errors are generally the fault of either the
> +    protocol server or as a result of a bug in this this library.

duplicate 'this'

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


