Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2315A181707
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Mar 2020 12:45:30 +0100 (CET)
Received: from localhost ([::1]:50072 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jBznl-0002jp-77
	for lists+qemu-devel@lfdr.de; Wed, 11 Mar 2020 07:45:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33610)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <imammedo@redhat.com>) id 1jBzmr-0002G5-T7
 for qemu-devel@nongnu.org; Wed, 11 Mar 2020 07:44:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <imammedo@redhat.com>) id 1jBzmq-0008U5-RU
 for qemu-devel@nongnu.org; Wed, 11 Mar 2020 07:44:33 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:56769
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <imammedo@redhat.com>) id 1jBzmq-0008Tz-Nu
 for qemu-devel@nongnu.org; Wed, 11 Mar 2020 07:44:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583927072;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3Lb7m4PnJTcZ2LiiIUnPdjweRjhILgMPrziQv6ysFo8=;
 b=SdaR6hXm+teGwvj1QamLTMHcHQENLaSuhHn1mW6K3AKVjn6v+6wEzVKTpj0xrT1CPIVwo+
 YySYGTfUqXmtOdj/wITPli4ySD4pN7lt/VvguVBSafS9l9lXzzrwDa/gvAfay1u6T+3Iu0
 t0pYnP+rwiXs6aVA6CIAPLu872JFevA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-279-KEBEf2u1MiqK98eAzHB2zA-1; Wed, 11 Mar 2020 07:44:30 -0400
X-MC-Unique: KEBEf2u1MiqK98eAzHB2zA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 926EC1005512;
 Wed, 11 Mar 2020 11:44:29 +0000 (UTC)
Received: from localhost (ovpn-200-57.brq.redhat.com [10.40.200.57])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 787D55C28F;
 Wed, 11 Mar 2020 11:44:19 +0000 (UTC)
Date: Wed, 11 Mar 2020 12:44:18 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Babu Moger <babu.moger@amd.com>
Subject: Re: [PATCH v6 06/13] hw/i386: Rename apicid_from_topo_ids to
 x86_apicid_from_topo_ids
Message-ID: <20200311124418.3dc6819c@redhat.com>
In-Reply-To: <158389403816.22020.5329773045205545769.stgit@naples-babu.amd.com>
References: <158389385028.22020.7608244627303132902.stgit@naples-babu.amd.com>
 <158389403816.22020.5329773045205545769.stgit@naples-babu.amd.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: ehabkost@redhat.com, mst@redhat.com, qemu-devel@nongnu.org,
 pbonzini@redhat.com, rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 10 Mar 2020 21:33:58 -0500
Babu Moger <babu.moger@amd.com> wrote:

> For consistancy rename apicid_from_topo_ids to x86_apicid_from_topo_ids.

minor typo

s/consistancy/consistency/

> No functional change.
> 
> Signed-off-by: Babu Moger <babu.moger@amd.com>
> Reviewed-by: Igor Mammedov <imammedo@redhat.com>
> Acked-by: Michael S. Tsirkin <mst@redhat.com>
[...]


