Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6468730FDA5
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 21:05:08 +0100 (CET)
Received: from localhost ([::1]:55662 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7ksA-0003V0-8e
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 15:05:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33132)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1l7kqH-0002b8-T8
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 15:03:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:23199)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1l7kqG-0007eM-1d
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 15:03:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612468983;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9VyMbVrWwN9sxWINMq/9lf5xZMWFhPRdOS/NVALpJwY=;
 b=eoskkkmsRTtH2wPOoOcSZ7cZF1+jDTn9SjKbv68oIKi4o/Ut4pP10lQUv+RIxcywg2XhLR
 KCOC3n+uiCEvXH+0h7l4aaHhIK3qd6dDEnJpbnbeQuDsQ198ivlzeKpwencpNchOsF2sAE
 Po4x1NkFgtNm6g8muVftGfVwoBV2+4I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-38-3clr5p15NqqmbR-4lpRSHQ-1; Thu, 04 Feb 2021 15:03:00 -0500
X-MC-Unique: 3clr5p15NqqmbR-4lpRSHQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 823EB107ACC7;
 Thu,  4 Feb 2021 20:02:59 +0000 (UTC)
Received: from [10.3.112.103] (ovpn-112-103.phx2.redhat.com [10.3.112.103])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B122660BF1;
 Thu,  4 Feb 2021 20:02:55 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
References: <20210204190708.1306296-1-eblake@redhat.com>
 <20210204190708.1306296-4-eblake@redhat.com>
Organization: Red Hat, Inc.
Subject: Re: [PATCH 3/3] utils: Deprecate inexact fractional suffix sizes
Message-ID: <e7cfe14c-2a55-47be-a840-6a6a943e9072@redhat.com>
Date: Thu, 4 Feb 2021 14:02:54 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210204190708.1306296-4-eblake@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.351,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.182, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: vsementsov@virtuozzo.com, berrange@redhat.com, qemu-block@nongnu.org,
 tao3.xu@intel.com, armbru@redhat.com,
 "libvirt-list@redhat.com" <libvirt-list@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/4/21 1:07 PM, Eric Blake wrote:
> The value '1.1k' is inexact; 1126.4 bytes is not possible, so we
> happen to truncate it to 1126.  Our use of fractional sizes is
> intended for convenience, but when a user specifies a fraction that is
> not a clean translation to binary, truncating/rounding behind their
> backs can cause confusion.  Better is to deprecate inexact values,
> which still leaves '1.5k' as valid, but alerts the user to spell out
> their values as a precise byte number in cases where they are
> currently being rounded.

And I promptly forgot to save my changes in my editor.  Consider this
squashed in:

diff --git i/docs/system/deprecated.rst w/docs/system/deprecated.rst
index c404c3926e6f..8e5e05a10642 100644
--- i/docs/system/deprecated.rst
+++ w/docs/system/deprecated.rst
@@ -154,6 +154,15 @@ Input parameters that take a size value should only
use a size suffix
 the value is hexadecimal.  That is, '0x20M' is deprecated, and should
 be written either as '32M' or as '0x2000000'.

+inexact sizes via scaled fractions (since 6.0)
+''''''''''''''''''''''''''''''''''''''''''''''
+
+Input parameters that take a size value should only use a fractional
+size (such as '1.5M') that will result in an exact byte value.  The
+use of inexact values (such as '1.1M') that require truncation or
+rounding is deprecated, and you should instead consider writing your
+unusual size in bytes (here, '1153433' or '1153434' as desired).
+
 QEMU Machine Protocol (QMP) commands
 ------------------------------------



-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


