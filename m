Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BDBD21D2DE
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Jul 2020 11:34:09 +0200 (CEST)
Received: from localhost ([::1]:36928 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1juuqe-0006Si-AA
	for lists+qemu-devel@lfdr.de; Mon, 13 Jul 2020 05:34:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58498)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1juumz-0002XL-62
 for qemu-devel@nongnu.org; Mon, 13 Jul 2020 05:30:21 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:44530
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1juumx-0006T7-GR
 for qemu-devel@nongnu.org; Mon, 13 Jul 2020 05:30:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594632618;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:openpgp:openpgp;
 bh=FdLMU6qLkcttHLbn7Aa3Ue/IzZRdlcXARXZ7Wgx/G0k=;
 b=c0WT1jawZ2gh6sxhLscKYgqlULwS3hbjxhblEBLIC2NG7sORp6/P9dRYwbcTRDBs1JwfvM
 lbFn9fI9YkE875SS52yR0gIrNk64rBe6tafdszhdYOKadCnVhTpaxitmEcHhk/jz3et4Mo
 eHdTDzy7TqkWE32AFNLsMl7rh9QRMX0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-161-hQ6w5rsyPtmO_WMC_QJjDw-1; Mon, 13 Jul 2020 05:30:16 -0400
X-MC-Unique: hQ6w5rsyPtmO_WMC_QJjDw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5D607107ACCA;
 Mon, 13 Jul 2020 09:30:15 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-125.ams2.redhat.com [10.36.112.125])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B10D257;
 Mon, 13 Jul 2020 09:30:13 +0000 (UTC)
Subject: Re: [PATCH 01/12] target/arm/kvm: Remove superfluous break
To: Yi Wang <wang.yi59@zte.com.cn>, qemu-devel@nongnu.org
References: <1594630986-36148-1-git-send-email-wang.yi59@zte.com.cn>
From: Thomas Huth <thuth@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <62491c40-2812-f7b3-7cb6-498bd587ff13@redhat.com>
Date: Mon, 13 Jul 2020 11:30:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <1594630986-36148-1-git-send-email-wang.yi59@zte.com.cn>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/13 02:19:41
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: xue.zhihong@zte.com.cn, QEMU Trivial <qemu-trivial@nongnu.org>,
 qemu-arm@nongnu.org, wang.liang82@zte.com.cn,
 Liao Pingfang <liao.pingfang@zte.com.cn>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 13/07/2020 11.03, Yi Wang wrote:
> From: Liao Pingfang <liao.pingfang@zte.com.cn>
> 
> Remove superfluous break.
> 
> Signed-off-by: Liao Pingfang <liao.pingfang@zte.com.cn>
> Signed-off-by: Yi Wang <wang.yi59@zte.com.cn>
> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org> 
> ---
>  target/arm/kvm64.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
> index 1169237..ef1e960 100644
> --- a/target/arm/kvm64.c
> +++ b/target/arm/kvm64.c
> @@ -330,7 +330,6 @@ int kvm_arch_remove_hw_breakpoint(target_ulong addr,
>      switch (type) {
>      case GDB_BREAKPOINT_HW:
>          return delete_hw_breakpoint(addr);
> -        break;
>      case GDB_WATCHPOINT_READ:
>      case GDB_WATCHPOINT_WRITE:
>      case GDB_WATCHPOINT_ACCESS:
> 

Reviewed-by: Thomas Huth <thuth@redhat.com>


