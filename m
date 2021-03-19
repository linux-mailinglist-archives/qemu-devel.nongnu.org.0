Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 63F8C341640
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Mar 2021 08:04:03 +0100 (CET)
Received: from localhost ([::1]:38404 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lN9Aw-0005WO-DA
	for lists+qemu-devel@lfdr.de; Fri, 19 Mar 2021 03:04:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34546)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lN98L-0003QA-SH
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 03:01:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:47111)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lN98I-0006uL-7j
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 03:01:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616137277;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7tDK/f+GoP3LhgF4evPSpBtFzyZzx1/rk7EHwTVf0Ps=;
 b=G/6ANX6446fR1Wvu/p9Ypv6yuY1ZBydwPW78HsqSw0kwap08cSuZKFkQSQBa62pIyUg0wO
 Jx1OS3aqdZx094NjPTqfc0lzb5SwEzdtW+y3KzrTWuJCA553e1n+ilevLOjObkpj3H0Wmc
 6J4/Th4WnxOOWjytPMx9TmI/QjDcRjQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-424-sNSovej1MNCqPoN1ljgdxA-1; Fri, 19 Mar 2021 03:01:13 -0400
X-MC-Unique: sNSovej1MNCqPoN1ljgdxA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0B03E81431E;
 Fri, 19 Mar 2021 07:01:12 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-49.ams2.redhat.com [10.36.112.49])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5E7FD6F973;
 Fri, 19 Mar 2021 07:01:10 +0000 (UTC)
Subject: Re: [PATCH v1] MAINTAINERS: Fix tests/migration maintainers
To: huangy81@chinatelecom.cn, qemu-devel <qemu-devel@nongnu.org>
References: <2d8e1deedd754dda36802f26bcdfcbf7adde2679.1616120469.git.huangy81@chinatelecom.cn>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <369341d8-c12c-bf96-5cdc-44f77c86eee3@redhat.com>
Date: Fri, 19 Mar 2021 08:01:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <2d8e1deedd754dda36802f26bcdfcbf7adde2679.1616120469.git.huangy81@chinatelecom.cn>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.249,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Juan Quintela <quintela@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 19/03/2021 03.25, huangy81@chinatelecom.cn wrote:
> From: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
> 
> Signed-off-by: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
> ---
>   MAINTAINERS | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 25fc49d1dc..20e2387c66 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2525,6 +2525,7 @@ M: Cleber Rosa <crosa@redhat.com>
>   S: Odd Fixes
>   F: scripts/*.py
>   F: tests/*.py
> +F: tests/migration/

  Hi,

that looks like you've added it to the "Python" section ... but I think this 
should rather be be added to the "Migration" section instead?

  Thomas


