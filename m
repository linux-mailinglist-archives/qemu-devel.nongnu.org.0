Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21D3439E808
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Jun 2021 22:06:54 +0200 (CEST)
Received: from localhost ([::1]:49826 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqLWP-0002nE-6f
	for lists+qemu-devel@lfdr.de; Mon, 07 Jun 2021 16:06:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1lqLVS-0001W9-Se
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 16:05:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20579)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1lqLVR-0005dq-6d
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 16:05:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623096352;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Wb4YO5PQo0HQ1rqtzlSnNTgDySVBZjofSE5H1emEtpY=;
 b=gslRlcmynxFgIJfgERwiYC/M69NnnKwCEQXsY2bWunUJ/oRBb890cmk3liOD9AVmtKqEhg
 2VhFUZeLIJL5q8Ney8bwhKPKwh3XPXtt98WYiOd5rzGtj1QT9hs4BJwLtEQbAcptH+SWFW
 nb9dwASQll700NFLqL/2PQY3bBLAGl8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-259-iwatKiM-OAiD0b6ovJOVTQ-1; Mon, 07 Jun 2021 16:05:45 -0400
X-MC-Unique: iwatKiM-OAiD0b6ovJOVTQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5116C10074A6;
 Mon,  7 Jun 2021 20:05:43 +0000 (UTC)
Received: from localhost (ovpn-116-176.gru2.redhat.com [10.97.116.176])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B43E119714;
 Mon,  7 Jun 2021 20:05:39 +0000 (UTC)
Date: Mon, 7 Jun 2021 17:05:38 -0300
From: Eduardo Habkost <ehabkost@redhat.com>
To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Subject: Re: [PATCH v3 1/4] docs: add a table showing x86-64 ABI
 compatibility levels
Message-ID: <20210607200538.xudk6jgja2w2toel@habkost.net>
References: <20210607135843.196595-1-berrange@redhat.com>
 <20210607135843.196595-2-berrange@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210607135843.196595-2-berrange@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.2,
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Cleber Rosa <crosa@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jun 07, 2021 at 02:58:40PM +0100, Daniel P. Berrangé wrote:
> It is useful to know which CPUs satisfy each x86-64 ABI
> compatibility level, when dealing with guest OS that require
> something newer than the baseline ABI.
> 
> These ABI levels are defined in:
> 
>   https://gitlab.com/x86-psABIs/x86-64-ABI/
> 
> and supported by GCC, Clang, glibc and more.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>

Queued, thanks!

-- 
Eduardo


