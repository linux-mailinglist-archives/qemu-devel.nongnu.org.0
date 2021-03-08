Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B259330CDD
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 12:58:51 +0100 (CET)
Received: from localhost ([::1]:35532 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJEXC-0004na-DH
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 06:58:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59140)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lJEVG-0003XH-4h
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 06:56:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39811)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lJEVE-0003Zo-PJ
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 06:56:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615204608;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5cF1XPVwi/HHa9uVLIs4gHp+iPL3wnL6rBnBxDOUIUc=;
 b=gw07DMR6QqoY9iuI2Ec/PkubFIBZ7YzFLpkfBlH50prqDe8czUdpoQiewWpiuBABAnuT3l
 2baoPycbgOq1qDIP5MQXHh5XTR1eIPp/gTKMSilsZu6fN4rZIe9OomVVL/RkSpWA/fe2AO
 vm0cYQXN4IhjHoajEEU+Z1cEadylJlA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-75--vTx5ed2Mjal16Sz830jaQ-1; Mon, 08 Mar 2021 06:56:44 -0500
X-MC-Unique: -vTx5ed2Mjal16Sz830jaQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 464DF83DD27;
 Mon,  8 Mar 2021 11:56:43 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-112-100.ams2.redhat.com [10.36.112.100])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 294FC19C79;
 Mon,  8 Mar 2021 11:56:42 +0000 (UTC)
Date: Mon, 8 Mar 2021 12:56:40 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Connor Kuehl <ckuehl@redhat.com>
Subject: Re: [PATCH v2 0/2] Clarify error messages pertaining to 'node-name'
Message-ID: <20210308115640.GD7021@merkur.fritz.box>
References: <20210305151929.1947331-1-ckuehl@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210305151929.1947331-1-ckuehl@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: armbru@redhat.com, qemu-devel@nongnu.org, qemu-block@nongnu.org,
 mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 05.03.2021 um 16:19 hat Connor Kuehl geschrieben:
> v2:
>   - Moved summary into patch #1
>   - Updated test cases that were missed in v1 from running 'make check'.
>     This time I used 'make check-block SPEED=thorough' and some more
>     grepping to make sure I didn't miss any.
>   - Rebased

Thanks, applied to the block branch.

Kevin


