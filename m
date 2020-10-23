Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1DCE296975
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Oct 2020 07:45:36 +0200 (CEST)
Received: from localhost ([::1]:58646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kVptP-0002qE-Ak
	for lists+qemu-devel@lfdr.de; Fri, 23 Oct 2020 01:45:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43940)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kVprz-0002Gq-M3
 for qemu-devel@nongnu.org; Fri, 23 Oct 2020 01:44:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34951)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kVprv-0007m7-NT
 for qemu-devel@nongnu.org; Fri, 23 Oct 2020 01:44:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603431840;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=l8py1AfDLcwt87EI6ieYi0UyTEawfWomAP9WiBqgPUk=;
 b=BkLPIzwWIOdKt3eJtUIrtpfmro/QCZKJu1I88XvwJHcKW+du3pUBaTq1E5Z+jr8Kn+L0KO
 3ku4Eqe2GqcksKnDHkON5QRDR4jA3D/xPCaFJv7unrp+fPx5vnHRrATKvII05whpDIp4hV
 HP9lbo0fzHVCVTxBWmc4bOJghBdkDgQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-577-QlpYjzGWNrSYT_zI0M77dg-1; Fri, 23 Oct 2020 01:43:57 -0400
X-MC-Unique: QlpYjzGWNrSYT_zI0M77dg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 57E70186DD3F;
 Fri, 23 Oct 2020 05:43:56 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-123.ams2.redhat.com [10.36.112.123])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F3A651002388;
 Fri, 23 Oct 2020 05:43:54 +0000 (UTC)
Subject: Re: [PATCH] CHANGELOG: remove disused file
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
References: <20201022162843.1841780-1-jsnow@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <576a881d-2c64-3e40-31b7-43680a1988f8@redhat.com>
Date: Fri, 23 Oct 2020 07:43:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20201022162843.1841780-1-jsnow@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/23 01:44:00
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.107, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: qemu-trivial@nongnu.org, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 22/10/2020 18.28, John Snow wrote:
> There's no reason to keep this here; the versions described are
> ancient. Everything here is still mirrored on
> https://wiki.qemu.org/ChangeLog/old if anyone is curious; otherwise, use
> the git history.
> 
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  Changelog | 580 ------------------------------------------------------
>  1 file changed, 580 deletions(-)
>  delete mode 100644 Changelog
> 
> diff --git a/Changelog b/Changelog
> deleted file mode 100644
> index f7e178ccc01..00000000000
> --- a/Changelog
> +++ /dev/null
> @@ -1,580 +0,0 @@
> -This file documents changes for QEMU releases 0.12 and earlier.
> -For changelog information for later releases, see
> -https://wiki.qemu.org/ChangeLog or look at the git history for
> -more detailed information.

I agree with removing the old log. But should we maybe leave a pointer to
https://wiki.qemu.org/ChangeLog / the git history here to let people know
how to see the changelogs?

 Thomas


