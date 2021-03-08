Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 016BD331760
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 20:36:06 +0100 (CET)
Received: from localhost ([::1]:48316 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJLfh-0002Fi-14
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 14:36:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51814)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lJLeJ-0001Eo-NU
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 14:34:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60977)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lJLeH-0008Ra-Bk
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 14:34:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615232076;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=f0RTQzvR9Wxe+1njYxjADrbgxpZAf+mPGcp1sJf7xdc=;
 b=SW2ARGB2VkeLQnMtvHR8X5mrLJDBJ/MY/P12onUNPzc+9kTAKlY8wxWlhejJBmAwnUjTOQ
 FoIS89WwsUrnEzKYJLokvqdUcVLJBIf/JedDtn5lYDGqmDdTAUkzdP75nuSMTSkR7YpKWJ
 pmmaYjNtlMS74YNSIG9+Ajv5tnFLvyE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-371-R5WsipOINLyV4UD7hV3bvA-1; Mon, 08 Mar 2021 14:34:34 -0500
X-MC-Unique: R5WsipOINLyV4UD7hV3bvA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2A86880432E;
 Mon,  8 Mar 2021 19:34:33 +0000 (UTC)
Received: from [10.3.112.36] (ovpn-112-36.phx2.redhat.com [10.3.112.36])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C107719C79;
 Mon,  8 Mar 2021 19:34:25 +0000 (UTC)
Subject: Re: [PATCH v3 29/30] vl: QAPIfy -object
To: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org
References: <20210308165440.386489-1-kwolf@redhat.com>
 <20210308165440.386489-30-kwolf@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <277ecff2-3b55-4ae4-9ab3-c2a643565d71@redhat.com>
Date: Mon, 8 Mar 2021 13:34:24 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210308165440.386489-30-kwolf@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: lvivier@redhat.com, thuth@redhat.com, pkrempa@redhat.com,
 berrange@redhat.com, ehabkost@redhat.com, qemu-block@nongnu.org,
 libvir-list@redhat.com, jasowang@redhat.com, armbru@redhat.com,
 mreitz@redhat.com, kraxel@redhat.com, pbonzini@redhat.com, dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/8/21 10:54 AM, Kevin Wolf wrote:
> This switches the system emulator from a QemuOpts-based parser for
> -object to user_creatable_parse_str() which uses a keyval parser and
> enforces the QAPI schema.
> 
> Apart from being a cleanup, this makes non-scalar properties accessible.
> 
> This adopts a similar model as -blockdev uses: When parsing the option,
> create the ObjectOptions and queue them. At the later point where we
> used to create objects for the collected QemuOpts, the ObjectOptions
> queue is processed instead.
> 
> A complication compared to -blockdev is that object definitions are
> supported in -readconfig and -writeconfig.
> 
> After this patch, -readconfig still works, though it still goes through
> the QemuOpts parser, which means that improvements like non-scalar
> properties are still not available in config files.
> 
> -writeconfig stops working for -object. Tough luck. It has never
> supported all options (not even the common ones), so supporting one less
> isn't the end of the world. As object definitions from -readconfig still
> go through QemuOpts, they are still included in -writeconfig output,
> which at least prevents destroying your existing configuration when you
> just wanted to add another option.

Maybe worth a tweak to this paragraph now that b979c931 has landed
formally deprecating -writeconfig (all the more reason we don't care
about it).

> 
> Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> Acked-by: Peter Krempa <pkrempa@redhat.com>
> Reviewed-by: Eric Blake <eblake@redhat.com>

R-b stands either way.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


