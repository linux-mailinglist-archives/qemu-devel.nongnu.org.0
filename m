Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7589F2D6155
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Dec 2020 17:12:44 +0100 (CET)
Received: from localhost ([::1]:59734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knOYd-0001yl-Fp
	for lists+qemu-devel@lfdr.de; Thu, 10 Dec 2020 11:12:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33306)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1knOVh-0008GV-I5
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 11:09:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59848)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1knOVf-0000Ay-Vu
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 11:09:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607616579;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CAj4vS2wS5Yud7XCGMGdMkV1AFTl7Dp2jw7/YIIsIdc=;
 b=Zgv3Dp43hNCjCh+yF4st8kKZ9mljRq1I/cffffpOYVqRmyxtR1XHwWUJuosGUDjMSoWMww
 hfCDbDix4HaOgXPFmtqytmlvp7JsfhcOtuyjePch/tqYQTppICkNyl2VzSdm2oPi+t5HvZ
 Ghe/W/lh/uE5hX6euSLAUJPm7pzlG4M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-37-yynELUPnPBW8v46UX5UyUQ-1; Thu, 10 Dec 2020 11:09:37 -0500
X-MC-Unique: yynELUPnPBW8v46UX5UyUQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 522AB800D62
 for <qemu-devel@nongnu.org>; Thu, 10 Dec 2020 16:09:36 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-62.ams2.redhat.com [10.36.112.62])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 20DF86A252;
 Thu, 10 Dec 2020 16:09:24 +0000 (UTC)
Subject: Re: [PATCH 1/4] accel/tcg: Remove deprecated '-tb-size' option
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
References: <20201210155808.233895-1-thuth@redhat.com>
 <20201210155808.233895-2-thuth@redhat.com>
Message-ID: <12c11520-fb23-2998-fd69-a10eaaaa3a5b@redhat.com>
Date: Thu, 10 Dec 2020 17:09:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <20201210155808.233895-2-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: libvir-list@redhat.com,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>, kraxel@redhat.com,
 mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/12/2020 16.58, Thomas Huth wrote:
> From: Philippe Mathieu-Daudé <philmd@redhat.com>
> 
> The '-tb-size' option (replaced by '-accel tcg,tb-size') is
> deprecated since 5.0 (commit fe174132478). Remove it.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> Message-Id: <20201202112714.1223783-1-philmd@redhat.com>

I forgot to add the "Reviewed-by: Ján Tomko <jtomko@redhat.com>" from the
initial version that Philippe posted a week ago


>  
> @@ -523,6 +516,11 @@ for the ``id`` parameter, which should now be used instead.
>  
>  The ``-no-kvm`` argument was a synonym for setting ``-machine accel=tcg``.
>  
> +``-tb-size`` option (removed in 6.0)
> +'''''''''''''''''''''''''''''''

''' needs adjustment -------------^

 Thomas


