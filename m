Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A4B2130DB35
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 14:29:13 +0100 (CET)
Received: from localhost ([::1]:53410 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7IDY-0002hn-Ag
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 08:29:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59058)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1l7IAL-0000zV-Ae
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 08:25:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29257)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1l7IAI-0007Tc-0e
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 08:25:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612358748;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oQLTr46nEoxBQEdjscKsQ+beOqVLBrus6F3qvioMbGY=;
 b=f7etiCKpUWLGcGrGNB/aiGqaOcmKqsxIkZEsOcg9ZYrQnZh8Hg/sWYovmf2Gb/drYnGnGI
 xTBjmC0eELb4ZJmlcsTtgZ4caNwJweCtLxo0RznPSFtKcKZ8vJIg/aMMSA85lZ+b1nA37h
 ABTwGnzf4XQ7trluF0OhQwrK0GP/0KU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-397-B_PIRojbOl-lBgQxrJkfBQ-1; Wed, 03 Feb 2021 08:25:45 -0500
X-MC-Unique: B_PIRojbOl-lBgQxrJkfBQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ACA52EC1A1
 for <qemu-devel@nongnu.org>; Wed,  3 Feb 2021 13:25:44 +0000 (UTC)
Received: from [10.3.112.103] (ovpn-112-103.phx2.redhat.com [10.3.112.103])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8783E1971D
 for <qemu-devel@nongnu.org>; Wed,  3 Feb 2021 13:25:44 +0000 (UTC)
Subject: Re: [PULL 00/20] NBD patches for 2021-02-02
To: qemu-devel@nongnu.org
References: <161230756982.28419.16212519598286401273@c667a6b167f6>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <609897ed-b6a3-4d99-abdc-2d9e7a9229e4@redhat.com>
Date: Wed, 3 Feb 2021 07:25:43 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <161230756982.28419.16212519598286401273@c667a6b167f6>
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
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.539,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.178, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/2/21 5:12 PM, no-reply@patchew.org wrote:
> Patchew URL: https://patchew.org/QEMU/20210202224529.642055-1-eblake@redhat.com/
> 
> 
> 
> Hi,
> 
> This series seems to have some coding style problems. See output below for
> more information:
> 

> WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?
> #73: 
> new file mode 100644
> 
> ERROR: trailing whitespace
> #82: FILE: block/io.c.rej:5:

Ouch. That file should not be there. I will send a v2 pull request ASAP.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


