Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 73D8450F210
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Apr 2022 09:19:02 +0200 (CEST)
Received: from localhost ([::1]:36778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njFTR-00024y-1A
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 03:19:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1njFQY-00012H-3i
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 03:16:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:60118)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1njFQU-0001FV-5c
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 03:15:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650957356;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=rRlyciOmW8eEAVve+AQtjwik24++lmBkE4PhJ2iAmMg=;
 b=XQiGpVMZwnIXIgFDpYa65YLbhHGMNSZNu466IzRm7M3Rl9hNjhkHx9kZ+ytPEqSre+1WV6
 Bze2SMk2I9HwyaPbxjBpsFM04NwzENdtS4ER1Oi/GooFqh5Fh8CHAtpj/8w+GuVX9DeMjL
 gv2L0TnB+g7rgIEY9R3FTVH5qowOltY=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-447-52k6_hPyMvCPQ8ge5dHNug-1; Tue, 26 Apr 2022 03:15:53 -0400
X-MC-Unique: 52k6_hPyMvCPQ8ge5dHNug-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F12873820F6B;
 Tue, 26 Apr 2022 07:15:51 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.9])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B624E43211F;
 Tue, 26 Apr 2022 07:15:51 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 46A66180038F; Tue, 26 Apr 2022 09:15:50 +0200 (CEST)
Date: Tue, 26 Apr 2022 09:15:50 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PULL 0/6] Kraxel 20220425 patches
Message-ID: <20220426071550.3y5h7ydyptppo777@sirius.home.kraxel.org>
References: <20220425061029.3932731-1-kraxel@redhat.com>
 <4f3017ea-3f6b-dd43-275a-5012cf0f412a@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4f3017ea-3f6b-dd43-275a-5012cf0f412a@linaro.org>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Beraldo Leal <bleal@redhat.com>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Cleber Rosa <crosa@redhat.com>, Eric Blake <eblake@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Apr 25, 2022 at 10:21:00AM -0700, Richard Henderson wrote:
> On 4/24/22 23:10, Gerd Hoffmann wrote:
> > The following changes since commit a74782936dc6e979ce371dabda4b1c05624ea87f:
> > 
> >    Merge tag 'pull-migration-20220421a' of https://gitlab.com/dagrh/qemu into staging (2022-04-21 18:48:18 -0700)
> > 
> > are available in the Git repository at:
> > 
> >    git://git.kraxel.org/qemu tags/kraxel-20220425-pull-request
> > 
> > for you to fetch changes up to ef798418a3037434951002d0afc5f3d919e294db:
> > 
> >    avocado/vnc: add test_change_listen (2022-04-22 13:43:28 +0200)
> > 
> > ----------------------------------------------------------------
> > vnc: add display-update monitor command.
> > screendump: add png support.
> > vmsvga: screen update fix.
> > 
> > ----------------------------------------------------------------
> > 
> > Carwyn Ellis (1):
> >    hw/display/vmware_vga: do not discard screen updates
> > 
> > Kshitij Suri (2):
> >    Replacing CONFIG_VNC_PNG with CONFIG_PNG
> >    Added parameter to take screenshot with screendump as PNG
> > 
> > Vladimir Sementsov-Ogievskiy (3):
> >    ui/vnc: refactor arrays of addresses to SocketAddressList
> >    qapi/ui: add 'display-update' command for changing listen address
> >    avocado/vnc: add test_change_listen
> 
> 
> Fails testing with
> 
>   ERROR: unknown option --disable-vnc-png
> 
> See https://gitlab.com/qemu-project/qemu/-/jobs/2374050341

Hmm, how do I test that?  My CI run didn't include the centos test case
for some reason: https://gitlab.com/kraxel/qemu/-/pipelines/522456078

thanks,
  Gerd


