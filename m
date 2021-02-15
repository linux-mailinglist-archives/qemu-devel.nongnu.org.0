Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4471731C3B1
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Feb 2021 22:37:24 +0100 (CET)
Received: from localhost ([::1]:52972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBlYZ-0000J5-Ae
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 16:37:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54328)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lBlWg-0007oX-JB
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 16:35:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34676)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lBlWe-00015k-TB
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 16:35:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613424924;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4yMCUNoYeHX7I4f+VWppZhG4f0a81KZOlDYSqEuKrkU=;
 b=EIjcqkGvThRLPk5KJ1pNirRAx0nfzIWp6HfxXA4wnzqRIRMUi5zk8DPnsHTw/UY/ai5VTW
 BlDhACh9gwfu/xU+c+X3NxVwKLKG3naFaVzerzsBixc6iLOsTpsfCIqcu3e9YRyMVQNnWH
 B7/si3HDbkW771lUtygmj2avOSRRoMc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-369-2vSQtV8zNAeZwG_JN73Jqw-1; Mon, 15 Feb 2021 16:35:21 -0500
X-MC-Unique: 2vSQtV8zNAeZwG_JN73Jqw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 29B558799E0
 for <qemu-devel@nongnu.org>; Mon, 15 Feb 2021 21:35:20 +0000 (UTC)
Received: from [10.3.112.50] (ovpn-112-50.phx2.redhat.com [10.3.112.50])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E47155D9C0;
 Mon, 15 Feb 2021 21:35:19 +0000 (UTC)
Subject: Re: [PULL 00/19] i386, qgraph patches for 2020-02-15
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20210215131626.65640-1-pbonzini@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <d6098e0b-9000-d549-a3cd-4c3efb26ddc1@redhat.com>
Date: Mon, 15 Feb 2021 15:13:35 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210215131626.65640-1-pbonzini@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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

On 2/15/21 7:16 AM, Paolo Bonzini wrote:
> The following changes since commit 41d306ec7d9885752fec434904df08b9c1aa3add:
> 
>   Merge remote-tracking branch 'remotes/bonzini-gitlab/tags/for-upstream' into staging (2021-02-09 10:04:51 +0000)
> 
> are available in the Git repository at:
> 
>   https://gitlab.com/bonzini/qemu.git tags/for-upstream
> 
> for you to fetch changes up to bf98b5857a101f9032377044c250ab728464bcb0:
> 
>   hvf: Fetch cr4 before evaluating CPUID(1) (2021-02-09 18:47:45 +0100)
> 

> qemu_oss--- via (5):
>       libqos/qgraph: add qos_node_create_driver_named()
>       libqos/qgraph_internal: add qos_printf() and qos_printf_literal()
>       tests/qtest/qos-test: dump qos graph if verbose
>       tests/qtest/qos-test: dump environment variables if verbose
>       tests/qtest/qos-test: dump QEMU command if verbose

If we take this pull request as-is, we'll need a followup patch to
.mailmap to clean up the mess made by the list software.  If there's
still time, it may be easier for Paolo to spin a v2 pull request with
updated authorship information.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


