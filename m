Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6207129307E
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Oct 2020 23:30:10 +0200 (CEST)
Received: from localhost ([::1]:56434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kUcjJ-0008TV-8R
	for lists+qemu-devel@lfdr.de; Mon, 19 Oct 2020 17:30:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44630)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1kUciQ-000812-DH
 for qemu-devel@nongnu.org; Mon, 19 Oct 2020 17:29:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:29516)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1kUciN-0002iX-19
 for qemu-devel@nongnu.org; Mon, 19 Oct 2020 17:29:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603142948;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WBgsilzlAAIL2FoCf/nfdzKyf1euMag9a1p0cnOksEM=;
 b=UpPm/cZ6jH6CXpaNee5Z8saM+OggKCVjSo+Qob2QkXjlRloiAY0+DBUzhTC7kyZrlmD9XF
 D74lPDEaa52q672/4FOgzAQ6/wtsNJldovFOZO44fJ9QLIHd+lXPuo/BDsdGabiJfhOtlw
 dxbnZMzlDzEy6N4M4/Rl+9ZPYGol3HQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-130-QmC5wDF-OO25iR81caMjMA-1; Mon, 19 Oct 2020 17:29:06 -0400
X-MC-Unique: QmC5wDF-OO25iR81caMjMA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 192CB19080A1
 for <qemu-devel@nongnu.org>; Mon, 19 Oct 2020 21:29:05 +0000 (UTC)
Received: from [10.3.112.28] (ovpn-112-28.phx2.redhat.com [10.3.112.28])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A5ED455781;
 Mon, 19 Oct 2020 21:29:04 +0000 (UTC)
Subject: Re: [PATCH] scripts/qmp: delete 'qmp' script
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
References: <20201019210430.1063390-1-jsnow@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <776f37e6-a660-867e-d4df-b6b5e5565926@redhat.com>
Date: Mon, 19 Oct 2020 16:29:04 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <20201019210430.1063390-1-jsnow@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/19 02:32:01
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
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
Cc: Markus Armbruster <armbru@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/19/20 4:04 PM, John Snow wrote:
> This script has not seen a patch that was specifically for this script
> since it was moved to this location in 2013, and I doubt it is used. It
> uses "man qmp" for its help message, which does not exist. It also
> presumes there is a manual page for qmp-XXX, for each defined qmp
> command XXX. I don't think that's true.
> 
> The format it expects arguments in is something like:
> 
> block-dirty-bitmap-add --node=foo --name=bar
> 
> and has no capacity to support nested JSON arguments, either.
> 
> Most developers use either qmp-shell or socat (or pasting JSON directly
> into qmp stdio), so this duplication and additional alternate syntax is
> not helpful.
> 
> Remove it. Leave a breadcrumb script just in case, to be removed next
> release cycle.
> 
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>   scripts/qmp/qmp | 131 +++---------------------------------------------
>   1 file changed, 7 insertions(+), 124 deletions(-)
> 
> -sys.path.append(os.path.join(os.path.dirname(__file__), '..', '..', 'python'))
> -from qemu.qmp import QEMUMonitorProtocol
> +print('''This unmaintained and undocumented script was removed in preference
> +for qmp-shell. The assumption is that most users are using either
> +qmp-shell, socat, or pasting/piping JSON into stdio. The duplication of
> +facilities here is unwanted, and the divergence of syntax harmful.''',
> +      file=sys.stderr)
>   

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


